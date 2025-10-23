Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE4FCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:45:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.23212.1761230736075539091
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0My9PaG;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47109187c32so4712595e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230734; x=1761835534; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzGyiutHay6uQZAkMPCKGz5SyQcDx+aAZavbNRyJE0g=;
        b=I0My9PaGew4MT0p2vz58NprveshyUYS3aNV0R+zYLyTnem9MIhDvbiy5e3vOVIq5aQ
         /RXumPO7qfFD+r49Wdlamo8ffVRQOfwXxVrx6eESZf8nqEtvBhFcU4NJfvKeN7usJt75
         hVGFVLOf+2lhlKEgpcCSCAVLKThKFO3NhCea/Z88FwiHH+QpdeLdGl0g33TbS3Rvv4Ig
         imrjfTJpzE5435CTyVIgMwpeCMGNtKdLnw2LF4sbGsYcoU3X+97NEHW6BrZofswb1ucq
         D/yX7TRSDkvm9dA/4iQQPR8Ur3Pp643Mdh16dqI8S0hu2EM5bsalA4z6lk3UEnSdpCV1
         RUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230734; x=1761835534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzGyiutHay6uQZAkMPCKGz5SyQcDx+aAZavbNRyJE0g=;
        b=ZVkv6hWI9bswDbiUJhgcsG+cDJrB/+FdkBZFh43v8BJ80VKb1njwqixCu8L26i2a2a
         T0PcIRbC/hmpo5MRWYDx06fW1P9T11Oasf5G3Zyn7ASFuzA2Z6fJvwDcjnMJKuKejqIj
         +/cszssM5eXi1DULViHpboNKoYOoAWF3GCJwYNfnnS+qgJEf5+oqjYrF0v2teGmCPaMh
         63jSbeK7KXaqUZJdoqjPcdxvHOCMhqKFQPMfUfjs4lFrhJ27akx41d9IfBF+jBaksBfA
         SjeAyWtBahZ3Kr1FiHVlTk3WJlySmWJHKfF9XizuSIIbqhoRBU/QnO1bBQxawo4IKwov
         OQMw==
X-Gm-Message-State: AOJu0Yxd17g2gKuKMRUwndXA2hVsbN6Y1tbzgQHXwgh+MVB0JS3ILwhL
	vmsmkiGlVYyYnWYtCqkITOf87t43k8CkEHK5cOW2OGcnr/Cdd/Yj/FccBQsPjA==
X-Gm-Gg: ASbGncvYPTIPfS4fb4GcnJp6JKFEYmOpqajLEaW0HRwedGYNdFyAgezWrI4M+CH/xdI
	ZI5nIoRX6tTBNFEKyK+52Qfi2IVzTBNE8aNCHC+AGazEDL8FLxcyOxPa5tqdi3BThrIcmbVBIf1
	cD9Ltl8Hj1YwwjFIlnj4oujUXNL3fcwKr0zusVvit3IPrPrC3cOAHVk7wU5MwyXX6PEDllzcxU5
	CXo9hlB3dPGYjmIKIwXJIcdIhWumEZxJFsjq4nyiHU8I1Knu7TcQ/8PW7B/g54BUudyURGFYjV8
	Q1msDE679McpZnrkB/xqTroCh55y0IVVdwKjMhFyrdTGa1Hybgg+HLYm9dypWyyRmOcWxSGYrkw
	wNdhD6pTuwz0HspM9Ozy+r2XPmzU9QmPe729kgt/Eo5nv73cB941CSTEpWNfKpKiGDEVqOXYuno
	G8R2YtHM4/ASxRM5FUrNw=
X-Google-Smtp-Source: AGHT+IHP4puuplaFNePk9HZ1PIuVm60UgUanddp6v6F8aJh4di104K3EhA+0+Ci762YDELp+lu75ZA==
X-Received: by 2002:a05:6000:4b10:b0:427:6a3:e72f with SMTP id ffacd0b85a97d-42706a3e74bmr13699084f8f.34.1761230734329;
        Thu, 23 Oct 2025 07:45:34 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ebf82sm4461329f8f.42.2025.10.23.07.45.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:45:33 -0700 (PDT)
Message-ID: <f5493dba-b081-4ce5-aeaf-a1a2dbc42a99@gmail.com>
Date: Thu, 23 Oct 2025 16:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] psqlodbc: fix a failing ptest
To: openembedded-devel@lists.openembedded.org
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <187125EE8B9DB18C.25104@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <187125EE8B9DB18C.25104@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 14:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120936

After this patch there are still 2 more failing tests (they were present
in the previous version also), and I'm kinda clueless at this moment...

