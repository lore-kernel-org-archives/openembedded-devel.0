Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IR4iS-0003P9-41
	for openembedded-devel@openembedded.org; Fri, 31 Aug 2007 13:31:08 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7VBT31R020586 for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2007 13:29:03 +0200
Message-ID: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
Date: Fri, 31 Aug 2007 13:29:45 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [RFC][PATCH] Merging classes with poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2007 11:31:08 -0000
Content-Type: multipart/mixed; boundary="------------080602070604030703000103"

--------------080602070604030703000103
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

After spending some time playing with meld I have some patches to RFC.

The most important ones are teh package* and rootfs* that have fixes for multithreaded
bitbake.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG1/uoMkyGM64RGpERAjc9AKC37nbQ5swmKoWJDKu24zNOUAB/nACfV+yq
i64UCIIQqztuU7NshZ5y+VM=
=U2CP
-----END PGP SIGNATURE-----
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/base.bbclass"
#  from [0b7bd90cd81cad21be3a5562472533d725e69760]
#    to [e9e18b1810f9cae7274bc8d18014c2ef9f972911]
#
============================================================
--- classes/base.bbclass	0b7bd90cd81cad21be3a5562472533d725e69760
+++ classes/base.bbclass	e9e18b1810f9cae7274bc8d18014c2ef9f972911
@@ -374,6 +374,18 @@ oe_machinstall() {
 	fi
 }
 
+addtask showdata
+do_showdata[nostamp] = "1"
+python do_showdata() {
+	import sys
+	# emit variables and shell functions
+	bb.data.emit_env(sys.__stdout__, d, True)
+	# emit the metadata which isnt valid shell
+	for e in d.keys():
+	    if bb.data.getVarFlag(e, 'python', d):
+	        sys.__stdout__.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
+}
+
 addtask listtasks
 do_listtasks[nostamp] = "1"
 python do_listtasks() {
@@ -681,7 +693,8 @@ do_populate_staging[dirs] = "${STAGING_D
 			     ${STAGING_DATADIR} \
 			     ${S} ${B}"
 
-addtask populate_staging after do_package_write
+# Could be compile but populate_staging and do_install shouldn't run at the same time
+addtask populate_staging after do_install
 
 python do_populate_staging () {
 	bb.build.exec_func('do_stage', d)
@@ -750,23 +763,23 @@ def has_subpkgdata(pkg, d):
 
 def has_subpkgdata(pkg, d):
 	import bb, os
-	fn = bb.data.expand('${STAGING_DIR}/pkgdata/runtime/%s' % pkg, d)
+	fn = bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)
 	return os.access(fn, os.R_OK)
 
 def read_subpkgdata(pkg, d):
 	import bb, os
-	fn = bb.data.expand('${STAGING_DIR}/pkgdata/runtime/%s' % pkg, d)
+	fn = bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)
 	return read_pkgdatafile(fn)
 
 
 def has_pkgdata(pn, d):
 	import bb, os
-	fn = bb.data.expand('${STAGING_DIR}/pkgdata/%s' % pn, d)
+	fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
 	return os.access(fn, os.R_OK)
 
 def read_pkgdata(pn, d):
 	import bb, os
