Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A85CCFA1A
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:58:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43522.1762761488990496704
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 23:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5fBd+ce;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c7e438a8so2360462f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 23:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762761487; x=1763366287; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCJikNwN25g4UY9Enn5SLABcS8wqMtNveiwvd88pg2E=;
        b=L5fBd+celOJYL5iJJpRhmAZp2b5Dcii++oqlkNSdZMG/M8ywV9/6shcSUxl4C5ZrWV
         uKrsauY4wTjswWHj8Y8OarTyZrcjC9S4Q7ZAfLGOsXbNcCIpBxlPqyDM7MeqrAIl42Pp
         gpjmu66yLVsDHeXZWPMGPhUGRFrXLC4zqvw49ytljulMB0O2GFaybr3X8nOCrzCthZ1Q
         /5KDZ3yARzeTMKa18+TBqRN5z99NCgfL8xsVTyNzeaGLB+/lSdjF82UzqXssAfEjbsVt
         V0MaMM1NguXQSKbUqqDM3WRI4cOANlRMsfFSWvYsmffEKPQHT9dZsQQiUkEfZ5jGgXkb
         0Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762761487; x=1763366287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCJikNwN25g4UY9Enn5SLABcS8wqMtNveiwvd88pg2E=;
        b=N/uFbdF2Gmh168DjCNlz7Ib+4tnEoII0pUYfJjOjcU5zJ5ubH6LPZZeI73qjzgoyyw
         bLL5pXWgmjglYJ419I2B2A/lguyMekWy7PTxZGkVX5PKfCADWKR1aVvgB9L+pSePBTqW
         S4+1B1A6R/xjnx6wgROI2ccPJptRFgFbuK7V1mljKrMk1LNhUI59MjvZNYmWq1HiO9rX
         h7o4MAV8T4PVxumVL3cisxwt9r0y7FMuZ5KE+zpRdO80bC80jd3TczWuTpCXysqh7fiz
         jYfRGjb9ByI9fwADOCtbZQkHolEVmY4xTNJjFj7WJl5IE2Lm8GqcR+a2DMxSZxUn5uHt
         FlbA==
X-Forwarded-Encrypted: i=1; AJvYcCU10u1fYvLLwn6/gX6zMYBsWmVE+EfO+aukF+rCNn6nfTDZGVqFvyMvFQUXtsl/IYGC0ruBpz3XnpETWKsC80p6Uyc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEXHWs21JzskVFrqMtyG8BXCYnL7701V1xQ3gDNM7bSy7PDZe/
	fEDsKNOJWeWlfWr3wdWBbEyCnHGaLN7S1a3P7tCNnrjeb5IFDnX++Csmj/EE22Hf
X-Gm-Gg: ASbGncsvDt/kkyLsOmP4Oplnt9C6nwAisuXwwo2Db7bbc6DqhkV5AaBKSkvoXFmwf3Z
	s2BvxGLR6XuRpNkXKmBKekVv2qImG4mooPqCc6TyKSfneQkYk7srcU74sgHJkYEgNpVcz8c+KIp
	9/89BSmUCthLvCvl5+BvPQ1FUs3Zbdp675ZuFe0YYEbt5WLXMdBPDCNwLyGVNeSPIn5Olvpug1/
	264eN7DMWs4bc8pgl5sIUIyyulHVw/huzzORGAmJyx1QBPTJRXNg77woroPIP5c8XtUku+3uMZ2
	bPGlO+tfr9R82Sw31L06gLhEn7ZfJrc3HbEcIpgNUOY3CYYhBZII9rLEMA6DEyQqYjSBgJje5O/
	9khOpfolSF8kUW2KltaNAeCSBs7K/8dIL/6VFBqvOiPSMAmYhbIsaz2KeDbnyYUdcO5qgQTlaBY
	wF41v7Tg+6
X-Google-Smtp-Source: AGHT+IGiP0TYqX1VLkqGQOepmWURQebkg8vHqT7z1+w8FaFqHsHOkjHk4sC1DFl/d7qStgJBOrj4pA==
X-Received: by 2002:a05:6000:1a8a:b0:429:ee71:2ff0 with SMTP id ffacd0b85a97d-42b2dc96014mr6222772f8f.53.1762761487194;
        Sun, 09 Nov 2025 23:58:07 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm20124751f8f.35.2025.11.09.23.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 23:58:06 -0800 (PST)
Message-ID: <449f6527-1105-4d1e-ba92-8ba95e5df238@gmail.com>
Date: Mon, 10 Nov 2025 08:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: update SRC_URI
 branch
To: Haixiao Yan <haixiao.yan.cn@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20251108112738.1968029-1-skandigraun@gmail.com>
 <21fec570-0453-4252-ba74-ef3fd45352e2@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <21fec570-0453-4252-ba74-ef3fd45352e2@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 07:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121449

On 11/10/25 06:58, Haixiao Yan wrote:
> On 2025/11/8 19:27, Gyorgy Sarvari via lists.openembedded.org wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> Branch was renamed.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> (cherry picked from commit 8d5baf12df3cf8a178bde5f11e0c8b28f2f6dcdb)
> I was unable to locate the commit 
> 8d5baf12df3cf8a178bde5f11e0c8b28f2f6dcdb in the repository. Could you 
> please clarify which branch it was cherry-picked from?

Apparently I picked it from a local branch, which had this commit, but
didn't realize that it's local only and wasn't merged yet upstream.
Sorry, will send a v2 once it's merged.

> Thanks,
>
> Haixiao
>
>> ---
>>   meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
>> index 610fd0af5e..62e6c90f63 100644
>> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
>> @@ -24,7 +24,7 @@ SECTION = "libs"
>>
>>   S = "${WORKDIR}/git"
>>   SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
>> -SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
>> +SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
>>              file://run-ptest \
>>             "
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121381): https://lists.openembedded.org/g/openembedded-devel/message/121381
>> Mute This Topic: https://lists.openembedded.org/mt/116186077/8599992
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Haixiao.Yan.CN@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