On 10/23/25 16:43, Gyorgy Sarvari via lists.openembedded.org wrote:
> The descrec test fails currently, due to the different characterwidth
> postgres uses depending on the current locale.
>
> If the locale is C or posix, then each character is 1 byte. Otherwise,
> if it's some UTF8 locale, then it is 4 bytes.
>
> The test case expects 4 byte width by default, making it fail. This backported patch
> allows for both 4 and 1 byte characters to be tested successfully.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...xpected-output-file-for-descrec-test.patch | 72 +++++++++++++++++++
>  .../psqlodbc/psqlodbc_17.00.0006.bb           |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
>
> diff --git a/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch b/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
> new file mode 100644
> index 0000000000..af25b207c8
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
> @@ -0,0 +1,72 @@
> +From 453a8bdcaafde9fcd108a195ffea3ccb5c4d0a21 Mon Sep 17 00:00:00 2001
> +From: Christoph Berg <myon@debian.org>
> +Date: Mon, 16 Jun 2025 20:25:26 +0200
> +Subject: [PATCH] Add expected output file for descrec test in C locale (#131)
> +
> +When running with LC_ALL=C, SQL_DESC_OCTET_LENGTH matches the character
> +length. Add "10" as accepted value.
> +
> +The net diff to the existing descrec.out file is this:
> +
> + test/expected/descrec.out	2025-06-13 19:02:36.460302799 +0200
> + test/expected/descrec_2.out	2025-06-16 14:34:44.270543393 +0200
> + @@ -19,7 +19,7 @@
> +  -- Column 3 --
> +  SQL_DESC_NAME: col3
> +  SQL_DESC_TYPE: 12
> + -SQL_DESC_OCTET_LENGTH: 40
> + +SQL_DESC_OCTET_LENGTH: 10
> +  SQL_DESC_PRECISION: 0
> +  SQL_DESC_SCALE: 0
> +  SQL_DESC_NULLABLE: 0
> +
> +Fixes #51.
> +
> +Upstream-Status: Backport [https://github.com/postgresql-interfaces/psqlodbc/commit/453a8bdcaafde9fcd108a195ffea3ccb5c4d0a21]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +
> +---
> + test/expected/descrec_2.out | 34 ++++++++++++++++++++++++++++++++++
> + 1 file changed, 34 insertions(+)
> + create mode 100644 test/expected/descrec_2.out
> +
> +diff --git a/test/expected/descrec_2.out b/test/expected/descrec_2.out
> +new file mode 100644
> +index 0000000..6f61c49
> +--- /dev/null
> ++++ b/test/expected/descrec_2.out
> +@@ -0,0 +1,34 @@
> ++connected
> ++
> ++-- Column 1 --
> ++SQL_DESC_NAME: col1
> ++SQL_DESC_TYPE: 4
> ++SQL_DESC_OCTET_LENGTH: 0
> ++SQL_DESC_PRECISION: 0
> ++SQL_DESC_SCALE: 0
> ++SQL_DESC_NULLABLE: 0
> ++
> ++-- Column 2 --
> ++SQL_DESC_NAME: col2
> ++SQL_DESC_TYPE: 2
> ++SQL_DESC_OCTET_LENGTH: 6
> ++SQL_DESC_PRECISION: 4
> ++SQL_DESC_SCALE: 2
> ++SQL_DESC_NULLABLE: 1
> ++
> ++-- Column 3 --
> ++SQL_DESC_NAME: col3
> ++SQL_DESC_TYPE: 12
> ++SQL_DESC_OCTET_LENGTH: 10
> ++SQL_DESC_PRECISION: 0
> ++SQL_DESC_SCALE: 0
> ++SQL_DESC_NULLABLE: 0
> ++
> ++-- Column 4 --
> ++SQL_DESC_NAME: col4
> ++SQL_DESC_TYPE: -5
> ++SQL_DESC_OCTET_LENGTH: 8
> ++SQL_DESC_PRECISION: 0
> ++SQL_DESC_SCALE: 0
> ++SQL_DESC_NULLABLE: 0
> ++disconnecting
> diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
> index cead6789f4..2fbd8b78e4 100644
> --- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
> +++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
> @@ -24,6 +24,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
>      file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
>      file://psqlodbc-donot-use-the-hardcode-libdir.patch \
>      file://psqlodbc-fix-for-ptest-support.patch \
> +    file://add-expected-output-file-for-descrec-test.patch \
>      file://run-ptest \
>  "
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120935): https://lists.openembedded.org/g/openembedded-devel/message/120935
> Mute This Topic: https://lists.openembedded.org/mt/115911779/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


