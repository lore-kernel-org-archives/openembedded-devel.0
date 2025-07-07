Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC640C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 17:49:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.3443.1751910584672073047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 10:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQad5hPy;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32f2947ab0cso11700511fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751910583; x=1752515383; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwIL0cm0NQ77uvgsziTBUvoYe3cORQcZ/iEjBpQ8Sio=;
        b=VQad5hPyNrr/7flOvVBdgzvniPlS2LaiN6o+1B6vPeMhs/NSMRuKOLkVojTy9GliSW
         ICjK7c3Dx2YqBwq2/1ivkIYeskPySRzHoMTGHKwCR96XbTJXZe/O2omhVilK5TgKNC56
         Fp++mSo2UG/WhkaKhZ1kpLAgOFoeX9uhHsetACm44ZClOPcICI6Ul453oZZhxenu/7Lz
         wiPHK8qQHSQlVGLYtOW8QcHLemdJBvh0HYtofkNoP97BWyKt06S0qekFIHWLfpQOfhG0
         fDaKLPH8i/H/hhsgSFFQDu3BogeRz+aKrxNypGUSkFto/oHuthaB8f3KUJcYJB5/zT30
         vaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751910583; x=1752515383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwIL0cm0NQ77uvgsziTBUvoYe3cORQcZ/iEjBpQ8Sio=;
        b=Dyo0mKbF9mVD+WvDPrw4UF1xtbp8Jy4M0TGNrKKJys1YvsNLRukwwIn/9j3sr1bXz8
         EgStF9ZQEJFAgisFn51Q8FVBgLtikGZMXrb4iO/9pDw2B8srHjV297jixsVBtxRpG0rq
         yNxFNEfMaqHvidkLLIaGOn/ntNd04T2LyMy1TftDhldjYOw0W/3VLTW5hMrdHpHklKSE
         5stk5M7G0AXzwKYdFGAUepKXMkMf/vwCOh3Xe74g7lvWrkZOQ9P+W6l7cTEtGqrT0hXt
         GhoDF9MFWn21/gRl7cSkvxJq9J76l70Q1PzJHnzoKbv6wNr38LXpNLA0E7RY3luSzaO6
         lniQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/4ZwPuj/YCAvfX8oZbOSYYVk+63sSpwxBHyy7fgHpFlONxF7+3MaVqJu6+nkmano2UMVqp442mKNGd1IR5M13xCQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwW/wdYTHKf6KSoCFzPBYAmbddK8qfzKnmw9cj9cqWfcR8hjdY
	/hEdP6v/JlDetwhbyfo68v162x2tYLqWmzl7Dy1Ad7qXDQJvKxHLl2mTs/lak2JfauYE/yla7/y
	e2aZA/2cPqIeiHGfGPpZ00OOYDzJ0Ny0=
X-Gm-Gg: ASbGncveUNiTO6Z0U6cM27G+6s01mQelE3NkDlr4H268z3R6xGPmkAywNoI4vwvE+V5
	+qNVftku73Z3976oJ3jUPbc6mynNbrIJwH9baR+ZXlzmKi1D3VvCB0x4dRfOS21dagC5j9F/2Gy
	UZlKzukClNxDQChUuMmgA3jK8emyo5lF3jlrr7MUrKTleZoA==
X-Google-Smtp-Source: AGHT+IE3265bqHh+yMwzpxhc+jnjTLRb6dKSb2ebBYAzyazKUjFJeBH2JdG7zGFdLSBTnXsW7zb+S+vA9oVHvdCoUUA=
X-Received: by 2002:a05:651c:220d:b0:32b:522b:e446 with SMTP id
 38308e7fff4ca-32e5f57cd0emr41306621fa.10.1751910582405; Mon, 07 Jul 2025
 10:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250620041131.2424118-1-jiaying.song.cn@windriver.com>
 <1a7945c4-9a7d-4587-8a85-915bae147202@gmail.com> <IA4PR11MB9420B5C05331D3EE22BFE977B879A@IA4PR11MB9420.namprd11.prod.outlook.com>
 <b8604adf-3c3c-416c-b4f7-fe16a0e35f67@gmail.com>
In-Reply-To: <b8604adf-3c3c-416c-b4f7-fe16a0e35f67@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 7 Jul 2025 19:49:33 +0200
X-Gm-Features: Ac12FXzpSNaX8t6UqiNHH4Y8Alc4m-hajLimKaOssFF8t8687rLohENUeUeJ6Ac
Message-ID: <CA+chaQcxw3ryRgTT9qOFh8n0Ba4ZWxtJSS334kAaKGiGKXv+JA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded ${RECIPE_SYSROOT}
 in xmlsec1-gnutls.pc
