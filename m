Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F3BC282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:44:41 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.13563.1741869879254373432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NQSzLUEh;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1452163a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741869877; x=1742474677; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IiLGsSMbvAxplATKVfjumTxV8KbBiD5l/FOSNq5CLk=;
        b=NQSzLUEh/xUfZdgwF5K1czWcYONHw+g8zhQhM/lZeCRwzhRJlAqVc45C/b6O4J57gN
         bdNaN6P6iV0tXj1rFkxdWMuLI9yW8R/dMcB0FNhF9PUMLY7y0OgDJKiZGUiV4QQ8Tsun
         xZCHBqPcjUu+5w+zL5smadaDs5LZWAWjyw66C5jH53tgedLecAFpG76fkjph8RiwWKkl
         taxUIvyU1pjd+Q9vovvQjVLNca+6f9kA4tKnEXEFjdQ5BfAnDd7g5FXJRDz6DK2vg4xU
         ZeBNrFWZZ4hzrdcnapQjwZUofTidDC8L9Mzhz33u45DPV0SM4DooZNzD9ljRdTXInVMD
         EN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741869877; x=1742474677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IiLGsSMbvAxplATKVfjumTxV8KbBiD5l/FOSNq5CLk=;
        b=SbKFQ8tkW8i/XRO91XifxEuwwnft0eTiyL6dvxtqSuZTP3n7+tmiM/2NWNzzYT2Otz
         UbeHvWKyXhbfFnWBjWExYOWQ5ZwdjKv6HfcnGhSX2q1CCxQPHjSFLo2Ni+AM4UO4NYZF
         X0xOL0wtQamVzGn7SHpc9bJi/Uy6uhFMfvvCkPZD44z+tfvCoCqJgHM3kSq+m7i0jTmf
         khqx3Ust5ZIjNbRbFdB1BMxJyf1AL7EPCOWknA5Oct2aexxQ5JUaehCgzbhcsiftL0yT
         wxH4xxZ+ahpErl281bEXBxBCsZn+5luU4XVBj73rAycQdDE0r19xMcc+VO40IRDbKVG4
         Mujw==
X-Forwarded-Encrypted: i=1; AJvYcCUMWtPXOicCPXzkBpGqmv9wA53kpiOdH7kNZgJawnCU7SayRonAOG4kMhPq+1BWTwGDnXKqxVx0ECyjytmBwcaVXi8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyyWMYzV0ng/DSQWzb8/h9CbpaocRLVse62c/IJr6yJd9j1/iP
	Ryf7N9hBp9z81akPbbua2/UgD/+GhnfW91LTTPZuvx0FnEfOLX7v
X-Gm-Gg: ASbGncuNHIAxM7bmdCZbqYHYWu2Cmgj4KhrVpHeKxp+LcdFwvlcd+o/n+Q853uf/D5G
	taxia7hyyD5plsA5Zvu+HOc1G/QEE9nDu3hPuzCwyzESmwPJSTZuwqRiJ+drzcmPdc8tl5gLl3q
	eca7de6pBlQDrvhKoVllS+onVlta0zYzYo3Dp5U4Rb6vDSXraMopWw/M6wjG4kUUJo8ZQVQLRgG
	/i+wsfsSJ8dhnVeaAv4R39aUgq3ChbfpDZyG/eSucL0mNAoTBeOCxJQ55w+0coSj2khQhoyA+x2
	70SuEAXggC2I0vfhetGOh5k7YLIxllFGLQVi+sa1sCJnt0dsSdR/
X-Google-Smtp-Source: AGHT+IHeGMhnapafY+oXoFmw6gR1m2gwwSwxjzDBzPlArNkF/g4/07B/Qe4N+Fax9FDLFYAhM+6AGA==
X-Received: by 2002:a17:906:f10d:b0:ac1:e332:b1e7 with SMTP id a640c23a62f3a-ac2525af682mr857567766b.4.1741869877098;
        Thu, 13 Mar 2025 05:44:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a4633esm77270466b.143.2025.03.13.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 05:44:36 -0700 (PDT)
Message-ID: <d74fe178-d5ae-4bb9-b77d-5197bbbaae66@gmail.com>
Date: Thu, 13 Mar 2025 13:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250313120340.176779-1-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250313120340.176779-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 12:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115970

On 13.03.25 13:03, Markus Volk via lists.openembedded.org wrote:
> +LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24', '', d)}"
This file doesn't seem to exist.

