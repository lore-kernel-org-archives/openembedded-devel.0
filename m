Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA1C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 15:02:24 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.21277.1751986940729697642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 08:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=StW5N0bq;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso7468802a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 08:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986939; x=1752591739; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQlb1gtevnFDZNCWytEgsOiP+tX8az2MgXv2B3EEE1s=;
        b=StW5N0bqK0fg5zeDBMhXCTCvjesK+0E0QWO8jdfMcthcoirZqzrYG24wYt9suzhNOF
         w3rhR4kpo1Yhbq7CRurfvBRGgoCvYqLNI8A785QxFr/6U3d5gsfXolgbh8CeFQxxFBBT
         sHTegTBKEN4lfby6VeFOqdHmpJr2u2jDqQxDSxEcB87gCLLelIDbhjA/V40a3emGYD0Z
         fa6004pReob1r+E5qwqyzpoBA4qD9jQqvxXr2bareLwUX+YzgeWroAiOZvtc8gqVi+he
         M89txKBCs33yqPR/DaGtnx1aEzCxFdc0r0KQbWrvyhSDuYcjXB2tOQPwbIdOJqvSIJlZ
         xRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986939; x=1752591739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQlb1gtevnFDZNCWytEgsOiP+tX8az2MgXv2B3EEE1s=;
        b=AQSMnj4rJvtQVyqNiM+7C/hQ+V5FFic/GpOWHdAFnMZ5v2+AFObzc1+qP6U8U4EzLV
         t/Qk1G/AXyYDkkB9JIMfOtQwbZEsZS5B+wYFPDfNUStsuFm5lBpTAPhAVDAGHbJ6zr8q
         AO0om9iuKLBjSEiKe7MG2KoVpqYcQW2FeGuALAR9BUVgwOVV33CSpLpWXSGrcbWghCmd
         ebhvEcH9O5wwLzfk3GWLp6Knd7lQhR2I8UlX8sUV7X+Tr3l8aqJuPkYNbOakgeLcu0pU
         dzSWqTsi62TDC4A8IGGatFLutPQb9VQTeMUwiD8my6GS7BRe5JaH0iZW4K7FtEgOI8hB
         4+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWmjXJlkA4TQzcj6jIqOOqUAikIDc7PZ/FSM6mbfJaKdudZ5EcYV3XpfULnK6sav0vIefiUbLdU7RRqXtLf7tQHI44=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfWGhXebS1eCUA44Ub+stkqiTau/HoKe+xamsWBqhkx7EZswvN
	Zb/0UbgHPmhtwv1DzCu+dmV4r1cRIrwMkSIHci0YMBq1BUZdLgsie19beWSqzVBf
X-Gm-Gg: ASbGncvqcafYzXlani6mSTitybN3aq8a1lRJPbz3LM0svgxdOz09zN98rRYXCkMD7SS
	A83fYJc3paynge/toRA9zDUn7eqzaqf+VYl3CfRxf51TbUwaexgK1IOSZlJ9ReTWefEr5jv0Cd8
	ZnofR7eLi3h15n0h5BWvvUOhJ5Kpr03HxC2Kr2addTZbpxdK3Hm6Ze5l3SXZXI1Ob1S6sajivbW
	mPDw+ZRT3fdGXTV4K0mmxBXUCVZaQBLFqGQ5hqThiGmR5VA/yGLBscmpZ3zUnRhyRnMuyS8hvo7
	SxV4T7A1PUp81urUuxkeyyI7noSwSyw/J365wdjlKWvVXOdDjKcglbbmxGw6qGv20YrA0Q==
X-Google-Smtp-Source: AGHT+IHQR+u2KXzDFZgIn+2hFYEEiIzVf19OhHKxQMavF8w5n/oIp8+nypAWqjtCxiQrDHQhdiQy3w==
X-Received: by 2002:a17:907:3f87:b0:ae0:ad8c:a559 with SMTP id a640c23a62f3a-ae3fbc8c443mr1804556366b.4.1751986936999;
        Tue, 08 Jul 2025 08:02:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5f50sm922328766b.95.2025.07.08.08.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 08:02:16 -0700 (PDT)
Message-ID: <ab8e1f31-369f-4bf5-b208-dcc150612dd9@gmail.com>
Date: Tue, 8 Jul 2025 17:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] cpp-argparse: added recipe
To: yishai1999@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250708144800.286647-1-yishai1999@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250708144800.286647-1-yishai1999@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 15:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118314

On 7/8/25 16:48, Yishai Jaffe via lists.openembedded.org wrote:
> Added recipe for C++ argparse library
>
> Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
> ---
>  .../cpp-argparse/cpp-argparse_3.2.bb              | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
>
> diff --git a/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb b/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
> new file mode 100644
> index 0000000000..5d7965149f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Argument Parser for Modern C++"
> +HOMEPAGE = "https://github.com/p-ranav/argparse"
> +BUGTRACKER = "https://github.com/p-ranav/argparse/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4f3ed9ec2c801700ac8fda1fcd29a330"
> +
> +SRCREV = "3eda91b2e1ce7d569f84ba295507c4cd8fd96910"
> +SRC_URI = "git://github.com/p-ranav/argparse.git;branch=master;protocol=https"

Could you add ";tag=v${PV}` to the SRC_URI? That will allow bitbake
check the revision against the tag.

> +
> +S = "${WORKDIR}/git"

This generates a fatal error using the latest master oe-core. You should
be able to remove the "S" assignment altogether.

> +
> +inherit cmake
> +EXTRA_OECMAKE = "-DARGPARSE_BUILD_TESTS=OFF"
> +
> +BBCLASSEXTEND = "native nativesdk"
>


