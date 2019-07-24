Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4257C132
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 04:59:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6O4x82o013856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 21:59:18 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 23 Jul 2019 21:58:51 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Jul 2019 00:58:49 -0400
Message-ID: <20190724045849.99375-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfwm4: fix assertion error
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
X-List-Received-Date: Wed, 24 Jul 2019 04:59:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to start xfwm4 on intel_x86_64 boards:

| xfwm4: ../mesa-19.1.1/src/mesa/drivers/dri/i965/intel_mipmap_tree.c:1293:
| intel_miptree_match_image: Assertion `image->TexObject->Target == mt->target' failed.
| Aborted

Revert the upstream commit which introduce the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...r-Revert-to-GLX-as-default-vblank-me.patch | 90 +++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
new file mode 100644
index 000000000..380021250
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
@@ -0,0 +1,90 @@
+From acdceb0b28d86199b8c2233880fa8a04cb24d4d4 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 24 Jul 2019 09:48:04 +0800
+Subject: [PATCH] Revert "compositor: Revert to GLX as default vblank method
+ (again)"
+
+This reverts commit e07574d6e7a2dbaa08c3ba4765c6306073d9493e.
+
+It sets the default vblank method (auto) to GLX from 4.13.2. But it
+fails to start xfwm4 on intel-x86-64 boards with error:
+
+| xfwm4: ../mesa-19.1.1/src/mesa/drivers/dri/i965/intel_mipmap_tree.c:1293:
+| intel_miptree_match_image: Assertion `image->TexObject->Target == mt->target' failed.
+| Aborted
+
+There is also a RHEL defect:
+https://bugzilla.redhat.com/show_bug.cgi?id=1678334
+
+Revert the commit to fix the issue.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/compositor.c | 41 +++++++++++++++++++----------------------
+ 1 file changed, 19 insertions(+), 22 deletions(-)
+
+diff --git a/src/compositor.c b/src/compositor.c
+index 25615282..daced607 100644
+--- a/src/compositor.c
++++ b/src/compositor.c
+@@ -4483,13 +4483,28 @@ compositorManageScreen (ScreenInfo *screen_info)
+     XClearArea (display_info->dpy, screen_info->output, 0, 0, 0, 0, TRUE);
+     TRACE ("manual compositing enabled");
+ 
++#ifdef HAVE_PRESENT_EXTENSION
++    screen_info->use_present = display_info->have_present &&
++                               (screen_info->vblank_mode == VBLANK_AUTO ||
++                                screen_info->vblank_mode == VBLANK_XPRESENT);
++    if (screen_info->use_present)
++    {
++        screen_info->present_pending = FALSE;
++        XPresentSelectInput (display_info->dpy,
++                             screen_info->output,
++                             PresentCompleteNotifyMask);
++    }
++#else /* HAVE_PRESENT_EXTENSION */
++    screen_info->use_present = FALSE;
++#endif /* HAVE_PRESENT_EXTENSION */
++
+ #ifdef HAVE_EPOXY
+-    screen_info->use_glx = (screen_info->vblank_mode == VBLANK_AUTO ||
+-                            screen_info->vblank_mode == VBLANK_GLX);
++    screen_info->use_glx = !screen_info->use_present &&
+ #ifdef HAVE_XSYNC
+-    screen_info->use_glx &= display_info->have_xsync;
++                            display_info->have_xsync &&
+ #endif /* HAVE_XSYNC */
+-
++                            (screen_info->vblank_mode == VBLANK_AUTO ||
++                             screen_info->vblank_mode == VBLANK_GLX);
+     if (screen_info->use_glx)
+     {
+         screen_info->glx_context = None;
+@@ -4503,24 +4518,6 @@ compositorManageScreen (ScreenInfo *screen_info)
+     screen_info->use_glx = FALSE;
+ #endif /* HAVE_EPOXY */
+ 
+-#ifdef HAVE_PRESENT_EXTENSION
+-    screen_info->use_present = display_info->have_present &&
+-#ifdef HAVE_EPOXY
+-                               !screen_info->use_glx &&
+-#endif /* HAVE_EPOXY */
+-                               (screen_info->vblank_mode == VBLANK_AUTO ||
+-                                screen_info->vblank_mode == VBLANK_XPRESENT);
+-    if (screen_info->use_present)
+-    {
+-        screen_info->present_pending = FALSE;
+-        XPresentSelectInput (display_info->dpy,
+-                             screen_info->output,
+-                             PresentCompleteNotifyMask);
+-    }
+-#else /* HAVE_PRESENT_EXTENSION */
+-    screen_info->use_present = FALSE;
+-#endif /* HAVE_PRESENT_EXTENSION */
+-
+     if (screen_info->use_present)
+     {
+         g_info ("Compositor using XPresent for vsync");
+-- 
+2.20.1
+
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
index f4ebb45e0..591580b84 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
@@ -8,6 +8,7 @@ inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
 SRC_URI[md5sum] = "e53081e5928d401604d158429716e699"
 SRC_URI[sha256sum] = "12ad274f6662c8afee35fd9b9310e73bd462c423578d448b2d7353e3c8eda6c1"
 
-- 
2.20.0


