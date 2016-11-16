Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34822719A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 07:32:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAG7W3ak021190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 23:32:04 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 23:32:03 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Nov 2016 02:32:01 -0500
Message-ID: <20161116073201.209432-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] opencv: checking existence of /usr/lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2016 07:32:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Remove install errors:

  mv: cannot stat '.../tmp/work/mips64-wrs-linux/opencv/3.1+gitAUTOINC
  +92387b1ef8-r0/image/usr/lib/*': No such file or directory

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 72bf5b4..1bbb965 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -138,7 +138,7 @@ do_install_append() {
     sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
 
     # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" ]; then
+    if [ "$libdir" != "/usr/lib" -a -d ${D}/usr/lib ]; then
         mv ${D}/usr/lib/* ${D}/${libdir}/
         rm -rf ${D}/usr/lib
     fi
-- 
2.9.3


