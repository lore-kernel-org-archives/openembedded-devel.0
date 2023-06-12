Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9168AC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 18:01:04 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.67260.1686592857747190986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 11:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rtOyZc4P;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-541f4ee6f89so2636621eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686592857; x=1689184857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o5HVNNJxXE8agISha4as/Ky5GSySkDAWnKTlFuSu20=;
        b=rtOyZc4Pqcxyr4lgmcmw1boHMgJgfJGtiQu2THaLt19tHAxDd0Nk9qKZqAYdCQ98DM
         au4P6qrH03ca8dGvTgRrvk2Imlu+Nb1Q7vAgIkeoYaKhbqtxEaG9ggVKNA2hpYsW4Pk7
         arTiYulwinqGMe+isCBxlVzPF5AH2XlxMQ/HJibdcKCkQ4ilIcsMhyJ3+Idfhb2gzWFa
         fNxjOUtGUe1+rfrN+F5j9ziDah38nnbB+rbvub6YYIxGFwVyLSLbv6oEIPLJpaoq1Xrq
         nfezXMVIwXKaHotKBcgkzEygTf/yqGg4Jm3UAb1jjCwdXNyj8eDQAcfuZ2HcMvK0S1Nr
         M7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686592857; x=1689184857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9o5HVNNJxXE8agISha4as/Ky5GSySkDAWnKTlFuSu20=;
        b=VvVgpbE6olkDHFQHkfdyAemJckTDh2SnONH+kSJ/8Qo7gZ6i4hA5AhmzTruQjwwCqD
         rtM6RpQ8uP00bi3lx7dOHLlUqjYIG9jR0hJqIP4vvaYTE1aUe6Sakz7akdufl669SpZy
         xBnhrFys3Yos0Les7KObauBAcJA41Ypmg3Qg2ojKSF2Y1Pt5T2s24Ui5VrIn/ZKzu8jK
         PbXtbfcs6cjGYvkjjKIfWJuOGmvaiSQeLMyPChu4Bx7+658UMm6HzM/QPo/DT65S6FUo
         yxKBdFGrW+Ez4SM5AQLuWrTphO57ACoPm4aiLFSprkUA9Q06YldSly94RrxWQv/D2uhn
         ItfQ==
X-Gm-Message-State: AC+VfDxyp+6uHhOPx634ArXvPLvEVKqetTWl2sS0V1CUaBNbt9mbnRTn
	dzeQPQFtXM19KN+jqKsSfISukva9yiVqGa3m5Asch1EW
X-Google-Smtp-Source: ACHHUZ4xL8qBwoT2qdNP1GXk8mj05m1aqWRbk89vYLzYrGfCuWZpiGIgDOQSm/t2Sd+JcwwYNlK+fdSCvwH7lDxJjNE=
X-Received: by 2002:a4a:d892:0:b0:558:b224:ce9f with SMTP id
 b18-20020a4ad892000000b00558b224ce9fmr5307344oov.7.1686592856506; Mon, 12 Jun
 2023 11:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230611160530.392975-1-mhei@heimpold.de> <8273188.T7Z3S40VBb@kerker>
 <CAMKF1sqeRP-+YES+WoB784U1389_=f2MmuHzS13-d2rP2GK-Bw@mail.gmail.com> <3896518.ElGaqSPkdT@kerker>
In-Reply-To: <3896518.ElGaqSPkdT@kerker>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jun 2023 11:00:30 -0700
Message-ID: <CAMKF1spknDkEMS1782o=G7UK6wmjAhruvNO_EU3Gnnd9ARC9gA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
To: Michael Heimpold <mhei@heimpold.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 18:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103216

