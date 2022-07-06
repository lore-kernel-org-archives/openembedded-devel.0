Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE033C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 04:08:30 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.2350.1657080503557826954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 21:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o+jYwbWP;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id ay10so16665413qtb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=erq8edeYqKHfR2a01fr/NOjNT6a7uDJ4dmqa31gPP2g=;
        b=o+jYwbWPzetPOXuxsAo5/Qbm5CLTr+1YtBPFUh0EfAPHIBbEpnSKDRZMGHXb8yaCww
         x6KSDhMi84GXeremlmQXUx+9jlhNWAlmNv8MMEwn/MMNlckJqvsE44pOF0pxLMADgRC/
         J2eiWps3L8tteah0LWa3uSAOeGFm4Ne5BCJkItPsWZkaWW14mZhJivcv3QV7pyG4SFaP
         lJYwwy2vNbgpd0bVnuq2fewAAAD9PhSkpycRl+rdRGylYFuDEVkmf0qPZKK8oFgAxN+P
         iKP4UgjHs716pUGdnE0FdRDnAN40hc6n6K8XuDoYdzv1UOeIMdar+wRukUcMBGKiGz5c
         8u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=erq8edeYqKHfR2a01fr/NOjNT6a7uDJ4dmqa31gPP2g=;
        b=1LKrUEEwzTnQi8qx6Ad2X5VMNvWh/STVobMEEDwo8RDXDmHJOYAmNtZITKDoZ8c7xW
         cIcawEVsxJcbkjyIpG40XsBOAz0FpxraIKuB4o/2TNd0xmRTU/tKUtPrYl0LFlGZCIxx
         ZzDWdbNDLCRdLTZxBpsbs+DwlojucGmygdYgpNc7EgT5Yoa7pAJJqomaWyhq6Gs79a0s
         bxqHQsBjvflGbzkn0Q99sQI/K7BcDckUkWiGJ2zmg1nvKpFA8YiNpL6FPKZCiqm6WVsW
         KYe5swDQGWS+4XidK95hiDBaDSMkZ1cLQNBh6fGmsb7YezudPeYBCH5G7Mn7syX+nMN+
         LO0w==
X-Gm-Message-State: AJIora+LHlLwwUiC5RDP6B4N0WQZZzmgOfGJlkbilKEulWLqBjkEso4s
	083loCjQwuOY0drwP0u4iK7Q0R4EIMh2OVvldUo=
X-Google-Smtp-Source: 
 AGRyM1tG/RxQyqFj25JLsiJ/FImsr5mfytP40XzVrMiIvIIIFfPgIlcSHHChm9ClIvPtZ9PARk8xAzRdhBrK9IAjtFU=
X-Received: by 2002:a05:6214:29c3:b0:473:2ae:e92a with SMTP id
 gh3-20020a05621429c300b0047302aee92amr6260273qvb.36.1657080502584; Tue, 05
 Jul 2022 21:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
 <1656925643-8143-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1656925643-8143-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2022 00:07:56 -0400
Message-ID: 
 <CAMKF1sonv0WOWAX96qiwHz6Z7_F+oWMSm3m3MYq57_XL79YeZA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] catch2: upgrade 2.13.7 -> 3.0.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 04:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97721

we have libgpiod which still needs catch2 so please look into fixing
libgpiod as well. It fails currently

| ../../../../libgpiod-1.6.3/bindings/cxx/tests/gpiod-cxx-test-main.cpp:9:10:
fatal error: catch2/catch.hpp: No such file or directory
|     9 | #include <catch2/catch.hpp>
|       |          ^~~~~~~~~~~~~~~~~~
| compilation terminated.


you have to enable ptest DISTRO_FEATURE to get to this error.

On Mon, Jul 4, 2022 at 5:08 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-test/catch2/{catch2_2.13.7.bb => catch2_3.0.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-test/catch2/{catch2_2.13.7.bb => catch2_3.0.1.bb} (82%)
>
> diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb b/meta-oe/recipes-test/catch2/catch2_3.0.1.bb
> similarity index 82%
> rename from meta-oe/recipes-test/catch2/catch2_2.13.7.bb
> rename to meta-oe/recipes-test/catch2/catch2_3.0.1.bb
> index ed50f659d..c6fd36806 100644
> --- a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
> +++ b/meta-oe/recipes-test/catch2/catch2_3.0.1.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
>  LICENSE = "BSL-1.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>
> -SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x;protocol=https"
> -SRCREV = "c4e3767e265808590986d5db6ca1b5532a7f3d13"
> +SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
> +SRCREV = "605a34765aa5d5ecbf476b4598a862ada971b0cc"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97685): https://lists.openembedded.org/g/openembedded-devel/message/97685
> Mute This Topic: https://lists.openembedded.org/mt/92161469/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

