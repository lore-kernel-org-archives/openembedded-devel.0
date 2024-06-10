Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1C5C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 17:59:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.26400.1718042366804700115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 10:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOA0TPo5;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4217990f997so20468695e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718042365; x=1718647165; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lOz5V7JHie6yRf/y2CU+lbFQ3jb87VyFy2x/L2n5SjI=;
        b=VOA0TPo5qaTaxnPUGK4Cvt3daI0rIGyPkO7HadlHEk5NtW09AlHu0HD5jG79hloTC/
         OkPzFPNBtQkPzNd8n64/lhNPRMPORkkcfWzYj4mH4brlcjUCq/tXopkWDIdQGB8VtH0H
         0K5OuXrU1IZTAELEOZzhtL7gaJD8lEJKjbx12ntTTvFEIkqWwED9I3eRx4S+oWmHUc9p
         ZEigMmpx60NyffRNr19Ygt0dKFvPNpVPhHv50/SW/lwajdKg68LrRft+i3koQfewpjpk
         7hG1dO8Rgi4luETV1FXkeE+mc6y65e4PeZrnh34oMbInOJUfZkV7yDgIWzQbOA7f9Axt
         Vc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718042365; x=1718647165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOz5V7JHie6yRf/y2CU+lbFQ3jb87VyFy2x/L2n5SjI=;
        b=nMF9NIiKcFRHGjXauKt6nsu9xLfC+jrEw3Avl0dxYmlGbZO4iJ/QK9R8KXA3NaVzI7
         HGlA8qKixehhU+JBlwgpwSTwENAETfiv6HRTPT1FugTxS8JqlA5bfbJbz5tJPtM6ZqdH
         b6N1YzMNWKvkR+BbYfYv03oewUVeVg85/CEESlUCE1Xfj/Hj7Qles/mDI3xh19etCSkg
         6YNrLji9MFW92iumYbUAG9Z5EgxYJQLGIsveaPNnifB9zUOroFhzOldVlDpBQ6IbYv4j
         cWp+VvfEJRMdw7rSQIM40gYOOZ1dHSAz/WvdZGdai9/9LMTDNJh/cpjJHgZysJ+2Unu+
         xcIQ==
X-Gm-Message-State: AOJu0YwgpdKw7tJqWZci1uJHg5OWdYNPpNb00cVq6EIh0VX0VLNlsNUk
	adXFYZPIkYJwMgODeJxG7Rf175BlZB3F+kWkZhkYKGInkyxTJ45a
X-Google-Smtp-Source: AGHT+IE7x6RO9ERUBWaB/O6EkVo8XsYvPkW585+CfQRKvh/fWBfRhD1Lq3bHFM11mSF2+B1fQ7EIOg==
X-Received: by 2002:a05:600c:3481:b0:421:8343:5a8 with SMTP id 5b1f17b1804b1-42183430f62mr40835465e9.38.1718042364925;
        Mon, 10 Jun 2024 10:59:24 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4218330c7bbsm58531475e9.35.2024.06.10.10.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 10:59:24 -0700 (PDT)
Message-ID: <29127de3-0cb0-45c7-8498-6a2ec9399b3a@gmail.com>
Date: Mon, 10 Jun 2024 19:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-initramfs][PATCH] dracut: Drop an unnecessary patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240610102455.2252749-1-zboszor@gmail.com>
 <CAMKF1soUxJJPbw-_-+28pzv_KQOO=BU60_-kUs_TwCgAPe8A8g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1soUxJJPbw-_-+28pzv_KQOO=BU60_-kUs_TwCgAPe8A8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 17:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110799

2024. 06. 10. 16:34 keltezéssel, Khem Raj írta:
>
>
> On Mon, Jun 10, 2024 at 3:24 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>     Dropped 0001-util.h-include-sys-reg.h-when-libc-glibc.patch
>     that's unnecessary for a long time now, because dracut
>     (since version 049) does not rely on __WORDSIZE.
>
>
> Does this still build on musl without this patch

It should. The patch description had this:

"For musl libc it is required to include <sys/reg.h> to
have __WORDSIZE defined to e.g. 32 for arm*-musl."

Since this commit in version 049, dracut doesn't actually
use __WORDSIZE:

commit 838f22259a50e5f92429ecdd24b897c1128edc98
Author: Alexander Tsoy <alexander@tsoy.me>
Date:   Sun Sep 9 02:47:09 2018 +0300

     install: avoid non-portable __WORDSIZE

     Lets not unnecessarily rely on __WORDSIZE, which is not clearly specified
     by any spec. Use explicit size comparisons if we're not interested in the
     WORDSIZE, anyway.

     Patch ported from systemd.
     (commit 8507eb20b64010b26f23822cbf442bb0bf96511c)

     Original-patch-by: Emil Renner Berthing <systemd@esmil.dk>
     Bug: https://bugs.gentoo.org/602122

>
>
>     Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>     ---
>      ....h-include-sys-reg.h-when-libc-glibc.patch | 35 -------------------
>      .../recipes-devtools/dracut/dracut_102.bb <http://dracut_102.bb>    |  1 -
>      2 files changed, 36 deletions(-)
>      delete mode 100644
>     meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
>
>     diff --git
>     a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
>     b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
>     deleted file mode 100644
>     index 68ec2b8fd..000000000
>     ---
>     a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
>     +++ /dev/null
>     @@ -1,35 +0,0 @@
>     -From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 2001
>     -From: Khem Raj <raj.khem@gmail.com>
>     -Date: Thu, 13 Jul 2017 17:14:05 -0700
>     -Subject: [PATCH] util.h: include <sys/reg.h> when libc != glibc
>     -
>     -For musl libc it is required to include <sys/reg.h> to
>     -have __WORDSIZE defined to e.g. 32 for arm*-musl.
>     -
>     -Taken from void-linux
>     -https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patches/musl-__wordsize.patch
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     ----
>     -Upstream-Status: Pending
>     -
>     - src/install/util.h | 3 +++
>     - 1 file changed, 3 insertions(+)
>     -
>     -diff --git a/src/install/util.h b/src/install/util.h
>     -index a6f9a184..82732913 100644
>     ---- a/src/install/util.h
>     -+++ b/src/install/util.h
>     -@@ -36,6 +36,9 @@
>     - #include <sys/stat.h>
>     - #include <dirent.h>
>     - #include <sys/resource.h>
>     -+#if !defined(__GLIBC__)
>     -+#include <sys/reg.h>
>     -+#endif
>     -
>     - #include "macro.h"
>     -
>     ---
>     -2.17.1
>     -
>     diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
>     <http://dracut_102.bb> b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
>     <http://dracut_102.bb>
>     index 496380a0f..39ff265a3 100644
>     --- a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb <http://dracut_102.bb>
>     +++ b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb <http://dracut_102.bb>
>     @@ -9,7 +9,6 @@ PE = "1"
>
>      SRCREV = "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
>      SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main
>     <http://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main> \
>     -  file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
>     file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
>                 "
>
>     -- 
>     2.45.2
>


