Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MH1BW-0005k1-Km
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:52:38 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MH11N-000GRZ-0t; Wed, 17 Jun 2009 23:42:09 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 23:41:59 +0400
Message-Id: <1245267720-13612-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1245267720-13612-1-git-send-email-khimov@altell.ru>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8770 [Jun 17 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: [PATCH 2/3] package_ipk: optimize do_package_update_index_ipk
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
X-List-Received-Date: Wed, 17 Jun 2009 19:52:38 -0000

If there are no package updates since last index update, don't re-create
indexes. Really helps when building something like 10 images.

Remove code duplication along the way.
---
 classes/package_ipk.bbclass |   19 +++++++------------
 1 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 1f1b5c9..d804c78 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -89,18 +89,13 @@ do_package_update_index_ipk () {
 	ipkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
 
 	for arch in $ipkgarchs; do
-		if [ -e ${DEPLOY_DIR_IPK}/$arch/ ] ; then 
-			touch ${DEPLOY_DIR_IPK}/$arch/Packages
-			ipkg-make-index -r ${DEPLOY_DIR_IPK}/$arch/Packages -p ${DEPLOY_DIR_IPK}/$arch/Packages -l ${DEPLOY_DIR_IPK}/$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/$arch/
-		fi
-		if [ -e ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/ ] ; then 
-			touch ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages
-			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -p ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/
-		fi
-		if [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/ ] ; then
-			touch ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages
-			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -p ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -l ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/
-		fi
+		for ipk_path in $arch ${BUILD_ARCH}-$arch-sdk ${SDK_SYS}-sdk-$arch; do
+			PACK_COUNT=`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/ | head -n 4 | grep Packages | wc -l`
+			if [ -e ${DEPLOY_DIR_IPK}/$ipk_path/ -a "$PACK_COUNT" != "4" ] ; then 
+				touch ${DEPLOY_DIR_IPK}/$ipk_path/Packages
+				ipkg-make-index -r ${DEPLOY_DIR_IPK}/$ipk_path/Packages -p ${DEPLOY_DIR_IPK}/$ipk_path/Packages -l ${DEPLOY_DIR_IPK}/$ipk_path/Packages.filelist -m ${DEPLOY_DIR_IPK}/$ipk_path/
+			fi
+		done
 	done
 }
 
-- 
1.6.3.1



