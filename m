Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8928D7FD78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 18:16:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8HIGRwe009399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 11:16:27 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 17 Sep 2019 11:16:26 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Sep 2019 11:16:26 -0700
Message-ID: <20190917181626.42095-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] live555: update to version 20190828
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
X-List-Received-Date: Tue, 17 Sep 2019 18:16:26 -0000
Content-Type: text/plain

Includes fix for CVE-2019-7733.  Also adjust SRC_URI and use different mirror.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-multimedia/live555/live555.inc         |  4 ++--
 meta-oe/recipes-multimedia/live555/live555_20190306.bb |  8 --------
 meta-oe/recipes-multimedia/live555/live555_20190828.bb | 11 +++++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/live555/live555_20190306.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20190828.bb

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 4fe744c..a88f7eb 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -8,10 +8,10 @@ LICENSE = "LGPLv3"
 SECTION = "devel"
 
 URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
-SRC_URI = "http://www.live555.com/live.${URLV}.tar.gz \
+SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
-MIRRORS += "http://www.live555.com/liveMedia/public/ http://distcache.FreeBSD.org/ports-distfiles/ \n"
+MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-oe/recipes-multimedia/live555/live555_20190306.bb b/meta-oe/recipes-multimedia/live555/live555_20190306.bb
deleted file mode 100644
index fa6057d..0000000
--- a/meta-oe/recipes-multimedia/live555/live555_20190306.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require live555.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-                   "
-SRC_URI[md5sum] = "a84ca3946d899f5592c7d31012ed2fe3"
-SRC_URI[sha256sum] = "0bd0c26d980425d9a419d835193e292a08a968f175da1902da4b495f126d5abd"
-
diff --git a/meta-oe/recipes-multimedia/live555/live555_20190828.bb b/meta-oe/recipes-multimedia/live555/live555_20190828.bb
new file mode 100644
index 0000000..1da61c0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555_20190828.bb
@@ -0,0 +1,11 @@
+require live555.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                   "
+# SRC_URI[md5sum] = "a84ca3946d899f5592c7d31012ed2fe3"
+# SRC_URI[sha256sum] = "0bd0c26d980425d9a419d835193e292a08a968f175da1902da4b495f126d5abd"
+
+SRC_URI[md5sum] = "a593f915664793b3ba41299b17b8bedc"
+SRC_URI[sha256sum] = "a3dcd157865186cf883c3a80b4bb09637e91fff96b234b2c780a7f7dcc7a35dc"
+
-- 
2.7.4


