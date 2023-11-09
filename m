Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510E5C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 06:49:43 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.116049.1699512573283061849
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 22:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=II+Sulzq;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1f00b95dc43so291631fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 22:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699512572; x=1700117372; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Wo+BQ2nhG1C+4Ch5UcPnscJnGyDyGu+xV0LOphyHU8=;
        b=II+SulzqCWejmxwrAsb/5bTky4IRl3vxCya/cy2mBOJj3zZrHcqIJxj1Di7xpNrwhR
         BuhRGfkfAcStTF93WUf+fD211CpXYorLcf+MpWmg2wiwRmi+M3MnUUspRbpt7WBMiMY4
         gMw0JWvtZChJlJteU91QtgSJ+1Pkc87KnoIJUUmnSytFTIM8rNBrqiW8dXZen2w2Uzpv
         5Ft11WB6aKuHIUL63XvvuXdPK+OpwPj/2KLAH/3mm79Z7mXkuRovW6SjaBf9fV7AqEKg
         GoiNKGtCofkb4Qw6cdRlWPaAkHAmkYSFowttnWN+zUR2n+8jIsh4KNn+BTJ1F5+2eaUH
         5sYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699512572; x=1700117372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Wo+BQ2nhG1C+4Ch5UcPnscJnGyDyGu+xV0LOphyHU8=;
        b=bSVhRlkaHqIwU4PCGv9Aze3H7JpK9h/Sc0a79jRF5wu+rGwhdtIRQsBQlv6gaAIcqg
         yTOhVYlsH/cdHXOnYOQZ8DnFg/I5SmjXbjW66THEikilq+CfksfQ3NREpF0UjVNuYrBs
         ECGun/htibxlSjq9f/wPvfHq1ojiFBhxvAvN9lp0sOsO5OYJi5oj0g0kP2Pq8wb0jzo9
         TBNAHHUrrnck9xZf48bq2atUOPHfm1+Fwd5LaeeDN1LtNVqECXYywCEhwT9GMo5rMjlb
         941Sbg/eHPR7Q+G5QFJAC59fAhwB6tvDwwt4O+Qvam3bzaBhZTO/ysAcmcEbU/zXvlOW
         /pMQ==
X-Gm-Message-State: AOJu0YzBIA4mPFDXduZnaHv90FijXcjctxKrazbnhe1MFk7K/AuIYQRo
	LY7xOUMkk7+RPdHQbRzxYEWUcqG3v8Dqomr1OUE=
X-Google-Smtp-Source: AGHT+IEr8+ei3P1+jPErLD8gxyBbRI3PqOu1FGI6sisj0wh+6/jMNmhOxTUI2LmwSnxbqBcBxxfITXhHSDyc4wuMfCg=
X-Received: by 2002:a05:6870:128a:b0:1f0:8706:4c4a with SMTP id
 10-20020a056870128a00b001f087064c4amr3438326oal.29.1699512572492; Wed, 08 Nov
 2023 22:49:32 -0800 (PST)
MIME-Version: 1.0
References: <0101018b96bec5d9-30e827d0-67b7-4918-bdd1-1e4d2879dd24-000000@us-west-2.amazonses.com>
 <3cf2e8c7-f517-4284-a136-9584d53298bc@gmail.com>
In-Reply-To: <3cf2e8c7-f517-4284-a136-9584d53298bc@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Nov 2023 22:49:06 -0800
Message-ID: <CAMKF1srkSAQRKyeYpg8budJ070gWi2nRdR3nTgiTpu+um8ampA@mail.gmail.com>
Subject: Re: [oe] [AUH] geos: upgrading to 3.12.0beta2 SUCCEEDED
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 06:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106510

On Wed, Nov 8, 2023 at 10:32=E2=80=AFPM Zoltan Boszormenyi <zboszor@gmail.c=
om> wrote:
>
> Something went wrong here.
> Final 3.12.0 was "upgraded" to 3.12.0beta2.

yes, We need to correct the upgrade regex. I will revert this for now.

>
> 2023. 11. 03. 20:52 keltez=C3=A9ssel, Auto Upgrade Helper =C3=ADrta:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *geos* to *3.12.0beta2=
* has Succeeded.
> >
> > Next steps:
> >      - apply the patch: git am 0001-geos-upgrade-3.12.0-3.12.0beta2.pat=
ch
> >      - check the changes to upstream patches and summarize them in the =
commit message,
> >      - compile an image that contains the package
> >      - perform some basic sanity tests
> >      - amend the patch and sign it off: git commit -s --reset-author --=
amend
> >      - send it to the appropriate mailing list
> >
> > Alternatively, if you believe the recipe should not be upgraded at this=
 time,
> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> > automatic upgrades would no longer be attempted.
> >
> > Please review the attached files for further information and build/upda=
te failures.
> > Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
> > -- >8 --
> > >From 44935dbd8ea98c3846fad098e6f6632a20713ac0 Mon Sep 17 00:00:00 2001
> > From: Upgrade Helper <auh@yoctoproject.org>
> > Date: Fri, 3 Nov 2023 12:37:48 +0000
> > Subject: [PATCH] geos: upgrade 3.12.0 -> 3.12.0beta2
> >
> > ---
> >   .../geos/{geos_3.12.0.bb =3D> geos_3.12.0beta2.bb}                | 2=
 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename meta-oe/recipes-navigation/geos/{geos_3.12.0.bb =3D> geos_3.12=
.0beta2.bb} (88%)
> >
> > diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/r=
ecipes-navigation/geos/geos_3.12.0beta2.bb
> > similarity index 88%
> > rename from meta-oe/recipes-navigation/geos/geos_3.12.0.bb
> > rename to meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
> > index 95cb29775..e4e1b9db2 100644
> > --- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
> > +++ b/meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "LGPL-2.1-or-later"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c"
> >
> >   SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
> > -SRC_URI[sha256sum] =3D "d96db96011259178a35555a0f6d6e75a739e52a495a6b2=
aa5efb3d75390fbc39"
> > +SRC_URI[sha256sum] =3D "249c63c6f07ec827377e94a90b99a97d39e655aff180cf=
a71b50381d8e209382"
> >
> >   inherit cmake pkgconfig binconfig
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106509): https://lists.openembedded.org/g/openembedde=
d-devel/message/106509
> Mute This Topic: https://lists.openembedded.org/mt/102372013/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

