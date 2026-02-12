Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD82EEA86B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:39:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58094.1770935956237439320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 14:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDKcAJF7;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so2396525e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 14:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770935955; x=1771540755; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80qfJ1S0MFbMsMFtOtxNPEIEBXu11i/nCMrp25jnpOQ=;
        b=jDKcAJF7qE1lgj1uG8CLgtwDkut9uBCmD8foAP//aMm4YOF0x+z/seK4Y1Evw0toc8
         tn/RxDEw8HIuW7A5J4pWS2mRFgm7J6gcfNoTgEtoXAD8He/EXahwTsCszkI3i7hsbJ9G
         NnSPxx65pbl3j/y3DwweKRTF8iPApsh3SRPeYv/uBOoBsFBJ/HsGr8eIxqxisi6MTXkI
         QTkm4udF0cUuMZO++fRRB++h80UmMNEWsHBNfwjtGUw6GWUVmL8F5O5MKIhBlVN0FgcS
         P6fDyujRQAKi0+YCSk1rWqDpVWwRe7fQrnNNf5F/3B7ZIkK7ThXDz92ZRzNHuvr89hHD
         SJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770935955; x=1771540755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80qfJ1S0MFbMsMFtOtxNPEIEBXu11i/nCMrp25jnpOQ=;
        b=cZ2/zEuweeBt3V67WiNlej2sxO8SpuK5Kn2uTeTuczuZgcIQQUceKHg9MRJDdL5Op+
         flo0wfKUO9vIBx1OL8hHAqOHJ1bF2SxBiwStQpXbJKsLjI5ZvxunfAn6+Q1ObmMYMJpU
         nh1rqoA0L/4ghuraDKuU5sYCPp/D/7nQmRH2KSnCAxa4X0deAFpE6cId1vQTCdAYStD8
         dH/l/YSu0vUmiM9vehmExfliqGeLPvodFYz6nVTEX1ofMI4VB9W46XNFZH468NFmmkl3
         FvL0jvkTr86xP3ENbXT+sLru497EpVaFMn8P5PaBGwKe//yw4QW7E/g+0UxM7myp986F
         868w==
X-Forwarded-Encrypted: i=1; AJvYcCWu9O4lhvu9PJgqTiuf8tUJ6iBwd6pFhFMeMM319Ber35Ku4uvMxfygOKIOxkAI7kpb9VqQVMrSbzYSUtd+JmG3h+Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJeWQ1vFRRmoZSx+lhY//ckxUs1dMiaGjtzrCXwZawcI/WFbK6
	BkosTCM7LMvWdPrODaAXA29AAZ8mCNLTw4boQP6MIu3aaN9LOtkgN42c
X-Gm-Gg: AZuq6aK0n+Gyp4rbd3vXbscdPcvlKk9Yx69959NUXkNtilkY6Nrknhjy+M780/X3gYC
	UmmPUfEEIG0RJXIvqxaGVT0fi1tYxoX66chn0gNf1unY2ZbQbDNsu/+Ji/UvMzJUluFVoQYC50e
	/AZPysjIPxGukzYvgy0xc93s98svFjJqMSNzuq6/5kyxAfiKgJuUa7J+iouS9zfP8WuwWgLN6XD
	rSoyp6sjFxfiSt72fKWQzfkFBVj6/LhGA3RuqBHtgzdinL6MLOvzKelE4qF/bSXAxJ3+QshXdmG
	RnfL4hC9pygShSmkK5JpKKGNne1DB1FnfBLJVG2eYNTqtQINzkdTBnnDPYk+jq0bASxs4J2hen6
	8wXhvg2E8w+Q8Sh6QlOb4cxtNNdQpZ/sr3eH5xNZD7Us203S8XKHjw639hHKeJMaHwqmhBjtImY
	1QoA8JpMsYChfNG1U4dRqXsiwiogTJQLc=
X-Received: by 2002:a05:600c:468d:b0:47e:e20e:bbb4 with SMTP id 5b1f17b1804b1-4837108fcf1mr11399925e9.26.1770935954569;
        Thu, 12 Feb 2026 14:39:14 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm413021795e9.11.2026.02.12.14.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 14:39:14 -0800 (PST)
Message-ID: <7814b942-6309-48eb-8151-658f107f1cb2@gmail.com>
Date: Thu, 12 Feb 2026 23:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] redis: Remove debug paths to avoid
 TMPDIR [buildpaths] errors
To: eric.meyers15310@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
References: <20260212182929.8047-1-eric.meyers@arthrex.com>
 <18939BFE647A0E33.653184@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18939BFE647A0E33.653184@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 22:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124364

On 2/12/26 22:09, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 2/12/26 19:29, Eric Meyers via lists.openembedded.org wrote:
>> Takes similar approach to valkey recipe seen here:
>>
>> https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c881822beb9057162dc67ecb386
>>
>> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
>> ---
>>  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> index 8abf758930..589ffd6fb2 100644
>> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> @@ -52,6 +52,11 @@ do_compile:prepend() {
>>  }
>>  
>>  do_install() {
>> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
>> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-benchmark
>> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-server
>> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-cli
>> +
> If I check the file type of these files, I get this:
> https://gist.githubusercontent.com/OldManYellsAtCloud/5892bde7408475a93d2faa699ae65aea/raw/3309eb40e0467bd7e2a2bcbd540c822b071242d4/gistfile1.txt
>
> These are binary files, cutting out parts with sed will break them most
> probably. I think this will need another solution (will take a look at
> valkey also, if it has the same)
>

I have sent an alternative proposal[1] - do you think you could test it
if works for you also?

[1]: https://lists.openembedded.org/g/openembedded-devel/message/124363

>
>>      export PREFIX=${D}/${prefix}
>>      oe_runmake install
>>      install -d ${D}/${sysconfdir}/redis
>> @@ -71,6 +76,8 @@ do_install() {
>>      fi
>>  }
>>  
>> +INSANE_SKIP:${PN} += "already-stripped"
>> +
>>  CONFFILES:${PN} = "${sysconfdir}/redis/redis.conf"
>>  
>>  INITSCRIPT_NAME = "redis-server"
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124361): https://lists.openembedded.org/g/openembedded-devel/message/124361
> Mute This Topic: https://lists.openembedded.org/mt/117779563/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


