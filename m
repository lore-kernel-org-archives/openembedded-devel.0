Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAyRU-000630-Bd
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 07:57:44 +0100
Received: by wgbdr12 with SMTP id dr12so1655903wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/wamOzPeEJXaNczp0Sp1WqB3J+ADfeww7exAgHSWGrs=;
	b=jEM6P/mWb38XpC59mOhReTlfEPiy+TLM5WYRA9lGqCFlLEpFY8yFUfOsMnyYyB17yG
	bFADLU7BAqjtWiCcACLHp+/101JMWQwoMP9Lj7D+FBhNpj5YSfuNxAQ2WZ683M1AX8DZ
	NkfoYj5b9J46+dZ6RdAbIOZcXqI+lWJNHv4HxWUeaUsHDsRbPtd4ZmTAw77X2/PcpyQS
	MMEdihSFziQwwGDvZ1n1pGESFgyuDtpWpkhZJkxyQ08PP2b61kuvMU5Ucbv2jc1w86TB
	7Mfz7awjgCMXlRztMbBcn45uV3IJhbnCu9YWeTiVJaCbxpy4+y9JIiApXof4uxVdIqi6
	PPsg==
Received: by 10.216.133.72 with SMTP id p50mr6478037wei.78.1332485328568;
	Thu, 22 Mar 2012 23:48:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm19113188wia.5.2012.03.22.23.48.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 23:48:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 07:48:41 +0100
Message-Id: <c49db2c3482e38a5a2671b147a0a8dbcbcb5baa4.1332485253.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332485253.git.Martin.Jansa@gmail.com>
References: <cover.1332485253.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] kernel.bbclass: import s/1/True/ changes from oe-core version
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
X-List-Received-Date: Fri, 23 Mar 2012 06:57:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   46 ++++++++++++++++++++--------------------
 1 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index e6f1bfa..c6fc197 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -11,9 +11,9 @@ INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', 1) or ''
+    kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
     if kerneltype == 'uImage':
-    	depends = d.getVar("DEPENDS", 1)
+    	depends = d.getVar("DEPENDS", True)
     	depends = "%s u-boot-mkimage-native" % depends
     	d.setVar("DEPENDS", depends)
 
@@ -80,7 +80,7 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', 1))}"
+KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -311,10 +311,10 @@ module_conf_rfcomm = "alias bt-proto-3 rfcomm"
 python populate_packages_prepend () {
 	def extract_modinfo(file):
 		import tempfile, re
-		tempfile.tempdir = d.getVar("WORKDIR", 1)
+		tempfile.tempdir = d.getVar("WORKDIR", True)
 		tf = tempfile.mkstemp()
 		tmpfile = tf[1]
-		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", 1), d.getVar("HOST_PREFIX", 1) or "", file, tmpfile)
+		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
 		os.system(cmd)
 		f = open(tmpfile)
 		l = f.read().split("\000")
@@ -333,18 +333,18 @@ python populate_packages_prepend () {
 	def parse_depmod():
 		import re
 
-		dvar = d.getVar('PKGD', 1)
+		dvar = d.getVar('PKGD', True)
 		if not dvar:
 			bb.error("PKGD not defined")
 			return
 
-		kernelver = d.getVar('KERNEL_VERSION', 1)
+		kernelver = d.getVar('KERNEL_VERSION', True)
 		kernelver_stripped = kernelver
 		m = re.match('^(.*-hh.*)[\.\+].*$', kernelver)
 		if m:
 			kernelver_stripped = m.group(1)
-		path = d.getVar("PATH", 1)
-		host_prefix = d.getVar("HOST_PREFIX", 1) or ""
+		path = d.getVar("PATH", True)
+		host_prefix = d.getVar("HOST_PREFIX", True) or ""
 
 		cmd = "PATH=\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
 		f = os.popen(cmd, 'r')
@@ -382,9 +382,9 @@ python populate_packages_prepend () {
 	
 	def get_dependencies(file, pattern, format):
                 # file no longer includes PKGD
-		file = file.replace(d.getVar('PKGD', 1) or '', '', 1)
+		file = file.replace(d.getVar('PKGD', True) or '', '', 1)
                 # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-                file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', 1) or '', '', 1)
+                file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
 
 		if module_deps.has_key(file):
 			import re
@@ -403,40 +403,40 @@ python populate_packages_prepend () {
 		import re
 		vals = extract_modinfo(file)
 
-		dvar = d.getVar('PKGD', 1)
+		dvar = d.getVar('PKGD', True)
 
 		# If autoloading is requested, output /etc/modutils/<name> and append
 		# appropriate modprobe commands to the postinst
-		autoload = d.getVar('module_autoload_%s' % basename, 1)
+		autoload = d.getVar('module_autoload_%s' % basename, True)
 		if autoload:
 			name = '%s/etc/modutils/%s' % (dvar, basename)
 			f = open(name, 'w')
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
-			postinst = d.getVar('pkg_postinst_%s' % pkg, 1)
+			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
-			postinst += d.getVar('autoload_postinst_fragment', 1) % autoload
+			postinst += d.getVar('autoload_postinst_fragment', True) % autoload
 			d.setVar('pkg_postinst_%s' % pkg, postinst)
 
 		# Write out any modconf fragment
-		modconf = d.getVar('module_conf_%s' % basename, 1)
+		modconf = d.getVar('module_conf_%s' % basename, True)
 		if modconf:
 			name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
 			f = open(name, 'w')
 			f.write("%s\n" % modconf)
 			f.close()
 
-		files = d.getVar('FILES_%s' % pkg, 1)
+		files = d.getVar('FILES_%s' % pkg, True)
 		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename)
 		d.setVar('FILES_%s' % pkg, files)
 
 		if vals.has_key("description"):
-			old_desc = d.getVar('DESCRIPTION_' + pkg, 1) or ""
+			old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
 			d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
 
-		rdepends_str = d.getVar('RDEPENDS_' + pkg, 1)
+		rdepends_str = d.getVar('RDEPENDS_' + pkg, True)
 		if rdepends_str:
 			rdepends = rdepends_str.split()
 		else:
@@ -448,12 +448,12 @@ python populate_packages_prepend () {
 	module_regex = '^(.*)\.k?o$'
 	module_pattern = 'kernel-module-%s'
 
-	postinst = d.getVar('pkg_postinst_modules', 1)
-	postrm = d.getVar('pkg_postrm_modules', 1)
+	postinst = d.getVar('pkg_postinst_modules', True)
+	postrm = d.getVar('pkg_postrm_modules', True)
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", 1))
+	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
 
 	import re
 	metapkg = "kernel-modules"
@@ -465,7 +465,7 @@ python populate_packages_prepend () {
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
 			blacklist.append(pkg)
 	metapkg_rdepends = []
-	packages = d.getVar('PACKAGES', 1).split()
+	packages = d.getVar('PACKAGES', True).split()
 	for pkg in packages[1:]:
 		if not pkg in blacklist and not pkg in metapkg_rdepends:
 			metapkg_rdepends.append(pkg)
-- 
1.7.8.5



