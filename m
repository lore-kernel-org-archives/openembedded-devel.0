Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD505CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:47:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.43877.1760363222864939878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1rQ/iz/;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso4089847f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760363221; x=1760968021; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlucytJUOh0X42NdcTek2uPpIyQ0eLLhHEQo+gsOd/Y=;
        b=d1rQ/iz/VToq9aLgThSY+4p73N8VE8smDOmG8yv/yt8t+YlQx3ayUmTJQDjU+bF5NF
         MTTouAccZ4NaNpOJqgLjvLboA3o6ilO1wt72/PJNaqQb+vHBgnCWt/jn0TNNkOznn/LP
         fIk8NOmRg3jTkKQCULhpeh3HpyWqu85b62OonRvYuhoJIItbtMag/n4EjaEZgq2l/KoZ
         sRLEDP3MUwG486GsWrbr1/HJElc82/j27TdOB0uULkgDjF1Aqv5r8Jg2quahd4uKfBXE
         NPUycxFLGmox+JtRcMTS3pXnSnuZt5tvoSsED4Yx68xOT9s2OaH/OyatsQ3oQyr4LYJC
         dm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760363221; x=1760968021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RlucytJUOh0X42NdcTek2uPpIyQ0eLLhHEQo+gsOd/Y=;
        b=eisEG1ZpMR7BsbZOuohOpuhtemTy8in5aOhc319Lgv+EmzonXHdpCO+D0WgPTzsOZU
         0NB34k1St88i28rPYjAlKoVSi59ZcnIYv6E1L0q50utj0ZNIP1QMNbXJ8ltFkntlgXrE
         ABfc/KLLCYlaWd4tmxmJmI9IxNwtVlzfyaf+OufpAm1RP5E4qXW4pZFAd69Pn0TPPHj9
         s9xNkrNYSK0WLxAZNfbaGPVR9URZXYtQLuzX7x8aMvM8R4k09sPQxpi5MVZg1Aq1xmKi
         SBTdMzURNXJ27gn4GrdU45BIxa9/HlQMlCfQ7kVzmlKcLyNMCuVRpt6V5oxeMe0d+aIX
         3DcA==
X-Gm-Message-State: AOJu0YxFUWLcXWz6TkFsdNgvRiHc3+B2Hs8AIxwA3jI8uC11rSzuaXC6
	25gtiA+Kbsf9EHPl3S6v5AW7NAVJr8SeNmh9cqOUhh9xXmrYbdWT+mfJ
X-Gm-Gg: ASbGncuUZ2H/gph4WFq3rmJIs3c8wprcBsZbIzhrntlurDGKJW2WGuBoeg2TUYw6ZUX
	JP6Edco/rGxIoBKHx/eEWq97KhLi073qvuu8PT7XlWj80M2fTx60WkWNulzRXMy/dLt8bK1jxpn
	uPl9O4lGZaGSHkxGbxjpqnkNYJYn/af5pXluPoEGMNcK/32NTJ1TOntxS8oExC11cpSNuwN2jUw
	garz+L2k1xVyvHsOmqxVofkdHIa+r7xNtxwiLN/iXV4XFJxH5wV5k7EF9uQq+CSriZSWOTxqR48
	0XPlS1GrWP4sTz+5B4ylVzcXm2CE1nGcs1BKEH2dVvJ3ctJekAqB2dF9KNptbvjFXigGMokVRNu
	CIuQV/WSNxg5DYN9YxxKqVkyZn/ptFaAb0hZjMdQoxKBz0cBvvo3l0lUKNoYL
X-Google-Smtp-Source: AGHT+IHh9g5/mihroCq4E3xS8P3bc6ENtDI0GRSRiR0qQYhbirrgiLt2zxLQtAv2zW0Xb6ZdFbB+jg==
X-Received: by 2002:a05:6000:2c0e:b0:408:d453:e40c with SMTP id ffacd0b85a97d-4266726d9famr13404936f8f.25.1760363221114;
        Mon, 13 Oct 2025 06:47:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0efasm18643291f8f.41.2025.10.13.06.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 06:47:00 -0700 (PDT)
Message-ID: <0544c309-ec5e-4009-a960-07891926eb93@gmail.com>
Date: Mon, 13 Oct 2025 15:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE reports for meta-oe
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
 <8195C691-14FE-43C6-9C78-CA6677FB7887@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <8195C691-14FE-43C6-9C78-CA6677FB7887@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120539

On 10/13/25 15:40, Ross Burton wrote:
> Hi Gyorgy,
>
> On 13 Oct 2025, at 14:35, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> For now this is kinda experimental to see if it is useful - I find it
>> useful for oe-core, and hope it will make sense for meta-oe layers too.
>> I plan to send them weekly until at least the end of November for all
>> non-EOL branches, and if it proves to be not spam, then will find a way
>> to make it happen indefinitely in an automated way.
> Are these generated with the cve-check tooling?  It’s interesting how they different slightly from the autobuilder-generated metrics:
>
> https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/
>
> (you can click on “master” at the top to see the breakdown)
>
> Ross
Yes, it comes from the standard cve-checker, with oe-core recipes
filtered out from the final result - also, didn't know that such a
report exists for meta-oe.
Indeed, it is interesting... e.g. I wonder why audiofile CVEs are not
showing up there.

