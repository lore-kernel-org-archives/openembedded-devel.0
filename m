Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB28C47092
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.22784.1650836952603403575
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 14:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esJaNG7+;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n18so22966645plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 14:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=UDBFFlsvF2/OHtcHwRGqmbU3t33q+ncrus/1KFL6lAs=;
        b=esJaNG7+aJp4zww70yUZm5BgWlJzgmColbJMzCaDrJ5HY0yF0+/2BeYNM2EelsxgSc
         Elx+oDbGAmHMvEKQiOLXay9J/WCBFxlXGjTH732U1hPOFF7r2hIoG21OirBSba+izNqk
         VFx6jjXmt5Ta/q69pYb8Oe+EmahFs2O5GiaKunLA+qQG/Y1+HG/TPAb0jqcWG0kG2slq
         aK/qfPhrmzl/7HiBtBXzuqtk2gxVToRtx2w6NY6z5K9rJQHWM69qf2/r94ahuLPvCVU9
         wxwLtBtA6n4tX8iFV9rfk/CoT0wz/1H9bz5p1I86fumzcndzD+/Ddhz8/12C5pduxKtS
         UVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UDBFFlsvF2/OHtcHwRGqmbU3t33q+ncrus/1KFL6lAs=;
        b=AuIq3dZBXb8e8/RY/6dOLQbs5ZiA7ousDw1TYMe3aMKjNzBok/EAfnOccRzcrj0aHU
         0wLaCbyxgJUx3034yFffa4lWH9HSKz2ckeHJit/dr/aZzYDqzt5v//df5GHWBsfHLZYF
         3ozVaqCY8Ow8viWzKvFEz/f2AhRL/ZVVLCOOUGAgUMcduz4m/vdgLOyOn3LcjXktvf49
         bw0hoA0y3QjoHFafxmObHH1mrG0fIXrpOEedTn2ssDcI0ekrWAz8ATePUDUJDs7tixlm
         shGj04aFsxraaNdlkoCmCERmiFWZj9qOrEVf5vgQGAt5zCVw6Uvt4mC/0+MYbEd2Zd8K
         9Pug==
X-Gm-Message-State: AOAM533Q6g6Oy3ge1LEK5YQvt+Gcx6MirHGtgp27O9fjOFNCn60MVXR/
	sF8XQr4aWDjv8qnDJlVhyyc=
X-Google-Smtp-Source: 
 ABdhPJyr9i5C5ajA0z5prmrvlJskZjwAmby9qbsVBQXNonCs3moEGKzdCvfaUljuezpWhD3YnXbARA==
X-Received: by 2002:a17:902:728f:b0:156:24d3:ae1a with SMTP id
 d15-20020a170902728f00b0015624d3ae1amr14881577pll.9.1650836952008;
        Sun, 24 Apr 2022 14:49:12 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:4b06:fd38:8aa2:22a?
 ([2601:202:4180:a5c0:4b06:fd38:8aa2:22a])
        by smtp.gmail.com with ESMTPSA id
 n12-20020a63e04c000000b003aa7a100827sm7399683pgj.10.2022.04.24.14.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 14:49:11 -0700 (PDT)
Message-ID: <1e13861c-f742-b8a5-5001-df4d73129e01@gmail.com>
Date: Sun, 24 Apr 2022 14:49:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-oe][hardknott][PATCH] makedumpfile: Upgrade to 1.6.9
Content-Language: en-US
To: mingli.yu@windriver.com, openembedded-devel@lists.openembedded.org
References: <20220424084538.2940999-1-mingli.yu@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220424084538.2940999-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96756



On 4/24/22 01:45, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Linux 5.10 introduces a new lockless ringbuffer. The new ringbuffer
>    is structured completely different to the previous iterations.
>    Add support for retrieving the ringbuffer from debug information
>    and/or using vmcoreinfo. The new ringbuffer is detected based on
>    the availability of the "prb" symbol.
>
> * Support newer kernels as follows:
>
>    - 5.10, 5.11, 5.12  (x86_64 SPARSEMEM)

Isn't 5.10 supported in Hardknott? Did any 5.10 kernel updates introduce 
a regression?

-armin
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...1-makedumpfile-replace-hardcode-CFLAGS.patch | 17 +++++++++--------
>   ...edumpfile_1.6.8.bb => makedumpfile_1.6.9.bb} |  2 +-
>   2 files changed, 10 insertions(+), 9 deletions(-)
>   rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.8.bb => makedumpfile_1.6.9.bb} (97%)
>
> diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
> index 270cc3562..94eac931e 100644
> --- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
> +++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
> @@ -1,4 +1,4 @@
> -From af97e2ad643334b4c7c3d66f971ce9ebb2b596af Mon Sep 17 00:00:00 2001
> +From 1053cf25be28b266ba264705e11179cf4f04aa91 Mon Sep 17 00:00:00 2001
>   From: Mingli Yu <mingli.yu@windriver.com>
>   Date: Thu, 21 Jul 2016 18:06:21 +0800
>   Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
> @@ -13,14 +13,15 @@ Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
>   Upstream-Status: Inappropriate[oe specific]
>   
>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +
>   ---
>    Makefile | 45 +++++++++++++++++++++++----------------------
>    1 file changed, 23 insertions(+), 22 deletions(-)
>   
> -Index: git/Makefile
> -===================================================================
> ---- git.orig/Makefile
> -+++ git/Makefile
> +diff --git a/Makefile b/Makefile
> +index 6fa00bc..7aa7ae2 100644
> +--- a/Makefile
> ++++ b/Makefile
>   @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
>    CC	= gcc
>    endif
> @@ -79,7 +80,7 @@ Index: git/Makefile
>   +              -DRELEASE_DATE='"$(DATE)"'
>   +
>    SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
> - SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c
> + SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c printk.c
>    OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
>   @@ -52,12 +53,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
>    
> @@ -104,7 +105,7 @@ Index: git/Makefile
>   +CFLAGS_COMMON += -DUSESNAPPY
>    endif
>    
> - LIBS := -lpthread $(LIBS)
> + LIBS := $(LIBS) -lpthread
>   @@ -90,14 +91,14 @@ LIBS := $(LIBS) $(call try-run,\
>    all: makedumpfile
>    
> @@ -122,7 +123,7 @@ Index: git/Makefile
>    	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
>    	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
>    	mv temp.8 makedumpfile.8
> -@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
> +@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
>    	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
>    
>    eppic_makedumpfile.so: extension_eppic.c
> diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
> similarity index 97%
> rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
> rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
> index 6f87db177..4350ea126 100644
> --- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
> +++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   LICENSE = "GPLv2.0"
>   
>   SRCBRANCH ?= "master"
> -SRCREV = "18e0cdba48feeccea2429b3b0b2691f4314d1062"
> +SRCREV = "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
>   
>   DEPENDS = "bzip2 zlib elfutils xz"
>   RDEPENDS_${PN}-tools = "perl ${PN}"


