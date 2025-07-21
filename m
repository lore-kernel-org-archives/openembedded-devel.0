Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A716C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:44:41 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.35151.1753083873109234760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 00:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLVGYKXy;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31c38e75dafso3240076a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753083872; x=1753688672; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu6znhCpctqx2C9S59bGc5+zyAiYfwUeiiZsqfT/gZM=;
        b=mLVGYKXydgEpVzm7mo1uSkOHmHOhD0uC1oIYtwRBZoFrt6mt0HNpkRV1h/IK3HQGXV
         3GL2WDWvjNsGQaJoUN2+nQH7XeAdNPOaEscepQYmULGlvyz9sEIdF3RyHBrWHOtRcj61
         IaZNGhnlv36nbWsZEhI6S8qz+a8HymaP3se9OHW1NImnSpoM6dFIRNxCFRVgtStW5G6X
         v1sxfbKG4ch/cUifippxSyomwmjpp9dZMzViDeV6SLHqVO++tlqoOixwrq2cDnYsXbf7
         okLeadDV3yTTEB+IPHLsXCxfLr/h2O3ssUVHloWFq9kPUUWRyhZ+/EDvfRU53FaQsbsn
         6JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083872; x=1753688672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iu6znhCpctqx2C9S59bGc5+zyAiYfwUeiiZsqfT/gZM=;
        b=VwBn4eKLHyOuQdVxC9QFu94ngh8iPznLxXNkpRVKOlifur+e41wvG//PU7qD2VNsLb
         Dv8zonZtbKZeBwF7bcoNRGUNDUdqjb5mEBgfEhTQul+l5g/o2XSpXvIKt40HoQumO7PW
         fRSrbFPGFlEvF5kbvKCLYdgW40L8mFAtDBkmjQk6P2z/sPSsJ687JDoU2I3t0Uv96atn
         wWGnXZVcyQgPsl9UNj+oxLkyszc7pCCFzyrei1O94NfvGbhV32r+2c8GqHiDwBb4N6ZT
         9BWIA+yfeIxjb9hMjOrbv9feeqVbw9DUsdBI0/h1lPdtuU0hS/+CUti/7nXxIIH0vH9g
         c9KA==
X-Gm-Message-State: AOJu0YyazTcTNgCbnQNk+XE0wzRfmY+y/ZndvxS8S2tRHY/4gqfglcgq
	l6V81bpcBs46wTUP91pgWPgWMbIUoq94JPOUbduiuuiSPXYBtDYSE6RgYU7BWifHcgRqjBvj7Wk
	JxXJY1eTQac/hliRKVxSSkpI26RZUlEw=
X-Gm-Gg: ASbGncsKU+20CNVzRQ/CvXg0ltv2frAOzXI6+V+NUxavRiKvrM0OddxkbLFsugJhjKS
	SeOiwKGcolDqVt8Hl3Ie2bRjfHmCJWeAKLlmhE6chTpBNX06OUw2ZkOwWiArSPO2lCHln4zINQT
	Kp9kXsadNbS/GT4FlUcU/SmX8aIHZiL6CR4U7LpFoVZD3L5DTdnfLhodDN6JTMDKdMBU3RBRPPo
	pORgTLnTe9zOX4u
X-Google-Smtp-Source: AGHT+IF9rPcLLwPUIs9pdVWQp5Oor3nHmLtqbpz8cMt7zFZW+hAnnimewr/aakbgEDL2ZYVcC4cAbey0akA2Kspwt70=
X-Received: by 2002:a17:90b:514d:b0:311:b413:f5e1 with SMTP id
 98e67ed59e1d1-31c9f45b1admr24560734a91.32.1753083872490; Mon, 21 Jul 2025
 00:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250720123127.25407-1-alperyasinak1@gmail.com> <CAMKF1spJyn03S5SiCVn7+r8qk7y47QrmAFA3_9=6BMZ=nhenmw@mail.gmail.com>
In-Reply-To: <CAMKF1spJyn03S5SiCVn7+r8qk7y47QrmAFA3_9=6BMZ=nhenmw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 21 Jul 2025 10:44:21 +0300
X-Gm-Features: Ac12FXz7AQaiHdXpq2EU2cn_xbQz2rRX0FZAp53NJ4LFC4558G2JzIGmS-t110A
Message-ID: <CAGpma=7kChcKrmKv+VdBu2O32Bv0dbnYg+esLWJ4ohqBxktAjg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] avro-c++: Fix build for 32-bit targets
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 07:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118653

> useless-cast warning option does not exist in clang, so it will break
> clang builds.may be enable -Qunused-arguments
> CCARGS:append:toolchain-clang along with this will make it work across
> both compilers.

I configured the recipe to be built with Clang by adding TOOLCHAIN =3D
"clang". Tried building both with and without the CXXFLAGS:append =3D "
-Wno-error=3Duseless-cast -Wno-error=3Dconversion" line and Clang didn't
return any failure/error in either case.


Khem Raj <raj.khem@gmail.com>, 20 Tem 2025 Paz, 22:01 tarihinde =C5=9Funu y=
azd=C4=B1:
>
> On Sun, Jul 20, 2025 at 5:31=E2=80=AFAM Alper Ak via lists.openembedded.o=
rg
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Building avro-c++ for 32-bit targets currently fails due to the followi=
ng warnings being treated as errors:
> >
> > - `useless-cast` in Symbol.cc
> > - `conversion` in FileStream.cc
> >
> > These are promoted to errors because of `-Werror` in the project's buil=
d flags.
> >
> > Fix:
> >
> > lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/parsing/Symbol.=
cc:91:27:
> > error: useless cast to type 'int' [-Werror=3Duseless-cast]
> > 91 | adj.push_back(static_cast(it - rs.begin()));
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1plus: all warnings being treated as errors
> >
> > lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:2=
08:41:
> > error: conversion from 'int64_t' {aka 'long long int'} to 'size_t' {aka=
 'unsigned int'} may change value [-Werror=3Dconversion]
> > 208 | in_->seek(position - byteCount_ - available_);
> > | ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> >
> > lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:2=
09:22:
> > error: conversion from 'int64_t' {aka 'long long int'} to 'size_t'
> > {aka 'unsigned int'} may change value [-Werror=3Dconversion]
> > 209 | byteCount_ =3D position;
> > | ^~~~~~~~
> > cc1plus: all warnings being treated as errors
> >
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >  meta-oe/recipes-support/avro/avro-c++_1.12.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/re=
cipes-support/avro/avro-c++_1.12.bb
> > index 726a861bc9..9032ff346d 100644
> > --- a/meta-oe/recipes-support/avro/avro-c++_1.12.bb
> > +++ b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
> > @@ -26,4 +26,11 @@ do_configure:prepend() {
> >          cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
> >  }
> >
> > +# Temporary workaround for 32-bit build failures due to -Werror:
> > +# 'useless-cast' in Symbol.cc and 'conversion' in FileStream.cc
> > +#
> > +# A patch has been submitted upstream: https://github.com/apache/avro/=
pull/3433
> > +# Once this or an equivalent fix is merged and the recipe upgraded, th=
is can be removed.
> > +CXXFLAGS:append =3D " -Wno-error=3Duseless-cast -Wno-error=3Dconversio=
n"
>
> useless-cast warning option does not exist in clang, so it will break
> clang builds.may be enable -Qunused-arguments
> CCARGS:append:toolchain-clang along with this will make it work across
> both compilers.
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118636): https://lists.openembedded.org/g/openembed=
ded-devel/message/118636
> > Mute This Topic: https://lists.openembedded.org/mt/114250491/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

