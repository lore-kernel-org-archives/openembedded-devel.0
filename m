Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpiE-0002bI-L9
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:14 +0200
Received: by wibhq4 with SMTP id hq4so1195192wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Q9PQ/Zb7oTfoeCykmCfVqS9r18StIXyKgTogbX1nwno=;
	b=OH1t/LRKKqTjanqm/ASk2zTBJtFmyR6eihpnSlYg0I2CZI+h8bPY0oBw+TV1c92ks9
	5tcJ+R0xKIcV6nnS72BsHjtTaNNT+XIl4kfW7ACDOiYPPen5axDQQPBUH5J1efNYX2UR
	+qNCTwZutL9RQyLX6byvoC3HXj+nb5aclbIHG/9zB2KPDWCxKqyYRc5GwiscpKXUDH44
	xGbTENfJaO9OLfi7IHCz7NW76WrXVkgjzVedBHWchsSh8kawA/reeOL00HXLD24yNb1j
	1vaElyBlmh1x/wcWGv2IyEGv8yCNsfjbe42QZtRP6MOjtdc2tD+M39LiMABM57fE+Ky9
	PHjw==
Received: by 10.180.93.68 with SMTP id cs4mr6116451wib.14.1344606325123;
	Fri, 10 Aug 2012 06:45:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm7838341wiz.4.2012.08.10.06.45.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:08 +0200
Message-Id: <e544b53522b39b2c04b8d881f18fde6973b992fb.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 13/46] eve: drop patch applied upstream
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../eve/0001-eve-update-for-newer-webkit-efl.patch |   38 --------------------
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 -
 2 files changed, 0 insertions(+), 40 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch

diff --git a/meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch b/meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
deleted file mode 100644
index a1f14df..0000000
--- a/meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7c25cbf1901e9be1c0bebca6c9bcaa79dbbdf849 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 18 Jul 2012 17:54:50 +0200
-Subject: [PATCH] eve: update for newer webkit-efl
-
-* ewk_settings_icon_database_icon_object_add was renamed to ewk_settings_icon_database_icon_object_get
-  in webkit r113173 (see https://bugs.webkit.org/show_bug.cgi?id=82438)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/bin/chrome.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/bin/chrome.c b/src/bin/chrome.c
-index e402cad..ee8f0c4 100644
---- a/src/bin/chrome.c
-+++ b/src/bin/chrome.c
-@@ -985,7 +985,7 @@ _chrome_state_apply(Evas_Object *chrome, Evas_Object *view)
-    if (old_icon) evas_object_del(old_icon);
-    if (url)
-      {
--        favicon = ewk_settings_icon_database_icon_object_add(url, canvas);
-+        favicon = ewk_settings_icon_database_icon_object_get(url, canvas);
-         if (favicon)
-            elm_object_part_content_set(text_url, "icon", favicon);
-      }
-@@ -2456,7 +2456,7 @@ more_content_get(void *data, Evas_Object *obj, const char *part)
-           {
-              Evas_Object *chrome = evas_object_data_get(obj, "chrome");
-              Evas *canvas = evas_object_evas_get(chrome);
--             icon = ewk_settings_icon_database_icon_object_add(mmi->next, canvas);
-+             icon = ewk_settings_icon_database_icon_object_get(mmi->next, canvas);
-           }
-         return icon;
-      }
--- 
-1.7.8.6
-
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 9528ff3..d760c4a 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -3,7 +3,6 @@ LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
-PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
@@ -15,7 +14,6 @@ do_configure_prepend() {
 }
 
 SRC_URI += "file://eve-theme-for-smaller-screens.patch \
-  file://0001-eve-update-for-newer-webkit-efl.patch \
 "
 
 EXTRA_OECONF = "\
-- 
1.7.8.6



