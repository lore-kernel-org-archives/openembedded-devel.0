Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22732FEE4FE
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 20:25:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126408.1772310341981955053
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 12:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkEZpbOj;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483a233819aso30774935e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 12:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310340; x=1772915140; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzYeAZ1270m5vPrURF5oTF5NRE4iROBQxQ1/ON0JH5Q=;
        b=NkEZpbOjmkNRYWpBZfCSy9vYuPE+Yjg8yOCeTHmecyFE6ve08EcvV9HHOVU8gvkkms
         Yfsk7pHq8MOQDbTvBFmR5yxu8t2UUR81kExvp7L58FHFh9BfZEghb8qSY1OhLM1Hakb5
         /FC3ejLvks2boIC5ooOxjKS/C1m+wKNkq18odUPp7zq4Hlsn5j701AJYvJ6HrNIgbhyA
         X7WP3jgKQ1VFGKB/NxOCjzq10TJB6/jL2UoD0Vkthv0HzZhGuUXb8brCfYWVcuikeb8V
         4UhgplnBAM48Cci5VMm6imyL92+mc64ES++ZysuNvFiVGPebIuat0insqjbSc47G5B/D
         212g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310340; x=1772915140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzYeAZ1270m5vPrURF5oTF5NRE4iROBQxQ1/ON0JH5Q=;
        b=TeIuiTMcYd5hElXB74YOljL8wrLejlCA2Pi+D3hDFe9dYAf0evFp08/aRhFbHIwbUR
         p+3SBTZDaHyJNZpTT+WPZ7z6+yXnpNtJ2o3qYrp2yCx5SAswGdjxgwZA6VbOelYjvRJ1
         PKCEokfxvn2qMXMksnE8I9RQMQpyEe//drpedtiE6jcEgtVpM+Hr1RSowr9GQxZ49WWF
         C77WXpKKIB52T34AcXc6ZRcqQQlek//hUkIv2VNjj1AZB5wNWxNP1DyHMYXpdX01v0FH
         PgM0A+nwGPRje3vh3MHnWUcFWLObbJ9U5/21EHlkr7uZfwUmprhIXNLE1oP4BpraHDcW
         j+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW/dVKku614D9eVSbZXZ66cMDGzwblxt0/YRgtwqBdaELbxicvRVsgz7EJ1M7L9aGwBmPv9j7K0ZmeSqISPsGZxE0k=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzibAfKE+XmGjSUt5BwAauCco83SGvXCajmuIz9QMVjXmhrInsI
	5LD4wVpecgU1t/ferw3d8G9sncu4IqjVawOoxwQ+/hcVH1knl8lpioWJ
X-Gm-Gg: ATEYQzwwrH9V21H+TP524gEzp50Qr32RXKpsx2UhfaEx85NupU5Ag3p2oUPPF3XViRG
	gLDdsU7vEhkBpa6I5qe0PZmTy3ax1Qv5HSOGbvhAgKtEgEdwP9+7CbRq6z5btwCpCjBEueYg+QY
	jmCAzYme8GsQSFfS03AVtwA3ov1O9oJ2Tg8f7b/jqMlLeeDVS1DryHWAlTwcM+SeRrnLYJhTkkr
	gaJdAJaWcFP8gBKqNgwkPDcU4ECyrj+PCu2M4pmTJ/zOKCMRMZ4J9va6xoeqSbJqda1jzOt3YyO
	URmXMKYLXIRbCC5LW3CnACEUFw9DBKziq7Ptoam5dV8vSaahij4tcHqQK1DnsdCG7vwkAPn+F0v
	JrMtj/cLVo3ef2Myt3+B4u8BM272lOFq6YpLznKYafEutTpEr3f1oFYxosasu7HEd2aB4veY6yM
	+w3n4SDqyQ+njn/XlzH9NSCLU2pQe5PoDV4K4kWjYbNA==
X-Received: by 2002:a05:600c:4f8b:b0:483:498f:7953 with SMTP id 5b1f17b1804b1-483c9c21525mr121810045e9.28.1772310340292;
        Sat, 28 Feb 2026 12:25:40 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb6d16sm132036275e9.5.2026.02.28.12.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 12:25:39 -0800 (PST)
Message-ID: <ea3005d7-d7e6-42df-a6b0-bd49e9ea5f87@gmail.com>
Date: Sat, 28 Feb 2026 21:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
To: gitbeam@gmail.com, openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
References: <20260228173854.111416-1-gitbeam@proton.me>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260228173854.111416-1-gitbeam@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 20:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124789

On 2/28/26 18:38, G B via lists.openembedded.org wrote:
> Upgrade to latest upstream release 1.2.4.
>
> Release notes: https://docs.ntpsec.org/latest/CHANGES.html

This link throws a 404 - do you happen to have another one?

>
> Signed-off-by: G B <gitbeam@proton.me>
> ---
>  .../ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (98%)
>
> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> similarity index 98%
> rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> index 9ad97e7689..4f71cd2298 100644
> --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> @@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
>             file://0001-wscript-Add-BISONFLAGS-support.patch \
>             "
>  
> -SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
> +SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
>  
>  UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124782): https://lists.openembedded.org/g/openembedded-devel/message/124782
> Mute This Topic: https://lists.openembedded.org/mt/118064777/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


