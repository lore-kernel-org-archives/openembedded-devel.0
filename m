Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D08E95A77
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 23:45:43 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.28889.1696722334336464564
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Oct 2023 16:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BYh+Z0q4;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1e1e25ab32bso2280340fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 16:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696722333; x=1697327133; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOwcKiW/cYS72Fq7RJM8TPZ2flOFM+ynOG9X799lctQ=;
        b=BYh+Z0q4xdG8gFysFVimpPhsiTyRAqLZgv5Cq/5FC67EWV+ukOg+Eluzb4f1kqz9R+
         1xYv2YoEeXzWtLcTrDhLynmd6Zd076+II0d3dTIt6CkWnjBtl7Vgu7nWfhKwcm4SlKF2
         mQXG6+w6xtlXgXYGCWZe3xs7KsTzCPeScwYOrNszZ+E/IhxxhT5HkP8paREUPcPaQZCw
         oeHNnQ2VE4JXfo1kFzeFmJy4Y/bCzyn7GAbxT4u2+zH2MGKmm94iGeFUnhJN22Jbd7JY
         QQucDX2NBAY5Ziy1eFlSGuD32Cry8idvX/LReuCJIGAUyBe0AdSStVSz2YDgbI/wcgUB
         cmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696722333; x=1697327133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOwcKiW/cYS72Fq7RJM8TPZ2flOFM+ynOG9X799lctQ=;
        b=J+v1yetKuiP3cRnpgK9JWmdT/srQUDoqb+ehXEg63G4BYt/nEq9or1oQo9++lFNiiF
         NBs+MXaHEp0arHx5DcpDo4VgVOWUq7VJuybeuCqWBMjTm+vAMKBBtfO0R6BB6BLIg+uX
         v8QV0Nezs7LvTK5EIf44r4kNE6Y8cJqoD9I/eSVeb1NReclRAUkrXWRGsUYLjLpbB3/H
         O6ilCL+HMtpJJoS5TE4VgZZMpSSsiYHrYUfFaw6z+iuefwRBEDaUeAECEMZ57ZEvGrUq
         xEsOkCDrxKt1Qvf05b8Mb77wtWYPEIe5OrKQJCY1FqNpZJ3nYejwqRMVRyDhDVEC2QRT
         wM0g==
X-Gm-Message-State: AOJu0YzmG4iIa1fniaqqzF2QKkoedM+wImsC8RdIQ9A1juIHflpIchPd
	jsl9WwjsbnGMt+ojUImwqNtRGzlqkOYBM1+e6aw=
X-Google-Smtp-Source: AGHT+IFdmw+CbhdyNeArpeuw7JV2lqBwCUnaUO2meWg0qw3L4OXW1xrYuG5mhisjw0HVAs0/G9XWtfwLlfKWNvjWnQI=
X-Received: by 2002:a05:6870:d1d3:b0:1d6:5b09:1584 with SMTP id
 b19-20020a056870d1d300b001d65b091584mr14413082oac.5.1696722332214; Sat, 07
 Oct 2023 16:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231006155744.36093-1-cvubrugier@fastmail.fm>
In-Reply-To: <20231006155744.36093-1-cvubrugier@fastmail.fm>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Oct 2023 16:45:06 -0700
Message-ID: <CAMKF1sr7mVNG4Zf2pZucTWR1sC5NVEi7YCtLXNN2tKd1wSkuBg@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] libnvme: upgrade 1.5 -> 1.6
To: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc: openembedded-devel@lists.openembedded.org, 
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 23:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105380

failed on musl see

https://errors.yoctoproject.org/Errors/Details/739389/

Below is point of failure, musl and glibc differ in ioctl API definition.

../git/test/ioctl/mock.c:117:5: error: conflicting types for 'ioctl'
  117 | int ioctl(int fd, unsigned long request, ...)
      |     ^
TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/libnvme/1.6/recipe-sysroot/u=
sr/include/sys/ioctl.h:115:5:
note: previous declaration is here
  115 | int ioctl (int, int, ...);
      |     ^

On Fri, Oct 6, 2023 at 8:58=E2=80=AFAM Christophe Vu-Brugier
<cvubrugier@fastmail.fm> wrote:
>
> From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
>
> Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
> ---
>  .../recipes-support/libnvme/{libnvme_1.5.bb =3D> libnvme_1.6.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libnvme/{libnvme_1.5.bb =3D> libnvme_1.6.=
bb} (94%)
>
> diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb b/meta-oe/rec=
ipes-support/libnvme/libnvme_1.6.bb
> similarity index 94%
> rename from meta-oe/recipes-support/libnvme/libnvme_1.5.bb
> rename to meta-oe/recipes-support/libnvme/libnvme_1.6.bb
> index 4b6f1e30b..37e5d6301 100644
> --- a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
> +++ b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c \
>                      file://ccan/licenses/CC0;md5=3Dc17af43b05840255a6fed=
c5eda9d56cc \
>                      file://ccan/licenses/BSD-MIT;md5=3D838c366f69b72c5df=
05c96dff79b35f2"
>  DEPENDS =3D "json-c"
> -SRCREV =3D "4fea83db8328ea788ea8f1001e8ce1cb80ef5fae"
> +SRCREV =3D "37a803cf77e224f66d86b1e1d9e74a15f55ea600"
>
>  SRC_URI =3D "git://github.com/linux-nvme/libnvme;protocol=3Dhttps;branch=
=3Dmaster"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105370): https://lists.openembedded.org/g/openembedde=
d-devel/message/105370
> Mute This Topic: https://lists.openembedded.org/mt/101800613/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

