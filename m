Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7664A79C7C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 14:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 42dMc269Tgz5v
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 16:34:26 +0200 (CEST)
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Oct 2018 17:34:26 +0300
Message-Id: <20181021143426.25760-3-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] libqmi: Make udev and mbim configurable through PACKAGECONFIG
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
X-List-Received-Date: Sun, 21 Oct 2018 14:34:26 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
index 6811ce020..f0bc81cc9 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-DEPENDS = "glib-2.0 libgudev libmbim glib-2.0-native"
+DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit autotools pkgconfig bash-completion
 
@@ -17,3 +17,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[md5sum] = "584214476ab75c394160cb85fbccaa1d"
 SRC_URI[sha256sum] = "c73459ca8bfe1213f8047858d4946fc1f58e164d4f488a7a6904edee25e2ca44"
+
+PACKAGECONFIG ??= "udev mbim"
+PACKAGECONFIG[udev] = ",--without-udev,libgudev"
+PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
-- 
2.11.0


