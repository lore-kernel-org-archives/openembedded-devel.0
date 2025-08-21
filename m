Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA13CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:00 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.4712.1755766795828949841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ABmj5yx5;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7aea37cso97801466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755766794; x=1756371594; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lMuAVwh/wJK4WDQmaT5kJdWTeakhQaY3nrIk4GqY+s=;
        b=ABmj5yx5vpnu52gtV31BSkASUNxiECgMXFOCy09AVO1jbrWvC82OGwYyVMZnqJoo6J
         vdbY/pfIcS8rNsDZc9KtVxGwUdiT+cxTeuWFy2Ttrb8B1V9VdJ3iI2bbVOwYlcnP3kns
         KuCGduR+dQrwi25sA77CsKsDDVMCt2HO61wkpwsNwBcFhR31PNpWHUE6jSAyVhROCuBA
         AA0sa3PGvs2Ams/oJarfPN4bZ6oZE0zPE9XJg3ePSO+Iv6v7ezK9J5SvFRVwAQzNpjAS
         DnDJSXlGMq2a7CMYkaPz0HU0uSQ7KwGv9dI11QtmXY1zO84KuKeTM7uhvFKszwiDD2UF
         mhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766794; x=1756371594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lMuAVwh/wJK4WDQmaT5kJdWTeakhQaY3nrIk4GqY+s=;
        b=COPCrgDE6SbreHo46MgtD9lYCEVWQA0m4I5UfhAo8l3Ds1PaYm7RXH4hIgXqZP05oG
         utoXVT+qD5rkm6nSUCizz8CYfM67qA9DBIucAelnWUC3DvWQGDMVV+qJ+aPKk3TDboHM
         X9/GdWvZUkyyt9m5HVUUs5fAcMiFJwl30iqEbjy2rkl+39cHPWGT9KS8D/vSgdE3cOjx
         tgyAOzh7gODVqdq77fKr5+U5NaW6RkLAskVwVv/7Mpplw+Fbeoc3BBkwnH3axdi2eJ4v
         vmNjFKmatIzqiLzg1qtswS8edEefr2ikHcdrQhcYJgLDQLumITJ8510YlFdb05Pv2Rb9
         do9g==
X-Forwarded-Encrypted: i=1; AJvYcCWboykEjxuEtZwVFdMem+D03qi/E2yQ06XebNGdENRAS37NpryAyFBJls8hFZz9LnELBNjaQ7KvvC/rNUWKecjWWhs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwrNZXyiM+TJAg/xwWFetC7Uoi2I0PqplECzfLfvlfpkK2sUXNe
	UZCzpKc0RRXNGI5sMhF3QHvT5RzrTmk2+WRWb3dX/duEDTtnrT5mc+qON3cb6Q==
X-Gm-Gg: ASbGnctmFWTzzE7rjsQyT7AfjQaMsOjMlz2pbVTYaraXLq9Psp7/GnGsJdLBVGGeHBY
	1pvpA3h1ihLILzu5fLVA7WRSZyDRrPCm9YbO7DDAg/phOY7/pHbEtBZ5GT7Ka7zuVfzwXqpGCmN
	CQxkmLrTMibfzuCfblrS9Cw2yJlyn1FnokclxvFo9pY1eULOhr+tNjlioUV6nHLJ3SHdrHg2hjh
	pihlVGOe8/c3eo7w7jnNO9NdvxDnKiGSD8BrLeVUEIf1KMHBFmma3QksRFY1YiraohZdA7A5CKp
	iZw0nhB/gmBl64dQYZbgfhtNFqTVp3PrzxFjKyECZTypYDPWcygM74kHwuhIKtJU6hmG13FEeA7
	vpqtCMCLViQo1trT4vFGGm2YIC5IWw2w=
X-Google-Smtp-Source: AGHT+IGvxBDPs/hkRpxIvJlQ8FUhdvMq8nRdNFqbHJ0FovwpmpoZ0BgxsGkyRNYvVKf9JcX1ShSC2A==
X-Received: by 2002:a17:907:1b21:b0:ae3:595f:91a0 with SMTP id a640c23a62f3a-afe079f1298mr165939566b.16.1755766793800;
        Thu, 21 Aug 2025 01:59:53 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2ba31dsm344608666b.12.2025.08.21.01.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:59:53 -0700 (PDT)
Message-ID: <8d0b06df-0452-4007-a8e6-618f5e1decd6@gmail.com>
Date: Thu, 21 Aug 2025 10:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] openvpn: change ptest output format
To: Jiaying.Song.CN@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250821072502.4137334-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250821072502.4137334-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119050



On 8/21/25 09:25, Song, Jiaying (CN) via lists.openembedded.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> The format selected is the automake "simple test" format: "result: testname".
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  .../recipes-support/openvpn/openvpn/run-ptest            | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> index 5b187d9086..572e969ade 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> +++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
> @@ -1,5 +1,8 @@
>  #!/bin/sh
> -for x in `find ./ -name Makefile`;
> -do
> -	make -C `dirname ${x}` -k runtest-TESTS
> +
> +find ./ -name Makefile | while read -r x; do
> +    make -C "$(dirname "${x}")" -k runtest-TESTS | sed \
> +        -e 's/^\(\[       OK \].*\)$/PASS: \1/' \
> +        -e 's/^\(\[  FAILED  \].*\)$/FAILED: \1/' \
> +        -e 's/^\(\[  SKIPPED \].*\)$/SKIPPED: \1/'
>  done
>

Just a small note: the ptest logparser expects "FAIL:" and "SKIP:"
prefixes[1] (instead of "FAILED" and "SKIPPED"

[1]:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/utils/logparser.py#n20

