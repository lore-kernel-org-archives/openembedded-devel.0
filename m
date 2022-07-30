Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1716C04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 17:25:55 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.5172.1659201950542292670
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 10:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ebcUMEpV;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id h8so4629361qvs.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wlyh4u6XpVj0lkDPLytHxsIRahlBWgBNdU4U8yJPsgo=;
        b=ebcUMEpVFXJbK05EWu+h0b4zvXhLClTsihvAGWe3/PDY0PXGDyaUJ6S++wPQ3YdI1y
         Fev1vbuwbQCjCR0ezXPcSS8L29mmxf820Eta6w/DEC8Mz7yigBzf/JXrTlOzBdVBBo+V
         kXV9m4onQMnChK8iDxERJjUEmxkba7yUVOUfOGCvv1ZC2gHGQ1vZAaJWwdj4S3lpi5ta
         gRIg1Pcm4cbfoC2FiTwqzS+H+RJaUiDYBvMpgyzZSUeE9y3mgx1+SmQ6NQ7Q00nXnqeq
         BLSYpxYUMXpmdFd2VUuOEeznmkHIVzBimi64U77CirUCV+WuS4msSIsIOgG98mg/OFxD
         7rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wlyh4u6XpVj0lkDPLytHxsIRahlBWgBNdU4U8yJPsgo=;
        b=vWFCp1n0JkOXVNrei9AJHDbLKSixtWjCjYcYRsbPxOS0/naSJY+nInsu5iD1w7Q07o
         T8BwSDZa/ZVU3BUKtuQne22jNDdwkWSb3LxTzwxXG3ITt6HjUIsr/2Ih2yBVaDRg/t0w
         oBMYkB8Eyr31zqEXFTalmUq0bJ8Pio/Pzw01w2dsgSqqVjQMgHwNUw8Va7QU4084E+Sg
         nuKU2r2oFvrC24vg7TyM5HMJkhL1LKz4NS4+WH2FuZ4xMM/GCDVxXflOISWyEmHAgw3q
         HWY0i0ZwnYRd8TSJRPa2i1Rsyh43KcpMtYNB6PkU3nCvOX0qMxvXz5cZSyjWeTFe9OHL
         73fQ==
X-Gm-Message-State: ACgBeo3v4U/3wxVzeYzEJPqdXLbxA39UjaEbwNnL/wfW4wxjochXmy6y
	5cs/z3EZvXD9dG0OUCDUzP+e97fec2rQP7sjcHo=
X-Google-Smtp-Source: 
 AA6agR7iHB46mUOaJhFbstvxnQnO3vdjvSI2q+OTrXY8yLKQikgm0DNzrSUXrthuenovMzNl9jAK0bQxdt4rylHJWA4=
X-Received: by 2002:ad4:5aab:0:b0:474:74b2:e830 with SMTP id
 u11-20020ad45aab000000b0047474b2e830mr7790354qvg.36.1659201949594; Sat, 30
 Jul 2022 10:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220730152545.294982-1-f_l_k@t-online.de>
In-Reply-To: <20220730152545.294982-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Jul 2022 13:25:23 -0400
Message-ID: 
 <CAMKF1spWqX_q_LNzhA2f5vgVLHBHjLN4p_YkFoXn=5aWVkW8Qw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] ibus.inc: fix after branch renaming
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 17:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98059

On Sat, Jul 30, 2022 at 11:26 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> this fixes:
> ERROR: ibus-native-1.5.26-r0 do_fetch: Fetcher failure: Unable to find revision 6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3
> in branch master even from upstream
>

even when you do bitbake -ccleanall <recipe> && bitbake <recipe> ?

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-support/ibus/ibus.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
> index 37a490abe..b21a5e528 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.inc
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -10,7 +10,7 @@ PV = "1.5.26"
>  DEPENDS = "unicode-ucd"
>
>  SRC_URI = " \
> -    git://github.com/ibus/ibus.git;branch=master;protocol=https \
> +    git://github.com/ibus/ibus.git;nobranch=1;protocol=https \
>      file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
>  "
>  SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98058): https://lists.openembedded.org/g/openembedded-devel/message/98058
> Mute This Topic: https://lists.openembedded.org/mt/92711747/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

