Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 47D347DDCC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 16:12:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q15so4594865pll.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=x+iVt9HMNk8g6VcW552hkD3O4xgFT0HMwjNTCT6mnec=;
	b=bsQGs7DUufBUE1Hl4cAud1dcg6sSt2TFFIGM/kVbhG/ckDBgZITssgSb7fvHAcsSOG
	khDeQ05rMnoCOjH0c26khTVfRkYL4BWwq2RoynnpHVwTTg0MK/UKcTUODawq/Iew7xFG
	gc2JDjCeaeBsD7OwVqhlEZg626vL2EMt+nLhmjiHqD0xB/slLAxz+/P6+N+T9o2SJNR6
	bI3FTb4uGinLU1CrYmxngYDf3eFoUCyqZsj7xGNuq7Qy9SI3qybOyf9NVEYkmBUVh7Do
	l+TI1V5XHTxmw5c52ZHdzVxlufGnFuj27VeKiVA6nUjLPOYe2VOevPVk4dALW4c0AS5B
	/5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=x+iVt9HMNk8g6VcW552hkD3O4xgFT0HMwjNTCT6mnec=;
	b=VLEVRvprp8qGfcC+vfLonaAVwbXtSmpfrebZXPRIyzBQTvdOEJdk4m0AIcRQNIhTZP
	1wJRDrCmdS7YeRrSfaL8gq1dBWk8s6AIpPNHS+aOV+7ZKNLcpXJQLDNNlu7QFAc9X7/O
	ZjZj6jbblazGAz1NvWp8LM48WaS0Bd2IsNVwMeG/M+QcAKUiPvo2pD7n0/W+QalgexAw
	xuzPOgMgPkyrlwR3JQxwJhTmmLHH/hiyWZb59tzy8pAGunaLI5Y1Er8LuOZpDjl6MYna
	HcGOYD1iig4LZKZGTsW3/zXXHIfLB80N8B6JwWbWspDdg9v3QPy8jwm5tJJdkW/84Klf
	3WMg==
X-Gm-Message-State: APjAAAXFQeEJzqJU8LvNT2UfiaUTMP0lHUvmcIrrahPCUonesVfvTiIo
	6vpIhOM07BWHnnkS6BLXboI=
X-Google-Smtp-Source: APXvYqxWG87kSS+pTVHKQTLKjzcdje1js+OGynYHpOZiegcpiQOcq0XVyJwUVhesYy7Obcb4U3T/pA==
X-Received: by 2002:a17:902:b685:: with SMTP id
	c5mr21759886pls.215.1570291961437; 
	Sat, 05 Oct 2019 09:12:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:88cc:97a9:c570:f3a6?
	([2601:202:4180:a5c0:88cc:97a9:c570:f3a6])
	by smtp.gmail.com with ESMTPSA id
	i37sm10735375pje.23.2019.10.05.09.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Oct 2019 09:12:40 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Denys Dmytriyenko <denis@denix.org>
References: <1569632199-7446-1-git-send-email-denis@denix.org>
	<20190929124339.GC30130@localhost> <20190929162007.GZ30018@denix.org>
	<20190929181449.GD30130@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <59a54a48-0e0f-8cdf-f51b-0e5fdd70744e@gmail.com>
Date: Sat, 5 Oct 2019 09:12:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929181449.GD30130@localhost>
Cc: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Sat, 05 Oct 2019 16:12:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/29/19 11:14 AM, Adrian Bunk wrote:
> On Sun, Sep 29, 2019 at 12:20:07PM -0400, Denys Dmytriyenko wrote:
>> On Sun, Sep 29, 2019 at 03:43:39PM +0300, Adrian Bunk wrote:
>>> On Fri, Sep 27, 2019 at 08:56:39PM -0400, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>
>>>> The old URL now gives 404 Not Found
>>>> ...
>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>>>  LICENSE = "GPLv2"
>>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>>>  
>>>> -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
>>>> +SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>>> ...
>>> This change should first go into master (and also warrior).
>> Yeah, let me just go downgrade master and warrior to this old version, 
>> so I can fix the download URL...
> archive.mariadb.org has all versions, including some that are even more 
> recent than the version currently in master.
>
> Not changing the URL in master now will only bring us the same problem 
> in zeus later.

Currently Thud is broken and needs this fix. Being proactive to avoid a
future issue should not be a reason not to take this patch.

- armin
>
>> Denys
> cu
> Adrian
>


