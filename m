Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44040106703F
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:38:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23268.1773326329208722625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTg5PGPl;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439fe4985efso959802f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773326327; x=1773931127; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yp1Twc1Skc3gyVrkNkDmV0JEkPAIbVyGUV/W1WpGiT4=;
        b=VTg5PGPlWoJf0v6lSxqMaysLMbix2YQrU2sIBfvSmJLoyhCx68w05WK1vsWT6ubNdz
         CKLcDLN3BLBBNcMTaRKDuaEWnLCyhKZZavdmlRY+zoDZb5XNMwk2tfWzI/KduxMMgd6J
         506+wDJkwVxlJJE1j/jcKEvE6maiiGH3AHBzYWtsU8vdXkyhVhw+9H6eFU/QVrj0l+mL
         hdmfIWCg9GXogIKUgE21xpKE/jRKcVUd+8v2TZtnPx4cZ4dB6cwVz45BVXwsalnAsmj/
         s7M4yk63+38NoyXT8Pofd8gv7QgI78+mIhQ7Q8ZucS0FbPFs5eqAoZmX96puaP1hVpj7
         r9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773326327; x=1773931127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp1Twc1Skc3gyVrkNkDmV0JEkPAIbVyGUV/W1WpGiT4=;
        b=iLyDxjn5/R/TewAOdufNY2xvjWobnoOkSDUfxrl2lTor4BcyAGM3PrdSdW/rimqwFW
         K7fdgBTtzDtO4kJgkaww4OtrHdX6Lu7rUuuHOMiOcvYHKwl+Q886u7RsxDTYIfSoKuwo
         XcCRi5JKq/BoUKFrByozrmVzB0yOZ7AM7/JidCAk1NHT99fcK9DQAcvCSY9Vc+puLrX2
         11BQecQJGvd+9+ibkqaSsiNxuUzx4AtTEUJKzWT2u4+39gNoSNyiPokU/TJ7Fvf4tW7G
         JeNYImTNWdLObrwkeXWeOgx/qxS6NaUmrdgJIBQJC5CGz69XB/WFZV3ODd/Z14eskngK
         GRPg==
X-Forwarded-Encrypted: i=1; AJvYcCWn19+zbUQZW5FnGEPdJrjnbqffE8a/AuZ6RWdDGSW/u/t23HA0cZp6UqmE0fR+nWAZwmpOmDOsGMVCyl/m6GsM7gc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqzjKDZrxdR5KsRZh+n9I266dkulR9nFjHRUPGZicigcu/4/P9
	4xKre40jpG9me9kBXWhm6/yY4J/5d1GP71Jt/E9nj1wxB1lbe3Swc4/Ql8klRA==
X-Gm-Gg: ATEYQzzXjudr5X47sR927x6iUiORcrx+mTHe6PwfhDWgikxpS5vPreWtYmMR+oK88sb
	mAPJBsxfsBrX57cCfwY8eK+OdfmAtQVTylpBH2/SX2znW/FlXjB6DBh+AoZF/9J3MWsst292iBo
	6B/nZVVTqnAxgquBKqmg6frfQ4hOWv0V0a/WYvvunqG8jT8TX70mtylbGSdkE1fFtGuZGthMF5S
	sLCaaqptaH/0n5mN0169RO+4b0AsB9OJZ7+FDq7RzMtd0UrFpAm3WSIKsGlCkHmdCW7ectbP44T
	cQwvcT2VORn3ZluSdZ/EEUoYh1nAFmmCoeNcOtWVyFrOpugO1lgLIfxjg8DY2X/UbYHQErTquo9
	cfaQQeDQIY2WfQ/PlagmaVyl+7B7FDNQ5d8ieYGa68rI8swNN3Pdj3rwjSRltt5s1R7UoOZaRL8
	FdPYCOerjJB0mBQ7fy0l8O4Iq4ooQYX9lLXsHryYliKg==
X-Received: by 2002:a05:6000:2401:b0:439:d750:431a with SMTP id ffacd0b85a97d-439f8424090mr13130771f8f.42.1773326327056;
        Thu, 12 Mar 2026 07:38:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm10691269f8f.27.2026.03.12.07.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 07:38:46 -0700 (PDT)
Message-ID: <a73a05cd-6dbd-4f06-8a73-9bdeca16a5b0@gmail.com>
Date: Thu, 12 Mar 2026 15:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 6/6] libcbor: upgrade 0.12.0 -> 0.13.0
To: andrej.kozemcak@siemens.com, openembedded-devel@lists.openembedded.org
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
 <20260312140501.29859-6-andrej.kozemcak@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260312140501.29859-6-andrej.kozemcak@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125172

On 3/12/26 15:05, Andrej Kozemcak via lists.openembedded.org wrote:
> Changelog:
>   https://github.com/PJK/libcbor/releases/tag/v0.13.0
>
>   Changed:
>     - Fix small typo in release script
>     - Fix failing 32 bit tests due to cmocka macro repeating stack pushes
>     - Set cmake_minimum_required to 3.5
>     - Fix float_ctrl ctrl assertions failing in debug mode
>     - Check in vscode setup
>     - Add CBOR sequences example
>     - Add riscv64 config to CircleCI
>     - Add a test for malformed definite maps
>     - Add [[nodiscard]] support and auto-update to C23 in cmake
>     - Configure ctest on to export the test results to CircleCI
>     - Revamp the introduction doc into a more useful crash course
>     - Add OSX asan/lsan supression config
>     - Add cbor_copy_definite
>     - Improve handling and coverage reporting of exhaustive enum switches
>     - Add references to readme
>     - Update python deps and related docs
>     - Link tutorial in readme (and fix embedded RST formatting)
>     - Add a doc note on lto linking
>     - Add a doc for the reference count in cbor_array_set().
>     - Add gh link to docs
>     - Add #355 to changelog
>     - Bump version to 0.13.0
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../libcbor/{libcbor_0.12.0.bb => libcbor_0.13.0.bb}         | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-extended/libcbor/{libcbor_0.12.0.bb => libcbor_0.13.0.bb} (77%)
>
> diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
> similarity index 77%
> rename from meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> rename to meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
> index fa48d23bde..3bed8a6e72 100755
> --- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> +++ b/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
> @@ -4,10 +4,9 @@ DESCRIPTION = "C library for parsing and generating CBOR, the general-purpose sc
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
>  
> -SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master \
> -        file://0001-allow-build-with-cmake-4.patch"

Please also delete the patch file itself

> +SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master;tag=v${PV}"
>  
> -SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
> +SRCREV = "9826a4315116a588f7416912db9da6fcecd8da11"
>  
>  inherit cmake
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125171): https://lists.openembedded.org/g/openembedded-devel/message/125171
> Mute This Topic: https://lists.openembedded.org/mt/118279372/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


