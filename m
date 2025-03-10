Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E2BC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:33:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.37792.1741613589860299570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a7QnorNj;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeec07b705so655966666b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741613588; x=1742218388; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MdDwhwL7TP6S17+VVbI6on1IHlsGVu1cqKSn96DGQU=;
        b=a7QnorNjsP9TN89N/y70lfRqNk0JwNRaAFM+2TjGsYLDkE/hZtv25qcJCCEKMoxbEY
         wN9NKqKbNreMyTvIvqOYTVHwhwaAmzOSgaRCyhjADIzZWala6c9HkF5K4RrOP1YTur9F
         e3jngzNisy4tRXXctvnGq+IZCZi0HpQAq2M0PXyVK3HJDZkM65JH/g0m+95sVONK4rDl
         Z8AoQfJ+EENjkW7KHNOmTFO/Em8x5TYqT24/bnV6yZrFqOjE/cqwjjdSn96wE+mK+JV+
         1qgQQPBAJnkUbcX+a0iImMSlgf3JyKvt9sJQnxkk5yfzHJx+eH4XKOIG2sM1LQ5ynS+a
         A9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613588; x=1742218388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MdDwhwL7TP6S17+VVbI6on1IHlsGVu1cqKSn96DGQU=;
        b=cKj8xRZdQpPRFz1xbGwx8xEQrdzbijRM2oNqqLgXkHHUcUK4M9uFVFlwuVKEkr+M0/
         bqRhutzWG8NbKBCjq1LCxYtRsmo8GsAB9cNoKZwLR9j7O9Tko4kdqNCFnWkaYCkYVib/
         mPQ3VLwvN4VecC0dDbXV+07k7NcHbz/YwkWkt5ASBMVG4KQW6XpmjZM+vF+zdZ2MRRoU
         7CbiqkXHjY23UFKaJbZ7fKBXHLN6CBZKt++f7ZvtNzHS7u03zqNQC6X8c9g+UrhWybXz
         bZGd0+Pb9SR96Kl9gr4T3LM8V5gfxRDjbJlmiK2hKkalCI1B9cUfpSpv4j+QuM62d0I/
         U+5Q==
X-Gm-Message-State: AOJu0YzWrFDarzKpdp4f6t6WPHWsPeh1kMv/HFFcF5ZorN6QnX50VeB+
	+U3fPJdAJXiyGb1F3ehZeSA/ehlCHLlXPmgoxeTUm62f25OlHfGPIAtOD54H
X-Gm-Gg: ASbGncuiZvw252Qmrrt13zYAhWHqzCk6rdt7JibWdxHY1FKs/Feh3Y/s5vUAbruhn4G
	SgnnzN7xiWi6b4hhSZOhqJ9hAkDEeWtel43vVWNIn/RxvUN3insOlpE4bV4RIcZi6kpwmEVjz1x
	ck5BvM4XalEOI54nW9V23Ck2vCDEd4UHK3PeiGhVqDc/OcCbYDjGxcugWwyp/tjojj43he9KQc8
	X9RpKv8G6+iRHi4RK5Rg9RWY5KHWBG8eKs+sHtmwftaRPAPGRUEdP6Zn/A/j0+oSKWN8OwsVZsd
	AwZtJnGhdTHL9BUVKBMAZCOTP5Brn5JDnE7OEhS4R88bvw53uTww
X-Google-Smtp-Source: AGHT+IHTJQefEpDkvqIkNR9yr6ydUTWTC3a7M3ykdcXhz1CJSNfe4bsfFyCZ2txz6Rt6IMxdmU3Njw==
X-Received: by 2002:a17:907:cb21:b0:ac2:85eb:ab39 with SMTP id a640c23a62f3a-ac285ebae59mr613678166b.23.1741613587972;
        Mon, 10 Mar 2025 06:33:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2811e5b32sm368719966b.159.2025.03.10.06.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:33:07 -0700 (PDT)
Message-ID: <247c89c3-68ea-4d24-94e4-a07e7e9fb174@gmail.com>
Date: Mon, 10 Mar 2025 14:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pandas: compile against target
 version of numpy
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250309194302.451216-1-skandigraun@gmail.com>
 <36BB69C6-0A98-48D2-86F1-F22959444693@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <36BB69C6-0A98-48D2-86F1-F22959444693@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115835

On 10.03.25 13:12, Ross Burton wrote:
> On 9 Mar 2025, at 19:43, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> +Upstream-Status: Inappropriate [oe-specific]
> I’ll quibble with Inappropriate.  This is a “pandas cannot cross-compile” problem and they have an upstream bug, so this should _at least_ be forwarded to them as an example of how we’re fixing the problem. They might decide to take it, they might have a better solution in mind, but either way this isn’t OE-specific.
>
> Ross
ACK, v3 sent.

