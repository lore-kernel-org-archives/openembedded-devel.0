Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.33372.1620660322279752760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 08:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ST3UucGY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id s20so9289210plr.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DHrvBD7gZFyiIK8wfy8WUH217vC2BSBzhnOP/SvlO/4=;
        b=ST3UucGYrt3CQjK7efROKSVMW1dvaWE+38VaReo4u/kqd0lPweTsh3mVv6Ie/hfdcb
         5r/qpwpDWEpwULWOCy6HOQ2+hzJV3xHi7wzrs4yBBSr2XQHxUEiTS4wzqa9yNYFPMc9l
         kMPR8QKN2IsQ1Rl67ITFkYNaDNo5AIL3ysRuj5LLS/LD4bT01vUfvg5Jn70W+GahEndl
         NkM/9nGo5QGMpL2ET3NNEfSvLQO2XD0j1BddmIeb82euWUPjRGvYun0KcZcgq9r/Rgsy
         Awxws9n2ivfQ5ke6fBSH1uWRmupi/UNR9py1p3GwEjHHGkdyUsnHBJJJC5pHs25/88H3
         xOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DHrvBD7gZFyiIK8wfy8WUH217vC2BSBzhnOP/SvlO/4=;
        b=iBGMR5yz17195M2fXGiW/0ZljnlVH2y7OkMCmaS1En4YnmI+Pb5TgqxjyO8zb/gxor
         2lesQYziVW9d7z0oImliMhcvQhUJ9t/4kxKWW8nACsBPh5PxbKsQ3xg15aHfFlsf7p+s
         Snpvu3oKNnepDHOA5nvWQpPP+cY8KY7uCN2pXJWjFB2Gi5/syTn5PREt6YGPOBDymjLO
         hYWKYxc8IKAJebIR8+mfCDDQj673bfQ/82EDCD2RjeQ+ithy+1OrB9nufwmQuAZYGTdx
         1YB9i3aXh3pv0t7wlXJT0RsJWUrZNtJN63SUiWaIsNbSAKrd3JpjphyBZGxrAtpxtx+v
         eXlg==
X-Gm-Message-State: AOAM531fqaBB8/caa4hjBZvIR179d2+XC8YdfMBuI8x3XLF1T+MNvxWu
	eLgni0IxEhu3WlHv1L1hdlIubQFWfyh8lQ==
X-Google-Smtp-Source: ABdhPJzvvn0l2b8OzRw9B4L7s06SoTHF3PTNN68vtNCAEvlzDwBhQuxOzlgfLjbkG0Hvns88miLQkQ==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr10690577pjr.177.1620660321277;
        Mon, 10 May 2021 08:25:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7822:4c28:c191:8745? ([2601:646:9200:a0f0:7822:4c28:c191:8745])
        by smtp.gmail.com with ESMTPSA id q38sm4632956pja.10.2021.05.10.08.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 08:25:21 -0700 (PDT)
Subject: Re: [oe] [PATCH] mariadb: Fix configure
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210510114404.4039335-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <addff054-90ba-984f-5f89-1c9120d809b4@gmail.com>
Date: Mon, 10 May 2021 08:25:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510114404.4039335-1-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Andreas

Yes this is cmake 3.20 upgrade in oe-core which brings this to fore.
I think its addressed with mariadb upgrade I have sent, however I will 
still apply this patch and rebase upgrade on it, so someone can backport 
it if needed. We do have native variant which is sensitive to cmake on host.

On 5/10/21 4:44 AM, Andreas Müller wrote:
> Assume recent CMake upgrade made this pop up.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>   ...onfigure-by-closing-IF-ELSE-properly.patch | 35 +++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
> 
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 9833b2885..92e54d759 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -22,6 +22,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>              file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>              file://sys_futex.patch \
> +           file://0002-Fix-configure-by-closing-IF-ELSE-properly.patch \
>             "
>   SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
>   
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
> new file mode 100644
> index 000000000..36c74d8f9
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
> @@ -0,0 +1,35 @@
> +From fdd08a8774265618668c7f24697e138587c47a16 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Mon, 10 May 2021 13:35:54 +0200
> +Subject: [PATCH] Fix configure by closing IF ELSE properly
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +| CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
> +|   Flow control statements are not properly nested.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + libmariadb/cmake/ConnectorName.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libmariadb/cmake/ConnectorName.cmake b/libmariadb/cmake/ConnectorName.cmake
> +index b7bbbad..357b8ac 100644
> +--- a/libmariadb/cmake/ConnectorName.cmake
> ++++ b/libmariadb/cmake/ConnectorName.cmake
> +@@ -22,7 +22,7 @@ IF(CMAKE_SYSTEM_NAME MATCHES "Windows")
> +     SET(MACHINE_NAME "x64")
> +   ELSE()
> +     SET(MACHINE_NAME "32")
> +-  END()
> ++  ENDIF()
> + ENDIF()
> +
> + SET(product_name "mysql-connector-c-${CPACK_PACKAGE_VERSION}-${PLATFORM_NAME}${CONCAT_SIGN}${MACHINE_NAME}")
> +--
> +2.30.2
> +
> 
> 
> 
> 
> 
