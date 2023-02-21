Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734FDC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 06:53:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.37091.1676962420926238766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 22:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RgI76vLd;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id ck15so14242312edb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 22:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r2AnKTWj2Jewrc73Ia6I+9V5a1ca3RyIl1LIHR3Eles=;
        b=RgI76vLdpsYWSo7CBeAaI2g2febr5s0u+bONv/R1024Ld8vk2C47ruXCmA+amEuiUu
         Ax5eJebe5mwMB+Q/fzIY8WGO5IMScnsAU1onKUIVj1RWVbb/7fWMM06T3lMUj/c0XvLA
         zEM/gzbQMxUwciuOV3wzMrIUD0Mitr4M4u60bioNK7Rk3AI8bZazZMS1NcU/jY0BAIQa
         1Oe5U92wv6R2DDZoyhiZL0eiIaLWXyg2L4vtr0eXR1tieOucbf/4S0VLxJcRB8U1TZ9F
         XEGU60XhgG0jeU17rE5fygkNjNhRuvhA0+Mtt59pf1n+8nltnwCXu6bZI7/JKcEv2CAQ
         nTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2AnKTWj2Jewrc73Ia6I+9V5a1ca3RyIl1LIHR3Eles=;
        b=bnn+SMvjNRsRdIJkZwJ2hqi0QRfoVtmj8q6EzW4JUoHd74nUtOhNHY96H3l8xYHbMS
         k3561LF1OwjjH3tPJMzS/ev4JBygGDrYpmQ0p0fjPiSAk9vsRpNiPU1hlvcpWVglyjM+
         8m3eF7BBzTOE5QwTUvrRK3k/fQKfpzySwyDwzxMGukigpiwjhUCSiBDxnNQSe/sfe8xF
         D+SkRKAH7BzdaHNtwgelLbsfsZdsMs8p7E5NQOwgX0y3jMYug59TpAdJESsaWVoWAMZn
         JMYIY/rg+zErGVR6Cq/u7atJxzUtfJXfJxlEYOwGpOyJc0PVIuVTTU+DEiq/NUf9SqMj
         IrSg==
X-Gm-Message-State: AO0yUKU3h9j09SIlPgm0f4QfiLt/bNT646gMDT+UI3vX6G0ZWcQzGIwu
	bqagj38C4lNNA8jjq6aDREg=
X-Google-Smtp-Source: AK7set+q0GM2lR1N4yweNeBhptgu3SkSF247NeSDS+ITaGOMmw2EkCH2XyorxPEWIgCpX9Sc+OAydw==
X-Received: by 2002:a17:907:6eac:b0:878:58e6:f1eb with SMTP id sh44-20020a1709076eac00b0087858e6f1ebmr15414581ejc.23.1676962419063;
        Mon, 20 Feb 2023 22:53:39 -0800 (PST)
Received: from [192.168.1.143] ([188.36.69.43])
        by smtp.gmail.com with ESMTPSA id v18-20020a1709060b5200b008a9e585786dsm6771481ejg.64.2023.02.20.22.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 22:53:38 -0800 (PST)
Message-ID: <4fc43368-4a85-e989-2467-1f95bd5d3eaf@gmail.com>
Date: Tue, 21 Feb 2023 07:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-oe][PATCH] opencv: disable intel IPP
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230220090114.575687-1-mingli.yu@eng.windriver.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230220090114.575687-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 06:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101185

2023. 02. 20. 10:01 keltezéssel, Yu, Mingli írta:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The ipp related code has IP issue as below.

How is this different from any other license with regards
to source code ownership? Your right to license, build and
use the software is not infringed upon but obviously you
won't get ownership over it.

Also, IANAL but the ippEULA.txt in the top folder of the
branch contains the prior express  written permission,
even for patching it:

=========================================================
2.      LICENSE GRANT:

A.      Subject to all of the terms and conditions of this Agreement, Intel
Corporation ("Intel") grants to you a non-exclusive, non-assignable, copyright
license to use the Materials.

B.      Subject to all of the terms and conditions of this Agreement, Intel
grants to you a non-exclusive, non-assignable copyright license to modify the
Materials, or any portions thereof, that are (i) provided in Source Code form or
,(ii) are defined as Redistributables and are provided in text form.

C.      Subject to all of the terms and conditions of this Agreement and any
specific restrictions which may appear in the Redistributables text files, Intel
grants to you a non-exclusive, non-assignable, fully-paid copyright license to
distribute (except if you received the Materials under an Evaluation License as
specified below) the Redistributables, including any modifications pursuant to
Section 2.B, or any portions thereof, as part of the product or application you
developed using the Materials. If such application is a software development
library, then attribution, as specified in the product release notes of the
corresponding Materials, shall be displayed prominently in that application's
product documentation and on the application's product web site.
=========================================================

