Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrBzt-0006vu-Lh
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:37:37 +0200
Received: from [92.117.26.22] (helo=[10.161.26.22])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrBzf-0000wL-H9
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:37:29 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Oct 2008 15:37:33 +0200
User-Agent: KMail/1.9.9
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<200810181432.38565.zecke@selfish.org>
	<200810181520.05743.zecke@selfish.org>
In-Reply-To: <200810181520.05743.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200810181537.33825.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.26.22
Subject: Re: FILE_PR and my requirements Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 13:37:37 -0000
X-Groupsio-MsgNum: 6282
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_dae+IEwctC6/UcY"

--Boundary-00=_dae+IEwctC6/UcY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 18 October 2008 15:20:05 Holger Freyther wrote:
> On Saturday 18 October 2008 14:32:37 Holger Freyther wrote:
>
> More in depth:
- We need to make sure that people do not introduce PR but use FILE_PR

Oops I missed my requirements:
	- Easy to understand what is going on
	- Package name and Workdir matching with each other
	- Full rebuild on DISTRO_PR bump
	- Not reusing the same build directory



> Alternative a new set of variables:
> 	- Revert to make PR as it was before. This adds legacy...
> 	- Introduce PKG_PR which is the composition of PR and DISTRO_PR
> 	- Change PF to be PN-PV-PR (this influences the stamps)
> 	- Change Bitbake to cache PKG_PR and prefer it over PR.

And here two patches. The amount of changes is a lot smaller. The downside is 
it is not as easy to understand as changin PR to FILE_PR (think of the people 
merging OE into their private trees that know little about the classes...). 
Anyway this is something we can talk about..



--Boundary-00=_dae+IEwctC6/UcY
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="bitbake-pkg_pr.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bitbake-pkg_pr.diff"

diff --git a/lib/bb/cache.py b/lib/bb/cache.py
index fe38ea0..58b9e49 100644
--- a/lib/bb/cache.py
+++ b/lib/bb/cache.py
@@ -39,7 +39,7 @@ except ImportError:
     import pickle
     bb.msg.note(1, bb.msg.domain.Cache, "Importing cPickle failed. Falling back to a very slow implementation.")
 
