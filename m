Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5F5D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 07:25:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10222.1765351518808172681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 23:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G6DJ5eWi;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so2621036f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 23:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765351517; x=1765956317; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NdzGs+pxI7qg1uewYi9lFlBF3VCNosB/014TtNkbok=;
        b=G6DJ5eWismtFD2QbVmXTjKzT1zOPRPHuKcDbjH6DzhU/K2UNAgxds+b13ItWS7eaHB
         +MPEDFcSo3uYl8oAqqikiUuaH9wIyxGjQIgJ00UU81cLRDVFfmZbzQ65o53ncBuz67nZ
         6qShrh7eaJAf0wV747DB4pGrS4MDWxlqyuR/ma5bJ2JsKMl1KQAK41sIyEYChMTiTnlM
         1fFvJzROl41Zbj4JsrIw7gbYkzoUXihdODYgCywipWFQiNypSrgyr3HHVh/5RO4K0auf
         1r9Tea6ZEmh0N2BrZHb7TqXsgb+D56g+TevgUACxaHZPwZEYzxxQ8iR3cgl16r78XDUQ
         6EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765351517; x=1765956317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NdzGs+pxI7qg1uewYi9lFlBF3VCNosB/014TtNkbok=;
        b=CGRfJN4IwCX34TrfgGJ6o3VYSckylqPkZnhWR9zTIhilGjN3nT8hF1jsoKkwo9CAIn
         0ZVG7W1j2aj5LpavO2SzFPOyHlk6AMfEwtbHZWLPMOI/ho1eets2j5UcSoggLcPNPdjV
         RHud56rFepTyv1+SswIgG5TwG8UdNSkQBpYpd/CFdpk0NvOamkqWQ/XRlRNMQMtU6NjY
         KYp81JDGXFxpbyx237VvS+hZY3mBCPfspDfhxim/aIX8Yp/BZdyIUKlnEHuhqGbk7H6t
         kgCNUypUgmE5s1AvBOt9AIR9YEJ7Icp1iLZTZv8ddXUmEE1/SArwumMrQwdqPnvqH81u
         Dd3A==
X-Forwarded-Encrypted: i=1; AJvYcCVMP5oqjbHV1k/I+R+kCtYkD0VwF1d60z1/Zurb509xDKw62rG4OPMPKcHEqL0woS2RRv1HSrcdPPXVg9idZTZ4AGo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvYdpU9vt6DLPvwgU05n0c10+Ci2PB2oPSM0ESfXXGHelXvIBC
	m6nsT4nFcq2dhusJCp9/sux6fEKf/Is1ZPr3GlzYPr+C3GXbLJx9GuCh
X-Gm-Gg: AY/fxX4TJdk6lYn2GsNCCI6m4wz27mDw0TP19jnG8zXvV3MdtiqDFAKtx7GmiS4dAhr
	3f1WZICdd8cGtReIIfWEDAUbTeOV0CM9o+YskOvyVvJn6WU0U5obMd1B2pUtKdhnISKRozlDp4Z
	R2virQewlu6ToRZY8ha346nUnxiiRh8F83YPSPz1lDh/axLnTBq6hMsHa+++927U2RgBUPwtX5q
	FX2sSC5Eo0k67pPbljEfBhVJErU0r4rlK1xMP1DPO4vPD4r6yftFDklgHWD2NTfMZVQRKoJWQmD
	3TGjEB5JtFiHVU0jJsF6hNNOKxXVM8rLTCGeOiuMPDy7EzqgXEsaRNJkcT7pN+t1t2LAhDqeQuS
	MrU7Z0W3UpCAenf1uMMqa9OKUkjCVDzt8uNrGdtyWD6kQ+sKBpC5jMVs4S6HJDVHftqaVqyjjH/
	IqBBcN20wbNyEBs6T+pIE=
X-Google-Smtp-Source: AGHT+IEA+Q/j8Ug8tOMufCDTJ73p9kjn2ruH1vPew+bVL55UFpeLZ6TFJL+BnzDHpV+g9j+NxhgR0g==
X-Received: by 2002:a05:6000:2892:b0:42f:8816:c019 with SMTP id ffacd0b85a97d-42fa3b0ec2fmr1344479f8f.61.1765351516876;
        Tue, 09 Dec 2025 23:25:16 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226d0sm35845124f8f.21.2025.12.09.23.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 23:25:16 -0800 (PST)
Message-ID: <adcafc6d-0e0f-4342-8cc0-06e3eb60fdcd@gmail.com>
Date: Wed, 10 Dec 2025 08:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][kirkstone][PATCH] http-parser: fix SRC_URI
 branch
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20251210070022.175967-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251210070022.175967-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 07:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122485

This is part of the currently pending PR[1] - second entry in the list
under my name.

[1]: https://lists.openembedded.org/g/openembedded-devel/message/122459

On 12/10/25 08:00, Yoann Congal wrote:
> From: Gyorgy Sarvari <skandigraun@gmail.com>
>
> master was renamed to main
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 8fb37f0f954e234d132468adba2072a70812a818)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../recipes-support/http-parser/http-parser_2.9.4.bb            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> index d4f76850d3..09e26e9f1e 100644
> --- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> +++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> @@ -12,7 +12,7 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
>  
> -SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/nodejs/http-parser.git;branch=main;protocol=https"
>  SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
>  
>  S = "${WORKDIR}/git"


