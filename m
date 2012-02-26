Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ZBa-00083C-Of
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 09:10:26 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so160716eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 00:02:04 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.19.194 as permitted sender) client-ip=10.213.19.194; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.19.194 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.19.194])
	by 10.213.19.194 with SMTP id c2mr2634623ebb.113.1330243324415
	(num_hops = 1); Sun, 26 Feb 2012 00:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8Nd9YtE+S+2TlCsWbpcFhSiP6j56SIrEiNaKZgd/B6o=;
	b=dtSRaps2lM9YujzZvz7rskPgxVm2JuYOp/Me6Kw3inno47bo5xr+h+k/6VypoO946w
	JQC8oZ2I1xPMoenP4vOwDqkLMyrLAZWzsOqmdavKW3DRtJplvOlUNmF3gZew8/ex+WsO
	Gabt140f38tvLbUwBreCXENJjvWnp5z/EESP8=
Received: by 10.213.19.194 with SMTP id c2mr1992700ebb.113.1330243324195;
	Sun, 26 Feb 2012 00:02:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r5sm29492527eef.6.2012.02.26.00.02.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 00:02:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 09:01:33 +0100
Message-Id: <1772d999c27106a9e4e3be5a0893d11261c7e789.1330243124.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
References: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330243124.git.Martin.Jansa@gmail.com>
References: <cover.1330243124.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/5] e-tasks: addapt to newer elementary
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
X-List-Received-Date: Sun, 26 Feb 2012 08:10:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e-tasks/0001-depend-on-eina-not-eina-0.patch   |   26 ++
 ...mentary-genlist_item_insert_before-API-c.patch} |   23 ++-
 ...API.patch => 0003-adapt-to-newer-elm-API.patch} |    8 +-
 ....patch => 0004-fix-changed-callback-name.patch} |    8 +-
 .../e-tasks/0005-adapt-to-even-newer-elm-API.patch |  182 ++++++++++++
 .../e17/e-tasks/0006-remove-deprecated-API.patch   |  296 ++++++++++++++++++++
 .../e17/e-tasks/0007-db_sqlite-fix-warning.patch   |   35 +++
 ...-warning-about-incompatible-pointer-types.patch |   79 ++++++
 .../recipes-efl/e17/e-tasks/depends.eina.patch     |   12 -
 meta-efl/recipes-efl/e17/e-tasks_svn.bb            |   15 +-
 10 files changed, 654 insertions(+), 30 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-depend-on-eina-not-eina-0.patch
 rename meta-efl/recipes-efl/e17/e-tasks/{genlist_item_insert_before.api.patch => 0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch} (41%)
 rename meta-efl/recipes-efl/e17/e-tasks/{0001-adapt-to-newer-elm-API.patch => 0003-adapt-to-newer-elm-API.patch} (99%)
 rename meta-efl/recipes-efl/e17/e-tasks/{0001-fix-changed-callback-name.patch => 0004-fix-changed-callback-name.patch} (88%)
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0005-adapt-to-even-newer-elm-API.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0006-remove-deprecated-API.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0007-db_sqlite-fix-warning.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0008-fix-warning-about-incompatible-pointer-types.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/depends.eina.patch

