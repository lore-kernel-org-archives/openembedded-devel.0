Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A7FC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 05:29:00 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.7461.1715750932082793065
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 22:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKE3lnCf;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-240de3847cdso3403478fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 22:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715750931; x=1716355731; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q314GlK+jJUKEZfsDwnQ62RrxAYvTF5GayZ2i7etmZI=;
        b=hKE3lnCfbQm5QGMZPFf59jn+i4wDAxVynU40PBnow7MzQUvsIgQdjNGla8zeFvK49P
         tmo19lR8T91YKyPp5y9c+Zmr0ACfvLHr3TYoUtaOylIGnT8+0l4my+OSbNT0sYkMLazH
         ycUNHT1oEpwDakscmt1S6R5yVwZwyoLXGwp1i33S2l9AAWEag2dZhGhOKDk+pvPfppFm
         nHFVsni/LxX20YwTnhyrglrp4D4WwO70V+7RecISpSXcyJRfED0vKQAEd1qUw6dXzcpv
         jyKucZSbDLgALw3ni9cPd6UbB5ztjhcmJSExMfC31u42bYsXwbzuanpmkG8sj+zHD1Fe
         HkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715750931; x=1716355731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q314GlK+jJUKEZfsDwnQ62RrxAYvTF5GayZ2i7etmZI=;
        b=q2z/Et/BWzEjsAGP1iULqiYKgyjGOLcni8YoJim2/oYiJ4fwPGLza1c5Zu5Xh8eAhc
         Ko0I47XwfphxsPiSXbvU3XaYDPiR7/6TWInj92gPGJabcCJe0vdfrOBQ/lUlINnid7kf
         vv3ldn/BTbgYJMUFFrmBcN9jvw29InAvDeiLokDTqH36gyRz+I4U1MRysjTFUbdHiS5e
         MO/YDb8omETPh1yatYtu0cumUoeKP9kyHmbGmsPInvIA8dB4MvVA4HFTw729kpT3dw/N
         EZKuDq00IZTlAEsqLRV1OJH6BtyXdKh2E4ipVf2ujpQUfqj5p8kaOmID6cNGqWz8Gx/W
         zYEw==
X-Gm-Message-State: AOJu0Ywq4fIHnLioMQeJFUYaP/v7kcd8hjnMS+6lVjoR27y9B/R4ULBj
	d/3LxZxoAwOjmrI1fjKhfZ2QvaLJv+TVVgmf3g/htyUClBRjtJ/+cml3WDs8its0A+vGUngxs01
	3/76FeydozsTCQY3eoIDM9yYinFyiSprq/W4=
X-Google-Smtp-Source: AGHT+IH01vQmQkGvjoQvgreKM4rRaClV9mQnRWXIB88bbotbK3u+SZDNWigqLXrWBDVrjBcQ8wVI5jhX+fB5zmN1LkU=
X-Received: by 2002:a05:6871:414:b0:239:700d:61cd with SMTP id
 586e51a60fabf-241726f5a84mr17729394fac.8.1715750931237; Tue, 14 May 2024
 22:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240515052002.3843823-1-abhilash.kollam@gmail.com>
In-Reply-To: <20240515052002.3843823-1-abhilash.kollam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2024 22:28:24 -0700
Message-ID: <CAMKF1sryx6_zOpA4LmnDptepBDFjvh4w-3b4areA1n00OSbf2Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] opentelemetry-cpp: add opentelemtry recipe
To: abhilash.kollam@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 05:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110402

On Tue, May 14, 2024 at 10:20=E2=80=AFPM Abhilash Raju via
lists.openembedded.org
<abhilash.kollam=3Dgmail.com@lists.openembedded.org> wrote:
>
> An Observability framework to create and manage telemetry data such as
> traces, metrics, and logs
>

Thanks for your patch, I have a few comments below.

> Signed-off-by: Abhilash Raju <abhilash.kollam@gmail.com>
> ---
>  .../opentelemetry/opentelemetry-cpp_1.15.0.bb   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opentelemetry/opentelemetry-c=
pp_1.15.0.bb
>
> diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15=
.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
> new file mode 100644
> index 000000000..85df5be82
> --- /dev/null
> +++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Open Telemetry Library"
> +DESCRIPTION =3D "An Observability framework to create and manage telemet=
ry data \
> +such as traces, metrics, and logs."
> +HOMEPAGE =3D "https://github.com/open-telemetry/opentelemetry-cpp"
> +SECTION =3D "libs"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D86d3f3a95c324c9479bd8986=
968f4327"
> +
> +DEPENDS =3D "nlohmann-json"
> +
> +SRC_URI =3D "https://github.com/open-telemetry/opentelemetry-cpp/archive=
/refs/tags/v${PV}.tar.gz"

github archives can be regenerated and hence we do not use them unless
the release archives are created explicitly. So please convert
it into a git fetcher based SRC_URI pointing SRCREV at 1.15.0  SHA

> +SRC_URI[sha256sum] =3D "69b0fef380658e15be9d817bfcb32e3f5de96da652bcdce7=
7b4e750ed8beddee"
> +
> +S =3D "${WORKDIR}/opentelemetry-cpp-${PV}"
> +
> +inherit cmake pkgconfig lib_package
> +EXTRA_OECMAKE =3D "-DOPENTELEMETRY_INSTALL=3DON -DBUILD_PACKAGE=3DOFF -D=
WITH_OTLP_API=3DON -DWITH_OTLP_GRPC=3DOFF -DWITH_OTLP_HTTP=3DOFF -DWITH_PRO=
METHEUS=3DOFF -DWITH_BENCHMARK=3DOFF -DBUILD_TESTING=3DOFF"

All these look good candidates for PACKAGECONFIG elements, so please
convert them

> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110401): https://lists.openembedded.org/g/openembedde=
d-devel/message/110401
> Mute This Topic: https://lists.openembedded.org/mt/106109161/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

