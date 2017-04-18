Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A101371D9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:23 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 63so170745pgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0vDtTrh5B8kqdPOezB1DVM12Lf1PJX5/vUng3Go8b/Y=;
	b=qJbGihaGDvB6527iCnG65+ck1seZte/Ijk9uHlrIompQMBQ9do7W8Bkyomf3r6jZ0o
	ycT8N3eRJC9DzwuUfkK+7lPJZ8eSQ8KVAhZd6JGVP14tRO+dbnwthp/ESdvjeAgskPrZ
	Ou4jO8BVPorn67L7D1d+sLl96OeXExIwEA52fbUnMiOUuo74o7pnAnlS9qsTJ2SJM57K
	/blx8Ul2uBLpAsk9jz5qNkrwzkSDyyfqDDKT6T3GRq4cX5FbOkndzYJO5gfKfr84OCmt
	bfWopUHOuwB+e9wVVYOeuKhs/b9pOk2y3afVG7AHszEz9raR9n0fwS7NAd35FHZ/b5Z2
	HB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0vDtTrh5B8kqdPOezB1DVM12Lf1PJX5/vUng3Go8b/Y=;
	b=oguzJjLom43klexBVZJ3hlMkGjeTnge/iRzd7ZKiiJEiWP1h0WHyfDYEbGXHrnd/6L
	tTDSWTGK/YmUyyzJHIou1g1qu9ioT/1/AkJRZ8ZmmEbBlTQ7/z0QMjwOB5XHLp2gom1w
	F7cbWPo+1UVdcSZ8HbeT9hJ33XwQve+RFuWK+MfKYDTIhn205Er5vyeSDjWVUwEQK6dR
	tjLrNVviSwpZx5VFwTqNuq1YpjDdR3GzGIWRG6XhW0ktWXgm5RZdurT31StyMRgrZfxA
	w9GXhmUKg+9mAIvSrcqoBygsWqrujvG5Nf+urxxvYnoFxPPomuX7RlGyzgtiFC2qSOHU
	AZYA==
X-Gm-Message-State: AN3rC/5ubVzRvl2DhQn+mRFCNZJwUx1n+h+aHEBBEVWNHZSaGRHQEksY
	Op4FsjVFEWfQsg==
X-Received: by 10.99.2.5 with SMTP id 5mr19364864pgc.205.1492539744772;
	Tue, 18 Apr 2017 11:22:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:31 -0700
Message-Id: <20170418182142.27253-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-gnome][ 21/32] dates: Fix buils with security flags
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:24 -0000

Update to latest and drop patches which are upstreamed.
Add a patch to fix security warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dates/0001-Fix-format-security-warnings.patch  | 54 ++++++++++++++++
 ...ew-evolution-data-server-e_source_-color-.patch | 72 ----------------------
 .../recipes-gnome/pimlico/dates/make-382.patch     | 18 ------
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      | 11 ++--
 4 files changed, 59 insertions(+), 96 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/make-382.patch

