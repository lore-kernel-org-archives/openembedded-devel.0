Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.7959.1622127266830724298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 07:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N5yeChGW;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id f22so105492pgb.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Hf3SDW88OeWNKHfy+Q2Nyn29gj7Tca7XE0NdD+c72k=;
        b=N5yeChGWlwxTQofcip/xZPYGhLfaSpeXLgQBLye0+DxEEgIAOseajPpmLHy9w5Z7WV
         b19xnBEkmg3V+gaSl7sIYshvNbTHVc661Xub1ONxVSZPmkCAGwXaFXgRA8UBvvo7tKbc
         flGd6LiGbVdkqips7bHQY/wIPOI48t5oWp+Ts+15gRSymkiEggh41wP3XcWahLiMcf62
         uEWU0qYEvPtp0f8MMKS5T4wzkSkuZFRdIfa6W7GFypeUebsdILDSvSaqdr3YCkVpd8Dz
         Nf+jcxkusdJebinyjH3SIr+82tHgn6PUKhAQ6DVxgl555ACfn8QK/jxAkSsaHZszhZrr
         S1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2Hf3SDW88OeWNKHfy+Q2Nyn29gj7Tca7XE0NdD+c72k=;
        b=VKR0bC/2hlxkMirDR/7KiilmCSUPPrrhDq3uUBNnZ6FnNXqXY2LR8gTjLihAtnfiH3
         KWHdUtgx3qtTkvXjiBvDdvVU9I1NO4fiQCYwRtM8TLeVyTj1Ntgm/NJplQx58GpZKjUe
         +QNFW8xUnmq1yTrPeOxe+mAIQyHppsDYFNYcDTR02MIR4I+C737YeyREzcMcKTmyTVnd
         G1VT0BApqxQ3Jnq/7vuG8Z+aJQucTMLl7R7nOPugvmt3jHqzE9QiEphJh2k1dxOIN4JR
         Wtkjr/OjWCqTN+UMh/jTlBwQRTZN5976Bpx361iNqRrzNilIDhxdWfCVjVa1xyi6on5c
         iEkg==
X-Gm-Message-State: AOAM533ctieLHQb/fbP7B+kCWMvrg1JUe9bepmbmTn70wq8QmgeDHGEl
	REerMUH0za6MQBQNqX5dHkULA9LbM3iNtw==
X-Google-Smtp-Source: ABdhPJxrCL3PuivXK1Fs7yn7vC8BznwuH6eayH57AC0WhZBn1jIuUbnBaNKW1aYZoVZL/LGsCmaGZg==
X-Received: by 2002:aa7:820f:0:b029:2e9:3aea:2e05 with SMTP id k15-20020aa7820f0000b02902e93aea2e05mr4024625pfi.13.1622127265982;
        Thu, 27 May 2021 07:54:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::2290? ([2601:646:9200:a0f0::2290])
        by smtp.gmail.com with ESMTPSA id e17sm2102196pfi.131.2021.05.27.07.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 07:54:25 -0700 (PDT)
Subject: Re: [PATCH] [oe] [meta-gnome] [PATCH] libstemmer: upgrade 2.0.0 -> 2.1.0
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1622097924-10659-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <36c52d93-0d6b-0831-f8bd-cc0abff88e13@gmail.com>
Date: Thu, 27 May 2021 07:54:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1622097924-10659-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

This patch seems to be corrupted

error: cannot convert from y to UTF-8

Please regenerate it with git format-patch and send with git send-email


On 5/26/21 11:45 PM, zangrc wrote:
> 0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
> Removed since this is included in 2.1.0
> 
> -License-Update: Add the following Copyright
> Copyright (c) 2013, Yoshiki Shibukawa
> Copyright (c) 2006,2007,2009,2010,2011,2014-2019, Olly Betts
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   ...ds-do-link-with-LDFLAGS-set-by-build.patch | 46 -------------------
>   .../libstemmer/libstemmer_git.bb              |  7 ++-
>   2 files changed, 3 insertions(+), 50 deletions(-)
>   delete mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
> 
> diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch b/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
> deleted file mode 100644
> index 69c1d670e7..0000000000
> --- a/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 23eacfbcc10c777ce47283a5285455ec83c8aa41 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -Date: Sun, 6 Oct 2019 13:05:08 +0200
> -Subject: [PATCH] snowball/stemwords: do link with LDFLAGS set by build
> - environment
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Some (cross-)build systems as OpeneEmbedded are picky (for certain reasons) if
> -their LDFLAGS are ignored.
> -
> -Upstream-Status: Submitted [1]
> -
> -[1] https://github.com/snowballstem/snowball/pull/120
> -
> -Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ----
> - GNUmakefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/GNUmakefile b/GNUmakefile
> -index 76f6ae9..47c6077 100644
> ---- a/GNUmakefile
> -+++ b/GNUmakefile
> -@@ -179,7 +179,7 @@ clean:
> - 	-rmdir $(js_output_dir)
> -
> - snowball: $(COMPILER_OBJECTS)
> --	$(CC) $(CFLAGS) -o $@ $^
> -+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
> -
> - $(COMPILER_OBJECTS): $(COMPILER_HEADERS)
> -
> -@@ -204,7 +204,7 @@ libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
> - 	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
> -
> - stemwords: $(STEMWORDS_OBJECTS) libstemmer.o
> --	$(CC) $(CFLAGS) -o $@ $^
> -+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
> -
> - csharp_stemwords: $(CSHARP_STEMWORDS_SOURCES) $(CSHARP_RUNTIME_SOURCES) $(CSHARP_SOURCES)
> - 	$(MCS) -unsafe -target:exe -out:$@ $(CSHARP_STEMWORDS_SOURCES) $(CSHARP_RUNTIME_SOURCES) $(CSHARP_SOURCES)
> ---
> -2.21.0
> -
> diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb b/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
> index 96dd880b6a..c1a06c0d0d 100644
> --- a/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
> +++ b/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
> @@ -1,18 +1,17 @@
>   SUMMARY = "Snowball compiler and stemming algorithms"
>   HOMEPAGE = "https://snowballstem.org/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=2750797da77c1d784e7626b3f7d7ff3e"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
>   
>   DEPENDS_class-target = "${BPN}-native"
>   
>   SRC_URI = "\
>       git://github.com/snowballstem/snowball.git \
>       file://0001-Build-so-lib.patch \
> -    file://0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch \
>   "
> -SRCREV = "c70ed64f9d41c1032fba4e962b054f8e9d489a74"
> +SRCREV = "4764395431c8f2a0b4fe18b816ab1fc966a45837"
>   S = "${WORKDIR}/git"
> -PV = "2.0.0"
> +PV = "2.1.0"
>   LIBVER = "0.0.0"
>   
>   inherit lib_package
> 
> 
> 
> 
> 
