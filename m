Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F21C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:20:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7319.1720509642031071959
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MWNHoY/i;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367a183df54so2947602f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720509640; x=1721114440; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zE9F4U/9YOMYzznZE8ADtRItsv9PI9f7Hc5cbXUQt5w=;
        b=MWNHoY/i1S/3nIHsvb4Pwcoj01ai9B2PygnxLyWsQv7wuiVGDlv2D+0DgaMALfEnjT
         CmipCDJ9qBVwI/P52IBzr5zMRIfSBX/LK7kXo9PXqkdQasHmK+USriQBh2CofJH0VoNg
         vDHOrB1aFXqybFbBm90p28n9A6oZpus7y3FTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509640; x=1721114440;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE9F4U/9YOMYzznZE8ADtRItsv9PI9f7Hc5cbXUQt5w=;
        b=UfBP2E98zMR0ERh+br5ozfT7oeTcnNmCVaVbzgHECy2ZZA6A8zX5S4u7QeaNC/3bjh
         UOdVo8j8uoCxZTy0q/WbqUWYcomcAYyMfbz7GailI0gWBol+1G7CAmOKDE5Zhcg9E51t
         0EzgLlrZLr4bMSNyoJpu3j3bMl0n54qdrjUqDSloNculMMq/pLmPwL/HlnaO3wWg0Y6d
         bTV8sRnDn19LKhXTSG7cyXqPQPelhBE0Kf1FGy4tM6jpdic+BWf79S8efi7R7BqTDrFG
         4BBZxDQjFZ7ynWDm2kvD1XsEoxvI3UTa7oAyTZOrVzOtlZHF2kYlxy8q1WeXX4jXCKvn
         O2IQ==
X-Gm-Message-State: AOJu0YyPD1vOeWUgnDDf5WdnMb11AL6ZTVC8iYdubO+JfgNihrMPWjpE
	Kps39prNLgJ5mlv/zzMoKMPEXCMGJFD5njS6Xv7nj+FjCBNu0MNKHHVdYpqdigp4+N/ZmNTDj68
	4
X-Google-Smtp-Source: AGHT+IGNf8JUZ8P5ta0J4E+67eYz77EcmBzrcxcL6owaJ1jYH7J/8uRH73CAJgZSSMzetqBD9VqkHQ==
X-Received: by 2002:a5d:564a:0:b0:367:8811:5e3c with SMTP id ffacd0b85a97d-367cea6b768mr1127376f8f.20.1720509639423;
        Tue, 09 Jul 2024 00:20:39 -0700 (PDT)
Received: from [192.168.0.22] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84928sm1682420f8f.46.2024.07.09.00.20.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 00:20:39 -0700 (PDT)
Message-ID: <c1548b45-9545-4d78-9bd1-74a45cf61217@smile.fr>
Date: Tue, 9 Jul 2024 09:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] pidgin: Upgrade to 2.14.13
To: openembedded-devel@lists.openembedded.org
References: <20240708221801.876799-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240708221801.876799-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 07:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111280



