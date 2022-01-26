Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5EFC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 04:18:24 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.8388.1643170704193529557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 20:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=md6wkTwm;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g12so3158240qto.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 20:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hlSxtdIaep1l5GWCUAPTzgqTPrcIoWRpnosJJq5w6pw=;
        b=md6wkTwmhmYsEuiNH+WgTmU+wilC2o0iPWb8r1lzH58yAJDUh0wLfZM20nOd75T/zF
         yOcI3dHsV4aRwD9T8rFbzQyDwA7f8FJizhBRJplDinGR7tggAvKe5jzz1jMD7zVV9xyZ
         i6l+pIhCyxMW1OQk9CWI7sKJLKoagdfpwRImHS0s3rmNGpCBV7pokRGwaGY+SGyDecQo
         PrHSLg4imyDLB3uygBgYWwpDWETbxKvivsljhfn8uQ5uMK3eCjaDMA/3Qw0Tqp0T8JaJ
         Mbz6PHtZGW+ZpQXLnF87wHRF6FgMmghaQLG9HPFcKvPqY4t2NcnUVHZE1He7d3yxHtFT
         +8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hlSxtdIaep1l5GWCUAPTzgqTPrcIoWRpnosJJq5w6pw=;
        b=qHeJ4uDUvscFjEDI9bRTJ0xw64sCdo8uP/aRHy3NckBUFQS4UGL7hMRRTQTkWvDboN
         JP8KePO0q6LDUrYoQdrZOwhxP4uQ9IRqYNdrA/saJxfa4w8dz4VciGVqf8G3e9SDyA4e
         HsKZ4UwTFXbBMDM9npMo7hhwGVnwoBD0norziZNh/oYLUsMFGg+PmjLMvmTTJtIYTsnM
         VcGCjdXEaOtu2cx6b8wB83aGTejltivSKJzM5rPwIfsDpgBq7mPKZJxsJkVVunG+AbrW
         KIL7X5RN8a0nKtyO/nle4I2NbYwc+HF0cNUB8t9lwGYEoZD8NtslVpt4/vhlOLlBYxOa
         mjJw==
X-Gm-Message-State: AOAM532fJGwf4n3fVuq6CE8VtvMrkOarwDnH9wOxww07lIsZOtd+L17l
	o2BpW7uWI6iH0gmpkA6WmHUmQlmPlkHxKaF62PruIrRCH8Q=
X-Google-Smtp-Source: 
 ABdhPJxv5bCVjGZ153Bm4e/FLzTWgyEyrJULvBQWrLllYNIxdQylU4X5LIjuW2Tj+hIEF2ydO6k0aPoEqPkeMOXo7AM=
X-Received: by 2002:a05:622a:553:: with SMTP id
 m19mr2356485qtx.229.1643170703155;
 Tue, 25 Jan 2022 20:18:23 -0800 (PST)
MIME-Version: 1.0
References: <1643166825-9023-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1643166825-9023-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2022 20:17:57 -0800
Message-ID: 
 <CAMKF1sqimNGJkvcD4aO4fkTVgrDM5uRw8NPnMuS_bbcfGp4Suw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia] [PATCH] gerbera: fix bug caused by update
 of fmt
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 04:18:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95093

I have already staged similar patch in master-next

On Tue, Jan 25, 2022 at 7:14 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...0001-fix-bug-caused-by-update-of-fmt.patch | 36 +++++++++++++++++++
>  .../gerbera/gerbera_1.9.2.bb                  |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch
> new file mode 100644
> index 000000000..eb3a80233
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch
> @@ -0,0 +1,36 @@
> +From 2d00f2c8ba8176d9fc6a266e9f4d5ebf75422414 Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Wed, 26 Jan 2022 10:17:31 +0900
> +Subject: [PATCH] fix bug caused by update of fmt when do_compile
> +
> +After fmt was updated to 8.1.1, the following problems were caused:
> +
> +gerbera/1.9.2-r0/recipe-sysroot/usr/include/fmt/core.h:1728:7: error: static
> +assertion failed: Cannot format an argument. To make type T formattable
> +provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
> +|  1728 |       formattable,
> +|       |       ^~~~~~~~~~~
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + src/content/autoscan.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/content/autoscan.cc b/src/content/autoscan.cc
> +index ae0c0f9..6865a6c 100644
> +--- a/src/content/autoscan.cc
> ++++ b/src/content/autoscan.cc
> +@@ -127,7 +127,7 @@ std::string_view AutoscanDirectory::mapScanmode(ScanMode scanmode)
> +     case ScanMode::INotify:
> +         return "inotify";
> +     }
> +-    throw_std_runtime_error("Illegal scanmode ({}) given to mapScanmode()", scanmode);
> ++    throw_std_runtime_error("Illegal scanmode ({}) given to mapScanmode()", (int)scanmode);
> + }
> +
> + ScanMode AutoscanDirectory::remapScanmode(const std::string& scanmode)
> +--
> +2.25.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
> index 94657ba53..d05c36093 100644
> --- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
> +++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
> @@ -4,6 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
>
>  SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
> +           file://0001-fix-bug-caused-by-update-of-fmt.patch \
>            "
>
>  SRCREV = "3b93d362ec33f738868a4e896a2c9ee8e9d7a92a"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95091): https://lists.openembedded.org/g/openembedded-devel/message/95091
> Mute This Topic: https://lists.openembedded.org/mt/88689352/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

