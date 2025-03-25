Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E709C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 12:26:22 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.64448.1742905579813214725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 05:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgRsk5Ha;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac41514a734so422521066b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742905578; x=1743510378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlREebrxzREG5KlGkdVWEQDmzWEJ8J1b0fvp+MaiOMs=;
        b=bgRsk5HaweRZi2wFUw1QbP2WXgXdzwB3qODB/+TV0BaqkRVn7pj3StX4Cu+C+kq0XH
         lRtvERCWectEV7rC4zNf2kckuF+dmIE/7mKNEMwztgU4sxyPlxf7YuZZvo3ujmM9vs97
         UQOSBjk4Gsg+elbvLZoBu2HSfYIgg38BUEDq+gAXDA7ZIZRj2IwC2D/NsFy0ef7Zer00
         IcQ+TOyANUtIzcKbkFwA7kbA2tOPvxAVQFw/AerlLw1VJcxqlUl+84q5tmDQjGYob8Hl
         pXnwPiXuF5JUjREEBSt42VbXS1+6p+nBw5aSu8JU18fvzvwEI7pH6PQQAPqLRGuj4ldR
         1YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905578; x=1743510378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlREebrxzREG5KlGkdVWEQDmzWEJ8J1b0fvp+MaiOMs=;
        b=XCGONWjMUOm8S+C1ieEKSHZQQq8Pv2fiYgwJBns3gGiqDQvlIaD8AS4knlLUjDHmvw
         pbdKe/1RGdZP03hV3A0rbTow+1nv4XNOjSfh/F56L091eRr4SNaAN2AKdfjHk3Xci1+H
         3rx/1vGhkivTvfKlEOF+ZZ+m8mv3SenTfRu9bYV2QpzJCIMl2IvnTT1ETfJXcXJrfWH6
         SA0RUcpJTt4TUuno5EitJiVGC+FoNpyVX2SsXQ07QE/kXjd4O42ZzeYYO8+0lJf0SBhb
         2ZXeRS2mnt1ZkmX7sl6suvB3XelQpCiiInKG08O/9Goc3tOj3Bg845JgE0q3m8x3JSPS
         55sg==
X-Gm-Message-State: AOJu0YyKa1UEcQ+l/ZMmzLy8WtMruedmx69QB+ffCPl8lUcV7oxfSsp2
	4fF5Z4n6EySKP1RA9wOipM7XqX0JUR92rFFGTWiUbNOLUpVbTbpHrfyPLjaK
X-Gm-Gg: ASbGncuNzKMMgeAy80XN/K5toLmJKBDVyyiNlR8A51qIj5rMszE9tY17UAKLbwYoytv
	qfYpz0MADkceLIpXRX/nSAEeaw08HAYSv/ucweKJU5RjnmbCTXJSQun0PjjYun6995NaD+vGzlL
	P06bi2ljTEKog3X2cDyGGgxbfn3rFkyf39AnoNGzU9abpHdlXDlpJ/tnhhyUmkkyOIpgQIKGl+V
	xlKtxkmAIJ+shwqKYisruV4Ibfrq001I2q4CjTa11lBeT3MqAt7dspD1cILA1sf5yARDEu0Hai0
	9G26mZD185jlYtGM5CRHtSGDGq5GtaVoBFQ7VTYwcfVzOnRWmv/3Ef74SCqw0EuFx/AQu/BKe9c
	llrdZq8a+e0Sx
X-Google-Smtp-Source: AGHT+IFzq4Y2mK9Io7KKdfwfu6TtsfocHYAVzVhBKJk80DmH8w7/AkC/ReEuhGscNut98ROq5Q9I1w==
X-Received: by 2002:a17:907:7206:b0:ac6:ba91:ca4c with SMTP id a640c23a62f3a-ac6ba91cb02mr345895966b.48.1742905577872;
        Tue, 25 Mar 2025 05:26:17 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3efbdc78esm856581066b.134.2025.03.25.05.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:26:17 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] pidgin: upgrade to 2.14.14 to fix build with gcc-15
Date: Tue, 25 Mar 2025 13:26:07 +0100
Message-ID: <20250325122608.1914030-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325122608.1914030-1-martin.jansa@gmail.com>
References: <20250325122608.1914030-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 12:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116275

From: Martin Jansa <martin.jansa@gmail.com>

