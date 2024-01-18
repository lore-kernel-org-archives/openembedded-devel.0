Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E343C47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 16:51:36 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.18043.1705596688463727694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 08:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R8rTuHUw;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-206b77b9f4bso5508909fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705596688; x=1706201488; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFPf7l3UAkdyG0RxDXPKGYPw9bpFpL6VSY5cGg1SRHo=;
        b=R8rTuHUw66emmbxwfr3C5qMXL/pS31eCbQZJCepTxn5LHGlPvo/nhNaq/oU/FAuFQr
         aVLDaC1PMfMf4VMzya0Z5lsharFjX8nTEJi7b6GFfc3nv+SuuXF4c1+1TtkAKdRSmnuA
         vbKPh2WhcPcaTU0yrgC9HAe8+d2lU7V9vX+UQ8OhGe14j39uYSabMCnyKefi8Smgjz/j
         ibqmjzIQgjcB54Z2CNGhT/h4lLtjPyM4VnmQcY9ia1vErRpZhOhNjzFi5zBTHbDOkyAv
         SUQXTcEgmfHZwj85ESv8Ul5SlA2cADs7yP6k4irsyJCZDz+kffVnjvTxNXxjmd7lWQXY
         94GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596688; x=1706201488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFPf7l3UAkdyG0RxDXPKGYPw9bpFpL6VSY5cGg1SRHo=;
        b=JS02ViWcc0UTL5WqXBJMfEt/2dsU35h9+RWtytE4KQ4V5iEkE1hMnEPc++IoimPOcl
         XHGsXQ0Z06kX9GdDEOL0bnt8pG22tkJ18HtNfMvlZDe5cGepH5UWqmWD//V9tRQ+n6hs
         A1lapBkhFXDgqlza6nPW/ixfUAIBi5MhKqadCE8NZuIK8B3vkBvBYQ4cf/6EQ7fTjwPO
         7rCTe3EH37UYB0fpBjbq2T45HwG1d2fM/hQpkxRpLEHqwcrPqtGwX5AtfRiqkdGiWhww
         XQs4ZBzS/Qfdz1kBOW1CPiTVH9FkMmy99ecvvEIoF3klwhUItsc4Qhuwq3jfI5W7pufO
         BdNA==
X-Gm-Message-State: AOJu0YzvdoVZWm98mBo1SLFrNCk1t8NzUm53cyT9gDiCTLyHZ2DYHu0e
	Ids6hV1c1pocQPi68axPg0VUQf2o56Ipbu/G60FQ4yxRrO05ooMOuPiEBB9vehWdU2/T2YX4O50
	EIp6OGMoD6hO2kZ9fsqO5shhZWAZKW05suN/HsA==
X-Google-Smtp-Source: AGHT+IGEG+QXnxfY1qcRN/+4X6TPjhkaFvJvoVyzkOkBULeVdEsPVJYU8IU9f5gu8SM0uUBFJAqdWEiglLxRF8WHGjo=
X-Received: by 2002:a05:6870:ef16:b0:210:8adc:52a7 with SMTP id
 qq22-20020a056870ef1600b002108adc52a7mr1301659oab.90.1705596687705; Thu, 18
 Jan 2024 08:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20240117202405.29013-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240117202405.29013-1-simone.p.weiss@posteo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jan 2024 08:51:01 -0800
Message-ID: <CAMKF1srwkG9N7oELo9V5UtiO6r5Cx9KHAvc2xorkPVzCZBHALw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] open-cl: stop using "virtual/" in RPROVIDES
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 16:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108348

I have staged a similar patch already in master-next
https://patchwork.yoctoproject.org/project/oe/patch/20240116235052.3713167-=
1-raj.khem@gmail.com/

On Wed, Jan 17, 2024 at 12:24=E2=80=AFPM Simone Wei=C3=9F <simone.p.weiss@p=
osteo.com> wrote:
>
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> For RPROVIDES and RDEPENDS the string "/virtual" holds no special meaning
> and hence packages should avoid the use of "virtual/" there. Update it
> for opencl to the suggested alternative "-virtual". See also the
> discussion on the yocto docs mailing list:
> https://lists.yoctoproject.org/g/docs/message/1785
>
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 2 +-
>  meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recip=
es-core/opencl/ocl-icd_2.3.2.bb
> index 93fac969c..d43ea281a 100644
> --- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> +++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> @@ -15,6 +15,6 @@ inherit autotools
>
>  DEPENDS =3D "ruby-native"
>  PROVIDES =3D "virtual/opencl-icd"
> -RPROVIDES:${PN} =3D "virtual/opencl-icd"
> +RPROVIDES:${PN} =3D "virtual-opencl-icd"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
> index 6bf01a248..146ec6e47 100644
> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
> @@ -9,7 +9,7 @@ inherit pkgconfig cmake
>  DEPENDS +=3D "opencl-headers"
>
>  PROVIDES =3D "virtual/opencl-icd"
> -RPROVIDES:${PN} =3D "virtual/opencl-icd"
> +RPROVIDES:${PN} =3D "virtual-opencl-icd"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108339): https://lists.openembedded.org/g/openembedde=
d-devel/message/108339
> Mute This Topic: https://lists.openembedded.org/mt/103794862/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

