Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9B8C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:05:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36355.1785920753190050988
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iGM5PZTV;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496b7622a83so5609735e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785920751; x=1786525551; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiK/NF7XSeClVFh6iUeg6NVjc8Xbic95jOrvvEZzn6w=;
        b=iGM5PZTV0OziuGE6ulz1CmFp6LRd2p3lslp+Wx/M4qbBGqy5By9R3mmp+woPWMYr95
         v1NGqrxbCZQI+2qkiekqsyH9N+aRWoQ7NoPl/DfQU8tHDBpYYwDTXUUbA3j50VaVB3tE
         gg/E7S3MBEDaa+Y2CcMOKo00aajz4V4Qmo+ZDJwD9HDdCFRI1yUC+4jBkvY/IGK6uxmr
         OvQpjReu7d06XUL45OfHY9xN2klg+ZZxYMPzO2PREJ0mv4GQbwZF1oLTOXv1q3P6gtYC
         IoaPX/EXzss87id7IgCGBERWaqQq0watOumUxPSbDDnIRf5thrIPceuWdflKpiU1gfzw
         am0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920751; x=1786525551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RiK/NF7XSeClVFh6iUeg6NVjc8Xbic95jOrvvEZzn6w=;
        b=LKIQhC37HJ8drAAr4JnEFHRQk8rpFpTuYCX1a3AWPXtFniihlIU48iynQ0MzchUtxp
         toE+tvTfAQAwhfX0e3dKcbjU1v8dHPzI33HcY2Sml3ofJS93S1LPq/rssmahj9uJBtMw
         0qHCvEaXv4JEcge9uy5fIjlQUu5VyLxJV8+zt7ugRVuT65Akf40Hcg2v/u7oNBDmSiqU
         sYqQ+Mu91JZPAV3O9qxUWOv56el0JzWYPcn9QqQUpCztl95FeDZeslw3d4MpQbfankJe
         ko66blH+Z7u2fEG6MZeGbnfgohlg417N8i4sQHwXSugUXhoxO827qYHW1/fkSC7JBaA5
         gnCg==
X-Gm-Message-State: AOJu0Yx+MvAG3X6Yb6QgamOAQnPQ39/6mPmSHmcQKpZtd0tSYyoacQtk
	usVV6QtUtf4IGeyhoKgCmYxrkusNiF1WhbvTVkbY37lPsi3pwlTpr6US9CJgrw==
X-Gm-Gg: AR+sD111y7WfDryvrfGXXoA/SMZORQV2vHzvWWTCmbPhX1lPRwwk0K94qJ+vCdnJnJ2
	nyfBILyMSuptqKj5nHG20yDtYvtTDVL+WPLKy34A1eVsBCCqOui8wipoPsqm0MBqTcDSl4YE0rR
	JIZ8HV8C0Po6fqR7jX+I81v2nOWvW9Wc2SlGjOI3kLJqTwcq/oGGBOfonyLDJ9JYkx77U1oXJ1B
	QimReqPCL+OKwQQDdon8j+8odiA58wO4keKcr+/C6C4002AVl7HuhuRyvJiPNm7psBxfX5vD36Q
	UKSQrQs3zVaqAE5xVWHF8SKgAOnG/rHEiKotCWN1BLQlW+hhSymYpugQRoLAf4bRLGDFRoRiMgf
	A2TdUdCxMVKLqXkgm6Ugrz1SzaVkneTxAZd1ntpWO/11T5jgXCzCWlp6rYAB6cPLmrL4ANo1Ogb
	FlMLPTMaDAI7Mowzhh9v31JVelvWp985NzNG8Q9GYEd5Tn/dJem8LbbCew+mYsPLKcV2CLScfk0
	ef0rneFHrDn1YXAmgWy0sJP8Zl8DeMv7HzXCAOX8FgkvQnmtwoNNlvZ
X-Received: by 2002:a05:600c:840f:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4994e72605emr53907415e9.4.1785920751085;
        Wed, 05 Aug 2026 02:05:51 -0700 (PDT)
Received: from [192.168.68.84] (host-87-5-153-198.retail.telecomitalia.it. [87.5.153.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a100e14sm154041335e9.14.2026.08.05.02.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:05:50 -0700 (PDT)
Message-ID: <8400e03c-5a8c-4509-a6ee-712425ba9358@gmail.com>
Date: Wed, 5 Aug 2026 11:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] jq: fix build broken by the CVE-2026-43895 backport
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Darsh Kelaiya <dkelaiya@cisco.com>,
 Anuj Mittal <anuj.mittal@oss.qualcomm.com>, xe-linux-external@cisco.com
References: <18C8DBAEDD564879.3417489@lists.openembedded.org>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <18C8DBAEDD564879.3417489@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 09:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128805



On 8/5/26 10:32, Emanuele Ghidoli via lists.openembedded.org wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Since da15df26e62b ("jq: Fix CVE-2026-43895") "bitbake jq" fails with:
> 
>   cc1: fatal error: src/parser.c: No such file or directory
> 
> That patch is the only jq patch touching both src/parser.c and
> src/parser.y. git orders the diff alphabetically, so patch(1) writes
> parser.y after parser.c and the shipped pre-generated parser looks
> outdated. Maintainer mode is disabled, so make runs the no-op '.y.c'
> rule; having "rebuilt" the target it stops resolving it through VPATH and
> looks for it in ${B}, where it does not exist.
> 
> Touch the generated bison/flex sources before configure so they are never
> considered stale. This also covers any future patch touching src/parser.y
> or src/lexer.l.
> 
> With maintainer mode enabled bison will no longer regenerate parser.c,
> which is fine: the CVE patches update the .y and the generated .c
> consistently.
> 
> Fixes: da15df26e62b ("jq: Fix CVE-2026-43895")
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> ---
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
> index 4327a25311a2..66883ef4a0ee 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
> @@ -47,6 +47,16 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
>  # Gets going with gcc-15 but See if it can be removed with next upgrade
>  CFLAGS:append = " -std=gnu17"
>  
> +# The release tarball ships the bison/flex generated sources and maintainer
> +# mode is disabled by default, so make(1) must never consider them outdated.
> +# Patches touching src/parser.y (or src/lexer.l) make the shipped src/parser.c
> +# look stale, which fires the "NOT building parser.c!" no-op rule. From then on
> +# make looks for the file in ${B} instead of resolving it via VPATH and the
> +# build fails with "cc1: fatal error: src/parser.c: No such file or directory".
> +do_configure:prepend() {
> +	touch ${S}/src/parser.c ${S}/src/parser.h ${S}/src/lexer.c ${S}/src/lexer.h
> +}
> +
>  do_configure:append() {
>  	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
>  }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128803): https://lists.openembedded.org/g/openembedded-devel/message/128803
> Mute This Topic: https://lists.openembedded.org/mt/120607447/10076011
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ghidoliemanuele@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

I forgot the branch tag in the subject and I have to remove the Fixes tag.
I'll send a v2.

Emanuele

