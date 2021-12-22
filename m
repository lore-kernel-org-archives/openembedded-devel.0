Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DC4C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:36:00 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.14587.1640140560361324048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XFsR/HgU;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id l17so679105qtk.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wgEDCTkUO435urmxcq9t4Kxm27uipFgFxCctZDDJRXA=;
        b=XFsR/HgUtMh+d9owm6qBCMT/D3pkXAZV2qZxHGvu+IDqlI3bj3KoyndfQdRiNwktNX
         AIvt+6O9vPkroYjEe1G10KI38TB98k1KIZmREFSHqwiFdxoVHQr49eJNsJeSykBNpE4h
         pZ0EC55mm0yMvZK6p4R64yPZdIJ3dB0Bk/3xsUD+rT/IdA2zvkHC7MuTf0MVuXftxv6s
         O8f+4rhuiMbr8HUoAOsIiT2TsCZZSo3PGWXifpBPMs9HZtbmCbrLvAF8LLYe+MO0c7+8
         aSl3F3biOZ+l6BkzdTla8A520FZmM9/50ODJ92TJxbtQ0sQ5dIlP2Is2KgUesyOkZ2MU
         y0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wgEDCTkUO435urmxcq9t4Kxm27uipFgFxCctZDDJRXA=;
        b=vMnTD3DezUH57yndx1gWV+nNPdncUTb4AmhmvnpkFVRarIK8DxAK2jMpOkob0cYumD
         reglTCAW7//IIlrtlUOf7Jjn7l/SJbYEP76xXhU2ro4H0t4RSC2FAj2YrVGGVt1M8/05
         pH7PCueX0JGPwqAzaPDizwyEycqc1Wmc4eDP1bXl0n2qPeD/7COzBOj5FmvPIVgCnENe
         LPzsJNajaLdgA+jLVWY+QN7AOLIbgMcTeVABzvbAuR8sFWj0+hOwlbiYf2Rc6aVb20le
         tEIj78cYb/ybAn25EgcKzCvGXobqfGu5qpe8RLiUn59TRS7STDRxeGnZ6QxAtD66h8tt
         NZ+w==
X-Gm-Message-State: AOAM5315vwxZeV0o6T/2/dK9fCo9kzFijXNwQwsS6knySdEqkk/SylP6
	ZYR/eupXnZ1wqG4dXIqkCMPal4hDGSGL+wdpGAU=
X-Google-Smtp-Source: 
 ABdhPJyO3Pq0wHZ5wmNHHZgQtYBNEJZrARwlIicMDPaeDMV2k/qswQ4AI1u8gS74o5we9YSN246OdauQMSdQl36barY=
X-Received: by 2002:ac8:518e:: with SMTP id c14mr795810qtn.665.1640140559418;
 Tue, 21 Dec 2021 18:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20211219084754.2215526-1-jan.vermaete@gmail.com>
In-Reply-To: <20211219084754.2215526-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2021 18:35:33 -0800
Message-ID: 
 <CAMKF1sr+zdcj8T0yf_+1w9FKhAWA81giW2-gmkH7Z-52aEvMDg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v2 1/3] netdata: version bump from
 1.32.0 to 1.32.1
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 02:36:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94475

it fails to configure

https://errors.yoctoproject.org/Errors/Details/619704/

On Sun, Dec 19, 2021 at 12:48 AM Jan Vermaete <jan.vermaete@gmail.com> wrote:
>
> Changelog: https://github.com/netdata/netdata/releases/tag/1.32.1
>
> test: raspberrypi4-64
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../netdata/{netdata_1.32.0.bb => netdata_1.32.1.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-webadmin/netdata/{netdata_1.32.0.bb => netdata_1.32.1.bb} (93%)
>
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
> similarity index 93%
> rename from meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
> rename to meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
> index 5b7f43f33..7f99e9d4c 100644
> --- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
> @@ -5,8 +5,8 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
>
> -SRC_URI = "https://github.com/netdata/netdata/releases/download/v${PV}/netdata-v${PV}.tar.gz"
> -SRC_URI[sha256sum] = "5e066d322f88013cea78eb9bb42bca64599278b9db8d46593777e4258743fefd"
> +SRC_URI = "https://github.com/${PN}/${PN}/releases/download/${PV}/${PN}-v${PV}.tar.gz"
> +SRC_URI[sha256sum] = "ac406513e86ad24976a66146702aeac960e43908abc51d70e4a073905275d13e"
>
>  # default netdata.conf for netdata configuration
>  SRC_URI += "file://netdata.conf"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94440): https://lists.openembedded.org/g/openembedded-devel/message/94440
> Mute This Topic: https://lists.openembedded.org/mt/87833171/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

