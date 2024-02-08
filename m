Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23147C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 12:07:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.16242.1707394039990175488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 04:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KN+YX3hm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4101fc00832so10868965e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707394038; x=1707998838; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOtKRrnArRge3BS8OlDBinUAsxDoKJzcFNLwxLKWKBs=;
        b=KN+YX3hmKHszQ304uGoXEvANqobm0ay+sKcx9sKi4tckokECruVZS/1w6HNoxxBI/X
         9iC8SP0Xeh70sHdQWuOcUNcSBPYbGRCRrUuquedqL9QKy9V3sIJv6YZFMOu/V+w4eDd6
         s9ubupNMhemyvE6czT1lc6FlLy3VN7Jbf7Ujxcm/LdIsS6YV+7mDoPhWqsZYBXSu0I84
         tzctcHbRdJhtUhX5Y64lHRNZ2JnVDSonrbyJUxCm9Q64Ebn0gWBKNO6JUHyLUE1mn1G7
         7+YhX13g4vjjga+Crpzb+v1JPBl/bMQLRokHnUXh/7Qt6OzxV5+aYELKgGzbreVe3wPJ
         phWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707394038; x=1707998838;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOtKRrnArRge3BS8OlDBinUAsxDoKJzcFNLwxLKWKBs=;
        b=L4iH5QIb7W2O3BQ3JjW+f/uPCpJlkfSGYTcu4b05zu+5FD4WACM69ZOqeiLlW4DtAR
         JWitxxHd4SDwGWomi7qNdqHocLEUuuO8/QKbiTjABT5jEJ1VJDNX+IlWvDjHXRyLJd0f
         D5ilzeyL/rnJam3hUJEYjL5yqC9k0xDMQBf15l9UVbZGalWIiJ5B+uLb9yYaJ3L4MaC+
         me4Zq3t0oO5EJz5887ge18OsvxZ/LAL0EHI71z7gUweS5dvM4bY1z3Xye7NP+A/Wm/8v
         nmKEKo4tUhMAAIcxKx2ebPrejDk65ht4/fUah80nKxYNUNTokHSKL4sc0XmDinX/2tBE
         QrmA==
X-Gm-Message-State: AOJu0Yw2598Wpa+3+7VlrIvYf4nJaP9EwIrrxhN1CeZHFUS2Ns+s7yH9
	yorMxfvBSHgdbKJyknKitFxieB+GuCNphmBFxKphDMyzI2mmdNWa
X-Google-Smtp-Source: AGHT+IECLqYYa0zRz8QoVk3/84xppM7k3M2xFp7B6q+5eAoDGsy+3/g6BDXU46a5a+t5+e5B5DszFA==
X-Received: by 2002:a05:600c:68c8:b0:40f:ddb8:c854 with SMTP id jd8-20020a05600c68c800b0040fddb8c854mr6239904wmb.28.1707394037964;
        Thu, 08 Feb 2024 04:07:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTH2lmq+Jw0MseU7GA8Q/1qlHKvL2ajoY6KM+3Gl5NsqUwvhqQBuvGr4AUR7VrcDdSr1CXsJUYg2zPYE+knqE=
Received: from [10.139.2.160] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id c5-20020a5d4f05000000b0033b1b1da2adsm3469143wru.99.2024.02.08.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 04:07:17 -0800 (PST)
Message-ID: <e9d73f7c-b1f8-4ee2-9e89-be680a8e8c96@gmail.com>
Date: Thu, 8 Feb 2024 13:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] patch: grpc: point to the native protobuf compiler
 binary now fails
Content-Language: en-US
To: Joakim.Tjernlund@infinera.com, Denys Dmytriyenko <denis@denix.org>
References: <PH0PR10MB461540FA7C12FFEA23710637F4442@PH0PR10MB4615.namprd10.prod.outlook.com>
 <PH0PR10MB4615FC516BFA9CB8AB982F4AF4442@PH0PR10MB4615.namprd10.prod.outlook.com>
Cc: openembedded-devel@lists.openembedded.org
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <PH0PR10MB4615FC516BFA9CB8AB982F4AF4442@PH0PR10MB4615.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 12:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108665

Joakim,
Could this 
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-devtools/protobuf?id=b1deec0de476d8f0a0c6427919f57ee5f681ea0e 
fix your failure?

Which branch do you build?

Note, oe-core is a wrong list for this discussion, I changed the CC 
accordingly.

Slava

On 08.02.2024 12:57, Joakim Tjernlund via lists.openembedded.org wrote:
> oops, built in wrong window. Removing the line does not help
> I get the same error:
> /home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-linux/usr/bin/protoc-23.4.0 does not exist
>
> Using nanbield
>
> Joakim
>
> ________________________________________
> From: Joakim Tjernlund
> Sent: 08 February 2024 12:45
> To: openembedded-core; Denys Dmytriyenko
> Subject: patch: grpc: point to the native protobuf compiler binary now fails
>
> The patch now fail to build sdk for grpc_1.56.2.bb for me.
> Removing this line makes it build.
> Please advise
>
>     Joakim
>
> commit 54885a5af2da26d7c84f8aff6fc845c2681b2890
> Author: Denys Dmytriyenko <denis@denix.org>
> Date:   Fri Jun 9 04:37:15 2023
>
>      grpc: point to the native protobuf compiler binary
>
>      Latest version of grpc fails to build nativesdk variant since it finds
>      and tries to execute protoc binary from nativesdk-protobuf instead of
>      protobuf-native. Shortcut the detection logic by pointing to the correct
>      version of protoc binary in native sysroot.
>
>      Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>      Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195144): https://lists.openembedded.org/g/openembedded-core/message/195144
> Mute This Topic: https://lists.openembedded.org/mt/104237000/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Yours sincerely,
Vyacheslav V. Yurkov


