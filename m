Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB544CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:12:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.5448.1759169520019591567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxJglYM1;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso10328639a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759169518; x=1759774318; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ma2QULgh3vmvayrswoR/dMf6X9ncn7U7hBkTEb2QQ1k=;
        b=TxJglYM1kN+T9mi5HYbSAOBjdtoYa8D83C8BQ81D0DnfeW2V5PhBYEaP69t+KgvUmM
         bpZVs0096lvtvCaKxW04xkRQO0x4WOXdpv0QGflI0CX7aWcgqDTawzjBJChk2u702r+M
         Zjgc8ZSpRODa5m7cfPDVUXbraLt2TcfSOj2AKZrjmWl8aicUWrhIghn+EBIJamC7eCiJ
         7ZygItg8VeSW6daI7vsVxlEL6QKnCHa0PlycGXKNmGVMnm7gLJbRFdN0n+R7ejctp+XZ
         5SNoJ4MIZtuY6gTv+NxLRCsVShGvGL1eWS5abzAnclvwgtRIhAEsiQ2fG4z/2nOY8r68
         rxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759169518; x=1759774318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ma2QULgh3vmvayrswoR/dMf6X9ncn7U7hBkTEb2QQ1k=;
        b=F1IEtso5M88pR5OYp+WqovX7zDhtgBkuAQprJ+JhUqpjrCmpfLdEhZY+J8fS9L54Oq
         g4PJAQWweVgS2vVhdNCW1QpKvi47Vczm92qoY0aIY/v34YWUMdWRZz6aaSGkzLx7HGgO
         +FvhocQkMQxiINL+BU3/UyriG/4haIPFpbG26BCidfPPluq7UgzAopBnyAuKJZA3K2QO
         frbanssTjKgVSh6hrZLtvATw5HxbiAYBrTx070nlUscPBUA5PlT0C36e9yoagdlM7/kI
         BKPzvpB1fqp2inaet780tSnCe5erSW5hxQhnnzK1O8g78TmRaIcyIRxLxhuKLVWjO6Kx
         DuTg==
X-Gm-Message-State: AOJu0YwWruOJ2gRbHZZrMK7mRJlVlAqrCnZ/a1MEpA6VMtkJE+usInTp
	lZG8gZIlc6QFcTfk3LjXYe+ZointDsdEH1F6zcVLP0CpMzR3ir4RM/Qc
X-Gm-Gg: ASbGnct4liGB4oTmBcgm7FjbNaCvQlwowbFdsYx473yJ3WBegs5iQlSxC43AuH/BJPn
	3XW6691x0mpmrvBZnzkQgOOJTGjC+a5EyzHO4KipbfPJQqLmPd3kL2IbOPC3KWtiwjYsVOb5k4K
	S6Ubpxx2KRwaGa4oW5BDMvXnEwOkQ43Be5UTV4t9Uho152WgubGJxmIlGH37+UOHOEq7SADylUD
	Hdhtrgb+hogmcshrnkf3AwXmY7JNNvNr8I1NDnY28hB5mn7mb6sXBZJZs1tKitm6liQ/nr5MUbK
	ZFRyKxrdrBs7StlzB6DOZ5gk55sbexYawej7ODy33n1t2ZNQ7xlhtDTeVAWbSuxiz0jHTnzXrnH
	+90La1QSwg9cYvOPR0QhrB47wf05xou9iigjtPW5M//u1WPIEJfZp
X-Google-Smtp-Source: AGHT+IFfr3X78dVORJ4KzLsiqE2k5FG9E7DybgB/tZSHImAtLd2ayHDMY6sxUkPGThM9icZo1Kxb7A==
X-Received: by 2002:a17:906:f812:b0:b40:b54d:e666 with SMTP id a640c23a62f3a-b40b54dea6emr198501166b.16.1759169517934;
        Mon, 29 Sep 2025 11:11:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3d62a59fcesm337706866b.91.2025.09.29.11.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 11:11:57 -0700 (PDT)
Message-ID: <c4dabd3b-17c0-46ad-83ae-3cb62e57eaa2@gmail.com>
Date: Mon, 29 Sep 2025 20:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 02/22] lksctp-tools:
 upgrade 1.0.19 -> 1.0.20
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250929130425.2912077-1-skandigraun@gmail.com>
 <20250929130425.2912077-3-skandigraun@gmail.com>
 <CAMKF1sqK_wGaW0P6uy1b+OQ24dU6nQWcYjP2DmWr_CSEtWzcAw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqK_wGaW0P6uy1b+OQ24dU6nQWcYjP2DmWr_CSEtWzcAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 18:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120041

On 9/29/25 18:55, Khem Raj wrote:
> On Mon, Sep 29, 2025 at 6:05 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> From: Yi Zhao <yi.zhao@windriver.com>
>>
>> ChangeLog:
>> https://github.com/sctp/lksctp-tools/blob/v1.0.20/ChangeLog
>>
>> Drop redundant variables LK_REL, SOLIBVERSION and SOLIBMAJORVERSION in
>> recipe.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 162039c327f065d87730565b18fdc3986844a065)
>>
>> Adapted to Kirkstone.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>  rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} (80%)
>>
>> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
>> similarity index 80%
>> rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
>> rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
>> index 4a9d2f54d9..51d9605624 100644
>> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
>> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
>> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = " \
>>      file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
>>  "
>>
>> -SRCREV = "05b50d379ff0037de4957bb2a1befcce88b70225"
>> +SRCREV = "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
>>
>>  PV .= "+git${SRCPV}"
>> -LK_REL = "1.0.19"
>>
>>  SRC_URI = " \
>>      git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
>> @@ -34,19 +33,14 @@ do_install_ptest () {
>>      done
>>  }
>>
>> -SOLIBVERSION="${LK_REL}"
>> -SOLIBMAJORVERSION="1"
>> -
>>  PACKAGES =+ "${PN}-withsctp ${PN}-utils"
>>
>>  FILES:${PN} = " \
>> -    ${libdir}/libsctp.so.${SOLIBVERSION} \
>> -    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
>> +    ${libdir}/libsctp.so.* \
> do the versioned shared libs still follow same conventions as prior release ?

Yes, all the installed files are the same, only the .so version changed.
If you feel this is too invasive on the recipe, I won't argue.

>>  "
>>
>>  FILES:${PN}-withsctp = " \
>> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
>> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
>> +    ${libdir}/lksctp-tools/libwithsctp.so.* \
>>  "
>>
>>  FILES:${PN}-dev += " \
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120015): https://lists.openembedded.org/g/openembedded-devel/message/120015
>> Mute This Topic: https://lists.openembedded.org/mt/115494436/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


