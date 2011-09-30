Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R9jXi-0003DA-E8
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 22:18:46 +0200
Received: (qmail invoked by alias); 30 Sep 2011 20:13:15 -0000
Received: from p5B0A3E6C.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.62.108]
	by mail.gmx.net (mp011) with SMTP; 30 Sep 2011 22:13:15 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19iutlhtqBiMrr/R6l8CwSl/BBFKGXqZVdV+QAEJD
	43sgjc7G1amfVn
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 22:17:10 +0200
Message-Id: <1317413831-3451-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1317413831-3451-1-git-send-email-schnitzeltony@gmx.de>
References: <1317413831-3451-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe V2 1/2] midori: update to 0.4.0 / buildable by upstream patch & LDFLAGS_append / minor cleanup
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
X-List-Received-Date: Fri, 30 Sep 2011 20:18:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* LDFLAGS_append was suggested by Bernhard Guillon [1]
* run tested on overo

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/034748.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |    5 +-
 .../midori/midori/speeddial.patch                  |   35 -----------
 .../midori/use_dom_api_to_get_selected_text.patch  |   60 ++++++++++++++++++++
 meta-oe/recipes-connectivity/midori/midori/waf     |  Bin 75695 -> 0 bytes
 .../recipes-connectivity/midori/midori_0.3.6.bb    |   11 ----
 .../recipes-connectivity/midori/midori_0.4.0.bb    |   11 ++++
 6 files changed, 73 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori/speeddial.patch
 create mode 100644 meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch
 delete mode 100755 meta-oe/recipes-connectivity/midori/midori/waf
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.3.6.bb
 create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.0.bb

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 2691a0d..60fd03e 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -6,9 +6,6 @@ DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native pyth
 
 inherit gtk-icon-cache pkgconfig
 
