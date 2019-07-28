Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2D67D6B4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 15:26:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b13so26722962pfo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4P4QatV92OEuMKmGZW3wRIGkyisBSVEoov+WHp3YRHA=;
	b=X5U29COxmGiFt8fDqcd/TIBcSthnXGigPyvMZ2atZ3DwX7XuPEzDNK3gz3gO6wYb6J
	syQtG1SMlKK5i3Z4HaC1AkGVhPgVDWkLgzfa6kxbxhkDOiFJTmMUlKZUeD8FA93FnkDt
	TAizUS8KL1shgNsmKKmT1id/M9X1xSnizioZ9jP5DzrrmE3Z6IWWgL0FqXZWdKJuJA5o
	eyxdbgAQenDq2vaMuMjv4R9Pu9fV5LE3vb6mk+mRWcJy4gSAs33G18Q22OcP/Utou3ll
	5/JjDo0o+mqYhzBqGnDo2QW2AhgH2fyAW6GzeS6R4kCjhgJKBV1wqSI8ps7OwSmd45Nh
	xrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=4P4QatV92OEuMKmGZW3wRIGkyisBSVEoov+WHp3YRHA=;
	b=ijFrER0e5AqqtI6Rn0ZN+ipoKl6hoT7Fo3TOg8RtprThwQyTNUk2VYQT6QMueDY8NY
	wAr/ZXPJgTFgDQ8TLMYbnb2fT8Q5p4au3OW/8xNc9oWiNF14DohBzAN6Y6N5kWFFTBdA
	7xTAb+U8ILaUYpdxOTOajDxv0rNweo5SinuHLwBxkZDdX4qIYyzh/txh8FMXuKmhOtst
	0h5vhDPG7JeB00iElJrKE2PQyOXTgROoFPb4fUdl2no5/evMb5vPgcocVzddKPGypXov
	jeDYBx65j5eBR3MgKGoc9KcTa5YJTO1mLLGMjdLBe4EmIiVIfTGnV4TjQ8k/IsyU/x8a
	cSlA==
X-Gm-Message-State: APjAAAWPTUbLLGDkVf+YE4caKxDAn1gUy4KZUMbfxDSYQOtR4GggyEE0
	R0gbrF9G0Ig9oH4+MoNyPSBAzQyHcE8=
X-Google-Smtp-Source: APXvYqyjlsl89NBvsUCJCcWFfkPztWmIXovRp0QNd5lJIvYEQq1QScaS5vGSizz3YmPRDKMUDYq3yg==
X-Received: by 2002:a63:e907:: with SMTP id i7mr98631458pgh.84.1564327570907; 
	Sun, 28 Jul 2019 08:26:10 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::e5a4? ([2601:646:8500:6bc6::e5a4])
	by smtp.gmail.com with ESMTPSA id
	v138sm66602494pfc.15.2019.07.28.08.26.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jul 2019 08:26:10 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190727200614.5661-1-raj.khem@gmail.com>
	<20190728093741.GB15666@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <70043baa-9e74-53c0-c22c-0fd6fad7383b@gmail.com>
Date: Sun, 28 Jul 2019 08:26:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190728093741.GB15666@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] collectd: Fix build with glibc 2.30
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Jul 2019 15:26:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/28/19 2:37 AM, Adrian Bunk wrote:
> On Sat, Jul 27, 2019 at 01:06:13PM -0700, Khem Raj wrote:
>> ...
>> +Glibc 2.30 has added deprecation notice and collectd detects it as
>> +warning
>> +
>> +Fixes
>> +sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
>> ...
> This package accumulates patches in OE that could be avoided by
> configuring with --disable-werror instead.

thats true but it would mask these issues by disabling werror and we 
wont be doing submissions like 
https://github.com/collectd/collectd/pull/3234, I would like us to fix 
things upstream instead of masking them.

>
> cu
> Adrian
>