Le 09/07/2024 à 00:18, Yoann Congal a écrit :
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Upstream changelog: https://www.pidgin.im/ChangeLog
> 
> Recipe changes:
> * Add a patch (in review) to support building on gcc-14
> * Drop OE branding patch (code supporting this has disapeared or is
>   disabled)
> * Remove vv and farsight2 PACKAGECONFIGs (depend on the removed
>   farsight2 recipe[0])
> * Fixed an obvious reproducibility issue with TMPDIR in binary
> 
> [0]: https://git.openembedded.org/meta-openembedded/commit/?id=ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  ...or_gtkitemfactorycallbacks_on_gcc-14.patch | 177 ++++++++++++++++++
>  .../pidgin/pidgin/purple-OE-branding-25.patch |  26 ---
>  .../{pidgin_2.14.2.bb => pidgin_2.14.13.bb}   |  19 +-
>  3 files changed, 190 insertions(+), 32 deletions(-)
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
>  delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
>  rename meta-oe/recipes-support/pidgin/{pidgin_2.14.2.bb => pidgin_2.14.13.bb} (89%)
> 
> diff --git a/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch b/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
> new file mode 100644
> index 0000000000..b8e3d479fe
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
> @@ -0,0 +1,177 @@
> +# HG changeset patch
> +# User Yoann Congal <yoann.congal@smile.fr>
> +# Date 1720270125 -7200
> +#      Sat Jul 06 14:48:45 2024 +0200
> +# Branch gcc-14-incompatible-pointer-types
> +# Node ID 06721b86a5a8e6fb8163d9411a7778d2a0274b26
> +# Parent  21a56db5f9987efb88d76ab26ee1eadf316f3d7d
> +Fix incompatible pointer types for GtkItemFactoryCallbacks on gcc-14
> +
> +The GtkItemFactoryEntry struct callback is of type GtkItemFactoryCallbacks
> +(aka void (*)(void)) but is initialised with GtkItemFactoryCallback1 types
> +(aka void (*)(void *, guint,  GtkWidget *)).
> +
> +This is coherent with the gtk-2 documentation:
> +> gtk_item_factory_create_items(..., GtkItemFactoryEntry *entries,...)
> +>  entries : an array of GtkItemFactoryEntrys whose callback members must by of
> +>  type GtkItemFactoryCallback1
> +
> +But, under gcc-14, the implicit cast from GtkItemFactoryCallback1 to
> +GtkItemFactoryCallback triggers an incompatible-pointer-types error (See [0]).
> +
> +An exemple of this error:
> +pidgin/gtkconv.c:3096:66: error: initialization of 'void (*)(void)' from incompatible pointer type 'void (*)(void *, guint,  GtkWidget *)' {aka 'void (*)(void *, unsigned int,  struct _GtkWidget *)'} [-Wincompatible-pointer-types]
> + 3096 |         { N_("/Conversation/New Instant _Message..."), "<CTL>M", menu_new_conv_cb,
> +      |                                                                  ^~~~~~~~~~~~~~~~
> +pidgin/gtkconv.c:3096:66: note: (near initialization for 'menu_items[1].callback')
> +
> +To fix this, explicitely cast to GtkItemFactoryCallback where needed.
> +
> +Testing Done:
> +Built with gcc-14, started and clicked on some affected menus
> +
> +[0]: https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types
> +
> +Upstream-Status: Submitted [https://reviews.imfreedom.org/r/3282/]

This patch has been merged. This is now:
  Upstream-Status: Backport [https://keep.imfreedom.org/pidgin/pidgin/rev/210f318db492]

v2 sent with this modification.

> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +
> +diff --git a/pidgin/gtkblist.c b/pidgin/gtkblist.c
> +--- a/pidgin/gtkblist.c
> ++++ b/pidgin/gtkblist.c
> +@@ -3624,11 +3624,11 @@ static GtkItemFactoryEntry blist_menu[] 
> + 	{ N_("/Buddies/View User _Log..."), "<CTL>L", pidgin_dialogs_log, 0, "<Item>", NULL },
> + 	{ "/Buddies/sep1", NULL, NULL, 0, "<Separator>", NULL },
> + 	{ N_("/Buddies/Sh_ow"), NULL, NULL, 0, "<Branch>", NULL},
> +-	{ N_("/Buddies/Show/_Offline Buddies"), NULL, pidgin_blist_edit_mode_cb, 1, "<CheckItem>", NULL },
> +-	{ N_("/Buddies/Show/_Empty Groups"), NULL, pidgin_blist_show_empty_groups_cb, 1, "<CheckItem>", NULL },
> +-	{ N_("/Buddies/Show/Buddy _Details"), NULL, pidgin_blist_buddy_details_cb, 1, "<CheckItem>", NULL },
> +-	{ N_("/Buddies/Show/Idle _Times"), NULL, pidgin_blist_show_idle_time_cb, 1, "<CheckItem>", NULL },
> +-	{ N_("/Buddies/Show/_Protocol Icons"), NULL, pidgin_blist_show_protocol_icons_cb, 1, "<CheckItem>", NULL },
> ++	{ N_("/Buddies/Show/_Offline Buddies"), NULL, (GtkItemFactoryCallback)pidgin_blist_edit_mode_cb, 1, "<CheckItem>", NULL },
> ++	{ N_("/Buddies/Show/_Empty Groups"), NULL, (GtkItemFactoryCallback)pidgin_blist_show_empty_groups_cb, 1, "<CheckItem>", NULL },
> ++	{ N_("/Buddies/Show/Buddy _Details"), NULL, (GtkItemFactoryCallback)pidgin_blist_buddy_details_cb, 1, "<CheckItem>", NULL },
> ++	{ N_("/Buddies/Show/Idle _Times"), NULL, (GtkItemFactoryCallback)pidgin_blist_show_idle_time_cb, 1, "<CheckItem>", NULL },
> ++	{ N_("/Buddies/Show/_Protocol Icons"), NULL, (GtkItemFactoryCallback)pidgin_blist_show_protocol_icons_cb, 1, "<CheckItem>", NULL },
> + 	{ N_("/Buddies/_Sort Buddies"), NULL, NULL, 0, "<Branch>", NULL },
> + 	{ "/Buddies/sep2", NULL, NULL, 0, "<Separator>", NULL },
> + 	{ N_("/Buddies/_Add Buddy..."), "<CTL>B", pidgin_blist_add_buddy_cb, 0, "<StockItem>", GTK_STOCK_ADD },
> +@@ -3651,11 +3651,11 @@ static GtkItemFactoryEntry blist_menu[] 
> + 	{ N_("/Tools/Pr_ivacy"), NULL, pidgin_privacy_dialog_show, 0, "<Item>", NULL },
> + 	{ N_("/Tools/Set _Mood"), "<CTL>D", set_mood_show, 0, "<Item>", NULL },
> + 	{ "/Tools/sep2", NULL, NULL, 0, "<Separator>", NULL },
> +-	{ N_("/Tools/_File Transfers"), "<CTL>T", pidgin_xfer_dialog_show, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_TRANSFER },
> ++	{ N_("/Tools/_File Transfers"), "<CTL>T", (GtkItemFactoryCallback)pidgin_xfer_dialog_show, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_TRANSFER },
> + 	{ N_("/Tools/R_oom List"), NULL, pidgin_roomlist_dialog_show, 0, "<Item>", NULL },
> + 	{ N_("/Tools/System _Log"), NULL, gtk_blist_show_systemlog_cb, 3, "<Item>", NULL },
> + 	{ "/Tools/sep3", NULL, NULL, 0, "<Separator>", NULL },
> +-	{ N_("/Tools/Mute _Sounds"), NULL, pidgin_blist_mute_sounds_cb, 0, "<CheckItem>", NULL },
> ++	{ N_("/Tools/Mute _Sounds"), NULL, (GtkItemFactoryCallback)pidgin_blist_mute_sounds_cb, 0, "<CheckItem>", NULL },
> + 	/* Help */
> + 	{ N_("/_Help"), NULL, NULL, 0, "<Branch>", NULL },
> + 	{ N_("/Help/Online _Help"), "F1", gtk_blist_show_onlinehelp_cb, 0, "<StockItem>", GTK_STOCK_HELP },
> +diff --git a/pidgin/gtkconv.c b/pidgin/gtkconv.c
> +--- a/pidgin/gtkconv.c
> ++++ b/pidgin/gtkconv.c
> +@@ -3093,76 +3093,76 @@ static GtkItemFactoryEntry menu_items[] 
> + 	/* Conversation menu */
> + 	{ N_("/_Conversation"), NULL, NULL, 0, "<Branch>", NULL },
> + 
> +-	{ N_("/Conversation/New Instant _Message..."), "<CTL>M", menu_new_conv_cb,
> ++	{ N_("/Conversation/New Instant _Message..."), "<CTL>M", (GtkItemFactoryCallback)menu_new_conv_cb,
> + 			0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_MESSAGE_NEW },
> +-	{ N_("/Conversation/Join a _Chat..."), NULL, menu_join_chat_cb,
> ++	{ N_("/Conversation/Join a _Chat..."), NULL, (GtkItemFactoryCallback)menu_join_chat_cb,
> + 			0, "<StockItem>", PIDGIN_STOCK_CHAT },
> + 
> + 	{ "/Conversation/sep0", NULL, NULL, 0, "<Separator>", NULL },
> + 
> +-	{ N_("/Conversation/_Find..."), NULL, menu_find_cb, 0,
> ++	{ N_("/Conversation/_Find..."), NULL, (GtkItemFactoryCallback)menu_find_cb, 0,
> + 			"<StockItem>", GTK_STOCK_FIND },
> +-	{ N_("/Conversation/View _Log"), NULL, menu_view_log_cb, 0, "<Item>", NULL },
> +-	{ N_("/Conversation/_Save As..."), NULL, menu_save_as_cb, 0,
> ++	{ N_("/Conversation/View _Log"), NULL, (GtkItemFactoryCallback)menu_view_log_cb, 0, "<Item>", NULL },
> ++	{ N_("/Conversation/_Save As..."), NULL, (GtkItemFactoryCallback)menu_save_as_cb, 0,
> + 			"<StockItem>", GTK_STOCK_SAVE_AS },
> +-	{ N_("/Conversation/Clea_r Scrollback"), "<CTL>L", menu_clear_cb, 0, "<StockItem>", GTK_STOCK_CLEAR },
> ++	{ N_("/Conversation/Clea_r Scrollback"), "<CTL>L", (GtkItemFactoryCallback)menu_clear_cb, 0, "<StockItem>", GTK_STOCK_CLEAR },
> + 
> + 	{ "/Conversation/sep1", NULL, NULL, 0, "<Separator>", NULL },
> + 
> + #ifdef USE_VV
> + 	{ N_("/Conversation/M_edia"), NULL, NULL, 0, "<Branch>", NULL },
> + 
> +-	{ N_("/Conversation/Media/_Audio Call"), NULL, menu_initiate_media_call_cb, 0,
> ++	{ N_("/Conversation/Media/_Audio Call"), NULL, (GtkItemFactoryCallback)menu_initiate_media_call_cb, 0,
> + 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_AUDIO_CALL },
> +-	{ N_("/Conversation/Media/_Video Call"), NULL, menu_initiate_media_call_cb, 1,
> ++	{ N_("/Conversation/Media/_Video Call"), NULL, (GtkItemFactoryCallback)menu_initiate_media_call_cb, 1,
> + 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_VIDEO_CALL },
> +-	{ N_("/Conversation/Media/Audio\\/Video _Call"), NULL, menu_initiate_media_call_cb, 2,
> ++	{ N_("/Conversation/Media/Audio\\/Video _Call"), NULL, (GtkItemFactoryCallback)menu_initiate_media_call_cb, 2,
> + 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_VIDEO_CALL },
> + #endif
> + 
> +-	{ N_("/Conversation/Se_nd File..."), NULL, menu_send_file_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_FILE },
> +-	{ N_("/Conversation/Get _Attention"), NULL, menu_get_attention_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_ATTENTION },
> +-	{ N_("/Conversation/Add Buddy _Pounce..."), NULL, menu_add_pounce_cb,
> ++	{ N_("/Conversation/Se_nd File..."), NULL, (GtkItemFactoryCallback)menu_send_file_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_FILE },
> ++	{ N_("/Conversation/Get _Attention"), NULL, (GtkItemFactoryCallback)menu_get_attention_cb, 0, "<StockItem>", PIDGIN_STOCK_TOOLBAR_SEND_ATTENTION },
> ++	{ N_("/Conversation/Add Buddy _Pounce..."), NULL, (GtkItemFactoryCallback)menu_add_pounce_cb,
> + 			0, "<Item>", NULL },
> +-	{ N_("/Conversation/_Get Info"), "<CTL>O", menu_get_info_cb, 0,
> ++	{ N_("/Conversation/_Get Info"), "<CTL>O", (GtkItemFactoryCallback)menu_get_info_cb, 0,
> + 			"<StockItem>", PIDGIN_STOCK_TOOLBAR_USER_INFO },
> +-	{ N_("/Conversation/In_vite..."), NULL, menu_invite_cb, 0,
> ++	{ N_("/Conversation/In_vite..."), NULL, (GtkItemFactoryCallback)menu_invite_cb, 0,
> + 			"<Item>", NULL },
> + 	{ N_("/Conversation/M_ore"), NULL, NULL, 0, "<Branch>", NULL },
> + 
> + 	{ "/Conversation/sep2", NULL, NULL, 0, "<Separator>", NULL },
> + 
> +-	{ N_("/Conversation/Al_ias..."), NULL, menu_alias_cb, 0,
> ++	{ N_("/Conversation/Al_ias..."), NULL, (GtkItemFactoryCallback)menu_alias_cb, 0,
> + 			"<Item>", NULL },
> +-	{ N_("/Conversation/_Block..."), NULL, menu_block_cb, 0,
> ++	{ N_("/Conversation/_Block..."), NULL, (GtkItemFactoryCallback)menu_block_cb, 0,
> + 			"<StockItem>", PIDGIN_STOCK_TOOLBAR_BLOCK },
> +-	{ N_("/Conversation/_Unblock..."), NULL, menu_unblock_cb, 0,
> ++	{ N_("/Conversation/_Unblock..."), NULL, (GtkItemFactoryCallback)menu_unblock_cb, 0,
> + 			"<StockItem>", PIDGIN_STOCK_TOOLBAR_UNBLOCK },
> +-	{ N_("/Conversation/_Add..."), NULL, menu_add_remove_cb, 0,
> ++	{ N_("/Conversation/_Add..."), NULL, (GtkItemFactoryCallback)menu_add_remove_cb, 0,
> + 			"<StockItem>", GTK_STOCK_ADD },
> +-	{ N_("/Conversation/_Remove..."), NULL, menu_add_remove_cb, 0,
> ++	{ N_("/Conversation/_Remove..."), NULL, (GtkItemFactoryCallback)menu_add_remove_cb, 0,
> + 			"<StockItem>", GTK_STOCK_REMOVE },
> + 
> + 	{ "/Conversation/sep3", NULL, NULL, 0, "<Separator>", NULL },
> + 
> +-	{ N_("/Conversation/Insert Lin_k..."), NULL, menu_insert_link_cb, 0,
> ++	{ N_("/Conversation/Insert Lin_k..."), NULL, (GtkItemFactoryCallback)menu_insert_link_cb, 0,
> + 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_INSERT_LINK },
> +-	{ N_("/Conversation/Insert Imag_e..."), NULL, menu_insert_image_cb, 0,
> ++	{ N_("/Conversation/Insert Imag_e..."), NULL, (GtkItemFactoryCallback)menu_insert_image_cb, 0,
> + 		"<StockItem>", PIDGIN_STOCK_TOOLBAR_INSERT_IMAGE },
> + 
> + 	{ "/Conversation/sep4", NULL, NULL, 0, "<Separator>", NULL },
> + 
> + 
> +-	{ N_("/Conversation/_Close"), NULL, menu_close_conv_cb, 0,
> ++	{ N_("/Conversation/_Close"), NULL, (GtkItemFactoryCallback)menu_close_conv_cb, 0,
> + 			"<StockItem>", GTK_STOCK_CLOSE },
> + 
> + 	/* Options */
> + 	{ N_("/_Options"), NULL, NULL, 0, "<Branch>", NULL },
> +-	{ N_("/Options/Enable _Logging"), NULL, menu_logging_cb, 0, "<CheckItem>", NULL },
> +-	{ N_("/Options/Enable _Sounds"), NULL, menu_sounds_cb, 0, "<CheckItem>", NULL },
> ++	{ N_("/Options/Enable _Logging"), NULL, (GtkItemFactoryCallback)menu_logging_cb, 0, "<CheckItem>", NULL },
> ++	{ N_("/Options/Enable _Sounds"), NULL, (GtkItemFactoryCallback)menu_sounds_cb, 0, "<CheckItem>", NULL },
> + 	{ "/Options/sep0", NULL, NULL, 0, "<Separator>", NULL },
> +-	{ N_("/Options/Show Formatting _Toolbars"), NULL, menu_toolbar_cb, 0, "<CheckItem>", NULL },
> +-	{ N_("/Options/Show Ti_mestamps"), NULL, menu_timestamps_cb, 0, "<CheckItem>", NULL },
> ++	{ N_("/Options/Show Formatting _Toolbars"), NULL, (GtkItemFactoryCallback)menu_toolbar_cb, 0, "<CheckItem>", NULL },
> ++	{ N_("/Options/Show Ti_mestamps"), NULL, (GtkItemFactoryCallback)menu_timestamps_cb, 0, "<CheckItem>", NULL },
> + };
> + 
> + static const int menu_item_count =
> diff --git a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
> deleted file mode 100644
> index 1c4daa9f67..0000000000
> --- a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 43e9db656431ffb22b429d5fca4ce3b4af21bc9e Mon Sep 17 00:00:00 2001
> -From: Herrie <github.com@herrie.org>
> -Date: Mon, 24 Jul 2017 21:30:16 +0200
> -
> ----
> -Upstream-Status: Pending
> -
> - libpurple/protocols/irc/irc.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libpurple/protocols/irc/irc.h b/libpurple/protocols/irc/irc.h
> -index 596ddaf..b70f3a9 100644
> ---- a/libpurple/protocols/irc/irc.h
> -+++ b/libpurple/protocols/irc/irc.h
> -@@ -40,9 +40,9 @@
> - 
> - #define IRC_DEFAULT_CHARSET "UTF-8"
> - #define IRC_DEFAULT_AUTODETECT FALSE
> --#define IRC_DEFAULT_ALIAS "purple"
> -+#define IRC_DEFAULT_ALIAS "OE-user"
> - 
> --#define IRC_DEFAULT_QUIT "Leaving."
> -+#define IRC_DEFAULT_QUIT "Powered by OE: www.openembedded.org"
> - 
> - #define IRC_BUFSIZE_INCREMENT 1024
> - #define IRC_MAX_BUFSIZE 16384
> diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
> similarity index 89%
> rename from meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
> rename to meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
> index ae251b5a08..ac62863f5c 100644
> --- a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
> +++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.13.bb
> @@ -10,10 +10,10 @@ inherit autotools gettext pkgconfig gconf perlnative python3native
>  SRC_URI = "\
>      ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
>      file://sanitize-configure.ac.patch \
> -    file://purple-OE-branding-25.patch \
> +    file://fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch \
>  "
>  
> -SRC_URI[sha256sum] = "19654ad276b149646371fbdac21bc7620742f2975f7399fed0ffc1a18fbaf603"
> +SRC_URI[sha256sum] = "120049dc8e17e09a2a7d256aff2191ff8491abb840c8c7eb319a161e2df16ba8"
>  
>  CVE_STATUS[CVE-2010-1624] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
>  CVE_STATUS[CVE-2011-3594] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
> @@ -21,7 +21,6 @@ CVE_STATUS[CVE-2011-3594] = "fixed-version: The CPE in the NVD database doesn't
>  PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notification', '', d)} \
>  "
> -PACKAGECONFIG[farsight2] = "--enable-farstream,--disable-farstream,farsight2"
>  #  --disable-gstreamer     compile without GStreamer audio support
>  #  --disable-gstreamer-video
>  #                          compile without GStreamer 1.0 Video Overlay support
> @@ -29,8 +28,7 @@ PACKAGECONFIG[farsight2] = "--enable-farstream,--disable-farstream,farsight2"
>  #                          compile without GStreamer 0.10 interface support
>  #  --with-gstreamer=<version>
>  #                          compile with GStreamer 0.10 or 1.0 interface
> -PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
> -PACKAGECONFIG[vv] = "--enable-vv,--disable-vv,gstreamer"
> +PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer1.0"
>  PACKAGECONFIG[idn] = "--enable-idn,--disable-idn,libidn"
>  PACKAGECONFIG[gtk] = "--enable-gtkui,--disable-gtkui,gtk+"
>  PACKAGECONFIG[x11] = "--with-x=yes --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--with-x=no,virtual/libx11"
> @@ -51,8 +49,17 @@ EXTRA_OECONF = " \
>      --disable-meanwhile \
>      --disable-nm \
>      --disable-screensaver \
> +    --disable-farstream \
> +    --disable-vv \
>  "
>  
> +# CONFIG_ARGS is used to display build info. Replace full paths by reproducible
> +# variables ($S, $WORKDIR)
> +do_configure:append() {
> +    sed -i -e "/CONFIG_ARGS/s|${S}|\$S|g" ${B}/config.h
> +    sed -i -e "/CONFIG_ARGS/s|${WORKDIR}|\$WORKDIR|g" ${B}/config.h
> +}
> +
>  OE_LT_RPATH_ALLOW=":${libdir}/purple-2:"
>  OE_LT_RPATH_ALLOW[export]="1"
>  
> @@ -73,7 +80,7 @@ FILES:finch          = "${bindir}/finch"
>  FILES:finch-dev      = "${libdir}/finch/*.la"
>  
>  FILES:${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \
> -           ${datadir}/applications"
> +           ${datadir}/applications ${datadir}/metainfo"
>  RRECOMMENDS:${PN} = "${PN}-data libpurple-protocol-irc libpurple-protocol-xmpp"
>  
>  FILES:${PN}-data = "${datadir}/pixmaps ${datadir}/sounds ${datadir}/icons ${datadir}/appdata"

-- 
Yoann Congal
Smile ECS - Tech Expert

