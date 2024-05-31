Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85C9C27C44
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 07:53:13 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.6388.1717141990424834096
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 31 May 2024 00:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9AjRixz;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b0d25b54eso2513721e87.3
        for <Openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 00:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717141988; x=1717746788; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRWtpOEM3HFT+gnhm1ldzTkuxMlPD4TLXTMgWyMQ+Io=;
        b=i9AjRixz8TmMY+dgKtGk9ftmS4c6baA5lCPBdkckPIOqOAzmnsTSL8yBYFSwMMLUfh
         oU4g5I5QoYyf0jNj3i3sOgGKFxpCoEH65YIRTeTripz1g4I7YyRQdoXgNqpAruIl9O0r
         jH00/4asAncgn8Ps3vwI68zlM/X4jgye3hZtfHnb40feFRVVt5j3jKqz9L2ANsMtSfAg
         OdimxcOZN8c1FzN+J72ZtP0zMpw1zYXn4ph0Lu7dm4VjNcqGD3+5sldpdEJfM5eFqqHr
         WTOpS3djXD/V0PIHqQOq1bu8WWUxhCdBvN7N0rbD3ozqxHyCQqn8VuaVEpzEmGu2g5Cd
         JY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717141988; x=1717746788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRWtpOEM3HFT+gnhm1ldzTkuxMlPD4TLXTMgWyMQ+Io=;
        b=qIUY37YVVmyR+WNV30ZGNQ8be1o1uKU+RLa3Tw1lUPR1ANoRllfYZZQPJfG3obsuN8
         K5CfPowJqiWZqNtre7erC2Mzi/N8yzaUNdhz2sgCo3VhiSdkpMmuTHl8o1+V2gGoHRqi
         iZisJOUZyJPagsfiEwBL99GQV42wvwIGJwR0MpbNf40uZUsP9PEBnwChWZU0EniSYLLX
         rBszTupvciFxRn37yWxw1uO3F/UKo1oeN/LTPkhJOsC+2L7SnOb9M3VR4MCU7hhpSj0F
         TwXAF/ndZos6P63NPevmXcmTgFs3xP/MuEO5M2tcaJkdnlQXqyvg5IOABhsZW4FiuGCR
         XQpw==
X-Gm-Message-State: AOJu0YyX+AricLxRtFYLwwyHJLe7n0v/fl0MhocO84iuyHjq10YNmPVg
	1CkTRqAU5YZT7kwSzT5zsqQ5Qa3ABENsFx2pGKb9ZlWga8NFWVs1oMdmol+CqWvp8NV5o08TRGl
	kaBr1GajBB02FL/8++4YDUkHAVd4=
X-Google-Smtp-Source: AGHT+IFfMeAGgUOSnGWD1d3qj1eryo5B86VGjCmRy8GmkKQFd8SNgEFSX6ooVrON4Kn0wCVi3d6TbPlq+BUEacCi5LY=
X-Received: by 2002:a05:6512:20c6:b0:521:92f6:3d34 with SMTP id
 2adb3069b0e04-52b8954e8f1mr791287e87.22.1717141988224; Fri, 31 May 2024
 00:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240531071903.3257195-1-bin.lan.cn@eng.windriver.com>
In-Reply-To: <20240531071903.3257195-1-bin.lan.cn@eng.windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 31 May 2024 09:52:44 +0200
Message-ID: <CA+chaQc=ffhbbNwfUP90tuF=F+dWk+L=ys1y73r8WBv8MaCc7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] opencl: fix virtual PROVIDES warnings
To: bin.lan.cn@eng.windriver.com
Cc: Openembedded-devel@lists.openembedded.org, 
	Bin Lan <bin.lan.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110651

You're changing the build time dependencies, the warning is about
runtime dependencies, so I don't think this is correct.

You probably have some bad RPROVIDES in different recipe or bbappend,
see bitbake-getvar.

On Fri, May 31, 2024 at 9:19=E2=80=AFAM Bin Lan via lists.openembedded.org
<bin.lan.cn=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Bin Lan <bin.lan.cn@windriver.com>
>
> oe-core has started to warn when virtual/ is used outside of
> the RPROVIDES (build) context.
>
> We tweak provides/depends to use virtual- instead to
> avoid the warning:
>
>   RPROVIDES is set to virtual/opencl-icd, the substring 'virtual/'
>   holds no meaning in this context. It is suggested to use the 'virtual-'
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 2 +-
>  meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb | 2 +-
>  meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb       | 2 +-
>  meta-oe/recipes-support/opencv/opencv_4.9.0.bb              | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recip=
es-core/opencl/ocl-icd_2.3.2.bb
> index d43ea281ae..bc1a645217 100644
> --- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> +++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> @@ -14,7 +14,7 @@ S =3D "${WORKDIR}/git"
>  inherit autotools
>
>  DEPENDS =3D "ruby-native"
> -PROVIDES =3D "virtual/opencl-icd"
> +PROVIDES =3D "virtual-opencl-icd"
>  RPROVIDES:${PN} =3D "virtual-opencl-icd"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
> index 146ec6e472..9901e47616 100644
> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
> @@ -8,7 +8,7 @@ inherit pkgconfig cmake
>
>  DEPENDS +=3D "opencl-headers"
>
> -PROVIDES =3D "virtual/opencl-icd"
> +PROVIDES =3D "virtual-opencl-icd"
>  RPROVIDES:${PN} =3D "virtual-opencl-icd"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta=
-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> index 6cacd3722c..3e9ea48993 100644
> --- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> +++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> @@ -13,7 +13,7 @@ SRCREV =3D "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
>
>  S =3D "${WORKDIR}/git"
>
> -DEPENDS +=3D "opencl-headers virtual/opencl-icd"
> +DEPENDS +=3D "opencl-headers virtual-opencl-icd"
>
>  do_install() {
>         oe_runmake install PREFIX=3D${D}${prefix} MANDIR=3D${D}${mandir}
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/rec=
ipes-support/opencv/opencv_4.9.0.bb
> index cf836d3ecf..2e72f12658 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
> @@ -109,7 +109,7 @@ PACKAGECONFIG[java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA=
_HOME}/include -DJAVA_INCLUDE_P
>  PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
>  PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
>  PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-ut=
ils,"
> -PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers virtual/opencl-icd,"
> +PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers virtual-opencl-icd,"
>  PACKAGECONFIG[openvino] =3D "-DWITH_OPENVINO=3DON,-DWITH_OPENVINO=3DOFF,=
openvino-inference-engine,openvino-inference-engine"
>  PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${ORACLE_JAVA_HOME=
}/include -DJAVA_INCLUDE_PATH2=3D${ORACLE_JAVA_HOME}/include/linux -DJAVA_A=
WT_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${ORACLE=
_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=3D${ORACLE_JAVA_HOME}/l=
ib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,=
"
>  PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110650): https://lists.openembedded.org/g/openembedde=
d-devel/message/110650
> Mute This Topic: https://lists.openembedded.org/mt/106403783/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

