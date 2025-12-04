Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0851D29FB1
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 19:15:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52384.1764875749597937155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 11:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhwWS5FI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so9318525e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 11:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764875748; x=1765480548; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2IFWHix6LsG3lprGDCuMKXnLUSnOtjB+x3gAg8qYw0Y=;
        b=IhwWS5FIcAJLuRyzTnQJlCDNyGX+6TUqyUswhUj0ZIiAAcC5Pk9KJgW9baAoGPuQEi
         xjzciDc//jPsZC+xeRdlZc9It13TsiDWsb75SC6f20+o7PJrFuQ53lfn1JPo8B5NrDQQ
         9jCdjgNkuyMVNO/LZtLQxyjdJRnMr2/9YY6hdPPGsHnTK7EPbAIWEjntmC0EnRa6RwKU
         EnmYVJrKhbYEeT9kuq7JmgK4fLIAgEoYXfTOjclipHe0C0SzJYpAM2HJCCJB8gIk0WOv
         GrtVl7tgMtgEbqqVfML3TgyefoKWyq/jS+98B1vlWTyhP2AwjTbA6g4DCChDk3AiNSt7
         IlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764875748; x=1765480548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IFWHix6LsG3lprGDCuMKXnLUSnOtjB+x3gAg8qYw0Y=;
        b=rpGbe7URumB/FV7eJ6eL3gcKzetljFGScQZIKIoGK4bhJrCa/r19iLphSVVYlxe6T1
         pVVFNSbfpRQ/88j5UzrZmQo49M1F0HZ9X4duGrKxERi7wp8+b0urF5qXdjQnY+Lj30f5
         PuNc8FDVJ0fE2uT4sPbowgpzIqNMJM4V6Kj0pAvSf8topAqrPsEvjfmWh/vxCgC2CY/R
         jgCBo90a53u0rdGJpd+jk2UVhi+at96LOhj+0Qvqto++OfrOXDHAY2pG/aPc324nZIze
         fHAMlNjHQwg78/0w+pY8zl92fSewIerzVQX4Vlt91ZX+nW8ZWF058s1GoFaWc1OaqlvX
         z3AA==
X-Gm-Message-State: AOJu0YxOaHCaZ6DynGPu7nxvBp88iq0UnLoE9KYbUxUrOQGiH9OWNpQi
	rR3rITskNgq4LCnv4nnEEHREjI/MPmiqRHHDB2nhRKd+cVmSjbXaBj/B
X-Gm-Gg: ASbGncvFIpk12pkk8tQfePVeNSdJuEMieO//usq4nwRmqUT+lUYbiOfA51ZOR8HOurB
	5nZ7IYd04x5Bkwy5ZhiLfWiOH5sUh2ehjaO3ree2jSkfKxcaUR2ISsW1f2Awq5oNmi9JZW7STRN
	DUWu+j4hswJ+pPWr/BYM1gv9mvg9MRlKBJflLCwEwv4Vj/PBjMlfYmvJHEWBv+GEwcJ9ZPRGwqm
	WJbVeSifeNN3o11eL7RMj8YObfA8WBpksa6umUg4l5pvxu8LRmjfEOQOGIEL7cibbrtPYVlgREA
	V/3ICM19lm1P/5bn5RXi5G+NDGq2maxGwPTBCE4//w5R3s/Fb7aIBB3mb0jZoyItx/QUVep6N5O
	h6+98LwCGwDcJrRGhuAq3IbwuBLGySy6eZyXEkw0j8Au+X1sVrwLGihjIlCcbj1n0SZ2UpkmgxV
	7zp/8d2mIKrVxrle09CnM=
X-Google-Smtp-Source: AGHT+IEo5nhSVbmeTxh0CgpZAoyijeuC8qaDzWz6WfWDS7zbxgObN44joZVDKiuLb1QJ+WO0K8u4UQ==
X-Received: by 2002:a05:600c:1390:b0:477:a3f9:fda5 with SMTP id 5b1f17b1804b1-4792aef1a50mr62568605e9.9.1764875747735;
        Thu, 04 Dec 2025 11:15:47 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6dc7sm43403895e9.3.2025.12.04.11.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 11:15:47 -0800 (PST)
Message-ID: <ca7e60de-1fc2-465b-bcf0-c7abd15179fc@gmail.com>
Date: Thu, 4 Dec 2025 20:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] yasm: drop recipe
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>, Yogesh Tyagi <yogesh.tyagi@intel.com>
References: <20251201220957.2629951-1-skandigraun@gmail.com>
 <CAMSfU+6MEFLLqzQdYgt0W12bwenvw-B3JY0zpcHXrDrdPOfoEQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMSfU+6MEFLLqzQdYgt0W12bwenvw-B3JY0zpcHXrDrdPOfoEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 19:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122328

On 12/4/25 17:52, Yoann Congal wrote:
> Le lun. 1 déc. 2025 à 23:10, Gyorgy Sarvari via lists.openembedded.org
> <skandigraun=gmail.com@lists.openembedded.org> a écrit :
>> Yasm was introduced as a rewrite of nasm, however its commits
>> have dried up over the years, while its unmitigated CVEs keep
>> piling up. Also, nasm is a healthier project with regular
>> contributions still.
>>
>> There are no known recipes depending on yasm.
>>
>> Let's remove it.
> Can you also remove it from the package groups?
>
Sure

