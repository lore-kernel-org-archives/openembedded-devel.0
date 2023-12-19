Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F564C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:37:01 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.626.1703003819326181375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEVTFR7R;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso3186743fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 08:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703003818; x=1703608618; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub4ebxY4wk+pQdk29kXu/hIOltXwvdAQsTuow2S2JBw=;
        b=cEVTFR7RCP5y7RthknKXXvbzpqxo4nLQI/bmwU76mTuAdpGJiNOdM9gK3u8ZET8U8m
         4t7KHlEifCmXjPYa+yXnhZqoqZ1QIACWBNAEn8yPPIO0UlcgCu23AmyyMdbH27ACZLg/
         3qY9I883lyrs1rcVREN2YrJG2labPTd2vuPKcI8QKoh3m8noLVIlrdFrx4S26LRzmfoJ
         UIpfys9MhoV6iGYDItngeshLV+b4ZUi2RvhVPdr3nE8uCuYTZWwscv0ZWKhXY4/cm5m2
         u6IXMn/0GKvorkfz4TljBhB1aEd/Oc+bBR5+IERMH8BL2dny5v6rRWG2CWOiV2X5eCkK
         QMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003818; x=1703608618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ub4ebxY4wk+pQdk29kXu/hIOltXwvdAQsTuow2S2JBw=;
        b=Bgz3raeKmqMTLbeDfiLF6iw5sRpdq9bkX8MiP2FX1kIxJYsX5HVfR1Q3jUlhlfnQJP
         0nxnIav/QCyidKVNSar/5gBPr3//NSZPDhltcKSDHlGjIuX/CmBVdUVmfR66CEr63S/f
         ryFxLMpi2srtBI9b4b0IlqvmwTXnspfw4MCNZMQn7IiiU08axOdt7iOSCMC4BHa+Mv2/
         38HL8DvGbRmoY/IldzIfBzhaKt6bsR265YSu/WMqnbbU/G4Lgyk5q+xBkAl0PkMCzc0L
         f8KOIA+7feqldSiXbUrCSvDxn6MQ94zP70Fui76DJ/jPXj1jploYk0BO7o6j6giPRrgL
         1qQA==
X-Gm-Message-State: AOJu0Yy1yYb6YryMvFYwyC1XEqBxj5AdWrij6kB9LIlNStIfht5b3k9o
	2FZm58/QS/ihtzLCDoaRuQiK0Ri14vvN8rtGBeI=
X-Google-Smtp-Source: AGHT+IFLr44EWT7b2lcQhJSUpBSkN4Z7JLTmjwx4ioMh+DqHUlFfNpJfQo0wtF4NV02RBQ3yUTvQ4x3AzSeGRJICats=
X-Received: by 2002:a05:6870:9383:b0:1f9:e6cb:7eb5 with SMTP id
 b3-20020a056870938300b001f9e6cb7eb5mr20879861oal.18.1703003818291; Tue, 19
 Dec 2023 08:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20231219162705.3865469-1-niko.mauno@vaisala.com>
In-Reply-To: <20231219162705.3865469-1-niko.mauno@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Dec 2023 08:36:32 -0800
Message-ID: <CAMKF1sog8ZgKeTN6WyOK77zBKTFA77_kVFmBc7FKwDaTQFr9Pw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] pkcs11-provider: Add recipe
To: niko.mauno@vaisala.com
Cc: openembedded-devel@lists.openembedded.org, quaresma.jose@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 16:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107639

On Tue, Dec 19, 2023 at 8:27=E2=80=AFAM Niko Mauno via lists.openembedded.o=
rg
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
> From: Niko Mauno <niko.mauno@vaisala.com>
>
> Starting with version 3.0 the OpenSSL project introduced a new modular
> system to extend OpenSSL that replaces the deprecated Engine modules.
>
> Providers are loaded via configuration directives in the openssl
> configuration file (or directly loaded by applications).
>
> The pkcs11 provider allows applications linked to openssl to use keys
> and cryptographic operations from a hardware or software token via
> their PKCS #11 driver and the use of PCKS #11 URIs.
>
> The pkcs11 provider can be configured to be automatically loaded via
> openssl.cnf
>
> For more details, visit
> https://github.com/latchset/pkcs11-provider/blob/main/docs/provider-pkcs1=
1.7.md
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../pkcs11-provider/pkcs11-provider_git.bb    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pkcs11-provider/pkcs11-provid=
er_git.bb
>
> diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.=
bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
> new file mode 100644
> index 000000000..2e25d91c5
> --- /dev/null
> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "An OpenSSL provider that allows direct interfacing with pkc=
s11 drivers"
> +DESCRIPTION =3D "\
> +This is an Openssl 3.x provider to access Hardware or Software Tokens us=
ing \
> +the PKCS#11 Cryptographic Token Interface\
> +\
> +This code targets version 3.1 of the interface but should be backwards \
> +compatible to previous versions as well.\
> +"
> +HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
> +SECTION =3D "libs"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2=
d45"
> +DEPENDS =3D "\
> +    autoconf-archive \
> +    openssl \
> +    p11-kit \
> +"
> +
> +SRCREV =3D "e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584"
> +PV =3D "0.2+git${SRCPV}"

I think SRCPV is redundant here as we do not need it on master.

> +
> +SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107638): https://lists.openembedded.org/g/openembedde=
d-devel/message/107638
> Mute This Topic: https://lists.openembedded.org/mt/103265166/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

