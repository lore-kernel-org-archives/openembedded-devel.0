Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A25D1038B
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 08:06:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8664.1764144400692898860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 00:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tf+R0bpi;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b427cda88so4310975f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764144399; x=1764749199; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOUHK0uLHET1+A9q7iR88583NETU4Uy45FvRR+ns35g=;
        b=Tf+R0bpiWRRvSukGf6g66wCT95ATDnrez0nDxwK37JumK9cJAknCLO1VseQv+rvW8s
         973N3z6lBTJuD7peHkrflSefInm/eTY4tic1sho+eLpFWFQiMnLkYP1iXhnxPAb1FUqR
         T0+jiERctvhMNGUcvdaOs2dvIRlLkX+r0mbcCnJUKInpcjhXx7R8XsM/MPoiBOKLyAZN
         52KkI5wZWLLrNye9CJYYj0x8WfGX81V38UwhGZ+1+pjYpZ3qr8pwJgo8t2drBYjJv2RG
         +64RsM3ZDUcByikrbKjc00kfUK8RIZjQTY2MMKqBHSy+GAnXZvCoCa7aWU5cELI28QFD
         Nt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764144399; x=1764749199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOUHK0uLHET1+A9q7iR88583NETU4Uy45FvRR+ns35g=;
        b=NVgQ+NV55aeLwGCRDycr33kI76pQI4pcAP2tsIX3YVdI345i9clT+5KWExOGuphLpA
         f0ofeq4CeJPcoUBL9BhG+gbGgRhMzvuGfPTAzv6LS4J3LCDztL6VTaXYn6nZ/MtYnLIQ
         uIuRAa59G+c7YrEBXKQvu4G3rw1N89nE3XWvMfmDP/C0TFQeZ0Xr0oslwB9IzfSacATm
         q0QbfkNwFZzn9P0qfF75W47iUcdTdw1or4jyeOidYYJUBwPA13okO5tw7moMvUaDmYeV
         3rQ3mW8HKhnpfv8+S9idIkcXBSH5iCWTuc+o+b+/Gg13npuQIeqf7llcI5q+92SbOai7
         2e0g==
X-Gm-Message-State: AOJu0YwguIP63Q+QYL5skMDa6Uq+cDEmgW9BwBYArsSI3r1QGjhytQYM
	6dD5UB52WBL5xRb3me/+MPVxQrZ2FrCB+vU2OOGul7tCFX9x/fRf3qInuzT67A==
X-Gm-Gg: ASbGncsi9GHM2Os12LvEGMHSWGUuHfMTBGdfwqzh7e7heIs3oreb8tEIKoHZN1b1h3l
	kwHynQMfpHN6kimHMY9ZSGl6+rSfN6cDP7SAWg7jOr0BK8AIzN40WWufLUIbGDZGuKIeJ3AYyOs
	c3izvfXN3KKd3z0QpPm+oOTb7mXlhotTpg9Fe+desnpfhE4h3uyknpTBJ18Qse/Cug4vk7zt0NM
	73V0GZtaQo7uU/gIYy/F8DssDIhZolMFxXAGo3GDSzPVC3DRdbmZhur4HnaxB0Bc7Bd0WThATuI
	v8BQHPZISN46gRlWefQOeOrjmL2sT0zcsbAPgzURZc8ueoKyMbpal/PHEGfcvvOIZPemyNrVQCk
	TYVLzXGB2g1CCQ/SzhGW//xsUcDIrVhPCns0AC6/VAad0bA8+Jp9qvDOG0AvhkeP0uErJ+txglK
	28OycotmmjJ9K8mrm9rwk=
X-Google-Smtp-Source: AGHT+IEYx+yz6h+l34S/xz3qtvdvmysICL4BSCiPvEQ4tiM/0Hx07ZS+oKpXa3435p6GPItPqP8aNQ==
X-Received: by 2002:a05:6000:178b:b0:42b:487c:d7cb with SMTP id ffacd0b85a97d-42cc1cf3860mr19558250f8f.34.1764144398821;
        Wed, 26 Nov 2025 00:06:38 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f3635bsm39489154f8f.17.2025.11.26.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:06:38 -0800 (PST)
Message-ID: <cefc6fd8-a7f3-49ab-b1e9-6fffb0c6cb58@gmail.com>
Date: Wed, 26 Nov 2025 09:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] xrdp: upgrade 0.9.20 -> 0.10.4.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251125165528.1991859-1-skandigraun@gmail.com>
 <CAMKF1sp+9D+YhJtMsYU2e36xvKbLhWEvxOnX8GEqVhrdyJDfYQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sp+9D+YhJtMsYU2e36xvKbLhWEvxOnX8GEqVhrdyJDfYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 08:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122075

On 11/26/25 00:32, Khem Raj wrote:
> this breaks xorgxrdp recipe
>

Sent an update for xorgxrdp.

> https://errors.yoctoproject.org/Errors/Details/889900/
>

