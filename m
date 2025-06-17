Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E754AC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:49:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14058.1750150178694041217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZYwrEb+;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso46236825e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750150177; x=1750754977; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oGuV9KAJWgDs/yMY46rUpAHkGntAX+PrV8bULwU58Hw=;
        b=CZYwrEb+ptHuJzpKfcLjoPfILU5i65e6XCge3mnvMsuua0cLdcLYH/VFKTYpwfD1b6
         5eFPYnVopIPd3fVy7xqMdNPXV1vJTwCtIXf3HZ8WZGEXnYQxgRzL+MW6DGiDKaPFVT/X
         pdfzWmd9QO+GTst7z3ul/eqhLboesr07vxO1+czJdVrI/C24ifoxPtzyw6KBxM6xB71V
         I5Re3kUuZ5XgfO+SnGXzeS8ym6d5U7s/DEwLxtEaaId8+uDwKV24yBeT1E2EzKaROTLP
         vdiMZEp1AntIUH9BF+fUbw/psTyn0+oTrfcMH/d0u1md/Xr8JdudJB8wmhyvzeoeICzz
         cRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150177; x=1750754977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGuV9KAJWgDs/yMY46rUpAHkGntAX+PrV8bULwU58Hw=;
        b=bY32aU16TOO3CG2Ubki928WivTLRAASj2Xe+mNI4gSrfcIUmj/j7WZx5O35287YCt/
         u0VDQFbPjdlcLZx7+AqutZFHLzytjHF8olkCiWAXqpnmLH6AFuy9wzPUonPUYexUR1P8
         21b9RWDADjkBTUJJYwJwj/FVUaqMwBfiV5oUbRr9ucNVUHO1M3Qt8DiVWwzxU/dS+b/Y
         eyfzYDyNGbsKeONtZoJ1LGEDb+E+GQsxYKDMLdMER+JtBVba3+NH3KkX6oU+HXqtetGO
         SAvow105mvipiiYA+m9xHGWPOUKegnmNu18UULtCsTLj3GHhdkO3MCStOSbUKveCDHNF
         8zIg==
X-Forwarded-Encrypted: i=1; AJvYcCVqmhdzSIqH/6BckuOG8DVSequemyOM8yDugfGjAjMVsjVccmUBFj3Gvp9/+jJMEqrZPe8RimVqQnQhjv7wXqUVXjA=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1+VW9JCdht8uSJdI799n+cmgJAOLC+BDoXSKga3F1svW9sxHY
	BWvoPeH5EIOKAEMr8KT10SyZxWcgkh4kcR6BpEgkbxgybPUiZSUl1T6O
X-Gm-Gg: ASbGncvqZbEU6FO6k/nbOHcD5BYPhbVoPl5vEY3Lp5oSvdVAxEvKd/CF8Zu50wSNUr3
	maiQkxAy9Otcyim7Jpq/NiB1FTXgE0AcGz/GpwqeYDW13Bt2yVMJ4yjIXaqqCMSAPDXMfO+8owp
	2IED+gAhX4DNjYKSYrHGAYglf1oIPQ5FkHvoeEaW15V5imhIc+wJxw3jiu8/mE5F4+ZkcNqk47A
	agix0IUgtxkaxaiJbC/OHKAcPOJslIzh3QbFs6J45GWiEtTqGxnKdl7ELv0U5zFnZ9GeXrD6eZA
	xCxK/9zh5JPmE2j5qmv8hKkjGkTaxZBhYu6pWJNMwBAoypqYUkwNldpGSaNrUnNgHmMD/PbdS20
	I7vq2
X-Google-Smtp-Source: AGHT+IEfuAr0qdzv4/qnPGtXnps7egBJPpbE3UdSPBLRYeH/y4DK8OIuSdXup9BcnzmiYX4ehFqRRA==
X-Received: by 2002:a05:600c:820c:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-4533caa2186mr119057385e9.17.1750150176219;
        Tue, 17 Jun 2025 01:49:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6ee12sm13309347f8f.31.2025.06.17.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:49:35 -0700 (PDT)
Message-ID: <45d975c1-45ba-4046-986d-3be24b38f6b9@gmail.com>
Date: Tue, 17 Jun 2025 10:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] smarty: Drop allarch
To: Chris Paterson <Chris.Paterson2@renesas.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <18415ACCB9C1FC11.11990@lists.openembedded.org>
 <OS7PR01MB151309CB28F4D907420E19720B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
 <2a08db91-f139-4bd7-ac0f-14c89a0dc784@gmail.com>
 <OS7PR01MB15130647C07EB7E8967CC9532B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <OS7PR01MB15130647C07EB7E8967CC9532B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 08:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117922

On 6/17/25 09:55, Chris Paterson wrote:
> Hello Gyorgy,
>
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: 17 June 2025 07:57
>>
>> On 6/17/25 08:50, Chris Paterson via lists.openembedded.org wrote:
>>> Does anyone have any opinions on this patch?
>>> Have I missed a step in the bug reporting/fixing process for meta-oe?
>>>
>>> I also sent some related patches on the 22/05 but I won't spam the ML by
>> pining them all right now.
>>
>> This has been part of master branch since a while:
>> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-
>> support/smarty/smarty_5.4.5.bb?id=1e571fdddee552d6a54a72f5a6926ec65a3d392e
> So it is!
> Sorry for the noise!
>
> I was foolishly only checking the Walnascar branch as that's the version I'm currently based on.
>

That's a bit different. When you submit a patch, that will go to master
branch by default. If you would like a patch to appear in a stable
branch like Walnascar, then you need to submit the patch specifically
for that branch (in the readme of the specific branch it is described
how to, it just needs an extra tag in the subject). Not all patches are
accepted in stable branches, but this particular patch looks like
something that is required there too, so that's not something to worry
about.

(Though master branch submissions appear quick in the repo, stable
branches are merged only once a month)

>> In case there is no problem with a patch and there is nothing to
>> discuss, usually it is just accepted and applied in a day or two after
>> submission without any feedback.
> Thank you for the information.
>
> Kind regards, Chris
>
>>> Thanks, Chris
>>>


