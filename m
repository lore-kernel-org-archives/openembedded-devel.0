Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94947CDE020
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 07:44:07 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13002.1763106243818155081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 23:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYGFFFbH;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so872267f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 23:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763106242; x=1763711042; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K+45YDVGo8i3xQyUAx0BEm4YPQ09m6aA7wJR9TNs0AM=;
        b=gYGFFFbHPKMz1TgvSWUFT/p481wgLGOEWdx//uKn0EcYa1+chVbXBLh7vWbBAKbpE6
         bGduTgrNVKN9utg4kotKY60Uu/f+iGfVE5hXa/LknS2yiiCM+XK3JazZVuBTUIJqF9Zs
         mOMPBCF8WLLk5mtcROyZbz7iqcC85zqn00DYIZmEbSheBQAfC7rkNTkdQbnkUX8txSp7
         1w53Q9sUwSvLldLycj9zaTPWIMUPyGxtc1Ae8FejbZOvY/PWHxBPzRjThBUKoQatRPEx
         eriYKZgXRSYa6sF3D+7//BU2iI8kjbCJEugkunsYAazIHDVo7EnEfeTfZ0W+qXKdyzqc
         0vsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763106242; x=1763711042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+45YDVGo8i3xQyUAx0BEm4YPQ09m6aA7wJR9TNs0AM=;
        b=MAdgzBsKY/6qaS9MQMXaKlOHN1C148prsnLi33GuPDI1xFt6VbTnv/YpBmj+HFcEWe
         RFH6lI9SVwIkaZWeojA3UPuk4XhYqOkqv0qklKYQ7GS1fbPx4YLjTaZ7e9NDie7Sov6e
         mj3r3gF/yj90b3o1fQIS22u9NpFOI3R+YL20wLDQlS1L/p9WC0T5qd2gBcBg6B/DxXg6
         wN9c1bitLCq2snrqbju3P4koudhNUhSi3ijc8QI5Tburt4zv0NYOXRrpoDCycQ2q6tbS
         C9R7feBKJ0ZlM2EKT6FMsCtmjFYvFzJ+upgHnz+cjlfTX4BPWc15oqligX96eCwsyPd2
         Gxbg==
X-Forwarded-Encrypted: i=1; AJvYcCVb/7I9Rx9u2rVeQFwu7q2T51RvF7w/kVV7nBJmI4K2YBVNndMrGac34rAOGGhIdx5pRQ1fGlPSU+BKuF8a5prKav8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YygMDzWwDtpCA/FVWmDVqBqaDPOVu9BOxdFYZwLSPKesVcR2vkp
	iXdyQ9NKjTFWgnJTNv8eq8A7Vnsf1aaQS14zlPDadzjthSvEw1JBJPmMreWA0Ctv
X-Gm-Gg: ASbGncvVXqdGsOpQ3VFQ+qykJQrlsH5m4weKcxsytxzyybFeAEsF3nQU/6gaoWjTDEi
	n+XmdEEZiIMPcxMgdkGKvXkleBs+eQ3VLh6gI7saGs4lucYCVAPyIgKTKwU426ywcMXtVhFVDeI
	xmKRANJYnIq04F7Jy73Gaxmsr5DV6L8TH1tgjqUrHUeq6ZhGXeENDH85zVRA3tJmy8YSJ/nR8tH
	TpjTSS36pHumwJnfmCfpp3ZEKfsPGshhrvnteDtAFUf+BSTU9REi2q+OWWzYmGP2oJatnX3ayPb
	i6BYHH6GX/hkXHa8PfuB1e1AL/ANe+JGrrDbzLNsdORzJfIVWluB7Tia8hBw39JoPhlcXAUFH7b
	NKrNjhnmSRHLJoIGRH3PlEsMZJoYtz/t97JUJJWnP+hN9YJapB/gKjIncIBAr8JeEPQsskxZ78s
	cq9hfOPFR2
X-Google-Smtp-Source: AGHT+IGrjX+zeD5yS9aUQyvSWAeFF7tdAORsbzDWUeLOWwCMRsRn4XeL2//LUD0jIVYtZf9yff02bA==
X-Received: by 2002:a05:6000:1846:b0:42b:41dc:1b5f with SMTP id ffacd0b85a97d-42b593742b1mr1437222f8f.32.1763106242079;
        Thu, 13 Nov 2025 23:44:02 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b57asm8549962f8f.27.2025.11.13.23.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 23:44:01 -0800 (PST)
Message-ID: <ea2ee27f-989f-49d3-b810-ed3e79611f02@gmail.com>
Date: Fri, 14 Nov 2025 08:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] audiofile: Fix build with clang++
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20251114013528.108047-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251114013528.108047-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121689

Works on my machine, lgtm

On 11/14/25 02:35, Khem Raj wrote:
> When tests are enabled additional C++ code is compiled and clang does
> not like the code.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../audiofile/audiofile_0.3.6.bb              |  1 +
>  ...test-sign.cpp-Fix-C-narrowing-errors.patch | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch
>
> diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> index cc7fef2a26..6ebb54e261 100644
> --- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> +++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> @@ -19,6 +19,7 @@ SRC_URI = " \
>      file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
>      file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
>      file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
> +    file://0001-test-sign.cpp-Fix-C-narrowing-errors.patch \
>      file://test-for-CVE-2015-7747.patch \
>      file://CVE-2019-13147.patch \
>      file://CVE-2022-24599.patch \
> diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch
> new file mode 100644
> index 0000000000..83c573a873
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch
> @@ -0,0 +1,41 @@
> +From bed0eb57c3294bac1c743cbe4404168c1007287d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 13 Nov 2025 17:00:59 -0800
> +Subject: [PATCH] test/sign.cpp: Fix C++ narrowing errors
> +
> +The error is because -kMinInt32 is both overflowing and a narrowing conversion in a brace initializer.
> +Fix it by doing the negation in a wider type and explicitly casting to uint32_t in the initializer.
> +
> +Fixes
> +
> +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: error: non-constant-expression cannot be narrowed from type 'int32_t' (aka 'int') to 'uint32_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
> +  160 |         const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
> +      |                                              ^~~~~~~~~~
> +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: note: insert an explicit cast to silence this issue
> +  160 |         const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
> +      |                                              ^~~~~~~~~~
> +      |                                              static_cast<uint32_t>( )
> +../../sources/audiofile-0.3.6/test/Sign.cpp:160:39: warning: overflow in expression; result is -2'147'483'648 with type 'int32_t' (aka 'int') [-Winteger-overflow]
> +  160 |         const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
> +      |                                              ^~~~~~~~~~
> +1 warning and 1 error generated.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + test/Sign.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/test/Sign.cpp b/test/Sign.cpp
> +index c339514..0d80fe6 100644
> +--- a/test/Sign.cpp
> ++++ b/test/Sign.cpp
> +@@ -157,7 +157,7 @@ TEST_F(SignConversionTest, Int32)
> + 	AFframecount framesRead = afReadFrames(file, AF_DEFAULT_TRACK, readData, frameCount);
> + 	ASSERT_EQ(framesRead, frameCount);
> + 	afCloseFile(file);
> +-	const uint32_t expectedData[] = { 0, -kMinInt32, kMaxUInt32 };
> ++	const uint32_t expectedData[] = { 0, static_cast<uint32_t>(-static_cast<int64_t>(kMinInt32)), kMaxUInt32 };
> + 	for (int i=0; i<frameCount; i++)
> + 		EXPECT_EQ(readData[i], expectedData[i]);
> + }


