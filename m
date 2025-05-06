Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80918C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:57:15 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.76434.1746539833570070674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 06:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G+yC30fh;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f6aa4b3a7fso1399698b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746539833; x=1747144633; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKa/0m7tpITQefWNiWRKsvNjCg1qGAZZIkrNEOKSxWE=;
        b=G+yC30fhaTNvQXk4wN44m3QnwM0/6ipK8LZownr7X+4UGJBX9hWNhw9hn9TgPuqV3X
         k3W2TlgkWb6g9PJcrq2WyqlzFaSFPOOEVq/t3OE7lWdC6/NUBNF9mNWYIfPB1FhFazZU
         zbT2FZc8WfU+O72xvxk9NAYSq4GLo/XOxlUflcXhlkGZ6/l0s6vQc5VXeWK0imKSkchU
         CrSrYhhA0zL1HpjyaVqEe+Mi3iI7LihMGuKyAJGFjcX+yiv9j98G1eqpWbcLpQQEfodg
         3SeUUfoh9k6AJItd4CON7ow2+MY6ZkcbAOEh1tPjqptBVeT4L7By2lgNf9t7TmfHiqPj
         VjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539833; x=1747144633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKa/0m7tpITQefWNiWRKsvNjCg1qGAZZIkrNEOKSxWE=;
        b=POcla25TXgYl5YH7KzoOGnDHRoqIdUNYGQoGus3g5spFlqBOCwLs7ubYNz7hztKoaC
         c8OpHwu43TQ7UGdyNVYQdYlYqxvAzZI7c6HGYat8xjYf0eiEiKIDPBWaOpvUtleGtLoR
         QrchaC6tQVKS7Hn1PQULTr0IIeVs8dHbKoc54oZuUR9WbpR8+nv2F6wXd+bvNcTDKvYY
         AzJ9dUyqVWL7fvQYBP3XcoESNdXzhXQbAo8YDM6i8+pLS8YIh7eBC+tJfsJtA0CG8eSb
         NwOKuwegdQT3ovv+gWrNneYSIRLr0cNXudVgvtteEwTvFnCBpJxcVNnaR+fi4bCsFc4C
         nSgw==
X-Gm-Message-State: AOJu0Yx61sMxadwHAVn0+vqRXoe8CYgRXU9LcAuIuvjjJBnmNS9KonYx
	dQSZmEUPxtpW4S4NZrzH4WAWdbNm/TZtB2Gos9ka4/hl2LJTDrXiIVMhdmjF6ZHEJV0UsoLQ6DW
	DH7vBCIK+xaE+ZUc43RBeDxg8lbw=
X-Gm-Gg: ASbGncs9kfW6n/KLDoHpYwODR7qhM3118Rk6shctPXDnN4ZFPzFe5x8oRPueqqLVyPo
	JuxFFgHwCN/fPZ2uflSIbhPmdsTS0m9rvxJu7/v+SpyGeB7WST0a5D4nyj93vn/6H9NifMhFF7Z
	7vJXYhV2soy0dGIaW53IMeKAxnMf75G57Znftn
X-Google-Smtp-Source: AGHT+IEjx/k+ppdRwSSJR4api9H8H5SJOjPEZX8lsHfB9ic5VV4mzGD6DBt7jZ3dfc7gRmNXGnDSEHtZnBlgi+JYXo0=
X-Received: by 2002:a05:6808:1913:b0:3f4:1c2:874a with SMTP id
 5614622812f47-4036987acd0mr1470662b6e.24.1746539832657; Tue, 06 May 2025
 06:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250506065344.146577-1-ptak@qti.qualcomm.com>
In-Reply-To: <20250506065344.146577-1-ptak@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 06:56:45 -0700
X-Gm-Features: ATxdqUE02X955ZHnG2ccc6e2vGqOMui_Y5_x-tyCfxZ8WjWpOmEtZ9jIwMrzF8w
Message-ID: <CAMKF1sooAMHZBjtTGWpUWLe_f6WvcN23jij=HSc7C2FG-ro5uA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] opencv: Added fix for Cluster
 Euclidean and Box Filter
To: ptak@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org, quic_ptak@quicinc.com, 
	quic_sssanjee@quicinc.com, vkaruchu@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 13:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117352

