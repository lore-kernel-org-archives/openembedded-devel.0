Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3C2CF319B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:08:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4166.1763550511560774052
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3iYARkS;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so502297f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550510; x=1764155310; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52l3ojhRjS6yJlPamF7FoIwPHb3KKu1p5WilJFIqBzw=;
        b=g3iYARkSTJT9SHB+hU21TpXbmjsViRl8fhrFqpvgvu/NjPK+LBaqxuLV/KFzZE/O0e
         a78OzRSWG69cTURybrqcTsq1a/02OggkLLiCKBiS5hkzjT+ENUyQ/ACIZBWUVQfFDwuX
         ALNtRHoaLN4mhtsEeSd4gB0DsWCBQw3/7kOWtPtM+zfkoiWLBJVDq4xTa/TUuCQYfsVO
         klBf7nUcZSlxkADxMo8lR7Mk21QCAXwfO6D+dXwwRXYzhm/nwDJ5qK5Y18+tAuH1m4q+
         /IxmHiw12NSwBGkDwrJS+Sb3E65KMFyhA3vKHy2HzLB9QhJriW3zpPnWCcJlp/rI50vw
         INcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550510; x=1764155310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52l3ojhRjS6yJlPamF7FoIwPHb3KKu1p5WilJFIqBzw=;
        b=R+E8Xwpy1T+cH9s2dhmickzMda0QjuLaQGApM0qC/NhcI/BtbCvqyVZ6hqbHT6yHJi
         n2beIsZciCd0THUlRyn4qyiCiG3Gnx/BKqeAt3J9UG2tIt+adF51bSsyWLvGK8P3gLeo
         k7aI5Rk/85E6COLvGrre5ZEOUioZC7gswvPOc+H94hCjv9q2bbxPhtk3yWPJK1rWpwgL
         eARBA1xYQN5NHpnDsuNxVKJ/RNww48cb5x2Lt2QtPBt2VCgiy1NjdV6ZmMFYhXklj8PG
         9pzQnQbocbz6GyvL7uaBSjvh0G0O+cmSaCzXWi4MXUiYOlR9A+nobiJl1rbOs8kvqCOk
         jOyw==
X-Gm-Message-State: AOJu0YwETwr0vF0LhuPz+fb0czFGDiystTOLHf2elTqMkKWVCOYjA6lM
	9h9Sc0vA4Qm8sMwL9NISHzFI+Lve112XHXkvDrTKiB6seEGSb5+mPXli
X-Gm-Gg: ASbGncuJj+iyLl4yC+5U7WAss7OA99pdqMKTMGHPF2VcuZRmIYv+2rSI0+MY+l5m3he
	6sNjLFk6MVhXw6Gispx10cjQZ1ZP0i41UVXhSUa2caUsypvnCowDLpLDPxX+EwluSYhG4bynclY
	2ZVnXrBwtaN+KiRls0cjyrYFK9QQk9RfUtmrsmD0YNQFChwX8bAhKNI2ukSSQdNK6BF0ykUGHnU
	/vWgzYdAIAHzHgGsactOjKXhQJVPZ9r/6HiZE5uihqBrJS1XIEVJdId7WUagCff1X2EkCQTxbBu
	OHpcc3yuxA1dCOpWOQxwe8ikIbVmG8WQRosmi2h7uf920kDNiBPZ5pDuzSfEuiJSNtBbDqVMNqD
	eOSS9q5xkzdO8QadDjCvTVp50RKYil1m/3xo3XoX2s8ACRsi1DUCHLzifJhPYL9SauBgMqaRgBm
	DypD1UJxbRypBOEnh4LhYTXwhPwkmf/A==
X-Google-Smtp-Source: AGHT+IGhSCvvk6TSpL9yrXA6TLpsSHvsevKffwwuauDaXtZYEdThCkdJ6kP02arZbvU3/wpqoT93Kg==
X-Received: by 2002:a05:6000:c4d:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-42cb222144emr1958404f8f.25.1763550509641;
        Wed, 19 Nov 2025 03:08:29 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e846afsm36537152f8f.13.2025.11.19.03.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:08:28 -0800 (PST)
Message-ID: <395a0123-3431-4955-b850-ed1cbacd7f38@gmail.com>
Date: Wed, 19 Nov 2025 12:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 3/6] libplist: add ptest support
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
 <18796309B75AD22C.1255594@lists.openembedded.org>
 <CADySD0HjNzgqHbvf=SERmsst-XNeH-ZmgqcXHU6HxCd-M3HREQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0HjNzgqHbvf=SERmsst-XNeH-ZmgqcXHU6HxCd-M3HREQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 11:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121899

On 11/19/25 11:57, Ankur Tyagi via lists.openembedded.org wrote:
> ptest summary:
>
> root@qemux86-64:~# time ptest-runner libplist
...
> PASS: test/json-int64-min-max.test
> Converting (failure expected)
> ERROR: Input plist data is not compatible with output format.
> ./test/json-invalid-types.test: line 17: [: -neq: binary operator expected
> Converting (failure expected)
> ERROR: Input plist data is not compatible with output format.
> ./test/json-invalid-types.test: line 23: [: -neq: binary operator expected
> Converting (failure expected)
> ERROR: Input plist data is not compatible with output format.
> ./test/json-invalid-types.test: line 29: [: -neq: binary operator expected
>

This looks like a syntax error due to a missing variable in the test
script itself

