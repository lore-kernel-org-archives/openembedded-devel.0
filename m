Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB1EC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:21:13 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.11040.1745486463565703319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 24 Apr 2025 18:21:00 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.133)
	by 156.147.1.126 with ESMTP; 24 Apr 2025 18:21:00 +0900
X-Original-SENDERIP: 10.177.121.133
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] xsp: fix build error in gcc-15
Date: Thu, 24 Apr 2025 18:20:59 +0900
Message-Id: <20250424092059.130100-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 09:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117091

From: "mark.yang" <mark.yang@lge.com>

* fix following build error in gcc-15:
../Xsp/Xsp.c:37:9: error: initialization of 'int (*)(Display *, XExtCodes *)' from incompatible pointer type 'int (*)(void)' [-Wincompatible-pointer-types]
   37 |         XSPCloseDisplay,                    /* close_display */
      |         ^~~~~~~~~~~~~~~
../Xsp/Xsp.c:37:9: note: (near initialization for 'xsp_extension_hooks.close_display')
../Xsp/Xsp.c:23:12: note: 'XSPCloseDisplay' declared here
   23 | static int XSPCloseDisplay();
      |            ^~~~~~~~~~~~~~~
In file included from ../Xsp/Xsp.c:6:
../Xsp/Xsp.c:49:37: error: conflicting types for 'XSPCloseDisplay'; have 'int(Display *, XExtCodes *)'
   49 | static XEXT_GENERATE_CLOSE_DISPLAY (XSPCloseDisplay, xsp_info)
      |                                     ^~~~~~~~~~~~~~~
../Xsp/Xsp.c:36:9: error: 'XSPCloseDisplay' undeclared here (not in a function); did you mean 'XCloseDisplay'?
   36 |         XSPCloseDisplay,                    /* close_display */
      |         ^~~~~~~~~~~~~~~
      |         XCloseDisplay

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-pointer-types-build-error-in-gcc-15.patch | 40 +++++++++++++++++++
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch

diff --git a/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch b/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch
new file mode 100644
index 0000000000..ffb1089423
--- /dev/null
+++ b/meta-oe/recipes-multimedia/xsp/xsp/0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch
@@ -0,0 +1,40 @@
+From e001efa4a50e43fca5d8918ee05a3bc37180262d Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 24 Apr 2025 18:10:25 +0900
+Subject: [PATCH] fix incompatible-pointer-types build error in gcc 15
+
+../Xsp/Xsp.c:37:9: error: initialization of 'int (*)(Display *, XExtCodes *)' from incompatible pointer type 'int (*)(void)' [-Wincompatible-pointer-types]
+   37 |         XSPCloseDisplay,                    /* close_display */
+      |         ^~~~~~~~~~~~~~~
+../Xsp/Xsp.c:37:9: note: (near initialization for 'xsp_extension_hooks.close_display')
+../Xsp/Xsp.c:23:12: note: 'XSPCloseDisplay' declared here
+   23 | static int XSPCloseDisplay();
+      |            ^~~~~~~~~~~~~~~
+In file included from ../Xsp/Xsp.c:6:
+../Xsp/Xsp.c:49:37: error: conflicting types for 'XSPCloseDisplay'; have 'int(Display *, XExtCodes *)'
+   49 | static XEXT_GENERATE_CLOSE_DISPLAY (XSPCloseDisplay, xsp_info)
+      |                                     ^~~~~~~~~~~~~~~
+../Xsp/Xsp.c:36:9: error: 'XSPCloseDisplay' undeclared here (not in a function); did you mean 'XCloseDisplay'?
+   36 |         XSPCloseDisplay,                    /* close_display */
+      |         ^~~~~~~~~~~~~~~
+      |         XCloseDisplay
+
+Upstream-Status: Inactive-Upstream [seems to be unmaintained]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ Xsp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Xsp.c b/Xsp.c
+index 28e2d6e..9bcc958 100644
+--- a/Xsp.c
++++ b/Xsp.c
+@@ -20,7 +20,7 @@ static XExtensionInfo _xsp_info_data;
+ static XExtensionInfo *xsp_info = &_xsp_info_data;
+ static /* const */ char *xsp_extension_name = XSP_NAME;
+ 
+-static int XSPCloseDisplay();
++static XEXT_CLOSE_DISPLAY_PROTO(XSPCloseDisplay);
+ static Bool XSPWireToEvent(Display *dpy, XEvent *event, xEvent *wire);
+ 
+ static Status XSPEventToWire(Display *dpy, XEvent *event, xEvent *wire);
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 124db55d13..8b9247694c 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -4,7 +4,9 @@ SECTION = "x11/libs"
 DEPENDS = "virtual/libx11 libxext xpext"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2bda168c508c7cd8afa567b2fcc549"
 SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${BPN}_${PV}.tar.gz \
-           file://xsp-fix-pc.patch"
+           file://xsp-fix-pc.patch \
+           file://0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch \
+"
 S = "${WORKDIR}/Xsp"
 
 inherit autotools pkgconfig features_check

