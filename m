Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0gA-00072U-Gh
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:09 +0100
Received: by mail-ea0-f176.google.com with SMTP id d13so364771eaa.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=h30FfxDlQoDhNEk76twPURY9S966tNagavKd551f46E=;
	b=XqOhgmIle0FycobVLAu/JCQmSUazC6s5cqxWYuJZ9VGZu2NZejSe+2Drau1uDZIBZS
	iTkdDWUxJFdbzx0+zjnxoYYzhmo6woq3TtvQkCS1xNGpEL1ztNWx+t1ddx+BsBvDwzv+
	bhb0wt4cNXqLO5DuhFup/S5kXJOqvfSwLzpVuHtvZyzpTjeWrc1DjE/AOM4HetQJArQs
	GR3/ukhS42DWynqwhohC4PDd8KwHujaxvGvK5A120fnVBfhlGz4ceEQ2Mex183sS8a5k
	ORo9THfCPdipvsaCkIkr7JFR6C+xlkmHYT/naAP8I30peJHBlrOvE75tGswOeGIKkd1g
	fg0w==
X-Received: by 10.14.215.197 with SMTP id e45mr7324271eep.0.1355849724727;
	Tue, 18 Dec 2012 08:55:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm4210870eem.14.2012.12.18.08.55.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:09 +0100
Message-Id: <2a7497db4f0df5c47dc62e49a2605396c9997ef1.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/10] claws-mail: Upgrade from 3.6.1 to 3.9.0
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

From: Ben Deering <ben_deering@swissmail.org>

Switch Claws mail to latest version (3.9.0) and remove patches that were
applied to 3.6.1.  The patches do not seem to be needed anymore.

Signed-off-by: Ben Deering <ben_deering@swissmail.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../claws-mail-3.6.1/claws-mail-g_strcmp0.patch    | 575 ---------------------
 .../claws-mail/claws-mail-3.6.1/desktop.patch      |  19 -
 .../claws-mail-3.6.1/duplicate-header.patch        |  10 -
 .../claws-mail/claws-mail-3.6.1/glib-2.32.patch    |  11 -
 .../{claws-mail_3.6.1.bb => claws-mail_3.9.0.bb}   |  17 +-
 5 files changed, 4 insertions(+), 628 deletions(-)
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claws-mail-g_strcmp0.patch
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desktop.patch
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/duplicate-header.patch
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib-2.32.patch
 rename meta-oe/recipes-sato/claws-mail/{claws-mail_3.6.1.bb => claws-mail_3.9.0.bb} (72%)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claws-mail-g_strcmp0.patch b/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claws-mail-g_strcmp0.patch
