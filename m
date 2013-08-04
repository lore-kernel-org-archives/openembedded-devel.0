Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8556E6B4F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:29 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so1285749eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NzuWMoVyD93aDjqVb8ka72JZ/h4vHAV520s/cxvaiSE=;
	b=etM2zrlfauCLwGKBwAQOhIQebufmtSk2TXRCNMD3L78Y7miUWnVQ8tpPgf4UaczZct
	NTtSC27nK+VhW6u7Mi1tEgbtPua51KOXRalNZiyaf3Or36gpHb0hrbfso36kxbrh2yXS
	iJH/YQ7Gt81GWxyBdQBis2apAzcsq5xJJPmDtFEYQLhindEWLmy2lMKLa3V2zggPRErW
	fQZgAOEzy+teBm207Ca1VuBh9ocDgXr1gREH7LRxQatXVxjx3eAgWxN2iEw5VbZTOL2u
	hRWWk17XUcUReRBFOR5f4YvecQoK/LbcvNf2DSjjVzhbC7asTPoOqRi5UUyiXyA5uk47
	agUA==
X-Received: by 10.15.52.5 with SMTP id o5mr14494636eew.58.1375652849948;
	Sun, 04 Aug 2013 14:47:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bb14sm28777316eeb.17.2013.08.04.14.47.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:47 +0200
Message-Id: <1375652867-10498-15-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/15] dates: make it compatible with newer evolution-data-server
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:29 -0000

* drop 0.4.8 recipe, git recipe is default version for long time and
  pimlico-project.org is gone anyway:
  wget: unable to resolve host address 'pimlico-project.org'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ew-evolution-data-server-e_source_-color-.patch | 72 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb    |  5 --
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |  1 +
 3 files changed, 73 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb

diff --git a/meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch b/meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch
new file mode 100644
index 0000000..4550d29
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch
@@ -0,0 +1,72 @@
+From a8ddfc4b91f2ab3d955fe528ddb98ce2c5545795 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 4 Aug 2013 13:44:50 +0200
+Subject: [PATCH] Update to new evolution-data-server e_source_*color APIs
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/dates_gtk.c  | 6 +++---
+ src/dates_main.c | 2 +-
+ src/dates_view.c | 6 +++++-
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/src/dates_gtk.c b/src/dates_gtk.c
+index 78e71bb..ac539d2 100644
+--- a/src/dates_gtk.c
++++ b/src/dates_gtk.c
+@@ -1072,7 +1072,7 @@ calendar_do_new_dialog (GtkWindow *parent, DatesData *d)
+ #endif
+ 
+ 			/* Set the colour */
+-			e_source_set_color (source, new_colour);
++			e_source_set_color_spec (source, new_colour);
+ 
+ 			/* Set the group for the source */
+ 			e_source_set_group (source, group);
+@@ -1335,7 +1335,7 @@ calendar_do_edit_dialog (GtkWindow *parent, ESource *source, DatesData *d)
+ 	gtk_misc_set_alignment (GTK_MISC (label), 0, 0.5);
+ 
+ 	/* Get the colour from the the source */
+-	e_source_get_color (source, &raw_colour);
++	raw_colour = e_source_peek_color_spec (source);
+ 
+ 	/* Munge this into something usable */
+ 	colour.red = (guint16)(((raw_colour & 0xff0000) >> 16) << 8);
+@@ -1459,7 +1459,7 @@ calendar_do_edit_dialog (GtkWindow *parent, ESource *source, DatesData *d)
+ 			new_colour <<= 8;
+ #endif
+ 			/* Update the colour */
+-			e_source_set_color (source, new_colour);
++			e_source_set_color_spec (source, new_colour);
+ 
+ 			/* And the name */
+ 			e_source_set_name (source, (gtk_entry_get_text (GTK_ENTRY (name_entry))));
+diff --git a/src/dates_main.c b/src/dates_main.c
+index ce05fe8..7273c63 100644
+--- a/src/dates_main.c
++++ b/src/dates_main.c
+@@ -112,7 +112,7 @@ dates_load_calendars (DatesData *d)
+ 		system_source = e_source_new (_("Personal"), "system");
+ 
+ 		/* Default Evolution colour */
+-		e_source_set_color (system_source, 0xBECEDD);
++		e_source_set_color_spec (system_source, 0xBECEDD);
+ 
+ 		/* Set the group for the source and put it in the group */
+ 		e_source_set_group (system_source, local_group);
+diff --git a/src/dates_view.c b/src/dates_view.c
+index d65db2f..f8efb9c 100644
+--- a/src/dates_view.c
++++ b/src/dates_view.c
+@@ -4876,7 +4880,7 @@ dates_view_add_calendar (DatesView *view, ECal *ecal)
+ 	cal->text_gc = gdk_gc_new (
+ 		GDK_DRAWABLE (priv->main->window));
+ 
+-	if (e_source_get_color (source, &colour)) {
++	if (colour = e_source_peek_color_spec (source)) {
+ 		GdkColor gcolour, dgcolour, tgcolour;
+ 		gcolour.red = ((colour & 0xFF0000) >> 16) * 0x101;
+ 		gcolour.green = ((colour & 0xFF00) >> 8)  * 0x101;
+-- 
+1.8.3.2
+
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb b/meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb
deleted file mode 100644
index da3f273..0000000
--- a/meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dates.inc
-
-PR = "r6"
-
-SRC_URI = "http://pimlico-project.org/sources/dates/dates-${PV}.tar.gz"
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
index 8966303..086abc7 100644
--- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
@@ -15,4 +15,5 @@ SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
     file://make-382.patch \
     file://dso_linking_change_build_fix.patch \
     file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
+    file://0001-Update-to-new-evolution-data-server-e_source_-color-.patch \
 "
-- 
1.8.3.2