On Tue, May 6, 2025 at 5:57=E2=80=AFAM Pulkit Singh Tak via
lists.openembedded.org <ptak=3Dqti.qualcomm.com@lists.openembedded.org>
wrote:
>
> From: Pulkit Singh Tak <quic_ptak@quicinc.com>
>
> Updated FastCV libs hash to include fix for Cluster Euclidean and Box Fil=
ter
> and support for FastCV SVD API
>
> Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> ---
>  ...MLIST-FastCV-latest-libs-hash-update.patch | 50 +++++++++++++++++++
>  .../recipes-support/opencv/opencv_4.11.0.bb   |  5 +-
>  2 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-F=
astCV-latest-libs-hash-update.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-l=
atest-libs-hash-update.patch b/meta-oe/recipes-support/opencv/opencv/0001-F=
ROMLIST-FastCV-latest-libs-hash-update.patch
> new file mode 100644
> index 0000000000..2f969e1ede
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-l=
ibs-hash-update.patch
> @@ -0,0 +1,50 @@
> +From ba6eb8d95292f4631a3b8de09bfaa59e43c17226 Mon Sep 17 00:00:00 2001
> +From: adsha-quic <quic_adsha@quicinc.com>
> +Date: Wed, 16 Apr 2025 18:54:40 +0530
> +Subject: [PATCH] FROMLIST: Merge pull request #27214 from CodeLinaro:fas=
tcv_lib_hash_update
> +
> +Signed-off-by: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
> +Upstream-Status: Submitted [https://github.com/opencv/opencv_3rdparty/pu=
ll/94]
> +
> +---
> + 3rdparty/fastcv/fastcv.cmake | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
> +index 5c81c11300..6fee4ce4ce 100644
> +--- a/3rdparty/fastcv/fastcv.cmake
> ++++ b/3rdparty/fastcv/fastcv.cmake
> +@@ -1,23 +1,23 @@
> + function(download_fastcv root_dir)
> +
> +   # Commit SHA in the opencv_3rdparty repo
> +-  set(FASTCV_COMMIT "f4413cc2ab7233fdfc383a4cded402c072677fb0")
> ++  set(FASTCV_COMMIT "8d86e68dad8b80b8575a8d3cf401d3ee96c24148")
> +
> +   # Define actual FastCV versions
> +   if(ANDROID)
> +     if(AARCH64)
> +       message(STATUS "Download FastCV for Android aarch64")
> +-      set(FCV_PACKAGE_NAME  "fastcv_android_aarch64_2024_12_11.tgz")
> +-      set(FCV_PACKAGE_HASH  "9dac41e86597305f846212dae31a4a88")
> ++      set(FCV_PACKAGE_NAME  "fastcv_android_aarch64_2025_04_08.tgz")
> ++      set(FCV_PACKAGE_HASH  "e028966a1d1b2f3f0bc5967d316e8b64")
> +     else()
> +       message(STATUS "Download FastCV for Android armv7")
> +-      set(FCV_PACKAGE_NAME  "fastcv_android_arm32_2024_12_11.tgz")
> +-      set(FCV_PACKAGE_HASH  "fe2d30334180b17e3031eee92aac43b6")
> ++      set(FCV_PACKAGE_NAME  "fastcv_android_arm32_2025_04_08.tgz")
> ++      set(FCV_PACKAGE_HASH  "6fc1e812a4b3ef392469d2283e037ffe")
> +     endif()
> +   elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)
> +     if(AARCH64)
> +-      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_02_12.tgz")
> +-      set(FCV_PACKAGE_HASH  "33ac2a59cf3e7d6402eee2e010de1202")
> ++      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_04_08.tgz")
> ++      set(FCV_PACKAGE_HASH  "062a26639cd2788beee2e0dd8743d680")
> +     else()
> +       message("FastCV: fastcv lib for 32-bit Linux is not supported for=
 now!")
> +     endif()
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
> index 61dc681a39..8a5821e2f1 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -16,7 +16,7 @@ SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e=
7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
>  SRCREV_wechat-qrcode =3D "a8b69ccc738421293254aec5ddb38bd523503252"
> -SRCREV_fastcv =3D "f4413cc2ab7233fdfc383a4cded402c072677fb0"
> +SRCREV_fastcv =3D "8d86e68dad8b80b8575a8d3cf401d3ee96c24148"
>
>
>  SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg_fastcv"
> @@ -26,7 +26,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3D4.x;protocol=3Dht
>             git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_=
xfeatures2d_vgg_20160317;destsuffix=3Dgit/vgg;name=3Dvgg;protocol=3Dhttps \
>             git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_=
face_alignment_20170818;destsuffix=3Dgit/face;name=3Dface;protocol=3Dhttps =
\
>             git://github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat=
_qrcode;destsuffix=3Dgit/wechat_qrcode;name=3Dwechat-qrcode;protocol=3Dhttp=
s \
> -           git://github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4=
.x_20250212;destsuffix=3Dgit/fastcv;name=3Dfastcv;protocol=3Dhttps \
> +           git://github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4=
.x_20250410;destsuffix=3Dgit/fastcv;name=3Dfastcv;protocol=3Dhttps  \
>             file://0003-To-fix-errors-as-following.patch \
>             file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-fun=
cti.patch \
>             file://0001-Dont-use-isystem.patch \
> @@ -35,6 +35,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3D4.x;protocol=3Dht
>             file://0008-Do-not-embed-build-directory-in-binaries.patch \
>             file://0001-core-fixed-VSX-intrinsics-implementation.patch \
>             file://0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-L=
inux.patch \
> +           file://0001-FROMLIST-FastCV-latest-libs-hash-update.patch \ \

double backslash here.  How was this tested ?

>             "
>  SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.=
patch;patchdir=3Dcontrib"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117350): https://lists.openembedded.org/g/openembedde=
d-devel/message/117350
> Mute This Topic: https://lists.openembedded.org/mt/112645186/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

