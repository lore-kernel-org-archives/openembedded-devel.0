Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FC4FA3753
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 16:25:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8075.1767371140871047665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 08:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXWSfgGy;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so79645265e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 08:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767371139; x=1767975939; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/pRob94YmBSJ65+Fk7B9SX5/oeRaKh7/lInTEZyDjU=;
        b=bXWSfgGynX2RaiU+DJkwYh1iU+pPH/VPvssLLRI+gm0YNOZGMmXh+gX6bESdCTbmEx
         7DJXK+m/AGBE26WnI2jhCV+Q1tHrlKnX51eCvvcgp6WvwYA1jxoKFmfjemn8WJS0aM5w
         hqDN52aVNNkPyZ6nY9GiufjnDCQ8qYuPAX1zZ1asSU1aGGXrLtMwOMeOjxIAH3ourmHP
         lsZ6xqk/OidvDixOTePzi8Orjg/DPvqy7JezZSgbk97nSey9V03Bmr428hdFFhXZL3Gb
         h7bvkChUA2gBGFYdg4nz5wAEfVvqG2TUDCw3plkrqHVrqFKTfU7Ep/AUugYcOgdgLodv
         K4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767371139; x=1767975939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/pRob94YmBSJ65+Fk7B9SX5/oeRaKh7/lInTEZyDjU=;
        b=tVz7sCvls12/sbCeINAbqKf3kbepkcafe6u9y1tU9/4Z1zFm10JodCyAiFteODIpLL
         MLaaSVl0acRLMLeYqzALhikkl95fRjkJikhY9wH1dHzAqpauf/qZqrsJ/2DE0c6RjVUR
         9eRrl6gpUzmz4rxJABfTJheWf4Wd5SbNVWKsDq/he0FNd1ZRSNo73cuNlzeLB9l6gk4B
         TTxjEuDJmSHHM3PXe3uKNDnHpWTy+btLbmbpXYWn5y9VpBJ+x5inFCjw5eD4YuabEfkC
         cwrFi6BB7LSvU5QVHvkMiShU3lirxFGss12L+fJT3dWSTdAnBKd31/S9iASAC9vqnMAh
         mvtw==
X-Forwarded-Encrypted: i=1; AJvYcCWb/hkwwUZZStS5FBBdfVIac4qYwY2L+8C7Ho9seH6o7xhuTvfke2SK2Hh0IVcgQku7zrP6Q9lW4r4ovoGSa0KS8Ig=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuirpVsAPqaX5uiFog0A2FxjoRpWXkX/29OwCwjxLK9SE7qx6P
	KgxLtdyhIeBlyuO4cgb8mNyz96+dQ+weALXhmoo8rUokIL+a9cNbmuSi
X-Gm-Gg: AY/fxX7TL7x/1HeMYjZmY/WaIuX4nj2twfA0jsoMrjxhSjxCEqtHKPrUfi12tbEx5sy
	QCjitBxj3jQHgT4RtUU4sUmawIsQYUMSQPMV9bDA9GIxFzX4VtMF/kzdbikTqWyXNF25zvLrmpo
	MteG5jaexKEND/i9o6k8As2jWYYHGBeBZEHk5SwcQ2hEXfqIiNmmI7tEsRKrs97S0VAD7OJRFZI
	k+KtuoADL1xpPVgMaTlIw4xiN3XNB6Y9rDfe6IfTt279i/JhaACn+IiRAsZ/5qDsoG5u6hfb1jF
	k0pryrgPfoATWhrYXBsMb60YDIOGV/NxX6d9Fk0jqKCwGlvN+Xfmk7ETVab3PSV6VA/pt64CfnN
	wZI7PPDXdPdzf3zxzXGoAbdLXb/E6MAH9PEe286NV54E8mJl86nS3V8jqKA7tDNaOnS6VHeVyrj
	b4y1dpzHttuLJkLvV3zqs=
X-Google-Smtp-Source: AGHT+IFEqtdPM46zG3AkGZ99M5xHHEUOAos/cabovyrnDrzJ27LdJqW/tZHwU71ioCIXjin2hlKmWg==
X-Received: by 2002:a05:600c:c8f:b0:47d:3ffa:980e with SMTP id 5b1f17b1804b1-47d3ffa9d47mr311619145e9.28.1767371139120;
        Fri, 02 Jan 2026 08:25:39 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm775012065e9.14.2026.01.02.08.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 08:25:38 -0800 (PST)
Message-ID: <af8bd9f6-02b7-4ebc-8f93-4d1425cf6fed@gmail.com>
Date: Fri, 2 Jan 2026 17:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] recipes-core/toybox: Switch SRC_URI to HTTPS for
 reliable fetch
To: sanjayembeddedse@gmail.com, openembedded-devel@lists.openembedded.org
References: <edb5e5e2949f7876e0c21ffc8ad8006058a0a60d.1767354275.git.sanjayembeddedse@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <edb5e5e2949f7876e0c21ffc8ad8006058a0a60d.1767354275.git.sanjayembeddedse@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 16:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123098

If you are sending a patch for other than master branch, please do not
forget to indicate the target branch in the subject line.

On 1/2/26 12:46, Sanjay Chitroda via lists.openembedded.org wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> The upstream site (landley.net) serves inconsistent content when using HTTP,
> causing checksum mismatches during do_fetch. Using HTTPS ensures stable
> downloads and resolves checksum failures.
>
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  meta-oe/recipes-core/toybox/toybox_0.8.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
> index 50ce50d1c2..b1d25fa83f 100644
> --- a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
> +++ b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
>  
>  inherit cml1 update-alternatives
>  
> -SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
> +SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
>             "
>  SRC_URI[sha256sum] = "4298c90a2b238348e4fdc9f89eb4988356c80da3f0cf78c279d2e82b9119034b"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123097): https://lists.openembedded.org/g/openembedded-devel/message/123097
> Mute This Topic: https://lists.openembedded.org/mt/117039973/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


