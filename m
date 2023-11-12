Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DB6C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 23:05:34 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.25620.1699830328821599512
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 15:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ARwBe9vX;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso2581507fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 15:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699830328; x=1700435128; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTW9cZFiJ7T1/w9wpCGX140R6aBV0SS4tl/etavoxN0=;
        b=ARwBe9vX7O19dMYw8fUIeBlBQY6pJ/w4FACGwZtztEnLi1OrIUXwrioWnb5t8aLEll
         YZsfnzQtodZsaRc8fWOlnijZc0KiotG+Cxh5oPoUWIjn8gtYWImYUeqgdwYOW92tPtfN
         JA9U8hyZjwVfeHDynL6RPosqWY1EmTGBwQ8FtUT5QSDOxYixZxE7YGmdjqJ//X/8i8f0
         6HadMFOYCDPvMTrNZunitI8VJVCoFyAlGTs0hPkUx4ArNSggD7N57ZZr+7+62qCHad2s
         2Jv6Q4kLy2GAI+9T5tVydWrjWvyIs2plX9gaBIXdGpXqzWJZRabr08QMH4GKFSNdgl1V
         D0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699830328; x=1700435128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTW9cZFiJ7T1/w9wpCGX140R6aBV0SS4tl/etavoxN0=;
        b=JEEdVgBRm4uPU3MTUWruZAOspAaw6Dmoj85FomF1VXY2GyjTQGxntS4tlBTiVD7B14
         /zwSX8quHZWBrMsrPs+h3s0p6cuFHmAnIRJNQ7hrDmBwHuuNURXvLTc7G+PPHDGNLJfl
         43N2aTgFMuS0oizdUByNd+IO8FPMbw7v88hD+yL9MjSdyr7sF8xhVAjwOaUkgSZXg9xA
         yc1evCTWm+C4NGRFmKP4YJya/942p0W4+ccc7iajriVvRJzI5V1nyv6cfTJIXtSGZJz1
         rSQh72Of8m3kAMh5qG9ZJr08a4pL++3uTElVivrzncD2SpkBya0Yl7AMHjc1NAgU78e6
         SVpA==
X-Gm-Message-State: AOJu0Yx03drX/MdnVbUnNIVTdB6g/BS4R9vEkEa1o2NsYI6u6k3taauC
	h1ieU3QTqCvKnkNKiRbUExQxyCY62gqQNwzTtmxdpig/Ew8=
X-Google-Smtp-Source: AGHT+IEIgOFVvkes2p7SfNsvgLt31LIBBrtSGfSqwVpJ7n2lMV/6xGyMq94Ql+xEozJqvhwUs8O4aTwkLD60/9GoEpw=
X-Received: by 2002:a05:6870:1ec5:b0:1d5:a72e:154e with SMTP id
 pc5-20020a0568701ec500b001d5a72e154emr7058567oab.36.1699830328176; Sun, 12
 Nov 2023 15:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20231112151849.414772-1-alperyasinak1@gmail.com>
In-Reply-To: <20231112151849.414772-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 15:05:01 -0800
Message-ID: <CAMKF1squWYBDJ8jvW--280VrpycWATcvcMhrfGV9gHD4z3YFkg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libopenmpt: upgrade 0.6.2 -> 0.7.3
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106616

On Sun, Nov 12, 2023 at 7:19=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> Changelog:
>
> https://github.com/OpenMPT/openmpt/blob/de9e591419eb5f5534f06da2876515fe7=
af18039/doc/libopenmpt/changelog.md
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../libopenmpt/{libopenmpt_0.6.2.bb =3D> libopenmpt_0.7.3.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.6.2.b=
b =3D> libopenmpt_0.7.3.bb} (93%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6=
.2.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
> similarity index 93%
> rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.=
2.bb
> rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.=
bb
> index 47173d71d..58fc8278e 100644
> --- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
> +++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
> @@ -7,15 +7,15 @@ HOMEPAGE =3D "https://lib.openmpt.org/libopenmpt/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae09d6164bdecb499183479fd32b6=
6fb"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D59f6e21f42e49919617267ff13a0b=
232"

why did this checksum change, Can you add a comment about it into commit.

>
>  DEPENDS =3D "virtual/libiconv"
>
>  SRC_URI =3D "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${P=
V}+release.autotools.tar.gz \
>             file://run-ptest \
>            "
> -SRC_URI[md5sum] =3D "d21fb799695cbe10a1e9aeaea23ed708"
> -SRC_URI[sha256sum] =3D "50c0d62ff2d9afefa36cce9f29042cb1fb8d4f0b386b81a0=
fc7734f35e21e6b6"
> +SRC_URI[md5sum] =3D "ffd572d817a090554f55adf97c1997c2"

drop setting md5sum

> +SRC_URI[sha256sum] =3D "2cf8369b7916b09264f3f14b9fb6cef35a6e9bee0328dec4=
f49d98211ccfd722"
>
>  S =3D "${WORKDIR}/libopenmpt-${PV}+release.autotools"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106590): https://lists.openembedded.org/g/openembedde=
d-devel/message/106590
> Mute This Topic: https://lists.openembedded.org/mt/102543657/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

