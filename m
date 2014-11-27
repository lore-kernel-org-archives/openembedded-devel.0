Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB4872278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:02:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44077089"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2014 17:59:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sARA24Gd010901
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 18:02:04 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 27 Nov 2014 18:02:31 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Nov 2014 18:02:11 +0800
Message-ID: <1417082531-12508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] twm: Upgrade to 1.0.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Nov 2014 10:02:27 -0000
Content-Type: text/plain

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb | 16 ----------------
 meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
deleted file mode 100644
index d569fd0..0000000
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-SUMMARY = "tiny window manager"
-DEPENDS += " libxext libxt libxmu bison-native"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
-
-
-SRC_URI[md5sum] = "952d06a0c2ec34687b536c7b619fc671"
-SRC_URI[sha256sum] = "e7dccad7879a7570442f0cd9df0b9064e926466b5a52b710fca8cfb167f294e9"
-
-FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/twm"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "1"
diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb
new file mode 100644
index 0000000..3574ba9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb
@@ -0,0 +1,16 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+SUMMARY = "tiny window manager"
+DEPENDS += " libxext libxt libxmu bison-native"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
+
+
+SRC_URI[md5sum] = "4b28317d4a9f7ca61bef8462e132bd4c"
+SRC_URI[sha256sum] = "7660352353d632127ff50390991706aa660b28a4ada816c2582ac02720722e44"
+
+FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/twm"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "1"
-- 
1.8.3.1


