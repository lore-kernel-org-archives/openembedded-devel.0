Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051EEC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 10:43:54 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.12450.1752057830798010502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 03:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EyOTt+HF;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so9978067a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752057829; x=1752662629; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w37p4krolikkzGFwxMk+3/dgKLmEvaRcqYRto8URZUk=;
        b=EyOTt+HFNKOXHzyfj1N88T75bgeSv71uXaYjT8owA476qcSAN155f5noAydRdpnHjY
         NMET6TYh8nwRWSQJ+lfXyetKy0eDYcWfF6YDDUZ2ZM4/pmSnbjMupt7mcoDMmUOM4Oi9
         oR/yeSkO4EdobyrDivEoMZ8Hxa1yVZEnPqdptcyvtAI3doyou9jUyvyqFp2SWgInB3EF
         Z/tJkPkX4SI/OzICWO1JN6bYH5qDT66qp9cHjFvtOHowDPiQ/d4Otw81u7wOWGGz+TVr
         zexVWtdcnFDJ6gzOa/WMLWVwhkj3X53DiiWeIMj8nYiVxkdTC4EsQ8uphdUAW7f9SBqY
         PoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752057829; x=1752662629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w37p4krolikkzGFwxMk+3/dgKLmEvaRcqYRto8URZUk=;
        b=hnRVRKH76ypMhcqIjp5nmBHobD5640R/arRdoW+saZF1xC+zK3RggiNXtoRsSYnrLT
         O5WRFcmd4vD8wp1pZ48/gGtzSAYK69T7AhhWY5jon/ha9AFXSrucg5Zm8dR3AFPmbyRj
         M5VLAjySx79i3XmiX9gx0/e4GNlQIrmNlt8fbLWAChylbQc2TMf8yu1RrWH4wSimhNF1
         hNWtvkLsqKrtkJAUB7x3OIiFYct7RpceR5CKZE7njSwg+kWsoOpHGiY5eVmmHn11MbHC
         OLTuPgxf8jDudD12wrK5+qUTtkZlnmiu6WPAg/xbNqKcdawgLn03pLqghDe5/2TiMcQx
         PDiA==
X-Forwarded-Encrypted: i=1; AJvYcCU9/vVH/wa4NBqTbv3A3IiQdDSxnQTng6zL0A+GI5NLXiGP7pb5q0LHcZbQW/Gzx95FZ1P3PqbPtNprbyVqB9B6xbE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/Sde82VODuKsbL8t/jw4qBw14Qh/FIRCqwf+Mc6b+65BFu3wg
	lGw96y8Wl01M+GlT6HZswasyCkmPzUE951ZW3+VnGn5zX+1yxyD92NaB
X-Gm-Gg: ASbGncsDDMG5nYqZ6bksf2+/M2eBN91nk/crM2nrfBcTE3tTcF8+q5BXWZWeGB+ETqi
	Vz7cPRMuey9+gQkWZD1zi7lG5afhbT4LPbHsGlLi1PdsQJJEeaPnepDb4OYIuCpons+QVKo42fd
	trUgbZ329N7OZ6Cy3+iGwJycWtrtw6CNS5KWs13CuGfhfIQmaucGkWFJkayC12xrUdYz/yrslPF
	TOmVsHYBKmQKtUs4+i6LQVjQ8XI98P3k3pMiLkB9pmuPg74Sv7s/X95bikp81l60tLlKiKiUVPB
	//VPiii7Dffe76pKlvkMu/QjkKU0DSsIwUst7SuQVtvml3TOhWKmPhi6adA3aqCQC3sedA==
X-Google-Smtp-Source: AGHT+IEP63IH3nI7c0GlRD+4yeJkQ0Ca+DG+sa7csO/zMvZeUXDH9j4VPMDwL4MctZSAt5OW4gVgOg==
X-Received: by 2002:a05:6402:35cd:b0:606:c48c:fb8e with SMTP id 4fb4d7f45d1cf-611a65b834dmr1574187a12.11.1752057828811;
        Wed, 09 Jul 2025 03:43:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6972cdsm8699221a12.29.2025.07.09.03.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 03:43:48 -0700 (PDT)
Message-ID: <b2bd24e4-8fb3-46bb-bab4-7cb1aa879939@gmail.com>
Date: Wed, 9 Jul 2025 12:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 09/20] yajl: Add patch for CMake
 4+ compatibility and fix build issue
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-9-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250708195636.1678606-9-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118349

On 7/8/25 21:56, Alper Ak via lists.openembedded.org wrote:
> +++ b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch
> +Upstream-Status: Submitted [https://github.com/lloyd/yajl/pull/256]

Yes, okay, but...

> +
> +++ b/meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-instead-of-LOCATION-property-f.patch
> +Upstream-Status: Pending
> +
...this other patch is in the very same PR referenced in the first
patch, but the status is different. Shouldn't this be "Submitted" also,
like above?

