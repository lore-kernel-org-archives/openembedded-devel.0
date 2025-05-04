Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1237DC369C2
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 00:47:45 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.21549.1746319664110332096
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 May 2025 17:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RK21xXNB;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6065251725bso2014269eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 17:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746319663; x=1746924463; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTZguosZcP8fPa74KSIk9p8JvChmurapeSkUrkOA2Pc=;
        b=RK21xXNBRc7fVgDJaQ8WfZDMC959tSZzHakA02/Y/witlhRxCaZVUGdhGWcN4ZDUB+
         fVO2Vl7RQRSR60MUnGNUos+6gecIj/pRrQYjU57Hpn8oFEEDzczWcKUvWAVaUmrvnhv/
         W2kqC2mAhQBiSwTyT0qsXDrGNCy+Wn7zlxpw0u+XqAvrbWcsjRtjb9bAuB5btIy/9N1s
         p0NJfHSnKJrZ8c0gAbi/dC90pnOFADnGSV/q0MkBResMtqCr52gw80y17O2/2ZwsNyTE
         zv+KOn6bc0eUkVv71zrQb1H4skhVi4Aomf+DRGi1VKyiq8PSt+6Tuc/HbWwj9yZfbS4L
         PBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746319663; x=1746924463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTZguosZcP8fPa74KSIk9p8JvChmurapeSkUrkOA2Pc=;
        b=W15dC24SR9C/VuubWHBM7HFc7sHZ/Pcva0XgoMvMwjUtgrq1EbP4aZZp286Q8jcBXX
         1b6m6ZEG1FuN4MQy8c8WBRIqmwNswIxVUaLT92apyTh72V0l0nY3B5b/P2hcn1eLGYHV
         cZsdxu0H3mOfu/mkwd/O/5LVcic7guaOfOXMl0rBn62mkmaXrtHq9+Zi6bBVBmpPHbU3
         nDZ+KfEgUVYMMbrUO8pRtEtDH3wgh+AiBoufG8NLB/qnH/AG8w9h6q6bEyeD53PnDoum
         D+jgeGQHg+z4jcnje9aT5WX3TD52/g5Q4aE1c29d42JG8ZdMGpwoSTphp/sdpI9CODn8
         oW1A==
X-Gm-Message-State: AOJu0YxCnzcPBt1TdffVVhkem3PXrNnCkozTAtwzYSMZ33GzDsO+2Xjc
	n+H01dN+B09tnTFXzciiM5e+oUXX6FChA/YFYBcJbAYx+HZAJPa3LXW/Fr9pLh3itRVsJpLm7Wp
	nn/ZKbIcJkzbaQQef4MV1bynnF7Q=
X-Gm-Gg: ASbGncu96edVGyEUJEr8IOdN3Ez+VqgLPyxR4RWOzwA1ks4CPgmY8qZjoBdl/j+xPIj
	+2G93xyT3c6d4+K5jKemcLRTCCQnkRzyov5CI5afu4Iu078gpesTL5CGVApH6jMZy7TktJNekRs
	uZZwRDiTyQoMNGr1cM64JG
X-Google-Smtp-Source: AGHT+IEwj1ld0tEKJkaxqc8sXjuPZPMqlx1lee5kmnguxbzN9ksRZ5IkyXqy6CUK9Ps2ltFUv2HFn/79NFF8usNhv3g=
X-Received: by 2002:a4a:ee14:0:b0:606:9ed9:c38 with SMTP id
 006d021491bc7-608000daa14mr1445756eaf.0.1746319663218; Sat, 03 May 2025
 17:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250503182609.2224178-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250503182609.2224178-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 May 2025 17:47:17 -0700
X-Gm-Features: ATxdqUHISewedry1O6KF00heiCl6I7ZpMaktNQUArdoNm0-yZAkO5sYiNtd07RM
Message-ID: <CAMKF1spQ3CThfb23+FzQ0VJg_c_q+Yjc7jOT4iuwu4CugHDSWQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 00:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117288

On Sat, May 3, 2025 at 4:07=E2=80=AFPM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> - Move "libsimplelog" to "recipes-support".
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_1.0.6.bb                          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/{recipes-libsimplelog =3D> recipes-support}/libsimplelog/=
libsimplelog_1.0.6.bb (95%)
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6=
.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> similarity index 95%
> rename from meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.=
bb
> rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> index 0aacbcd2cc..c159492aac 100644
> --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic=
"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517=
952ac7c"
>
> -SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps;tag=3Dv${PV}"
> +SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps;tag=3Dv1.0.6"

Please keep tag=3Dv${PV} instead of hardcoding v1.0.6

>
>  SRCREV =3D "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
>
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117287): https://lists.openembedded.org/g/openembedde=
d-devel/message/117287
> Mute This Topic: https://lists.openembedded.org/mt/112598333/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

