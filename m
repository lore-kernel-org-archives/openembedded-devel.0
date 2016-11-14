Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C722071975
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 11:22:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAEBMTQE024579
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 03:22:30 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 03:22:28 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:22:27 -0500
Message-ID: <20161114112227.133556-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] opencv: fix QA issue
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
X-List-Received-Date: Mon, 14 Nov 2016 11:22:31 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Replace '/lib' with '${baselib}' to fix QA issue:

  ERROR: do_package_qa: QA Issue: non -staticdev package contains \
  static .a library: opencv-apps path \
  '.../opencv-apps/usr/share/OpenCV/3rdparty/lib64/libippicv.a' \
  [staticdev]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 2136b07..72bf5b4 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -116,7 +116,7 @@ PACKAGES_DYNAMIC += "^libopencv-.*"
 
 FILES_${PN} = ""
 FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake ${datadir}/OpenCV/3rdparty/lib/*.a"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake ${datadir}/OpenCV/3rdparty/${baselib}/*.a"
 FILES_${PN}-doc = "${datadir}/OpenCV/doc"
 FILES_${PN}-java = "${datadir}/OpenCV/java"
 FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
-- 
2.9.3


