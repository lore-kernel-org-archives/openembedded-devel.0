Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1P9eQ5-0003HF-Pu
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 15:46:02 +0200
Received: by eya28 with SMTP id 28so964011eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=9JuGyg2qtJ0KqhTMgtX7yrKpy7jJOAaB8nI1xRB0mzA=;
	b=qi6Rjx6jpJ27Eic6oysZx/TOXV0+4fDAYAqR4frBhSSpEuJvfdqHUQExBsdM9PCSwo
	Wy3X6A3vvgPYjokqZFByjrzHU9ggX6J9w4LmMX8bnpfSFkyN75nXPdS2A7H/+yrqrVed
	AA/tqeusUtDZY4718wtO/v6C47jMysOAHn4Ig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mjKR/GAfnEp8T8UjBl1GVFG6cl5Fi+8R8syINrhmYJLyZCAfHruU0Ig8bs4X+aXS5W
	qcurpiJ1PevavgiBiKNOJwtSrjHaFhVO8XZ4hwEw++/DVqK2hRguHIm+PZ+4JJwDHonO
	yPoiB+899v+xP236Nvx03fx+JlRGBDaqqlJS8=
Received: by 10.213.28.193 with SMTP id n1mr4244235ebc.64.1287841521959;
	Sat, 23 Oct 2010 06:45:21 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b52sm4751569eei.19.2010.10.23.06.45.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 06:45:20 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Oct 2010 15:45:15 +0200
Message-Id: <1287841515-19825-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>
Subject: [RFC][PATCH] module bbclass: split each module into a kernel-module-<foo> subpackage and use PN as metapackage
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
X-List-Received-Date: Sat, 23 Oct 2010 13:46:02 -0000

From: Koen Kooi <k-kooi@ti.com>

Signed-off-by: Koen Kooi <k-kooi@ti.com>

---
 classes/module.bbclass |  191 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 186 insertions(+), 5 deletions(-)

diff --git a/classes/module.bbclass b/classes/module.bbclass
index e41dd6e..7d53d2d 100644
--- a/classes/module.bbclass
+++ b/classes/module.bbclass
@@ -24,19 +24,200 @@ module_do_install() {
 	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" ${MODULE_MAKE_FLAGS} modules_install
 }
 