To: skandigraun@gmail.com
Cc: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>, "Li, Changqing" <Changqing.Li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 17:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118286

This breaks the build when e.g. gnutls PACKAGECONFIG isn't enabled in
xmlsec1 and xmlsec1/1.3.7/image/usr/lib/pkgconfig/xmlsec1-gnutls.pc
doesn't exist.

It should either check for the file existence before the sed call or
the list should be conditional based on PACKAGECONFIG.

It fails in walnascar as well where it was backported and merged today.

On Tue, Jun 24, 2025 at 7:34=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 6/23/25 04:17, Song, Jiaying (CN) wrote:
> > Hi,
> >
> > Thanks for your questions.
> >
> > The issue can be reproduced by explicitly enabling p11-kit in the gnutl=
s PACKAGECONFIG.  For example, by adding the following line to your local.c=
onf:
> >
> > PACKAGECONFIG:append:pn-gnutls =3D " p11-kit"
>
> Thanks a lot, I managed to reproduce it based on your instructions.
>
> >
> > This configuration is needed on platforms that require certificate mana=
gement or use smartcard/token-based cryptographic modules supported by p11-=
kit.
> >
> > The reason this problem does not appear in default Poky builds is that =
p11-kit is not enabled in gnutls by default.  Therefore, the build sysroot =
path does not get pulled into the generated .pc files, avoiding the QA erro=
r.
> >
> > Thanks,
> > Jiaying.
> >
> >> -----Original Message-----
> >> From: Gyorgy Sarvari <skandigraun@gmail.com>
> >> Sent: Friday, June 20, 2025 7:59 PM
> >> To: Song, Jiaying (CN) <Jiaying.Song.CN@windriver.com>; openembedded-
> >> devel@lists.openembedded.org
> >> Cc: Yang, Liezhi <Liezhi.Yang@windriver.com>; Li, Changqing
> >> <Changqing.Li@windriver.com>
> >> Subject: Re: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded
> >> ${RECIPE_SYSROOT} in xmlsec1-gnutls.pc
> >>
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender=
 and
> >> know the content is safe.
> >>
> >> On 6/20/25 06:11, Song, Jiaying (CN) via lists.openembedded.org wrote:
> >>> From: Jiaying Song <jiaying.song.cn@windriver.com>
> >>>
> >>> Fix do_package_qa error by removing ${RECIPE_SYSROOT} from the instal=
led
> >> xmlsec1-gnutls.pc file.
> >>> This ensures the generated .pc file does not leak build-time paths, c=
omplying
> >> with QA checks.
> >>> Fixes QA error:
> >>> ERROR: xmlsec1-1.3.7-r0.wr2500 do_package_qa: QA Issue: File
> >>> /usr/lib/pkgconfig/xmlsec1-gnutls.pc in package xmlsec1-dev contains
> >>> reference to TMPDIR [buildpaths]
> >> How could this be reproduced? Does it need some special config or
> >> environment?
> >>
> >> I tried to build it in both master and walnascar for qemux86-64, and i=
t was
> >> successful, QA checks passed. I used the default recipe, where gnutls =
is part of
> >> PACKAGECONFIG, and also when PACKAGECONFIG only contained "gnutls".
> >> xmlsec1-gnutls.pc was also generated and installed.
> >>
> >>> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> >>> ---
> >>>  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 7 +++++--
> >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> >>> b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> >>> index 2fdfd55f24..0f4ae205b1 100644
> >>> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> >>> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> >>> @@ -54,8 +54,11 @@ do_compile_ptest () {  }
> >>>
> >>>  do_install:append() {
> >>> -    for i in ${bindir}/xmlsec1-config ${libdir}/xmlsec1Conf.sh \
> >>> -        ${libdir}/pkgconfig/xmlsec1-openssl.pc; do
> >>> +    for i in \
> >>> +        ${bindir}/xmlsec1-config \
> >>> +        ${libdir}/xmlsec1Conf.sh \
> >>> +        ${libdir}/pkgconfig/xmlsec1-openssl.pc \
> >>> +        ${libdir}/pkgconfig/xmlsec1-gnutls.pc; do
> >>>          sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i
> >>>      done
> >>>  }
> >>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118095): https://lists.openembedded.org/g/openembedde=
d-devel/message/118095
> Mute This Topic: https://lists.openembedded.org/mt/113737769/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

