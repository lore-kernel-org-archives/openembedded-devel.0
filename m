Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BDAC4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 03:09:47 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.129530.1672024181300424934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 19:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XqSEMPL8;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id j16-20020a056830271000b0067202045ee9so6036412otu.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 19:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kXYntJDPY6dpZHsZwg9qA7BzoMC4Hb8fb98gTiMgyn8=;
        b=XqSEMPL8nZ8ARi5KYHranzS9DCuB4/ryRWY1WKMkFQhxV466VDKDSGgENHJWqQrPLX
         BNdNFsQf5kPCLCUutFKBYL/7is7g/Qqx2kKsE7Hx6KofcfN5aFnXJsRow97yjlE+oHDg
         g4gDhW9doyegZQ8NacSnBgwECOdvarXkzMX257nKBJePspxWG/zayWahl66Fc9oWhCGm
         0ACaXBuspe1mhwcZStJiRaYGWiCduxntR5ZF3hFdihjTRqwa16PzBTvLMQwt9ZSV1pDV
         +KHPog6h0EyKbO+c9GjvtHTL/xkvusfPsS6jCc7LwJCs3hwtG5bMuyOdC0eJDGjxiK2M
         YdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXYntJDPY6dpZHsZwg9qA7BzoMC4Hb8fb98gTiMgyn8=;
        b=A3p3dxdq43uTwdrNhIBe2Uhivut7MK1rc29spEpVnfNM04C3Vw42CiakSqlsBgs7Ec
         gyyS92xtu9vGuCZsKHGpo3JnQfe5qfckDyiv16S32we1I4mrmg6xk0fsr/NISac/jvWU
         62MGBK6MpMwEpTrI80+D9Vb5XuI1AKSY41dJ2+lPxkkvlqnoCifwgqExZWEQV9MQaMtf
         E55pD/R5LdMthD60vvaKqjSCjanLjC8BZ8+wt6HO5X5rMR+wDa212/lNh991DU8cLPWM
         EbCWEHwSn4s5L2zF9dIec1FvDcSDBmAj1drUOVP2nzwEpOE35z/TVr9CnJ6OTC78GFFe
         IZ4A==
X-Gm-Message-State: AFqh2kr0E3YcBTgAfDRUzOShoWtcX8bpXhG5moIGUGcc78KoUVadVccO
	RxB/cfeDnSkECBP3zQmGPqKajcTmLPsUbpeEvhQ=
X-Google-Smtp-Source: AMrXdXvgYfUaIGMqYsALH6L+2Cc4nAI+JVx+bHenko8wokC3nHx+TXF77CceH7G3+Ow8quwNK/SeIvWv9loIgLZFiqg=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr1017696otk.111.1672024180368; Sun, 25
 Dec 2022 19:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20221223031104.13517-1-f_l_k@t-online.de>
In-Reply-To: <20221223031104.13517-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Dec 2022 19:09:14 -0800
Message-ID: <CAMKF1soVJ0fnzzrzdidrce=sTRzKFGUF9fMbEW+yf-yRKCNj2A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2 1/3] xdg-desktop-portal-gnome: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 03:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100232

I think it needs to check for polkit in distro features see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2267/steps/11/logs/stdio

On Thu, Dec 22, 2022 at 7:11 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../xdg-desktop-portal-gnome_43.1.bb          | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
>
> diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
> new file mode 100644
> index 000000000..52e0e1f1d
> --- /dev/null
> +++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "A xdg-desktop-portal backend for gnome."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = " \
> +    glib-2.0-native \
> +    gtk4\
> +    xdg-desktop-portal \
> +    libadwaita \
> +    fontconfig \
> +    gsettings-desktop-schemas \
> +    gnome-desktop \
> +    dconf \
> +"
> +
> +inherit meson pkgconfig gsettings
> +
> +SRC_URI = "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;protocol=https;nobranch=1"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "4fd5a8bf16b01c78ed19764415cb26d29aaf7eab"
> +
> +PACKAGECONFIG ?= ""
> +
> +PACKAGECONFIG[screenshot] = ",,,gnome-shell"
> +PACKAGECONFIG[screencast] = ",,,mutter"
> +
> +FILES:${PN} += "${systemd_user_unitdir} ${datadir}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100196): https://lists.openembedded.org/g/openembedded-devel/message/100196
> Mute This Topic: https://lists.openembedded.org/mt/95838955/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

