Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210CCC28B30
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:49:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.4124.1741682939700664678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=br3dxwfz;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so342759766b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 01:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741682938; x=1742287738; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uzIZf/lFJBdkNnJlcrQ1M4AksealcnaXcUM24OZ6yWk=;
        b=br3dxwfzkge8qVrzs5GMn56JZ5qGTG1FyaVyL4+rWS2zVDL9lnqlmUl4wd7LongFrU
         rUKh/Vft5AKBABTsCojedu/k6kyYpUmdlMgieSegnNFO6uWx/EjCOn+2T2oK1pZWJ9wr
         AuUV/w0ZK1TOtx39R6JIkmg2svwMZJFTjWMYUshdXwy+yQISQqgr/q9vO24kZRAM9zM6
         M8rEynnjZ+JhxMcgUK8sfhfqe1NYcr81eAdQJf/gSRjfYS8AgQVQZywGbJDmcXyv2Bmd
         Gjvz1ABOiZfkD5xk3meL2vM/Pm2KPB/MFdzZzOCdDwi0b1G3x+cZVO8n/o1KXiiqzYfD
         CCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741682938; x=1742287738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzIZf/lFJBdkNnJlcrQ1M4AksealcnaXcUM24OZ6yWk=;
        b=BEEmwtIFBYxAtSJ7r3DYR/gcvIFAk18ydZPvbVWrIqeMKdSLx6Gxg2n85FbpnCn8SU
         0gnSu5IpdHmVJeQKKjFsaDUtDo1A5YocdsHgiXDPLQJSebohrsQY7Trf2StDQClfSg0G
         2p1aACZNmXTbYz1k4XNQg4mr7oa0QNy0kgIS/kgOEv3Ihwl+xk34unUi2t7Wg7VRyLF2
         n3RphNurcMybkVNmGKYpl5woMo0AkK/3i2clVIZaCLisNl5kahAfcn+jPVyq06Z3t65P
         nJGHCKGcIOL52bDH/e2RHQ9CSOQUGcJmLQvowqu9uFwcOO987JnXn5cvXmuuzLpE/v1S
         aBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDpiYyxZ6Fy4mh/QmWneWZ4rPJ6MdAi0wgZC5Vqy6PDeaMQ0/fQf+KheiRWC3ybY9nPz8CA6mLreyDko20XEmANU0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyU1TCeD2KyTvoA187VHeioRwZELah8X4BerWqj11lgu7ZMyaGE
	Me9NPZYpevUo47KGoIKpAs+a+JVhcURavfuFz4ZTJkLRm1fn1PW6n99pcRh2
X-Gm-Gg: ASbGncslVzX5LHRBQyzwE1BFZx+LDYXT5EteNL/YihBSxvIaCUmOh9XpT8c7k5tsl5T
	rj8VCW43DvM1b2NQZPiq1F6p8yCyZCJaOanbgXys5jgm/LZxROyJrSP8nSjJABaRtTCRqkO8CDA
	Cqj4y3KcAPcsLoZ7O/aayJsTZLPXiJ6M0s1mfqMonrymhyUV/jhpXXRfGoKPMJy4QwRk+Tyg0G/
	sO4x+hQRE6hF9mciq9qViFweYkGrOFJtKQGPHwbJUwdxXatrKArUDX01Q9nARsVgE85migfY131
	6XxpaTFnrj8WzyDqWzCemyJVrLRux59JlcHT3WH0XKWNRITqL0+s
X-Google-Smtp-Source: AGHT+IG3MSy0NIM7xOFu60M8X63L0+mUlPZzenx4Eu6H803cPLCJsRXtKX+srnEZUcrcKrPHx4ZFgQ==
X-Received: by 2002:a17:907:7e94:b0:ac1:ed96:56d9 with SMTP id a640c23a62f3a-ac252f5c917mr1866893466b.40.1741682937668;
        Tue, 11 Mar 2025 01:48:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac297b72989sm357540266b.80.2025.03.11.01.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 01:48:57 -0700 (PDT)
Message-ID: <36ed2d0e-fe5f-4705-84b8-43b1155f42e6@gmail.com>
Date: Tue, 11 Mar 2025 09:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] hiredis: remove runtime dependency on redis
To: yi.zhao@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250311070202.229491-1-yi.zhao@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250311070202.229491-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115851

On 11.03.25 08:02, Yi Zhao via lists.openembedded.org wrote:
> Now hiredis can be used not only with Redis, but also with Valkey, an
> open source key/value datastore that is fully compatible with Redis. As
> Redis changed its license, many users have switched to Valkey. Therefore
> remove this specified runtime dependency.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> index d081242736..93273919e5 100644
> --- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> +++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> @@ -35,5 +35,4 @@ do_install_ptest() {
>  
>  FILES:${PN}-dev += "${datadir}/hiredis_ssl ${prefix}/build"
>  
> -RDEPENDS:${PN} = "redis"
>  RDEPENDS:${PN}-ptest = "${@bb.utils.contains('PACKAGECONFIG', 'testssl', 'openssl-bin', '', d)}"
It still depends on either valkey or redis at runtime, is it not?
If yes, wouldn't it be better to set something like 'RPROVIDES =
"virtual-redis"' (or something like that) in both valkey and redis
recipes, and set that as RDEPENDS here?

