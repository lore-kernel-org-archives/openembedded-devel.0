Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAE0CCF9F1
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:04:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.22454.1761818687774900260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 03:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z5IRDTLd;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47118259fd8so5958345e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761818686; x=1762423486; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1aRN53nIPqb1Fvn5TYBnLOQMt60h8AA8klbTXQtcFo=;
        b=Z5IRDTLdPh2LBHL4Nufzy93/4Gpu0J74Vja4HjxH1Xnrx68sjI/2HpDx+doF/rIdxY
         7WuMFULIwvjIBzmjOaoMt/xAOyzN4s0dZFojyMLU8gSk+uvrbnxZ9ITRSC3aXtxpMvPs
         D1SwoW+2ed4gJZfckhF1gMhwB3vId+Sgw67M+KUso76bCh+WR/tgi7kN9dGyPvfNjN1A
         pIkZzjLBvPgw8XABus2Nvh+5brpJNhlORD2/usgrJ5kAOFozymozxHjD5tQfOyDGaTED
         y7mr8IsB/tWxgpKLgUxJg2az2VMXWw+gXj/aEbrx2OG+EGBzj9Wmz+gL8RMjRE0Ar0si
         cmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818686; x=1762423486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1aRN53nIPqb1Fvn5TYBnLOQMt60h8AA8klbTXQtcFo=;
        b=GvkIi0EPcxxIPxDsp4+4Ony7KmJEUK352Q5ycjnSNNFFKbDWV0QH+wumju1baZje61
         vEPx8XjDaGBvkFKIyFvXZtI6BlYwcqmwGf0wQ4oaa/94xpZx4XEodCypcKBO8ccORKC1
         im0roK9Jar1U9RB9Bw0z64ctdK52iA/Dy0NqkAkdqOn2RU4xr36yi8yOlwuT0s5eWlfZ
         Y9GvmEO8M+MfUiUpGlhnGemWKBJVjagsZyrw99XVIvmRlablZGGROEygcbVtLwkfEiO6
         9Uk+EkC5LWqaLz9NF4dX9ik13VEMf4bKUfZJXZwO7Om/7vbpknsJU01uxlg+RSK+NIFE
         WYkA==
X-Forwarded-Encrypted: i=1; AJvYcCWxRUig31ItGk+agkd8E65e2IpDCGX0Gx34bLmNw6s2lEM/nr9jU5Q7hO5Fi7+mVgWevv74lwo1G7LCxhF/pV3Ht74=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyGFrDpdkA4+DqjM66tMs19UTkbo29B65mbHnaFctKR5CQtRJZV
	6VoMkISm4gEHUY5vt2z2Db1lqpZiPgJj+sUiz20n97AYA1tOik5kHJNF
X-Gm-Gg: ASbGncsvi3vZCeuTlWXmKdqILLBrod//Xk4d2RzYIIjU9xDk2L8Ci7AWAoxheXHotU/
	8bDwc8ug9UGm6vQhXP9wISbfS7eJrBMYff4cCWluehhfm8Pi26kUZBHJ23Or6eSKhhsHZ9rnGck
	3LWozOqyHsc2RkLXtRDb53H2bIw+b9yLh2PeKd1WLJuXxhfyHLkYxrNbhVdr8Pz9IsgNZN+5SYc
	WyYwTjPRKzfY3NeaPxhN7wEiSpC0qJ5fgHqUXHumAEvAhmnOmHPFjdulrqw/94B08APOF1hjA1S
	X5XvcNm568PWVP7tPS1veDHcICSw3RV0oDoOca9M7omQWOpg6yeWjhVLcr86V230C7Hn8vxcYDv
	oiciM3aUX9S+emPj4byS8gGdn/TY5jSR4tVLsQmUVVxKpOAsnJ7QdzR7FnismDgB43cNRvABBdV
	jpN7QXKVGz4vuRUglVQCk=
X-Google-Smtp-Source: AGHT+IFiGK0VDihXgtA0NwHUxHDqJd3ODKUjPM6rKbTVkCjealjhCBqMaOnXnNAiya+34rCYulpcNw==
X-Received: by 2002:a05:600c:1c25:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-477267fca0dmr17979305e9.18.1761818685711;
        Thu, 30 Oct 2025 03:04:45 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477184ff5a0sm64602695e9.6.2025.10.30.03.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:04:45 -0700 (PDT)
