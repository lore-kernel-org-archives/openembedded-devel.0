Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA964C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:49:25 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.28454.1709657360275310738
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ptyxp1b5;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bd72353d9fso466175b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 08:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709657359; x=1710262159; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg4+tqcsJnnD0sB86ao1R64rFaCJwuf8yzRbWaRDz6U=;
        b=Ptyxp1b5LnHkWeH/MuoEE/OgZ26kRJR63uIsCx1NEcp1tsgdURS8m6WNPF9qWxgflS
         QaiszNotvDf/w+jXBci34FzB1Znh9zVIkhVdiigSd5UzE0kpYKLsxkiJeGF6jZ0oqf5c
         ZpXSf2+D/awQMB74DHUdpkMac6b6egz4J3fHfNkTSJYnKZkbfnzCPdpbQJ0AjEg6flxt
         Fob+wD0ZzHZfneCaDAi15MW94X2Jodmt90JcTwHhxkJSPxFG7mcf9I0LnrrQLIuktGNF
         Gn6ekVrFwLrk4doNvhC4IaVUfyEQNtYsCKuEfPw1Z5BwyXaVfw+N5cw/d+VAzgCIJI+P
         rFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709657359; x=1710262159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg4+tqcsJnnD0sB86ao1R64rFaCJwuf8yzRbWaRDz6U=;
        b=mPQSz9Ta0gujcJy4t4+AmRBR7AOelmWhI1hXrkrKStQh797ALumIqz+f+kGcayaGfX
         X2wYAc8laYWg8t46ANSeLh4kxCh1nHXjBSaFg9olI2dzMU1DrXVswRd2A3H5Kj9B96qV
         kq6Licpo6c/AdL7wR4JAUljdiHRXwj+K6oErEtahBBTHHJ14PIeJwTNlDriYVySAZFId
         u5MKbqIsblpQagvOg/2qAcr5IVYJi+gePmMTNBy8jO8t9ly9KDJh9JQRO7chNBZKfEbV
         lKwpgo27tEERPp8yqY0+Hryw+2oJZfa2Lx9pOvURjt16SG07mMHO+xDAA+g6M9rB6u7o
         43hg==
X-Gm-Message-State: AOJu0Yx+p5klnxARWd+/iMhqUyrNfE7fwiYcwfhQEpsV5DDAjJaYtImp
	gLv5YH3RuzMaOjtupaCej/KeP6U/1OC1af5MR/wGM02+n2q5rTPLQ44kY9jxb678DiufjK9acEE
	w/QDTi6Idg2eiymt48AUHNJEfqEA=
X-Google-Smtp-Source: AGHT+IH/KazRzS+6PozJqpmmTeGIYsLMA8IHXGL7x4rTuS+72Pt+n7rABEcO/s16Q7bqD7yxp/yDoKhZH7ZWo8gTVEI=
X-Received: by 2002:a05:6870:ab85:b0:21e:7655:2b22 with SMTP id
 gs5-20020a056870ab8500b0021e76552b22mr2715988oab.57.1709657359465; Tue, 05
 Mar 2024 08:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20240304215014.4191019-1-joe.slater@windriver.com>
 <CAMKF1sqND1HW4vubUN7AMpvQvWwXGHTKygR36zkzQuZAoVP3tA@mail.gmail.com> <BY5PR11MB3992D4DE0161EEE482A2C27088222@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB3992D4DE0161EEE482A2C27088222@BY5PR11MB3992.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2024 08:48:53 -0800
Message-ID: <CAMKF1spoLgCocqivseAZW-xq-7RR-yBLSy-T3VNsMSwyRq6VDw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] googletest: allow for shared libraries
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 16:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109126

On Tue, Mar 5, 2024 at 8:31=E2=80=AFAM Slater, Joseph <joe.slater@windriver=
.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Monday, March 4, 2024 3:50 PM
> > To: Slater, Joseph <joe.slater@windriver.com>
> > Cc: openembedded-devel@lists.openembedded.org; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [oe] [meta-oe][PATCH 1/1] googletest: allow for shared lib=
raries
> >
> > On Mon, Mar 4, 2024 at 1:50=E2=80=AFPM Joe Slater via lists.openembedde=
d.org
> > <joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > From: Joe Slater <joe.slater@windriver.com>
> > >
> > > Add a PACKAGECONFIG option to produce shared libraries.
> > > Allow staticdev to be empty if no static libraries are built.
> > >
> >
> > why would be not build static libs ? and if we do not then why do we ne=
ed to
> > create empty package ?
>
> If we set -DBUILD_SHARED_LIBS=3DON static libs will not be built and -sta=
ticdev will not be created, so -dev will produce an error if we try to, for=
 example, populate an sdk.  I guess we could put static libs in -dev and ge=
t rid of -staticdev, but I didn't want to mess with the packaging.
>

maybe you can unbuckle the rdep for dev on staticdev package

> Joe
>
> >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> > > b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> > > index 8c75f936de..1b05f3d336 100644
> > > --- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> > > +++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> > > @@ -10,11 +10,17 @@ S =3D "${WORKDIR}/git"
> > >  SRCREV =3D "f8d7d77c06936315286eb55f8de22cd23c188571"
> > >  SRC_URI =3D
> > "git://github.com/google/googletest.git;branch=3Dmain;protocol=3Dhttps"
> > >
> > > -inherit cmake
> > > +inherit cmake pkgconfig
> > > +
> > > +# allow for shared libraries, but do not default to them #
> > > +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-
> > DBUILD_SHARED_LIBS=3DOFF,,"
> > > +
> > >
> > >  ALLOW_EMPTY:${PN} =3D "1"
> > >  ALLOW_EMPTY:${PN}-dbg =3D "1"
> > >
> > > +ALLOW_EMPTY:${PN}-staticdev =3D "1"
> > >  RDEPENDS:${PN}-dev +=3D "${PN}-staticdev"
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#109103):
> > https://lists.openembedded.org/g/openembedded-devel/message/109103
> > > Mute This Topic: https://lists.openembedded.org/mt/104732413/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