On Mon, Jun 12, 2023 at 10:57=E2=80=AFAM Michael Heimpold <mhei@heimpold.de=
> wrote:
>
> Am Montag, 12. Juni 2023, 01:44:29 CEST schrieb Khem Raj:
> > On Sun, Jun 11, 2023 at 1:53 PM Michael Heimpold <mhei@heimpold.de> wro=
te:
> > > Am Sonntag, 11. Juni 2023, 18:32:31 CEST schrieb Khem Raj:
> > > > On Sun, Jun 11, 2023 at 9:05=E2=80=AFAM Michael Heimpold <mhei@heim=
pold.de>
> > >
> > > wrote:
> > > > > If my git skills don't trick me, forcing ARM mode for PHP
> > > > > dates back to year 2015 with commit e836f8f93.
> > > > >
> > > > > I wondered whether the compile problem still persists and just
> > > > > tested that it compiles fine for qemuarm nowaydays.
> > > > >
> > > > > I also tested the binaries on a physical device, a
> > > > > NXP iMX6ULL based one, and did not notice any problems
> > > > > so far.
> > > > >
> > > > > Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> > > > > ---
> > > > >
> > > > >  meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
> > > > >  1 file changed, 9 deletions(-)
> > > > >
> > > > > diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > > > b/meta-oe/recipes-devtools/php/php_8.2.6.bb index dad955452..404f=
f393b
> > > > > 100644
> > > > > --- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > > > +++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > > > @@ -284,12 +284,3 @@ do_install:append:class-native() {
> > > > >
> > > > >      create_wrapper ${D}${bindir}/php \
> > > > >
> > > > >          PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
> > > > >
> > > > >  }
> > > > >
> > > > > -
> > > > > -# Fails to build with thumb-1 (qemuarm)
> > > > > -# | {standard input}: Assembler messages:
> > > > > -# | {standard input}:3719: Error: selected processor does not su=
pport
> > > > > Thumb mode `smull r0,r2,r9,r3' -# | {standard input}:3720: Error:
> > > > > unshifted register required -- `sub r2,r2,r0,asr#31' -# | {standa=
rd
> > > > > input}:3796: Error: selected processor does not support Thumb mod=
e
> > >
> > > `smull
> > >
> > > > > r0,r2,r3,r3' -# | {standard input}:3797: Error: unshifted registe=
r
> > > > > required -- `sub r2,r2,r0,asr#31' -# | make: ***
> > > > > [ext/standard/math.lo]
> > > > > Error 1
> > > > > -ARM_INSTRUCTION_SET =3D "arm"
> > > >
> > > > Martin explained it well, it was seen with thumb1 ISA some armv6 an=
d
> > > > all armv7+ uses thumb2 ISA along with standard ARM ISA
> > > > Testing this will need armv4/armv5 perhaps you can limit this to
> > > > armv5/arm4 arches
> > > >
> > > > ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > > > ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > > >
> > > > If you can test it on armv5 and ensure that it works there too now =
a
> > > > days then we can remove it completely
> > >
> > > Thank you all for your feedback.
> > >
> > > Here is what I've done so far.
> > >
> > > I've done a compile test against machine qemuarmv5 which succeeded
> > > without errors.
> > >
> > > I have a custom board at hand, which uses a NXP iMX28 CPU, the build
> > > configuration tells me the same TUNE_FEATURES as qemuarmv5:
> > > MACHINE              =3D "evachargese"
> > > TUNE_FEATURES        =3D "arm armv5 thumb dsp"
> > > I used the kirkstone branch to have a faster roundtrip since the boar=
d
> > > currently runs a kirkstone-based system. The PHP binaries run without
> > > obvious problems in a quick test (simple webpages on the device).
> >
> > That=E2=80=99s for testing it out. Can you check compiler longs for php=
 and see if
> > it passed -mthumb to it ?
>
> Just to ensure, that I got you right: you mean something like
> grep thumb tmp/work/armv5e-poky-linux-gnueabi/php/8.1.16-r0/temp/log.*
> which shows an empty result for qemuarmv5/evachargese and for qemuarm
> there are a lot of matches like:
> .../log.do_compile.2431535:/bin/bash /.../cortexa15t2hf-neon-poky-linux-
> gnueabi/php/8.1.16-r0/build/libtool --silent --preserve-dup-deps --tag CC=
 --
> mode=3Dcompile arm-poky-linux-gnueabi-gcc -mthumb -mfpu=3Dneon -mfloat-ab=
i=3Dhard -
> mcpu=3Dcortex-a15 ...

yes thanks.

>
> > > I have no armv4 board at hand nor a found a configuration file for
> > > qemuarmv4.
> > > So I put some lines manually together using strongarm - which should =
be
> > > armv4,
> > > right? It resulted in
> > > TUNE_FEATURES        =3D "arm strongarm"
> > > The build completed without error - no runtime testing with qemu done=
 yet.
>
>
>
>

