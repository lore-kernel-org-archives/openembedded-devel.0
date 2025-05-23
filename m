Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079CFC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 11:01:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.45558.1747998081208716506
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 04:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKqZsspm;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so95105695e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747998079; x=1748602879; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sWzku2bMwLGFOnGuy32qFf+o0RgyJNKqaBZhZpWbbyE=;
        b=IKqZsspmecPaGAjy7t5nn5gThOiuriZXPehk7EEMYAWl/Re9UqGaojdpgFCJRmMJjL
         8ORplEAXwvIKkdsHjjAbafYuG8eBfaNehCzAczdXlKY8+NVEjLnhV7F47N9/WyMxXeLG
         Jrwczd9VPF1XqUvq9sCeij8jdz9HwHNNrQypHxcPKmgxfuRtoKDqmDxmgENvtWCWvJgl
         DP8CtQtceC2jwybnxVg1OB/XqXXWU/vSMi6ju1hCqK5UdIP3FCHrTWo7CQWDuMmDx/uB
         Qe1ArknKygAd8F/nFXW6p4l6nS96/Or9E4/h4s8N25yYCDz0qPzaiFa1gMVUzQgofwnR
         gvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747998079; x=1748602879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWzku2bMwLGFOnGuy32qFf+o0RgyJNKqaBZhZpWbbyE=;
        b=DKa1XcigorIVknfuBV74uHOerx2lzCUymRuQ84dsdBsnGZ8uhqcz4hyyulLvbpq9pq
         qOwcuRTpt5o04uQPpTB/Pnl+9hDpTjoU9fn7xJsmW3S6FAPjyVihwyclLz8550X2CIr2
         weTyifdLwyPNj4dRpxGzxtKW7ee8ZDF10o8g3OPXVlbSLbByVvwkMguKr18wo8Cj5go5
         /JcSjKPaffK5v0/fHZtGaGw2ge+2yUqhCaKoaK0IW9MZKNhBeJLp+CUCDud8rogg4UFk
         TGU/AujYMmQRvw5qSR28NQtNAj6X8eTtDlvCmcP5ho5fnloOXB8urQ5+ZJik3sL7LR3O
         ZtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxUMjc90yl3jeH8qaqbo0xgrhsBj5vrqHMvDIzkfQr/gwUczof728KPZ0jK8i8EVNt9cBiUaBEBLGcG5fx/4653OQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyue7udNT9yf5kxsvVfUt/hOJduEvwXDXmBzvLAUOmVec26wPku
	HKuRCptHeqZoUmtIanOmySKZFjzuj5fw0qPVRCgGMb/iljRnMsp1XsfBCwZgiw==
X-Gm-Gg: ASbGncuTUBzHPwKQJMsm8mtHSa8NCK6SOYYdZna5tUhD792m7tVzsqfZMd4/+AxOj8Y
	2LSoJpC2/IIBNvgy6hEVkwlfFP+IhB2RsK9/HC2Ka/TYygRmumjsiGKFUj1BQFlg8eWXHsj3pDt
	76W9dX3SLYMmItyQYY4Afi9u4m3/17ZkhGmVeJFT1qABRtOkPewj2gyeWGGD0tX7u4+LPqKNT+V
	DGYU/4YR8Elyvm+o3ZHxO9dAhlnw0C0cqEeST+/LEfYgGmxHWrzuRnqjmz3mcwWJb/Yrpazuajr
	4WTC567qqb+3UFbyNnRQx1j6FAtWeRYC0Hd7psAZS8lEH/MFi8t+qSFIKNQ=
X-Google-Smtp-Source: AGHT+IFAk464oSNPl02SYWBz+Mjmai38ED0SkN0U+nSt2sm3VREOG4CaxtB0VuXGD2pN5ME7bkxmWg==
X-Received: by 2002:a05:6000:400f:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a35c808b3dmr26432034f8f.11.1747998079072;
        Fri, 23 May 2025 04:01:19 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99absm134116625e9.37.2025.05.23.04.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:01:18 -0700 (PDT)
