Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumql-0001JM-Gs
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:20:55 +0100
Received: by eekd41 with SMTP id d41so2181062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/I/W5niPJ+Yt4z+vhY4BSawmf3WDxiwbuOMLnhBfzsM=;
	b=vIIMcOqoy/aF9dJTw0Ct2mio6p5vh3m6/U2spfW0/5FqvV7nNXYWW1O3vAbYKLh9oN
	xQ5fZ2uVmckijM1bhDvI0vv3BSZtfklhU8IPjzItp65aibIt7xYyXRL/Ad/GM1i2x3Q9
	W1VDNwyK+qhW3koL1lvQgHIetq9BCohsyX4LU=
Received: by 10.14.99.7 with SMTP id w7mr5741193eef.130.1328627573407;
	Tue, 07 Feb 2012 07:12:53 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:27 +0100
Message-Id: <1328627573-5217-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 01/27] systemd.bbclass: rework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 15:20:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

let systemd.bbclass do more for us and prepare support images without systemd

* introduce a global variable INIT_MANAGER. For images using systemd, this must
  contain 'systemd'. This varibale can e.g be set to default in local.conf and
  then overridden by distro.
* handle multiple entries in SYSTEMD_SERVICE. Currenly there are no use cases
  but networkmanager has potential requirements
* handle multiple entries in SYSTEMD_PACKAGES. Possible use cases are
  dhcp/dhcp-relay and ntp/ntpdate
* enhance the checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE. For package
  names only <name-of-an-existing-package>-systemd or ${PN} are allowed. In
  case of using ${PN} a warning is spitted. This was introduced to force recipe
  maintainers to separate out systemd to own package.
* all systemd packages are automatically created based on SYSTEMD_PACKAGES
* for systemd packets and their base packages RDEPENDS/RRECOMMENDS are
  automatically extended. Hereby it is ensured that all packets for proper
  systemd operation find their way into the image. Nice side effect:
  if in all tasks/images the base packets are include insted of *-systemd it is
  only a matter of INIT_MANAGER if systemd-packets are imaged.
* all *.socket and *.service files included by SRC_URI are automatically
  installed from WORKDIR.
* remove systemd from DEPENDS. Recipes requiring systemd at buildtime, should
  take care themselves.
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |  173 +++++++++++++++++++++++++++++++++-----
 1 files changed, 150 insertions(+), 23 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 094a12c..c843e66 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,5 +1,6 @@
-DEPENDS_append = " systemd systemd-systemctl-native"
+DEPENDS_append = " systemd-systemctl-native"
 
+# pre/post-inst/rm for each entry in SYSTEMD_SERVICE
 systemd_postinst() {
 OPTS=""
 
@@ -7,34 +8,95 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-systemctl $OPTS enable ${SYSTEMD_SERVICE}
+for service in ${SYSTEMD_SERVICE} ; do
+    systemctl $OPTS enable $service
+done
 
 if [ -z "$D" ]; then
-    systemctl start ${SYSTEMD_SERVICE}
+    for service in ${SYSTEMD_SERVICE} ; do
+        systemctl start $service
+    done
 fi
 }
 
 systemd_prerm() {
 if [ -z "$D" ]; then
-    systemctl stop ${SYSTEMD_SERVICE}
+    for service in ${SYSTEMD_SERVICE} ; do
+        systemctl stop $service
+    done
 fi
 }
 
 systemd_postrm() {
-systemctl disable ${SYSTEMD_SERVICE}
+for service in ${SYSTEMD_SERVICE} ; do
+    systemctl disable $service
+done
 }
 
 def systemd_after_parse(d):
