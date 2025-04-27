Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF61C369D3
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:40:27 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.23787.1745746824109638998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ke7iH2X0;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso7139287a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745746822; x=1746351622; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vPhUuTtxXH/smxVAhlmZZvJhy6A08V8Fq0tVCowj41k=;
        b=Ke7iH2X0dEnE6pG3aC0F5DPdeYZeqIf4wa4nSvKYVDe1RDOhNnktapGvKg6r4pudwT
         wHiuC3r957CGHE+SCKmePFQKlyTUzEJqna4D/1aKOCzhXIwBilipFR4IPD8QWmG+E+oh
         hRlFvSMUcqNU2OM1cRr2dUfbsOFv6Zr4+RdS1++wLxtGDw21vQx03i4s7vuqxMQaOKhZ
         PcJYQQ+XmQLI4wAwc5yNWgyhZSrZwPiNIq4qXm6gmv+YthXRFrAcR2Q79djmeZlAi1k6
         UIpgDry8z33+CyvEKAdzWvE2iLrnmevAg9a+KHpNMPcblSg0zU7n+a9Ratv8PkDsNIcb
         Cjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746822; x=1746351622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPhUuTtxXH/smxVAhlmZZvJhy6A08V8Fq0tVCowj41k=;
        b=L2ZmoTKvI8sGnvWNd4RmZOqzbp+vm5OGHQ8sKy0t4b54LfQQY1gA0nwXh+SudpRGco
         VYP9DzRsMh8m/ZgE16AhA+jusfLNxhkoDQgGK3vFZ+YrtSgC4VQ11Nmm1N+lUssHceUg
         ExQRQtJerCDv4OuefP4XYB+WAwh1NJHlh2zvzZfgFxsXo8CeOsqNV07lmWpliQhEbONF
         HQFZZycdv4Kc6nYGDYqJkNapmNKZHcOHmdRxlM7hg1nU9pMNwqEnqNJlIdJu5vTNOR/Y
         ypE+vgC6gl1QdxCSyUMa46Q9Cha08rXze4EfeaJc/OXHLHjtL1Huv2Qv1XDY7pb9eg3q
         KLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVrRQ2RJ9IyJidGPjVvUQPjckkbjYm4Jpk+1GCuK/6eNNx3ZtKoI5bk1mizH8mvOnv/qVAWPsrVzFpAOpONGLMwdBU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsQDRzNiU8UHVKdUv5xCZxl58FFzTce9iLQpB79KJMnWgsFP2E
	c8+FcRnThj/qwVQ+Z3fuaqg0BI4zIVoiyOVjTuRSjOp5UxnPyJ1ozp/gHw==
X-Gm-Gg: ASbGncurfpI4dg1D+At8MQS7phMUzxCU/HlGLGS4m1TZsFGp/QEafScXTMERsmWwXPa
	/vO5NuRAAwW+XAPB8hm6MuedI4lCXH0WC+aOam6Paek9qkw7i1s8cU2fP8zc3R6UGdFu9hS0oTC
	AGpXkeCMQ5/5+Y5n5BQEOYi47LR51xi7LrnftNPr839oRDu16OrxIBsOXa6wUfr9SEPIAjc/NJo
	JfFOnItEn0Mkwsrq9inVrTyCE/AqGcZsdvqkOdmeNVHmRaQUBN43DKdtBJPzAwWoL0LWe+S75uV
	MCzzzxc7y8/xTA+UI72o1x0bO1JQbEK/36JQyFA99qWLjCBM
X-Google-Smtp-Source: AGHT+IGx0il8c/w1BpRhtVs04e6gALW59rbF6BPd7P63WqFYdUs+ly6cuoOdelB/nMvLJxBok1pDFw==
X-Received: by 2002:a17:907:1b0b:b0:ab3:2b85:5d5 with SMTP id a640c23a62f3a-ace84b260c3mr409926266b.49.1745746821776;
        Sun, 27 Apr 2025 02:40:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41a850sm418455566b.32.2025.04.27.02.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 02:40:21 -0700 (PDT)
Message-ID: <4cfa7d5a-1fdd-4b61-a6af-349dc97dd2a6@gmail.com>
Date: Sun, 27 Apr 2025 11:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nlohmann-json: Upgrade 3.11.3 -> 3.12.0
To: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250427091918.26541-1-mingli.yu@eng.windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250427091918.26541-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 09:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117167


On 4/27/25 11:19, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> License-Update:
> Copyright year updated to 2025
>
>  # ./run-ptest
> PASS: test-algorithms_cpp11
> PASS: test-allocator_cpp11
> PASS: test-alt-string_cpp11
> PASS: test-assert_macro_cpp11
> PASS: test-binary_formats_cpp11
> PASS: test-bjdata_cpp11
> PASS: test-bson_cpp11
> PASS: test-byte_container_with_subtype_cpp11
> PASS: test-capacity_cpp11
> PASS: test-cbor_cpp11
> PASS: test-class_const_iterator_cpp11
> PASS: test-class_iterator_cpp11
> PASS: test-class_lexer_cpp11
> PASS: test-class_parser_cpp11
> [snip]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../{nlohmann-json_3.11.3.bb => nlohmann-json_3.12.0.bb}  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.11.3.bb => nlohmann-json_3.12.0.bb} (81%)
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> similarity index 81%
> rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
> rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> index 194e80546e..0064a3e726 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> @@ -2,16 +2,16 @@ SUMMARY = "JSON for modern C++"
>  HOMEPAGE = "https://nlohmann.github.io/json/"
>  SECTION = "libs"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
> +LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=3b489645de9825cca5beeb9a7e18b6eb"
>  
>  CVE_PRODUCT = "json-for-modern-cpp"
>  
> -SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
> +SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;branch=master;protocol=https \
This seems to have 2 branches in the URI.
>             git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
>             file://run-ptest \
>  "
>  
> -SRCREV = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
> +SRCREV = "55f93686c01528224f448c19128836e7df245f72"
>  SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
>  
>  SRCREV_FORMAT .= "_json-test-data"
> @@ -25,7 +25,7 @@ EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_BuildTests=
>  # nlohmann-json is a header only C++ library, so the main package will be empty.
>  ALLOW_EMPTY:${PN} = "1"
>  RDEPENDS:${PN}-dev = ""
> -RDEPENDS:${PN}-ptest = "perl"
> +RDEPENDS:${PN}-ptest = "perl locale-base-de-de"
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117166): https://lists.openembedded.org/g/openembedded-devel/message/117166
> Mute This Topic: https://lists.openembedded.org/mt/112480376/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