* http://errors.yoctoproject.org/Errors/Details/848756/

* fixed in:
  https://keep.imfreedom.org/pidgin/pidgin/rev/10ae9c0f0cbf

* drop backported patch

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...or_gtkitemfactorycallbacks_on_gcc-14.patch | 177 ------------------
 .../{pidgin_2.14.13.bb => pidgin_2.14.14.bb}  |   3 +-
 2 files changed, 1 insertion(+), 179 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.14.13.bb => pidgin_2.14.14.bb} (96%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch b/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
deleted file mode 100644
index 4e088ffc11..0000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-# HG changeset patch
-# User Yoann Congal <yoann.congal@smile.fr>
-# Date 1720270125 -7200
-#      Sat Jul 06 14:48:45 2024 +0200
-# Branch gcc-14-incompatible-pointer-types
-# Node ID 06721b86a5a8e6fb8163d9411a7778d2a0274b26
-# Parent  21a56db5f9987efb88d76ab26ee1eadf316f3d7d
-Fix incompatible pointer types for GtkItemFactoryCallbacks on gcc-14
-
-The GtkItemFactoryEntry struct callback is of type GtkItemFactoryCallbacks
-(aka void (*)(void)) but is initialised with GtkItemFactoryCallback1 types
-(aka void (*)(void *, guint,  GtkWidget *)).
-
-This is coherent with the gtk-2 documentation:
-> gtk_item_factory_create_items(..., GtkItemFactoryEntry *entries,...)
->  entries : an array of GtkItemFactoryEntrys whose callback members must by of
->  type GtkItemFactoryCallback1
-
-But, under gcc-14, the implicit cast from GtkItemFactoryCallback1 to
-GtkItemFactoryCallback triggers an incompatible-pointer-types error (See [0]).
-
-An exemple of this error:
-pidgin/gtkconv.c:3096:66: error: initialization of 'void (*)(void)' from incompatible pointer type 'void (*)(void *, guint,  GtkWidget *)' {aka 'void (*)(void *, unsigned int,  struct _GtkWidget *)'} [-Wincompatible-pointer-types]
- 3096 |         { N_("/Conversation/New Instant _Message..."), "<CTL>M", menu_new_conv_cb,
-      |                                                                  ^~~~~~~~~~~~~~~~
-pidgin/gtkconv.c:3096:66: note: (near initialization for 'menu_items[1].callback')
-
-To fix this, explicitely cast to GtkItemFactoryCallback where needed.
-
-Testing Done:
-Built with gcc-14, started and clicked on some affected menus
-
-[0]: https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types
-
-Upstream-Status: Backport [https://keep.imfreedom.org/pidgin/pidgin/rev/210f318db492]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-
-diff --git a/pidgin/gtkblist.c b/pidgin/gtkblist.c
---- a/pidgin/gtkblist.c
-+++ b/pidgin/gtkblist.c
-@@ -3624,11 +3624,11 @@ static GtkItemFactoryEntry blist_menu[] 
- 	{ N_("/Buddies/View User _Log..."), "<CTL>L", pidgin_dialogs_log, 0, "<Item>", NULL },
- 	{ "/Buddies/sep1", NULL, NULL, 0, "<Separator>", NULL },
- 	{ N_("/Buddies/Sh_ow"), NULL, NULL, 0, "<Branch>", NULL},
--	{ N_("/Buddies/Show/_Offline Buddies"), NULL, pidgin_blist_edit_mode_cb, 1, "<CheckItem>", NULL },
--	{ N_("/Buddies/Show/_Empty Groups"), NULL, pidgin_blist_show_empty_groups_cb, 1, "<CheckItem>", NULL },
--	{ N_("/Buddies/Show/Buddy _Details"), NULL, pidgin_blist_buddy_details_cb, 1, "<CheckItem>", NULL },
--	{ N_("/Buddies/Show/Idle _Times"), NULL, pidgin_blist_show_idle_time_cb, 1, "<CheckItem>", NULL },
--	{ N_("/Buddies/Show/_Protocol Icons"), NULL, pidgin_blist_show_protocol_icons_cb, 1, "<CheckItem>", NULL },
-+	{ N_("/Buddies/Show/_Offline Buddies"), NULL, (GtkItemFactoryCallback)pidgin_blist_edit_mode_cb, 1, "<CheckItem>", NULL },
-+	{ N_("/Buddies/Show/_Empty Groups"), NULL, (GtkItemFactoryCallback)pidgin_blist_show_empty_groups_cb, 1, "<CheckItem>", NULL },
-+	{ N_("/Buddies/Show/Buddy _Details"), NULL, (GtkItemFactoryCallback)pidgin_blist_buddy_details_cb, 1, "<CheckItem>", NULL },
-+	{ N_("/Buddies/Show/Idle _Times"), NULL, (GtkItemFactoryCallback)pidgin_blist_show_idle_time_cb, 1, "<CheckItem>", NULL },
-+	{ N_("/Buddies/Show/_Protocol Icons"), NULL, (GtkItemFactoryCallback)pidgin_blist_show_protocol_icons_cb, 1, "<CheckItem>", NULL },
- 	{ N_("/Buddies/_Sort Buddies"), NULL, NULL, 0, "<Branch>", NULL },
- 	{ "/Buddies/sep2", NULL, NULL, 0, "<Separator>", NULL },
- 	{ N_("/Buddies/_Add Buddy..."), "<CTL>B", pidgin_blist_add_buddy_cb, 0, "<StockItem>", GTK_STOCK_ADD },
-@@ -3651,11 +3651,11 @@ static GtkItemFactoryEntry blist_menu[] 
- 	{ N_("/Tools/Pr_ivacy"), NULL, pidgin_privacy_dialog_show, 0, "<Item>", NULL },
- 	{ N_("/Tools/Set _Mood"), "<CTL>D", set_mood_show, 0, "<Item>", NULL },
- 	{ "/Tools/sep2", NULL, NULL, 0, "<Separator>", NULL },
--	{ N_("/Tools/_File Transfers"), "<CTL>T", pidgin_xfer_dialog_show, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_TRANSFER },
-+	{ N_("/Tools/_File Transfers"), "<CTL>T", (GtkItemFactoryCallback)pidgin_xfer_dialog_show, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_TRANSFER },
- 	{ N_("/Tools/R_oom List"), NULL, pidgin_roomlist_dialog_show, 0, "<Item>", NULL },
- 	{ N_("/Tools/System _Log"), NULL, gtk_blist_show_systemlog_cb, 3, "<Item>", NULL },
- 	{ "/Tools/sep3", NULL, NULL, 0, "<Separator>", NULL },
--	{ N_("/Tools/Mute _Sounds"), NULL, pidgin_blist_mute_sounds_cb, 0, "<CheckItem>", NULL },
-+	{ N_("/Tools/Mute _Sounds"), NULL, (GtkItemFactoryCallback)pidgin_blist_mute_sounds_cb, 0, "<CheckItem>", NULL },
- 	/* Help */
- 	{ N_("/_Help"), NULL, NULL, 0, "<Branch>", NULL },
- 	{ N_("/Help/Online _Help"), "F1", gtk_blist_show_onlinehelp_cb, 0, "<StockItem>", GTK_STOCK_HELP },
-diff --git a/pidgin/gtkconv.c b/pidgin/gtkconv.c
---- a/pidgin/gtkconv.c
-+++ b/pidgin/gtkconv.c
-@@ -3093,76 +3093,76 @@ static GtkItemFactoryEntry menu_items[] 
- 	/* Conversation menu */
- 	{ N_("/_Conversation"), NULL, NULL, 0, "<Branch>", NULL },
- 
--	{ N_("/Conversation/New Instant _Message..."), "<CTL>M", menu_new_conv_cb,
-+	{ N_("/Conversation/New Instant _Message..."), "<CTL>M", (GtkItemFactoryCallback)menu_new_conv_cb,
- 			0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_MESSAGE_NEW },
--	{ N_("/Conversation/Join a _Chat..."), NULL, menu_join_chat_cb,
-+	{ N_("/Conversation/Join a _Chat..."), NULL, (GtkItemFactoryCallback)menu_join_chat_cb,
- 			0, "<StockItem>", PIDGIN_STOCK_CHAT },
- 
- 	{ "/Conversation/sep0", NULL, NULL, 0, "<Separator>", NULL },
- 
--	{ N_("/Conversation/_Find..."), NULL, menu_find_cb, 0,
-+	{ N_("/Conversation/_Find..."), NULL, (GtkItemFactoryCallback)menu_find_cb, 0,
- 			"<StockItem>", GTK_STOCK_FIND },
--	{ N_("/Conversation/View _Log"), NULL, menu_view_log_cb, 0, "<Item>", NULL },
--	{ N_("/Conversation/_Save As..."), NULL, menu_save_as_cb, 0,
-+	{ N_("/Conversation/View _Log"), NULL, (GtkItemFactoryCallback)menu_view_log_cb, 0, "<Item>", NULL },
-+	{ N_("/Conversation/_Save As..."), NULL, (GtkItemFactoryCallback)menu_save_as_cb, 0,
- 			"<StockItem>", GTK_STOCK_SAVE_AS },
--	{ N_("/Conversation/Clea_r Scrollback"), "<CTL>L", menu_clear_cb, 0, "<StockItem>", GTK_STOCK_CLEAR },
-+	{ N_("/Conversation/Clea_r Scrollback"), "<CTL>L", (GtkItemFactoryCallback)menu_clear_cb, 0, "<StockItem>", GTK_STOCK_CLEAR },
- 
- 	{ "/Conversation/sep1", NULL, NULL, 0, "<Separator>", NULL },
- 
- #ifdef USE_VV
- 	{ N_("/Conversation/M_edia"), NULL, NULL, 0, "<Branch>", NULL },
- 
--	{ N_("/Conversation/Media/_Audio Call"), NULL, menu_initiate_media_call_cb, 0,
-+	{ N_("/Conversation/Media/_Audio Call"), NULL, (GtkItemFactoryCallback)menu_initiate_media_call_cb, 0,
- 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_AUDIO_CALL },
--	{ N_("/Conversation/Media/_Video Call"), NULL, menu_initiate_media_call_cb, 1,
-+	{ N_("/Conversation/Media/_Video Call"), NULL, (GtkItemFactoryCallback)menu_initiate_media_call_cb, 1,
- 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_VIDEO_CALL },
--	{ N_("/Conversation/Media/Audio\\/Video _Call"), NULL, menu_initiate_media_call_cb, 2,
-+	{ N_("/Conversation/Media/Audio\\/Video _Call"), NULL, (GtkItemFactoryCallback)menu_initiate_media_call_cb, 2,
- 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_VIDEO_CALL },
- #endif
- 
--	{ N_("/Conversation/Se_nd File..."), NULL, menu_send_file_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_FILE },
--	{ N_("/Conversation/Get _Attention"), NULL, menu_get_attention_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_ATTENTION },
--	{ N_("/Conversation/Add Buddy _Pounce..."), NULL, menu_add_pounce_cb,
-+	{ N_("/Conversation/Se_nd File..."), NULL, (GtkItemFactoryCallback)menu_send_file_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_FILE },
-+	{ N_("/Conversation/Get _Attention"), NULL, (GtkItemFactoryCallback)menu_get_attention_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_ATTENTION },
-+	{ N_("/Conversation/Add Buddy _Pounce..."), NULL, (GtkItemFactoryCallback)menu_add_pounce_cb,
- 			0, "<Item>", NULL },
--	{ N_("/Conversation/_Get Info"), "<CTL>O", menu_get_info_cb, 0,
-+	{ N_("/Conversation/_Get Info"), "<CTL>O", (GtkItemFactoryCallback)menu_get_info_cb, 0,
- 			"<StockItem>", PIDGIN_STOCK_TOOLBAR_USER_INFO },
--	{ N_("/Conversation/In_vite..."), NULL, menu_invite_cb, 0,
-+	{ N_("/Conversation/In_vite..."), NULL, (GtkItemFactoryCallback)menu_invite_cb, 0,
- 			"<Item>", NULL },
- 	{ N_("/Conversation/M_ore"), NULL, NULL, 0, "<Branch>", NULL },
- 
- 	{ "/Conversation/sep2", NULL, NULL, 0, "<Separator>", NULL },
- 
--	{ N_("/Conversation/Al_ias..."), NULL, menu_alias_cb, 0,
-+	{ N_("/Conversation/Al_ias..."), NULL, (GtkItemFactoryCallback)menu_alias_cb, 0,
- 			"<Item>", NULL },
--	{ N_("/Conversation/_Block..."), NULL, menu_block_cb, 0,
-+	{ N_("/Conversation/_Block..."), NULL, (GtkItemFactoryCallback)menu_block_cb, 0,
- 			"<StockItem>", PIDGIN_STOCK_TOOLBAR_BLOCK },
--	{ N_("/Conversation/_Unblock..."), NULL, menu_unblock_cb, 0,
-+	{ N_("/Conversation/_Unblock..."), NULL, (GtkItemFactoryCallback)menu_unblock_cb, 0,
- 			"<StockItem>", PIDGIN_STOCK_TOOLBAR_UNBLOCK },
--	{ N_("/Conversation/_Add..."), NULL, menu_add_remove_cb, 0,
-+	{ N_("/Conversation/_Add..."), NULL, (GtkItemFactoryCallback)menu_add_remove_cb, 0,
- 			"<StockItem>", GTK_STOCK_ADD },
--	{ N_("/Conversation/_Remove..."), NULL, menu_add_remove_cb, 0,
-+	{ N_("/Conversation/_Remove..."), NULL, (GtkItemFactoryCallback)menu_add_remove_cb, 0,
- 			"<StockItem>", GTK_STOCK_REMOVE },
- 
- 	{ "/Conversation/sep3", NULL, NULL, 0, "<Separator>", NULL },
- 
--	{ N_("/Conversation/Insert Lin_k..."), NULL, menu_insert_link_cb, 0,
-+	{ N_("/Conversation/Insert Lin_k..."), NULL, (GtkItemFactoryCallback)menu_insert_link_cb, 0,
- 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_INSERT_LINK },
--	{ N_("/Conversation/Insert Imag_e..."), NULL, menu_insert_image_cb, 0,
-+	{ N_("/Conversation/Insert Imag_e..."), NULL, (GtkItemFactoryCallback)menu_insert_image_cb, 0,
- 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_INSERT_IMAGE },
- 
- 	{ "/Conversation/sep4", NULL, NULL, 0, "<Separator>", NULL },
- 
- 
--	{ N_("/Conversation/_Close"), NULL, menu_close_conv_cb, 0,
-+	{ N_("/Conversation/_Close"), NULL, (GtkItemFactoryCallback)menu_close_conv_cb, 0,
- 			"<StockItem>", GTK_STOCK_CLOSE },
- 
- 	/* Options */
- 	{ N_("/_Options"), NULL, NULL, 0, "<Branch>", NULL },
--	{ N_("/Options/Enable _Logging"), NULL, menu_logging_cb, 0, "<CheckItem>", NULL },
--	{ N_("/Options/Enable _Sounds"), NULL, menu_sounds_cb, 0, "<CheckItem>", NULL },
-+	{ N_("/Options/Enable _Logging"), NULL, (GtkItemFactoryCallback)menu_logging_cb, 0, "<CheckItem>", NULL },
-+	{ N_("/Options/Enable _Sounds"), NULL, (GtkItemFactoryCallback)menu_sounds_cb, 0, "<CheckItem>", NULL },
- 	{ "/Options/sep0", NULL, NULL, 0, "<Separator>", NULL },
--	{ N_("/Options/Show Formatting _Toolbars"), NULL, menu_toolbar_cb, 0, "<CheckItem>", NULL },
--	{ N_("/Options/Show Ti_mestamps"), NULL, menu_timestamps_cb, 0, "<CheckItem>", NULL },
-+	{ N_("/Options/Show Formatting _Toolbars"), NULL, (GtkItemFactoryCallback)menu_toolbar_cb, 0, "<CheckItem>", NULL },
-+	{ N_("/Options/Show Ti_mestamps"), NULL, (GtkItemFactoryCallback)menu_timestamps_cb, 0, "<CheckItem>", NULL },
- };
- 
- static const int menu_item_count =
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
similarity index 96%
rename from meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
index ba7bbc52ff..13a22f6e59 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
@@ -10,10 +10,9 @@ inherit autotools gettext pkgconfig gconf perlnative python3native
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
-    file://fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch \
 "
 
-SRC_URI[sha256sum] = "120049dc8e17e09a2a7d256aff2191ff8491abb840c8c7eb319a161e2df16ba8"
+SRC_URI[sha256sum] = "0ffc9994def10260f98a55cd132deefa8dc4a9835451cc0e982747bd458e2356"
 
 CVE_STATUS[CVE-2010-1624] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2011-3594] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."

