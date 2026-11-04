Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20018.1793826692240521439
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 13:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ap0Ax81A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261104211129ce8c0ab09e00020732-h01e2v@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261104211129ce8c0ab09e00020732
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 04 Nov 2026 22:11:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=z68hvXGxADThEx9lAkr3J+UdObHLMC9aD9vh0KY4EvU=;
 b=ap0Ax81A4ZPPkn+C+y5c0ew1qM4e3L/xbTjx5xu2TV6uHCFR0ZTcIjl8+VIXMi5WCOpAUi
 leOkBPeDxdWhPxIjGmcMSN3aMn/5dA7I+An+Ty8vjCtqetIGnoTP1YnH9/dYoHmWRf+lNE4V
 dKswfL+/930/2NFHfAaSvsx6H+AQ11ujKSBtS1nt6wcixtLDaHHX9N9i7bLggjlhgNQO/Yh6
 E92EHSb3x6OEV9x2DCeRYjCAcwC+Ifwe6ITpV/eF0jLxqtBOsCrHkCk6u52NC92pY+tgmFBQ
 S8f944R67YAvTXlqhHEiHTrNl891FAXSWBxrsTCF8I90Gvkhl9X+qd/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libwebsockets: Upgrade 5.0.0 -> 5.1.0
Date: Wed,  4 Nov 2026 22:11:07 +0100
Message-ID: <20261104211107.2286440-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 21:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131847
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

This includes fix for CVE-2026-114550.

Added a patch for reproducibility issue from this release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...urce-dir-from-installed-lws_config.h.patch | 34 +++++++++++++++++++
 ...ockets_5.0.0.bb => libwebsockets_5.1.0.bb} |  6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-cmake-remove-source-dir-from-installed-lws_config.h.patch
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_5.0.0.bb => libwebsockets_5.1.0.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-cmake-remove-source-dir-from-installed-lws_config.h.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-cmake-remove-source-dir-from-installed-lws_config.h.patch
new file mode 100644
index 0000000000..0b096efe74
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-cmake-remove-source-dir-from-installed-lws_config.h.patch
@@ -0,0 +1,34 @@
+From 7de4adc4359dc45fd088ad11a8130dcb0fc95cdc Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Wed, 4 Nov 2026 21:52:32 +0100
+Subject: [PATCH] cmake: remove source dir from installed lws_config.h
+
+lws_config.h is installed and contains LWS_SOURCE_FONTS_DIR, which
+points into the build host's source tree. This makes builds
+non-reproducible, and the path does not exist once the component is
+packaged into a distribution.
+
+Nothing in the tree references LWS_SOURCE_FONTS_DIR, and the fonts'
+install destination is already available as LWS_FONTS_DIR on the
+line above.
+
+Remove the unused definition.
+
+Upstream-Status: Submitted [https://github.com/warmcat/libwebsockets/pull/3687]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cmake/lws_config.h.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/cmake/lws_config.h.in b/cmake/lws_config.h.in
+index c716d4f0d..7ad2310fc 100644
+--- a/cmake/lws_config.h.in
++++ b/cmake/lws_config.h.in
+@@ -10,7 +10,6 @@
+ #define LWS_INSTALL_LIBDIR "${LWS_ABSOLUTE_INSTALL_LIBDIR}"
+ #define LWS_PLUGIN_DIR "${LWS_INSTALL_PLUGIN_DIR}"
+ #define LWS_FONTS_DIR "${LWS_ABSOLUTE_INSTALL_FONTS_DIR}"
+-#define LWS_SOURCE_FONTS_DIR "${PROJECT_SOURCE_DIR}/contrib/mcufont/fonts"
+ #define LWS_LIBRARY_VERSION_MAJOR ${LWS_LIBRARY_VERSION_MAJOR}
+ #define LWS_LIBRARY_VERSION_MINOR ${LWS_LIBRARY_VERSION_MINOR}
+ #define LWS_LIBRARY_VERSION_PATCH_ELABORATED ${LWS_LIBRARY_VERSION_PATCH_ELABORATED}
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.0.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.1.0.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.0.0.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.1.0.bb
index bafaf10f9b..f4b804a5f0 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.0.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.1.0.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d1d99ab4e0f1be7992a891906e47add2"
 DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
-SRCREV = "2491a1b101283cf7886d05033345b7e821825319"
-SRCBRANCH = "v${@oe.utils.trim_version("${PV}", 2)}-stable"
+SRCREV = "5f39aa483715b813f4d85a692fcb361b5d8d0c1b"
+#SRCBRANCH = "v${@oe.utils.trim_version("${PV}", 2)}-stable"
+SRCBRANCH = "main"
 SRC_URI = " \
     git://github.com/warmcat/libwebsockets.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
+    file://0001-cmake-remove-source-dir-from-installed-lws_config.h.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
