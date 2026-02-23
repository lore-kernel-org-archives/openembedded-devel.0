Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D9EEC1123
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:16:43 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2704.1771874195692604186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwzhms3g;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48069a48629so48648875e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874194; x=1772478994; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQfBbGJPXlHmmEXGjHRcR7XRyTHKhTaaLdUxBLtlsfg=;
        b=lwzhms3gAMQ99LPrkaLH4rrGwjm8MeGNQF1d58Nz2ong1ETqU3TxPW9LuwKxGySExY
         uQ3oYzpNtZGtx7A+rXPSyuP9sWBUHsuT2R6X97KffJ09QzjLOD1g+koJW7ijdbbMkWC/
         8RXkTit69EmBsbamaQ0zaLHzECc5HZvDDb+LXJLmGpZot1L4Tcxi9F9ChrTJfwg9Wgob
         ZotaiotpEwSMPGauCAxl72WHMD0UGb5jcdCu+7n+Yz1lScjuZMnlZn277RDpcQaEH/1D
         Qt34clAEuqak1U5/yrXI/NyiFyYthip16ZwyFR9x/+V8mv5VNPQYyZVHAAGDxHOivdiu
         rlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874194; x=1772478994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQfBbGJPXlHmmEXGjHRcR7XRyTHKhTaaLdUxBLtlsfg=;
        b=Zrv5kFdFEbUR+obHJdaNksRiXmkeVVLCrICzNqFLOV5lVYShKv3OxvkxERB1vECcc0
         /Kp4WB5ERT3P6XFkNR4QaQmgC7kNDDkoGuCmzmYYF4w1QtYviqlpouPqdrsebpAaFYk3
         lPVuEO6n8ngb57+yLqLhP25mqpXZYDjvaI3xqeoLFtzQ5qXIQXGSzuRVbbSCOgRRAB3t
         2P/Y09sV0Mvm5nuZrQAYRZz+f2eC25C3rimjYh9LUz2wolEEiSW3S9DuxPagKXHrbPmK
         5SHbqOAEWl90IRmsYOnM6UCo9z7B5Qpb6UFg3NpLgIrN6bL2ZUkAfk978mVCN5+lcl0T
         6+7A==
X-Forwarded-Encrypted: i=1; AJvYcCVqTI5GFWC27HNFhAelDvU6m82ZDvQzuutHbHOIpAba+9XACWspFakFIeo2wIrP4hY+kxr4fQGZj8VLHmFvi58rZHk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YySKqeenhmUBvkBvIv2Ns8ET1+JubyVbpabAbpnTuvQb8HycegZ
	V7wS9q9gVrFpWIBL3jO/A19P5RSnRQCPMo97na0mXkbWnS1Q3oqkFsd1
X-Gm-Gg: AZuq6aIZb0+FLqeGvcc1oEGRNUi3IZ466P7YpvvJXLNIX/k26yzzSzp8BDHPhBNh3mX
	5WYv9Ut8oBMk3gwutbfzD5dQeIDAZpNXK9LQAL5Bsf7IIocluRG8tBpCdO9s1AVD2RnzC3fW7eJ
	PF2WjSX5MxNldNbqlPg0Xy7AuvP8bTYB8UJGNalxDq7vGx3WHQQ4Qqegn9jwVyqjEOyuGsFCUj/
	aLSFBCLKbch/6vv+YnHqKVTJKPdDJU0AUIapNvnof0Lc8E0hMv3Jp6A4gX161Hx/sxnktqbqyPU
	KFfEHQ1okDbmOoepW6DIQJl7dKmQbeP5PUHBg+o8Z7J6A6NuQkDm1WDndh2C62peh6CRFo9YS8l
	3M65pIH+NbNyJEnn1jUVoeF1y3zr5htHORUAbhIUYhunudWXWPxZZXs9+PdR7yN0v3snKxnutpV
	71ROtRcnSqs/bagvI+BqOINNp6YG1SW8f1FTkcCPtN0A==
X-Received: by 2002:a05:600c:3484:b0:480:4b59:932e with SMTP id 5b1f17b1804b1-483a95b58b7mr161662125e9.11.1771874193996;
        Mon, 23 Feb 2026 11:16:33 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e51sm215405305e9.5.2026.02.23.11.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 11:16:33 -0800 (PST)
Message-ID: <aebd2667-0e65-4119-a046-e99c362f7a31@gmail.com>
Date: Mon, 23 Feb 2026 20:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-webserver][kirkstone][PATCH v2] nginx: patch
 CVE-2026-1642
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260222225239.3882166-1-peter.marko@siemens.com>
 <ae72e906-e37b-4c5c-a967-e8bf59768773@gmail.com>
 <AS1PR10MB5697D606D4AE7CD3B8A158B0FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB5697D606D4AE7CD3B8A158B0FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124554


On 2/23/26 17:50, Marko, Peter wrote:
>> -----Original Message-----
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: Monday, February 23, 2026 9:08
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-webserver][kirkstone][PATCH v2] nginx: patch CVE-2026-
>> 1642
>>
>> I wonder, does this patch apply only to 1.24, or does it apply to the
>> other two recipes also (and it could be just shoved into the .inc file)?
> I have sent additional patch to move both CVE patches to the inc file.
> Peter

Thanks!



