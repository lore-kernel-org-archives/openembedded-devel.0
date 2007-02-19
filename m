Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJ6Xl-0004FP-UR
	for openembedded-devel@openembedded.org; Mon, 19 Feb 2007 12:18:54 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1JBIpLr022257 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2007 12:18:51 +0100
Message-ID: <45D98799.1080309@dominion.kabel.utwente.nl>
Date: Mon, 19 Feb 2007 12:18:49 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Mon, 19 Feb 2007 11:18:54 -0000
Content-Type: multipart/mixed; boundary="------------010307020602090108060602"

--------------010307020602090108060602
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

When using multimachine and ipkg deploy/ipk gets awfully crowded after a while. I want to
propose sorting it by subarch. Attached is a patch that adds support for that to
rootfs_ipk.bbclass.

What do you think about that?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2YeZMkyGM64RGpERAjYCAJ9nBjdpcvTlvijaQ7o/UlZGWg68tgCdHw4m
IzGLM3yx+X9k/ZgMo+WqT6E=
=N6sc
-----END PGP SIGNATURE-----

--------------010307020602090108060602
Content-Type: text/x-patch; x-mac-type="0"; x-mac-creator="0";
 name="rootfs-ipk-with-sorted-deploy.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rootfs-ipk-with-sorted-deploy.patch"

# 
# old_revision [bc83c51286e87a2b8aa3f79f074cadc05dedb7de]
# 
# patch "classes/rootfs_ipk.bbclass"
#  from [7824b4ee6ac7524e12d7411575e8bbf4b8a9d321]
#    to [016f168e95ecc8150984cc48a14ecbd73a5fd9ed]
# 
============================================================
--- classes/rootfs_ipk.bbclass	7824b4ee6ac7524e12d7411575e8bbf4b8a9d321
+++ classes/rootfs_ipk.bbclass	016f168e95ecc8150984cc48a14ecbd73a5fd9ed
@@ -18,17 +18,26 @@ fakeroot rootfs_ipk_do_rootfs () {
 		
 	mkdir -p ${IMAGE_ROOTFS}/dev
 
-	if [ -z "${DEPLOY_KEEP_PACKAGES}" ]; then
+	ipkgarchs="${PACKAGE_ARCHS}"
+
+        if [ -z "${DEPLOY_KEEP_PACKAGES}" ]; then
 		touch ${DEPLOY_DIR_IPK}/Packages
 		ipkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
-	fi
+		if [-e ${DEPLOY_DIR_IPK}/$arch/] ; then 
+			touch ${DEPLOY_DIR_IPK}/$arch/Packages
+			ipkg-make-index -r ${DEPLOY_DIR_IPK}/$arch/Packages -p ${DEPLOY_DIR_IPK}/$arch/Packages -l ${DEPLOY_DIR_IPK}/$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/$arch
+                fi
+        fi
+	
 	mkdir -p ${T}
 	echo "src oe file:${DEPLOY_DIR_IPK}" > ${T}/ipkg.conf
-	ipkgarchs="${PACKAGE_ARCHS}"
 	priority=1
 	for arch in $ipkgarchs; do
 		echo "arch $arch $priority" >> ${T}/ipkg.conf
 		priority=$(expr $priority + 5)
+		if [-e ${DEPLOY_DIR_IPK}/$arch/Packages] ; then
+		        echo "src oe file:${DEPLOY_DIR_IPK}/$arch" >> ${T}/ipkg.conf
+	        fi
 	done
 	ipkg-cl ${IPKG_ARGS} update
 	if [ ! -z "${LINGUAS_INSTALL}" ]; then

--------------010307020602090108060602--
