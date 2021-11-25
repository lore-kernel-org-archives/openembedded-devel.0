Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C31C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:30:34 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.14763.1637861433773111074
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b3vkl3Ah;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id r5so5814608pgi.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=KMS0dZg1Uy9KnhNNrJHBdnCQ6Cp2Xi+BxO03YMyvie8=;
        b=b3vkl3AhwzWpej3vuweq8Q0Rf9yhX2YwRNPJUK/+mJ74HVvYnj2HhR/PW8TYaNO7db
         N/EXpfJxxcSN1j316A9LB/28ugxzgTNlMesjBjyVFh49Uf8n0MfkslSoJsKP8Hlz6v6b
         zZX45kgR822cKsjf/ZozOZ3HNgSIU/kkPoFIYa7TbFxBSAIs2mLqY0l0n/UHCc75ackG
         jljq+VmBKLUZkYoloPBuPYuDxX+Vix12eh3mOdjzdb4KiML2EFxAqmNyBEaFsCFFOZdH
         Sa1g11kmNf63/V7EI/PmXuPR2ei0hTVE3myQtRElrEI2fARcg2wr5VZ3TUx5A1nu08B/
         4Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=KMS0dZg1Uy9KnhNNrJHBdnCQ6Cp2Xi+BxO03YMyvie8=;
        b=OIAhCUlgt/5hXyB8SNp1GXk+9K+//PLUH2tDpPehNljo9ozvINFFofrAuMfuyIQxKO
         VZwXlrhN+X8q+c67KRMhNr/tvPhFG1GcEgVC3mcIv0r91U3hdwYfGWhqVP0RwUhAH8Gz
         S2OtLQ9AiQ47PV7eLYrIUOXKv9ThYSqntlw1UfI2waqHZoUrC3b8EI8quQP/R9LpF0CR
         RtyPr7oJnPa9QEeVED/RHuV9/9nsE0GSy693ai+zt++XU/v2Nd8Lh7zHIDzXTot0Rw/Z
         hVY5cx5zG2cJ602dVeVlxJ6AVdlFNQvqUOcWHeCR0Lm3LO3nEIHgiLyZ/aX4LTIQWPEc
         urDQ==
X-Gm-Message-State: AOAM532QwI6prJ6Bv2HUKbUNwPEJWLe8Jr0BX0cJAz8geGAONPDQjvP5
	5rKg6BKoGQtqYGMp07nPaxM=
X-Google-Smtp-Source: 
 ABdhPJy52ztUDnBVu+dikPN9KvUtYP93BJc1TDqPzZ4ZmPp+mIBBNr2FXq4xlb/Vleuc4ZW+NlLNDw==
X-Received: by 2002:a62:9215:0:b0:49f:e38b:d043 with SMTP id
 o21-20020a629215000000b0049fe38bd043mr15595757pfd.86.1637861433007;
        Thu, 25 Nov 2021 09:30:33 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c?
 ([2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c])
        by smtp.gmail.com with ESMTPSA id
 s19sm4574949pfu.104.2021.11.25.09.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:30:32 -0800 (PST)
Message-ID: <d13450e5-802a-70e7-cdab-bc6aefffc08d@gmail.com>
Date: Thu, 25 Nov 2021 09:30:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [oe] [meta-networking][PATCH 1/7] libtalloc: fix pyext_PATTERN
 for cross compilation
Content-Language: en-US
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20211125024450.143364-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 17:30:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94124