>
> =====================================================================
>   $ cat  tmp/work/corei7-64-wrs-linux/opencv/4.6.0-r0/git/ippicv_lnx/icv/include/ippicv.h | head -n 30
>   /*
>   // Copyright 2014-2019 Intel Corporation All Rights Reserved.
>   //
>   // The source code, information and material ("Material") contained herein is
>   // owned by Intel Corporation or its suppliers or licensors, and title
>   // to such Material remains with Intel Corporation or its suppliers or
>   // licensors. The Material contains proprietary information of Intel
>   // or its suppliers and licensors. The Material is protected by worldwide
>   // copyright laws and treaty provisions. No part of the Material may be used,
>   // copied, reproduced, modified, published, uploaded, posted, transmitted,
>   // distributed or disclosed in any way without Intel's prior express written
>   // permission. No license under any patent, copyright or other intellectual
>   // property rights in the Material is granted to or conferred upon you,
>   // either expressly, by implication, inducement, estoppel or otherwise.
>   // Any license under such intellectual property rights must be express and
>   // approved by Intel in writing.
>   //
>   // Unless otherwise agreed by Intel in writing,
>   // you may not remove or alter this notice or any other notice embedded in
>   // Materials by Intel or Intel's suppliers or licensors in any way.
>   //
>   */
>
>   #if !defined( __IPPICV_H__ )
>   #define __IPPICV_H__
>
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> =====================================================================
>
> So disable intel IPP [1] to avoid IP issue.
>
> [1] https://www.intel.com/content/www/us/en/developer/articles/troubleshooting/intel-integrated-performance-primitives-intel-ipp-open-source-computer-vision-library-opencv-faq.html
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../recipes-support/opencv/opencv_4.6.0.bb    | 25 +------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> index fcbafd78a..1e4c3545b 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> @@ -12,40 +12,19 @@ DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>   
>   SRCREV_opencv = "b0dc474160e389b9c9045da5db49d03ae17c6a6b"
>   SRCREV_contrib = "7b77c355a8fdc97667b3fa1e7a0d37e4973fc868"
> -SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
>   SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>   SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>   SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
>   SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
>   
> -def ipp_filename(d):
> -    import re
> -    arch = d.getVar('TARGET_ARCH')
> -    if re.match("i.86$", arch):
> -        return "ippicv_2020_lnx_ia32_20191018_general.tgz"
> -    else:
> -        return "ippicv_2020_lnx_intel64_20191018_general.tgz"
> -
> -def ipp_md5sum(d):
> -    import re
> -    arch = d.getVar('TARGET_ARCH')
> -    if re.match("i.86$", arch):
> -        return "ad189a940fb60eb71f291321322fe3e8"
> -    else:
> -        return "7421de0095c7a39162ae13a6098782f9"
> -
> -IPP_FILENAME = "${@ipp_filename(d)}"
> -IPP_MD5 = "${@ipp_md5sum(d)}"
>   
>   SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
>   SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol=https \
>              git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=master;protocol=https \
> -           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=git/ipp;name=ipp;protocol=https \
>              git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=git/boostdesc;name=boostdesc;protocol=https \
>              git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
>              git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
>              git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=git/wechat_qrcode;name=wechat-qrcode;protocol=https \
> -           file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
>              file://0003-To-fix-errors-as-following.patch \
>              file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
>              file://0001-Dont-use-isystem.patch \
> @@ -63,7 +42,6 @@ S = "${WORKDIR}/git"
>   OPENCV_DLDIR = "${WORKDIR}/downloads"
>   
>   do_unpack_extra() {
> -    tar xzf ${S}/ipp/ippicv/${IPP_FILENAME} -C ${S}
>   
>       md5() {
>           # Return the MD5 of $1
> @@ -92,8 +70,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
>       -DWITH_1394=OFF \
>       -DENABLE_PRECOMPILED_HEADERS=OFF \
>       -DCMAKE_SKIP_RPATH=ON \
> -    -DOPENCV_ICV_HASH=${IPP_MD5} \
> -    -DIPPROOT=${S}/ippicv_lnx \
> +    -DWITH_IPP=OFF \
>       -DOPENCV_GENERATE_PKGCONFIG=ON \
>       -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
>       -DOPENCV_ALLOW_DOWNLOADS=OFF \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101167): https://lists.openembedded.org/g/openembedded-devel/message/101167
> Mute This Topic: https://lists.openembedded.org/mt/97082778/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


