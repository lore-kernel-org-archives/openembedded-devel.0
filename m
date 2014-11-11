Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5AED16AC0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:54:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43194358"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2014 17:50:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAB9rnCD019485
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:53:49 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 11 Nov 2014 17:54:09 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 17:53:24 +0800
Message-ID: <1415699604-2155-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] setxkbmap: upgrade to 1.3.0
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
X-List-Received-Date: Tue, 11 Nov 2014 09:54:03 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb |  8 --------
 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 8 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
deleted file mode 100644
index 127b0f6..0000000
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5feafdbe6dfe9e2bd32325be0cfc86f8"
-DEPENDS += " libxkbfile"
-PE = "1"
-PR = "r6"
-
-SRC_URI[md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
-SRC_URI[sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
new file mode 100644
index 0000000..2b9a8c4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
@@ -0,0 +1,19 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "A program to compile XKB keyboard description"
+
+DESCRIPTION = "The xkbcomp keymap compiler converts a description of an \
+XKB keymap into one of several output formats. The most common use for \
+xkbcomp is to create a compiled keymap file (.xkm extension) which can \
+be read directly by XKB-capable X servers or utilities."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5feafdbe6dfe9e2bd32325be0cfc86f8"
+
+PR = "${INC_PR}.0"
+
+DEPENDS += "libxkbfile"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "1001771344608e120e943a396317c33a"
+SRC_URI[sha256sum] = "3d305c9d1f38224169b2e501ef0665cc3ab52d4dbc2b9a60c9dbb047f77ddec6"
-- 
1.8.4.2


