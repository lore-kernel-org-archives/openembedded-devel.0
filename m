Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A82AF436A0
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:18:51 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44812.1776431925353784191
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qWYKaLKA;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-471618e202bso172463b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776431924; x=1777036724; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mQythQEDQSec+dzl/gm7XvHa2++A1RTUzoIyTNyrVQ=;
        b=qWYKaLKAuscJQbnnDJ6fNbwzfXwf0rdHI8IQojtrBlRAEvmH65muXJjlZ3279A34NT
         oFYlWt/+bjQONdFchPa9aL4/i6bNuHzICqxCPyWmJ3GyMmmckCZ9p2XlvAdOQh5pNGUp
         T5Gednvt7e13YPMRkRLfcJ7WYOy8k54CJSPhW2nWxROgM9y3cpgM4xgF+0AJlbGW4mLK
         OmfN4i5iRR/kkGe1qgKlMGdwcSu9iPpRP508E3vJQS4WZSv0bD+fHaM11bp16F/hPj5Y
         MueWS94o3fRxsihh87EhhoDSHcbvrdJ3wT/AWLby45nrjf5/Cd6gJ+mwcVkQ3Fx5ZXzR
         6ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431924; x=1777036724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mQythQEDQSec+dzl/gm7XvHa2++A1RTUzoIyTNyrVQ=;
        b=U4rgqYb2mYUfpbxVrUxdADHT835+tzzNkMFwbgNdOvTVS/tf1PhriQ7QNtesnMCHlT
         2HqYedmpdKYivtif54OvAJ8jXNpJXqkqoOs15jO4K6Yc34l1iFV5/sjyJpSM9lmBYXLM
         p6ZWnQnz6kLy7QUV7PB9Ycb1xZKa48g2ouaLh7wP3brK+alMA1RKNf8VB1bAzi7lCzku
         c0U9lFMMhva/yofG4HgLJVhPUGpxOcHqdneYbBVMgja61Pie8PifWUv5WGq0MgG9qV/f
         +csRUZxiQegvaukN5jiUNICZ69hmHvs/R1RnACzB7DzGK7JDBShFgGp8e//RpMCy+bDb
         ksfA==
X-Forwarded-Encrypted: i=1; AFNElJ/DIGRLygkwOw7sDPDF94UWPaFyKalQaE5xkBbkqI2QsbxD6S+QrzfarfgTwsVlHRWDdBixuSgm1tkIuFNYyr5/6/k=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1DkdXcsypZVaLDw/F9L07W9i+A0VRy1YupRoLbw5fOqnutyyF
	QvNzWkFfKqioMzIy/4Unc/QZVawNuaNbv11/Lz0iW5/GEFEjxrbS9VkV
X-Gm-Gg: AeBDiesIkQQytAkmiFJQHUOlttcCiqYfMcUgy/dNqMG1UTM4DjLL1roFYzrW94QnCBu
	GSeT3PlFhDO2zfMYWpQgdOr3ZjXY2E4pzao640/6XkiQenBYmNV92N9u6ZFdHKimxXxj73phpce
	Z4x9O4d2dARAIG5Zw8bI4A3CXN6FJxnFFmJqFpGLtkpD1nuz7uu/JL2OCBASEY9H89jyt4D7lX1
	phy7wPYRdOj4aKShks3dxfCA38cO9bOogbX/28EJ21sLOutjV8OtBo6Rf2BVaxSjBqiqJ36j3l2
	uj42agM8AMcjiSWFtxjrvoDY8P77uDsKubHsCjL/pv8QRBa3SxzlxPgBNVxN7gzaHZ/yKzBWoGZ
	NbyO34PQ8xqxaD+i6iKP3zN+zXEl4Nrdh3Glq0Lp/F7sksBEa1xi2dhQcGGiXWOXtBJxkQZYjFi
	HnGPJ3lz/XDG215JrfqOrxwxrDIw3wSOOITWx5cyYd1DDGKQwn4hcF+FWPCLIg7RCkwwLtWNQnr
	qVgfO52kdnARxY=
X-Received: by 2002:a05:6808:80b0:b0:467:1c9e:2121 with SMTP id 5614622812f47-4799c815ec6mr1261576b6e.1.1776431924475;
        Fri, 17 Apr 2026 06:18:44 -0700 (PDT)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b8fe2c52bsm1290469fac.0.2026.04.17.06.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:18:44 -0700 (PDT)
Message-ID: <ac4fd424-8536-47a9-bc73-f37e09e5a1af@gmail.com>
Date: Fri, 17 Apr 2026 07:18:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 Hiago De Franco <hfranco@baylibre.com>,
 openembedded-devel@lists.openembedded.org,
 Trevor Gamblin <tgamblin@baylibre.com>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
 <18A6F268395035B3.1570320@lists.openembedded.org>
 <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
 <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 13:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126437

>>
>> A BBMASK on uutils-coreutils will fix the issue for now, until I move to
>> the next LTS.

This is my current workaround.

> 
> 
> I think your patch could be acceptable and useful for Scarthgap, if you
> are interested in that.
> 
> 

This was an attempt to fix the problem on Scarthgap:
https://lists.openembedded.org/g/openembedded-devel/topic/118522554