-SRC_URI = "http://archive.xfce.org/src/apps/midori/0.2/midori-${PV}.tar.bz2;name=midori \
-"
-
 do_configure() {
     sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
     ./configure \
@@ -27,6 +24,8 @@ do_configure() {
             --disable-hildon \
 }
 
+LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
+
 do_install() {
 	oe_runmake DESTDIR=${D} install
 }
diff --git a/meta-oe/recipes-connectivity/midori/midori/speeddial.patch b/meta-oe/recipes-connectivity/midori/midori/speeddial.patch
deleted file mode 100644
index ba436a2..0000000
--- a/meta-oe/recipes-connectivity/midori/midori/speeddial.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7f549b89a9e9939a7888d9e4ede628ef9c80df80 Mon Sep 17 00:00:00 2001
-From: Christian Dywan <christian@twotoasts.de>
-Date: Fri, 20 May 2011 19:58:35 +0000
-Subject: Handle missing speedial.json and missing shortcuts array
-
----
-diff --git a/midori/main.c b/midori/main.c
-index 007b03f..c6b8568 100644
---- a/midori/main.c
-+++ b/midori/main.c
-@@ -1605,7 +1605,12 @@ speeddial_new_from_file (const gchar* config,
-     }
- 
-     katze_assign (config_file, g_build_filename (config, "speeddial.json", NULL));
--    g_file_get_contents (config_file, &json_content, &json_length, NULL);
-+    if (!g_file_get_contents (config_file, &json_content, &json_length, NULL))
-+    {
-+        katze_assign (json_content, g_strdup ("'{}'"));
-+        json_length = strlen ("'{}'");
-+    }
-+
-     script = g_string_sized_new (json_length);
-     g_string_append (script, "var json = JSON.parse (");
-     g_string_append_len (script, json_content, json_length);
-@@ -1619,7 +1624,7 @@ speeddial_new_from_file (const gchar* config,
-         "        +  'title=' + tile['title'] + '\\n\\n';"
-         "} "
-         "var columns = json['width'] ? json['width'] : 3;"
--        "var rows = json['shortcuts'].length / columns;"
-+        "var rows = json['shortcuts'] ? json['shortcuts'].length / columns : 0;"
-         "keyfile += '[settings]\\n'"
-         "        +  'columns=' + columns + '\\n'"
-         "        +  'rows=' + (rows > 3 ? rows : 3) + '\\n\\n';"
---
-cgit 
diff --git a/meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch b/meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch
new file mode 100644
index 0000000..c7bb566
--- /dev/null
+++ b/meta-oe/recipes-connectivity/midori/midori/use_dom_api_to_get_selected_text.patch
@@ -0,0 +1,60 @@
+From 648d869e4ff69f121da97484a0fd553b005ca751 Mon Sep 17 00:00:00 2001
+From: Christian Dywan <christian@twotoasts.de>
+Date: Wed, 21 Sep 2011 21:50:51 +0000
+Subject: Use DOM API to get selected text in WebKitGTK+ 1.5.1
+
+Fixes: https://bugs.launchpad.net/midori/+bug/799603
+---
+diff --git a/midori/midori-view.c b/midori/midori-view.c
+index 0d7a96e..e426e7f 100644
+--- a/midori/midori-view.c
++++ b/midori/midori-view.c
+@@ -39,9 +39,11 @@
+     #include <sys/utsname.h>
+ #endif
+ 
++#if !WEBKIT_CHECK_VERSION (1, 5, 1)
+ /* This is unstable API, so we need to declare it */
+ gchar*
+ webkit_web_view_get_selected_text (WebKitWebView* web_view);
++#endif
+ 
+ static void
+ midori_view_construct_web_view (MidoriView* view);
+@@ -4167,10 +4169,33 @@ midori_view_get_link_uri (MidoriView* view)
+ gboolean
+ midori_view_has_selection (MidoriView* view)
+ {
++#if WEBKIT_CHECK_VERSION (1, 5, 1)
++    WebKitDOMDocument* doc;
++    WebKitDOMDOMWindow* window;
++    WebKitDOMDOMSelection* selection;
++    WebKitDOMRange* range;
++#endif
++
+     g_return_val_if_fail (MIDORI_IS_VIEW (view), FALSE);
+ 
++
++#if WEBKIT_CHECK_VERSION (1, 5, 1)
++    doc = webkit_web_view_get_dom_document (WEBKIT_WEB_VIEW (view->web_view));
++    window = webkit_dom_document_get_default_view (doc);
++    selection = webkit_dom_dom_window_get_selection (window);
++    if (selection == NULL)
++        return FALSE;
++
++    range = webkit_dom_dom_selection_get_range_at (selection, 0, NULL);
++    if (range == NULL)
++        return FALSE;
++
++    katze_assign (view->selected_text, webkit_dom_range_get_text (range));
++#else
+     katze_assign (view->selected_text, webkit_web_view_get_selected_text (
+         WEBKIT_WEB_VIEW (view->web_view)));
++#endif
++
+     if (view->selected_text && *view->selected_text)
+         return TRUE;
+     else
+--
+cgit 
+
diff --git a/meta-oe/recipes-connectivity/midori/midori/waf b/meta-oe/recipes-connectivity/midori/midori/waf
deleted file mode 100755
index a22ad09a741dadb0c3341468d8b636d1dc055f14..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 75695
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

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.3.6.bb b/meta-oe/recipes-connectivity/midori/midori_0.3.6.bb
deleted file mode 100644
index 2393913..0000000
--- a/meta-oe/recipes-connectivity/midori/midori_0.3.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require midori.inc
-
-PR = "r1"
-
-SRC_URI = "http://archive.xfce.org/src/apps/midori/0.3/midori-${PV}.tar.bz2;name=midori \
-           file://speeddial.patch \
-          "
-SRC_URI[midori.md5sum] = "c4cb0686601b1c470c317de3d3f8e8fd"
-SRC_URI[midori.sha256sum] = "5fb290ffde81e5e6b39a54d286f5732496bfda10ff65019189cc6bf8408f2410"
-
-
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.0.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.0.bb
new file mode 100644
index 0000000..1291fd2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.0.bb
@@ -0,0 +1,11 @@
+require midori.inc
+
+PR = "r0"
+
+SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
+           file://use_dom_api_to_get_selected_text.patch \
+          "
+SRC_URI[midori.md5sum] = "14aa14ccabf3d003903f1584dab15d7a"
+SRC_URI[midori.sha256sum] = "0ac31b008b44e08cf0536a38405a0ecc2da7c28e3d549915325dbba74f74cd75"
+
+
-- 
1.7.4.4



