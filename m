Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6HG-0006fd-Ro
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:36:38 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uYAhmmAeJH5KCRM4FTUUL2sQ/TXMNrwBdO7w6oCEPzQ=;
	b=XUN/hhMlQ61jxWucXktiwNH6jl9JB/SAvQfZxDGN4KhIswatHYcTNwoowr9FEe3aFl
	N+Elnv2oQChbovLs/OkUsHDTj2bpSUG00owYTyEb2yeWdgKiNrTx2qHqgzPuL0jApbWt
	HwYAqgC1AqnOjwESsumbwgK/FqBSoCgsvs1ZI=
Received: by 10.223.61.138 with SMTP id t10mr12976506fah.20.1319884238290;
	Sat, 29 Oct 2011 03:30:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm23346258fae.16.2011.10.29.03.30.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:30:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:08 +0200
Message-Id: <80e083564f1c33169626c79f52b15fe54f64c01d.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 12/12] elfe: add another patch to fix API changes
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
X-List-Received-Date: Sat, 29 Oct 2011 10:37:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...update-again-to-even-newer-elementary-API.patch |  105 ++++++++++++++++++++
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +
 2 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newer-elementary-API.patch

diff --git a/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newer-elementary-API.patch b/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newer-elementary-API.patch
new file mode 100644
index 0000000..ad1c259
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newer-elementary-API.patch
@@ -0,0 +1,105 @@
+From d3a6b1e06165bf01b2dfc364e6820fc5e8a530a7 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Oct 2011 12:00:32 +0200
+Subject: [PATCH] elfe: update again to even newer elementary API
+
+Upstream-Status: Submitted
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ E-MODULES-EXTRA/elfe/src/desktop.c |    8 ++++----
+ E-MODULES-EXTRA/elfe/src/dock.c    |    2 +-
+ E-MODULES-EXTRA/elfe/src/main.c    |    4 ++--
+ E-MODULES-EXTRA/elfe/src/winlist.c |    6 +++---
+ 4 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/E-MODULES-EXTRA/elfe/src/desktop.c b/E-MODULES-EXTRA/elfe/src/desktop.c
+index e833f54..5b14f9a 100644
+--- a/E-MODULES-EXTRA/elfe/src/desktop.c
++++ b/E-MODULES-EXTRA/elfe/src/desktop.c
+@@ -333,7 +333,7 @@ _dock_allapps_clicked_cb(void *data , Evas_Object *obj __UNUSED__, void *event_i
+ 	     evas_object_smart_callback_add(desk->allapps, "gadget,longpressed", _gadget_longpressed_cb, desk);
+ 	     evas_object_smart_callback_add(desk->allapps, "item,selected", _allapps_item_selected_cb, desk);
+ 	     evas_object_show(desk->allapps);
+-	     elm_layout_content_set(desk->layout, "elfe.swallow.allapps", desk->allapps);
++	     elm_object_content_part_set(desk->layout, "elfe.swallow.allapps", desk->allapps);
+ 	  }
+ 
+ 	o_edje = elm_layout_edje_get(desk->layout);
+@@ -493,9 +493,9 @@ elfe_desktop_add(Evas_Object *parent, E_Zone *zone)
+ 
+    evas_object_data_set(desk->layout, "elfe_desktop", desk);
+ 
+-   elm_layout_content_set(desk->layout, "elfe.swallow.content", desk->sc);
+-   elm_layout_content_set(desk->layout, "elfe.swallow.selector", desk->selector);
+-   elm_layout_content_set(desk->layout, "elfe.swallow.dock", desk->dock);
++   elm_object_content_part_set(desk->layout, "elfe.swallow.content", desk->sc);
++   elm_object_content_part_set(desk->layout, "elfe.swallow.selector", desk->selector);
++   elm_object_content_part_set(desk->layout, "elfe.swallow.dock", desk->dock);
+ 
+    return desk->layout;
+ 
+diff --git a/E-MODULES-EXTRA/elfe/src/dock.c b/E-MODULES-EXTRA/elfe/src/dock.c
+index 9375792..2fa97ff 100644
+--- a/E-MODULES-EXTRA/elfe/src/dock.c
++++ b/E-MODULES-EXTRA/elfe/src/dock.c
+@@ -261,7 +261,7 @@ elfe_dock_add(Evas_Object *parent)
+    evas_object_show(dock->edje);
+    evas_object_data_set(dock->edje, "dock", dock);
+ 
+-   elm_layout_content_set(dock->edje, "elfe.swallow.content", dock->table);
++   elm_object_content_part_set(dock->edje, "elfe.swallow.content", dock->table);
+ 
+    return dock->edje;
+ }
+diff --git a/E-MODULES-EXTRA/elfe/src/main.c b/E-MODULES-EXTRA/elfe/src/main.c
+index 8237e58..46863f5 100644
+--- a/E-MODULES-EXTRA/elfe/src/main.c
++++ b/E-MODULES-EXTRA/elfe/src/main.c
+@@ -208,10 +208,10 @@ _elfe_home_win_new(E_Zone *zone)
+ 
+    elm_scroller_content_set(hwin->bg_scroller, hwin->o_bg);
+    evas_object_show(hwin->bg_scroller);
+-   elm_layout_content_set(hwin->layout, "elfe.swallow.background", hwin->bg_scroller);
++   elm_object_content_part_set(hwin->layout, "elfe.swallow.background", hwin->bg_scroller);
+ 
+    hwin->desktop = elfe_desktop_add(hwin->layout, hwin->zone);
+-   elm_layout_content_set(hwin->layout, "elfe.swallow.desktop", hwin->desktop);
++   elm_object_content_part_set(hwin->layout, "elfe.swallow.desktop", hwin->desktop);
+    evas_object_smart_callback_add(hwin->desktop, "scroll", _scroll_anim_cb, hwin);
+ 
+ 
+diff --git a/E-MODULES-EXTRA/elfe/src/winlist.c b/E-MODULES-EXTRA/elfe/src/winlist.c
+index cd4b813..236f878 100644
+--- a/E-MODULES-EXTRA/elfe/src/winlist.c
++++ b/E-MODULES-EXTRA/elfe/src/winlist.c
+@@ -298,7 +298,7 @@ _transit_win_anim_del_cb(void *data, Elm_Transit *transit)
+ {
+    Elfe_Winlist_Item *it = data;
+ 
+-   elm_layout_content_set(it->layout, "elfe.swallow.content", it->win);
++   elm_object_content_part_set(it->layout, "elfe.swallow.content", it->win);
+    if (it->bd->client.netwm.name)
+      elm_object_text_part_set(it->layout, "elfe.text.label",
+                               it->bd->client.netwm.name);
+@@ -489,7 +489,7 @@ _elfe_action(const char *params, int modifiers, int method)
+ 	elm_scroller_policy_set(sc, ELM_SCROLLER_POLICY_OFF, ELM_SCROLLER_POLICY_OFF);
+ 	elm_scroller_page_relative_set(sc, 1.0, 1.0);
+ 	evas_object_show(sc);
+-        elm_layout_content_set(winlist->layout, "elfe.swallow.windows", sc);
++        elm_object_content_part_set(winlist->layout, "elfe.swallow.windows", sc);
+ 
+ 	bx = elm_box_add(sc);
+ 	evas_object_size_hint_weight_set(bx, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
+@@ -611,7 +611,7 @@ _elfe_action(const char *params, int modifiers, int method)
+              evas_object_size_hint_aspect_set(item->placeholder,
+                                               EVAS_ASPECT_CONTROL_BOTH,
+                                               cw->bd->w/2, cw->bd->h/2);
+-             elm_layout_content_set(layout, "elfe.swallow.content", item->placeholder);
++             elm_object_content_part_set(layout, "elfe.swallow.content", item->placeholder);
+              elm_table_pack(tb, item->layout, 1, 1, 1, 1);
+              evas_object_show(item->placeholder);
+              evas_object_event_callback_add(item->placeholder, EVAS_CALLBACK_RESIZE, _item_layout_resize_cb, item);
+-- 
+1.7.7.1
+
diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 151ef7e..5b703dc 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -5,4 +5,6 @@ PR = "${INC_PR}.1"
 
 require e-module.inc
 
+SRC_URI += "file://0001-elfe-update-again-to-even-newer-elementary-API.patch"
+
 DEPENDS += "elementary"
-- 
1.7.7.1



