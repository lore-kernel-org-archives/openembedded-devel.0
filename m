Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id BA3146F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:13 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so6671676wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o71/Iahq41Y6pOwDNIHcGcj4mRRf7DVQa0Mz3B65jso=;
	b=swo5fOJVxyBuBZCmfUrnp2CZyUYlq24Nlci4XK0CX/EptNZhjH81exodPQUHktYbff
	C7sJjK59a+YDE9gwpUpjlFaCBYKiriqhTLoPPlHs7NUPpAkgk84uzbSWOFScw6qgkwtS
	QDbf6+p44LKLyvFf9FA1JXjamN1sOGC7eqImtzHFtVRoBeEezidjICMiLVjClw0IofhV
	fjQ5rMqV9Jgc/c9K7vlwH16rue2lRE0I3j9I3bTbjUtVMJZ5c/+cFNfPTXG31foTMgxL
	yJfW3idIXyo/f/VF9hW3EuDRmZ+d/xV3Edf74gqXbjUxnp6gN2IfdUlxHUmlRlZs3+i8
	E28w==
X-Received: by 10.195.13.76 with SMTP id ew12mr5828877wjd.80.1396372454145;
	Tue, 01 Apr 2014 10:14:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t44sm41871493eeo.6.2014.04.01.10.14.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:16 +0200
Message-Id: <1396372434-10710-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/46] eve: adapt to webkit-efl changes
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/eve/adapt-to-webkit-efl-changes.patch      | 94 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/eve_svn.bb                |  4 +-
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch

diff --git a/meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch b/meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch
new file mode 100644
index 0000000..5e03f85
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch
@@ -0,0 +1,94 @@
+WIP: just fixes the build, probably doesn't render correctly
+
+https://trac.webkit.org/changeset/164168
+removed cairo.h from public headers and ewk_view_paint_contents
+
+https://trac.webkit.org/changeset/162581
+removed ewk_view_pre_render methods (with whole tiled support)
+
+https://git.enlightenment.org/core/elementary.git/commit/?id=0e465290be2016f12adcbc8c8d74645b3e6a1d9a
+ewk_view_tiled_smart_set is gone and ewk_view_single_smart_set is ewk_view_smart_set
+
+Index: src/bin/chrome.c
+===================================================================
+--- a/src/bin/chrome.c	(revision 84579)
++++ b/src/bin/chrome.c	(working copy)
+@@ -5,6 +5,8 @@
+ #include <stdio.h>
+ #include <string.h>
+ 
++#include <cairo.h>
++
+ #include <Eina.h>
+ #include <Elementary.h>
+ 
+@@ -1997,7 +1999,7 @@
+    if (cairo_status(cairo) != CAIRO_STATUS_SUCCESS)
+       goto error_cairo_create;
+ 
+-   if (!ewk_view_paint_contents(priv, cairo, &rect))
++   if (!ewk_view_screenshot_contents_get(priv, &rect, 1))
+      {
+         evas_object_del(img);
+         img = NULL;
+Index: src/bin/view.c
+===================================================================
+--- a/src/bin/view.c	(revision 84579)
++++ b/src/bin/view.c	(working copy)
+@@ -335,7 +335,7 @@
+    h *= 2;
+ 
+    INF("load finished, pre-render %d,%d+%dx%d at %0.2f", x, y, w, h, zoom);
+-   ewk_view_pre_render_region(view, x, y, w, h, zoom);
++   //ewk_view_pre_render_region(view, x, y, w, h, zoom);
+ }
+ 
+ /* stop animators, we changed page */
+@@ -435,7 +435,7 @@
+ 
+    INF("pre-render region %d,%d+%dx%d at %0.2f (viewport=%d,%d+%dx%d)",
+        px, py, pw, ph, zoom, x, y, w, h);
+-   ewk_view_pre_render_region(sd->base.self, px, py, pw, ph, zoom);
++   //ewk_view_pre_render_region(sd->base.self, px, py, pw, ph, zoom);
+ }
+ 
+ static unsigned int
+@@ -611,7 +611,7 @@
+ 
+    sd->pan.last_move = *p;
+ 
+-   ewk_view_pre_render_cancel(sd->base.self);
++   //ewk_view_pre_render_cancel(sd->base.self);
+ 
+    /* register function to collect samples and apply scrolls at fixed interval*/
+    if (!sd->animator.pan)
+@@ -816,7 +816,7 @@
+    Evas_Coord cw, ch, vw, vh;
+    float z, zx, zy;
+ 
+-   ewk_view_pre_render_cancel(sd->base.self);
++   //ewk_view_pre_render_cancel(sd->base.self);
+ 
+    /* remember starting point so we have a reference */
+    sd->zoom.start.zoom = ewk_frame_page_zoom_get(frame);
+@@ -1512,17 +1512,9 @@
+         /* create ewk_view_single subclass, this is done only once! */
+         static Ewk_View_Smart_Class api = EWK_VIEW_SMART_CLASS_INIT_NAME_VERSION("EWK_View_Demo");
+ 
+-        /* set current and parent apis to vanilla ewk_view_single methods */
+-        if (bs == BACKING_STORE_TILED)
+-          {
+-             ewk_view_tiled_smart_set(&api);
+-             ewk_view_tiled_smart_set(&_parent_sc);
+-          }
+-        else
+-          {
+-             ewk_view_single_smart_set(&api);
+-             ewk_view_single_smart_set(&_parent_sc);
+-          }
++        /* set current and parent apis to vanilla ewk_view methods */
++        ewk_view_smart_set(&api);
++        ewk_view_smart_set(&_parent_sc);
+ 
+         /* override methods we want custom behavior */
+         api.sc.add = _view_smart_add;
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 5845c2d..869f8bf 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -12,7 +12,9 @@ COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+    file://adapt-to-webkit-efl-changes.patch \
+"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_configure_prepend() {
-- 
1.9.1


