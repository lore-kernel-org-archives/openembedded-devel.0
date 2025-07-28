Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055FFC83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:57:19 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.88244.1753725431657174762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 10:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EKP0Fj6K;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e8e24765e5bso294998276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 10:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753725431; x=1754330231; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP3leH0Ng0ImNJNHga2yPiLk9NBLHvXqiVjldMikgBw=;
        b=EKP0Fj6KvCHn+cIAyGKERJ2m9+zI4g/n7cUqmCmueBg7+yH37oC0nZKtA8Ongtdb7T
         m7/7b8eR8f3riQcYdtCxTTge5y6ggHUQBTt9u8QF+1TAdeCnMCwjP9vUnBDc1f9BtW0y
         J4+DGWtwaH7a5ZmudGjblWPjRDQviKXEDhRGxw+ZCIXQ1pc4NSOxmVZ/uiRVDp1kWDp3
         dx5uAH6vCzTyNZXq5sbLJLxSxZ6E3dDDSo0dG1xMXR5kOUN0u5UO0JPNArou0ZHCMEBX
         hPXtxdy0mnWHyOB1rRXM3f9Xsh2NqALDngxubpx8cB8g+3ztsyF2SzzsVVa3MLsstJDr
         zAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725431; x=1754330231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fP3leH0Ng0ImNJNHga2yPiLk9NBLHvXqiVjldMikgBw=;
        b=r6s2ECPdZt4Bb/V/Xiw2nNBakv6NGr9F2QbF7U7vRiGB/w7qxg3GiNok440sAcMeeR
         YqrpyETrkfYutLBekTYqLNJZ7nBOEGBk7m85o2KbjFP9seagYpdArvYM6oc81HyQ44zz
         wXTF25IGL1ozObcuvy8GdOspw2LA+tr51kyBWgWn6Glwz8HwQXB3ORReY8KQxj/bytkH
         josGTDPRQcW31WiOLvk0yyp7Q3Wix2nOITAhhKEuiL6RVhEP5l+8JguTooa2hxcxMDbz
         PcOKMXw0wjs5aTNPXDz2AILSOKNb6Q6Hu6VKmCGWWEKLG2YxrIHCd8xgBg6zfilHs8uH
         2O2Q==
X-Gm-Message-State: AOJu0YwRI1HyTi7afjeThpQI6qdhzIUauplEkvhoY1uVyYf2peqEyC5R
	4s7RX6KttKSvMou1ev2HxkpB9yLRpM48rf6ENfYxys2wPEVy4c0OdkVxyvUKYzRlqpvTlsqb6fl
	S8ZPkeGQ6rNzhiDjLoU/e3odrMY0m/EU=
X-Gm-Gg: ASbGncvugb+jPwNKWYn1P0ec2PwlwSuvLKk+oU4dMjMMcip5EUjcIT9GZhgNOnZqx7Z
	RB0YRVYwHqQfSlAoCCeUFLR+spVbuv1VLTiH1ZKfvI2q8hnLs+D/+ER4FTi/idmVfLPwerGgqVg
	Evc+jy+t6IgQdLnp3CccNQGlJESmeFutGsL031RP/MLas87xgM88k6qq/hU/hsx/v7+SzxrCVmY
	8A/nswgL6MfswLZ0YWIsmz4oATSvsQ6ly4=
X-Google-Smtp-Source: AGHT+IEUdR+99UEvjwx5fX4tW9Y3Nr9+PPbUtWvsFTxoBbQQA45erJoatlTMNxLc4bBteFTot80YsINVGDnsRjmawpM=
X-Received: by 2002:a05:6902:984:b0:e8b:8543:b006 with SMTP id
 3f1490d57ef6-e8df138a4admr12054054276.35.1753725430659; Mon, 28 Jul 2025
 10:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250728094518.1636494-1-kraghava@qti.qualcomm.com>
In-Reply-To: <20250728094518.1636494-1-kraghava@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 10:56:44 -0700
X-Gm-Features: Ac12FXxHj2PsZ0SJ9Csh1p0jMO33BGRoo8JhRcwoq-CoLnVpp5Q_Ux7Qc-8iavA
Message-ID: <CAMKF1soCZNdOCSSW6y1=b0AUd5zV6sKT8=GwiGXpZZP5aSi2OA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: install test and sample binaries
 under bin/opencv
To: kraghava@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 17:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118749

On Mon, Jul 28, 2025 at 2:45=E2=80=AFAM Keerthivasan Raghavan via
lists.openembedded.org
<kraghava=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> The test and sample binaries were not getting installed.
> Install them under "<prefix>/bin/opencv". Installing
> binaries under "<prefix>/bin/opencv" avoids conflict with
> /usr/bin/shape file contributed to rootfs by mesa-demos
> package.
>
> Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.12.0.bb
> index d8295912fa..4118e96fc5 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> @@ -75,6 +75,7 @@ EXTRA_OECMAKE =3D "-DOPENCV_EXTRA_MODULES_PATH=3D${S}/c=
ontrib/modules \
>      -DOPENCV_GENERATE_PKGCONFIG=3DON \
>      -DOPENCV_DOWNLOAD_PATH=3D${OPENCV_DLDIR} \
>      -DOPENCV_ALLOW_DOWNLOADS=3DOFF \
> +    -DOPENCV_BIN_INSTALL_PATH=3Dbin/opencv \

This will install all binaries ( not only test bins ) into the new
directory isn't it. ? I wonder if it's better to just rename the
conflicting binary


>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DCPU_DISPATCH=3DS=
SE,SSE2,SSE3,SSSE3", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DCPU_DISPATCH=
=3DSSE,SSE2,SSE3,SSSE3,SSE41", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DCPU_DISPATCH=
=3DSSE,SSE2,SSE3,SSSE3,SSE41,SSE42", "", d)} \
> @@ -113,9 +114,9 @@ PACKAGECONFIG[openvino] =3D "-DWITH_OPENVINO=3DON,-DW=
ITH_OPENVINO=3DOFF,openvino-infer
>  PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${ORACLE_JAVA_HOME=
}/include -DJAVA_INCLUDE_PATH2=3D${ORACLE_JAVA_HOME}/include/linux -DJAVA_A=
WT_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${ORACLE=
_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=3D${ORACLE_JAVA_HOME}/l=
ib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,=
"
>  PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
>  PACKAGECONFIG[python3] =3D "-DPYTHON3_INCLUDE_PATH=3D${STAGING_INCDIR}/$=
{PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_LIB=
DIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
> -PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMP=
LES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
> +PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_BIN_EXAMPLES=
=3DON -DINSTALL_PYTHON_EXAMPLES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
>  PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"
> -PACKAGECONFIG[tests] =3D "-DBUILD_TESTS=3DON,-DBUILD_TESTS=3DOFF,,"
> +PACKAGECONFIG[tests] =3D "-DBUILD_TESTS=3DON -DINSTALL_TESTS=3DON,-DBUIL=
D_TESTS=3DOFF,,"
>  PACKAGECONFIG[text] =3D "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3D=
OFF,tesseract,"
>  PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
>  PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118745): https://lists.openembedded.org/g/openembedde=
d-devel/message/118745
> Mute This Topic: https://lists.openembedded.org/mt/114410691/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

