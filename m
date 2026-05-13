Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C640CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 06:57:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1773.1778655451689188885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 23:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UcbCYosm;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba840146so57005465e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778655450; x=1779260250; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBtLbnEH2hNUVAfR2cjFyBI1OwZI+sL7dbJnUSui6oc=;
        b=UcbCYosm31rEXA4eTlIyLMhBcbSToZGLB2TdYDy2EGx90Em8vl5YHgOfiOdZeVIhjP
         KKGMOSifOm/kJW28/kO2bG8IWYNmv9NBmaNlN0Ud2I7Oj+uFL41RSR1PpZvTy7agNMPm
         Oz+5DiT276hvQ9IcpDfBlFBudZDkIZrnyohf7bEB8e1uhhPCr9nOMj0GsXJvO0/mbsG8
         /alV7OZkUVgbIvq8apx8PoryFarMhAgzThnTUhrOlMDywM7mzTLzY/aR2uEABB4Ewo9Y
         9QgQbRkt56uehzTJRU1unQvOCQ6EOpcVYgrj5UydzbZ3IHt7ISsdCk43PTyZCbAh6GzV
         /usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655450; x=1779260250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBtLbnEH2hNUVAfR2cjFyBI1OwZI+sL7dbJnUSui6oc=;
        b=RJqUYFFPtG/QaydeyhAsQTiDBMfo2WMmtxLUf7yV5hA52jytX8HZ4s0DeLHFZrb0ym
         LTRg/oiNXRw3oP/gWpzufpHFd+HbiaTUM+QiEWhkX8PRGWMqjd6APId3YK8ujs2fKjOy
         advWi4T863HZnjldvrWRa91UBMXIeeEbJ3NkXUeWUgtrX6F9P5WJp3zgscx7Gg8TgBZv
         arc0yFtdHZjSWJiutaXfpSDPPkgyxfYUgh9iSTru9GA2rnAkRrMLWc4Hesx6JV+CPTSV
         XgnvY9p1PbKnjYLBExIJ4NjIrhWQw2C9nSE0WyyZkQUKCo+LtGuBQmO/xRJmNFW9kIkX
         hKOg==
X-Forwarded-Encrypted: i=1; AFNElJ9VpkosskvHMsoJyJFPkEljC78ysa5v5fnS17V82wc6DwwhmXtPdb9VQgvWvM2CECPtdv7RkJ/oexlqcK8ZqXX/6MM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy719yTNRExtzrMkyExhI5TsEU3AM4J8tcD/LFCMa4o9GmChMq3
	4Xw/FlpaKngysGcLX5vrU6UwcUGD3C4Kq62trEwRbWEYYLVepExgtWP8
X-Gm-Gg: Acq92OFvgwY2hvrQBaNfAAgRo96RNnuy2ec5d+mMd5sAwFMFZY0SNDFtirbkkAb6Kb8
	vUw0fDsx/DPnuSS1IqJWVh7WVoDwmzKAUVL6NMt1UKAX3cWV+IR09kBJBVvCJod08XSeXQZt+TW
	k7y/slHxAqZ+TSLoJcjul7zKuegThkFG/w2KP89Yp59yPGL0gpO6k1S4W1ytcVKhWXUy1Sif5hW
	CgItY5ORsIEzi0/Buytao7kK/PWiF5RgtIrzdKlFjpupnxWVwYIsaToHy0RWTBXClkBIH9i8TL9
	SE8+4U+ZJn2temOL3Xa6L1WPu7W5Z2WbdTcG2tUTC9wDCBdqSoWM1aQv3kUcPpet3FcMrWlrHht
	HqSR0wbA31kgCFcgFFsqiJGYUAUWfDNs/LNhiUdvAIaqlRTZSaQNamKA1qQGcUG94IPRL2uLodS
	1fGsASXr34c45tQ8u/velQdb0qddM8CVk=
X-Received: by 2002:a05:600c:4453:b0:48e:526e:1011 with SMTP id 5b1f17b1804b1-48fc9a434cbmr28078775e9.25.1778655449720;
        Tue, 12 May 2026 23:57:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6470sm32605340f8f.7.2026.05.12.23.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 23:57:29 -0700 (PDT)
Message-ID: <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com>
Date: Wed, 13 May 2026 08:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
 <2022222.1778130561122567168@lists.openembedded.org>
 <2115555.1778654861364723634@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <2115555.1778654861364723634@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 06:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126953


On 5/13/26 08:47, AshishKumar Mishra via lists.openembedded.org wrote:
> Hi Team, 
> Can team please take this to be merged in master branch 
>  

It's currently undergoing tests in the master-next branch:
https://git.openembedded.org/meta-openembedded/log/?h=master-next




