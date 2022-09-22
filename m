Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA3EC32771
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 01:54:23 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web08.2531.1663811655034348081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 18:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4WoFMKD;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id
 102-20020a9d0bef000000b0065a08449ab3so5262488oth.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 18:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BhMSY35ZQIYiBfusATQAFHGsDlx55nyIP6r5q9QAkEU=;
        b=R4WoFMKDFpMLg4XptuacyInKGardwALEFdnjmef8E6K5RrxWL7JJ5M2lZAqZTq1bjD
         CvRgUybB+1lJs+ifgTO+1Bqsn2flBwoddxXsbrQwuOsoogPVNbrTdz3mj4/Md8gp54Ue
         XFJNgdvix0U3eO3Z7+qPmxVcAth9oX0EJEqxXQb23But+ir2K7SmPoOjKOAXEGX10vPz
         ByUfavp4Tuw3aCr0FK7EWRCke/yiTD3l5fT3FPA1gcdGfMVctVF48e0YzREziVuEoBol
         QzMYA6rlcPMqTF1TwMNBbQmv2hBl0eatOyiiBc+D1HdSb1uiX1NAc13Qh00VZWLNaKq7
         /0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BhMSY35ZQIYiBfusATQAFHGsDlx55nyIP6r5q9QAkEU=;
        b=KL+biwp9gM4Wnndc/QESdSuQGyPdPwKfhhn9Vk6MbBPbviUOCRlCX8y3zWBXBFBG9h
         zQkErLQdLOmPkQvpu8F+/MNkSoGM7fO6LAWg/Vz2t0PdbkCyW6NYhJgzus7iBjbolmRG
         q+ynoI1/EmPz8Uz3Gc33k1uADI1Fy2x/dk1RresXtghv/KhhiCGKUs8xAf/ssy7koqf5
         xWDaKiyyw3dIq1JsJnXN8c9T6obqBb5fHo/+rjxOQiaH27sRzgNu87i+AxuTQCOqOLLr
         ylgekK+IDm1XPnt5fTwq77VKUkiIa1qjKF9IR4waP//lkBFWK4sPkyRnieaWGPYhfpLa
         Wa4Q==
X-Gm-Message-State: ACrzQf1iB7kd/97AyJluKUYeDy5G7b8t+ppAVO2k1flFxORuWQGHhFgL
	qp15DdO3pFGn9AZ2kQrIRaMb/SuMBHIYE+pzxOs=
X-Google-Smtp-Source: 
 AMsMyM7AuC+hCMK4UQ3r2s/9XAHtSXWdV8YaSeAisLYd837GAklGTq37NNzWieTEjyX+FcGI+ePN+Z5gC8DzBtg6S98=
X-Received: by 2002:a05:6830:3901:b0:658:fff4:51b8 with SMTP id
 br1-20020a056830390100b00658fff451b8mr519893otb.55.1663811654223; Wed, 21 Sep
 2022 18:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1663640525-27494-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1663640525-27494-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Sep 2022 21:53:48 -0400
Message-ID: 
 <CAMKF1srJcPNzvmVe1Mq4-e_mCt_671h8PCgcLzpE6W3zjN=2dg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.48.1
 -> 1.49.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 01:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98918

On Mon, Sep 19, 2022 at 10:22 PM wangmy <wangmy@fujitsu.com> wrote:
>
> 0001-protobuf-Disable-musttail-attribute-on-mips.patch
> refreshed for new version.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...f-Disable-musttail-attribute-on-mips.patch | 19 ++++++++++---------
>  ...48.1.bb => python3-grpcio-tools_1.49.0.bb} |  2 +-
>  2 files changed, 11 insertions(+), 10 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.48.1.bb => python3-grpcio-tools_1.49.0.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
> index d19d1eee4c..5e8184b636 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
> @@ -7,24 +7,25 @@ See https://github.com/llvm/llvm-project/issues/57795
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>  ---
>   third_party/protobuf/src/google/protobuf/port_def.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
> -index 37632cf..3c3c1e4 100644
> +index e4b0753..4f603e6 100644
>  --- a/third_party/protobuf/src/google/protobuf/port_def.inc
>  +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
> -@@ -230,7 +230,8 @@
> - #error PROTOBUF_TAILCALL was previously defined
> - #endif
> - #if __has_cpp_attribute(clang::musttail) && \
> --  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__)
> -+  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__) && \
> -+  !defined(__mips__)
> +@@ -257,7 +257,8 @@
> + #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
> +     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
> +-    !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
> ++    !(defined(__NDK_MAJOR__) && !defined(__mips__) && \

this rebase has gone wrong here. I have fixed it this time, but it
would be nice if you could
test relevant builds e.g. mips build here with clang compiler to
ensure that rebase has been done right.

> ++     __NDK_MAJOR <= 24)
>   #  ifndef PROTO2_OPENSOURCE
>   // Compilation fails on ARM32: b/195943306
>   // Compilation fails on powerpc64le: b/187985113
>  --
> -2.37.3
> +2.25.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
> rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
> index 002211a8c1..d2b599ae7a 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
> @@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
>  SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
>              file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
>              "
> -SRC_URI[sha256sum] = "1178f2ea531f80cc2027ec64728df6ffc8e98cf1df61652a496eafd612127183"
> +SRC_URI[sha256sum] = "16ac93ac515194f63febcf6f8a96a7f17390268972acc15e765d257f5008f2af"
>
>  RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98883): https://lists.openembedded.org/g/openembedded-devel/message/98883
> Mute This Topic: https://lists.openembedded.org/mt/93796046/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

