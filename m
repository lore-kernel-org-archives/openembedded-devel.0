Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B169D15D85
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:35:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27364.1764797739472793063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFveg60h;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219db05so1582215e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797738; x=1765402538; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jg7Ruioj/R3oclCAIfpAmCkS18EWCuhG+5VdQkqjVU4=;
        b=KFveg60hCYVmrcyGhVD++NNoAJL3s/UYaWGxbWmLGrgY2nVOXwONIYo+Bv1NRob/rm
         Hd9A/3Lwvxxq1ROnie5q2/mX7vDFYpSl/u/Y5SWqEJLix+oXWd/l2fGVYnVO+/ZNEJEV
         6BQG4vvYBRBAvX4AvQemoM3qvmxr2MxW8g4DljDVFUKJYc5JJ8KtNsGF0KVdlpdbEqf/
         OC9heftPdKMoHeA6H5g2RF7iIHgPw8tknICXDrsmg6e/4gwFdHChSQC1gyIkYZSjC6Ig
         qPvnf9YNQnGzoD3sr5hcLvSrt8Qdt4p9s+qhG8tahkwwCn/4D6X7KmeUON/Z+rYRKf8S
         B7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797738; x=1765402538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg7Ruioj/R3oclCAIfpAmCkS18EWCuhG+5VdQkqjVU4=;
        b=gLQFC1Ry6BjyIm+WvWVX8M3pb5Xq4yKPZu85vMlmi3rR/ImJ8F6eKgx0RQfkbk9alw
         MEa6HwcB4rOICcvnvDjI3LiQlTJoaEwdT62PSBZns280uKyFYxKoFjvFGqd5Nmb6Hr9F
         9hvd/ldL05PVmMkjWEa4RLvJW95J8OgzqyMAwAhSDuwd0n6Mf+llgn4dkNpU57sWqUwo
         Xp2k6Q9BiIrlVzaVuu0Sw9P3XS/aWVsq7o+x5tAAXeEeBw8Jf06PXO0ETlap3X3D65BL
         eNnjktCu+bSpNiIMURrna8gmj/G2G0GZuNTu6RYY5vH6R3gBR18XQiWqYkUUQC3+tTEb
         rt5w==
X-Forwarded-Encrypted: i=1; AJvYcCXmNGGQuYpiqcmAQkCM+Nlh8P9IxhNmPKCwxbL6fldAVGGM4yCt1DQFB6VX2aTlomzBu1wVllFd58a/TlQ2ktmrpsU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzNntPFeYQFdNxh7u2qH0SwGMCYEAqtgtzDygsn30zxePBPDe7h
	WaqQPzjtAKDzicZXBBGexJCX4X3kE69sSG4kyc2AiPz28bCWRdZqUmUg9nIhBA==
X-Gm-Gg: ASbGnctBhEc5n47tIVZ+9Sed4x2s33+J73ibH/PYsm96EJNn1Rjy1ch0L2kLC7Arqkm
	6dP0PTMks954tQerMzio0fr8lTMoCZMKTjVuoRtbSs4PJ5fDL0wkB9OrnhMKUK/HsWpIPkn42r3
	vZJhG2y48iYgMTGio2MaE5/zgypNVAARZjKvM5nG17WHsLbuS7KrXYMBxUEZeb7+ctl+Ln72RNP
	e9+yqLCsjx96RfuzeIshqbtEnHh5PZfltq76UOdOVIGZVlFRqQT/IDdIPw7QPvlvw7oFNI5Cbd1
	IBuo44UlhePGN901FtgfnuCkmm3P4zmWu8KlndVHdeCW8U/nsOAzM5jD2hI2d6PbI6QS7wNPCYr
	B/GhNHMQvXQvu68kGElksDP5k/ovAVRCaT+g+Q8i82wYyEh1mzcZH6Xj1I3dBFbiiUYW6G4phKl
	LKfRrBKCZ44l8P/CulvTGSZim76opHZQ==
X-Google-Smtp-Source: AGHT+IHqzl2a/TSnA7Z/8CY00Kpen+sN+SCnXSjvGooVdD/n8CPuDq7jXdBlpEoGYbAQcGvRM1ry8Q==
X-Received: by 2002:a05:6000:611:b0:429:d1a8:3fa2 with SMTP id ffacd0b85a97d-42f731c553fmr3848282f8f.48.1764797737637;
        Wed, 03 Dec 2025 13:35:37 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30b8sm41668297f8f.7.2025.12.03.13.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:35:37 -0800 (PST)
Message-ID: <123d3039-602d-45b1-a70e-bd22c2636cf4@gmail.com>
Date: Wed, 3 Dec 2025 22:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v2] python3-soundcard: Add recipe
To: jan.claussen10@web.de, openembedded-devel@lists.openembedded.org
References: <20251129100636.2844306-1-jan.claussen10@web.de>
 <4C07461B-CB4E-432A-AA42-E6FCC8D8317B@web.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <4C07461B-CB4E-432A-AA42-E6FCC8D8317B@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122292

On 12/3/25 22:32, Jan Claußen via lists.openembedded.org wrote:
> This one good too? I forgot to name the [master] in the topic, but the recipe should work!

This was accepted to master branch a few days ago:
https://git.openembedded.org/meta-openembedded/commit/?id=4f461e498567bea07b46dcfbd195ffb8f04a4a70

>> Am 29.11.2025 um 11:06 schrieb Jan Claußen <jan.claussen10@web.de>:
>>
>> ﻿SoundCard is a library for playing and recording audio without resorting to a CPython extension.
>>
>> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
>> ---
>> .../python/python3-soundcard_0.4.5.bb         | 20 +++++++++++++++++++
>> 1 file changed, 20 insertions(+)
>> create mode 100644 meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>> new file mode 100644
>> index 0000000000..5116892dad
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "Python library for accessing soundcards"
>> +DESCRIPTION = "SoundCard is a library for playing and recording audio without resorting to a CPython extension"
>> +HOMEPAGE = "https://github.com/bastibe/SoundCard"
>> +SECTION = "devel/python"
>> +
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e39df1540c06c17ca310ce87c36b042c"
>> +
>> +SRC_URI[sha256sum] = "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
>> +
>> +inherit pypi setuptools3 features_check
>> +
>> +REQUIRED_DISTRO_FEATURES = "pulseaudio"
>> +
>> +RDEPENDS:${PN} += " \
>> +    libpulse \
>> +    pulseaudio-server \
>> +    python3-cffi \
>> +    python3-numpy \
>> +"
>> --
>> 2.52.0
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122291): https://lists.openembedded.org/g/openembedded-devel/message/122291
> Mute This Topic: https://lists.openembedded.org/mt/116524375/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