-	fn = bb.data.expand('${STAGING_DIR}/pkgdata/%s' % pn, d)
+	fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
 	return read_pkgdatafile(fn)
 
 python read_subpackage_metadata () {
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/gconf.bbclass"
#  from [d98469aa5a9446e5a981ad1f9b78e89da73f169a]
#    to [00c717a1c6fddfd809635163d24114284f015ddd]
#
============================================================
--- classes/gconf.bbclass	d98469aa5a9446e5a981ad1f9b78e89da73f169a
+++ classes/gconf.bbclass	00c717a1c6fddfd809635163d24114284f015ddd
@@ -1,4 +1,4 @@
-DEPENDS += "gconf gconf-native"
+DEPENDS += "gconf"
 
 gconf_postinst() {
 if [ "$1" = configure ]; then
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/image.bbclass"
#  from [9ce7e97fa49142c8e94930461f94af3ec3c18110]
#    to [fb8d641b8c9c01abd103203ba2582f6e628f2f0e]
#
============================================================
--- classes/image.bbclass	9ce7e97fa49142c8e94930461f94af3ec3c18110
+++ classes/image.bbclass	fb8d641b8c9c01abd103203ba2582f6e628f2f0e
@@ -1,7 +1,12 @@ inherit rootfs_${IMAGE_PKGTYPE}
 inherit rootfs_${IMAGE_PKGTYPE}
 
+LICENSE = "MIT"
 PACKAGES = ""
+RDEPENDS = "${IMAGE_INSTALL}"
 
+export IMAGE_BASENAME = "${PN}"
+export PACKAGE_INSTALL = "${IMAGE_INSTALL}"
+
 # We need to recursively follow RDEPENDS and RRECOMMENDS for images
 do_rootfs[recrdeptask] = "do_package_write do_deploy do_populate_staging"
 
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/module.bbclass"
#  from [b4a2435539a6183bfff6b02bc73785bbceeadef6]
#    to [04ebb27c817750a39f3c15612ebc60e9fad68bc8]
#
============================================================
--- classes/module.bbclass	b4a2435539a6183bfff6b02bc73785bbceeadef6
+++ classes/module.bbclass	04ebb27c817750a39f3c15612ebc60e9fad68bc8
@@ -1,4 +1,4 @@
-RDEPENDS += "kernel (${KERNEL_VERSION})"
+RDEPENDS += "kernel (${KERNEL_VERSION}) update-modules"
 DEPENDS += "virtual/kernel"
 
 inherit module-base
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/native.bbclass"
#  from [9790e613a5cd8ec531d788c5dd2d9642523821ca]
#    to [578b1034229c88ceae52895d2f27b43cf710e0a1]
#
============================================================
--- classes/native.bbclass	9790e613a5cd8ec531d788c5dd2d9642523821ca
+++ classes/native.bbclass	578b1034229c88ceae52895d2f27b43cf710e0a1
@@ -95,3 +95,4 @@ do_install () {
 do_install () {
 	true
 }
+PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/openmoko2.bbclass"
#  from [aeee18267ff406fd5434a5b0cfc049c370d20948]
#    to [29f242d782fea5f73f4bdfee2121a66a5c13c4b9]
#
============================================================
--- classes/openmoko2.bbclass	aeee18267ff406fd5434a5b0cfc049c370d20948
+++ classes/openmoko2.bbclass	29f242d782fea5f73f4bdfee2121a66a5c13c4b9
@@ -29,5 +29,5 @@ FILES_${PN} += "${datadir}/icons"
 
 FILES_${PN} += "${datadir}/icons"
 
+SVNREV = "r${SRCREV}"
+#SVNREV = "${SRCDATE}"
-# SVNREV = "r${SRCREV}"
-SVNREV = "${SRCDATE}"
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/package_deb.bbclass"
#  from [e921fa8625c039aae270b843336c64fbd0a5dbf2]
#    to [5b8e9230ef7a807084e2a9411f0ffe1055eb1e11]
#
============================================================
--- classes/package_deb.bbclass	e921fa8625c039aae270b843336c64fbd0a5dbf2
+++ classes/package_deb.bbclass	5b8e9230ef7a807084e2a9411f0ffe1055eb1e11
@@ -1,14 +1,11 @@ inherit package
 #
 # Copyright 2006-2007 OpenedHand Ltd.
 #
 
 inherit package
 
-PACKAGE_EXTRA_DEPENDS += "dpkg-native fakeroot-native"
-
 BOOTSTRAP_EXTRA_RDEPENDS += "dpkg"
 DISTRO_EXTRA_RDEPENDS += "dpkg"
-PACKAGE_WRITE_FUNCS += "do_package_deb"
 IMAGE_PKGTYPE ?= "deb"
 
 python package_deb_fn () {
@@ -64,9 +61,7 @@ python do_package_deb () {
 }
 
 python do_package_deb () {
-    import copy # to back up env data
-    import sys
-    import re
+    import sys, re, fcntl, copy
 
     workdir = bb.data.getVar('WORKDIR', d, 1)
     if not workdir:
@@ -99,9 +94,19 @@ python do_package_deb () {
         bb.debug(1, "No packages; nothing to do")
         return
 
+    def lockfile(name):
+        lf = open(name, "a+")
+        fcntl.flock(lf.fileno(), fcntl.LOCK_EX)
+        return lf
+
+    def unlockfile(lf):
+        fcntl.flock(lf.fileno(), fcntl.LOCK_UN)
+        lf.close
+
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
         root = "%s/install/%s" % (workdir, pkg)
+        lf = lockfile(root + ".lock")
 
         bb.data.setVar('ROOT', '', localdata)
         bb.data.setVar('ROOT_%s' % pkg, root, localdata)
@@ -247,4 +252,18 @@ python do_package_deb () {
         except OSError:
             pass
         del localdata
+        unlockfile(lf)
 }
+python () {
+    import bb
+    if bb.data.getVar('PACKAGES', d, True) != '':
+        bb.data.setVarFlag('do_package_write_deb', 'depends', 'dpkg-native:do_populate_staging fakeroot-native:do_populate_staging', d)
+}
+
+python do_package_write_deb () {
+	bb.build.exec_func("read_subpackage_metadata", d)
+	bb.build.exec_func("do_package_deb", d)
+}
+do_package_write_deb[dirs] = "${D}"
+addtask package_write_deb before do_package_write after do_package
+
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/package_ipk.bbclass"
#  from [115710babe1d2cc095e515f58f4593c548e5b72b]
#    to [599dfbe50df05dd3f0d367c3a39250fb353c2e25]
#
============================================================
--- classes/package_ipk.bbclass	115710babe1d2cc095e515f58f4593c548e5b72b
+++ classes/package_ipk.bbclass	599dfbe50df05dd3f0d367c3a39250fb353c2e25
@@ -1,9 +1,7 @@ inherit package
 inherit package
 
-PACKAGE_EXTRA_DEPENDS += "ipkg-utils-native fakeroot-native"
-
-BOOTSTRAP_EXTRA_RDEPENDS += "ipkg-collateral ipkg"
-PACKAGE_WRITE_FUNCS += "do_package_ipk"
+BOOTSTRAP_EXTRA_RDEPENDS += "ipkg-collateral ipkg ipkg-link"
+DISTRO_EXTRA_RDEPENDS += "ipkg-collateral ipkg ipkg-link"
 IMAGE_PKGTYPE ?= "ipk"
 
 python package_ipk_fn () {
@@ -53,7 +51,7 @@ python package_ipk_install () {
 		ret = os.system('ipkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir))
 		if (ret != 0 ):
 			raise bb.build.FuncFailed
-		f=open(os.path.join(tmpdir, "stamps" ,"do_packages"),"w")
+		f=open(os.path.join(tmpdir, "stamps", "do_packages"),"w")
 		f.close()
 
 	ret = os.system('ipkg-cl  -o %s -f %s update' % (rootfs, conffile))
@@ -63,9 +61,7 @@ python do_package_ipk () {
 }
 
 python do_package_ipk () {
-	import copy # to back up env data
-	import sys
-	import re
+	import sys, re, fcntl, copy
 
 	workdir = bb.data.getVar('WORKDIR', d, 1)
 	if not workdir:
@@ -96,15 +92,24 @@ python do_package_ipk () {
 	tmpdir = bb.data.getVar('TMPDIR', d, 1)
 	# Invalidate the packages file
 	if os.access(os.path.join(tmpdir, "stamps", "do_packages"),os.R_OK):
-		os.unlink(os.path.join(tmpdir, "stamps" ,"do_packages"))
+		os.unlink(os.path.join(tmpdir, "stamps", "do_packages"))
 
 	if packages == []:
 		bb.debug(1, "No packages; nothing to do")
 		return
+	def lockfile(name):
+		lf = open(name, "a+")
+		fcntl.flock(lf.fileno(), fcntl.LOCK_EX)
+		return lf
 
+	def unlockfile(lf):
+		fcntl.flock(lf.fileno(), fcntl.LOCK_UN)
+		lf.close
+
 	for pkg in packages.split():
 		localdata = bb.data.createCopy(d)
 		root = "%s/install/%s" % (workdir, pkg)
+	        lf = lockfile(root + ".lock")
 
 		bb.data.setVar('ROOT', '', localdata)
 		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
@@ -131,9 +136,10 @@ python do_package_ipk () {
 			del g[g.index('./CONTROL')]
 		except ValueError:
 			pass
-		if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
+		if not g and not bb.data.getVar('ALLOW_EMPTY', localdata):
 			from bb import note
 			note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			unlockfile(lf)
 			continue
 
 		controldir = os.path.join(root, 'CONTROL')
@@ -154,7 +160,7 @@ python do_package_ipk () {
 		fields.append(["Priority: %s\n", ['PRIORITY']])
 		fields.append(["Maintainer: %s\n", ['MAINTAINER']])
 		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
-		fields.append(["OE: %s\n", ['P']])
+		fields.append(["OE: %s\n", ['PN']])
 		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
 
 		def pullData(l, d):
@@ -231,8 +237,6 @@ python do_package_ipk () {
 		if ret != 0:
 			raise bb.build.FuncFailed("ipkg-build execution failed")
 
-		file(bb.data.expand('${STAGING_DIR}/pkgdata/runtime/%s.packaged' % pkg, d), 'w').close()
-
 		for script in ["preinst", "postinst", "prerm", "postrm", "control" ]:
 			scriptfile = os.path.join(controldir, script)
 			try:
@@ -244,4 +248,17 @@ python do_package_ipk () {
 		except OSError:
 			pass
 		del localdata
+		unlockfile(lf)
 }
+python () {
+    import bb
+    if bb.data.getVar('PACKAGES', d, True) != '':
+        bb.data.setVarFlag('do_package_write_ipk', 'depends', 'ipkg-utils-native:do_populate_staging fakeroot-native:do_populate_staging', d)
+}
+
+python do_package_write_ipk () {
+	bb.build.exec_func("read_subpackage_metadata", d)
+	bb.build.exec_func("do_package_ipk", d)
+}
+do_package_write_ipk[dirs] = "${D}"
+addtask package_write_ipk before do_package_write after do_package
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/package_rpm.bbclass"
#  from [555193edec7219ac867536609f6970425ff4522b]
#    to [369f9514d832d69ab6cf22182add29eecda7e30e]
#
============================================================
--- classes/package_rpm.bbclass	555193edec7219ac867536609f6970425ff4522b
+++ classes/package_rpm.bbclass	369f9514d832d69ab6cf22182add29eecda7e30e
@@ -132,3 +132,16 @@ python do_package_rpm () {
 		bb.build.exec_func('write_specfile', localdata)
 		del localdata
 }
+python () {
+    import bb
+    if bb.data.getVar('PACKAGES', d, True) != '':
+        bb.data.setVarFlag('do_package_write_rpm', 'depends', 'rpm-native:do_populate_staging', d)
+}
+
+
+python do_package_write_rpm () {
+	bb.build.exec_func("read_subpackage_metadata", d)
+	bb.build.exec_func("do_package_rpm", d)
+}
+do_package_write_rpm[dirs] = "${D}"
+addtask package_write_rpm before do_build after do_package
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/package_tar.bbclass"
#  from [fcd7bc894001e323cb9cf5f5d1f547447e7b636e]
#    to [eb867b40ce219ed11aeea48e6df36613f2509560]
#
============================================================
--- classes/package_tar.bbclass	fcd7bc894001e323cb9cf5f5d1f547447e7b636e
+++ classes/package_tar.bbclass	eb867b40ce219ed11aeea48e6df36613f2509560
@@ -1,8 +1,5 @@ inherit package
 inherit package
 
-PACKAGE_EXTRA_DEPENDS += "tar-native"
-
-PACKAGE_WRITE_FUNCS += "do_package_tar"
 IMAGE_PKGTYPE ?= "tar"
 
 python package_tar_fn () {
@@ -103,3 +100,16 @@ python do_package_tar () {
 # end stuff
 		del localdata
 }
+python () {
+    import bb
+    if bb.data.getVar('PACKAGES', d, True) != '':
+        bb.data.setVarFlag('do_package_write_tar', 'depends', 'tar-native:do_populate_staging', d)
+}
+
+
+python do_package_write_tar () {
+	bb.build.exec_func("read_subpackage_metadata", d)
+	bb.build.exec_func("do_package_tar", d)
+}
+do_package_write_tar[dirs] = "${D}"
+addtask package_write_tar before do_build after do_package
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/package.bbclass"
#  from [a4793b3e861b8e79ae72fd8fb897b01aff983b38]
#    to [6d38d123e9ab2e3f1235b253086a38e70abf8518]
#
============================================================
--- classes/package.bbclass	a4793b3e861b8e79ae72fd8fb897b01aff983b38
+++ classes/package.bbclass	6d38d123e9ab2e3f1235b253086a38e70abf8518
@@ -120,76 +120,68 @@ python () {
 
 python () {
     import bb
-
     if bb.data.getVar('PACKAGES', d, True) != '':
         deps = bb.data.getVarFlag('do_package', 'depends', d) or ""
         for dep in (bb.data.getVar('PACKAGE_DEPENDS', d, True) or "").split():
             deps += " %s:do_populate_staging" % dep
         bb.data.setVarFlag('do_package', 'depends', deps, d)
 
-        deps = bb.data.getVarFlag('do_package_write', 'depends', d) or ""
-        for dep in (bb.data.getVar('PACKAGE_EXTRA_DEPENDS', d, True) or "").split():
-            deps += " %s:do_populate_staging" % dep
-        bb.data.setVarFlag('do_package_write', 'depends', deps, d)
-	
         # shlibs requires any DEPENDS to have already packaged for the *.list files
         bb.data.setVarFlag('do_package', 'deptask', 'do_package', d)
 }
 
-# file(1) output to match to consider a file an unstripped executable
-FILE_UNSTRIPPED_MATCH ?= "not stripped"
-#FIXME: this should be "" when any errors are gone!
-IGNORE_STRIP_ERRORS ?= "1"
 
-runstrip() {
-	# Function to strip a single file, called from RUNSTRIP in populate_packages below
-	# A working 'file' (one which works on the target architecture)
-	# is necessary for this stuff to work, hence the addition to do_package[depends]
+def runstrip(file, d):
+    # Function to strip a single file, called from populate_packages below
+    # A working 'file' (one which works on the target architecture)
+    # is necessary for this stuff to work, hence the addition to do_package[depends]
 
-	local ro st
+    import bb, os, commands, stat
 
-	st=0
-	if {	file "$1" || {
-			oewarn "file $1: failed (forced strip)" >&2
-			echo '${FILE_UNSTRIPPED_MATCH}'
-		}
-	   } | grep -q '${FILE_UNSTRIPPED_MATCH}'
-	then
-		oenote "${STRIP} $1"
-		ro=
-		test -w "$1" || {
-			ro=1
-			chmod +w "$1"
-		}
-		mkdir -p $(dirname "$1")/.debug
-		debugfile="$(dirname "$1")/.debug/$(basename "$1")"
-		'${OBJCOPY}' --only-keep-debug "$1" "$debugfile"
-		'${STRIP}' "$1"
-		st=$?
-		'${OBJCOPY}' --add-gnu-debuglink="$debugfile" "$1"
-		test -n "$ro" && chmod -w "$1"
-		if test $st -ne 0
-		then
-			oewarn "runstrip: ${STRIP} $1: strip failed" >&2
-			if [ x${IGNORE_STRIP_ERRORS} = x1 ]
-			then
-				#FIXME: remove this, it's for error detection
-				if file "$1" 2>/dev/null >&2
-				then
-					(oefatal "${STRIP} $1: command failed" >/dev/tty)
-				else
-					(oefatal "file $1: command failed" >/dev/tty)
-				fi
-				st=0
-			fi
-		fi
-	else
-		oenote "runstrip: skip $1"
-	fi
-	return $st
-}
+    pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, 1)
 
+    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
 
+    if ret:
+        bb.error("runstrip: 'file %s' failed (forced strip)" % file)
+
+    if "not stripped" not in result:
+        bb.debug(1, "runstrip: skip %s" % file)
+        return 0
+
+    strip = bb.data.getVar("STRIP", d, 1)
+    objcopy = bb.data.getVar("OBJCOPY", d, 1)
+
+    newmode = None
+    if not os.access(file, os.W_OK):
+        origmode = os.stat(file)[stat.ST_MODE]
+        newmode = origmode | stat.S_IWRITE
+        os.chmod(file, newmode)
+
+    extraflags = ""
+    if ".so" in file and "shared" in result:
+        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+    elif "shared" in result or "executable" in result:
+        extraflags = "--remove-section=.comment --remove-section=.note"
+
+    bb.mkdirhier(os.path.join(os.path.dirname(file), ".debug"))
+    debugfile=os.path.join(os.path.dirname(file), ".debug", os.path.basename(file))
+
+    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
+    bb.debug(1, "runstrip: %s" % stripcmd)
+
+    os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
+    ret = os.system("%s%s" % (pathprefix, stripcmd))
+    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
+
+    if newmode:
+        os.chmod(file, origmode)
+
+    if ret:
+        bb.error("runstrip: '%s' strip command failed" % stripcmd)
+
+    return 1
+
 #
 # Package data handling routines
 #
@@ -376,19 +368,11 @@ python populate_packages () {
 			package_list.append(pkg)
 
 	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, 1) != '1'):
-		stripfunc = ""
 		for root, dirs, files in os.walk(dvar):
 			for f in files:
 				file = os.path.join(root, f)
 				if not os.path.islink(file) and not os.path.isdir(file) and isexec(file):
-					stripfunc += "\trunstrip %s || st=1\n" % (file)
-		if not stripfunc == "":
-			from bb import build
-			localdata = bb.data.createCopy(d)
-			# strip
-			bb.data.setVar('RUNSTRIP', '\tlocal st\n\tst=0\n%s\treturn $st' % stripfunc, localdata)
-			bb.data.setVarFlag('RUNSTRIP', 'func', 1, localdata)
-			bb.build.exec_func('RUNSTRIP', localdata)
+					runstrip(file, d)
 
 	for pkg in package_list:
 		localdata = bb.data.createCopy(d)
@@ -513,13 +497,13 @@ python emit_pkgdata() {
 	if not packages:
 		return
 
-	data_file = bb.data.expand("${STAGING_DIR}/pkgdata/${PN}", d)
+	data_file = bb.data.expand("${PKGDATA_DIR}/${PN}", d)
 	f = open(data_file, 'w')
 	f.write("PACKAGES: %s\n" % packages)
 	f.close()
 
 	for pkg in packages.split():
-		subdata_file = bb.data.expand("${STAGING_DIR}/pkgdata/runtime/%s" % pkg, d)
+		subdata_file = bb.data.expand("${PKGDATA_DIR}/runtime/%s" % pkg, d)
 		sf = open(subdata_file, 'w')
 		write_if_exists(sf, pkg, 'DESCRIPTION')
 		write_if_exists(sf, pkg, 'RDEPENDS')
@@ -538,7 +522,7 @@ python emit_pkgdata() {
 		write_if_exists(sf, pkg, 'pkg_prerm')
 		sf.close()
 }
-emit_pkgdata[dirs] = "${STAGING_DIR}/pkgdata/runtime"
+emit_pkgdata[dirs] = "${PKGDATA_DIR}/runtime"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
@@ -840,7 +824,7 @@ python package_depchains() {
 
 	def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
 		def packaged(pkg, d):
-			return os.access(bb.data.expand('${STAGING_DIR}/pkgdata/runtime/%s.packaged' % pkg, d), os.R_OK)
+			return os.access(bb.data.expand('${PKGDATA_DIR}/runtime/%s.packaged' % pkg, d), os.R_OK)
 
                 #bb.note('rdepends for %s is %s' % (base, rdepends))
 
@@ -916,21 +900,14 @@ addtask package before do_build after do
 do_package[dirs] = "${D}"
 addtask package before do_build after do_install
 
-
-
-PACKAGE_WRITE_FUNCS ?= "read_subpackage_metadata"
-
-python package_do_package_write () {
-	for f in (bb.data.getVar('PACKAGE_WRITE_FUNCS', d, 1) or '').split():
-		bb.build.exec_func(f, d)
+# Dummy task to mark when all packaging is complete
+do_package_write () {
+	:
 }
-do_package_write[dirs] = "${D}"
 addtask package_write before do_build after do_package
 
-
 EXPORT_FUNCTIONS do_package do_package_write
 
-
 #
 # Helper functions for the package writing classes
 #
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/rootfs_deb.bbclass"
#  from [707eb78db91916253acef44e2f1a8ff049193cff]
#    to [35e50a54b60fe0c1137ebc2a4bc1f6aa4fab25de]
#
============================================================
--- classes/rootfs_deb.bbclass	707eb78db91916253acef44e2f1a8ff049193cff
+++ classes/rootfs_deb.bbclass	35e50a54b60fe0c1137ebc2a4bc1f6aa4fab25de
@@ -1,12 +1,14 @@ do_rootfs[depends] += "dpkg-native:do_po
 #
 # Copyright 2006-2007 Openedhand Ltd.
 #
 
 do_rootfs[depends] += "dpkg-native:do_populate_staging apt-native:do_populate_staging"
+do_rootfs[recrdeptask] += "do_package_write_deb"
 
 fakeroot rootfs_deb_do_rootfs () {
 	set +e
-	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/{info,updates}
+	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/info
+	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/updates
 
 	rm -f ${STAGING_DIR}/etc/apt/sources.list.rev
 	rm -f ${STAGING_DIR}/etc/apt/preferences
@@ -72,7 +74,7 @@ fakeroot rootfs_deb_do_rootfs () {
 	if [ ! -z "${PACKAGE_INSTALL}" ]; then
 		for i in ${PACKAGE_INSTALL}; do
 			apt-get install $i --force-yes --allow-unauthenticated
-			if [ $? -eq 1 ]; then
+			if [ $? -ne 0 ]; then
 				exit 1
 			fi
 			find ${IMAGE_ROOTFS} -name \*.dpkg-new | for i in `cat`; do
@@ -132,7 +134,7 @@ rootfs_deb_log_check() {
 			echo -e "log_check: Matched keyword: [$keyword_die]\n"
 			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
 			echo ""
-			do_exit=1				
+			do_exit=1
 		fi
 	done
 	test "$do_exit" = 1 && exit 1						
#
# old_revision [a713e30a7c1eae8ab3bf00e2e3eb7f9a6ffb1e3b]
#
# patch "classes/rootfs_ipk.bbclass"
#  from [237808776045be08b7c6b05f62ed82bb94daada8]
#    to [cab8c8c2c016a3542ca004b0f2756f8db983d36b]
#
============================================================
--- classes/rootfs_ipk.bbclass	237808776045be08b7c6b05f62ed82bb94daada8
+++ classes/rootfs_ipk.bbclass	cab8c8c2c016a3542ca004b0f2756f8db983d36b
@@ -6,6 +6,7 @@ do_rootfs[depends] += "ipkg-native:do_po
 #
 
 do_rootfs[depends] += "ipkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"
+do_rootfs[recrdeptask] += "do_package_write_ipk"
 
 IPKG_ARGS = "-f ${T}/ipkg.conf -o ${IMAGE_ROOTFS} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
 
@@ -104,7 +105,7 @@ rootfs_ipk_log_check() {
 		then
 			echo "log_check: There were error messages in the logfile"
 			echo -e "log_check: Matched keyword: [$keyword_die]\n"
-			echo "$lf_txt" | grep -v log_check | grep -i "$keyword_die" -C1
+			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
 			echo ""
 			do_exit=1				
 		fi
@@ -112,3 +113,6 @@ rootfs_ipk_log_check() {
 	test "$do_exit" = 1 && exit 1
 	true
 }
+remove_packaging_data_files() {
+	rm -rf ${IMAGE_ROOTFS}/usr/lib/ipkg/
+}

--------------080602070604030703000103--
