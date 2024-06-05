Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D13C27C52
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 09:11:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10689.1717578674539692670
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 02:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFNnff35;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b94ad88cbso5576905e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717578673; x=1718183473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoHa1jk4+nR1QRPZ6zUvQ9F0lGXklC0dsE+2fMco5Jc=;
        b=KFNnff3588nkc3VLwIeoQeQAG69X6AFJ1WI1wYzckt+dMK8ynOcIX7b5K5JneFlIhy
         DFEK2G0roDg6+Qb6qtV6p0FpZxKRZNldpmbklawwj115HNiRrEuEUPzkhmyHTB4FhwoK
         P48RZUz3nfMY4J2nhdO63ZH9UWNkyQvMOgamZbXRgaytM8eiB7WcFcNCjTwZhufqeRSa
         B3KD0H483wpckSF6EaMaoyhE58dbfhHUN0blKlAustMganlgo8dHHQqq9zYhSrEHF5AB
         IXDrwnkNfnboKxE3R/TVZP1MLiFBiG0F9hI+K4OKIsQ3IrpCV4bE+tM5+Q91cptge9SW
         J6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717578673; x=1718183473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoHa1jk4+nR1QRPZ6zUvQ9F0lGXklC0dsE+2fMco5Jc=;
        b=I88LbadeXEdM412J+9O3zckI+GXyNt0MZJQqZ/E043rZeMt7t1EQePVgFvdC94/sq9
         H+OseHKMTSkCxxBurDiOhijql+qC9FTQcTFIsdMRihX6iTxqBVK5oddCskgbNOMQQjLi
         pAClJ8D5WffcipKPNzO4JMg2uagonCM7y8DfhQOCUSN0Ym1l+B7OJfIVjNH3rpISkPQN
         YYFZe8fdQsNLGlY9QvVEZXapjjZXbysJUGDREuEcIMR2ncA38gt6Dw/ai9fB7fUVx000
         fEQqMBsPEGDCxX6h/fJDN8Na3Sv83jzV6OoLc41R94ArA+uCBXUr6dtnsuCXt9b8GxKb
         TiQA==
X-Gm-Message-State: AOJu0YzkDhLewX4AkKLON9Z4INf1gK+wK+1jFkZXIW5gt5AGVaTId1Rm
	8qrTfK2hh3VZBI/lMSzMskga2AXsf4i3D3acQxGBPkG/uodTN876SkKFgSNYvGTnhY8NiTCSIQM
	BnaRGPerEPUQ7nCDH9gv3qeJsSHI=
X-Google-Smtp-Source: AGHT+IGqdyzkWJVvGztWAebczeOU+rwePwHCqjOrjI3n7q2Bb73Y0Bmi5mX+pMA5XGMGmfnP/KvbJ/+jUudaXJihJ34=
X-Received: by 2002:a05:6512:3194:b0:52b:9964:9dae with SMTP id
 2adb3069b0e04-52bab50b1abmr1632220e87.57.1717578672388; Wed, 05 Jun 2024
 02:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <17D60871905D8062.18873@lists.openembedded.org> <TY3PR01MB11056F365C91CEB2A21ECDC85A0F92@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056F365C91CEB2A21ECDC85A0F92@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Jun 2024 11:10:57 +0200
Message-ID: <CA+chaQcF_iBmXThEFAV82tRHLW-qgVEUqMTV+4rbNGxMgV4ZCw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] cmpi-bindings: ignore incompatible-pointer-types
 errors for now.
To: leimaohui@fujitsu.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 09:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110702

There is already patch covering all such cases detected in my world builds,=
 see
"pidgin pidgin-sipe pidgin uw-imap rrdtool cmpi-bindings
libdbd-mysql-perl daq" and
"catch2 openldap microsoft-gsl scsirastools pam-ssh-agent-auth
sblim-sfcb cker.."
commits in:
https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-next

They weren't merged because I think khem wants to motivate people to
fix these issues instead of just ignoring them and these 2 are just to
keep world builds cleaner while incrementally working on detected
issues.

Please check if upstream already has a fix in newer version and
backport that or submit fix to upstream and add it to meta-oe.

Major distributions are now switching to gcc-14 as well so it is
getting easier to find already created patches in upstream or distros,
e.g. gentoo tracker:
https://bugs.gentoo.org/showdependencytree.cgi?id=3D870412

On Wed, Jun 5, 2024 at 10:27=E2=80=AFAM leimaohui via lists.openembedded.or=
g
<leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> Hi
>
> It seems there are many recipes have the same issue. I found there are tw=
o methods that fix this issue from git log of poky.
> One is ignore incompatible-pointer-types, the other is submitting a patch=
 of source code.
> I'm not sure which method is more popular...
>
>
> Best regards
> Lei
>
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of leimaohui via
> > lists.openembedded.org
> > Sent: Wednesday, June 5, 2024 2:40 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Lei, Maohui <leimaohui@fujitsu.com>
> > Subject: [oe] [PATCH 1/2] cmpi-bindings: ignore incompatible-pointer-ty=
pes
> > errors for now.
> >
> > From: Lei Maohui <leimaohui@fujitsu.com>
> >
> > GCC 14 implicitly turns a warning into a compiler error:
> >
> > |
> > /build-ubinux-daily/tmp/work/aarch64-ubinux-linux/cmpi-bindings/1.0.4/g=
it/
> > swig/python/../../src/target_python.c:168:21: error: passing argument 1=
 of
> > 'Py_SetProgramName' from incompatible pointer type
> > [-Wincompatible-pointer-types]
> > |   168 |   Py_SetProgramName("cmpi_swig");
> > |       |                     ^~~~~~~~~~~
> > |       |                     |
> > |       |                     char *
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >  meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4=
.bb
> > b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
> > index 781dc83da9..d062e46bb9 100644
> > --- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
> > +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
> > @@ -27,7 +27,7 @@ EXTRA_OECMAKE =3D "-DLIB=3D'${baselib}' \  # With Nin=
ja
> > it fails with:
> >  # ninja: error: build.ninja:282: bad $-escape (literal $ must be writt=
en as $$)
> > OECMAKE_GENERATOR =3D "Unix Makefiles"
> > -
> > +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> >  FILES:${PN} =3D+"${libdir}/cmpi/libpy3CmpiProvider.so
> > ${PYTHON_SITEPACKAGES_DIR}/*"
> >  FILES:${PN}-dbg =3D+ "${libdir}/cmpi/.debug/libpyCmpiProvider.so"
> >
> > --
> > 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110701): https://lists.openembedded.org/g/openembedde=
d-devel/message/110701
> Mute This Topic: https://lists.openembedded.org/mt/106498591/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

