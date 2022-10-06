Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1569AC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 18:30:40 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.1152.1665081031004636602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 11:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jr8Z1//t;
 spf=pass (domain: gmail.com, ip: 209.85.167.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id w127so2978156oiw.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N2d5ZI6U3v1QUeo+Zyw5FXXO2P68UxjxqH/IKlCbyFY=;
        b=jr8Z1//tautB9rifmoE4QCoV0O1VL7QnLw9KvPiShMi65/oLW3I9hHHYtaEXJ2MEWI
         65HBahaZg8N9aR9e3ngBNvYdXXchOqSfEsug4R4WGVczeApd6uFXvdzD0tv2TNuSd33h
         oAk/XrM4O5oYkRf1/jHzRZuAnHLlvqdlhwMGHvNbTPf3U71cgQsRHiz2SM8j40S2UQ7v
         PaELsw7Q+jYeDgrTQCEsq3iQPvjUqBex5BeWsKtK5KxIqUpmFNNdeXcMklYMkwEIDAel
         xSXl4Hb/+xp0VxoHDqqKZWC2M/iZgW1M4dGFCPxsW/C7ZfiQBCHk6ajTyYr7EuEGOHhc
         R34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2d5ZI6U3v1QUeo+Zyw5FXXO2P68UxjxqH/IKlCbyFY=;
        b=SAwrDEyXE2bELQcivjvN+phVDd7I1ljrgbUUdYSUx6qPTm7VM3aPvFAOkOLXmWeoXo
         t7D5geQEm73bog92L7GiDSyplSHXh3KdIqWZmIxBbn5q5cqDikOf6DWlYW05QzA7Op3G
         ZmeTR7lHC8bEHzU/wQthQEIruffioHV4Aj/vxUOg2CFa5BUzgstOmbuCZRwPjrcXclIi
         tw4lg6WtzYGgWIz924PztQ+uw5OO+3TDuNAcA/olGOaI/DxGT67Ukdh2EdlAZ03R/56t
         mrZL2zEU/SUO9BNTCvHOpehUGnB4qAD6n1Mai9moKa59xyO8xgeWUCPYubbOMKWMw7eA
         fDNA==
X-Gm-Message-State: ACrzQf3LLmgJog9ttr92ykdhZdUF4aCQjA8azxUpgDdmZZvtjN6NwF4Q
	aO3+E8+TYa2/8G8TrATGUBOIsoubv1HQ8KSidQE=
X-Google-Smtp-Source: 
 AMsMyM6gJuwRU2MIy59M3HpZGiYSSwYgULR84yTD8XvwnG+bcJyUBlgMNUK6QkJfyZVGm2J6XEmmhA/opJwRtGGCqCk=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr5389876oib.262.1665081030150; Thu, 06
 Oct 2022 11:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221006084048.154710-1-anuj.mittal@intel.com>
In-Reply-To: <20221006084048.154710-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Oct 2022 11:30:04 -0700
Message-ID: 
 <CAMKF1soTFvufyWGUZ6T4-c3tPMKTHzgnbeXyg1PP0aOgLSdcqQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] opencv: fix reproducibility issues
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 18:30:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99082

btw. I do see a QA warning, perhaps its not related to your change but
I thought it would be good to check

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2082/steps/14/logs/warnings

On Thu, Oct 6, 2022 at 1:40 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Download and unpack contrib modules and other repositories in S instead
> of WORKDIR so they don't escape file-prefix-map substitutions.
>
> Fixes a number of reproducibility problems because of OpenCV check
> macros that were embedding path to files in contrib/.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../recipes-support/opencv/opencv_4.6.0.bb    | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> index f6c10054c..da1e659a4 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> @@ -39,12 +39,12 @@ IPP_MD5 = "${@ipp_md5sum(d)}"
>
>  SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
>  SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol=https \
> -           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib;branch=master;protocol=https \
> -           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=ipp;name=ipp;protocol=https \
> -           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc;protocol=https \
> -           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg;protocol=https \
> -           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face;protocol=https \
> -           git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=wechat_qrcode;name=wechat-qrcode;protocol=https \
> +           git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=master;protocol=https \
> +           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=git/ipp;name=ipp;protocol=https \
> +           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=git/boostdesc;name=boostdesc;protocol=https \
> +           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
> +           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
> +           git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=git/wechat_qrcode;name=wechat-qrcode;protocol=https \
>             file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
>             file://0003-To-fix-errors-as-following.patch \
>             file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
> @@ -52,7 +52,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
>             file://download.patch \
>             file://0001-Make-ts-module-external.patch \
>             "
> -SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
> +SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
>
>  S = "${WORKDIR}/git"
>
> @@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
>  OPENCV_DLDIR = "${WORKDIR}/downloads"
>
>  do_unpack_extra() {
> -    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
> +    tar xzf ${S}/ipp/ippicv/${IPP_FILENAME} -C ${S}
>
>      md5() {
>          # Return the MD5 of $1
> @@ -76,22 +76,22 @@ do_unpack_extra() {
>              test -e $DEST || ln -s $F $DEST
>          done
>      }
> -    cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
> -    cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
> -    cache data ${WORKDIR}/face/*.dat
> -    cache wechat_qrcode ${WORKDIR}/wechat_qrcode/*.caffemodel
> -    cache wechat_qrcode ${WORKDIR}/wechat_qrcode/*.prototxt
> +    cache xfeatures2d/boostdesc ${S}/boostdesc/*.i
> +    cache xfeatures2d/vgg ${S}/vgg/*.i
> +    cache data ${S}/face/*.dat
> +    cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
> +    cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
>  }
>  addtask unpack_extra after do_unpack before do_patch
>
>  CMAKE_VERBOSE = "VERBOSE=1"
>
> -EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
> +EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
>      -DWITH_1394=OFF \
>      -DENABLE_PRECOMPILED_HEADERS=OFF \
>      -DCMAKE_SKIP_RPATH=ON \
>      -DOPENCV_ICV_HASH=${IPP_MD5} \
> -    -DIPPROOT=${WORKDIR}/ippicv_lnx \
> +    -DIPPROOT=${S}/ippicv_lnx \
>      -DOPENCV_GENERATE_PKGCONFIG=ON \
>      -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
>      -DOPENCV_ALLOW_DOWNLOADS=OFF \
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99078): https://lists.openembedded.org/g/openembedded-devel/message/99078
> Mute This Topic: https://lists.openembedded.org/mt/94153787/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

