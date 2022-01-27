Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73FBC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 17:54:14 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.1308.1643306054017647431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p0Dch3Yr;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id h16so3496409qvk.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OcSg45ki0gRgXLdO9pXqe0IYqdUFW5wnX756vQX+MDs=;
        b=p0Dch3Yrd+lKmYlOgf9HgdNCMj4ktS+1zRYbJCkMpDfZnCYXTnNGi1fPC8cFWDXAWe
         pDonvn24EdT2jpkTutCUfNWRZlEPO3Q59t/F7pgzyuWyoj2Vzkb6nx0x5TT05J8b6BSp
         bgkbDM5yrJ0TuJOn/i4/PXGcdHNBPVjLI+Uqivegd1tkRYP5Cx1EhrJm0Um+apDD4F4B
         oDPoNEeNu0m5MNVcemnwVEHDBnS9PhywlDFn7rMksiamoRWnRjcb+PZjio1DgcXV23A/
         Y6LqZnN0aih/FL30GuUBGZHEV3jLYkhKLHBcUOB7DpCIXmi8f6exy1GLWuz1aSASOUbe
         w53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OcSg45ki0gRgXLdO9pXqe0IYqdUFW5wnX756vQX+MDs=;
        b=WWI9Iq6ME530033Rg8CM62DhnP3vyIksaYsHPdgYGhfItBUhcYC5L7raYoEoEceoIo
         9oCycGMZBliGslXBgTOkKPQ2INejOaNUKpJcUjyp8dZaNaEbcob95337gqL5BV1XAmiX
         ymRMTzsgC4fp1tjDghALzc4gP78cjTkA/7lb2EsX4Eo+XVN6CH2rukZl2dolB7YvmS2F
         CRESL0I64aDGfwxCdmmXgjAn8BsLMEw6qkIMEUmvzsMabnopE/0+Uom++dn+gHW4vN0y
         E28H65cHJa5zpHwDOwb3R3VRFvwNGfD2WmNKDRH0/lAkHQPVQjWXXXQiL9BIuhK70/Qn
         QZIg==
X-Gm-Message-State: AOAM5324FdiW74Ux3c1Ic8UDs3uIw/RyyGdYZ+8gRc9EYmprB3XbuMMp
	ag/UOMuIXd29C/jc56VqOAYlv/JPXAVgFIuedWQ=
X-Google-Smtp-Source: 
 ABdhPJxbrMYyf9lFncii0g6VRe+aTCRypveU2mSBLGCJu1Y4y8GYaD5bo1kLU4i7DzyEXDx50M/MondBvZrlPl4BwzU=
X-Received: by 2002:a05:6214:27e8:: with SMTP id
 jt8mr4671358qvb.110.1643306052886;
 Thu, 27 Jan 2022 09:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20220126060104.578932-1-f_l_k@t-online.de>
 <CAMKF1soCvBP6kNsGfcFQ1zaS6LUAK7thNy97aCj0B8q2+RzMjA@mail.gmail.com>
 <16CDC0E5A96FEE34.21331@lists.openembedded.org>
 <3ef87993-f28b-1d51-77d6-dfa7cfac7f0f@t-online.de>
In-Reply-To: <3ef87993-f28b-1d51-77d6-dfa7cfac7f0f@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 09:53:46 -0800
Message-ID: 
 <CAMKF1spQM1X=ySDfyUHHTD7xL1xE3pMPpLsi7NES_GcWkEA-_g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] evolution-data-server: try to fix g-i
 data generation
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 17:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95127

On Wed, Jan 26, 2022 at 11:27 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> thanks to your patches for systemd i could try this now. i have
> successfully built evolution-data-server for musl x86-64 with g-ir and
> vapi. However, also with the recipe that is currently in master. So this
> test is not really helpful.

Thats good, can you try it with current master-next ?

>
> Am 26.01.22 um 08:18 schrieb Markus Volk:
> > i tried, but there are a lot of systemd patches that are not applying
> > and thus i'm unable to compile it. But never mind ... if it doesn't
> > run for you, just disable GIR. Maybe i find some time to look into it
> > sometime later
> >
> > Am 26.01.22 um 07:35 schrieb Khem Raj:
> >> On Tue, Jan 25, 2022 at 10:01 PM Markus Volk <f_l_k@t-online.de> wrote:
> >>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> >>> ---
> >>>   .../evolution-data-server/evolution-data-server.bb | 5 +++--
> >>>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git
> >>> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> >>> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> >>>
> >>> index 9ccaedbcc..c5c7d947f 100644
> >>> ---
> >>> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> >>> +++
> >>> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> >>> @@ -27,14 +27,15 @@ EXTRA_OECMAKE = " \
> >>>       -DENABLE_UOA=OFF \
> >>>       -DENABLE_GOOGLE_AUTH=OFF \
> >>>       -DENABLE_WEATHER=OFF \
> >>> -    -DG_IR_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper \
> >>> -    -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper \
> >>>       -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen \
> >>>       ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> >>> '-DENABLE_INTROSPECTION=ON -DENABLE_VALA_BINDINGS=ON',
> >>> '-DENABLE_INTROSPECTION=OFF', d)} \
> >>>       -D${LKSTRFTIME} \
> >>>       -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
> >>>   "
> >>>
> >>> +EXTRA_OECMAKE:append:class-target = "
> >>> -DG_IR_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
> >>> +EXTRA_OECMAKE:append:class-target = "
> >>> -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
> >>> +
> >> Can you test it for TCLIBC = "musl"
> >>
> >>
> >>>   PACKAGECONFIG[canberra] =
> >>> "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
> >>>   PACKAGECONFIG[oauth]    =
> >>> "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,webkitgtk json-glib"
> >>>   PACKAGECONFIG[goa]    =
> >>> "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95116): https://lists.openembedded.org/g/openembedded-devel/message/95116
> Mute This Topic: https://lists.openembedded.org/mt/88691224/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