-__cache_version__ = "129"
+__cache_version__ = "130"
 
 class Cache:
     """
@@ -286,6 +286,7 @@ class Cache:
         pe       = self.getVar('PE', file_name, True) or "0"
         pv       = self.getVar('PV', file_name, True)
         pr       = self.getVar('PR', file_name, True)
+        pkg_pr   = self.getVar('PKG_PR', file_name, True) or pr
         dp       = int(self.getVar('DEFAULT_PREFERENCE', file_name, True) or "0")
         depends   = bb.utils.explode_deps(self.getVar("DEPENDS", file_name, True) or "")
         packages  = (self.getVar('PACKAGES', file_name, True) or "").split()
@@ -303,7 +304,7 @@ class Cache:
 
         # build FileName to PackageName lookup table
         cacheData.pkg_fn[file_name] = pn
-        cacheData.pkg_pepvpr[file_name] = (pe,pv,pr)
+        cacheData.pkg_pepvpr[file_name] = (pe,pv,pkg_pr)
         cacheData.pkg_dp[file_name] = dp
 
         provides = [pn]

--Boundary-00=_dae+IEwctC6/UcY
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="oe-pkg-pr.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="oe-pkg-pr.diff"

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 266a89d..3e215f8 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -468,7 +468,7 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PKG_PR}-${MACHINE}"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
 do_deploy() {
@@ -477,7 +477,7 @@ do_deploy() {
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${D}/lib" ]; then
-	tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PR}-${MACHINE}.tgz -C ${D} lib
+	tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PKG_PR}-${MACHINE}.tgz -C ${D} lib
 	fi
 
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
index 6d348d3..5e3016f 100644
--- a/classes/oestats-client.bbclass
+++ b/classes/oestats-client.bbclass
@@ -144,7 +144,7 @@ def oestats_task(server, d, task, status):
 		'build': id,
 		'package': bb.data.getVar('PN', d, True),
 		'version': bb.data.getVar('PV', d, True),
-		'revision': bb.data.getVar('PR', d, True),
+		'revision': bb.data.getVar('PKG_PR', d, True),
 		'depends': bb.data.getVar('DEPENDS', d, True),
 		'task': task,
 		'status': status,
diff --git a/classes/package.bbclass b/classes/package.bbclass
index a12bfb0..10d1c18 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -513,7 +513,7 @@ python emit_pkgdata() {
 		subdata_file = pkgdatadir + "/runtime/%s" % pkg
 		sf = open(subdata_file, 'w')
 		write_if_exists(sf, pkg, 'PN')
-		write_if_exists(sf, pkg, 'PR')
+		write_if_exists(sf, pkg, 'PKG_PR')
 		write_if_exists(sf, pkg, 'DESCRIPTION')
 		write_if_exists(sf, pkg, 'RDEPENDS')
 		write_if_exists(sf, pkg, 'RPROVIDES')
diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index e59d194..84a1477 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -131,7 +131,7 @@ python do_package_deb () {
             pass
         if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
             from bb import note
-            note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+            note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PKG_PR', localdata, 1)))
             bb.utils.unlockfile(lf)
             continue
 
@@ -149,9 +149,9 @@ python do_package_deb () {
         fields = []
         pe = bb.data.getVar('PE', d, 1)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+            fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PKG_PR']])
         else:
-            fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+            fields.append(["Version: %s-%s\n", ['PV', 'PKG_PR']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index f05b744..a195e75 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -178,7 +178,7 @@ python do_package_ipk () {
 			pass
 		if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
 			from bb import note
-			note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PKG_PR', localdata, 1)))
 			bb.utils.unlockfile(lf)
 			continue
 
@@ -193,9 +193,9 @@ python do_package_ipk () {
 		fields = []
 		pe = bb.data.getVar('PE', d, 1)
 		if pe and int(pe) > 0:
-			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PKG_PR']])
 		else:
-			fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+			fields.append(["Version: %s-%s\n", ['PV', 'PKG_PR']])
 		fields.append(["Description: %s\n", ['DESCRIPTION']])
 		fields.append(["Section: %s\n", ['SECTION']])
 		fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 6713f8f..08f9852 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -10,7 +10,7 @@ python write_specfile() {
 	out_vartranslate = {
 		"PKG": "Name",
 		"PV": "Version",
-		"PR": "Release",
+		"PKG_PR": "Release",
 		"DESCRIPTION": "%description",
 		"ROOT": "BuildRoot",
 		"LICENSE": "License",
@@ -41,7 +41,7 @@ python write_specfile() {
 			pass
 	if not files:
 		from bb import note
-		note("Not creating empty archive for %s-%s-%s" % (bb.data.getVar('PKG',d, 1), bb.data.getVar('PV', d, 1), bb.data.getVar('PR', d, 1)))
+		note("Not creating empty archive for %s-%s-%s" % (bb.data.getVar('PKG',d, 1), bb.data.getVar('PV', d, 1), bb.data.getVar('PKG_PR', d, 1)))
 		return
 
 	# output .spec using this metadata store
@@ -79,8 +79,8 @@ python write_specfile() {
 	bb.build.exec_func('BUILDSPEC', d)
 
 	# move the rpm into the pkgoutdir
-	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${PV}-${PR}.${TARGET_ARCH}.rpm', d)
-	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PKG}-${PV}-${PR}.${TARGET_ARCH}.rpm', d)
+	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${PV}-${PKG_PR}.${TARGET_ARCH}.rpm', d)
+	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PKG}-${PV}-${PKG_PR}.${TARGET_ARCH}.rpm', d)
 	bb.movefile(rpm, outrpm)
 }
 
diff --git a/classes/package_tar.bbclass b/classes/package_tar.bbclass
index 876cec6..dfe9c34 100644
--- a/classes/package_tar.bbclass
+++ b/classes/package_tar.bbclass
@@ -5,7 +5,7 @@ IMAGE_PKGTYPE ?= "tar"
 python package_tar_fn () {
 	import os
 	from bb import data
-	fn = os.path.join(bb.data.getVar('DEPLOY_DIR_TAR', d), "%s-%s-%s.tar.gz" % (bb.data.getVar('PKG', d), bb.data.getVar('PV', d), bb.data.getVar('PR', d)))
+	fn = os.path.join(bb.data.getVar('DEPLOY_DIR_TAR', d), "%s-%s-%s.tar.gz" % (bb.data.getVar('PKG', d), bb.data.getVar('PV', d), bb.data.getVar('PKG_PR', d)))
 	fn = bb.data.expand(fn, d)
 	bb.data.setVar('PKGFN', fn, d)
 }
@@ -86,7 +86,7 @@ python do_package_tar () {
 		os.chdir(root)
 		from glob import glob
 		if not glob('*'):
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PKG_PR', localdata, 1)))
 			continue
 		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
 		if ret != 0:
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index ed94790..2ddbc89 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -11,7 +11,7 @@
 #
 # bitbake.conf set PSTAGING_ACTIVE = "0", this class sets to "1" if we're active
 # 
-PSTAGE_PKGVERSION = "${PV}-${PR}"
+PSTAGE_PKGVERSION = "${PV}-${PKG_PR}"
 PSTAGE_PKGARCH    = "${BUILD_SYS}"
 PSTAGE_EXTRAPATH  ?= ""
 PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
@@ -369,9 +369,9 @@ python do_package_stage () {
             arch = bb.data.getVar('PACKAGE_ARCH_%s' % pkg, d, 1)
             if not arch:
                 arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
-            pr = bb.data.getVar('PR_%s' % pkg, d, 1)
+            pr = bb.data.getVar('PKG_PR_%s' % pkg, d, 1)
             if not pr:
-                pr = bb.data.getVar('PR', d, 1)
+                pr = bb.data.getVar('PKG_PR', d, 1)
             if not packaged(pkg, d):
                 continue
             if bb.data.inherits_class('package_ipk', d):
diff --git a/classes/sourcepkg.bbclass b/classes/sourcepkg.bbclass
index bbc9f18..f68a752 100644
--- a/classes/sourcepkg.bbclass
+++ b/classes/sourcepkg.bbclass
@@ -63,7 +63,7 @@ python sourcepkg_do_dumpdata() {
 	distro = bb.data.getVar('DISTRO', d, 1)
 	s_tree = get_src_tree(d)
 	openembeddeddir = os.path.join(workdir, s_tree, distro)
-	dumpfile = os.path.join(openembeddeddir, bb.data.expand("${P}-${PR}.showdata.dump",d))
+	dumpfile = os.path.join(openembeddeddir, bb.data.expand("${P}-${PKG_PR}.showdata.dump",d))
 	
 	try:
 		os.mkdir(openembeddeddir)
@@ -97,8 +97,8 @@ sourcepkg_do_create_diff_gz(){
 		cp $i $src_tree/${DISTRO}/files
 	done
 	
-	oenote "Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz"
-	LC_ALL=C TZ=UTC0 diff --exclude-from=temp/exclude-from-file -Naur $src_tree.orig $src_tree | gzip -c > ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz
+	oenote "Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PKG_PR}.diff.gz"
+	LC_ALL=C TZ=UTC0 diff --exclude-from=temp/exclude-from-file -Naur $src_tree.orig $src_tree | gzip -c > ${DEPLOY_DIR_SRC}/${P}-${PKG_PR}.diff.gz
 	rm -rf $src_tree.orig
 }
 
diff --git a/classes/tinderclient.bbclass b/classes/tinderclient.bbclass
index 0b7fc1d..1b28418 100644
--- a/classes/tinderclient.bbclass
+++ b/classes/tinderclient.bbclass
@@ -65,7 +65,7 @@ def tinder_format_http_post(d,status,log):
         "srcdate"      : data.getVar('SRCDATE', d, True),
         "PN"           : data.getVar('PN', d, True),
         "PV"           : data.getVar('PV', d, True),
-        "PR"           : data.getVar('PR', d, True),
+        "PR"           : data.getVar('PKG_PR', d, True),
         "FILE"         : data.getVar('FILE', d, True) or "N/A",
         "TARGETARCH"   : data.getVar('TARGET_ARCH', d, True),
         "TARGETFPU"    : data.getVar('TARGET_FPU', d, True) or "Unknown",
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d3abb1e..50d2fb2 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -135,12 +135,12 @@ ASSUME_PROVIDED = "\
 ##################################################################
 PN = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[1] or '1.0'}"
-FILE_PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0'}"
-PR = "${FILE_PR}${DISTRO_PR}"
-PF = "${PN}-${EXTENDPE}${PV}-${PR}"
+PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0'}"
+PKG_PR = "${PR}${DISTRO_PR}"
+PF = "${PN}-${EXTENDPE}${PV}-${PKG_PR}"
 EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
 EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
-DEBPV = "${EXTENDPEVER}${PV}-${PR}"
+DEBPV = "${EXTENDPEVER}${PV}-${PKG_PR}"
 P = "${PN}-${PV}"
 
 ##################################################################
@@ -152,7 +152,7 @@ DISTRO_PR ?= ""
 
 SECTION = "base"
 PRIORITY = "optional"
-DESCRIPTION = "Version ${PV}-${PR} of package ${PN}"
+DESCRIPTION = "Version ${PV}-${PKG_PR} of package ${PN}"
 LICENSE = "unknown"
 MAINTAINER = "OpenEmbedded Team <openembedded-devel@lists.openembedded.org>"
 HOMEPAGE = "unknown"

--Boundary-00=_dae+IEwctC6/UcY--
