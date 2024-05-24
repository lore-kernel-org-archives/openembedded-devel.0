Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43A8C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:41:00 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.1641.1716572457283051134
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UCaFsvIP;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b96b249d56so429600eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572456; x=1717177256; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii/akuXzK3YBpD7lum6il6ns015fQFpI+WiDobGcKC8=;
        b=UCaFsvIP1pIMb9U7A0ccDbbgAWS7xb0T4jo+5gFHqSBCZkKuBWXkMQE5dBPuKyP49O
         Ik4MaFNeU41FUfoyxYwCqSGOjz/E4wSn8dWLNRhyaNHKgnht73eo0spe0PqMJMJ5HptV
         QvisE4va9L13cALyKTUTFEXTcuCocd8lh/sHZMNCUDlABCp9Jj5MUUqaZfTtX51qpK9G
         EvbTSI5Es7vS+F0DxlEWtZxVLPF2f31GnPKHCqoOMU9AIMp1D2vYhmr/Lazh8H6LmAvj
         NaKjFdHRkvHGnwyoFwkPbeoVWmjMIYIoXBdYVJSXEZKiBQeEo1yiCqTC6YxZtlC3MTvR
         o+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572456; x=1717177256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii/akuXzK3YBpD7lum6il6ns015fQFpI+WiDobGcKC8=;
        b=NbUxvzckQs8VHvFHHBSbOuoZ0sPmwdh0ir6wo9kOxZMhd2Vuqe5N1Xg+wzk5N96LpV
         h/dyvsdLFwSLuAU6qlyEnwbgwoSoOKwTqHnqeVtqqllzFNqNabWPubvSPOzH3oSGFUsp
         KwOr1O1nLSlKyxWITDGunt8gSczGRx4ZScJE3UyK7ntdAxBOqDCtzZq1tOVHIvM7IYPY
         vAj/8XRdft3kLeC8626GomJSb/yy4LZjyB483l1+a9stYqe6NK5Kvvx0ExwA2y7LgJDD
         vYPexKdaI+pSAtrvXH5EQ/TlNg5QUZCMr6YL5S5dsWe2QwBk38B3GXhNCT51lwU6QRcb
         DGZA==
X-Gm-Message-State: AOJu0YzkyEO1iFkDZZGSCiTP98YVKQaYnZ3S6dCEm5rOPoDHcXowe3h4
	a0n+gGosmPPKT6/g+eoGNafbgJZejqAfJPH3Yy0NbkM8OYOFImyDwsPu1T531YIXe07EsOuWxnm
	hJpsIQE/CXkj8JFTZbdHi5vxE07g=
X-Google-Smtp-Source: AGHT+IEHlv6d+Gv3+Y8huyO8YjOuqGwSgxWlwPvngeErDJZasCsVWgFJ4Oo4tjt0XBOhsqZ10M3tdP7WyVgSXKt/cF8=
X-Received: by 2002:a05:6871:b08:b0:24c:a8cd:c0fa with SMTP id
 586e51a60fabf-24ca8cdd2ddmr964882fac.21.1716572456389; Fri, 24 May 2024
 10:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240524115920.2502043-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240524115920.2502043-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2024 10:40:30 -0700
Message-ID: <CAMKF1spKLdVFz-XS4NCOfhC14OVOrnhPb261jKy6DKXaTCZxxQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libcamera: update to 0.3.0
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110517

fails to patch, I have to evict the whole CI pipeline,
https://errors.yoctoproject.org/Errors/Details/772780/

On Fri, May 24, 2024 at 4:59=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Upgrade libcamera to version 0.3.0, gaining support for SoftISP.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../libcamera/{libcamera_0.2.0.bb =3D> libcamera_0.3.0.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb =
=3D> libcamera_0.3.0.bb} (97%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
> similarity index 97%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.=
bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
> index 45d6be31ec95..11dd2ba56910 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D " \
>          file://0001-ipu3-Use-posix-basename.patch \
>  "
>
> -SRCREV =3D "89227a428a82e724548399d35c98ea89566f9045"
> +SRCREV =3D "aee16c06913422a0ac84ee3217f87a9795e3c2d9"
>
>  PE =3D "1"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110513): https://lists.openembedded.org/g/openembedde=
d-devel/message/110513
> Mute This Topic: https://lists.openembedded.org/mt/106279998/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

