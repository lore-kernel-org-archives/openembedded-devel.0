Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5286875546
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 13:45:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z24-v6so1451418pfe.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=orYAMKgQjYXEpHhmCfmBaqWTDeg2drjFgBOWWgPDo4g=;
	b=nmnOWTiMJ4LM5KAxqzbSRIRnMejMLAwqw93EeLi7j3RUs47uBdZDnHTysLB/QwAvP2
	ZuGpwiFUjSK5BJdCHN7uBHlNnXMZ6ptPMUHypZH9bB+MmMTIhpTcRkVbuJ63lky+nL5r
	Wh2sqMbkK7OYyvpt7pKK3fW8joMB546jpFADIHMPPSbndrgpGThu9pIHx8nXDfLzeudb
	IbYerhJPExeumdzRWaYxkg+cnzXshKaCkL9SdKjXsWI5UCurjCnUOEPNVwzGQ7Ehl14/
	pr/Q3KdNHsBoDR4YABJtu6l3oSQHdR5L5yd68/ZrvbLL0+OnYxaweliaEzV2gTSUji6u
	rBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=orYAMKgQjYXEpHhmCfmBaqWTDeg2drjFgBOWWgPDo4g=;
	b=CmgFWtdhOnQGV+Cz+C08xTJDxiAKiTeAmpMEszYhvmeu5O/hs8FCgsaOFLWIc+6x9w
	c4AgfNQvoQwz4F4wkuhVotiAQO4TzoN1g+4ZewngQ2P2Qs5T3vWz5l7rAJ3Qk+MZTY6l
	B9Q2KsfXaur8x3hmE6XzmZSJPrmwRzWE1b9OWjEHdwISd2Ly7D2M8/Fo5KfHEFUDPRFX
	ynAc6dspwoFyfp+ghYJ5KOXAnTZPSv6am8sGIYxrg/atCgf7t3F61UtOR2COLgV9xash
	ugWkZlG82+jPKBsZCSok4NV8hdV5vMAv0iXzdK0084FtlP3c9MFcxeT3LlAM0mhTZBb4
	Lu2w==
X-Gm-Message-State: APt69E2oOJmUYCGPrcPS+/w/XXSfq1MjBSXQ36wMqCOO/ocUwMXIGg8m
	ISgin5VXNUd57zd1h1UklK92HzUI
X-Google-Smtp-Source: ADUXVKJAQVaY776BcTv5xMQzPL18FIXN47+kBZJfH8WKK1Lk/c+ANefQJpeGkdnXoO9MkVriLmG5VQ==
X-Received: by 2002:a63:82c7:: with SMTP id
	w190-v6mr4194173pgd.172.1528897511790; 
	Wed, 13 Jun 2018 06:45:11 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:f1a2:dcff:aa40:34bf])
	by smtp.gmail.com with ESMTPSA id
	j14-v6sm4061513pfn.151.2018.06.13.06.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 06:45:11 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20180613063512.1755-1-raj.khem@gmail.com>
	<20180613063512.1755-2-raj.khem@gmail.com>
	<CALbNGRTotmY_EWAc0J-RKR21bxH9VDz2ra5yEe7ZK_yuA_aK5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <79a667b8-c374-1352-8cf3-9c8c490ecbd6@gmail.com>
Date: Wed, 13 Jun 2018 06:45:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRTotmY_EWAc0J-RKR21bxH9VDz2ra5yEe7ZK_yuA_aK5g@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 2/5] modemmanager: Fix build with musl provide canonicalize_file_name()
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
X-List-Received-Date: Wed, 13 Jun 2018 13:45:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Andreas

On 6/13/18 1:18 AM, Andreas Müller wrote:
> On Wed, Jun 13, 2018 at 8:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   ...eck-for-canonicalize_file_name-befor.patch | 64 +++++++++++++++++++
>>   .../modemmanager/modemmanager_1.7.991.bb      |  4 +-
>>   2 files changed, 67 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
>>
>> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
>> new file mode 100644
>> index 0000000000..256dd2ce0b
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
>> @@ -0,0 +1,64 @@
>> +From 07f1eda630517816bfa900e811963745a149e57c Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 8 Jun 2018 20:38:30 -0700
>> +Subject: [PATCH] Add configure check for canonicalize_file_name() before use
>> +
>> +Define canonicalize_file_name API if not provided by system C library
>> +musl e.g. does not provide this API
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ^ Don't know what the current status: Do we still insist on Upstream-Status?
> 
> Why I ask: This solution might have the chance upstream.
> 

Yes I will add Upstream-Status: Pending

> Andreas
> 

