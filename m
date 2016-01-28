Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 250BF76486
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 10:55:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0SAt5Ki008257 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 04:55:05 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012804550490-384958 ;
	Thu, 28 Jan 2016 04:55:04 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2016 12:54:51 +0200
Message-Id: <1453978491-8849-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/28/2016 04:55:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/28/2016 04:55:05 AM,
	Serialize complete at 01/28/2016 04:55:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-28_05:, , signatures=0
Subject: [meta-xfce][PATCH 1/1] xfwm4: add patch to fix touch event handling
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
X-List-Received-Date: Thu, 28 Jan 2016 10:55:06 -0000

Patch sent upstream, pending acceptance

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 ...handling-of-touch-events-on-window-border.patch | 42 ++++++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb       |  6 +++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch
new file mode 100644
index 0000000..e01aac5
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch
@@ -0,0 +1,42 @@
+From cb966e51ea51088a1d4fd5914fc7f917684e0b51 Mon Sep 17 00:00:00 2001
+From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+Date: Thu, 28 Jan 2016 11:43:01 +0200
+Subject: [PATCH] events: fix handling of touch events on window borders
+
+When the Xorg server translates touch events into ButtonPress/ButtonRelease
+events, the subwindow in the XEvent structure is set to zero. This change adds
+a querry to determine the subwindow for the event in case it is missing.
+
+Original patch & discussion at [1].
+
+Upstream-Status: Pending acceptance
+
+[1] http://xfce.10915.n7.nabble.com/Re-Xfwm-window-borders-do-not-respond-to-touch-screen-td42357.html
+
+Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
+Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+---
+ src/events.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/events.c b/src/events.c
+index 8aa0f0a..0565594 100644
+--- a/src/events.c
++++ b/src/events.c
+@@ -917,6 +917,13 @@ handleButtonPress (DisplayInfo *display_info, XButtonEvent * ev)
+     {
+         state = ev->state & MODIFIER_MASK;
+         win = ev->subwindow;
++        if (!win) {
++                Window root_ret;
++                int rx,ry,wx,wy;
++                unsigned int mask_ret;
++                XQueryPointer(display_info->dpy, ev->window,
++                              &root_ret, &win, &rx, &ry, &wx, &wy, &mask_ret);
++        }
+         screen_info = c->screen_info;
+ 
+         if ((ev->button == Button1) && (state) && (state == screen_info->params->easy_click))
+-- 
+2.7.0
+
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
index 41daa00..aa4b290 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
@@ -6,7 +6,11 @@ DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbu
 
 inherit xfce update-alternatives
 
-SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
+SRC_URI += " \
+    file://0001-don-t-block-display-events-when-time-is-set-backward.patch \
+    file://0001-events-fix-handling-of-touch-events-on-window-border.patch \
+"
+
 SRC_URI[md5sum] = "197ef087ca6a263627f1bea6d5a79d6f"
 SRC_URI[sha256sum] = "f4a988fbc4e0df7e8583c781d271559e56fd28696092f94ae052e9e6edb09eac"
 
-- 
2.7.0