-pkg_postinst_append () {
+python populate_packages_prepend () {
+	import os
+	def extract_modinfo(file):
+		import tempfile, re
+		tempfile.tempdir = bb.data.getVar("WORKDIR", d, 1)
+		tf = tempfile.mkstemp()
+		tmpfile = tf[1]
+		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "", file, tmpfile)
+		os.system(cmd)
+		f = open(tmpfile)
+		l = f.read().split("\000")
+		f.close()
+		os.close(tf[0])
+		os.unlink(tmpfile)
+		exp = re.compile("([^=]+)=(.*)")
+		vals = {}
+		for i in l:
+			m = exp.match(i)
+			if not m:
+				continue
+			vals[m.group(1)] = m.group(2)
+		return vals
+	
+	def parse_depmod():
+		import re
+
+		dvar = bb.data.getVar('PKGD', d, 1)
+		if not dvar:
+			bb.error("PKGD not defined")
+			return
+
+		kernelver = bb.data.getVar('KERNEL_VERSION', d, 1)
+		kerneldir = bb.data.getVar('STAGING_KERNEL_DIR', d, 1)
+		kernelver_stripped = kernelver
+		m = re.match('^(.*-hh.*)[\.\+].*$', kernelver)
+		if m:
+			kernelver_stripped = m.group(1)
+		path = bb.data.getVar("PATH", d, 1)
+		host_prefix = bb.data.getVar("HOST_PREFIX", d, 1) or ""
+		major_version = bb.data.getVar('KERNEL_MAJOR_VERSION', d, 1)
+
+		cmd = "PATH=\"%s\" %sdepmod-%s -n -a -r -b %s -F %s/System.map-%s %s" % (path, host_prefix, major_version, dvar, kerneldir, kernelver, kernelver_stripped)
+		f = os.popen(cmd, 'r')
+
+		deps = {}
+		pattern0 = "^(.*\.k?o):..*$"
+		pattern1 = "^(.*\.k?o):\s*(.*\.k?o)\s*$"
+		pattern2 = "^(.*\.k?o):\s*(.*\.k?o)\s*\\\$"
+		pattern3 = "^\t(.*\.k?o)\s*\\\$"
+		pattern4 = "^\t(.*\.k?o)\s*$"
+
+		line = f.readline()
+		while line:
+			if not re.match(pattern0, line):
+				line = f.readline()
+				continue
+			m1 = re.match(pattern1, line)
+			if m1:
+				deps[m1.group(1)] = m1.group(2).split()
+			else:
+				m2 = re.match(pattern2, line)
+				if m2:
+					deps[m2.group(1)] = m2.group(2).split()
+					line = f.readline()
+					m3 = re.match(pattern3, line)
+					while m3:
+						deps[m2.group(1)].extend(m3.group(1).split())
+						line = f.readline()
+						m3 = re.match(pattern3, line)
+					m4 = re.match(pattern4, line)
+					deps[m2.group(1)].extend(m4.group(1).split())
+			line = f.readline()
+		f.close()
+		return deps
+	
+	def get_dependencies(file, pattern, format):
+		file = file.replace(bb.data.getVar('PKGD', d, 1) or '', '', 1)
+
+		if module_deps.has_key(file):
+			import re
+			dependencies = []
+			for i in module_deps[file]:
+				m = re.match(pattern, os.path.basename(i))
+				if not m:
+					continue
+				on = legitimize_package_name(m.group(1))
+				dependency_pkg = format % on
+				dependencies.append(dependency_pkg)
+			return dependencies
+		return []
+
+	def frob_metadata(file, pkg, pattern, format, basename):
+		import re
+		vals = extract_modinfo(file)
+
+		dvar = bb.data.getVar('PKGD', d, 1)
+
+		# If autoloading is requested, output /etc/modutils/<name> and append
+		# appropriate modprobe commands to the postinst
+		autoload = bb.data.getVar('module_autoload_%s' % basename, d, 1)
+		if not autoload:
+		    # Also, try canonical name with dashes
+		    autoload = bb.data.getVar('module_autoload_%s' % basename.replace('_', '-'), d, 1)
+		if autoload:
+			name = '%s/etc/modutils/%s' % (dvar, basename)
+			f = open(name, 'w')
+			for m in autoload.split():
+				f.write('%s\n' % m)
+			f.close()
+			postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1)
+			if not postinst:
+				bb.fatal("pkg_postinst_%s not defined" % pkg)
+			postinst += bb.data.getVar('autoload_postinst_fragment', d, 1) % autoload
+			bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
+
+		# Write out any modconf fragment
+		modconf = bb.data.getVar('module_conf_%s' % basename, d, 1)
+		if modconf:
+			if bb.data.getVar("KERNEL_MAJOR_VERSION", d, 1) == "2.6":
+				name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
+			else:
+				name = '%s/etc/modutils/%s.conf' % (dvar, basename)
+			f = open(name, 'w')
+			f.write("%s\n" % modconf)
+			f.close()
+
+		files = bb.data.getVar('FILES_%s' % pkg, d, 1)
+		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename)
+		bb.data.setVar('FILES_%s' % pkg, files, d)
+
+		if vals.has_key("description"):
+			old_desc = bb.data.getVar('DESCRIPTION_' + pkg, d, 1) or ""
+			bb.data.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"], d)
+
+		rdepends_str = bb.data.getVar('RDEPENDS_' + pkg, d, 1)
+		if rdepends_str:
+			rdepends = rdepends_str.split()
+		else:
+			rdepends = []
+		rdepends.extend(get_dependencies(file, pattern, format))
+		bb.data.setVar('RDEPENDS_' + pkg, ' '.join(rdepends), d)
+
+	module_deps = parse_depmod()
+	module_regex = '^(.*)\.k?o$'
+	module_pattern = 'kernel-module-%s'
+
+	postinst = bb.data.getVar('pkg_postinst_modules', d, 1)
+	postrm = bb.data.getVar('pkg_postrm_modules', d, 1)
+
+        maybe_update_modules = "update-modules "
+        if bb.data.getVar("ONLINE_PACKAGE_MANAGEMENT", d) == "none":
+                maybe_update_modules = ""
+	
+	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%skernel-%s' % (maybe_update_modules, bb.data.getVar("KERNEL_VERSION", d, 1)))
+
+	import re
+	metapkg = bb.data.getVar("PN", d, 1)
+	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+	bb.data.setVar('FILES_' + metapkg, "", d)
+	blacklist = [ metapkg, metapkg + '-doc', metapkg + '-dev', metapkg + '-dbg', metapkg + '-locale', metapkg + '-static' ]
+	depchains = (d.getVar("DEPCHAIN_POST", True) or "").split()
+	for l in module_deps.values():
+		for i in l:
+			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
+			blacklist.append(pkg)
+	metapkg_rrecommends = []
+	packages = bb.data.getVar('PACKAGES', d, 1).split()
+	for pkg in packages[1:]:
+		if not pkg in blacklist and not pkg in metapkg_rrecommends and not any(pkg.endswith(post) for post in depchains):
+			metapkg_rrecommends.append(pkg)
+	bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rrecommends), d)
+	bb.data.setVar('DESCRIPTION_' + metapkg, metapkg + ' modules meta package', d)
+}
+
+pkg_postinst_modules () {
 if [ -n "$D" ]; then
-	exit 1
+	${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a ${KERNEL_VERSION}
 	update-modules || true
 fi
 }
 
-pkg_postrm_append () {
-	update-modules || true
+pkg_postrm_modules () {
+update-modules || true
+}
+
+autoload_postinst_fragment() {
+if [ x"$D" = "x" ]; then
+	modprobe %s || true
+fi
 }
 
 EXPORT_FUNCTIONS do_compile do_install
 
-FILES_${PN} = "/etc /lib/modules"
-- 
1.6.6.1