Message-ID: <9a913c09-45f6-4ebe-8c43-ceb752b5966c@gmail.com>
Date: Thu, 30 Oct 2025 11:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][scarthgap][PATCH] libavif: patch
 CVE-2025-48174
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251009190556.1552672-1-skandigraun@gmail.com>
 <d7f6521e81038097295be946bd82e0757051ac53.camel@intel.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <d7f6521e81038097295be946bd82e0757051ac53.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 10:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121202



On 10/30/25 05:06, Mittal, Anuj wrote:
> On Thu, 2025-10-09 at 21:05 +0200, Gyorgy Sarvari via
> lists.openembedded.org wrote:
>> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
>>
>> Backport the pull request mentioned in the details of the CVE.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...d-integer-overflow-check-to-makeRoom.patch | 27
>> +++++++++++++++++++
>>  .../libavif/libavif_1.0.1.bb                  |  4 ++-
>>  2 files changed, 30 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-multimedia/recipes-
>> multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-
>> makeRoom.patch
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif/0001-
>> Add-integer-overflow-check-to-makeRoom.patch b/meta-
>> multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-
>> overflow-check-to-makeRoom.patch
>> new file mode 100644
>> index 0000000000..7d16cefa49
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-
>> integer-overflow-check-to-makeRoom.patch
>> @@ -0,0 +1,27 @@
>> +From 240256b05f9ff4c6d0afbcd6d4c9059037227e56 Mon Sep 17 00:00:00
>> 2001
>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
>> +Date: Thu, 9 Oct 2025 20:50:57 +0200
>> +Subject: [PATCH] Add integer overflow check to makeRoom.
>> +
>> +CVE: CVE-2025-48174
>> +Upstream-Status: Backport
>> [https://github.com/AOMediaCodec/libavif/pull/2768]
> The PR also seems to be referencing 3 other commits that were added
> later on and it seems Debian also uses them:
>
> https://salsa.debian.org/multimedia-team/libavif/-/blob/debian/sid/debian/patches/Add-another-integer-overflow-check-to-makeRoom.patch?ref_type=heads
>
> Should we include this as well?

Yeah, I think you are right - CVE database is such a dumpster fire...
Please ignore this patch, at this time I don't have a scarthgap setup to
test a followup.

>
>> +
>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> +---
>> + src/stream.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/src/stream.c b/src/stream.c
>> +index c85ca31b..b38c93c6 100644
>> +--- a/src/stream.c
>> ++++ b/src/stream.c
>> +@@ -319,6 +319,9 @@ avifBool
>> avifROStreamReadAndEnforceVersion(avifROStream * stream, uint8_t
>> enforc
>> + #define AVIF_STREAM_BUFFER_INCREMENT (1024 * 1024)
>> + static avifResult makeRoom(avifRWStream * stream, size_t size)
>> + {
>> ++    if (size > SIZE_MAX - stream->offset) {
>> ++        return AVIF_RESULT_OUT_OF_MEMORY;
>> ++    }
>> +     size_t neededSize = stream->offset + size;
>> +     size_t newSize = stream->raw->size;
>> +     while (newSize < neededSize) {
>> diff --git a/meta-multimedia/recipes-
>> multimedia/libavif/libavif_1.0.1.bb b/meta-multimedia/recipes-
>> multimedia/libavif/libavif_1.0.1.bb
>> index 885758b6a4..fa1c166eef 100644
>> --- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
>> +++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
>> @@ -4,7 +4,9 @@ SECTION = "libs"
>>  LICENSE = "BSD-2-Clause"
>>  LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=c528b75b07425b5c1d2e34de98c397b5"
>>  
>> -SRC_URI =
>> "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0
>> .x"
>> +SRC_URI =
>> "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0
>> .x \
>> +          
>> file://0001-Add-integer-overflow-check-to-makeRoom.patch \
>> +           "
>>  
>>  S = "${WORKDIR}/git"
>>  SRCREV = "d1c26facaf5a8a97919ceee06814d05d10e25622"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120449):
>> https://lists.openembedded.org/g/openembedded-devel/message/120449
>> Mute This Topic: https://lists.openembedded.org/mt/115677203/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-devel/unsub [
>> anuj.mittal@intel.com]
>> -=-=-=-=-=-=-=-=-=-=-=-