diff --git a/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch b/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
new file mode 100644
index 000000000..4f551a7d8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
@@ -0,0 +1,54 @@
+From 687881c5fa342686c8724adcdac0f9d555a351c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Apr 2017 18:10:57 -0700
+Subject: [PATCH] Fix format security warnings
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dates_callbacks.c | 2 +-
+ src/dates_gtk.c       | 2 +-
+ src/gconf-bridge.c    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/dates_callbacks.c b/src/dates_callbacks.c
+index d704c8f..46b8cb1 100644
+--- a/src/dates_callbacks.c
++++ b/src/dates_callbacks.c
+@@ -365,7 +365,7 @@ dates_about_cb (GtkWidget *widget, DatesData *d)
+ 
+ 	if (!pixb) {
+ 		g_assert (error);
+-		g_warning (error->message);
++		g_warning ("%s", error->message);
+ 		g_clear_error (&error);
+ 	}
+ 
+diff --git a/src/dates_gtk.c b/src/dates_gtk.c
+index 403bc25..fd691d2 100644
+--- a/src/dates_gtk.c
++++ b/src/dates_gtk.c
+@@ -1114,7 +1114,7 @@ calendar_do_edit_dialog_response_cb (GtkDialog *dialog, gint response_id, gpoint
+ 				GTK_DIALOG_MODAL | GTK_DIALOG_DESTROY_WITH_PARENT,
+ 				GTK_MESSAGE_WARNING,
+ 				GTK_BUTTONS_NONE,
+-				prompt);
++				"%s", prompt);
+ 
+ 		g_free (prompt);
+ 
+diff --git a/src/gconf-bridge.c b/src/gconf-bridge.c
+index 49754cf..67d3757 100644
+--- a/src/gconf-bridge.c
++++ b/src/gconf-bridge.c
+@@ -1220,7 +1220,7 @@ error_handler (GConfClient *client,
+                 dlg = gtk_message_dialog_new (NULL, 0,
+                                               GTK_MESSAGE_ERROR,
+                                               GTK_BUTTONS_OK,
+-                                              message);
++                                              "%s", message);
+                 g_free (message);
+ 
+                 gtk_message_dialog_format_secondary_text
+-- 
+2.12.2
+
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch b/meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch
deleted file mode 100644
index 4550d298d..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/0001-Update-to-new-evolution-data-server-e_source_-color-.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From a8ddfc4b91f2ab3d955fe528ddb98ce2c5545795 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 4 Aug 2013 13:44:50 +0200
-Subject: [PATCH] Update to new evolution-data-server e_source_*color APIs
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/dates_gtk.c  | 6 +++---
- src/dates_main.c | 2 +-
- src/dates_view.c | 6 +++++-
- 3 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/src/dates_gtk.c b/src/dates_gtk.c
-index 78e71bb..ac539d2 100644
---- a/src/dates_gtk.c
-+++ b/src/dates_gtk.c
-@@ -1072,7 +1072,7 @@ calendar_do_new_dialog (GtkWindow *parent, DatesData *d)
- #endif
- 
- 			/* Set the colour */
--			e_source_set_color (source, new_colour);
-+			e_source_set_color_spec (source, new_colour);
- 
- 			/* Set the group for the source */
- 			e_source_set_group (source, group);
-@@ -1335,7 +1335,7 @@ calendar_do_edit_dialog (GtkWindow *parent, ESource *source, DatesData *d)
- 	gtk_misc_set_alignment (GTK_MISC (label), 0, 0.5);
- 
- 	/* Get the colour from the the source */
--	e_source_get_color (source, &raw_colour);
-+	raw_colour = e_source_peek_color_spec (source);
- 
- 	/* Munge this into something usable */
- 	colour.red = (guint16)(((raw_colour & 0xff0000) >> 16) << 8);
-@@ -1459,7 +1459,7 @@ calendar_do_edit_dialog (GtkWindow *parent, ESource *source, DatesData *d)
- 			new_colour <<= 8;
- #endif
- 			/* Update the colour */
--			e_source_set_color (source, new_colour);
-+			e_source_set_color_spec (source, new_colour);
- 
- 			/* And the name */
- 			e_source_set_name (source, (gtk_entry_get_text (GTK_ENTRY (name_entry))));
-diff --git a/src/dates_main.c b/src/dates_main.c
-index ce05fe8..7273c63 100644
---- a/src/dates_main.c
-+++ b/src/dates_main.c
-@@ -112,7 +112,7 @@ dates_load_calendars (DatesData *d)
- 		system_source = e_source_new (_("Personal"), "system");
- 
- 		/* Default Evolution colour */
--		e_source_set_color (system_source, 0xBECEDD);
-+		e_source_set_color_spec (system_source, 0xBECEDD);
- 
- 		/* Set the group for the source and put it in the group */
- 		e_source_set_group (system_source, local_group);
-diff --git a/src/dates_view.c b/src/dates_view.c
-index d65db2f..f8efb9c 100644
---- a/src/dates_view.c
-+++ b/src/dates_view.c
-@@ -4876,7 +4880,7 @@ dates_view_add_calendar (DatesView *view, ECal *ecal)
- 	cal->text_gc = gdk_gc_new (
- 		GDK_DRAWABLE (priv->main->window));
- 
--	if (e_source_get_color (source, &colour)) {
-+	if (colour = e_source_peek_color_spec (source)) {
- 		GdkColor gcolour, dgcolour, tgcolour;
- 		gcolour.red = ((colour & 0xFF0000) >> 16) * 0x101;
- 		gcolour.green = ((colour & 0xFF00) >> 8)  * 0x101;
--- 
-1.8.3.2
-
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/make-382.patch b/meta-gnome/recipes-gnome/pimlico/dates/make-382.patch
deleted file mode 100644
index fad3c5826..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/make-382.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Make 3.82 is offended by the use of spaces instead of tabs. This has been fixed
-in upstream git.
-
-JL - 15/12/10
-
-Upstream-Status: Accepted
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -7,5 +7,5 @@ DISTCLEANFILES = intltool-extract intlto
- MAINTAINERCLEANFILES = $(DISTCLEANFILES) aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
- 
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
index a4a572f85..14965e94f 100644
--- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
@@ -5,15 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/dates_hildon.c;endline=19;md5=63938904198b25de429abb65fbdbdb8a \
                     file://src/gconf-bridge.c;endline=22;md5=ad7626c6daf4aec590474a243f4912fa"
 
-SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
+SRCREV = "c8e30fa3211dcdfcda48184f4c57746a552b9c7a"
 PV = "0.4.11+git${SRCPV}"
 PR = "r9"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.gnome.org/${BPN} \
-    file://make-382.patch \
-    file://dso_linking_change_build_fix.patch \
-    file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
-    file://0001-Update-to-new-evolution-data-server-e_source_-color-.patch \
-"
+           file://dso_linking_change_build_fix.patch \
+           file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
+           file://0001-Fix-format-security-warnings.patch \
+           "
-- 
2.12.2


