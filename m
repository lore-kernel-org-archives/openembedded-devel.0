Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DD5C677C4
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.14277.1650492831402150724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 15:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MGkrpqR7;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id z12so4139563edl.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mZjTuB17yCz2fFzdVXajXls1o0W7tkhppEaa0g+Coks=;
        b=MGkrpqR7AlawbDS+wZWFcl/TFpe9c041ZV/KCu+EHkJEGt3QSsD9vFSecefP6hLgv3
         jI3HasBfqT1hHylSsT+rPsEGyeHLToe+l1zi3FvsbFmnHgthY4UJlIYaP6T2kutJxeyr
         08oXHQTrIrvd3/ktinqK6r4ddwH1TN0JiGjm7gVHEswHZHVMKz8/JHwtsM02yrtu+8wh
         vkU9jjiohk6XNa9tWNa2YxH8qPTPHOl+/45O6brKQNLb7Tmj1EU6vu+9u5aBFwyLJkcH
         XUKNbH5GvlNEm6o41LBNZBli0Q6Spx+XFXPgccWDwHQ8hTnvKTOKKymJQW70cdhVsWM2
         qFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mZjTuB17yCz2fFzdVXajXls1o0W7tkhppEaa0g+Coks=;
        b=xQgJ6kaAjJPI7x6s/JypjAHDOBj7atpFvaeG55KtO0sa6wlMkxvORy5LiMNi0IYdAJ
         mZhin7OkcaqU2/Tkdt/O9aoRDOxxyePfbdU58xTFMRXsMHkK3Yg7RiumaY9aT/08tkPT
         sxwTDuNY27yLw1CwKvCHpR7Y0pp8WyMKoGZHc0qnW0l0gUtzF5s8aF9vVLT6zVPUHghy
         uf6byqK1DbVnG0I1DvfVaf3hkgw0vGC0gkDrhGiXToeAuKTGBdbaLk9bRaDqO235IFzt
         XcZGXHhvRGDICM/74w9hlCOH0aEy5KSUBoN2XyOzkFnueWYX1fAyCqPg7s7DiLkHWHzo
         46/Q==
X-Gm-Message-State: AOAM531E9X6n6Kkqzcb02apzM1DYiH/wgNA7VqpjnBJmQBxQlhjcFHjh
	H5+6Y2L/wTXkv5zlzTbmWSXyEoxzePwbYlwI8gU=
X-Google-Smtp-Source: 
 ABdhPJzB/H7uPX9JpVVKleMDcjwugADmIXhrp66z2b9rgIwHNt7UCHvw1/6sP5xDXXm1uEc9oOHnjRUysiVe3zRKaeE=
X-Received: by 2002:a05:6402:458:b0:418:78a4:ac3f with SMTP id
 p24-20020a056402045800b0041878a4ac3fmr25427259edw.196.1650492829844; Wed, 20
 Apr 2022 15:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220420094227.2826875-1-dmitry.baryshkov@linaro.org>
 <97a9dad0-fb8a-3bf0-8ee7-f45494e37cf4@gmail.com>
 <CALT56yOZ=jr48+-9-Ko2AdqoK73_+KtG53yJRWgx25dSjQhuVw@mail.gmail.com>
 <CAMKF1srk00kSdinLs=E3R_AsayTAtBk5Y3-6YPpcHdUC5+sFzA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srk00kSdinLs=E3R_AsayTAtBk5Y3-6YPpcHdUC5+sFzA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 21 Apr 2022 01:13:38 +0300
Message-ID: 
 <CALT56yND_XfXy0nkt2ioiJgO+UduAOeYduVVoXkXLRWhjX=KEg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gpsd: split python utils from gps-utils
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96720

=D1=87=D1=82, 21 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 01:08, Khem Raj <r=
aj.khem@gmail.com>:
>
> On Wed, Apr 20, 2022 at 10:43 AM Dmitry Baryshkov <dbaryshkov@gmail.com> =
wrote:
> >
> > Hi,
> >
> > =D1=81=D1=80, 20 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 17:53, Khem Ra=
j <raj.khem@gmail.com>:
> > >
> > > It does not apply on top of master-next, can you rebase
> > > and resend please.
> >
> > I have rechecked, it applies on top of master-next w/o any issues. Did
> > you push your master-next branch?
> >
>
> yes master-next is up2date but groking this patch from mailing list
> via an email client
> and then git am'ing it is failing, too mant hoops to jump for catching
> patches so there could be something
> wrong on the way. Regardless I have done the conflicts manually and pushe=
d
> to master-next, hope I did not miss anything

Strange. I just used the 'git send-email' on top of the master branch.
The patch in github/master-next looks correct, so all chunks were
applied correctly.
Thank you!

>
> > >
> > > On 4/20/22 02:42, Dmitry Baryshkov wrote:
> > > > Neither gpsd nor significant part of gps-utils depend on python. Ho=
wever
> > > > installing gps-utils package would require installing python, which=
 adds
> > > > about 17 MB to the image size. Split away gps-utils-python to allow
> > > > using gpsd/gps-utils in the systems with limited resources (or in t=
he
> > > > initramfs).
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >   .../recipes-navigation/gpsd/gpsd_3.23.1.bb    | 23 +++++++++++---=
-----
> > > >   1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > [skipped]
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