diff --git a/meta-efl/recipes-efl/e17/e-tasks/0001-depend-on-eina-not-eina-0.patch b/meta-efl/recipes-efl/e17/e-tasks/0001-depend-on-eina-not-eina-0.patch
new file mode 100644
index 0000000..a514bd2
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0001-depend-on-eina-not-eina-0.patch
@@ -0,0 +1,26 @@
+From ced1e0e6e0e7b80ad4e9b9766e0a132dc97d6bb6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 20:54:31 +0100
+Subject: [PATCH 1/8] depend on eina not eina-0
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c0a5697..0b67de8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,7 +15,7 @@ AC_HEADER_STDC
+ 
+ AM_PROG_LIBTOOL
+ 
+-PKG_CHECK_MODULES(TASKS, [elementary eina-0 dbus-1 sqlite3])
++PKG_CHECK_MODULES(TASKS, [elementary eina dbus-1 sqlite3])
+ 
+ AC_OUTPUT([
+ Makefile
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks/genlist_item_insert_before.api.patch b/meta-efl/recipes-efl/e17/e-tasks/0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch
similarity index 41%
rename from meta-efl/recipes-efl/e17/e-tasks/genlist_item_insert_before.api.patch
rename to meta-efl/recipes-efl/e17/e-tasks/0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch
index 72ccc19..fbc5851 100644
--- a/meta-efl/recipes-efl/e17/e-tasks/genlist_item_insert_before.api.patch
+++ b/meta-efl/recipes-efl/e17/e-tasks/0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch
@@ -1,9 +1,19 @@
-adapt to elementary genlist_item_insert_before API change from r55869
+From 80893c65d5ea68f18e26169323a62eeac14ae177 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 20:53:48 +0100
+Subject: [PATCH 2/8] adapt to elementary genlist_item_insert_before API
+ change from r55869
 
-diff -uNr trunk2/src/gui.c trunk/src/gui.c
---- trunk2/src/gui.c	2010-02-01 07:56:03.000000000 +0100
-+++ trunk/src/gui.c	2011-01-30 00:36:15.000000000 +0100
-@@ -1067,7 +1067,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/gui.c b/src/gui.c
+index 113c807..f58dcd6 100644
+--- a/src/gui.c
++++ b/src/gui.c
+@@ -1067,7 +1067,7 @@ void create_new_task(void *data, Evas_Object *obj, void *event_info)
  	if(strcmp(sel_category, " All Tasks ")==0) strcpy(Task[i].cat, "Personal");
  	else strcpy(Task[i].cat, sel_category);
  	if(item) { 
@@ -12,3 +22,6 @@ diff -uNr trunk2/src/gui.c trunk/src/gui.c
  								  NULL, NULL);
  	}
  	//cater for no items in list
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0001-adapt-to-newer-elm-API.patch b/meta-efl/recipes-efl/e17/e-tasks/0003-adapt-to-newer-elm-API.patch
similarity index 99%
rename from meta-efl/recipes-efl/e17/e-tasks/0001-adapt-to-newer-elm-API.patch
rename to meta-efl/recipes-efl/e17/e-tasks/0003-adapt-to-newer-elm-API.patch
index 70fa169..cf5469e 100644
--- a/meta-efl/recipes-efl/e17/e-tasks/0001-adapt-to-newer-elm-API.patch
+++ b/meta-efl/recipes-efl/e17/e-tasks/0003-adapt-to-newer-elm-API.patch
@@ -1,7 +1,7 @@
-From 1204c115e006b380c2c64452c9d35f0d695502fe Mon Sep 17 00:00:00 2001
+From 377c4266e9356239c43ac5711a06831ee74f9eef Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 6 Dec 2011 19:07:56 +0100
-Subject: [PATCH] adapt to newer elm API
+Subject: [PATCH 3/8] adapt to newer elm API
 
 * sed 's/elm_button_label_set/elm_object_text_set/g' -i src/gui.c
   sed 's/elm_button_label_set/elm_object_text_set/g' -i src/db_sqlite.c
@@ -76,7 +76,7 @@ index dfee471..fde2181 100644
  			tystr = strdup(cate);
  			evas_object_smart_callback_add(bt, "clicked", set_category, (char *)tystr);
 diff --git a/src/gui.c b/src/gui.c
-index 113c807..5c8003c 100644
+index f58dcd6..f6f1c6c 100644
 --- a/src/gui.c
 +++ b/src/gui.c
 @@ -51,11 +51,11 @@ void select_category(void *data, Evas_Object *obj, void *event_info)
@@ -652,5 +652,5 @@ index 113c807..5c8003c 100644
  	evas_object_size_hint_align_set(done_button, -1.0, -1.0);
  	elm_box_pack_end(hbox, done_button);
 -- 
-1.7.8
+1.7.8.4
 
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch b/meta-efl/recipes-efl/e17/e-tasks/0004-fix-changed-callback-name.patch
similarity index 88%
rename from meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch
rename to meta-efl/recipes-efl/e17/e-tasks/0004-fix-changed-callback-name.patch
index cf51deb..c4d5ac7 100644
--- a/meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch
+++ b/meta-efl/recipes-efl/e17/e-tasks/0004-fix-changed-callback-name.patch
@@ -1,7 +1,7 @@
-From d6d24a1776594e71ee66db78cc234f38f97f6825 Mon Sep 17 00:00:00 2001
+From 4ca9e2aac3e9f1a981b48552c3aff255863cd1fe Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 17 Dec 2011 03:12:29 +0100
-Subject: [PATCH] fix changed callback name
+Subject: [PATCH 4/8] fix changed callback name
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -10,7 +10,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/gui.c b/src/gui.c
-index 5c8003c..b032ee5 100644
+index f6f1c6c..69b06d8 100644
 --- a/src/gui.c
 +++ b/src/gui.c
 @@ -1230,7 +1230,7 @@ void edit_cat(void)
@@ -36,5 +36,5 @@ index 12072f5..116b84c 100644
  	//open database 
  	open_database();
 -- 
-1.7.8
+1.7.8.4
 
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0005-adapt-to-even-newer-elm-API.patch b/meta-efl/recipes-efl/e17/e-tasks/0005-adapt-to-even-newer-elm-API.patch
new file mode 100644
index 0000000..2ea576f
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0005-adapt-to-even-newer-elm-API.patch
@@ -0,0 +1,182 @@
+From aa1ac5f8d2133ae04099a155811b65733447e34d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 20:51:09 +0100
+Subject: [PATCH 5/8] adapt to even newer elm API
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/db_sqlite.c |    2 +-
+ src/db_sqlite.h |    2 +-
+ src/gui.c       |   30 +++++++++++++++---------------
+ src/main.c      |    2 +-
+ 4 files changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/src/db_sqlite.c b/src/db_sqlite.c
+index fde2181..3eb7790 100644
+--- a/src/db_sqlite.c
++++ b/src/db_sqlite.c
+@@ -192,7 +192,7 @@ void load_data(void)
+ void show_cat_tasks(char *ca)
+ {
+ 	int i;
+-	Elm_Genlist_Item *item;
++	Elm_Object_Item *item;
+ 	
+ 	elm_genlist_clear(list);
+ 	if (strcmp(ca, " All Tasks ") == 0) {
+diff --git a/src/db_sqlite.h b/src/db_sqlite.h
+index b595488..469aa48 100644
+--- a/src/db_sqlite.h
++++ b/src/db_sqlite.h
+@@ -39,7 +39,7 @@ extern Evas_Object *list, *hs, *hs1, *cat_list, *sel_cat_bt;
+ void restore_state(void);
+ extern char home_dir[255], sel_category[255];
+ extern Elm_Genlist_Item_Class itc1, itc2;
+-extern Elm_Genlist_Item *task_list[500];
++extern Elm_Object_Item *task_list[500];
+ extern int total_tasks;
+ typedef struct{
+ 	int no;
+diff --git a/src/gui.c b/src/gui.c
+index 69b06d8..0291378 100644
+--- a/src/gui.c
++++ b/src/gui.c
+@@ -26,7 +26,7 @@ char dummy_cat[255];
+ 
+ typedef struct _Details
+ {
+-	Elm_Genlist_Item *item;
++	Elm_Object_Item *item;
+ 	Evas_Object *button;
+ 	Evas_Object *hover;
+ 	char *data;
+@@ -67,7 +67,7 @@ void select_category(void *data, Evas_Object *obj, void *event_info)
+ {
+ 	char tystr[2];
+ 	char te_data[255], *task_entry;
+-	Elm_Genlist_Item *item;
++	Elm_Object_Item *item;
+ 	_Task *tsk=NULL;
+ 
+ 	//for entries, get entry data and check agianst previous task text, date
+@@ -89,7 +89,7 @@ void select_category(void *data, Evas_Object *obj, void *event_info)
+ 	}
+ 	
+ 	Evas_Object *li = data;
+-	item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(li);
++	item = (Elm_Object_Item *)elm_genlist_selected_item_get(li);
+ 	tsk = (_Task *)elm_genlist_item_data_get(item);
+ 	last_rec = tsk->no;
+ 	elm_object_text_set(cat_bt, tsk->cat);
+@@ -111,7 +111,7 @@ void set_priority(void *data, Evas_Object *obj, void *event_info)
+ 	sprintf(tystr, "%d", ty);
+ 	elm_object_text_set(pr_bt, tystr);
+ 	
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	evas_object_hide(hv);
+ 	if (!item) {
+ 		dummy_pr = atoi(prio);
+@@ -125,10 +125,10 @@ void set_priority(void *data, Evas_Object *obj, void *event_info)
+ 
+ void set_category(void *data, Evas_Object *obj, void *event_info)
+ {
+-	Elm_Genlist_Item *item;
++	Elm_Object_Item *item;
+ 	//change category value of selected task
+ 	char *category = data;
+-	item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	evas_object_hide(hs);
+ 	if (!item) return;
+ 	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
+@@ -146,7 +146,7 @@ void set_date(void *data, Evas_Object *obj, void *event_info)
+ 	//set the date
+ 	elm_object_text_set(date_bt, dt);
+ 	evas_object_hide(date_hs);
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if (!item) {
+ 		strcpy(dummy_date, dt);
+ 		return;
+@@ -260,8 +260,8 @@ void det_page_done(void *data, Evas_Object *obj, void *event_info)
+ 	if(WRITE) {
+ 		WRITE = 0;
+ 		update_record (tsk->no);
+-		Elm_Genlist_Item *item;
+-		item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++		Elm_Object_Item *item;
++		item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 		if(item) elm_genlist_item_update(task_list[tsk->no]);
+ 		last_rec = -1;
+ 		item = elm_genlist_first_item_get(list);
+@@ -293,7 +293,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 	curtime = time (NULL);
+ 	
+ 	//check task selected - otherwise return
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if(!item) return;
+ 	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
+ 	det_page = elm_win_add(NULL, "inwin", ELM_WIN_BASIC);
+@@ -566,7 +566,7 @@ void save_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ 	char te_data[255], *task_entry;
+ 	
+ 	//get task no
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if (item) {
+ 		_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
+ 		
+@@ -626,7 +626,7 @@ void note_done(void *data, Evas_Object *obj, void *event_info)
+ 	char tystr[255];
+ 	//Evas_Object *en = data;
+ 	
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
+ 	sprintf(tystr, "%s", elm_entry_entry_get(data));
+ 	if (strcmp(tystr, "<br>") == 0) strcpy(tystr, "");
+@@ -641,7 +641,7 @@ void note_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ 	Evas_Object *bg, *bx, *bx2, *bt, *en;
+ 	//char buf[PATH_MAX];
+ 
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(list);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if(!item) return;
+ 	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
+ 
+@@ -1056,7 +1056,7 @@ void create_new_task(void *data, Evas_Object *obj, void *event_info)
+ 	
+ 	//get selected task if any
+ 	Evas_Object *li = data;
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(li);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(li);
+ 	if (!item) item = elm_genlist_last_item_get(list);	//insert new line at end of list
+ 
+ 	Task[i].no = i;
+@@ -1193,7 +1193,7 @@ void cat_list_selected(void *data, Evas_Object *obj, void *event_info)
+ void  del_cat_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ {
+ 	Evas_Object *li = data;
+-	Elm_Genlist_Item *item = (Elm_Genlist_Item *)elm_genlist_selected_item_get(li);
++	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(li);
+ 	char *_cat = (char *)elm_genlist_item_data_get(item);
+ 	//delete category from db
+ 	del_category(_cat);
+diff --git a/src/main.c b/src/main.c
+index 116b84c..89bbb39 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -27,7 +27,7 @@
+ #include "db_sqlite.h"
+ 
+ char home_dir[255], sel_category[255];
+-Elm_Genlist_Item *task_list[500];
++Elm_Object_Item *task_list[500];
+ Evas_Object *list, *hs, *pr_hs, *date_hs, *entry, *hs1, *tk, *hv, *pr_bt, *cat_list, *win, *cat_hv_bx, *note_win;
+ Evas_Object *c_pr_bt, *cat_dialog, *cat_bt, *sel_cat_bt, *date_bt, *det_page, *entry, *new_button, *note_entry;
+ int total_tasks, WRITE=0, last_rec= -1;
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0006-remove-deprecated-API.patch b/meta-efl/recipes-efl/e17/e-tasks/0006-remove-deprecated-API.patch
new file mode 100644
index 0000000..4cd0389
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0006-remove-deprecated-API.patch
@@ -0,0 +1,296 @@
+From d1494e2e59d99cd2b7948a870dca00ae789431b9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 20:52:05 +0100
+Subject: [PATCH 6/8] remove deprecated API
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui.c |   64 ++++++++++++++++++++++++++++++------------------------------
+ 1 files changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/src/gui.c b/src/gui.c
+index 0291378..c798f75 100644
+--- a/src/gui.c
++++ b/src/gui.c
+@@ -75,7 +75,7 @@ void select_category(void *data, Evas_Object *obj, void *event_info)
+ 	if (last_rec != -1) { //cater for initial null data
+ 		sprintf(te_data, "%s", (const char *)elm_entry_entry_get(tk));
+ 		task_entry = strtok(te_data, "<");
+-		tsk = (_Task *)elm_genlist_item_data_get(task_list[last_rec]);
++		tsk = (_Task *)elm_object_item_data_get(task_list[last_rec]);
+ 		if (strcmp(task_entry, tsk->text) != 0) {
+ 			sprintf(tsk->text, "%s", task_entry);
+ 			WRITE = 1;
+@@ -90,7 +90,7 @@ void select_category(void *data, Evas_Object *obj, void *event_info)
+ 	
+ 	Evas_Object *li = data;
+ 	item = (Elm_Object_Item *)elm_genlist_selected_item_get(li);
+-	tsk = (_Task *)elm_genlist_item_data_get(item);
++	tsk = (_Task *)elm_object_item_data_get(item);
+ 	last_rec = tsk->no;
+ 	elm_object_text_set(cat_bt, tsk->cat);
+ 	sprintf(tystr, "%d", tsk->pr);
+@@ -117,7 +117,7 @@ void set_priority(void *data, Evas_Object *obj, void *event_info)
+ 		dummy_pr = atoi(prio);
+ 		return;
+ 	}
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 	if(tsk->pr == ty) return;
+ 	tsk->pr = ty;
+ 	WRITE = 1;
+@@ -131,13 +131,13 @@ void set_category(void *data, Evas_Object *obj, void *event_info)
+ 	item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	evas_object_hide(hs);
+ 	if (!item) return;
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 	if (strcmp(tsk->cat, category) == 0) return;
+ 	strcpy(tsk->cat, category);
+ 	elm_object_text_set(cat_bt, category);
+ 	WRITE = 1;
+     if (strcmp(sel_category, " All Tasks ") !=0 &&
+-        strcmp(sel_category, category) != 0) elm_genlist_item_del(item);
++        strcmp(sel_category, category) != 0) elm_object_item_del(item);
+ }
+ 
+ void set_date(void *data, Evas_Object *obj, void *event_info)
+@@ -151,7 +151,7 @@ void set_date(void *data, Evas_Object *obj, void *event_info)
+ 		strcpy(dummy_date, dt);
+ 		return;
+ 	}
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 	if (strcmp(tsk->date, dt) == 0) return;
+ 	strcpy(tsk->date, dt);
+ 	WRITE = 1;
+@@ -167,7 +167,7 @@ void task_cb_changed(void *data, Evas_Object *obj, void *event_info)
+ 	//printf("no %d key %d\n", tsk->no, tsk->key);
+ 	//TODO - strike through the task
+ 	//remove this task from the list
+-	elm_genlist_item_del(task_list[tsk->no]);
++	elm_object_item_del(task_list[tsk->no]);
+ 	//update the db
+ 	update_record (tsk->no);
+ 	last_rec = -1;
+@@ -218,7 +218,7 @@ void set_create_date(void *data, Evas_Object *obj, void *event_info)
+ 	Details *det = data;
+ 	evas_object_hide(det->hover);
+ 	//change date value of selected task
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(det->item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(det->item);
+ 	strcpy(tsk->date, det->data);
+ 	//update button label
+ 	elm_object_text_set(det->button, det->data);
+@@ -230,7 +230,7 @@ void set_create_priority(void *data, Evas_Object *obj, void *event_info)
+ 	Details *det = data;
+ 	evas_object_hide(det->hover);
+ 	//change priority value of selected task
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(det->item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(det->item);
+ 	tsk->pr = atoi(det->data);
+ 	//update button label
+ 	elm_object_text_set(det->button, det->data);
+@@ -295,7 +295,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 	//check task selected - otherwise return
+ 	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if(!item) return;
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 	det_page = elm_win_add(NULL, "inwin", ELM_WIN_BASIC);
+ 	elm_win_title_set(det_page, "Task Details");
+ 	elm_win_autodel_set(det_page, 1);
+@@ -322,7 +322,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 	lb = elm_label_add(det_page);
+ 	elm_object_text_set(lb,"Edit Task Details");
+ 	evas_object_size_hint_align_set(lb, 0.5, -1.0);
+-	elm_frame_content_set(fr, lb);
++	elm_object_content_set(fr, lb);
+ 	evas_object_show(lb);
+ 
+ 	//add a label 
+@@ -366,7 +366,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 
+ 	bt = elm_button_add(det_page);
+ 	elm_object_text_set(bt, "Pr");
+-	elm_hover_content_set(det_hv, "middle", bt);
++	elm_object_part_content_set(det_hv, "middle", bt);
+ 	evas_object_show(bt);
+ 
+ 	bx = elm_box_add(det_page);
+@@ -384,7 +384,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 		evas_object_show(bt);
+ 	}	
+ 	evas_object_show(bx);
+-	elm_hover_content_set(det_hv, "bottom", bx);
++	elm_object_part_content_set(det_hv, "bottom", bx);
+ 
+ 	//add a label to hbox
+ 	lb = elm_label_add(det_page);
+@@ -409,14 +409,14 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 
+ 	bt = elm_button_add(det_page);
+ 	elm_object_text_set(bt, "Category");
+-	elm_hover_content_set(hs, "middle", bt);
++	elm_object_part_content_set(hs, "middle", bt);
+ 	evas_object_show(bt);
+ 
+ 	bx = elm_box_add(det_page);
+ 	//add categories
+ 	add_hs_items (det_page, bx, bt, 0);
+ 	evas_object_show(bx);
+-	elm_hover_content_set(hs, "bottom", bx); 
++	elm_object_part_content_set(hs, "bottom", bx); 
+ 
+ 	//add a label to hbox
+ 	lb = elm_label_add(det_page);
+@@ -442,7 +442,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 
+ 	bt = elm_button_add(det_page);
+ 	elm_object_text_set(bt, "Date");
+-	elm_hover_content_set(c_date_hs, "middle", bt);
++	elm_object_part_content_set(c_date_hs, "middle", bt);
+ 	evas_object_show(bt);
+ 
+ 	bx = elm_box_add(det_page);
+@@ -486,7 +486,7 @@ void create_details_page(void *data, Evas_Object *obj, void *event_info)
+ 	evas_object_show(bt);
+ 	
+ 	evas_object_show(bx);
+-	elm_hover_content_set(c_date_hs, "bottom", bx);
++	elm_object_part_content_set(c_date_hs, "bottom", bx);
+ 
+ 	//add a label 
+ 	lb = elm_label_add(det_page);
+@@ -568,7 +568,7 @@ void save_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ 	//get task no
+ 	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if (item) {
+-		_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++		_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 		
+ 		//get data from entry
+ 		sprintf(te_data, "%s", (const char *)elm_entry_entry_get(tk));
+@@ -627,7 +627,7 @@ void note_done(void *data, Evas_Object *obj, void *event_info)
+ 	//Evas_Object *en = data;
+ 	
+ 	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 	sprintf(tystr, "%s", elm_entry_entry_get(data));
+ 	if (strcmp(tystr, "<br>") == 0) strcpy(tystr, "");
+ 	strcpy(tsk->note, tystr);
+@@ -643,7 +643,7 @@ void note_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ 
+ 	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(list);
+ 	if(!item) return;
+-	_Task *tsk = (_Task *)elm_genlist_item_data_get(item);
++	_Task *tsk = (_Task *)elm_object_item_data_get(item);
+ 
+ 	note_win = elm_win_add(NULL, "note", ELM_WIN_BASIC);
+ 	elm_win_title_set(note_win, "Note");
+@@ -721,7 +721,7 @@ void create_cat_hover(void)
+ 	cat_hv_bx = elm_box_add(win);
+ 	add_hs_items (win, cat_hv_bx, bt, 1);
+ 	evas_object_show(cat_hv_bx);
+-	elm_hover_content_set(hs1, "top", cat_hv_bx);
++	elm_object_part_content_set(hs1, "top", cat_hv_bx);
+ 	evas_object_hide(hs1);
+ }
+ 
+@@ -880,7 +880,7 @@ void create_gui(Evas_Object *win)
+ 
+ 	bt = elm_button_add(win);
+ 	elm_object_text_set(bt, "Pr");
+-	elm_hover_content_set(hv, "middle", bt);
++	elm_object_part_content_set(hv, "middle", bt);
+ 	evas_object_show(bt);
+ 
+ 	bx = elm_box_add(win);
+@@ -895,7 +895,7 @@ void create_gui(Evas_Object *win)
+ 		evas_object_show(bt);
+ 	}	
+ 	evas_object_show(bx);
+-	elm_hover_content_set(hv, "bottom", bx);
++	elm_object_part_content_set(hv, "bottom", bx);
+ 	
+ 	//add scroller for entry
+ 	sc = elm_scroller_add(win);
+@@ -911,7 +911,7 @@ void create_gui(Evas_Object *win)
+ 	elm_entry_entry_set(tk, "Task");
+ 	evas_object_size_hint_weight_set(tk, 1.0, 0.0);
+ 	evas_object_size_hint_align_set(tk, -1.0, 0.0);
+-	elm_scroller_content_set(sc, tk);
++	elm_object_content_set(sc, tk);
+ 	evas_object_show(tk);
+ 	evas_object_show(sc);
+ 
+@@ -934,13 +934,13 @@ void create_gui(Evas_Object *win)
+ 
+ 	bt = elm_button_add(win);
+ 	elm_object_text_set(bt, "Date");
+-	elm_hover_content_set(date_hs, "middle", bt);
++	elm_object_part_content_set(date_hs, "middle", bt);
+ 	evas_object_show(bt);
+ 
+ 	bx1 = elm_box_add(win);
+ 	add_dates(win, bx1, bt);
+ 	evas_object_show(bx1);
+-	elm_hover_content_set(date_hs, "bottom", bx1);
++	elm_object_part_content_set(date_hs, "bottom", bx1);
+ 
+ 	//add save button
+ 	save_button = elm_button_add(win);
+@@ -957,7 +957,7 @@ void create_gui(Evas_Object *win)
+ 	evas_object_size_hint_align_set(list, -1.0, -1.0);
+ 	elm_list_multi_select_set(list, 0);
+ 	elm_box_pack_end(vbox, list);
+-	elm_genlist_horizontal_mode_set(list, ELM_LIST_LIMIT);
++	elm_genlist_mode_set(list, ELM_LIST_LIMIT);
+ 	evas_object_show(list);
+ 	evas_object_smart_callback_add(list, "selected", task_select, list);
+ 
+@@ -1027,7 +1027,7 @@ void create_gui(Evas_Object *win)
+ 
+ 	bt = elm_button_add(win);
+ 	elm_object_text_set(bt, " All Tasks ");
+-	elm_hover_content_set(hs1, "middle", bt);
++	elm_object_part_content_set(hs1, "middle", bt);
+ 	evas_object_show(bt);
+ 	create_cat_hover ();
+ 
+@@ -1118,7 +1118,7 @@ void create_cat_dialog(void *data, Evas_Object *obj, void *event_info)
+ 	vbox = elm_box_add(cat_dialog);
+ 	elm_win_resize_object_add(cat_dialog, vbox);
+ 	evas_object_size_hint_weight_set(vbox, 1.0, 1.0);
+-	elm_win_inwin_content_set(inwin, vbox);
++	elm_object_content_set(inwin, vbox);
+ 	evas_object_show(vbox);
+ 
+ 	//add hbox to vbox
+@@ -1194,11 +1194,11 @@ void  del_cat_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ {
+ 	Evas_Object *li = data;
+ 	Elm_Object_Item *item = (Elm_Object_Item *)elm_genlist_selected_item_get(li);
+-	char *_cat = (char *)elm_genlist_item_data_get(item);
++	char *_cat = (char *)elm_object_item_data_get(item);
+ 	//delete category from db
+ 	del_category(_cat);
+ 	//remove item from list
+-	elm_genlist_item_del(item);
++	elm_object_item_del(item);
+ 	create_cat_hover ();
+ 	if(strcmp(sel_category, _cat) == 0) select_category (" All Tasks ", NULL, NULL);
+ }
+@@ -1263,7 +1263,7 @@ void edit_cat(void)
+ 	// add a label
+ 	lb = elm_label_add(cat_win);
+ 	elm_object_text_set(lb, "Task Categories");
+-	elm_frame_content_set(fr, lb);
++	elm_object_content_set(fr, lb);
+ 	evas_object_show(lb);  
+ 	
+ 	//add list to vbox now
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0007-db_sqlite-fix-warning.patch b/meta-efl/recipes-efl/e17/e-tasks/0007-db_sqlite-fix-warning.patch
new file mode 100644
index 0000000..409a464
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0007-db_sqlite-fix-warning.patch
@@ -0,0 +1,35 @@
+From 8f5979f9c289b4c9313dd93a113ed164d3acb5a2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 21:08:39 +0100
+Subject: [PATCH 7/8] db_sqlite: fix warning
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/db_sqlite.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/db_sqlite.c b/src/db_sqlite.c
+index 3eb7790..326063e 100644
+--- a/src/db_sqlite.c
++++ b/src/db_sqlite.c
+@@ -19,7 +19,7 @@
+ 
+ void open_database(void)
+ {
+-	int db_ret, ret;
++	int db_ret;
+ 	char db[255];
+ 	
+ 	sprintf(db, "%s/.tasks/tasks.db", home_dir);
+@@ -28,7 +28,7 @@ void open_database(void)
+ 		printf("SQL error: %s\n", sqlite3_errmsg(tasks));
+ 		printf("Creating new db file\n");
+ 		//exit(1);
+-		ret = system("mkdir ~/.tasks");
++		system("mkdir ~/.tasks");
+ 		sqlite3_close(tasks);
+ 		db_ret = sqlite3_open(db, &tasks);
+ 	}
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0008-fix-warning-about-incompatible-pointer-types.patch b/meta-efl/recipes-efl/e17/e-tasks/0008-fix-warning-about-incompatible-pointer-types.patch
new file mode 100644
index 0000000..e19f935
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0008-fix-warning-about-incompatible-pointer-types.patch
@@ -0,0 +1,79 @@
+From a9c2240e8ad46a06a4599a444ff8296f5b61b5a9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 21:13:22 +0100
+Subject: [PATCH 8/8] fix warning about incompatible pointer types
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui.c |   16 ++++++++--------
+ 1 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/gui.c b/src/gui.c
+index c798f75..beac463 100644
+--- a/src/gui.c
++++ b/src/gui.c
+@@ -728,7 +728,7 @@ void create_cat_hover(void)
+ //for genlist
+ Elm_Genlist_Item_Class itc1;
+ 
+-char *gl_text_get(const void *data, Evas_Object *obj, const char *part)
++char *gl_text_get(void *data, Evas_Object *obj, const char *part)
+ {
+ 	_Task *tsk = (_Task *)data;
+ 	char tystr[255], *ty;
+@@ -739,7 +739,7 @@ char *gl_text_get(const void *data, Evas_Object *obj, const char *part)
+ 	//return NULL;
+ }
+ 
+-Evas_Object *gl_content_get(const void *data, Evas_Object *obj, const char *part)
++Evas_Object *gl_content_get(void *data, Evas_Object *obj, const char *part)
+ {
+ 	_Task *tsk = (_Task *)data;
+ 	
+@@ -824,12 +824,12 @@ Evas_Object *gl_content_get(const void *data, Evas_Object *obj, const char *part
+ 	return NULL;
+ }
+ 
+-Eina_Bool gl_state_get(const void *data, Evas_Object *obj, const char *part)
++Eina_Bool gl_state_get(void *data, Evas_Object *obj, const char *part)
+ {
+    return 0;
+ }
+ 
+-void gl_del(const void *data, Evas_Object *obj)
++void gl_del(void *data, Evas_Object *obj)
+ {
+ 	return;
+ }
+@@ -1203,24 +1203,24 @@ void  del_cat_button_clicked(void *data, Evas_Object *obj, void *event_info)
+ 	if(strcmp(sel_category, _cat) == 0) select_category (" All Tasks ", NULL, NULL);
+ }
+ 
+-char *cat_text_get(const void *data, Evas_Object *obj, const char *part)
++char *cat_text_get(void *data, Evas_Object *obj, const char *part)
+ {
+ 	char *_cat = (char *)data;
+ 	char *ty = strdup(_cat);
+ 	return (ty);
+ }
+ 
+-Evas_Object *cat_content_get(const void *data, Evas_Object *obj, const char *part)
++Evas_Object *cat_content_get(void *data, Evas_Object *obj, const char *part)
+ {
+ 	return NULL;
+ }
+ 
+-Eina_Bool cat_state_get(const void *data, Evas_Object *obj, const char *part)
++Eina_Bool cat_state_get(void *data, Evas_Object *obj, const char *part)
+ {
+    return 0;
+ }
+ 
+-void cat_del (const void *data, Evas_Object *obj)
++void cat_del (void *data, Evas_Object *obj)
+ {
+ }
+ 
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks/depends.eina.patch b/meta-efl/recipes-efl/e17/e-tasks/depends.eina.patch
deleted file mode 100644
index 6e1981e..0000000
--- a/meta-efl/recipes-efl/e17/e-tasks/depends.eina.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr trunk.orig//configure.ac trunk/configure.ac
---- trunk.orig//configure.ac	2009-12-18 12:59:52.000000000 +0100
-+++ trunk/configure.ac	2010-08-22 23:22:52.000000000 +0200
-@@ -15,7 +15,7 @@
- 
- AM_PROG_LIBTOOL
- 
--PKG_CHECK_MODULES(TASKS, [elementary eina-0 dbus-1 sqlite3])
-+PKG_CHECK_MODULES(TASKS, [elementary eina dbus-1 sqlite3])
- 
- AC_OUTPUT([
- Makefile
diff --git a/meta-efl/recipes-efl/e17/e-tasks_svn.bb b/meta-efl/recipes-efl/e17/e-tasks_svn.bb
index f4a25f8..614b213 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_svn.bb
@@ -10,13 +10,18 @@ inherit autotools
 
 SRCREV = "25"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "svn://e-tasks.googlecode.com/svn;module=trunk;proto=http \
-           file://genlist_item_insert_before.api.patch \
-           file://0001-adapt-to-newer-elm-API.patch \
-           file://depends.eina.patch \
-           file://0001-fix-changed-callback-name.patch"
+  file://0001-depend-on-eina-not-eina-0.patch \
+  file://0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch \
+  file://0003-adapt-to-newer-elm-API.patch \
+  file://0004-fix-changed-callback-name.patch \
+  file://0005-adapt-to-even-newer-elm-API.patch \
+  file://0006-remove-deprecated-API.patch \
+  file://0007-db_sqlite-fix-warning.patch \
+  file://0008-fix-warning-about-incompatible-pointer-types.patch \
+"
 S = "${WORKDIR}/trunk"
 
 do_install_append() {
-- 
1.7.8.4



