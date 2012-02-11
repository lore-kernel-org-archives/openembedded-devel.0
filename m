Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw2L7-0002GZ-Nt
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 03:05:30 +0100
Received: by eekd41 with SMTP id d41so937534eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=agzr80+ZyYuo7jEV0iaqQvi+I0KIuEy1i/C3eC0DQT8=;
	b=QGXUC8FdXVWP+3o9HI5Ftv2vC7fQLZsaoxEW6cZZOfoKroxAILsF4yLrdUAo/YvtHE
	P2rkB6grxNhco9nG/Egh3PNHfc52vu+2h63cdRxCxBMujhjvMsZbCcmahtPROJw9+AqP
	QRWHFbzAVDB6P2McUnRToTGNvFED891RhC5W8=
Received: by 10.213.114.135 with SMTP id e7mr698709ebq.135.1328925434405;
	Fri, 10 Feb 2012 17:57:14 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id n17sm29065006eei.3.2012.02.10.17.57.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:57:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 02:59:58 +0100
Message-Id: <1328925603-2967-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/7] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Sat, 11 Feb 2012 02:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

after recipe parsing the following plausibilities are checked:
* ERROR if empty SYSTEMD_PACKAGES
* ERROR if SYSTEMD_PACKAGES entry does not contain '-systemd' AND
  package_name != ${PN}
* ERROR if SYSTEMD_PACKAGES entry contains '-systemd' but entry without
  '-systemd' (base pkg) does not exist
* WARNING if SYSTEMD_PACKAGES containing ${PN} to force package maintainers to
  split out systemd-specific files into *-systemd
* error if SYSTEMD_SERVICE(_<systemd-package>) is empty for one or more entries
  in SYSTEMD_PACKAGES

The code in populate_packages_prepend to set SYSTEMD_PACKAGES to ${PN} as
default was removed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   43 +++++++++++++++++++++++++++++++-------
 1 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 094a12c..bc83908 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -25,9 +25,41 @@ systemctl disable ${SYSTEMD_SERVICE}
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
+						raise bb.build.FuncFailed, \
+							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+							(bb_filename, pkg_systemd)
+					else:
+						bb.warn("%s: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd" % bb_filename)
+				else:
+					pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+					if pkg_systemd_base not in packages:
+						raise bb.build.FuncFailed, \
+							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+							( bb_filename, pkg_systemd)
+
+			# check SYSTEMD_SERVICE
+			for pkg_systemd in systemd_pkgs.split():
+				service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
+				systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
+				if systemd_services == "":
+					raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
+
+
+	systemd_check_vars()
+
 
 python __anonymous() {
     systemd_after_parse(d)
@@ -70,11 +102,6 @@ python populate_packages_prepend () {
 
 
 	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
-	if pkgs == None:
-		pkgs = bb.data.getVar('PN', d, 1)
-		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
-		if not pkgs in packages and packages != []:
-			pkgs = packages[0]
 	for pkg in pkgs.split():
 		systemd_package(pkg)
 }
-- 
1.7.4.4



