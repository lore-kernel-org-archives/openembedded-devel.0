Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0N6-00044O-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:08:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so2604639eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pxLDpZgSkiVEjXcxVPbK1R08GviqwuEE21CWh+Xgsv0=;
	b=aX8DR7bqv1cnX3S0mkhXVr/1ADhK+3OXHI4glmnbQ/w5Baay2WHCOHSxkZo2H3wXgz
	Kg5egsZxTnSe2MuefTGZOXiYBXZ2MPqnwkGv18tPUTL0a1+aFxllvOZ/nMblOVnddUQw
	8Cbv0YwNWCxmR0D0l83/NsjChlAcbl2MTbaEM=
Received: by 10.213.13.66 with SMTP id b2mr560163eba.87.1324389707420;
	Tue, 20 Dec 2011 06:01:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm7184674eeb.3.2011.12.20.06.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:01:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 15:01:13 +0100
Message-Id: <b412e289402f902e39e0895d71d04acb16b2dfe7.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
References: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1324389403.git.Martin.Jansa@gmail.com>
References: <cover.1324389403.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 4/7] e-tasks: add patch to fix changed callback name
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
X-List-Received-Date: Tue, 20 Dec 2011 14:08:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e-tasks/0001-fix-changed-callback-name.patch   |   40 ++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-tasks_svn.bb            |    5 +-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch

diff --git a/meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch b/meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch
new file mode 100644
index 0000000..cf51deb
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch
@@ -0,0 +1,40 @@
+From d6d24a1776594e71ee66db78cc234f38f97f6825 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 17 Dec 2011 03:12:29 +0100
+Subject: [PATCH] fix changed callback name
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui.c  |    2 +-
+ src/main.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/gui.c b/src/gui.c
+index 5c8003c..b032ee5 100644
+--- a/src/gui.c
++++ b/src/gui.c
+@@ -1230,7 +1230,7 @@ void edit_cat(void)
+ 
+ 	cat_win = elm_win_add(NULL, "cat", ELM_WIN_BASIC);
+ 	elm_win_title_set(cat_win, "Edit Categories");
+-	evas_object_smart_callback_add(cat_win, "delete-request", cat_win_del, cat_win);
++	evas_object_smart_callback_add(cat_win, "delete,request", cat_win_del, cat_win);
+ 	
+ 	//add background
+ 	bg = elm_bg_add(cat_win);
+diff --git a/src/main.c b/src/main.c
+index 12072f5..116b84c 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -64,7 +64,7 @@ elm_main(int argc, char **argv)
+ 	//set up win
+ 	win = elm_win_add(NULL, "tasks", ELM_WIN_BASIC);
+ 	elm_win_title_set(win, "Tasks");
+-	evas_object_smart_callback_add(win, "delete-request", my_win_del, NULL);
++	evas_object_smart_callback_add(win, "delete,request", my_win_del, NULL);
+ 
+ 	//open database 
+ 	open_database();
+-- 
+1.7.8
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks_svn.bb b/meta-efl/recipes-efl/e17/e-tasks_svn.bb
index b07959b..f4a25f8 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_svn.bb
@@ -10,12 +10,13 @@ inherit autotools
 
 SRCREV = "25"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "svn://e-tasks.googlecode.com/svn;module=trunk;proto=http \
            file://genlist_item_insert_before.api.patch \
            file://0001-adapt-to-newer-elm-API.patch \
-           file://depends.eina.patch"
+           file://depends.eina.patch \
+           file://0001-fix-changed-callback-name.patch"
 S = "${WORKDIR}/trunk"
 
 do_install_append() {
-- 
1.7.8



