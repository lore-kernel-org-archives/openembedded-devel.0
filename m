Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A7AC369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 12:25:47 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.10770.1744979144376168543
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 05:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AatEjEKT;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac345bd8e13so279180666b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744979143; x=1745583943; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLYpHvdfLgNlJ4XAvx43RZUzEdSxlCXt/VLPfb7eFNg=;
        b=AatEjEKT6P4bzwKLBXwoFJSTRjCZHFWgrmrvN2plRPkkjM08gVkMd2Izk5j6Whvnsg
         7zADkbH33DDOBgRU1ADlTdF/zodljxcTsHNuo+gUVAgjLrMacy1+4wbF88HPy+fOakkF
         WAFXioVMLLsY9d1j6LXFG/tdZIoHvqtrvDEbuU84tt8YgeMLg1p7X7Ndyk8r9ycy53qX
         M6urm1AUgNje+RHW5MkxfoytiIxyznuwsrpSlfs5ky3rBfutYDM7VQorIGRzspxvx0VI
         S5cZAVi+dYplv+/cExBnxcq5HsBB1JhoR8s6sMVdLOk5hYKZc7eDNWiekmki7g8AJ4ed
         PYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744979143; x=1745583943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLYpHvdfLgNlJ4XAvx43RZUzEdSxlCXt/VLPfb7eFNg=;
        b=AJUm3RWgtmwRco9nsmO5NzOCBu3DwOKI4mI0qfQUeZ25ePt0jlYykyLoT5Z+a9mY3x
         8qVyyTRVoewjpKz+SUGnJ/lRiNtJfwr+EG7xhhEZcj3SavQtiuzOqeZyV5P3vkET1jRE
         8aI97CRxyWD3slL3H8fYEe2/ZyPixnGGMqgdBZWdNPKJmlceH1p+thGvEE75WLUc83VH
         xUTN6WWlQM3gwGVbAGNVeEmUZs5FP2rVT3Nc7g4b23bujdYO43S39SyU7ZKx5j2IXXo4
         y7+vnO2WpeFGfye6VE5MxhvmqEnw6dfSV2x6Ue2pyX2hEgUP/xL5vghLPR/xC/4jPbco
         1zbg==
X-Gm-Message-State: AOJu0Yz4b1UYmQxqLttOsqe213IEvWHG7U4zvgUjpmHfXkEQt/1ZkmPU
	E4m7/bMdlTkvBdAGlaUUXNOLQ6TRCp+JtbzzEsr1CbOm6XcB/jCH
X-Gm-Gg: ASbGncse9OsI0fx8VZ01upBRm1nr6zPnKAyOriTl+JE3xhqxZBIF+rOhp0NdNTI43a3
	6lVKfk0X7x8I2ObIvqdNLNWR2pQP+8mxyVqNVu0NTsCDxMOgxp+A3wrO2aSOiGKU+b1FlxdAJzq
	Hk5v0fBTaGU1/VVSkBIeSIYQIQBDGHqZ6n8T/yUAXVA68NZyvhsO9s9lD1WsuYOSqoXRJGtwDvr
	D3xTBx2PaytEJE6DFHxsTiVRsMrPl70WGqrZIk8TSBOxvJVjRhDpn6kxVwM/TCWFDKBjUSAeA1G
	Gi/LMOpUbjnsjpC9/tCOBcZf+T6vj5fJTh48OtWIEwGjAvcP
X-Google-Smtp-Source: AGHT+IG9qWDuKeMocF95utPC+ZWfdmR6WF0V1PLobiPkTIG3AAhKs4Pb/vvtjT0Nip31njn132UhMA==
X-Received: by 2002:a17:907:7295:b0:ac4:3cd:2cb2 with SMTP id a640c23a62f3a-acb74ad9663mr192038566b.1.1744979142371;
        Fri, 18 Apr 2025 05:25:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefd952sm114314466b.113.2025.04.18.05.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 05:25:41 -0700 (PDT)
Message-ID: <6af6f2ee-a84f-4c17-bb3c-3bd65aa23297@gmail.com>
Date: Fri, 18 Apr 2025 14:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-initramfs][PATCH] klibc.bbclass: Add spaces around
 assignment
To: martin.jansa@gmail.com, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20250418014123.3684623-1-raj.khem@gmail.com>
 <CA+chaQewE4WX=DXQv17=aw2etQLj4wxJ_hmtHDY0zaGFgerpBA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+chaQewE4WX=DXQv17=aw2etQLj4wxJ_hmtHDY0zaGFgerpBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 12:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116965


On 4/18/25 13:30, Martin Jansa via lists.openembedded.org wrote:
> On Fri, Apr 18, 2025 at 3:41 AM Khem Raj via lists.openembedded.org
> <raj.khem=gmail.com@lists.openembedded.org> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-initramfs/classes/klibc.bbclass | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
>> index ca50a3d431..935ee10c40 100644
>> --- a/meta-initramfs/classes/klibc.bbclass
>> +++ b/meta-initramfs/classes/klibc.bbclass
>> @@ -9,8 +9,13 @@ CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE
>>  CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
>>
>>  # klcc uses own optimizations by default. See klcc(1) man file.
>> -export CFLAGS="${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
>> -export CPPFLAGS="${TUNE_CCARGS}"
>> -export LDFLAGS="${TUNE_CCARGS}"
>> +CFLAGS = "${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
>> +CFLAGS[export] = "1"
>> +
>> +CPPFLAGS = "${TUNE_CCARGS}"
>> +CPPFLAGS[export] = "1"
>> +
>> +LDFLAGS=" ${TUNE_CCARGS}"
>> +LDFLAGS[export] = "1"
> Why the change in export syntax, is the varflag preferred now?
Meta comment: maybe it should be preferred... It is at least a bit
confusing that bitbake's and shell's "export" look and work very very
similarly, but one of them complains about not having spaces, and the
other complains about having spaces.

