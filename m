Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA552C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 03:55:54 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.28664.1658980544519353762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y0zm5FWV;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id mh14so637298qvb.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAjosvBoPF6tBz+7fF4UqPuOCeoBCs8h8LCpHhPEy0Y=;
        b=Y0zm5FWVv6dHmrd/iw2VF4NNcey6DfnrVM3t95lFW0QnP6aMtATJd15JyjVKbo6RnB
         NVn7ldyj5BsHxTIEfg/+E8dr0fkxiUjI06Obu4oOAt0zBdwYUYkOQ4BL7y3lwxOzlEca
         iJlmXiX7hnu2B1knDw/9YlY/w0ob7xCJNRJtlnVFfLL6OkaaJJPWOE/wCwX8mBs9ldvm
         sew+czcF9FbIvmkYoJr6OFoOanh3NUkBskrt6cw/ZZce6g8KyyuDEKF6bd2fwF2OljEJ
         eKGIEpfEKaQ0wUxjgMP3xx6Txa191O2nR0tobtnWH7Acr/I7xRJoqFYXG8sjKydxzs6i
         hHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAjosvBoPF6tBz+7fF4UqPuOCeoBCs8h8LCpHhPEy0Y=;
        b=vNr5tis5QMvHPs+R1BNL2llAj9PN8PG6XGE8DH0O+K4B1x1OwnEmpkMHbt6iO7L1nU
         NEfKt4vrJcjM/u1twDTyr8u6iBDmQGvBHq9lzdHNzKe27JfE8exQJrI8/wH358flSXL2
         QKrU3EZ000/e0OeipEoWFxFkiExMAPGPO5WBacX2uOjpo6MS0xcfyWEVx6gPFLzt63yi
         J20LZIXa2mRy2M9kU1gbvk/q84DJRZ+fV2ILuiwTy5z3/qaPoUp2NSxFMRMdbmnkWdfm
         mTH6v/DnTpXzMTdcoZsPmNvoSOxlxhUp5j5X2DPhvW8tNOgu1Go7x5PqsGy0vCn8r+Zy
         hTrg==
X-Gm-Message-State: AJIora+m/3FOKjZydja/Ghe6M24c9uX7i17orm6856WbSLuhmLwOMXeU
	Bqyb8GclQTfiQyFU0K6m9+s+WqNr2zb6SeiozxA=
X-Google-Smtp-Source: 
 AGRyM1vCPb2LplKOFWs42/5U69j0r1xvlZ+Tou25UfWH2ZbcwXJ/XZSHKcbNQvNy1nkIWjMBz+JVnDDuXcM3Nytf23Y=
X-Received: by 2002:a0c:8c4c:0:b0:473:11d7:6d3d with SMTP id
 o12-20020a0c8c4c000000b0047311d76d3dmr21529937qvb.110.1658980543277; Wed, 27
 Jul 2022 20:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
 <1658916605-9446-5-git-send-email-xuhuan.fnst@fujitsu.com>
In-Reply-To: <1658916605-9446-5-git-send-email-xuhuan.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jul 2022 23:55:17 -0400
Message-ID: 
 <CAMKF1sq+VJT-s8Bqa_Ea1p-UP1U-H5aWa15vVSZL3EeeQ2Z=xA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pyaudio: upgrade 0.2.11 ->
 0.2.12
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 03:55:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98029

This fails to build with musl see

https://errors.yoctoproject.org/Errors/Details/663060/

On Wed, Jul 27, 2022 at 6:10 AM xuhuan.fnst@fujitsu.com
<xuhuan.fnst@fujitsu.com> wrote:
>
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> License-Update: license check file changed to LICENSE.txt
>
> Changelog:
> ==========
> modernizing the Microsoft Windows build process
> the use paFramesPerBufferUnspecified as the default frames per buffer
> the patch that uses the system's preferred encoding
> the patches that skip unit tests that require audio hardware
> fixes and suggestions to the documentation
> fixes to the website documentation
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>  .../{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.12.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.12.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.12.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> rename to meta-python/recipes-devtools/python/python3-pyaudio_0.2.12.bb
> index 802ca35100..ae5fcae4ac 100644
> --- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.12.bb
> @@ -1,12 +1,11 @@
>  SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3152b432b96d6dc4a1cb35397da9ec"
>
>  PYPI_PACKAGE = "PyAudio"
>
> -SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
> -SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
> +SRC_URI[sha256sum] = "55ddf5db72bc537bba5f5dbca3ab9f0222ee5b842bda83978eab0b7b8f60fb9e"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98007): https://lists.openembedded.org/g/openembedded-devel/message/98007
> Mute This Topic: https://lists.openembedded.org/mt/92646107/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

