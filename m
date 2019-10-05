Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id C02E27DE36
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 17:34:31 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d22so4679195pll.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+t0vsU53DhbAXQdC3o38cFj0VtC+1ALG8F6W5Jhopts=;
	b=Y2e2HcEkNYn3d8KzZ0EGGw4Lz5/yYolwqa9w+alj9mE6G9OtDc1HBzZ0EpcP3ZcuUH
	O0xP2VAki45z3j3od26jEBnuUxPB14Qfuw6IWx2ayfIctX/MuxODrzoEnk5eNtHaBisa
	E09zrSHvzBt6ytMMtr/84OEXZ90Ln37xosY7vMfwrJN1D4V4/XMOvfJCvEuZic3vlv6V
	MjbHyHMsIheZeVGsgOFSgKlx4isoC9mqIFTr1+8LQTSw3gkSdeCTYn+szNL8YhC1+5V6
	z3kdZMSC0CjBThuXvdKczkLxDLA9jNTp6xQyppg3ojRCR0YJXrWSdTVRotuUnmFe5UJ2
	McQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+t0vsU53DhbAXQdC3o38cFj0VtC+1ALG8F6W5Jhopts=;
	b=h8azmOX6iYeaM1U/CyvpWtpYKUQAj57O5y2VEIxxWOt5Y7ppQ/ZBcgI7qmAJEHQOKH
	LyEyJOYZ8fjFcrKBRYogk2LhHWKkp7sjX7wcWrTRpSEGquiyxzjVIdDYmvmzQN6PWxRk
	AhkEw+EN9jGIs8RwIXGBQEHRgONSFIPfhWX7MXD3tRaq5C5SZMD3aEFNbbTnF5ujybEq
	/KuKXUDZik/6wv6UuL1rvrwthJr0tbcDpn+6SONxYrups07hFVrS9RDUZvxX8bS7sMQ4
	ywlRaUP2o/fRpyLEYyNxKVf9CTaZnkyTJD7qz/dxhvJ54tag4RZw9Po+zwZgczvFXTse
	ClnA==
X-Gm-Message-State: APjAAAVkrcMqW8k7yAy7eTaVsWHrouNQowpgGgqILU005hxx1dzUiPjT
	dkUli1HyzjhUReTci8eMU98mcQL0XgQ=
X-Google-Smtp-Source: APXvYqwwIyCHGWS5BW4NEjbejeN7OQsm3A2N+soRxgavAKn/pKdzBhIDNO+YpM3yQAat+DeET18hJQ==
X-Received: by 2002:a17:902:fe86:: with SMTP id
	x6mr21440768plm.28.1570296872738; 
	Sat, 05 Oct 2019 10:34:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:88cc:97a9:c570:f3a6?
	([2601:202:4180:a5c0:88cc:97a9:c570:f3a6])
	by smtp.gmail.com with ESMTPSA id
	l189sm9692792pgd.46.2019.10.05.10.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Oct 2019 10:34:32 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1569632199-7446-1-git-send-email-denis@denix.org>
	<20190929124339.GC30130@localhost> <20190929162007.GZ30018@denix.org>
	<20190929181449.GD30130@localhost>
	<59a54a48-0e0f-8cdf-f51b-0e5fdd70744e@gmail.com>
	<CAMKF1sp94wxzUrxb_t7FdzvcLHye1pr67S3YXY31o5EHd_HmDQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <68dd4a12-9418-cbac-26d0-66870a331df3@gmail.com>
Date: Sat, 5 Oct 2019 10:34:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp94wxzUrxb_t7FdzvcLHye1pr67S3YXY31o5EHd_HmDQ@mail.gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [thud][PATCH] mariadb: update SRC_URI, as 5.5.64 has moved to archive
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
X-List-Received-Date: Sat, 05 Oct 2019 17:34:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/5/19 9:56 AM, Khem Raj wrote:
> On Sat, Oct 5, 2019 at 9:12 AM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 9/29/19 11:14 AM, Adrian Bunk wrote:
>>> On Sun, Sep 29, 2019 at 12:20:07PM -0400, Denys Dmytriyenko wrote:
>>>> On Sun, Sep 29, 2019 at 03:43:39PM +0300, Adrian Bunk wrote:
>>>>> On Fri, Sep 27, 2019 at 08:56:39PM -0400, Denys Dmytriyenko wrote:
>>>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>>>
>>>>>> The old URL now gives 404 Not Found
>>>>>> ...
>>>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>>>>>  LICENSE = "GPLv2"
>>>>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>>>>>
>>>>>> -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
>>>>>> +SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>>>>> ...
>>>>> This change should first go into master (and also warrior).
>>>> Yeah, let me just go downgrade master and warrior to this old version,
>>>> so I can fix the download URL...
>>> archive.mariadb.org has all versions, including some that are even more
>>> recent than the version currently in master.
>>>
>>> Not changing the URL in master now will only bring us the same problem
>>> in zeus later.
>> Currently Thud is broken and needs this fix. Being proactive to avoid a
>> future issue should not be a reason not to take this patch.
>>
> using archive.mariadb.org makes sense for master too, so I have gone
> and adapted the patch to apply to master as well. however, it wont be
> a straight backport for thud so you have apply the proposed patch as
> such to thud. What is done on warrior needs to be figured out as well.

Thanks.

I will put this on my plate to address for warrior.

- armin
> see
>
> https://patchwork.openembedded.org/patch/165527/
>
>
>> - armin
>>>> Denys
>>> cu
>>> Adrian
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