On 11/24/21 6:44 PM, Yi Zhao wrote:
> The pyext_PATTERN will add native arch as suffix when cross compiling.
> For example, on qemuarm64, it is expanded to:
> pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
> which will result in the incorrect library name.
> 
> root@qemuarm64:~# find /usr/lib -name \*talloc\*
> /usr/lib/pkgconfig/talloc.pc
> /usr/lib/pkgconfig/pytalloc-util.cpython-310-x86_64-linux-gnu.pc
> /usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2.3.3
> /usr/lib/libtalloc.so.2
> /usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2
> /usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so
> /usr/lib/libtalloc.so
> /usr/lib/libtalloc.so.2.3.3
> /usr/lib/python3.10/site-packages/talloc.cpython-310-x86_64-linux-gnu.so
> 
> Set pyext_PATTERN to '%s.so' to remove the suffix.
> After the patch:
> root@qemuarm64:~# find /usr/lib -name \*talloc\*
> /usr/lib/pkgconfig/talloc.pc
> /usr/lib/pkgconfig/pytalloc-util.pc
> /usr/lib/libpytalloc-util.so.2.3.3
> /usr/lib/libtalloc.so.2
> /usr/lib/libpytalloc-util.so.2
> /usr/lib/libpytalloc-util.so
> /usr/lib/libtalloc.so
> /usr/lib/libtalloc.so.2.3.3
> /usr/lib/python3.10/site-packages/talloc.so
> 

does it work well in multilib environment too ?

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   ...-pyext_PATTERN-for-cross-compilation.patch | 57 +++++++++++++++++++
>   .../libtalloc/libtalloc_2.3.3.bb              |  1 +
>   2 files changed, 58 insertions(+)
>   create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
> 
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
> new file mode 100644
> index 000000000..47ee4bb24
> --- /dev/null
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
> @@ -0,0 +1,57 @@
> +From b5eaeb7ed4e75012d2715f995e15a13850064f61 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Wed, 24 Nov 2021 13:33:35 +0800
> +Subject: [PATCH] Fix pyext_PATTERN for cross compilation
> +
> +The pyext_PATTERN will add native arch as suffix when cross compiling.
> +For example, on qemuarm64, it is expanded to:
> +pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
> +which will result in the incorrect library name.
> +
> +root@qemuarm64:~# find /usr/lib -name \*talloc\*
> +/usr/lib/pkgconfig/talloc.pc
> +/usr/lib/pkgconfig/pytalloc-util.cpython-310-x86_64-linux-gnu.pc
> +/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2.3.3
> +/usr/lib/libtalloc.so.2
> +/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2
> +/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so
> +/usr/lib/libtalloc.so
> +/usr/lib/libtalloc.so.2.3.3
> +/usr/lib/python3.10/site-packages/talloc.cpython-310-x86_64-linux-gnu.so
> +
> +Set pyext_PATTERN to '%s.so' to remove the suffix.
> +After the patch:
> +root@qemuarm64:~# find /usr/lib -name \*talloc\*
> +/usr/lib/pkgconfig/talloc.pc
> +/usr/lib/pkgconfig/pytalloc-util.pc
> +/usr/lib/libpytalloc-util.so.2.3.3
> +/usr/lib/libtalloc.so.2
> +/usr/lib/libpytalloc-util.so.2
> +/usr/lib/libpytalloc-util.so
> +/usr/lib/libtalloc.so
> +/usr/lib/libtalloc.so.2.3.3
> +/usr/lib/python3.10/site-packages/talloc.so
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + third_party/waf/waflib/Tools/python.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
> +index b1c8dd0..24faa31 100644
> +--- a/third_party/waf/waflib/Tools/python.py
> ++++ b/third_party/waf/waflib/Tools/python.py
> +@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
> + 	x = 'MACOSX_DEPLOYMENT_TARGET'
> + 	if dct[x]:
> + 		env[x] = conf.environ[x] = dct[x]
> +-	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
> ++	env.pyext_PATTERN = '%s.so'
> +
> +
> + 	# Try to get pythonX.Y-config
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
> index e6e2066a5..9b207609f 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
>   
>   SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
>              file://options-2.2.0.patch \
> +           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
>   "
>   SRC_URI[sha256sum] = "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94116): https://lists.openembedded.org/g/openembedded-devel/message/94116
> Mute This Topic: https://lists.openembedded.org/mt/87295464/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

