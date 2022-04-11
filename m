Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12670C63715
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.31847.1649696371362208541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JFkvkTwn;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id t13so14705854pgn.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nhrvfJW5o9UPYjzrZcB5iaaimFGzVBGE+tI9HmJ4QZU=;
        b=JFkvkTwnA8PUEbI8n2rXuW79wxZEmuyRntkK6QUwe2kUxMPPtetK0isl/4dWBW9Zif
         +WlL3CH/OrsZu1/tTGAc52U+8GqY7aP6FRB+qBLXv2RFHiUvxQ50iN0K6k3WvVVoh1Q7
         32mDHprKEQF49yjdbxIhkhCrR79/U4oJRBQ/ts8cw6UDjvXb+XIHtHI2jOKMyQVJEqM3
         P7JhYO2tiCnR+vCQGUoDGtg8cNq8ieyEDqHq12wlOWZMjI7EjQCxMLOohOikAUPG3CGK
         /dOz+/tZO9UyHIWPzG2N01p+EfL7cPVM8OuMGpOqtT9mN13Uj6CHNTAs69bn3iRqN6Xh
         hv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nhrvfJW5o9UPYjzrZcB5iaaimFGzVBGE+tI9HmJ4QZU=;
        b=HLxYsywx2qYpQJCOaoXDdbpJ2c1g13pK18bjQmttJo1aDz5mGjuyQDYmlsacSNf8Ez
         BwKTm5dbz7JXb8Kk5rT9TBmJK0uB1i0gv4t2oGuU7O5CEYHu1seYYxPsC6EKpoTbboyc
         5dS2uFZGKSBTGzwMs9Dzh1TLnSYMPdb71RT2cRdA9re6/XSih7lbS7BEulqJecat5iWS
         mJ40M24n+StAfFOctv7l5mv++fmSom+bnm11qQ+HfPbyO75W/6+/qgMp7oiAv/4/iWba
         2KP1LQBkgnDQ5i4h8cz3MvxJv4knq6i01cRaYII1wkym0KHbD1RfKaz/JiwkNqgu5ZQG
         5xqw==
X-Gm-Message-State: AOAM531iff9tqbKU/5iaGvHOddCQEat8DpI3LutP5nB5s8imup+c1jKH
	Cta+UO4BGcHWlrPC51cVV3zHZk2n2lQ=
X-Google-Smtp-Source: 
 ABdhPJwYERRQv05mbNbo2u+a2e+hA7DWwBRHVxx/jcLJ5HO8EJtRR26xlAs41XRzu1FnCpQugQQnQQ==
X-Received: by 2002:a63:e557:0:b0:39d:2965:a7f0 with SMTP id
 z23-20020a63e557000000b0039d2965a7f0mr8548714pgj.158.1649696370681;
        Mon, 11 Apr 2022 09:59:30 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:70d5:c5c2:9136:2337?
 ([2601:202:4180:a5c0:70d5:c5c2:9136:2337])
        by smtp.gmail.com with ESMTPSA id
 w13-20020a17090a5e0d00b001c7d4099670sm43266pjf.28.2022.04.11.09.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 09:59:30 -0700 (PDT)
Message-ID: <1e8b3bfa-fa3f-dbab-9e10-b74e849bd925@gmail.com>
Date: Mon, 11 Apr 2022 09:59:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-oe][hardknott][PATCH] sdbus-c++-libsystemd: Avoid hard
 dependency on rsync
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <16E4E5FA997EC5EE.17061@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <16E4E5FA997EC5EE.17061@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96556

ignore this one. wrong branch

-armin

On 4/11/22 09:57, Armin Kuster via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit dcb8ab6169bd93440137bbd4703171987ecd3a15)
> [Fixup for hardknott context]
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
>   .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  7 +--
>   2 files changed, 57 insertions(+), 3 deletions(-)
>   create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> new file mode 100644
> index 0000000000..ae449791f1
> --- /dev/null
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> @@ -0,0 +1,53 @@
> +From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> +Date: Mon, 12 Apr 2021 14:03:32 +0200
> +Subject: [PATCH] meson: do not fail if rsync is not installed with meson
> + 0.57.2
> +
> +https://github.com/mesonbuild/meson/issues/8641
> +
> +Our CI started to fail. Even if the change is reverted in meson,
> +we need a quick workaround here.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + man/meson.build | 25 ++++++++++++++-----------
> + 1 file changed, 14 insertions(+), 11 deletions(-)
> +
> +diff --git a/man/meson.build b/man/meson.build
> +index 3cae8446cda..f9c4b83dc81 100644
> +--- a/man/meson.build
> ++++ b/man/meson.build
> +@@ -184,17 +184,20 @@ html = custom_target(
> +         depends : html_pages,
> +         command : ['echo'])
> +
> +-run_target(
> +-        'doc-sync',
> +-        depends : man_pages + html_pages,
> +-        command : ['rsync', '-rlv',
> +-                   '--delete-excluded',
> +-                   '--include=man',
> +-                   '--include=*.html',
> +-                   '--exclude=*',
> +-                   '--omit-dir-times',
> +-                   meson.current_build_dir(),
> +-                   get_option('www-target')])
> ++rsync = find_program('rsync', required : false)
> ++if rsync.found()
> ++        run_target(
> ++                'doc-sync',
> ++                depends : man_pages + html_pages,
> ++                command : [rsync, '-rlv',
> ++                           '--delete-excluded',
> ++                           '--include=man',
> ++                           '--include=*.html',
> ++                           '--exclude=*',
> ++                           '--omit-dir-times',
> ++                           meson.current_build_dir(),
> ++                           get_option('www-target')])
> ++endif
> +
> + ############################################################
> +
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> index c52024130e..59d6f352c8 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> @@ -12,9 +12,10 @@ DEPENDS += "gperf-native gettext-native util-linux libcap"
>   
>   SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
>   SRCBRANCH = "v243-stable"
> -SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
> -
> -SRC_URI += "file://static-libsystemd-pkgconfig.patch"
> +SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
> +           file://static-libsystemd-pkgconfig.patch \
> +           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
> +           "
>   
>   # patches needed by musl
>   SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96554): https://lists.openembedded.org/g/openembedded-devel/message/96554
> Mute This Topic: https://lists.openembedded.org/mt/90399667/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


