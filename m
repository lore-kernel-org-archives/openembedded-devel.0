Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RD9FX-0007xe-Ns
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 08:22:07 +0200
Received: (qmail invoked by alias); 10 Oct 2011 06:16:27 -0000
Received: from p5B0A1A7F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.26.127]
	by mail.gmx.net (mp042) with SMTP; 10 Oct 2011 08:16:27 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18GQXZTFrEGiVbNyOSBCRQZNPkW8u4BUU+IlUK2HO
	8m8Wbagcd9wKdS
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Oct 2011 08:20:51 +0200
Message-Id: <1318227651-11918-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] midori: update to 0.4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2011 06:22:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

minor cleanups:
* remove r0
* pack all files

Run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |    2 +
 .../midori/use_dom_api_to_get_selected_text.patch  |   60 --------------------
 .../recipes-connectivity/midori/midori_0.4.0.bb    |   11 ----
 .../recipes-connectivity/midori/midori_0.4.1.bb    |    8 +++
 4 files changed, 10 insertions(+), 71 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.0.bb
 create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.1.bb

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 2221134..3f33863 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -32,4 +32,6 @@ do_install() {
 
 RRECOMMENDS_${PN} += "glib-networking"
 
+FILES_${PN}-dev += "${datadir}/vala/vapi"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch b/meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch
deleted file mode 100644
index c7bb566..0000000
--- a/meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 648d869e4ff69f121da97484a0fd553b005ca751 Mon Sep 17 00:00:00 2001
-From: Christian Dywan <christian@twotoasts.de>
-Date: Wed, 21 Sep 2011 21:50:51 +0000
-Subject: Use DOM API to get selected text in WebKitGTK+ 1.5.1
-
-Fixes: https://bugs.launchpad.net/midori/+bug/799603
----
-diff --git a/midori/midori-view.c b/midori/midori-view.c
-index 0d7a96e..e426e7f 100644
---- a/midori/midori-view.c
-+++ b/midori/midori-view.c
-@@ -39,9 +39,11 @@
-     #include <sys/utsname.h>
- #endif
- 
-+#if !WEBKIT_CHECK_VERSION (1, 5, 1)
- /* This is unstable API, so we need to declare it */
- gchar*
- webkit_web_view_get_selected_text (WebKitWebView* web_view);
-+#endif
- 
- static void
- midori_view_construct_web_view (MidoriView* view);
-@@ -4167,10 +4169,33 @@ midori_view_get_link_uri (MidoriView* view)
- gboolean
- midori_view_has_selection (MidoriView* view)
- {
-+#if WEBKIT_CHECK_VERSION (1, 5, 1)
-+    WebKitDOMDocument* doc;
-+    WebKitDOMDOMWindow* window;
-+    WebKitDOMDOMSelection* selection;
-+    WebKitDOMRange* range;
-+#endif
-+
-     g_return_val_if_fail (MIDORI_IS_VIEW (view), FALSE);
- 
-+
-+#if WEBKIT_CHECK_VERSION (1, 5, 1)
-+    doc = webkit_web_view_get_dom_document (WEBKIT_WEB_VIEW (view->web_view));
-+    window = webkit_dom_document_get_default_view (doc);
-+    selection = webkit_dom_dom_window_get_selection (window);
-+    if (selection == NULL)
-+        return FALSE;
-+
-+    range = webkit_dom_dom_selection_get_range_at (selection, 0, NULL);
-+    if (range == NULL)
-+        return FALSE;
-+
-+    katze_assign (view->selected_text, webkit_dom_range_get_text (range));
-+#else
-     katze_assign (view->selected_text, webkit_web_view_get_selected_text (
-         WEBKIT_WEB_VIEW (view->web_view)));
-+#endif
-+
-     if (view->selected_text && *view->selected_text)
-         return TRUE;
-     else
---
-cgit 
-
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.0.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.0.bb
deleted file mode 100644
index 1291fd2..0000000
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require midori.inc
-
-PR = "r0"
-
-SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
-           file://use_dom_api_to_get_selected_text.patch \
-          "
-SRC_URI[midori.md5sum] = "14aa14ccabf3d003903f1584dab15d7a"
-SRC_URI[midori.sha256sum] = "0ac31b008b44e08cf0536a38405a0ecc2da7c28e3d549915325dbba74f74cd75"
-
-
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
new file mode 100644
index 0000000..2805b92
--- /dev/null
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
@@ -0,0 +1,8 @@
+require midori.inc
+
+SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
+          "
+SRC_URI[midori.md5sum] = "33dde203cd71ae2b1d2adcc7f5739f65"
+SRC_URI[midori.sha256sum] = "b3c77ddb6f562a0ea3d2e6fbb756ca0dc158ad8410f4b60f8e5998c2f7305f07"
+
+
-- 
1.7.4.4



