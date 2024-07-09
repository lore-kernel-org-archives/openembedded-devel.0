Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AAAC3271E
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 01:00:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.2517.1720486838675678684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 18:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R3GCnmfV;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2bfdae7997aso2678697a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 18:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720486836; x=1721091636; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dC9ydVa1WR2lXyUfq+GhgHdwikSK7O1/e4uULXjCVV4=;
        b=R3GCnmfVffRL/O1kcIV4TCe1W+ia6Z1dg6qVSwxeBKQUWCDAwdCZz55U9c+zhpsrud
         y9VKKSGhFeGxedm8y8kCBkRQn4XsZMb1Ph4YbiffjurZ/9SLHngpSDqIargrxd73D4f0
         /38bz8v8NfYZ6MGSTVtDs1yjGDnO7fsyiUfD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720486836; x=1721091636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dC9ydVa1WR2lXyUfq+GhgHdwikSK7O1/e4uULXjCVV4=;
        b=e2c3RNM/oHU92TyWRk71cqq7UT1zPO4OrvbmQXdWn8XrE6rcpj2tUMkT/YD2z87/OW
         kO2bQtjbQRJb7tbEEshObmPUWpT8k2VVE21SKmTPGbz3eiI2sjCpuyl7juse4yuHd0V1
         fYcP445kL4ezFjZpYfdLf0UzAFEypyQowzL9mdCq9fxgMZf68HgKZNfY3XF75Gux1uRC
         iusBgcCkk3x1TqKwaEkaIUOcurWycCvDrklRH2eqRhBsASQZ1em255g4W+XGObf3idTt
         wey7AJgCd/5UXT5J8SyIrm4jfLNBbU/CDis5898Mrx079MXsep2EQwhwEOXogd1BaYoe
         +Jvg==
X-Gm-Message-State: AOJu0Yyq+UlQS/CMDFl0IDDpcqaJ8uBPKWr3rIVN5u5Hvyu5L9ZMGkrd
	dC+fAMOh8N38mNPODy/2+kqavKb6Y7r4MRU6//TlvCZNKjlzTRXBYBr9SqZpYVsgYXg7HSSDwYl
	5
X-Google-Smtp-Source: AGHT+IH83NKBir+Pm8UXptfhfuw76hhKsCFvtImeJUgF7/6ytlMnGOO4+JZsrFODFoAePEBXnFsaKA==
X-Received: by 2002:a17:90b:180e:b0:2c4:e333:35e5 with SMTP id 98e67ed59e1d1-2ca35d43471mr1086303a91.36.1720486836294;
        Mon, 08 Jul 2024 18:00:36 -0700 (PDT)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aa6220dsm8742814a91.38.2024.07.08.18.00.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 18:00:35 -0700 (PDT)
Message-ID: <a2c68c9b-3598-4a5e-9f3a-9e7350b05b63@mvista.com>
Date: Mon, 8 Jul 2024 18:00:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] net-snmp: Set ps flag value since it
 checks the host
To: openembedded-devel@lists.openembedded.org
References: <20240709004123.1330033-1-jpuhlman@mvista.com>
Content-Language: en-US
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <20240709004123.1330033-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 01:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111271

This is also needed on kirkstone and scarthgap.

On 7/8/2024 5:41 PM, jpuhlman@mvista.com wrote:
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> The value the configure script uses is picked up
> from the host machine ps, and there are cases when
> the flag selection can be different. Which would
> break reproducablity between builds on different
> machines.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> index 75b3d9e8c..989ec5413 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> @@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS = " \
>       lt_cv_shlibpath_overrides_runpath=yes \
>       ac_cv_path_UNAMEPROG=${base_bindir}/uname \
>       ac_cv_path_PSPROG=${base_bindir}/ps \
> +    ac_cv_ps_flags="-e" \
>       ac_cv_file__etc_printcap=no \
>       NETSNMP_CONFIGURE_OPTIONS= \
>   "

-- 
Jeremy Puhlman
jpuhlman@mvista.com


