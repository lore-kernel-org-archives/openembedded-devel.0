Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC6z-0007G5-0d
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:25 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97Cpk9P021258;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-000151-Bw; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:36 +0200
Message-Id: <c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 03/13] package_ipk.bbclass: add support for for canadian sdk ipkg
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:25 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 classes/package_ipk.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index f05b744..ad06475 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -5,6 +5,7 @@ IMAGE_PKGTYPE ?= "ipk"
 
 IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/opkg.conf"
 IPKGCONF_SDK =  "${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf"
+IPKGCONF_CANSDK =  "${STAGING_ETCDIR_NATIVE}/opkg-canadian-sdk.conf"
 
 python package_ipk_fn () {
 	from bb import data
@@ -90,6 +91,10 @@ package_update_index_ipk () {
 			touch ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages
 			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -p ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/
 		fi
+		if [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/ ] ; then 
+			touch ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages
+			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -p ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -l ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/
+		fi
 	done
 }
 
@@ -102,11 +107,13 @@ package_generate_ipkg_conf () {
 	mkdir -p ${STAGING_ETCDIR_NATIVE}/
 	echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_TARGET}
 	echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_SDK}
+	echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_CANSDK}
 	ipkgarchs="${PACKAGE_ARCHS}"
 	priority=1
 	for arch in $ipkgarchs; do
 		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
 		echo "arch ${BUILD_ARCH}-$arch-sdk $priority" >> ${IPKGCONF_SDK}
+		echo "arch ${SDK_SYS}-sdk-$arch $priority" >> ${IPKGCONF_CANSDK}
 		priority=$(expr $priority + 5)
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
 		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
@@ -114,6 +121,9 @@ package_generate_ipkg_conf () {
 		if [ -e ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages ] ; then
 		        echo "src oe-${BUILD_ARCH}-$arch-sdk file:${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk" >> ${IPKGCONF_SDK}
 		fi
+		if [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages ] ; then
+		        echo "src oe-${SDK_SYS}-sdk-$arch file:${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch" >> ${IPKGCONF_CANSDK}
+		fi
 	done
 }
 
-- 
1.5.4.3



