Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1v7-00074K-Hx
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:10:49 +0200
Received: by weyr6 with SMTP id r6so3663605wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AjJoebNk/gQ4IgKOzpk/vUAj7p7k7pZpWyP5W4gh/bg=;
	b=wRaOebUt+I+pyoKGPFO4g+eia2zjVFRpbP4GvzCF4q0pP1qJ7rTV6PrVEt1v5B2WWk
	xEVoX6OPPfCgdleFdrriFEz6WTfJ0znG89/+jGaeI7P5tIb+BzWF6v1T4Kp/BxqPt/iT
	bSpflkXBmQP311bMnVB+tM9VGeFBqZ1MKXl0nVtFpNk0Gq0FjQME3zxlGssRRHHGjT7c
	reltzdsk5er5POItdTNqLlY2sHPeq324VGGHy/9K1HIc6vmqjOxLd5wOT5MScDTwaK7k
	LfkbN0Pb0QZqJ3oxeokjFnbQLsXbFHdQfX13pkCS5qR3K5Dlgq/ckOmb6MIhO92Q2tFQ
	gcPQ==
Received: by 10.180.92.194 with SMTP id co2mr2678661wib.12.1343699953308;
	Mon, 30 Jul 2012 18:59:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm28796871wiy.4.2012.07.30.18.59.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:33 +0200
Message-Id: <4e953c2f6644c9ed3061f660fed94767c1db9f5c.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/24] eve: add patch to build against newer webkit-efl
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
X-List-Received-Date: Tue, 31 Jul 2012 02:10:49 -0000

* otherwise fails at runtime:
CRI<627>: /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/webkit-efl-1.9.5+svnr120144-r0/src/Source/WebKit/efl/ewk/ewk_view.cpp:1264 ewk_view_base_smart_set() Ewk_View_Smart_Class 0x617f00 is version 4 while 5 was expected.
CRI<627>: /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/webkit-efl-1.9.5+svnr120144-r0/src/Source/WebKit/efl/ewk/ewk_view.cpp:1264 ewk_view_base_smart_set() Ewk_View_Smart_Class 0x6180c0 is version 4 while 5 was expected.
eve[627]: segfault at 0 ip           (null) sp 00007fff7ee1fb18 error 14 in eve[400000+18000]
Segmentation fault

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../eve/0001-eve-update-for-newer-webkit-efl.patch |   38 ++++++++++++++++++++
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 +
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch

diff --git a/meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch b/meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
new file mode 100644
index 0000000..a1f14df
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
@@ -0,0 +1,38 @@
+From 7c25cbf1901e9be1c0bebca6c9bcaa79dbbdf849 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 18 Jul 2012 17:54:50 +0200
+Subject: [PATCH] eve: update for newer webkit-efl
+
+* ewk_settings_icon_database_icon_object_add was renamed to ewk_settings_icon_database_icon_object_get
+  in webkit r113173 (see https://bugs.webkit.org/show_bug.cgi?id=82438)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/bin/chrome.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/bin/chrome.c b/src/bin/chrome.c
+index e402cad..ee8f0c4 100644
+--- a/src/bin/chrome.c
++++ b/src/bin/chrome.c
+@@ -985,7 +985,7 @@ _chrome_state_apply(Evas_Object *chrome, Evas_Object *view)
+    if (old_icon) evas_object_del(old_icon);
+    if (url)
+      {
+-        favicon = ewk_settings_icon_database_icon_object_add(url, canvas);
++        favicon = ewk_settings_icon_database_icon_object_get(url, canvas);
+         if (favicon)
+            elm_object_part_content_set(text_url, "icon", favicon);
+      }
+@@ -2456,7 +2456,7 @@ more_content_get(void *data, Evas_Object *obj, const char *part)
+           {
+              Evas_Object *chrome = evas_object_data_get(obj, "chrome");
+              Evas *canvas = evas_object_evas_get(chrome);
+-             icon = ewk_settings_icon_database_icon_object_add(mmi->next, canvas);
++             icon = ewk_settings_icon_database_icon_object_get(mmi->next, canvas);
+           }
+         return icon;
+      }
+-- 
+1.7.8.6
+
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index d760c4a..9528ff3 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
@@ -14,6 +15,7 @@ do_configure_prepend() {
 }
 
 SRC_URI += "file://eve-theme-for-smaller-screens.patch \
+  file://0001-eve-update-for-newer-webkit-efl.patch \
 "
 
 EXTRA_OECONF = "\
-- 
1.7.8.6



