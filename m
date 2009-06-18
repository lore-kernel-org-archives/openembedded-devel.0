Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MHElS-0003N3-4E
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 12:22:38 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id DABDD686DF;
	Thu, 18 Jun 2009 14:11:56 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 14:11:54 +0400
Message-Id: <1245319914-18496-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1245316678.25995.9.camel@mill.internal.reciva.com>
References: <1245316678.25995.9.camel@mill.internal.reciva.com>
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
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
X-List-Received-Date: Thu, 18 Jun 2009 10:22:39 -0000

If there are no package updates since last index update, don't re-create
indexes. Really helps when building something like 10 images.

Remove code duplication along the way.
---
 classes/package_ipk.bbclass |   19 +++++++------------
 1 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 1f1b5c9..ad84e6e 100644
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
+			NEWEST_PACKAGE=`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/*.ipk | head -n 1`
+			if [ -n "$NEWEST_PACKAGE" ] && [ "$NEWEST_PACKAGE" -nt "${DEPLOY_DIR_IPK}/$ipk_path/Packages" ]; then
+				touch ${DEPLOY_DIR_IPK}/$ipk_path/Packages
+				ipkg-make-index -r ${DEPLOY_DIR_IPK}/$ipk_path/Packages -p ${DEPLOY_DIR_IPK}/$ipk_path/Packages -l ${DEPLOY_DIR_IPK}/$ipk_path/Packages.filelist -m ${DEPLOY_DIR_IPK}/$ipk_path/
+			fi
+		done
 	done
 }
 
-- 
1.6.3.1



