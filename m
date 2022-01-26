Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6E7C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:36:27 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.9358.1643178986515819918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1ET0iJ1;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id o12so7362203qke.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODSm7p0NIY8N8J6nbq9ODPEnoJBc6v92TqdD8gRzscc=;
        b=V1ET0iJ1sF3w8dZtm0a9rRFmhZHknhtCmKMHSdZZIh4g8kJEbHPE1Cfqd0CqR94jK3
         /EFTfRTKa7G85Hz+gxTEZk8mndSsFZDY5f93hFL8n8915S6sxWa9vz16qF1+yH30erZz
         HG3hg9cQ/+xp1om6Lmp0WeM6n9luQ47eTrXDBRAF/rbvh2JgVwcGmyDbLnLS5s0MWcGv
         TcCNbPLRkLd3FAvrb23EtkgZiwveRWhojVTK12/iZW4FQySQqyUsuCytVFh6AdlvhsPB
         dL7/X6UC2crPalBbEIzS09OPaR6lMVjtJ818c0UVpCf/TeQGCCB15n9ETEozdeEPUDmC
         /Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODSm7p0NIY8N8J6nbq9ODPEnoJBc6v92TqdD8gRzscc=;
        b=VVKmcR6a0KURhQ0hYIIWb3823LE8X0ZKN23HQy/6wvt8Qqd1wH4S+Pe/UYzIkJ0Tvu
         ECEBfzkGFS7w2D01Gl9z4Y/TrwTDzsG2jGCRtYo062ehTHe5djMvybrN/9RHzLoeS8Sw
         /CCQCqQRN+SH5KXxNPHtvaOGSUJqKKRoRGwcv0qw1jdRSxSTQQdx0kVpgWU0YXrUopBR
         Dqkr7/PJAnYoLS+p+5bwzYQA9WSDiB4UAZtQxDgf8eR06T/Yj3F2FpjpzEv9lkQzunYN
         CnVeSgeYNMWnqZV0mVw+XKgZ0LmMvBBQeEOzP18jWorZv1CC8ToqHe8qX5pCYLKvhWM/
         jLtA==
X-Gm-Message-State: AOAM533ZhqgXLpcqm6ccDlN0bXY0EsEx6Pf1g4K7LBko4gAYAo3J5tyC
	RQCaoh9I+4PvZBH6Hornwzan8cF2lff9pKlhnD4=
X-Google-Smtp-Source: 
 ABdhPJxyOjRY8MEH0AZeri7KqfUQyR0thbVjZR7Z6AeedlFPiC3gfAlXHGA3F3RepLaizEwT2ZMuP8/uBx+reHMueGI=
X-Received: by 2002:a37:5541:: with SMTP id
 j62mr16794174qkb.180.1643178985528;
 Tue, 25 Jan 2022 22:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20220126060104.578932-1-f_l_k@t-online.de>
In-Reply-To: <20220126060104.578932-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2022 22:35:59 -0800
Message-ID: 
 <CAMKF1soCvBP6kNsGfcFQ1zaS6LUAK7thNy97aCj0B8q2+RzMjA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] evolution-data-server: try to fix g-i
 data generation
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 06:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95098

On Tue, Jan 25, 2022 at 10:01 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../evolution-data-server/evolution-data-server.bb           | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> index 9ccaedbcc..c5c7d947f 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> @@ -27,14 +27,15 @@ EXTRA_OECMAKE = " \
>      -DENABLE_UOA=OFF \
>      -DENABLE_GOOGLE_AUTH=OFF \
>      -DENABLE_WEATHER=OFF \
> -    -DG_IR_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper \
> -    -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper \
>      -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen \
>      ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON -DENABLE_VALA_BINDINGS=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>      -D${LKSTRFTIME} \
>      -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
>  "
>
> +EXTRA_OECMAKE:append:class-target = " -DG_IR_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
> +EXTRA_OECMAKE:append:class-target = " -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
> +

Can you test it for TCLIBC = "musl"


>  PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
>  PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,webkitgtk json-glib"
>  PACKAGECONFIG[goa]    = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95097): https://lists.openembedded.org/g/openembedded-devel/message/95097
> Mute This Topic: https://lists.openembedded.org/mt/88691224/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