Message-ID: <f1ce3088-bd96-4d2a-a43e-afb84ca25906@gmail.com>
Date: Fri, 23 May 2025 13:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] crash: fix reproducibility
To: kelefa.sane@smile.fr, openembedded-devel@lists.openembedded.org
References: <20250523083021.7368-1-kelefa.sane@smile.fr>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250523083021.7368-1-kelefa.sane@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 11:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117607

On 5/23/25 10:30, kelefa.sane via lists.openembedded.org wrote:
> From: Kéléfa Sané <kelefa.sane@smile.fr>
>
> Fix reproducibility issue by retrieving the compiler version from the CC
> env variable, which define the compiler used in the build and not from
> the native gcc compiler install in the host machine.
>
> Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
> ---
>  meta-oe/conf/include/non-repro-meta-oe.inc    |  3 --
>  meta-oe/recipes-kernel/crash/crash.inc        |  1 +
>  ...e-CC-env-var-to-get-compiler-version.patch | 48 +++++++++++++++++++
>  3 files changed, 49 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
>
> diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
> index 894d7f330a..ae4fb1d194 100755
> --- a/meta-oe/conf/include/non-repro-meta-oe.inc
> +++ b/meta-oe/conf/include/non-repro-meta-oe.inc
> @@ -7,9 +7,6 @@ KNOWN_NON_REPRO_META_OE = " \
>      asio-ptest \
>      asio-src \
>      cpuid-doc \
> -    crash \
> -    crash-dbg \
> -    crash-src \
>      dhrystone \
>      dhrystone-dbg \
>      dhrystone-dev \
> diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
> index aef77be1a0..45fc9cd1fd 100644
> --- a/meta-oe/recipes-kernel/crash/crash.inc
> +++ b/meta-oe/recipes-kernel/crash/crash.inc
> @@ -27,6 +27,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
>             file://0003-Fix-build-failure-in-readline-lib.patch \
>             file://0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch \
>             file://0005-Fix-build-failure-on-32bit-machine-i686.patch \
> +           file://0001-Use-CC-env-var-to-get-compiler-version.patch \
>             "
>  SRCREV = "f13853cef53f5c5463a51021edbc81977e2b1405"
>  
> diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
> new file mode 100644
> index 0000000000..d51008886e
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
> @@ -0,0 +1,48 @@
> +From 31b789d1b21ed26315d08798d6044450e3545ddf Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
> +Date: Fri, 16 May 2025 16:18:28 +0200
> +Subject: [PATCH] Use CC env var to get compiler version
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The source file build_data.c generated at compilation time define a
> +variable compiler_version which is obtained by calling "gcc --version"
> +cmd. This call retrieve the native gcc compiler install on host build
> +machine but not necessarily the compiler use to build the project (ex:
> +cross compilation).
> +
> +The CC env variable commonly used in Makefile project define the
> +compiler to use at build, so this is the appropriate way to retrieve the
> +compiler version, when the CC env var is define.
> +
> +Upstream-Status: Submitted [https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/MIPWYZGF3EIC47FVNNYK77FI4ZJ3FHON/]
> +
> +Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
> +---
> + configure.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.c b/configure.c
> +index 4668c9a..a20e174 100644
> +--- a/configure.c
> ++++ b/configure.c
> +@@ -1362,7 +1362,17 @@ make_build_data(char *target)
> + 
> +         fp1 = popen("date", "r");
> +         fp2 = popen("id", "r");
> +-	fp3 = popen("gcc --version", "r");
> ++
> ++	const char *cc_env = getenv("CC");
> ++	if(NULL == cc_env) {
> ++		fp3 = popen("gcc --version", "r");
> ++	}
> ++	else {
> ++		char compiler_version_cmd[512];
> ++
> ++		snprintf(compiler_version_cmd, sizeof(compiler_version_cmd)-1, "%s --version", cc_env);
Minor note: no need for "-1". snprintf should take care of that - the
maximum number of bytes written includes the terminating \0.
> ++		fp3 = popen(compiler_version_cmd, "r");
> ++	}
> + 
> + 	if ((fp4 = fopen("build_data.c", "w")) == NULL) {
> + 		perror("build_data.c");
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117605): https://lists.openembedded.org/g/openembedded-devel/message/117605
> Mute This Topic: https://lists.openembedded.org/mt/113261963/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


