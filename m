Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3EFC4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 01:12:05 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.1251.1670548315976933162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Dec 2022 17:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hSp3zeJ8;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id q18-20020a056830441200b006704633f258so1958552otv.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 17:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XORuW/vXzGYsV+oZDsyCsHqU6pZ8j8xDbNXJcKtXvhQ=;
        b=hSp3zeJ8KMGnsecUofqN73D4uHFU0pY+vwCBZzVCkaVtH14iyRBvK5XgXV6Wtmmvze
         zr7Zlzj7jfQoiRLvuEwsqeKGDhLEv2+2vGhXEG6o0Wh0QC8DXk/rss+2LIPw6zIVDkRr
         rPCDRTcVq366tHLpKvDqNZk+YoSBGhr9lBG+VKloaBDXKTIefUybqB6W4H3yVaZTb5LI
         01yRBkHEPjMvzs5yOKYL9M2yX8fUNXw78W/3gU8jK2Vbj2hfN8NpEFhQeC87938+Do2o
         egtbgO2eJ6vSHA4qP1pLq/yyZeyecOKHxw15U7dyrev4IqT3kflV3BBftkDgVSFIV9Sb
         c27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XORuW/vXzGYsV+oZDsyCsHqU6pZ8j8xDbNXJcKtXvhQ=;
        b=Cjko0z+qvA0DUPm7JxNsv9LXUZKc2+4+Dp+E8aqsO8J9LOdubgbtTXDEP9p5EVfrp6
         fXez7CTzr6JT0ohxVXAtGusSJmLRTfg3iw417MA1vjCsrXZVYJ7kKrk937XF4W62Src2
         voIZmpq9sYXIeJVrDIpTGs0tPjxZmaw2GnipScpPqu5/ffB32QPatAfo7YaTXpLRzRAu
         omz+LyZvf/Gjnby7TeAodwH65Ezw4KlFEimA6K3vaPB9zpT1XBZchc6ss4Oz09xdcA4O
         0nEIuM18t1L4xAYRWLay45WlouWg00eq8EHsNE9a9PKCGUCstSdUbsmZMmFS+p4hEX0Z
         JNJQ==
X-Gm-Message-State: ANoB5pnpQQwgmr5GTEqugh1Mzs0Zl7u2FvSSSgzgnwcwLe6ATzT95ppe
	YLKRYff/WjTfMI2hnYa27Mw3OGe5pdNhxkcj0i4=
X-Google-Smtp-Source: AA0mqf5kU11S+GY5LtGE7GQwAzh8ynin3H36Xee1TSjkyvsBIIa5Zg3vamksNghYnksznYCJI7MlKMqqipSWtl6XypI=
X-Received: by 2002:a9d:6a44:0:b0:66c:fb5b:1d67 with SMTP id
 h4-20020a9d6a44000000b0066cfb5b1d67mr48346112otn.111.1670548315243; Thu, 08
 Dec 2022 17:11:55 -0800 (PST)
MIME-Version: 1.0
References: <1670382817-3426-1-git-send-email-leimaohui@fujitsu.com> <4e86afd7f45d47c29c714e5a4c030c0d@axis.com>
In-Reply-To: <4e86afd7f45d47c29c714e5a4c030c0d@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2022 17:11:29 -0800
Message-ID: <CAMKF1socoCebPzmG0cpyby4Fvrwy3D9=z45o5+aQiiUt=xApzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] polkit: Recover ${nonarch_libdir}/${BPN}-1
 into FILES:${PN} to fix install do_package error when enable multilib.
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: leimaohui <leimaohui@fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 01:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100001

Thanks for review Peter, I have made these changes on master-next

On Thu, Dec 8, 2022 at 4:07 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of leimaohui
> > Sent: den 7 december 2022 04:14
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Lei Maohui <leimaohui@fujitsu.com>
> > Subject: [oe] [meta-oe][PATCH] polkit: Recover ${nonarch_libdir}/${BPN}-1 into FILES:${PN} to fix install do_package error when enable multilib.
>
> That is a very long subject, way longer than the recommendations.
> I suggest you change it to something shorter, e.g.:
>
>   polkit: Make it build with multilib
>
> >
> > ERROR: polkit-122-r0 do_package: QA Issue: polkit: Files/directories were installed but not shipped in any package:
> >   /usr/lib/polkit-1/polkit-agent-helper-1
> >   /usr/lib/polkit-1/polkitd
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> > polkit: 2 installed and not shipped files. [installed-vs-shipped]
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >  meta-oe/recipes-extended/polkit/polkit_122.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/recipes-extended/polkit/polkit_122.bb
> > index dfa6c14a4..a7cfbdd62 100644
> > --- a/meta-oe/recipes-extended/polkit/polkit_122.bb
> > +++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
> > @@ -46,4 +46,6 @@ do_install:append() {
> >       chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> >  }
> >
> > -FILES:${PN} += "${libdir}/polkit-1 ${datadir}"
> > +FILES:${PN} += "${libdir}/polkit-1 ${datadir} \
> > +                ${nonarch_libdir}/${BPN}-1 \
> > +               "
>
> It would be more obvious what's going on if you change the above to:
>
> FILES:${PN} += "${libdir}/polkit-1 ${nonarch_libdir}/polkit-1 ${datadir}"
>
> > --
> > 2.25.1
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100000): https://lists.openembedded.org/g/openembedded-devel/message/100000
> Mute This Topic: https://lists.openembedded.org/mt/95509198/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

