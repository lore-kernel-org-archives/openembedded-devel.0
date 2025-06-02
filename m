Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B36AC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:58:17 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.53524.1748879896264404846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XwXDjPU6;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad89333d603so877903766b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748879894; x=1749484694; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1lmuwzriV6Ak3I5MsVqMDUcHtKZMUn+v47A3DLhdYY=;
        b=XwXDjPU6bSbKLsbo2+cCdee8zqauEbqWGwwI8dSkSIBDtPO13fDcwyAiC9HL0Fj+cY
         qVcRox5UIF0hDu+q/EQXIPfSlqxltk4sO41odhnu2k2s3ystlaqBfEZHyPbUwyACoTKM
         B0tYm4or4Bwcqp5SvjLQty12gttLurLgCYswgJsleAIcLUAfIm8FrX2t/8M+pWGgOS9Z
         q9don91ER7pocHYE+V1q/Q4Wco2K4gGwXdPfxATVsHiKoBnna9e5VvXOIR+0oz23CU85
         iz6W8k+kSv+6t/e3HzlHZRX8kWPK6Vr5JbGKCdYx+zVPK1WEwid5mr166D1PvLoqZGiN
         Quow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748879894; x=1749484694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1lmuwzriV6Ak3I5MsVqMDUcHtKZMUn+v47A3DLhdYY=;
        b=uIpWTb88Tiw+y9AiwpB9YQPC8q/C/ZKL6S025/rmm66uUkDWdbQc9WbULxkhvsoLAO
         BidZlU1isV8/1Kxa1MeuVPH+cB6n32zDefFJh/HPYzxVfEPBkWRVaiufjntS7WJnoei7
         Cu+P+iK+/nsHiiwKcZ/UJRQPl/9tDps2EG11YIuoVtulYn+EefF0NheLsU4+Sgu90nbu
         biOonG013hl1n3o1SZLfzzQ+eulOZI6f1YXMgSnWhEouYLgMokCGRyaoRzDIfdHbqSCd
         i6U7iSeQuNtg7bqKTDNAchROCh7leYlY7YuGGY4VTetTbyEAj0xHAYHgneO6uldHe7GG
         E96A==
X-Forwarded-Encrypted: i=1; AJvYcCVFNOsQE5oEqlpC/qpF+Nuz61VswsWwjClX3Uhqyqa7UHvWjSI69lTjBHUUY2zH+IrXdwXXZU9wUuSVoy/NWc/93b0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9K7ngAxkhA75wgkYMYhIyjW9Ti9RZD+unl1YzfT9B36SQOHiY
	9iRnsm4CTS6hyVz9rXzNLKx9oYAJwXBaAqDDHyUdeG8P0YFWJ6ie64knYPbXOA==
X-Gm-Gg: ASbGncspDHQZtW0kdyNgwIOjVRrsbTyjLam2ngk+jdabsK2ck5PgalOIC0tbFtf4qUR
	Rceb6ayf3PVtBWSgwW0ZIL4C45dh9f/ue+czp1hZ3TIy7EiHYc7QLd9DcvhUCYluhivfvpjrs/+
	MBF8SkfeZN6kNGpYPsWmxwmO54ngaDUBmFPy7Vl1UGzsyjfoOTKuz9lxUIdKpErttKnAe07BQMG
	cLrSx+s7m8kbyE+bwB2wnCdPvnaWB62TF/BUbQFgyaU8i+6OouT4n/+4AcF8lS8EMk66+OpUc7E
	zLRkiKYI8xeynsuS59XjGUjFC4iCaItSlRzMYYBd1GHw3rX9ZBHMRAh5T+FvQfjM9iR6MQ==
X-Google-Smtp-Source: AGHT+IFmm+RrhE2qRjArZ+gRK4+IDYRv593rSpiuWrjy4Vk2aa25tZcNt0JnKFRw7maV2W977ucg1w==
X-Received: by 2002:a17:906:6a21:b0:ad5:23e3:48b6 with SMTP id a640c23a62f3a-adb3230518fmr1333112066b.45.1748879894176;
        Mon, 02 Jun 2025 08:58:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e878152sm818694766b.107.2025.06.02.08.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 08:58:13 -0700 (PDT)
Message-ID: <444ee160-c5cb-49e2-8b00-d11b5d9c277e@gmail.com>
Date: Mon, 2 Jun 2025 17:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/2] tcpreplay: fix CVE-2024-22654
To: archana.polampalli@windriver.com,
 openembedded-devel@lists.openembedded.org
References: <20250602155126.1197444-1-archana.polampalli@windriver.com>
 <20250602155126.1197444-2-archana.polampalli@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250602155126.1197444-2-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117716

On 6/2/25 17:51, Polampalli, Archana via lists.openembedded.org wrote:
> ---
>  .../tcpreplay/CVE-2024-22654-0002.patch       | 35 +++++++++++++++++++
>  .../tcpreplay/tcpreplay_4.4.4.bb              |  2 ++
>  2 files changed, 37 insertions(+)
<snip>
> @@ -13,6 +13,8 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
>      file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
>      file://CVE-2023-4256.patch \
>      file://CVE-2023-43279.patch \
> +    file://CVE-2024-22654-0001.patch \
> +    file://CVE-2024-22654-0002.patch \
>  "
Looks like the first part (CVE-2024-22654-0001.patch) was left out of
the patch.

