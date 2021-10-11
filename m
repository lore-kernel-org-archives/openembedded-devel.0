Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474EBC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 20:33:00 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.4186.1633984378262215399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q+6cIeQf;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 133so11855086pgb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=y39NBpj4GelA0w2bUvOZ7RKyVM9i5AuTZ6tyer8ZoBQ=;
        b=Q+6cIeQf13k1OMYDqTnPFGCTiNJPHdH+cYWkrWXbzQ853k3N5C1wgEzmhxxPKALxhz
         41yz9TE+3ylD667DiNw4HzR8doYUwgVQXrjSoVaUwz2MyaDmShJnRERKOFXmZQ6ejkpc
         D/6Des82zaazv2UlyMI53SPzW4CVfCbAaUGUHKyGomlO622qGZGIm6IdSr0HtaVnw90v
         zUDpUTT4A4HjR3HPYvHZh7htjaY8l4C1vzZe0dlhhVHS3IszsQ+BrkFQnbM3B60dZ097
         X+a6kY57X8IV6QVxMqJWy8wg+zMY7eiwo5aoAaJDIi0e3mZgTNueOxg+FtjxHNhFhCeS
         OoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=y39NBpj4GelA0w2bUvOZ7RKyVM9i5AuTZ6tyer8ZoBQ=;
        b=6lTlwewam4AidUddxecotgqBU5V4H08NZXJ/TGW3X7fgWrHeSoJB7RCs8Nz2c4s9x8
         +ryj7IekekYKFcZNWLhqcZ5gEghB58Ney8lCkkiv4uxJnAaCO0ZEjs/aw2AGvvu546Wn
         CcyRYAnuBCsfpheNq3HG+XHqNU+UDeP+eSe+1umIn4EVYRIoVM81pQMOFyY/vwseWI6k
         R8lZjOk0F4Uh/hEsgJeXW7PA27eMdWuKyrH2EMcxDmszEc5PV+umpm8+ckNIVFVNk11X
         0qktrfZ43l1OtPKgvgsv1+WFzppngYxQQEHSLSR0bANj9TZFpeJTMC56Cbv7MPuy4LM+
         BhLw==
X-Gm-Message-State: AOAM532H+DvFmUiBsuZ/S+9jjMx6QEBjDemh55N8GDwrc9TIKazE5qGn
	Y8UpX2qQ8/Mm7/qgdmd4L7k=
X-Google-Smtp-Source: 
 ABdhPJw5lW12RFt8mq1wsdnL+EapFJfVsB/CbzgQyzeknO6CtGWhuJJFydKavOCs69il5lT7Dj1WHg==
X-Received: by 2002:a63:3301:: with SMTP id z1mr19835273pgz.120.1633984377587;
        Mon, 11 Oct 2021 13:32:57 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:d088:c18a:4e31:cc65?
 ([2601:646:9200:a0f0:d088:c18a:4e31:cc65])
        by smtp.gmail.com with ESMTPSA id
 c205sm8550507pfc.43.2021.10.11.13.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 13:32:57 -0700 (PDT)
Message-ID: <7c6e8695-6be2-c6d7-4f5f-beceda56cdd9@gmail.com>
Date: Mon, 11 Oct 2021 13:32:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [PATCH 08/24] netplan: do not use -Werror
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-8-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211011184140.653609-8-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 20:33:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93239



On 10/11/21 11:41 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../0001-Makefile-do-not-use-Werror.patch     | 23 +++++++++++++++++++
>   ...-t-fail-if-GLOB_BRACE-is-not-defined.patch |  7 ++++--
>   .../netplan/netplan_0.103.bb                  |  4 +++-
>   3 files changed, 31 insertions(+), 3 deletions(-)
>   create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
> 
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
> new file mode 100644
> index 000000000..ddc44c3ca
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
> @@ -0,0 +1,23 @@
> +From a06c77557ed951249d5b344441ad6ec57410e63f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Sun, 3 Oct 2021 21:52:16 +0200
> +Subject: [PATCH] Makefile: do not use -Werror
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8645aee..50fc0da 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -7,7 +7,6 @@ BUILDFLAGS = \
> + 	-D_XOPEN_SOURCE=500 \
> + 	-DSBINDIR=\"$(SBINDIR)\" \
> + 	-Wall \
> +-	-Werror \

Why is this change needed? Can you describe the scenario a bit, perhaps 
better if its in the patch header itself.

> + 	$(NULL)
> +
> + SYSTEMD_GENERATOR_DIR=$(shell pkg-config --variable=systemdsystemgeneratordir systemd)
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
> index 0fa6ba48a..c7d371dfa 100644
> --- a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
> +++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
> @@ -1,16 +1,19 @@
> -From ceb4111af317ecc54d97bb21878dcccbfdb2983e Mon Sep 17 00:00:00 2001
> +From e0df1f07d1707d5daf0358cc60b30f06121f7e60 Mon Sep 17 00:00:00 2001
>   From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>   Date: Fri, 25 Dec 2020 11:41:43 +0900
>   Subject: [PATCH] don't fail if GLOB_BRACE is not defined
>   
>   Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +
>   ---
>    src/util.c | 6 ++++++
>    1 file changed, 6 insertions(+)
>   
> +diff --git a/src/util.c b/src/util.c
> +index a4c0dba..fd4542d 100644
>   --- a/src/util.c
>   +++ b/src/util.c
> -@@ -24,6 +24,12 @@
> +@@ -25,6 +25,12 @@
>    #include "util.h"
>    #include "netplan.h"
>    
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
> index 682a6b611..3527bceeb 100644
> --- a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
> +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
> @@ -15,7 +15,9 @@ SRCREV = "51c872d856db80281ea810ebc02e05c09d5310fa"
>   PV = "0.103"
>   
>   SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main \
> -           file://0001-parse-nm-fix-32bit-format-string.patch"
> +           file://0001-parse-nm-fix-32bit-format-string.patch \
> +           file://0001-Makefile-do-not-use-Werror.patch \
> +           "
>   
>   SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93221): https://lists.openembedded.org/g/openembedded-devel/message/93221
> Mute This Topic: https://lists.openembedded.org/mt/86244755/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

