Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87407C4345F
	for <webhook@archiver.kernel.org>; Sat, 27 Apr 2024 21:39:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.20436.1714253949635078432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Apr 2024 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=2Vpqp7sc;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b79451128so15134555e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 14:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714253947; x=1714858747; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fwMQNzsfLjnouH+5D2n5egY3vPmYxygGcW2zOTuePk0=;
        b=2Vpqp7scMaccs8H2npa+eNWRAIL8YuUt6Hocf1/xggJqe8UMHMTARnTx6YEXKArf6G
         PJmcPsbg79+dZygpUtHIdOY/5ygct7vc+d/vxkBlnfE/vDdDigiKvVFgFCSvLPjjuzS7
         gszir/J3HCNcz+qu4J9yrHz3Kb2Xgt1nlwRlwGlpM63emCPyQfJ4ZW7zw3u8XRXQ+L9j
         3hxiBEDmN2U/cm5TfTEfeuORyyJTJAtVYn6hnn6gJRhLu7bg0sZDvZYLqqAOqeJ8xZ0/
         BsSxxePKNRSxxCgiqNDU3xFIvp+63GIDXz7+AhMIUvBw4zsIfa9kq+mam4rsODM5YJ0d
         +tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714253947; x=1714858747;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwMQNzsfLjnouH+5D2n5egY3vPmYxygGcW2zOTuePk0=;
        b=xPsBsOOp/TlYs9AWk99fKECVf+Xr6NfhyGvM4cHZN1/Ak4AMqGpHNzoX5Y6Ot5s8hQ
         T7np9qPnijcUUteC8R48iCe1fSZEqCqMHeWVg/ZokQyTgUX15/ouh55ukOZRuQuvHePR
         oYqXHTAuaKujimWN8/60V1nMEfPoG2s2CZCbfvBmjJk2IRDRKfQKDjztLnvdiOQr87XV
         To3IxVfn/anE+ZZqb0yTNN+bfjUrdqfdY31gGGkFNA/yrL87K8iTgkm8ob5bQpGO2qDK
         meYKLvCO5zpgxFL5A2AIhup9mYQU43p+08KBQm+WV5ojUonPVBpGpavya+/N3gAJBrSS
         hDCw==
X-Gm-Message-State: AOJu0Yyca40052VENhDdoMJNd2FR9DcIXwq2C46Xvm7+dQqIZtnl7fbn
	4y4yQGSLW9o9EI6eevxpB9iX+me2q5ysmjNtj/3EkVc8y8tHWP6Alu15G/UXZFE3jyBsyS1FVUG
	WKF4=
X-Google-Smtp-Source: AGHT+IGuMowBf4TEFHm6vMZfFi/b7QbhhhyscEr773xF8fvxW0R85JJOOSumiJ7t795jgYKAWOVxCA==
X-Received: by 2002:a05:600c:34d1:b0:41a:aa6:b68c with SMTP id d17-20020a05600c34d100b0041a0aa6b68cmr4720374wmq.6.1714253947495;
        Sat, 27 Apr 2024 14:39:07 -0700 (PDT)
Received: from [192.168.0.27] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0041c120dd345sm351690wmq.21.2024.04.27.14.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Apr 2024 14:39:07 -0700 (PDT)
Message-ID: <ac271017-fddb-4fae-b6a3-cff2f9181a80@smile.fr>
Date: Sat, 27 Apr 2024 23:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-*][PATCH] reproducibility: move repro excludes from AB
 config.json to meta-oe
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240427213549.3458829-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240427213549.3458829-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110161



Le 27/04/2024 à 23:35, Yoann Congal a écrit :
> For now, the known non-reproducible packages list is stored inside the
> autobuilder config.json file. This is not ideal. Let's move this list
> into each layers of meta-openembedded.
> 
> These lists can be used with, in local.conf:
>   include conf/include/non-repro-meta-oe.inc
>   OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES = "${KNOWN_NON_REPRO_META_OE}"
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> v1->v2:
> * Fix meta-filesystem*s* name in inc file name and content to make it
>   coherent with the layer name.

This patch is a v2. I've resent it with the proper V2 tag.
Sorry for the noise.

-- 
Yoann Congal
Smile ECS - Tech Expert

