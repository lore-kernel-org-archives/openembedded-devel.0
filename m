Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3764EEC1127
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:20:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2784.1771874423453823744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwroOinI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso40875335e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874422; x=1772479222; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9i+4hkV/38oedwGHZubMqcFVAg0X4v54Vr8L52ck2g=;
        b=hwroOinIw0BKKZQl5r6EDOPXb9JsrOwFUF0yakJ4ZgDKL4sn3bBVrwW5HyI8uUsYc5
         0h39rjcD/o2EvKNctkLuvyaV9FExuRkM0haNL/0FCqJDX58SGBTdAEPwXZ7ErZXzlsZ7
         r49YKMzRlaE6QmTBVL4KyI0u72gqcJnDtp/H3PVQB4Lav8NGFuKuy0S+7QUSnaJFuYcU
         9F7bYoeteGqjMkmWpqACUXaK2h+QsXj5HFQ3XEMmtTGXJoemK60qK1Pi6Wbfdo7Cf7DD
         GMNaPYCv6XFpJ0+WWMr5r/SNrRarEOgll2I0PNi2jk2GnBT+iNRDtfuHNGPahS2RDp/b
         VOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874422; x=1772479222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9i+4hkV/38oedwGHZubMqcFVAg0X4v54Vr8L52ck2g=;
        b=YmhiwQ4DB67NZ2x/Fi8jUl5gg7DVMsSUthLUs3qbnI77Ns0HA7MTdYLQnXsr+tZ+Ce
         Ra9Vw0jUKYuFO2/M3snZXMt1CPgj+TE2tM/+ABUahnbunsj/1ExU0iwFaY9eH/TtFjop
         0pxz8DZQ/7bvbZ+dai85Ul5v+qOsG1ANpazT8+6TbXUKPMkUesoqEEmgaBtM3yandQfZ
         47xrIXRDvFYfn5upeE8nlgXReYzkvvEzi+Er75kyX1QUlokdNtge07sssbtLzYeR9tb5
         YF8r0zg+rtzQcMCxu8Do6bN2HK47HuSdZhO6NsYL8RKf39K7zmm+lV8/tbQCzaCz2A1+
         No2Q==
X-Gm-Message-State: AOJu0Yw5aYb3HCKY18ZCwLIQCNjL1KrKNz1uZphQJ9nI6JXRg6DKHUlp
	4LWXlPg7TRcQThnC9xAso+DyYYoTPiqFeKq7G0kKNx02B2IXjD9m0mw9BdnVrQ==
X-Gm-Gg: AZuq6aKJSCMozehuQS3irLoMRmXp8d1j4Ga71nfuS413j5/T91BDpFVdLgnn/FFUf1x
	CUQFikepwuDrSyXI4UPoqbcC9plaRv27RbQyRhaXft+LVdTM90TOMrNcnmERvW1siVkgVpz629x
	fLoZmt0mb9gk6xYaXG88qDuDkHz034kd6//vmaIcKQnIbO1gL7EpqnRC4FTORhEj13zIafMxog9
	Npo53WfK0aUjZSrPWL/AVv8aX36S9WEleoBT46AyXDTakkgNe6hy8WkEAy1ZEpESEvdmZEyQggk
	B7uZd00Mrvl/lFrHetBBPhNqQw3yWuDs2ofFmv95O+mCqdUNG+rj8RxTV6Z/j90NPM32uSQtazU
	Jylm7tn2PILrk+cv09/6SZnm2K6GjewwNlnYSLOidniB4OLJ1A9xww9gH73gsBLIWSqVU4/3/Ya
	wxt5BWZesTOTl/8m3/leE5y+BkOY4VprGtLArNsB9Q+g==
X-Received: by 2002:a05:600c:a49:b0:483:7631:befa with SMTP id 5b1f17b1804b1-483a95eb5e6mr182816215e9.5.1771874421629;
        Mon, 23 Feb 2026 11:20:21 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88ead80sm1350245e9.2.2026.02.23.11.20.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 11:20:21 -0800 (PST)
Message-ID: <3fafe8a7-0359-48ee-be65-a206d8c9c705@gmail.com>
Date: Mon, 23 Feb 2026 20:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH 06/13] minidlna: ignore
 CVE-2024-51442
To: openembedded-devel@lists.openembedded.org
References: <20260223191850.1049304-1-skandigraun@gmail.com>
 <1896F6527A024512.558139@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1896F6527A024512.558139@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124568

This one is arguably an opinionated patch. Feel free to speak up if you
don't like it.


On 2/23/26 20:18, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
>
> The description of the vulnerability says "attacker [...] execute arbitrary
> OS commands via a specially crafted minidlna.conf configuration file".
>
> There is no official fix for this CVE, and upstream seems to be inactive
> for the past 3 years.
>
> The reason for ignoring this CVE is that the referenced minidlna.conf
> file is in the /etc folder, and the file is not world-writable. Which
> means that this vulnerability can be exploited only when someone is
> root - but if the attacker is already root, they don't need to resort
> to minidlna config-file modifications to execute any command they want.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> index cb2a1865e8..0dd297098c 100644
> --- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> +++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> @@ -43,3 +43,4 @@ SYSTEMD_SERVICE:${PN} = "minidlna.service"
>  INITSCRIPT_NAME = "minidlna"
>  INITSCRIPT_PARAMS = "defaults 90"
>  
> +CVE_STATUS[CVE-2024-51442] = "not-applicable-config: vulnerability requires root access"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124560): https://lists.openembedded.org/g/openembedded-devel/message/124560
> Mute This Topic: https://lists.openembedded.org/mt/117963231/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


