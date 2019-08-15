Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B52856D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:27:42 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z3so1064270iog.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LhpWHgxmsy8DqEkYnLsiGaJ/4ir1PF0TKgb/Vnjj2tk=;
	b=s336L84IaEYX1xCTEzcAwxxESQpr8PTc5A+yioXhOPWivnUT+CZEoWVGHvYjQK5OxQ
	bGO0wfcysAUUVxfSMzDVu8jg2Lf3i8oP+x9Ri88YA06OzYT6VTcz+akHWQr7jIir76O1
	sRmqhZErMz/Y2sbJpAnHhc+I8ztLZudDzss9Js8V1cjg61AF6Gagc+lPBSKOjlxCDpp5
	GNvinsPMUtlGHSeJzCnGc5AEesKDr769eXYN8RAn3zCT78pzgiiYBBYSN27BOb6q9sAp
	Fhk+H0DFVhPLZQKaRtInFMma7lcERBM+qF70gODzwgrta4qiTqIl1nj+XIczBqcCtNKX
	gr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=LhpWHgxmsy8DqEkYnLsiGaJ/4ir1PF0TKgb/Vnjj2tk=;
	b=NCiYLlKGb/gcpRo4i1KjlIsXiGTyWw+Z0O+/6NgnfL5zUXEkvYNA1XRqg/lUGbKgZK
	8vooK43vlb4aAz5PMgJTayZ/nQcb4bbcINDXZWqNo4bwkRLWGQK7scZmX6BnKnZy3I3A
	OsSej9qzyGjYUJwWCYql0fCTiGXBIZeQj04NnvH26WYhAncDeZyBtGYyOSUinLSDYh/T
	lVZ0eC3zCYDuEq0MvqdgKuX8lKapKkIvWikcOAb9iCkDDU6Q5/cFm9DWazlSZnN4hYx6
	PyTjdq9NCCGcoYzIrZrRLMB+6MWA0VW/OmabiO6EDDpBdai++6fAy+BfcqXkSae1Qka5
	Ptmw==
X-Gm-Message-State: APjAAAWXyzrc/qszOdLEp+K2rPt/L5/8fC0iZmYANa6QRvCoj+qP+cMU
	Pw26PlT2R8li7F/sh/JlGspsNDvHbdI=
X-Google-Smtp-Source: APXvYqzLFMkU0GpLzVaEIRmRe/MoDRDyj1umbNg0i4eiEjd9SqFgqhTk12hCbf+IX1Ycmk79e0eoRQ==
X-Received: by 2002:a6b:ed09:: with SMTP id n9mr6547588iog.153.1565893662819; 
	Thu, 15 Aug 2019 11:27:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6:d9ea:d615:1834:130b?
	([2601:646:8500:6bc6:d9ea:d615:1834:130b])
	by smtp.gmail.com with ESMTPSA id
	h19sm2182348iol.65.2019.08.15.11.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Aug 2019 11:27:42 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, Jun Zhu <junzhu@nxp.com>,
	openembedded-devel@lists.openembedded.org
References: <20190815065430.32384-1-junzhu@nxp.com>
	<5e8f30d2-d0b1-d259-a14b-b789febc6882@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a902c47b-899e-86b8-0ff4-91020cefbb3b@gmail.com>
Date: Thu, 15 Aug 2019 11:27:40 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5e8f30d2-d0b1-d259-a14b-b789febc6882@gmail.com>
Subject: Re: [meta-oe][warrior][PATCH] packagegroup-tools-bluetooth: Fix blank RDEPENDS list
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
X-List-Received-Date: Thu, 15 Aug 2019 18:27:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/15/19 11:15 AM, akuster808 wrote:
> 
> 
> On 8/14/19 11:54 PM, Jun Zhu wrote:
>> This reverts commit 521a3b0326c56b212ddbb5bf68998e57b498de14, which causes
>> the blank RDEPENDS-${PN} for this packagegroup.
>> ---
>>   .../packagegroups/packagegroup-tools-bluetooth.bb                     | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Has this been submitted for master?

there is a different patch [1] which I have queues up for master

>> diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
>> index 913e311..f2a16dc 100644
>> --- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
>> +++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
>> @@ -31,3 +31,7 @@ RDEPENDS_bluez5 = " \
>>            pulseaudio-module-loopback', \
>>           '', d)} \
>>   "
>> +
>> +# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
>> +# Otherwise install nothing.
>> +RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
> 


[1] 
http://lists.openembedded.org/pipermail/openembedded-devel/2019-August/201166.html

