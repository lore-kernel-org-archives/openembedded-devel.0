Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7D1C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:49:37 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.51258.1738871374107404789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbOnqeKr;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2b806ee0fd1so602660fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 11:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738871373; x=1739476173; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU2oKS71gxDYC6WpVggIt+6Iztvdp3b8DAo4BcWE7uk=;
        b=fbOnqeKrG8IAcJSycr8PE4c5zx5DWOOITDkS1a3tGdFiTb/sbBym4O6U7cuJNTRAoj
         o23SQSxZJGJ/MRetpdaWL+NCa7cxPJBllmq8s6/Dip/BO+llmlwzLxz5wGPPccVaED9R
         isFWQ8YsirjxVDb+hSZGIaHfntG7MW55chhsGdS5yM9a/GnTY0AM50JwGsqdX1guIkoy
         67xncVoHsk/QrjkKHNnP0xXD222b3pwmsIjwrKD/nCZOXnQSlwURhpOEYYwSt0dsxFMz
         a4jWvCKou7hAfVg76zOmdU1nkPfMMFjOXUvYajz67qbs8zchb2bk8gYibEUrQevrWOan
         rJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871373; x=1739476173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU2oKS71gxDYC6WpVggIt+6Iztvdp3b8DAo4BcWE7uk=;
        b=fmyeD0bTTh52uQCkja++LbcHMTDQfFrrn3AlIUWlTBezU6DkX1jdyXiLOXZD35W4ar
         BvEQG9nH4/up3lLeC8/fWjgpjiths7sL5EtdEkbbkA5JQwaHJRq/sK4RUIYjMTDMvokD
         Ix1nHUpfMNC2iaS3kzYKHFuSqpzPe3q9FDLlzmPuQUvjNCvOErwS32dotKqPTrrazIhv
         zpUpYwGgoQleh05Yfy6cOQP4kAVKrPVzSKNO35599+xvHK++BDASzRDD2ryPCh9HhnL0
         q857PxTU76Hi4MO4nxWFkgUMN/xyCTLhOOZ8HhbuusyTQf9dvD7zwQ7i6nU2zfig6/lD
         /7tA==
X-Gm-Message-State: AOJu0Yz3+Ez44jNJ0tLd0s/7y9+SFSX6TGOodkjAqVIiBJUdKhs+gmPi
	IvpGKNfi6rVS4uYtKSfT5RzM33Ml8lFP9ABuDXWnxIOV2cVStoBDuz3Gttu1/dxj7ElAcQdd0o7
	xtU93TMavBl6UNHJHK7Wbc5OJgGo=
X-Gm-Gg: ASbGncs4EEfGVERTqgK4POsh5XKE4oKl/AbGGHTJY3/LLBcsS4DR36XC6l1l+9Oy6QY
	Tb42zrfJco0njs54Nx+lCxPx54gGlGU/wU1vCs8sXrPcUpgkzPV9313i69EXLb/6N3MosqZCU5I
	xV+3W8n3OTcc2p5VgkKoiBXk7UVQ==
X-Google-Smtp-Source: AGHT+IHOzuFqjnbIhm1oF69lYOck77BBlfcCkCTeULnwm3ejgrUqtMaIUHwC3LpkPngv3Jz+tutNYs6Wq7dOhCYs2oM=
X-Received: by 2002:a05:6871:888:b0:2b3:8b27:c352 with SMTP id
 586e51a60fabf-2b83ef8e912mr284038fac.33.1738871373286; Thu, 06 Feb 2025
 11:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20250206171933.1319042-1-quic_ptak@quicinc.com>
In-Reply-To: <20250206171933.1319042-1-quic_ptak@quicinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Feb 2025 11:49:06 -0800
X-Gm-Features: AWEUYZkD73MKzYlBdcLH-L1wf7b9bPbJouv6PsTxSXHGvsCJgQKnZ3iufDg35eA
Message-ID: <CAMKF1sqDfGnh5MTvn1QaXQgh=JynpEi94FZTn-g2X=Kx1ojo3A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] opencv: upgrade 4.10.0 -> 4.11.0
To: quic_ptak@quicinc.com
Cc: openembedded-devel@lists.openembedded.org, quic_sssanjee@quicinc.com, 
	quic_vkaruchu@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115302

On Thu, Feb 6, 2025 at 9:19=E2=80=AFAM Pulkit Singh Tak (Temp) (QUIC) via
lists.openembedded.org <quic_ptak=3Dquicinc.com@lists.openembedded.org>
wrote:
>
> Disable FASTCV HAL implementation
> Fastcv based Opencv HAL/Extensions are not supported on all platforms.
> By default Upstream OpenCV expects it to be disabled.
>

Thanks, although I have accepted v1, you can send an incremental patch
to add a comment on the bb file around the packageconfig option and
why
it is disabled by default.

> Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> ---
>  .../opencv/{opencv_4.10.0.bb =3D> opencv_4.11.0.bb}            | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/opencv/{opencv_4.10.0.bb =3D> opencv_4.11=
.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> rename to meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> index 5e54ab636f..6967f520e4 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
>  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>
> -SRCREV_opencv =3D "a7d942b681c5edd0cc27407d8e4d3dbf36c7a40e"
> -SRCREV_contrib =3D "1aab1f34815a58a5a63aee6d510fe234129754a2"
> +SRCREV_opencv =3D "31b0eeea0b44b370fd0712312df4214d4ae1b158"
> +SRCREV_contrib =3D "0e5254ebf54d2aed6e7eaf6660bf3b797cf50a02"
>  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
> @@ -120,6 +120,7 @@ PACKAGECONFIG[tests] =3D "-DBUILD_TESTS=3DON,-DBUILD_=
TESTS=3DOFF,,"
>  PACKAGECONFIG[text] =3D "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3D=
OFF,tesseract,"
>  PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
>  PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> +PACKAGECONFIG[fastcv] =3D "-DWITH_FASTCV=3DON,-DWITH_FASTCV=3DOFF,,"
>
>  inherit pkgconfig cmake setuptools3-base python3native
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115291): https://lists.openembedded.org/g/openembedde=
d-devel/message/115291
> Mute This Topic: https://lists.openembedded.org/mt/111036146/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