-    if bb.data.getVar('SYSTEMD_PACKAGES', d) == None:
-        if bb.data.getVar('SYSTEMD_SERVICE', d) == None:
-            raise bb.build.FuncFailed, "%s inherits systemd but doesn't set SYSTEMD_SERVICE" % bb.data.getVar('FILE', d)
+	def systemd_check_vars():
+		# not for native / only at parse time
+		if d.getVar('BPN', 1) + "-native" != d.getVar('PN', 1) and d.getVar('BB_WORKERCONTEXT', True) is None:
+			bb_filename = d.getVar('FILE')
+			packages = d.getVar('PACKAGES', 1)
+
+			# check SYSTEMD_PACKAGES
+			systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
+			if systemd_pkgs == "":
+				raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
+			for pkg_systemd in systemd_pkgs.split():
+				if pkg_systemd.find("-systemd") == -1:
+					if pkg_systemd != d.getVar('PN', 1):
+						raise (bb.build.FuncFailed,
+							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <base-package-using-systemd>-systemd or ${PN} (deprecated)" %
+							(bb_filename, pkg_systemd))
+					else:
+						bb.warn("%s: it is recommended to set SYSTEMD_PACKAGES as <base-package-using-systemd>-systemd" % bb_filename)
+				else:
+					pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+					if pkg_systemd_base not in packages:
+						raise (bb.build.FuncFailed,
+							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <base-package-using-systemd>-systemd or ${PN} (deprecated)" %
+							( bb_filename, pkg_systemd))
+
+			# check SYSTEMD_SERVICE
+			for pkg_systemd in systemd_pkgs.split():
+				service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
+				systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
+				if systemd_services == "":
+					raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
+
+	# prepend packages not already included
+	def systemd_create_package(pkg_systemd):
+		packages = d.getVar('PACKAGES', 1)
+		if not pkg_systemd in packages:
+			packages = "%s %s" % (pkg_systemd, packages)
+			d.setVar('PACKAGES', packages)
+
+
+	systemd_check_vars()
+	systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1)
+	for pkg_systemd in systemd_pkgs.split():
+		systemd_create_package(pkg_systemd)
+
 
 python __anonymous() {
-    systemd_after_parse(d)
+	systemd_after_parse(d)
+}
+
+# automatically install all *.service and *.socket supplied in SRC_URI
+do_install_append() {
+    install -d ${D}${base_libdir}/systemd/system
+    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
+	# ensure installing systemd-files only (e.g not avahi *.service)
+	if grep -q '\[Unit\]' $service ; then
+	        install -m 644 $service ${D}${base_libdir}/systemd/system
+	fi
+    done
 }
 
 python populate_packages_prepend () {
-	def systemd_package(pkg):
+	def systemd_prepost_instrm(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
 		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
@@ -45,7 +107,7 @@ python populate_packages_prepend () {
 		systemd postinst is appended here because pkg_postinst may require to
 		execute on the target. Not doing so may cause systemd postinst invoked
 		twice to cause unwanted warnings.
-		""" 
+		"""
 		postinst = bb.data.getVar('pkg_postinst', localdata, 1)
 		if not postinst:
 			postinst = '#!/bin/sh\n'
@@ -58,23 +120,88 @@ python populate_packages_prepend () {
 		prerm += bb.data.getVar('systemd_prerm', localdata, 1)
 		bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
 
-	        postrm = bb.data.getVar('pkg_postrm', localdata, 1)
-	        if not postrm:
-	                postrm = '#!/bin/sh\n'
-                postrm += bb.data.getVar('systemd_postrm', localdata, 1)
+		postrm = bb.data.getVar('pkg_postrm', localdata, 1)
+		if not postrm:
+			postrm = '#!/bin/sh\n'
+		postrm += bb.data.getVar('systemd_postrm', localdata, 1)
 		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
 
 		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
 		rdepends.append("systemd")
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
+	"""	Setup rdepends / rrecommmends as:
+
+                  -----------------------------
+                  |  pkg_systemd_base:	'foo' |
+                  -----------------------------
+                             |    ^
+                             |    |                 --------------
+                 rrecommends |    | rdepends        | 'systemd'  |
+                             |    |               ->--------------
+                             V    |              / rdepends
+                  ------------------------------/
+                  | pkg_systemd: 'foo-systemd' |
+                  ------------------------------
+	"""
+	def systemd_rdepend_rrecommends(pkg_systemd):
+		pn_pkg = d.getVar('PN', 1)
+		# RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
+		rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg_systemd, 1) or "")
+		if not 'systemd' in rdepends:
+			rdepends.append('systemd')
+		pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+		# not rdepending myself / avoid double entries
+		if pkg_systemd != pn_pkg and not pkg_systemd_base in rdepends:
+			rdepends.append(pkg_systemd_base)
+		d.setVar('RDEPENDS_' + pkg_systemd, " " + " ".join(rdepends))
+		# default: just a suggestion - to be discussed?
+		initmanager = d.getVar('INIT_MANAGER', 1) or 'systemd'
+		# RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
+		if initmanager == 'systemd':
+			rrecommends = explode_deps(d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or "")
+			# not rrecommending myself / avoid double entries
+			if pkg_systemd != pn_pkg and not pkg_systemd in rrecommends:
+				rrecommends.append(pkg_systemd)
+				d.setVar('RRECOMMENDS_' + pkg_systemd_base, " " + " ".join(rrecommends))
+
+	# append systemd files to FILES_*-systemd
+	def systemd_files(pkg_systemd):
+		systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+		files_append = ""
+		if len(systemd_pkgs.split()) == 1:
+			# distribute complete ${base_libdir}/systemd/system/ to ${SYSTEMD_PACKAGES}
+			files_append = '${base_libdir}/systemd/system/'
+		else:
+			# distribute files set in SYSTEMD_SERVICE to ${SYSTEMD_PACKAGES}
+			for service in systemd_services.split():
+				files_append += " ${base_libdir}/systemd/system/" + service
+
+		var_name = "FILES_" + pkg_systemd
+		files = d.getVar(var_name, 0) or ""
+		d.setVar(var_name, "%s %s" % (files, files_append))
+
+
+	systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1)
+	for pkg_systemd in systemd_pkgs.split():
+		systemd_prepost_instrm(pkg_systemd)
+		systemd_rdepend_rrecommends(pkg_systemd)
+		systemd_files(pkg_systemd)
 
-	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
-	if pkgs == None:
-		pkgs = bb.data.getVar('PN', d, 1)
-		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
-		if not pkgs in packages and packages != []:
-			pkgs = packages[0]
-	for pkg in pkgs.split():
-		systemd_package(pkg)
+	# temporary debug output found in do_package.log
+	pn_pkg = d.getVar('PN', 1)
+	print 'base-package info:'
+	print 'DEPENDS: %s' % d.getVar('DEPENDS', 1)
+	print 'PACKAGES: %s' % d.getVar('PACKAGES', 1)
+	print 'RDEPENDS_%s: %s' % (pn_pkg, d.getVar('RDEPENDS_' + pn_pkg, 1))
+	print 'RRECOMMENDS_%s: %s' % (pn_pkg, d.getVar('RRECOMMENDS_' + pn_pkg, 1))
+	print 'systemd-(base-)-packages info:'
+	for pkg_systemd in systemd_pkgs.split():
+		pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+		print 'RDEPENDS_%s: %s' % (pkg_systemd_base, d.getVar('RDEPENDS_' + pkg_systemd_base, 1))
+		print 'RDEPENDS_%s: %s' % (pkg_systemd, d.getVar('RDEPENDS_' + pkg_systemd, 1))
+		print 'RRECOMMENDS_%s: %s' % (pkg_systemd_base, d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1))
+		print 'RRECOMMENDS_%s: %s' % (pkg_systemd, d.getVar('RRECOMMENDS_' + pkg_systemd, 1))
+		print 'FILES_%s: %s' % (pkg_systemd_base, d.getVar('FILES_' + pkg_systemd_base, 1))
+		print 'FILES_%s: %s' % (pkg_systemd, d.getVar('FILES_' + pkg_systemd, 1))
 }
-- 
1.7.6.4



