Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89412C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 20:06:49 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.1373.1646856408507339567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JlKohYQe;
 spf=pass (domain: gmail.com, ip: 209.85.128.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso35602807b3.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yYPqre7hL1UFHZVU9HyD2x89AXcoHMNITJP7hdVYebA=;
        b=JlKohYQeEoGfhuuewLJx8Z5JxSegBqdP9XQLoNeWGgQ+olYvtvs2k3Aogx8ERUqniJ
         IJtMSYh6PSs/pXh7mquc2P1/REddeYU7/sjU1OVqbbOFtPxXtOtf82VoQTQzZ+AzKpkm
         epFUQwxl/7ddoPb+akxcX5qftzYvP6bQfHXT4St1SubGZpTeXReKmT+//LosKc3bvq6W
         miC4fNPJWHevNyGK1JXUlyitBLaCgfyIcDdYDMuZ/Wl5oiRSKr3HcI035Xf+6OCWMpxh
         hbPu+gHBVsvm5wDH4B2vFs4jNB7Cz3kEFnKRcIBrEAxxJY8mBBCLb8aScPtSTWCLZom3
         oXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yYPqre7hL1UFHZVU9HyD2x89AXcoHMNITJP7hdVYebA=;
        b=lvMeamNvx0dcvjVK9DM8l2Y1QiZncshkYuGbfw1x1vHu6Dp+n564gElNrvlLTU++2W
         7tvIPeqeF3lniwLZrNxY8x7gSRrjw4yG0kiy5gruQGM14XQ4V0EDT8NgGcQHUZalYRpD
         eD1YzD9OzAA6/hgoDmXgLkWsuJi3dyANveEdMzAONDleTglte29S1rGWZ1CARnTJ/hLs
         YSOuLzf6KDeIa8M+J3TxBgm7sMJLzLOUBfhihV9evsBX5O0dntOQgNSEvE9E7xQ9bTG/
         S/5J4lzydSZbLJazqWahI5QQmh7qy2Fu/6sl6qpZKTS21HiYj5IeTPqZ0a64PlEl03V0
         EQnQ==
X-Gm-Message-State: AOAM530gQLHUEilsNmVribFUCGygJorh2bM3YN1LMFvm1a8Xq4jzfu/T
	dAtFEGXChuhrYKyquLTyKTk9jDM/2Vll2PJguOsorN0s9r8=
X-Google-Smtp-Source: 
 ABdhPJx5Cdtk7P8HE7FVkVEvAP7uyHQ2tuBOguwFQ8MgZNJ/2DhWjMkDiH/csRiaU4HkCZGtB5XVvTUKJ39hEjgj42U=
X-Received: by 2002:a81:1512:0:b0:2dc:75df:f3a2 with SMTP id
 18-20020a811512000000b002dc75dff3a2mr1231789ywv.139.1646856407479; Wed, 09
 Mar 2022 12:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20220309194127.725972-1-jpuhlman@mvista.com>
In-Reply-To: <20220309194127.725972-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 12:06:21 -0800
Message-ID: 
 <CAMKF1sohSPqiXO=19AF0GxVHuise2RrPC1+hu-55ORd+LJAzcg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nspr-native: build correclty with extended
 buildtools.
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 20:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95913

Thanks Jeremy

I wonder why we don't see it failing on AB or in my local testing. is
it specific to some build host distro ?

On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
>
> The linker is not correctly pulling in lrt as needed.
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> index f224bcd34..2717f37bc 100644
> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  # preferred path upstream.
>  EXTRA_OECONF += "--includedir=${includedir}/nspr"
>
> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
> +
>  do_compile:prepend() {
>         oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
>  }
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95912): https://lists.openembedded.org/g/openembedded-devel/message/95912
> Mute This Topic: https://lists.openembedded.org/mt/89670512/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

