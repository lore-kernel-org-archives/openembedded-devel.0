Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F54C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 10:30:11 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.18880.1679740204571890618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 03:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout07.t-online.de (Postfix) with SMTP id 4746122249
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 11:30:02 +0100 (CET)
Received: from [192.168.178.83] ([84.154.174.49]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pg19t-4OLZCq0; Sat, 25 Mar 2023 11:30:01 +0100
Message-ID: <6397c1d1-acd7-6713-bb2c-60a94f42c427@t-online.de>
Date: Sat, 25 Mar 2023 11:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-gnome][PATCH 09/32] gnome-chess: update 43.2 -> 44.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20230325080256.923752-1-f_l_k@t-online.de>
 <174F9ACDC80FD1FC.7603@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <174F9ACDC80FD1FC.7603@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1679740201-AE6BCCC3-EDF77A83/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d280420-5e46-4a1d-bd90-b6323ff1f442
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 10:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101747

This one was sent accidentially and can be dropped.

Am 25.03.23 um 09:02 schrieb Markus Volk:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../{gnome-chess_43.2.bb => gnome-chess_44.0.bb}         | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>   rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.2.bb => gnome-chess_44.0.bb} (70%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
> similarity index 70%
> rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
> rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
> index 343135bfa..d9727ec1c 100644
> --- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
> @@ -22,13 +22,12 @@ DEPENDS = " \
>   
>   RRECOMMENDS:${PN}  = "gnuchess"
>   
> -SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;nobranch=1"
> +SRC_URI[archive.sha256sum] = "734f092d95fc60409eeaca3427b5a48cb9b599da11995119d85baa99653e0292"
>   
> -inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
> +inherit gnomebase meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
>   
> +GNOMEBASEBUILDCLASS = "meson"
> +GTKIC_VERSION = '4'
>   GIR_MESON_OPTION = ""
>   
> -S = "${WORKDIR}/git"
> -SRCREV = "de47d07ec6fc828b2668ca6ee59fe9bdfa9dc1d6"
> -
>   FILES:${PN} += "${datadir}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101722): https://lists.openembedded.org/g/openembedded-devel/message/101722
> Mute This Topic: https://lists.openembedded.org/mt/97840032/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

