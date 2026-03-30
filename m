Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488F6FF4959
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 07:44:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46171.1774856657071347711
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 00:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MTZYOinA;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso880648f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856655; x=1775461455; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57s2rhi2sRs6NLFkB2JWeQFCNVQccBayg7sGkIM/1c4=;
        b=MTZYOinA5pJtxzsDKDIg9n2F5qqARmsjS5dLA5l32D/pO4hy8E6umCqcx7lDRdYY9J
         0pXSakdkqTCYFHM8zWit/l4a+CiwwR6sbN//nYgoNk68S5fzbrUHMoDoQa3vxjaOmwws
         uz388l701yQmPPijj4WuGe1+PTBsZdtAkAo8GukbgRk3Ksjzgo+rGlLkNK5Rel7e5Llw
         m2LrGkO4mAFG+o56L+a7G8jHAl5ncm6opyZxQOmd4o3AVWTpg3DIaAcBNkXXfa/2TeyM
         utdNvrDSEkkeyyhaH2TaS6lDN/drzgOOcp/DDzC0F+5qlXf55S3K24q+z8oIjlrx4MSD
         Qk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856655; x=1775461455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57s2rhi2sRs6NLFkB2JWeQFCNVQccBayg7sGkIM/1c4=;
        b=RVs3mSE3GwExbAhOjtIeT9XRnIHbqXH/ErfuUGsPdZHM+sRDBlv1IIg3Ssq+sQYpmj
         5PcK2BSiS1vZtdps3cDloYaZ8+SL9w+kpnYJLjE8UC+hXXZijZQ8aOm3+SeKyNYgLPZh
         yZ4Du9kWyVxGCD7au0u9astTdyiaa+X95pGdMFT003MCs1dW5Xxmc70CvazMSLU4kvIF
         dIDVXQp3SJaI+CZaVerimUfbGmtMGfFcuG0tcC1xrrXjswX+un3e54jarjzzsM9xoIBV
         e8vE1sE2NeFWVS9Z8cMZo1YLLLEjcUG/3LbRgfaJ0mLZVLzRwEuFfGv9cJVV7/fV/O03
         EarA==
X-Forwarded-Encrypted: i=1; AJvYcCVJk/EsMFznqAteZUjV/ioBClj6zt/K12T+zXgJ/mhBSGxPeOVRO87Q4EUxxDSeKkqtFxKAF1EbpJkyIZ0qgvs0zH4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCJddDHgQTWOmE7xdrXSuTsB7xhWR8Lc44G35GgVp9rMqzdjOU
	Zx7u63jHNn4uyI8FNBGgqs2/Bpgm0QLK7FIfBnE6JgtchRKaiXY1Czyw
X-Gm-Gg: ATEYQzzXcsRiCKJuWO3BQ9UthHo5Qx1VNf11cl7I2DbpeLRo4YhkLAUuIpRPlgKS6Nx
	o18rcnoObXbJwu4ppmn3nZcMxH6ebTam+kVJf749ObAUiZ2Upe6+ExJmiQdpxgvjkwgzVaR7JzB
	c4PtL7ZXs/O1HPTQK3tZrqNepqA5keKN23E6O/eKqI8CXYvo6h+/3j+KRqxmWKNFkxWbdAJv1vd
	/GiS+/sXEYGA36bBYw3a//T0GTAIU5EsA7epfhKe1mtQZMjci5erlGgKUpjeKZD7ezMJfVOvzmT
	YscAS7I64HU0pRLO7gi3ZGDTJiExbLZotcK/wmDWQWFdBmiqDW2woU1Hfb4ThjHNwGNJeH6vTcw
	US0aAb3KbT18V0OlJsWk8RqtA4WoY2JZJZwwiwUWmnzvWSL6gCNw8/6KbCWknuFSG+NLbT9/+nu
	XLF8lNKXB4dKaTWbmLgBtF89oT2OZdQnY=
X-Received: by 2002:a5d:5f87:0:b0:43b:9c02:50ca with SMTP id ffacd0b85a97d-43b9e9d93a5mr18546381f8f.4.1774856655222;
        Mon, 30 Mar 2026 00:44:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f87esm16313199f8f.22.2026.03.30.00.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:44:14 -0700 (PDT)
Message-ID: <5fd5bee4-3884-44f4-bfee-c7bb30ce5b7f@gmail.com>
Date: Mon, 30 Mar 2026 09:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH] python3-protobuf: ignore
 CVE-2024-7254
To: nmjain23@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
References: <20260330065150.2931505-1-naman.jain@partner.bmw.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260330065150.2931505-1-naman.jain@partner.bmw.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 07:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125835

Thanks for this - could you please also add the same to the protobuf
recipe in a separate patch?
(This and the protobuf recipe share the same CVE_PRODUCT, and once a CVE
is fixed in one recipe, the other recipe will show up in the weekly report)

On 3/30/26 08:51, Naman Jain via lists.openembedded.org wrote:
> From: Naman Jain <namanj1@kpit.com>
> 
> CVE-2024-7254 is a stack overflow vulnerability caused by unbounded
> recursion, specifically within the Java Protobuf Lite and Full runtimes
> (including Kotlin and JRuby bindings).
> 
> The python3-protobuf recipe builds the Python implementation using the
> C++ backend (--cpp_implementation). This implementation does not
> contain the vulnerable Java-specific parsing logic (such as
> DiscardUnknownFieldsParser or ArrayDecoders).
> 
> Authoritative security sources, including Red Hat and GitHub Advisory
> have confirmed that non-Java implementations
> (Python/C++) are not affected by this specific flaw.
> 
> Reference: https://access.redhat.com/security/cve/cve-2024-7254
> 
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
> index dbb30ad4df..52fea2ae6e 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
> @@ -14,6 +14,9 @@ SRC_URI[sha256sum] = "2e3427429c9cffebf259491be0af70189607f365c2f41c7c3764af6f33
>  
>  CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
>  
> +# CVE-2024-7254 is Java/ruby/kotlin specific and does not affect the Python/C++ implementation.
> +CVE_CHECK_IGNORE += "CVE-2024-7254"
> +
>  # http://errors.yoctoproject.org/Errors/Details/184715/
>  # Can't find required file: ../src/google/protobuf/descriptor.proto
>  CLEANBROKEN = "1"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125833): https://lists.openembedded.org/g/openembedded-devel/message/125833
> Mute This Topic: https://lists.openembedded.org/mt/118575124/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


