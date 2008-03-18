Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JbXf9-0001So-Nn
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 09:59:17 +0100
Received: from [172.20.1.5] (vpn006023.vpn.utwente.nl [130.89.6.23])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m2I8t3eE003164; Tue, 18 Mar 2008 09:55:04 +0100
Message-Id: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Tue, 18 Mar 2008 09:55:01 +0100
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.919.2)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.8
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 08:59:17 -0000
X-Groupsio-MsgNum: 4670
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-8--109965314"
Content-Transfer-Encoding: 7bit

--Apple-Mail-8--109965314
Content-Type: multipart/mixed; boundary=Apple-Mail-7--109965340

--Apple-Mail-7--109965340
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Hi,

Poky just switched to opkg and removed ipkg completely, which I think  
is a good thing, but here's a less drastic patch for OE.

Executive summary: you still get .ipk packages, just as before, only  
your rootfs ends up with opkg.  Things like sharprom-compat and wrt54g- 
oe will continue to work just as before.

I'd like to apply this ASAP if there are no serious complaints.

regards,

Koen



--Apple-Mail-7--109965340
Content-Disposition: attachment;
	filename=opkg.diff
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="opkg.diff"
Content-Transfer-Encoding: 7bit

#
# old_revision [7a8e14a3c549cff8b48a1b55c75b9e7c77f0d6b3]
#
# patch "classes/package_ipk.bbclass"
#  from [29c2d1055840133cc3b8317a33dc52aeeb4cd9fc]
#    to [46fbc0933d2ee573d776b79edfa0654cedf36674]
# 
# patch "classes/rootfs_ipk.bbclass"
#  from [bf45905ffdc916560ffe662769f35387e731975b]
#    to [fe6a0f97185a32771d1a2a6f430e63a81fd09e73]
# 
# patch "conf/distro/angstrom-2008.1.conf"
#  from [c5203ad6cf4154e5f329808d72d5564566bb46c7]
#    to [76dc1dbe68cefa065b665303acbbfc4083a771c0]
# 
# patch "packages/tasks/task-base.bb"
#  from [47914cc275060af9ade4a3f8bec2034b23a9e7c6]
#    to [3846bc90772f8374ce01dcb4d89aa7272466eee0]
#
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
+++ classes/rootfs_ipk.bbclass	fe6a0f97185a32771d1a2a6f430e63a81fd09e73
@@ -5,12 +5,12 @@
 # See image.bbclass for a usage of this.
 #
 
-do_rootfs[depends] += "ipkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"
+do_rootfs[depends] += "opkg-native:do_populate_staging opkg-utils-native:do_populate_staging"
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
--- packages/tasks/task-base.bb	47914cc275060af9ade4a3f8bec2034b23a9e7c6
+++ packages/tasks/task-base.bb	3846bc90772f8374ce01dcb4d89aa7272466eee0
@@ -1,5 +1,5 @@ DESCRIPTION = "Merge machine and distro 
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r63"
+PR = "r64"
 
 inherit task
 

--Apple-Mail-7--109965340--

--Apple-Mail-8--109965314
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH34NnMkyGM64RGpERAqJRAJ9aPwyF2FgmnJOB54n3o+oPpQfq1wCgiwkW
VivtFINTDaT2gFd2vi/L+HY=
=abOd
-----END PGP SIGNATURE-----

--Apple-Mail-8--109965314--