deleted file mode 100644
index 17c213d..0000000
--- a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claws-mail-g_strcmp0.patch
+++ /dev/null
@@ -1,575 +0,0 @@
-http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=1773
-
-However using if (g_utf8_collate(foo1, foo2)) works and gives good results (at
-least if glibc or locale data are not broken), this usage is bad.
-
-If you need to just compare strings to get equal/non-equal return value, than
-using of four-pass locale wise lexicographic collating is purely superfluous.
-
-Using simpler functions like strcmp() or g_strcmp0() will give the same result
-5-50 times faster.
-
-In attached patch, I replaces all occurrences of upper mentioned use case.
-
-Stanislav Brabec
-
-diff -ur claws-mail-3.6.1.orig/src/addrcustomattr.c claws-mail-3.6.1/src/addrcustomattr.c
---- claws-mail-3.6.1.orig/src/addrcustomattr.c	2008-07-25 23:01:29.000000000 +0200
-+++ claws-mail-3.6.1/src/addrcustomattr.c	2008-11-14 14:27:12.000000000 +0100
-@@ -353,7 +353,7 @@
- 	gchar *attr;
- 	gtk_tree_model_get(model, iter, CUSTOM_ATTR_NAME, &attr, -1);
- 
--	if (g_utf8_collate(data->attr, attr)==0) {
-+	if (g_strcmp0(data->attr, attr)==0) {
- 		data->path = path; /* signal we found it */
- 		data->iter = *iter;
- 		return TRUE;
-diff -ur claws-mail-3.6.1.orig/src/addressbook_foldersel.c claws-mail-3.6.1/src/addressbook_foldersel.c
---- claws-mail-3.6.1.orig/src/addressbook_foldersel.c	2008-09-09 19:10:50.000000000 +0200
-+++ claws-mail-3.6.1/src/addressbook_foldersel.c	2008-11-14 14:27:12.000000000 +0100
-@@ -392,12 +392,19 @@
-        corresponds to what we received */
- 
- 	if ( path != NULL ) {
--		if ( g_utf8_collate(path, _("Any")) == 0 || strcasecmp(path, "Any") ==0 || *path == '\0' )
-+		/* FIXME: Do we really need to recognize "anY" (and translated form)? */
-+		/* It's a bit more complicated than g_utf8_collate, but still much faster */
-+		char *tmp1, *tmp2;
-+		tmp1 = g_utf8_casefold(path, -1);
-+		tmp2 = g_utf8_casefold(_("Any"), -1); /* FIXME: This should be done only once. */
-+		if ( g_strcmp0(tmp1, tmp2) == 0 || g_ascii_strcasecmp(path, "Any") ==0 || *path == '\0' )
- 			/* consider "Any" (both translated or untranslated forms) and ""
- 			   as valid addressbook roots */
- 			folder_path_match.matched = TRUE;
- 		else
- 			folder_path_match.folder_path = g_strsplit( path, "/", 256 );
-+		g_free(tmp1);
-+		g_free(tmp2);
- 	}
- 
- 	addressbook_foldersel_load_data( addrIndex, &folder_path_match );
-diff -ur claws-mail-3.6.1.orig/src/addrgather.c claws-mail-3.6.1/src/addrgather.c
---- claws-mail-3.6.1.orig/src/addrgather.c	2008-09-09 19:10:50.000000000 +0200
-+++ claws-mail-3.6.1/src/addrgather.c	2008-11-14 14:27:12.000000000 +0100
-@@ -507,7 +507,7 @@
- 	for (i = 0; i < NUM_FIELDS; i++) {
- 		gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(addrgather_dlg.checkHeader[i]),
- 					     FALSE);
--		if (g_utf8_collate(_harv_headerNames_[i], HEADER_FROM) == 0)
-+		if (g_strcmp0(_harv_headerNames_[i], HEADER_FROM) == 0)
- 			gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(addrgather_dlg.checkHeader[i]),
- 						    TRUE);
- 	}
-diff -ur claws-mail-3.6.1.orig/src/common/mgutils.c claws-mail-3.6.1/src/common/mgutils.c
---- claws-mail-3.6.1.orig/src/common/mgutils.c	2007-10-15 19:19:53.000000000 +0200
-+++ claws-mail-3.6.1/src/common/mgutils.c	2008-11-14 14:27:12.000000000 +0100
-@@ -356,7 +356,7 @@
- 		if( strlen( str ) > 0 ) {
- 			node = list;
- 			while( node ) {
--				if( g_utf8_collate( str, node->data ) == 0 )
-+				if( g_strcmp0( str, node->data ) == 0 )
- 					return FALSE;
- 				node = g_slist_next( node );
- 			}
-@@ -380,7 +380,7 @@
- 		if( strlen( str ) > 0 ) {
- 			node = list;
- 			while( node ) {
--				if( g_utf8_collate( str, node->data ) == 0 )
-+				if( g_strcmp0( str, node->data ) == 0 )
- 					return FALSE;
- 				node = g_list_next( node );
- 			}
-diff -ur claws-mail-3.6.1.orig/src/compose.c claws-mail-3.6.1/src/compose.c
---- claws-mail-3.6.1.orig/src/compose.c	2008-10-04 12:58:45.000000000 +0200
-+++ claws-mail-3.6.1/src/compose.c	2008-11-14 14:27:12.000000000 +0100
-@@ -2399,7 +2399,7 @@
- 	for (h_list = compose->header_list; h_list != NULL; h_list = h_list->next) {
- 		entry = GTK_ENTRY(((ComposeHeaderEntry *)h_list->data)->entry);
- 		if (gtk_entry_get_text(entry) && 
--		    !g_utf8_collate(gtk_entry_get_text(entry), mailto)) {
-+		    !g_strcmp0(gtk_entry_get_text(entry), mailto)) {
- 			if (yellow_initialised) {
- 				gtk_widget_modify_base(
- 					GTK_WIDGET(((ComposeHeaderEntry *)h_list->data)->entry),
-@@ -4858,7 +4858,7 @@
- 		headerentry = ((ComposeHeaderEntry *)list->data);
- 		headerentryname = gtk_entry_get_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN((headerentry->combo)))));
- 
--		if (g_utf8_collate(headerentryname, to_hdr) == 0) {
-+		if (g_strcmp0(headerentryname, to_hdr) == 0) {
- 			const gchar *entstr = gtk_entry_get_text(GTK_ENTRY(headerentry->entry));
- 			Xstrdup_a(str, entstr, return -1);
- 			g_strstrip(str);
-@@ -4886,7 +4886,7 @@
- 		headerentry = ((ComposeHeaderEntry *)list->data);
- 		headerentryname = gtk_entry_get_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN((headerentry->combo)))));
- 
--		if (g_utf8_collate(headerentryname, cc_hdr) == 0) {
-+		if (g_strcmp0(headerentryname, cc_hdr) == 0) {
- 			const gchar *strg = gtk_entry_get_text(GTK_ENTRY(headerentry->entry));
- 			Xstrdup_a(str, strg, return -1);
- 			g_strstrip(str);
-@@ -5760,7 +5760,7 @@
-     		headerentry = ((ComposeHeaderEntry *)list->data);
- 		headerentryname = gtk_entry_get_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN((headerentry->combo)))));
- 
--		if (!g_utf8_collate(trans_fieldname, headerentryname)) {
-+		if (!g_strcmp0(trans_fieldname, headerentryname)) {
- 			str = gtk_editable_get_chars(GTK_EDITABLE(headerentry->entry), 0, -1);
- 			g_strstrip(str);
- 			if (str[0] != '\0') {
-diff -ur claws-mail-3.6.1.orig/src/customheader.c claws-mail-3.6.1/src/customheader.c
---- claws-mail-3.6.1.orig/src/customheader.c	2007-07-11 18:33:01.000000000 +0200
-+++ claws-mail-3.6.1/src/customheader.c	2008-11-14 14:27:12.000000000 +0100
-@@ -83,7 +83,7 @@
- 
- 	for (cur = header_list; cur != NULL; cur = cur->next) {
- 		chdr = (CustomHeader *)cur->data;
--		if (!g_utf8_collate(chdr->name, header))
-+		if (!g_strcmp0(chdr->name, header))
- 			return chdr;
- 	}
- 
-diff -ur claws-mail-3.6.1.orig/src/exportldif.c claws-mail-3.6.1/src/exportldif.c
---- claws-mail-3.6.1.orig/src/exportldif.c	2007-10-04 19:36:26.000000000 +0200
-+++ claws-mail-3.6.1/src/exportldif.c	2008-11-14 14:27:12.000000000 +0100
-@@ -275,7 +275,7 @@
- 		UserAttribute *attrib = node->data;
- 
- 		node = g_list_next( node );
--		if( g_utf8_collate( attrib->name, LDIF_TAG_DN ) == 0 ) {
-+		if( g_strcmp0( attrib->name, LDIF_TAG_DN ) == 0 ) {
- 			retVal = g_strdup( attrib->value );
- 			break;
- 		}
-diff -ur claws-mail-3.6.1.orig/src/gtk/combobox.c claws-mail-3.6.1/src/gtk/combobox.c
---- claws-mail-3.6.1.orig/src/gtk/combobox.c	2008-08-29 10:37:19.000000000 +0200
-+++ claws-mail-3.6.1/src/gtk/combobox.c	2008-11-14 14:27:12.000000000 +0100
-@@ -101,7 +101,7 @@
- 	const gchar *curdata;
- 
- 	gtk_tree_model_get (GTK_TREE_MODEL(model), iter, 0, &curdata, -1);
--	if (!g_utf8_collate(data, curdata)) {
-+	if (!g_strcmp0(data, curdata)) {
- 		gtk_combo_box_set_active_iter(combobox, iter);
- 		return TRUE;
- 	}
-diff -ur claws-mail-3.6.1.orig/src/jpilot.c claws-mail-3.6.1/src/jpilot.c
---- claws-mail-3.6.1.orig/src/jpilot.c	2008-10-01 09:10:29.000000000 +0200
-+++ claws-mail-3.6.1/src/jpilot.c	2008-11-14 14:27:12.000000000 +0100
-@@ -1322,7 +1322,7 @@
- 					}
- 				}
- 
--				if( g_utf8_collate( labelName, lbl ) == 0 ) {
-+				if( g_strcmp0( labelName, lbl ) == 0 ) {
- 					ind = i;
- 					break;
- 				}
-@@ -1640,7 +1640,7 @@
- 	if( labelName ) {
- 		node = pilotFile->customLabels;
- 		while( node ) {
--			if( g_utf8_collate( labelName, ( gchar * ) node->data ) == 0 ) {
-+			if( g_strcmp0( labelName, ( gchar * ) node->data ) == 0 ) {
- 				retVal = TRUE;
- 				break;
- 			}
-diff -ur claws-mail-3.6.1.orig/src/ldapserver.c claws-mail-3.6.1/src/ldapserver.c
---- claws-mail-3.6.1.orig/src/ldapserver.c	2007-08-22 18:08:33.000000000 +0200
-+++ claws-mail-3.6.1/src/ldapserver.c	2008-11-14 14:27:12.000000000 +0100
-@@ -437,7 +437,7 @@
- 	/* Search backwards for query */
- 	while( node ) {
- 		LdapQuery *qry = node->data;
--		if( g_utf8_collate( ADDRQUERY_SEARCHVALUE(qry), searchTerm ) == 0 ) {
-+		if( g_strcmp0( ADDRQUERY_SEARCHVALUE(qry), searchTerm ) == 0 ) {
- 			if( qry->agedFlag ) continue;
- 			if( qry->completed ) {
- 				/* Found */
-diff -ur claws-mail-3.6.1.orig/src/ldif.c claws-mail-3.6.1/src/ldif.c
---- claws-mail-3.6.1.orig/src/ldif.c	2008-08-06 21:38:36.000000000 +0200
-+++ claws-mail-3.6.1/src/ldif.c	2008-11-14 14:27:12.000000000 +0100
-@@ -536,19 +536,19 @@
- 	}
- 	g_strstrip( val );
- 
--	if( g_utf8_collate( nm, LDIF_TAG_COMMONNAME ) == 0 ) {
-+	if( g_strcmp0( nm, LDIF_TAG_COMMONNAME ) == 0 ) {
- 		rec->listCName = g_slist_append( rec->listCName, val );
- 	}
--	else if( g_utf8_collate( nm, LDIF_TAG_FIRSTNAME ) == 0 ) {
-+	else if( g_strcmp0( nm, LDIF_TAG_FIRSTNAME ) == 0 ) {
- 		rec->listFName = g_slist_append( rec->listFName, val );
- 	}
--	else if( g_utf8_collate( nm, LDIF_TAG_LASTNAME ) == 0 ) {
-+	else if( g_strcmp0( nm, LDIF_TAG_LASTNAME ) == 0 ) {
- 		rec->listLName = g_slist_append( rec->listLName, val );
- 	}
--	else if( g_utf8_collate( nm, LDIF_TAG_NICKNAME ) == 0 ) {
-+	else if( g_strcmp0( nm, LDIF_TAG_NICKNAME ) == 0 ) {
- 		rec->listNName = g_slist_append( rec->listNName, val );
- 	}
--	else if( g_utf8_collate( nm, LDIF_TAG_EMAIL ) == 0 ) {
-+	else if( g_strcmp0( nm, LDIF_TAG_EMAIL ) == 0 ) {
- 		rec->listAddress = g_slist_append( rec->listAddress, val );
- 	}
- 	else {
-@@ -759,27 +759,27 @@
- 			gchar *key = g_strdup( tag );
- 
- 			rec = ldif_create_fieldrec( tag );
--			if( g_utf8_collate( tag, LDIF_TAG_DN ) == 0 ) {
-+			if( g_strcmp0( tag, LDIF_TAG_DN ) == 0 ) {
- 				rec->reserved = rec->selected = TRUE;
- 				rec->userName = g_strdup( "dn" );
- 			}
--			else if( g_utf8_collate( tag, LDIF_TAG_COMMONNAME ) == 0 ) {
-+			else if( g_strcmp0( tag, LDIF_TAG_COMMONNAME ) == 0 ) {
- 				rec->reserved = rec->selected = TRUE;
- 				rec->userName = g_strdup( _( "Display Name" ) );
- 			}
--			else if( g_utf8_collate( tag, LDIF_TAG_FIRSTNAME ) == 0 ) {
-+			else if( g_strcmp0( tag, LDIF_TAG_FIRSTNAME ) == 0 ) {
- 				rec->reserved = rec->selected = TRUE;
- 				rec->userName = g_strdup( _( "First Name" ) );
- 			}
--			else if( g_utf8_collate( tag, LDIF_TAG_LASTNAME ) == 0 ) {
-+			else if( g_strcmp0( tag, LDIF_TAG_LASTNAME ) == 0 ) {
- 				rec->reserved = rec->selected = TRUE;
- 				rec->userName = g_strdup( _( "Last Name" ) );
- 			}
--			else if( g_utf8_collate( tag, LDIF_TAG_NICKNAME ) == 0 ) {
-+			else if( g_strcmp0( tag, LDIF_TAG_NICKNAME ) == 0 ) {
- 				rec->reserved = rec->selected = TRUE;
- 				rec->userName = g_strdup( _( "Nick Name" ) );
- 			}
--			else if( g_utf8_collate( tag, LDIF_TAG_EMAIL ) == 0 ) {
-+			else if( g_strcmp0( tag, LDIF_TAG_EMAIL ) == 0 ) {
- 				rec->reserved = rec->selected = TRUE;
- 				rec->userName = g_strdup( _( "Email Address" ) );
- 			}
-@@ -894,7 +894,7 @@
- 					/* Add tag to list */
- 					listTags = g_slist_append( listTags, tagName );
- 
--					if( g_utf8_collate(
-+					if( g_strcmp0(
- 						tagName, LDIF_TAG_EMAIL ) == 0 )
- 					{
- 						flagMail = TRUE;
-diff -ur claws-mail-3.6.1.orig/src/plugins/bogofilter/bogofilter_gtk.c claws-mail-3.6.1/src/plugins/bogofilter/bogofilter_gtk.c
---- claws-mail-3.6.1.orig/src/plugins/bogofilter/bogofilter_gtk.c	2008-09-09 19:10:52.000000000 +0200
-+++ claws-mail-3.6.1/src/plugins/bogofilter/bogofilter_gtk.c	2008-11-14 14:27:12.000000000 +0100
-@@ -296,7 +296,7 @@
- 					config->whitelist_ab_folder);
- 		else
- 		/* backward compatibility (when translated "Any" was stored) */
--		if (g_utf8_collate(config->whitelist_ab_folder, _("Any")) == 0)
-+		if (g_strcmp0(config->whitelist_ab_folder, _("Any")) == 0)
- 			gtk_entry_set_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN((whitelist_ab_folder_combo)))),
- 					config->whitelist_ab_folder);
- 		else
-@@ -373,7 +373,7 @@
- 	config->whitelist_ab_folder = gtk_editable_get_chars(
- 				GTK_EDITABLE(gtk_bin_get_child(GTK_BIN((page->whitelist_ab_folder_combo)))), 0, -1);
- 	/* store UNtranslated "Any" */
--	if (g_utf8_collate(config->whitelist_ab_folder, _("Any")) == 0) {
-+	if (g_strcmp0(config->whitelist_ab_folder, _("Any")) == 0) {
- 		g_free(config->whitelist_ab_folder);
- 		config->whitelist_ab_folder = g_strdup("Any");
- 	}
-diff -ur claws-mail-3.6.1.orig/src/plugins/dillo_viewer/dillo_prefs.c claws-mail-3.6.1/src/plugins/dillo_viewer/dillo_prefs.c
---- claws-mail-3.6.1.orig/src/plugins/dillo_viewer/dillo_prefs.c	2008-08-07 18:38:59.000000000 +0200
-+++ claws-mail-3.6.1/src/plugins/dillo_viewer/dillo_prefs.c	2008-11-14 14:27:12.000000000 +0100
-@@ -209,7 +209,7 @@
- 					_("Any"));
- 		else
- 		/* backward compatibility (when translated "Any" was stored) */
--		if (g_utf8_collate(dillo_prefs.whitelist_ab_folder, _("Any")) == 0)
-+		if (g_strcmp0(dillo_prefs.whitelist_ab_folder, _("Any")) == 0)
- 			gtk_entry_set_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN((whitelist_ab_folder_combo)))),
- 					dillo_prefs.whitelist_ab_folder);
- 		else
-@@ -272,7 +272,7 @@
- 	dillo_prefs.whitelist_ab_folder = gtk_editable_get_chars(
- 				GTK_EDITABLE(gtk_bin_get_child(GTK_BIN((prefs_page->whitelist_ab_folder_combo)))), 0, -1);
- 	/* store UNtranslated "Any" */
--	if (g_utf8_collate(dillo_prefs.whitelist_ab_folder, _("Any")) == 0) {
-+	if (g_strcmp0(dillo_prefs.whitelist_ab_folder, _("Any")) == 0) {
- 		g_free(dillo_prefs.whitelist_ab_folder);
- 		dillo_prefs.whitelist_ab_folder = g_strdup("Any");
- 	}
-diff -ur claws-mail-3.6.1.orig/src/plugins/spamassassin/spamassassin_gtk.c claws-mail-3.6.1/src/plugins/spamassassin/spamassassin_gtk.c
---- claws-mail-3.6.1.orig/src/plugins/spamassassin/spamassassin_gtk.c	2008-09-09 19:10:52.000000000 +0200
-+++ claws-mail-3.6.1/src/plugins/spamassassin/spamassassin_gtk.c	2008-11-14 14:27:12.000000000 +0100
-@@ -480,7 +480,7 @@
- 					config->whitelist_ab_folder);
- 		else
- 		/* backward compatibility (when translated "Any" was stored) */
--		if (g_utf8_collate(config->whitelist_ab_folder, _("Any")) == 0)
-+		if (g_strcmp0(config->whitelist_ab_folder, _("Any")) == 0)
- 			gtk_entry_set_text(GTK_ENTRY(gtk_bin_get_child(GTK_BIN((whitelist_ab_folder_combo)))),
- 					config->whitelist_ab_folder);
- 		else
-@@ -603,7 +603,7 @@
- 	config->whitelist_ab_folder = gtk_editable_get_chars(
- 				GTK_EDITABLE(gtk_bin_get_child(GTK_BIN((page->whitelist_ab_folder_combo)))), 0, -1);
- 	/* store UNtranslated "Any" */
--	if (g_utf8_collate(config->whitelist_ab_folder, _("Any")) == 0) {
-+	if (g_strcmp0(config->whitelist_ab_folder, _("Any")) == 0) {
- 		g_free(config->whitelist_ab_folder);
- 		config->whitelist_ab_folder = g_strdup("Any");
- 	}
-diff -ur claws-mail-3.6.1.orig/src/prefs_matcher.c claws-mail-3.6.1/src/prefs_matcher.c
---- claws-mail-3.6.1.orig/src/prefs_matcher.c	2008-10-08 20:23:51.000000000 +0200
-+++ claws-mail-3.6.1/src/prefs_matcher.c	2008-11-14 14:27:12.000000000 +0100
-@@ -1484,10 +1484,10 @@
- 		if (*expr == '\0') {
- 			gchar *tmp;
- 
--			if (g_utf8_collate(header, Q_("Filtering Matcher Menu|All")) == 0)
-+			if (g_strcmp0(header, Q_("Filtering Matcher Menu|All")) == 0)
- 				tmp = g_strdup(_("all addresses in all headers"));
- 			else
--			if (g_utf8_collate(header, _("Any")) == 0)
-+			if (g_strcmp0(header, _("Any")) == 0)
- 				tmp = g_strdup(_("any address in any header"));
- 			else
- 				tmp = g_strdup_printf(_("the address(es) in header '%s'"), header);
-@@ -1499,12 +1499,12 @@
- 		    return NULL;
- 		}
- 		/* store UNtranslated "Any"/"All" in matcher expressions */
--		if (g_utf8_collate(header, Q_("Filtering Matcher Menu|All")) == 0)
-+		if (g_strcmp0(header, Q_("Filtering Matcher Menu|All")) == 0)
- 			header = "All";
- 		else
--			if (g_utf8_collate(header, _("Any")) == 0)
-+			if (g_strcmp0(header, _("Any")) == 0)
- 				header = "Any";
--		if (g_utf8_collate(expr, _("Any")) == 0)
-+		if (g_strcmp0(expr, _("Any")) == 0)
- 			expr = "Any";
- 		break;
- 	}
-diff -ur claws-mail-3.6.1.orig/src/prefs_toolbar.c claws-mail-3.6.1/src/prefs_toolbar.c
---- claws-mail-3.6.1.orig/src/prefs_toolbar.c	2008-09-09 19:10:50.000000000 +0200
-+++ claws-mail-3.6.1/src/prefs_toolbar.c	2008-11-14 14:27:12.000000000 +0100
-@@ -391,7 +391,7 @@
- 		gtk_tree_model_get(model_set, &iter,
- 				   SET_EVENT, &entry, 
- 				   -1);
--		if (g_utf8_collate(chosen_action, entry) == 0) 
-+		if (g_strcmp0(chosen_action, entry) == 0) 
- 			result = TRUE;
- 		g_free(entry);			
- 	} while (!result && gtk_tree_model_iter_next(model_set, &iter));
-@@ -551,7 +551,7 @@
- 						prefs_toolbar->item_func_combo));
- 						
- 			if (is_duplicate(prefs_toolbar, icon_event)
--			&& g_utf8_collate(icon_event, set_event) != 0){
-+			&& g_strcmp0(icon_event, set_event) != 0){
- 				alertpanel_error(ERROR_MSG);
- 				g_free(icon_event);
- 				g_free(set_event);
-@@ -1179,7 +1179,7 @@
- 	gtk_button_set_image(GTK_BUTTON(prefs_toolbar->icon_button),
- 			     gtk_image_new_from_pixbuf(pix));
- 	
--	if (g_utf8_collate(toolbar_ret_descr_from_val(A_SEPARATOR), descr) == 0) {
-+	if (g_strcmp0(toolbar_ret_descr_from_val(A_SEPARATOR), descr) == 0) {
- 		gtk_button_set_label(GTK_BUTTON(prefs_toolbar->icon_button),
- 				    _("None"));
- 		g_free(prefs_toolbar->item_icon_file);
-@@ -1196,7 +1196,7 @@
- 	gtk_entry_set_text(GTK_ENTRY(prefs_toolbar->item_text_entry), 
- 			   icon_text);
- 
--	if (g_utf8_collate(toolbar_ret_descr_from_val(A_CLAWS_ACTIONS), descr) == 0) {
-+	if (g_strcmp0(toolbar_ret_descr_from_val(A_CLAWS_ACTIONS), descr) == 0) {
- 		gtk_combo_box_set_active(GTK_COMBO_BOX(
- 			prefs_toolbar->item_type_combo), ITEM_USER_ACTION);
- 
-@@ -1205,7 +1205,7 @@
- 			gchar *item_string;
- 			get_action_name((gchar *)cur2->data, &item_string);
- 			
--			if(g_utf8_collate(item_string, icon_text) == 0) {
-+			if(g_strcmp0(item_string, icon_text) == 0) {
- 				gtk_combo_box_set_active(
- 					GTK_COMBO_BOX(prefs_toolbar->item_action_combo),
- 					item_num);
-@@ -1231,7 +1231,7 @@
- 	for (cur = prefs_toolbar->combo_action_list, item_num = 0; cur != NULL; 
- 	     cur = cur->next) {
- 		gchar *item_str = (gchar*)cur->data;
--		if (g_utf8_collate(item_str, descr) == 0) {
-+		if (g_strcmp0(item_str, descr) == 0) {
- 			gtk_combo_box_set_active(
- 				GTK_COMBO_BOX(prefs_toolbar->item_func_combo),
- 				item_num);
-diff -ur claws-mail-3.6.1.orig/src/procmime.c claws-mail-3.6.1/src/procmime.c
---- claws-mail-3.6.1.orig/src/procmime.c	2008-10-01 09:10:29.000000000 +0200
-+++ claws-mail-3.6.1/src/procmime.c	2008-11-14 14:27:12.000000000 +0100
-@@ -1020,14 +1020,6 @@
- 	return hash_result;
- }
- 
--static gint procmime_str_equal(gconstpointer gptr1, gconstpointer gptr2)
--{
--	const char *str1 = gptr1;
--	const char *str2 = gptr2;
--
--	return !g_utf8_collate(str1, str2);
--}
--
- static GHashTable *procmime_get_mime_type_table(void)
- {
- 	GHashTable *table = NULL;
-@@ -1040,7 +1032,7 @@
- 		if (!mime_type_list) return NULL;
- 	}
- 
--	table = g_hash_table_new(procmime_str_hash, procmime_str_equal);
-+	table = g_hash_table_new(procmime_str_hash, g_str_equal);
- 
- 	for (cur = mime_type_list; cur != NULL; cur = cur->next) {
- 		gint i;
-diff -ur claws-mail-3.6.1.orig/src/summaryview.c claws-mail-3.6.1/src/summaryview.c
---- claws-mail-3.6.1.orig/src/summaryview.c	2008-10-09 20:17:53.000000000 +0200
-+++ claws-mail-3.6.1/src/summaryview.c	2008-11-14 14:27:12.000000000 +0100
-@@ -4240,7 +4240,7 @@
- 					g_strdup_printf("%s",
- 							account->address);
- 			
--			if (g_utf8_collate(from_name, msginfo->from) == 0) {
-+			if (g_strcmp0(from_name, msginfo->from) == 0) {
- 				g_free(from_name);
- 				found = TRUE;
- 				break;
-diff -ur claws-mail-3.6.1.orig/src/toolbar.c claws-mail-3.6.1/src/toolbar.c
---- claws-mail-3.6.1.orig/src/toolbar.c	2008-09-13 12:07:43.000000000 +0200
-+++ claws-mail-3.6.1/src/toolbar.c	2008-11-14 14:39:07.000000000 +0100
-@@ -236,7 +236,7 @@
- 	gint i;
- 
- 	for (i = 0; i < N_ACTION_VAL; i++) {
--		if (g_utf8_collate(gettext(toolbar_text[i].descr), descr) == 0)
-+		if (g_strcmp0(gettext(toolbar_text[i].descr), descr) == 0)
- 				return i;
- 	}
- 	
-@@ -255,7 +255,7 @@
- 	gint i;
- 	
- 	for (i = 0; i < N_ACTION_VAL; i++) {
--		if (g_utf8_collate(toolbar_text[i].index_str, text) == 0)
-+		if (g_strcmp0(toolbar_text[i].index_str, text) == 0)
- 				return i;
- 	}
- 
-@@ -346,11 +346,11 @@
- 		name = ((XMLAttr *)attr->data)->name;
- 		value = ((XMLAttr *)attr->data)->value;
- 		
--		if (g_utf8_collate(name, TOOLBAR_ICON_FILE) == 0) 
-+		if (g_strcmp0(name, TOOLBAR_ICON_FILE) == 0) 
- 			item->file = g_strdup (value);
--		else if (g_utf8_collate(name, TOOLBAR_ICON_TEXT) == 0)
-+		else if (g_strcmp0(name, TOOLBAR_ICON_TEXT) == 0)
- 			item->text = g_strdup (gettext(value));
--		else if (g_utf8_collate(name, TOOLBAR_ICON_ACTION) == 0)
-+		else if (g_strcmp0(name, TOOLBAR_ICON_ACTION) == 0)
- 			item->index = toolbar_ret_val_from_text(value);
- 		if (item->index == -1 && !strcmp(value, "A_DELETE")) {
- 			/* switch button */
-@@ -821,7 +821,7 @@
- 
- 				action_p = strstr(action, ": ");
- 				action_p[0] = 0x00;
--				if (g_utf8_collate(act->name, action) == 0) {
-+				if (g_strcmp0(act->name, action) == 0) {
- 					found = TRUE;
- 					g_free(action);
- 					break;
-diff -ur claws-mail-3.6.1.orig/src/vcard.c claws-mail-3.6.1/src/vcard.c
---- claws-mail-3.6.1.orig/src/vcard.c	2008-08-06 21:38:43.000000000 +0200
-+++ claws-mail-3.6.1/src/vcard.c	2008-11-14 14:27:12.000000000 +0100
-@@ -348,7 +348,7 @@
- 				str = nodeRemarks->data;
- 				if( nodeRemarks ) {
- 					if( str ) {
--						if( g_utf8_collate( str, "internet" ) != 0 ) {
-+						if( g_strcmp0( str, "internet" ) != 0 ) {
- 							if( *str != '\0' )
- 								addritem_email_set_remarks( email, str );
- 						}
-@@ -442,7 +442,7 @@
- 		/* g_print( "\ttype:  %s\n", tagtype ); */
- 		/* g_print( "\tvalue: %s\n", tagvalue ); */
- 
--		if( g_utf8_collate( tagtype, VCARD_TYPE_QP ) == 0 ) {
-+		if( g_strcmp0( tagtype, VCARD_TYPE_QP ) == 0 ) {
- 			gchar *tmp;
- 			/* Quoted-Printable: could span multiple lines */
- 			tagvalue = vcard_read_qp( cardFile, tagvalue );
-@@ -452,26 +452,26 @@
- 			/* g_print( "QUOTED-PRINTABLE !!! final\n>%s<\n", tagvalue ); */
- 		}
- 
--		if( g_utf8_collate( tagname, VCARD_TAG_START ) == 0 &&
-+		if( g_strcmp0( tagname, VCARD_TAG_START ) == 0 &&
- 			g_ascii_strcasecmp( tagvalue, VCARD_NAME ) == 0 ) {
- 			/* g_print( "start card\n" ); */
- 			vcard_free_lists( listName, listAddress, listRemarks, listID );
- 			listName = listAddress = listRemarks = listID = NULL;
- 		}
--		if( g_utf8_collate( tagname, VCARD_TAG_FULLNAME ) == 0 ) {
-+		if( g_strcmp0( tagname, VCARD_TAG_FULLNAME ) == 0 ) {
- 			/* g_print( "- full name: %s\n", tagvalue ); */
- 			listName = g_slist_append( listName, g_strdup( tagvalue ) );
- 		}
--		if( g_utf8_collate( tagname, VCARD_TAG_EMAIL ) == 0 ) {
-+		if( g_strcmp0( tagname, VCARD_TAG_EMAIL ) == 0 ) {
- 			/* g_print( "- address: %s\n", tagvalue ); */
- 			listAddress = g_slist_append( listAddress, g_strdup( tagvalue ) );
- 			listRemarks = g_slist_append( listRemarks, g_strdup( tagtype ) );
- 		}
--		if( g_utf8_collate( tagname, VCARD_TAG_UID ) == 0 ) {
-+		if( g_strcmp0( tagname, VCARD_TAG_UID ) == 0 ) {
- 			/* g_print( "- id: %s\n", tagvalue ); */
- 			listID = g_slist_append( listID, g_strdup( tagvalue ) );
- 		}
--		if( g_utf8_collate( tagname, VCARD_TAG_END ) == 0 &&
-+		if( g_strcmp0( tagname, VCARD_TAG_END ) == 0 &&
- 			g_ascii_strcasecmp( tagvalue, VCARD_NAME ) == 0 ) {
- 			/* vCard is complete */
- 			/* g_print( "end card\n--\n" ); */
-@@ -659,7 +659,7 @@
- 				tagtemp = NULL;
- 			}
- 
--			if( g_utf8_collate( tagtype, VCARD_TYPE_QP ) == 0 ) {
-+			if( g_strcmp0( tagtype, VCARD_TYPE_QP ) == 0 ) {
- 				gchar *tmp;
- 				/* Quoted-Printable: could span multiple lines */
- 				tagvalue = vcard_read_qp( cardFile, tagvalue );
-@@ -667,11 +667,11 @@
- 				g_free(tagvalue);
- 				tagvalue=tmp;
- 			}
--			if( g_utf8_collate( tagname, VCARD_TAG_START ) == 0 &&
-+			if( g_strcmp0( tagname, VCARD_TAG_START ) == 0 &&
- 				g_ascii_strcasecmp( tagvalue, VCARD_NAME ) == 0 ) {
- 				haveStart = TRUE;
- 			}
--			if( g_utf8_collate( tagname, VCARD_TAG_END ) == 0 &&
-+			if( g_strcmp0( tagname, VCARD_TAG_END ) == 0 &&
- 				g_ascii_strcasecmp( tagvalue, VCARD_NAME ) == 0 ) {
- 				/* vCard is complete */
- 				if( haveStart ) cardFile->retVal = MGU_SUCCESS;
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desktop.patch b/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desktop.patch
deleted file mode 100644
index c5ed7a9..0000000
--- a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desktop.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Index: claws-mail-2.9.1/claws-mail.desktop
-===================================================================
---- claws-mail-2.9.1.orig/claws-mail.desktop	2007-04-24 17:40:20.000000000 +0100
-+++ claws-mail-2.9.1/claws-mail.desktop	2007-04-25 07:08:36.000000000 +0100
-@@ -1,11 +1,11 @@
- [Desktop Entry]
- Encoding=UTF-8
--Name=Claws Mail
-+Name=Mail
- Exec=claws-mail
- Icon=claws-mail
--Info="Claws Mail"
-+Info=Email Application
- Categories=GTK;Network;Email;
--Comment="Gtk+ based Mail Client"
-+Comment=Email Application
- Terminal=false
- Type=Application
- StartupNotify=true
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/duplicate-header.patch b/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/duplicate-header.patch
deleted file mode 100644
index 3c25ca1..0000000
--- a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/duplicate-header.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- claws-mail-3.6.1/src/gtk/Makefile.am-orig	2008-10-10 00:17:55.000000000 -0700
-+++ claws-mail-3.6.1/src/gtk/Makefile.am	2010-03-28 16:08:40.000000000 -0700
-@@ -62,7 +62,6 @@ clawsgtkinclude_HEADERS = \
- 	menu.h \
- 	pluginwindow.h \
- 	prefswindow.h \
--	gtkvscrollbutton.h \
- 	progressdialog.h \
- 	quicksearch.h \
- 	sslcertwindow.h \
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib-2.32.patch b/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib-2.32.patch
deleted file mode 100644
index c0faedb..0000000
--- a/meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib-2.32.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- claws-mail-3.6.1.orig/src/common/defs.h	2007-12-18 09:20:54.000000000 +0100
-+++ claws-mail-3.6.1/src/common/defs.h	2012-05-06 08:17:56.049692494 +0200
-@@ -24,8 +24,6 @@
- #  include "config.h"
- #endif
- 
--#include <glibconfig.h>
--
- #ifdef G_OS_WIN32
- #  include <glib/gwin32.h>
- #endif
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.6.1.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
similarity index 72%
rename from meta-oe/recipes-sato/claws-mail/claws-mail_3.6.1.bb
rename to meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 3c858d0..318d6c9 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.6.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -4,23 +4,14 @@ DEPENDS = "gtk+ libetpan openssl aspell"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
 
-PR = "r1"
 
 inherit autotools pkgconfig gettext
 
 # translation patch: http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=1774
 SRC_URI = "\
-        ${SOURCEFORGE_MIRROR}/sylpheed-claws/claws-mail-${PV}.tar.bz2;name=archive \
-        http://www.penguin.cz/~utx/ftp/claws-mail/claws-mail-${PV}-po-update.patch;name=patch \
-        file://desktop.patch \
-        file://claws-mail-g_strcmp0.patch \
-        file://duplicate-header.patch \
-        file://glib-2.32.patch \
-        "
-SRC_URI[archive.md5sum] = "761b8ae2d574588460a0fb1ea4931ccb"
-SRC_URI[archive.sha256sum] = "67337a4a1a5a5ce09f2a38422b7a6fc481e4747f74d4ddedd130d4fb06fc3907"
-SRC_URI[patch.md5sum] = "e8ff3fabf1ed47f3b11a9cdc36b026bd"
-SRC_URI[patch.sha256sum] = "767258dd7c966e14ed519affe4c0da93e8fff66ee5fe9158413c8d163af72db8"
+        ${SOURCEFORGE_MIRROR}/sylpheed-claws/claws-mail-${PV}.tar.bz2;name=archive "
+SRC_URI[archive.md5sum] = "4c5ac7b21f0ed17d0f6404124c2229a4"
+SRC_URI[archive.sha256sum] = "ed70975a5056b3ffc4fe6e977f0d9606febc1499763c090241b029a73ff24e65"
 
 do_configure_append() {
     cd po ; for PO in *.po ; do MO=`echo $PO | sed s/\\.po//`.gmo ; if ! test -f $MO ; then msgfmt $PO -o $MO ; fi ; done
@@ -59,4 +50,4 @@ do_install_append() {
     sed -i 's/Icon=[^.]*$/&.png/' ${D}${datadir}/applications/claws-mail.desktop
 }
 
-RSUGGESTS_${PN} = "claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl" 
+RSUGGESTS_${PN} = "claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl"
-- 
1.8.0.2



