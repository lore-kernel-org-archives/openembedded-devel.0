Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DCBCA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 08:51:18 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.49832.1755420667494447226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 01:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jonDhR3h;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b7949f6so6249338a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755420666; x=1756025466; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQIOpIyBk75v9V/G0f6WhSgc8YnvcKuwSLIcOmArC8o=;
        b=jonDhR3hp14ovD1TWPuIW2/DrVIKobvR7E8OauXeemHrwX4KkCRful0/+fAeJlXhBg
         ahN7793lzvQex8dWbPqgrzVDssUcw+J5y5l4boiDNDwNAo2c6vUdXRJSakG3FKnpyoUU
         hVxxYwe8QyramHtjTq4VP2LrY8w3bQfnvPBZMP73+FX3WuchwKV5E+Uja7WrVlS/h7Lt
         ihUrhsqKV5GrIVb/sWyLbGXpDD6yP3GO3GZMr9KOn5/N65PRP4hr61ojn9T9R42ZZUxy
         R7X+PJ3QWTscZVgGYFLvOeyNakEdUB4fJT3BTDQlTzaBp5nUqGx2gK58QZ74QlX0MAxH
         ojyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755420666; x=1756025466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQIOpIyBk75v9V/G0f6WhSgc8YnvcKuwSLIcOmArC8o=;
        b=c9XZ2vpHYCyQ7obytz2WL8iAAuQ9hFieQXOvbX8tgTWJAKT2TtPCekEhtAEOX3BRTp
         LFbR3Nz0l6lFFUUk3Aj3loQ3JOKLeMLoSHttjdap7/174XXUtdKRtYzDZknCsp0Dg3Ww
         Vk6SRzzGaCT1m/hdEe31l6dIHYe8i2NGWGhk0cYRvFv9tsVXj1KyuDyx8PPoq8aV4H0F
         GNAxTxlhIhW2m0oACMl0iG4PijyI9Lskd8NakS8vU33cCBiKYioNF8q4evuWL9V5SK+2
         LN7wtIhb2HqgtA8+0LVANxvQXKf3p+83wUxkMye1N+0r86fd8nITHGvG6g6P90d7ieQU
         N33A==
X-Forwarded-Encrypted: i=1; AJvYcCU5uCx8YZbfuXOOFzPRe4jP6xqsSiwQhZ8Nxc9E6oFwAK4W/qPgsOFwbCCz6HpSuqdsRJB4XUHtNDHhVhSCXlFEHKU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YycKoy8pa1gxOiVqlbuv+ovOR0yQJM6eQMN9Ac0nCdVv11jKFxN
	o57/AiIdXfSrLvWCj4PR+HVUfNJqP3NvIRR79iiJwUkNWF8JLhdlLyLB
X-Gm-Gg: ASbGncuKNKdhXYB4CqVSQGrOiodlTAHSKrnuWAAcvRhgWLVoMmjTikYHi+KsRjnGSob
	6qwq8gpV+Y0gtYTjclNSsQKY657Lk88nV9CwTBR9z7Hqnbjl6ymnDqSrdFstb/Gfw13qvPYkPJJ
	uOR0JP2FN/jSbFOfsxG+qn3FGk1Bt2PSWCOPKOBsnWBQugHAKMjzP4bM0FqZ5aM0LVTTRltTTgf
	Ku8v7GM1a+IpfPb/JbroKpG9vBae7x7UekTFKLMfQvOkZAIRRW/MGdnPbdF9m8S4lVvVyRchKGC
	rKXJJKtHrvnWelOTmwySFTNh9H7LxdBV1M8U4HzBnql/xTl8E+qxDpiBgi24j6JBecIpWdl09dX
	W3p/ubTAb/AH+QaHcOVbCs645Xlghfogxo3HXjpqu8Q==
X-Google-Smtp-Source: AGHT+IE3unU8xzipMU9vWW8vk2cIZmtl993zhTjhih2sE1Any1exw8ChP/1KG2EnDdXylODkK1bsew==
X-Received: by 2002:a05:6402:13cd:b0:618:6a59:5500 with SMTP id 4fb4d7f45d1cf-618b050c328mr6392197a12.1.1755420665600;
        Sun, 17 Aug 2025 01:51:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9d30c2sm4813092a12.10.2025.08.17.01.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 01:51:05 -0700 (PDT)
Message-ID: <b08df79e-fbf3-4f56-8526-f8853ed47b69@gmail.com>
Date: Sun, 17 Aug 2025 10:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] gitpkgv.bbclass: Issue when using BB_GIT_SHALLOW = "1"
To: WXbet@proton.me, openembedded-devel@lists.openembedded.org
References: <vox3.1755346549855678236.CfD2@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <vox3.1755346549855678236.CfD2@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 08:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118980

On 8/16/25 14:15, WXbet via lists.openembedded.org wrote:
> In oe-alliance build system we use this setting for all git
> repositiories to fetch from:
> BB_GIT_SHALLOW_DEPTH = "1"
> BB_GIT_SHALLOW = "1"
> There are changes in bitbake fetcher module the last months that
> result in gitNone0 ipk files now, when recipes using inherit gitpkgv
> class.
> Seems the gitpkgv class is not able to fetch tag information anymore.
>  
> Question: Are we doing something wrong? Is this combination not
> supported anymore?
>

This rather looks like a bug.

