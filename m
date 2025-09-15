Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DE1CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:20:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.30256.1757935218604280542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RdphWY0W;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so8041104a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757935217; x=1758540017; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgNgOWiFRxggBLMhtw+AwMpR0pCJbdHnfr23Z/y7FJs=;
        b=RdphWY0WIm+ID/T/QTn3ct7juooLZk4fOQxCOmQHAfnexdMZnrdJWysoT/0v/7GE8S
         4db447ZB4AHRdJryrK4LsnWqN1ZF0AQB3HEfVc23jcMqpCQSraPtpHbCfyPWE1ktyS3O
         9C8ZFLR7PAfZHQxcIbdHXVUEwll24ILpHIp3s4ARqrpNOXFjTaXQeuSMvO81t2+i5ujW
         Jt0nNR3BJf9fwdViQy59Dq4U0PSyiXXLHBOfFBnMIvUfD+W78sLApTMarNt0MoQVlHLP
         1om7irppMToku/inWbCGhY4h19XOQAc7ekf9B6AKxL8TeQ44AyXP3y+R0k9DsYbGlAfU
         dRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757935217; x=1758540017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgNgOWiFRxggBLMhtw+AwMpR0pCJbdHnfr23Z/y7FJs=;
        b=k7+Klzy/UeMYxzQ6fEGaecX2/t7O8yhnDKIsUU/XfswxaH1pyjY4MQQtPVJDwsm2u3
         ug+9JQI/1gnGG63L52rOc0O0XdTUxgu2LIKp/u1SDVouM4OThn6MyfoXbJ7FOzuYDA0j
         ODJ7ZRH3aAo1PTiKs7z/1AgXPbwnMe2qQagXIr1gmxFP8ezyjIvGwUIwvGLLKJD37m1x
         8cTyEAWPOfsOZ37H4nK7stM+V4/3QmqqlcjaAQVwefHjdM9hYxqPUpNMhvFftWIdg4gM
         tHKYySBGMet59oP8YmNNYMJDUnPdbb4eRg2Cy1uvzswHWA7DM4CU7i69OSx70wVsQe2z
         f0lw==
X-Forwarded-Encrypted: i=1; AJvYcCXcaRW/i5yNZeHOKD/lqwNYK05cTiH63ya0L00xRWp70l+ySwn97gijMwO7uJyS2OXwLB4UyjvJqZO62S7lA/hl0/s=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxekI1VTGODAz69xUKgeYX5hoBcef3N7fsGlSL8SfkmPj2wHh4l
	e3Gz9woQ4VUCWhFqHmFAFbR1aB1uNsMdrt2yS5Sm2fhHAqkuRmXcNhai
X-Gm-Gg: ASbGnctCFvBwrqCn7bHmxBZERe/BpruwCbdbY41YcPD06Yt3wvAXJf9wW/7qZnyf0UW
	sopPzResM+v/IQ6b0LGK05DM8rVUeP9wSLUyndlc1qWU4EeZ1P2BuTbDIOmQc/GwUurAHCloFWQ
	dhUJlOoEjtcydhEXwlnjSzjky141k+Hk70Z3TGK89lnyX03zgA4Zeb3b2sacRvjQTfis6n+pVGx
	vE8Nl1iEa0bHnBzmDguuHD0XmszpSJvm2ZnJXGTg8j/fuYaNBaA4NA8rbrx7qKPM8x1B3ZxCfHX
	tE+qPUq4XIbgJ1EU3Z8x6VJN3N7CarR6mqNisZBI8EDDZhM9DFQiwrm6NEEz81zz/nv9Fm6G/ZA
	q44R93JSdbndogXda/FJ0Z76ACHscqHiteqcfDE+Itw==
X-Google-Smtp-Source: AGHT+IGOoL1HdQEcrpzw8qOHZy5S+2nE5Batuqe+1L4SUNP51WISTY2ztTPZuNMgL1jIKmdgN6sRaw==
X-Received: by 2002:a05:6402:52c3:b0:61d:3447:9356 with SMTP id 4fb4d7f45d1cf-62ed827186fmr10708666a12.12.1757935216783;
        Mon, 15 Sep 2025 04:20:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f4b8ec394sm902732a12.1.2025.09.15.04.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:20:16 -0700 (PDT)
Message-ID: <dff31734-f80b-4f63-b31e-19a2937c4b65@gmail.com>
Date: Mon, 15 Sep 2025 13:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] linuxptp: Add systemd instance
 specifier for ptp4l dependency
To: csokas.bence@prolan.hu, openembedded-devel@lists.openembedded.org
Cc: Martin Schwan <m.schwan@phytec.de>, Khem Raj <raj.khem@gmail.com>
References: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
 <20250915095310.800122-2-csokas.bence@prolan.hu>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250915095310.800122-2-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 11:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119407

Note that this has been part of Scarthgap since a few hours ago:
https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=10fc22193840ad6f8d08aa05af0f1823714bfaaa

On 9/15/25 11:53, Csókás Bence via lists.openembedded.org wrote:
> From: Martin Schwan <m.schwan@phytec.de>
>
> Add the instance specifier to the ptp4l dependency for the phc2sys
> service, so the corresponding service is automatically started
> correctly. This fixes the following error messages, when starting the
> phc2sys@... service:
>
>     Failed to restart phc2sys@eth0.service: Unit ptp4l.service not found.
>
> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 31f0b9d3d51a65b1c3d63eb6520e7ab174a8550c)
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
>  .../linuxptp/linuxptp/systemd/phc2sys@.service.in             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in
> index f66dd2d010..7d1d975ea3 100644
> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in
> @@ -1,8 +1,8 @@
>  [Unit]
>  Description=Synchronize system clock or PTP hardware clock (PHC)
>  Documentation=man:phc2sys
> -Requires=ptp4l.service
> -After=ptp4l.service
> +Requires=ptp4l@%i.service
> +After=ptp4l@%i.service
>  Before=time-sync.target
>  
>  [Service]
>
> base-commit: 205638f9edf8e1aa1fbcf28555625fe56f2701a5
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119406): https://lists.openembedded.org/g/openembedded-devel/message/119406
> Mute This Topic: https://lists.openembedded.org/mt/115251470/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


