Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438DAC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 07:16:27 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9630.1714461377614610473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 00:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2RXwUtC;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51ae315bb20so6550853e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714461375; x=1715066175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJaDRMuxV2LCjtC0wOLiSyOoEvFMyMe/g8uwoaq02Gs=;
        b=I2RXwUtCKfBJB0RaG7NphDE3rBrDfsa+Pgt8m2stUfOKQrk+xMpj9jaZm0HMWRphX/
         2wjx8gBhFq12SnNFFUs8cYKDjJsMB8n3Co/WWRZGospgHq58e/GOsK4+hrod24MUH3Cj
         ZYeO7wP1Hj+zaSRtOoiEv/YfqtrmgoxcJsqMb0xUKMmE2ioYy6g/mxq8oxGSRU94ZAJY
         jbdFzfmYUxaxNq4qImv5/HTtQACNv5jjq/oTfTV7EPA02xRY02QfuYLo7ori9fYqKU25
         6YIziYqAKQJcGUaY3Dfb07Qd3PEa1yAMlGjQ34nKk0E4wGdI4ydVhKbUKw6DxIxhmm/3
         M+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714461375; x=1715066175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJaDRMuxV2LCjtC0wOLiSyOoEvFMyMe/g8uwoaq02Gs=;
        b=hb5I0PL6lvm0DYEs5mO/EdeoGnpcYR1Mh0HBQvIzE99LtrRP30OF7R5p1Ara74Ph5r
         JKTefL9kRwpaVX+Yas+p0y6yr5WPlkCuX8dJDl6QjR7cACYHUJLhieeSyVLhJGH/J6aI
         XWVUmCb8ha3rsRBXitr5wfdoD9WAu4pa9PvARFplO6XWwmvi/kUyZAKe4XplVtcQC99L
         Y31TcuGJdiVxDrzOClmk4s20iKEUEuPaP54R39R+cEZGVS5X7vfnB5iLYxptGDPmeevt
         3i+m5F6kk5018oCD/lT1E4m53nvnmWhz5EGYd0l4VF1Lxlw8NdztwHKi+F9maRsvsEkT
         zeDg==
X-Gm-Message-State: AOJu0YziZ1lh/UZP9WUeeEqHLU2tAMPgYsDIu+xszVMxdCe+s+dCm852
	eEGR6SOcJUsnaFC8XljhWsGkVar0jrF7VZ6p7H6u2AQ9Qn6f9m0Dm0uE5ifDsDcV81OO6av/ra2
	Roc/Z73ASC88e9OY1Hl2YkGNtdfw=
X-Google-Smtp-Source: AGHT+IHiNPCQ5lfG8VTiHGZm25IQ08Y3n2LPR+Of/jtwJrBg1XGcmtaEDrLzV4rT06GWtDeS/cs+vqV2IAifZUIWpXc=
X-Received: by 2002:a05:6512:4cb:b0:518:b144:9020 with SMTP id
 w11-20020a05651204cb00b00518b1449020mr1176926lfq.61.1714461375154; Tue, 30
 Apr 2024 00:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240327071636.2207445-1-mingli.yu@windriver.com> <20240327071636.2207445-2-mingli.yu@windriver.com>
In-Reply-To: <20240327071636.2207445-2-mingli.yu@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Apr 2024 09:16:03 +0200
Message-ID: <CA+chaQdkCsa2P-qJ5A-fQ5=n-sAmeHXLooBW3nsbrrLHPgSLjw@mail.gmail.com>
Subject: Re: [oe] [meta-python][kirkstone][PATCH 2/3] python3-pyyaml-include:
 switch to pytest --automake
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, tim.orling@konsulko.com, 
	Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 07:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110191

On Wed, Mar 27, 2024 at 8:16=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Tim Orling <ticotimo@gmail.com>
>
> * Also replace ${PYTHON_PN} with python3
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 182f31a182f6572a3538b875cec7ee761e2da1e6)
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
...
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1=
.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.=
bb
> index 9bfaa2194..3a5bd99a7 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Extending PyYAML with a custom constructor f=
or including YAML files w
>  HOMEPAGE =3D "https://github.com/tanbro/pyyaml-include"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> -DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> +DEPENDS +=3D "python3-setuptools-scm-native"
>  SRCREV =3D "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
>
>  SRC_URI =3D " \
> @@ -20,9 +20,10 @@ do_install_ptest() {
>  }
>
>  RDEPENDS:${PN} +=3D " \
> -    ${PYTHON_PN}-pyyaml \
> +    python3-pyyaml \
>  "
>  RDEPENDS:${PN}-ptest +=3D " \
> -    ${PYTHON_PN}-pytest \
> +    python3-pytest \
> +    python3-unittest-automake-output \
>  "

This was now merged to meta-oe kirkstone, but the
python3-unittest-automake-output isn't available in oe-core kirkstone,
causing:
ERROR: Nothing RPROVIDES 'python3-unittest-automake-output' (but
meta-oe/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
RDEPENDS on or otherwise requires it)

python3-unittest-automake-output was added to oe-core in mickledore:

openembedded-core $ git log --oneline --
./meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
db0e82135c python3-unittest-automake-output: upgrade to 0.2
961e4f3fc7 python3-unittest-automake-output: add new recipe for ptest
integration

Please revert this (if the newer python3-pyyaml-include works without
this change) or add python3-unittest-automake-output to kirkstone as
well.

Cheers,

