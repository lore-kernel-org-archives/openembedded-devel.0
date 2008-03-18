Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbYlx-0000Dm-Sx
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 11:10:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbYlr-0005sC-SI
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 10:10:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 10:10:15 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 10:10:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 18 Mar 2008 11:09:57 +0100
Message-ID: <fro4dk$tut$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<200803181056.43273.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803181056.43273.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 10:10:29 -0000
Content-Type: multipart/mixed; boundary="------------000502020502080408030702"

--------------000502020502080408030702
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:

| Few things:
|
| 1. There is no such thing as 'opkg-utils' - we still use ipkg-utils-native
|    for creating packages.

fixed

| 2. You missed image.bbclass change:
|
| --- a/trunk/meta/classes/image.bbclass
| +++ b/trunk/meta/classes/image.bbclass
| @@ -85,8 +85,6 @@ fakeroot do_rootfs () {
|
|  	insert_feed_uris	
|
| -	rm -f ${IMAGE_ROOTFS}${libdir}/ipkg/lists/*
| -	
|  	${IMAGE_PREPROCESS_COMMAND}
|  		
|  	export TOPDIR=${TOPDIR}
|
| 3. Meta/meta-toolchain.bb recipe also use ipkg and this also was changed
|    in Poky.
|
| 4. You did not set SRCREV for opkg-sdk recipe.

attached is a version with a less restricted diff.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH35T0MkyGM64RGpERAhauAJ0ZkGHyEI9jku53+Nx0y3zu6frogACfWUc+
wT4CiDU9QvysZ/CDQk2k6BU=
=Wk/S
-----END PGP SIGNATURE-----

--------------000502020502080408030702
Content-Type: text/x-patch;
 name="opkg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="opkg.patch"

 classes/image.bbclass                |    2 --
 classes/package_ipk.bbclass          |   10 +++++-----
 classes/rootfs_ipk.bbclass           |   28 +++++++++++++++-------------
 conf/distro/angstrom-2008.1.conf     |    2 +-
 conf/distro/include/sane-srcrevs.inc |    1 +
 packages/meta/meta-toolchain.bb      |   12 ++++++------
 packages/tasks/task-base.bb          |    2 +-
 7 files changed, 29 insertions(+), 28 deletions(-)
#
# old_revision [7a8e14a3c549cff8b48a1b55c75b9e7c77f0d6b3]
#
# patch "classes/image.bbclass"
#  from [3ee271e04e5f55aafbefcc98d3e2d4a69568301f]
#    to [0c1a6f9180fa9d934d7f0681f8eb5438047728e6]
# 
# patch "classes/package_ipk.bbclass"
#  from [29c2d1055840133cc3b8317a33dc52aeeb4cd9fc]
#    to [46fbc0933d2ee573d776b79edfa0654cedf36674]
# 
# patch "classes/rootfs_ipk.bbclass"
#  from [bf45905ffdc916560ffe662769f35387e731975b]
#    to [e4ec677fe7591b59875944e027a4a9bfb3d81532]
# 
# patch "conf/distro/angstrom-2008.1.conf"
#  from [c5203ad6cf4154e5f329808d72d5564566bb46c7]
#    to [76dc1dbe68cefa065b665303acbbfc4083a771c0]
# 
# patch "conf/distro/include/sane-srcrevs.inc"
#  from [259383497d4fc0110a4243b6b470ad126dbf39b8]
#    to [00a5872d0c380be7e1be3965a534f859d4a45830]
# 
# patch "packages/meta/meta-toolchain.bb"
#  from [95ccbc599aa34310c2d939504ab869df02206d32]
#    to [b6e5c4c6a79a540177927977ed4d729e0393996e]
# 
# patch "packages/tasks/task-base.bb"
#  from [47914cc275060af9ade4a3f8bec2034b23a9e7c6]
#    to [3846bc90772f8374ce01dcb4d89aa7272466eee0]
#
============================================================
--- classes/image.bbclass	3ee271e04e5f55aafbefcc98d3e2d4a69568301f
+++ classes/image.bbclass	0c1a6f9180fa9d934d7f0681f8eb5438047728e6
@@ -85,8 +85,6 @@ fakeroot do_rootfs () {
 
 	insert_feed_uris	
 
-	rm -f ${IMAGE_ROOTFS}${libdir}/ipkg/lists/*
-	
 	${IMAGE_PREPROCESS_COMMAND}
 		
 	export TOPDIR=${TOPDIR}
============================================================
--- classes/package_ipk.bbclass	29c2d1055840133cc3b8317a33dc52aeeb4cd9fc
+++ classes/package_ipk.bbclass	46fbc0933d2ee573d776b79edfa0654cedf36674
@@ -1,17 +1,17 @@ IMAGE_PKGTYPE ?= "ipk"
 inherit package
 
 BOOTSTRAP_EXTRA_RDEPENDS += "ipkg-collateral ipkg"
 IMAGE_PKGTYPE ?= "ipk"
 
-IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/ipkg.conf"
-IPKGCONF_SDK =  "${STAGING_ETCDIR_NATIVE}/ipkg-sdk.conf"
+IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/opkg.conf"
+IPKGCONF_SDK =  "${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf"
 
 python package_ipk_fn () {
 	from bb import data
 	bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
 }
 
-python package_ipk_install () {
+python package_ipk_install () { 
 	#
 	# Warning - this function is not multimachine safe (see stagingdir reference)!
 	#
@@ -60,8 +60,8 @@ python package_ipk_install () {
 		f = open(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),"w")
 		f.close()
 
-	ret = os.system('ipkg-cl  -o %s -f %s update' % (rootfs, conffile))
-	ret = os.system('ipkg-cl  -o %s -f %s install %s' % (rootfs, conffile, pkgfn))
+	ret = os.system('opkg-cl  -o %s -f %s update' % (rootfs, conffile))
+	ret = os.system('opkg-cl  -o %s -f %s install %s' % (rootfs, conffile, pkgfn))
 	if (ret != 0 ):
 		raise bb.build.FuncFailed
 }
============================================================
--- classes/rootfs_ipk.bbclass	bf45905ffdc916560ffe662769f35387e731975b
+++ classes/rootfs_ipk.bbclass	e4ec677fe7591b59875944e027a4a9bfb3d81532
@@ -5,12 +5,12 @@
 # See image.bbclass for a usage of this.
 #
 
-do_rootfs[depends] += "ipkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"
+do_rootfs[depends] += "opkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 
 IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
 
-DISTRO_EXTRA_RDEPENDS += " ipkg ipkg-collateral "
+DISTRO_EXTRA_RDEPENDS += " opkg opkg-collateral "
 PACKAGE_INSTALL_NO_DEPS ?= "0"
 
 fakeroot rootfs_ipk_do_rootfs () {
@@ -21,41 +21,43 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	mkdir -p ${T}
 
-	ipkg-cl ${IPKG_ARGS} update
+	opkg-cl ${IPKG_ARGS} update
 
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then 
 		if [ ! -z "${LINGUAS_INSTALL}" ]; then
-			ipkg-cl ${IPKG_ARGS} install glibc-localedata-i18n
+			opkg-cl ${IPKG_ARGS} install glibc-localedata-i18n
 			for i in ${LINGUAS_INSTALL}; do
-				ipkg-cl ${IPKG_ARGS} install $i 
+				opkg-cl ${IPKG_ARGS} install $i 
 			done
 		fi
 	fi
 	if [ ! -z "${PACKAGE_INSTALL}" ]; then
-		ipkg-cl ${IPKG_ARGS} install ${PACKAGE_INSTALL}
+		opkg-cl ${IPKG_ARGS} install ${PACKAGE_INSTALL}
 	fi
 
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
-	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/ipkg/
-	grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}${sysconfdir}/ipkg/arch.conf
+	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/opkg/
+	grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}${sysconfdir}/opkg/arch.conf
 
-	for i in ${IMAGE_ROOTFS}${libdir}/ipkg/info/*.preinst; do
+	for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.preinst; do
 		if [ -f $i ] && ! sh $i; then
-			ipkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
+			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
 		fi
 	done
-	for i in ${IMAGE_ROOTFS}${libdir}/ipkg/info/*.postinst; do
+	for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
 		if [ -f $i ] && ! sh $i configure; then
-			ipkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
+			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
 		fi
 	done
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
+	rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*
+	
 	${ROOTFS_POSTPROCESS_COMMAND}
 	
 	log_check rootfs 	
@@ -82,5 +84,5 @@ remove_packaging_data_files() {
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}${libdir}/ipkg/
+	rm -rf ${IMAGE_ROOTFS}${libdir}/opkg/
 }
============================================================
--- conf/distro/angstrom-2008.1.conf	c5203ad6cf4154e5f329808d72d5564566bb46c7
+++ conf/distro/angstrom-2008.1.conf	76dc1dbe68cefa065b665303acbbfc4083a771c0
@@ -207,7 +207,7 @@ DISTRO_EXTRA_RDEPENDS += "\
     update-modules \
     ${@base_contains("MACHINE_FEATURES", "screen", "psplash", "",d)} \   
     angstrom-version \
-    opkg-ipkg-compat ${ANGSTROM_FEED_CONFIGS} \
+    opkg ${ANGSTROM_FEED_CONFIGS} \
     util-linux-mount util-linux-umount \
     ${DEBUG_APPS} \
     "
============================================================
--- conf/distro/include/sane-srcrevs.inc	259383497d4fc0110a4243b6b470ad126dbf39b8
+++ conf/distro/include/sane-srcrevs.inc	00a5872d0c380be7e1be3965a534f859d4a45830
@@ -138,6 +138,7 @@ SRCREV_pn-opkg-native ?= "4142"
 SRCREV_pn-openocd-native ?= "206"
 SRCREV_pn-opkg ?= "4142"
 SRCREV_pn-opkg-native ?= "4142"
+SRCREV_pn-opkg-sdk ?= "4142"
 SRCREV_pn-oprofileui ?= "160"
 SRCREV_pn-psplash ?= "249"
 SRCREV_pn-pylgrim ?= "20"
============================================================
--- packages/meta/meta-toolchain.bb	95ccbc599aa34310c2d939504ab869df02206d32
+++ packages/meta/meta-toolchain.bb	b6e5c4c6a79a540177927977ed4d729e0393996e
@@ -1,6 +1,6 @@ LICENSE = "MIT"
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
-DEPENDS = "ipkg-native ipkg-utils-native fakeroot-native sed-native"
+DEPENDS = "opkg-native ipkg-utils-native fakeroot-native sed-native"
 
 inherit sdk meta
 
@@ -9,8 +9,8 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 SDK_OUTPUT2 = "${SDK_DIR}/image-extras"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
-IPKG_HOST = "ipkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
-IPKG_TARGET = "ipkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/temp-target"
+IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
+IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/temp-target"
 
 TOOLCHAIN_HOST_TASK ?= "task-sdk-host"
 TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
@@ -40,8 +40,8 @@ do_populate_sdk() {
 	mkdir -p ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include
 	mkdir -p ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/.debug/
 	mkdir -p ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/share
-	mv ${SDK_OUTPUT}/temp-target/usr/lib/ipkg/status ${SDK_OUTPUT}/${prefix}/package-status
-	rm -rf ${SDK_OUTPUT}/temp-target/usr/lib/ipkg/
+	mv ${SDK_OUTPUT}/temp-target/usr/lib/opkg/status ${SDK_OUTPUT}/${prefix}/package-status
+	rm -rf ${SDK_OUTPUT}/temp-target/usr/lib/opkg/
 	cp -pPR ${SDK_OUTPUT}/temp-target/usr/include/* ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include/
 	cp -pPR ${SDK_OUTPUT}/temp-target/usr/lib/* ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/
 	if [ -d ${SDK_OUTPUT}/temp-target/usr/lib/.debug ]; then
@@ -69,7 +69,7 @@ do_populate_sdk() {
 	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libc.so
 
 	# remove unwanted housekeeping files
-	mv ${SDK_OUTPUT}/usr/lib/ipkg/status ${SDK_OUTPUT}/${prefix}/package-status-host
+	mv ${SDK_OUTPUT}/usr/lib/opkg/status ${SDK_OUTPUT}/${prefix}/package-status-host
 	rm -Rf ${SDK_OUTPUT}/usr/lib
 
 	# extract and store ipks, pkgdata and shlibs data
============================================================
--- packages/tasks/task-base.bb	47914cc275060af9ade4a3f8bec2034b23a9e7c6
+++ packages/tasks/task-base.bb	3846bc90772f8374ce01dcb4d89aa7272466eee0
@@ -1,5 +1,5 @@ DESCRIPTION = "Merge machine and distro 
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r63"
+PR = "r64"
 
 inherit task
 

--------------000502020502080408030702--
