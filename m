Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25635C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 15:30:23 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.29703.1643297422568710464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 07:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bLcfbgoQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id z131so2537681pgz.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 07:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=PZ/ZdVACWg83yZc/gPq6yNX1OUzdkaUrpGx+hDHvapA=;
        b=bLcfbgoQzGmSX/5UsB6TtL1M47Jw2h7XNGjbjfZyMyA4k49KQrXHvkOn2zIRcQapb9
         hCNvLht5QJXu1GzKcE6lk9oCOne6K2RqMIV+bgmYBa3fFK3pTJyUEQS8kw7n2vQWFqn8
         lfo3mTW6fQGJeGRumgrrrY9w5EhdqFz4Nmvf2tqc0rYLhuGDGYUb6HTBOuF3j2/mrFDx
         5uj4StF+gShR1KR7rwPKMKgvO+HANlCmWLkBPvj0q2tmgpUQlmKAo37qTshfm4b6jqU+
         V9WIWL1bEY+L4I7HSUhxJ/UXo3GsL0m9EzoVHezxfYbhv8NtWqXNi5C2I7Oe7yKd13gR
         SoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PZ/ZdVACWg83yZc/gPq6yNX1OUzdkaUrpGx+hDHvapA=;
        b=J2S/9kU/5YGNSfgT+/CdA4/YTG16atQ7Ha3TcCU9Tz5WVfJGpIYFLnFa44G3aYMV51
         w2pSDBzr+8fw0oR++p4vFuhloAndfI0aFyXvmL/LqvXTJ/j+UlFp7cL+BdTuFUvKnc/o
         6RPCgLfXyxQ+MEr4mNpMECo9VCmW/ExG0Vs4FLiI6tZ+LCdmhzn2CW2Y72OtMR9Eg6EM
         1FzY73uSj4qhsPJJAsJ09swbDDoiDS4mmNnTC7zr05ZEP2vRaQim4YG+bGbYKu9r1ywI
         7yGMcO/rjlsQbG8oZ//Wqu7vdV5MjxGDCUswnXWaCyf9eDUeu1mKK8CgsThhfuZUAS1M
         qvnA==
X-Gm-Message-State: AOAM533ORwlEKfSEPR4BCkvbQbAIzoYmHDQW8xOWRJd545bcru8vBCHv
	TgCQ2ecnHyW2wRYfIAqzZes=
X-Google-Smtp-Source: 
 ABdhPJytev8o1H2CgOuurBZDE08deG/qEKOvbvVB7VSzw2cZME5JVfl9JqxaPaxHlxWkuiLox9p8vw==
X-Received: by 2002:a05:6a00:1a8f:: with SMTP id
 e15mr3804102pfv.38.1643297421992;
        Thu, 27 Jan 2022 07:30:21 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:5fd4:3341:c771:87a3?
 ([2601:202:4180:a5c0:5fd4:3341:c771:87a3])
        by smtp.gmail.com with ESMTPSA id
 f15sm5832430pfn.19.2022.01.27.07.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 07:30:21 -0800 (PST)
Message-ID: <a5a2a439-7816-46a1-542f-07d49faceeea@gmail.com>
Date: Thu, 27 Jan 2022 07:30:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH] CVE-2021-3466: polkit Local
 privilege escalation in pkexec due to incorrect handling of argument vector
Content-Language: en-US
To: Jeremy Puhlman <jpuhlman@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20220127001425.7392-1-jpuhlman@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220127001425.7392-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 15:30:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95122



On 1/26/22 16:14, Jeremy Puhlman wrote:
> Upstream-Status: Backport
> CVE: CVE-2021-3466
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   .../polkit/files/CVE-2021-4034.patch          | 71 +++++++++++++++++++
>   .../recipes-extended/polkit/polkit_0.116.bb   |  1 +
>   2 files changed, 72 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
>
> diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch b/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
> new file mode 100644
> index 000000000..294ada961
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
> @@ -0,0 +1,71 @@
> +From ed8b418f1341cf7fc576f6b17de5c6dd4017e034 Mon Sep 17 00:00:00 2001
> +From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
> +Date: Thu, 27 Jan 2022 00:01:27 +0000
> +Subject: [PATCH] CVE-2021-4034: Local privilege escalation in pkexec due to
> + incorrect handling of argument vector
> +
> +Upstream-Status: Backport https://gitlab.freedesktop.org/polkit/polkit/-/commit/a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
The patch itself needs to contain this additional information. Please add:

CVE: CVE-2021-xxxx
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>

> +---
> + src/programs/pkcheck.c |  6 ++++++
> + src/programs/pkexec.c  | 21 ++++++++++++++++++++-
> + 2 files changed, 26 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/programs/pkcheck.c b/src/programs/pkcheck.c
> +index f1bb4e1..aff4f60 100644
> +--- a/src/programs/pkcheck.c
> ++++ b/src/programs/pkcheck.c
> +@@ -363,6 +363,12 @@ main (int argc, char *argv[])
> +   local_agent_handle = NULL;
> +   ret = 126;
> +
> ++  if (argc < 1)
> ++    {
> ++      help();
> ++      exit(1);
> ++    }
> ++
> +   /* Disable remote file access from GIO. */
> +   setenv ("GIO_USE_VFS", "local", 1);
> +
> +diff --git a/src/programs/pkexec.c b/src/programs/pkexec.c
> +index 7698c5c..3ff4c58 100644
> +--- a/src/programs/pkexec.c
> ++++ b/src/programs/pkexec.c
> +@@ -488,6 +488,17 @@ main (int argc, char *argv[])
> +   pid_t pid_of_caller;
> +   gpointer local_agent_handle;
> +
> ++
> ++  /*
> ++   * If 'pkexec' is called wrong, just show help and bail out.
> ++   */
> ++  if (argc<1)
> ++    {
> ++      clearenv();
> ++      usage(argc, argv);
> ++      exit(1);
> ++    }
> ++
> +   ret = 127;
> +   authority = NULL;
> +   subject = NULL;
> +@@ -636,7 +647,15 @@ main (int argc, char *argv[])
> +           goto out;
> +         }
> +       g_free (path);
> +-      argv[n] = path = s;
> ++      path = s;
> ++
> ++      /* argc<2 and pkexec runs just shell, argv is guaranteed to be null-terminated.
> ++       * /-less shell shouldn't happen, but let's be defensive and don't write to null-termination
> ++       */
> ++      if (argv[n] != NULL)
> ++      {
> ++        argv[n] = path;
> ++      }
> +     }
> +   if (access (path, F_OK) != 0)
> +     {
> +--
> +2.26.2
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> index ad1973b13..77288b008 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> @@ -25,6 +25,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
>   SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
>              file://0003-make-netgroup-support-optional.patch \
> +           file://CVE-2021-4034.patch \
>              "
>   SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
>   SRC_URI[sha256sum] = "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95110): https://lists.openembedded.org/g/openembedded-devel/message/95110
> Mute This Topic: https://lists.openembedded.org/mt/88710808/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


