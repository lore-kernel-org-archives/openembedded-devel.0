Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5063BF4BB86
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 20:13:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29695.1771964008658509063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 12:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NtciBdZc;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436e87589e8so5701806f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 12:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771964007; x=1772568807; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tEfpMfe+zCTALfmrQOgO3aV1miDLkj3d0kctPZbx8vE=;
        b=NtciBdZcdW3i+X2TYjatPLYoqlcsrBSCNxTIm1OLAT/4+2xgqnr6Ym6OPN1PdMCw7Y
         Tr7FazTJq0H/X9ciFhiwwcRDN/6MmOJ0fr7Sd/CEQb6f1v77P7HCf95nkF1Kt1fqwuw2
         Zdgb+7xicXP/ODzGF9OfqkTpi6UPFJkNhLIRfZ7e7w8G5b+FUhCLOOwU5j7rnE+kdbQu
         fjxUmgb8iDiA5GdxKQSjmFD7OyIJTDfGQsURh7mX9DIy/Enlwpu6cQYrL6Qtzlvsxyxj
         w7k9RCnl0K3+poMIzQ+DQKQyScJ0h6Q/4/X2rFBRiVxAv2ORk4nzczmmV8quIryGBN6P
         zh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771964007; x=1772568807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEfpMfe+zCTALfmrQOgO3aV1miDLkj3d0kctPZbx8vE=;
        b=Wfj8Mf9sYM+49J6+zwPgGeenhCIgTiiA1TrHp4886yDwA4gNSx6ECdoJaByqYDOux6
         HmrEQSqBlDxMH7hbdVItx3z5NUdVA+2gaA7UUzcz5gKxD7yYQdeDuA5yF3soQo8ueYCU
         DEc0uiGN17P068mnye3QXZqvK1fseyZFytM3yTSsdKCi9o/czGG4ywxXoa3DIOJO3NyD
         +jp+m4i0p3aJSr8sU609TejMujLCFT4RsjfPwqgzCrlTOPyNok0Ff9mjzU/EL2cjbyZU
         H2lYWCT1qbdq6Iwf+hdf1SBVKPb4DfjjGCwoQhiFz4Amc1NkfCFhHfOVjrhloGUOxYcL
         xqfg==
X-Forwarded-Encrypted: i=1; AJvYcCXuCSSiuKOT9OEscwCwO4nY9vMufeK6uDQyH07bFu21QqgNVuuhdMAwPvhv4GxU+Nueeuri6f5VUhcLBUozqbZlKSA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZ6B75znkLZ2vT98arRxz6QsQh7NGyi1ZnaoMnryogozVqln3U
	pH5V26zm9zVrwnN1DyvpN7Nu1yxCHkXEBdlMhV5fLHZRqA/sToufHTMI
X-Gm-Gg: ATEYQzyiyIwM/UxlXVzD4f7oTvAjfNZVDctpWopYfnY/our9SlQRj/3F3X54TbGEoWo
	IdGkcB/E+j5Sl2oZ+Lehb8lEyftPKAGGx14UuNtM5w9eYUnWy4qc9vLe0+by6xZcRdZj8bEWAYp
	r1hLTg9TNehbACqEYIL8CcGtACiNihfDESsAzgCrfjeaiQZdcsl2YhdxbL2zzPWugcmabogkpbj
	1F7gnezeaT/qGJ/gaXjfL72fyzgJkXzTnTITDJfZgv844REdfUnGJo+BKFJTibVFIs3md8xZo1F
	4DqET4HpxpvwGwOkDGK90dwt9Y/g3OkV++Mz4/V1GgGjjDcaRRU+OVjej+OwGtZ8q/tnoyYBWuo
	ka9u9UxlUXZl/vUgQ6c/WXM1NAUQb+EByg7LBLo7JT9gSoxslJGgbcjxO90pkjy/WpPpVFuWMCL
	qTFKjJ4JXWckDfmVSATv1Rrjg1oIDEvkTVWf5oxskYNw==
X-Received: by 2002:a05:6000:2c0d:b0:436:37a1:db58 with SMTP id ffacd0b85a97d-4396f18a6aemr24252967f8f.59.1771964006742;
        Tue, 24 Feb 2026 12:13:26 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm30673376f8f.22.2026.02.24.12.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 12:13:26 -0800 (PST)
Message-ID: <cef486ef-9e0e-4f3d-b2a7-18adf825dac7@gmail.com>
Date: Tue, 24 Feb 2026 21:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dtschema: new package
To: bartosz.golaszewski@oss.qualcomm.com, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org
References: <20260223101102.92124-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260223101102.92124-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 20:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124599

This patch doesn't look correct, I think maybe some changes weren't
committed?

At first I wanted to check if it really needs no dependencies, but ->

1. do_fetch fails due to checksum mismatch
2. After fixing that, it fails due to license checksum mismatch
3. After fixing that do_compile fails

On 2/23/26 11:11, Bartosz Golaszewski via lists.openembedded.org wrote:
> Add a recipe for the dtschema package - a python package and a set of
> command-line tools for validating linux kernel devicetree sources.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb
>
> diff --git a/meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb b/meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb
> new file mode 100644
> index 0000000000..c763aea2bd
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "The dtschema module contains tools and schema data for Devicetree schema validation using the json-schema vocabulary."
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +SRC_URI[sha256sum] = "31a4927b8dfbb5c97edfc9569cda3b6737bbfd8430881e8cc48a0b088ced6147"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124545): https://lists.openembedded.org/g/openembedded-devel/message/124545
> Mute This Topic: https://lists.openembedded.org/mt/117955058/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


