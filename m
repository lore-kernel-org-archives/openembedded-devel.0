Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2D41E77E8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 18:38:11 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id s66so4248036pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=et7O144tAb0vPQXrea3OZZc1Yckwm0y36YyBaPuuLu4=;
	b=kfOJKtbWTOeOiBw8AabRy3o3HNukOKNaiXw9HsS0pxm25fZY6CDskPVn5Cavx+6lIO
	9841/7znDIGkMK7fDV+nP65aWf82UBO4ooJdfomg5mPhrM40s9hToe9LD/Pcxl7sy7W5
	MATjOcmvydQSgZHicJ64o78W4vFVdpRsmOTGbz3ShJWOxDEGqh8xtIEP8nI5p/2mxAgT
	GE4lS4E9/5ruN1YFKa/FHHNUAbeVZfxbGJhYv6/KtjYrzTarofZgpkyeYG5nhvQ+lT6f
	lykN4FR3i1mB9WRipeOYfkK80m80Z1XaWAuG4yGXh8EJ7sYh0FDlAxDNGI4qnzV40o2y
	qGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=et7O144tAb0vPQXrea3OZZc1Yckwm0y36YyBaPuuLu4=;
	b=MwZnrF3CK/2HSQqdYYo01nM+0tKHAuqBXajVnqtkbQVuQdmdRlOqQU4cansIAF64zL
	7HZ3aSFBVymRsjMnJ7g6SHO3JZHRIMHohoki/JNmrO4+7lfKLZ4aof/JJFlLTfAthMrm
	2WWJR9nxtPUzDUwXL+Ey5V8wBoOmfxekR1GLID4DIgAfoKahYtBdCkekhpkep2dSBGgU
	RMgCQhDhdNMgirecHGNM9ElIDfwb49g8SOhaKon4F2R6LlP7qhpN13zXY0tNeEMziS8p
	FW1RqXklzVWZIohO+J7bdZIzaVNUE0YajK47vJI9c2RWKx8OpA02vN/e6K6tcB1S9aKl
	Os/A==
X-Gm-Message-State: AKS2vOwvyENjRsxzIAmZvKJs2eJVRmhjWmhUNqCkuSsFGkRAF9oz8RG8
	pGZYqQ0FMiW96n6tJaQ=
X-Received: by 10.84.199.170 with SMTP id r39mr1596089pld.204.1498502292962;
	Mon, 26 Jun 2017 11:38:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:844e:84be:bbd1:9ef2?
	([2601:202:4001:9ea0:844e:84be:bbd1:9ef2])
	by smtp.gmail.com with ESMTPSA id
	w69sm1356788pfk.107.2017.06.26.11.38.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 11:38:12 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
	<20170623203729.GY28053@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <793b1001-788f-7a2a-f8f3-83b31d234ee5@gmail.com>
Date: Mon, 26 Jun 2017 11:38:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170623203729.GY28053@denix.org>
Subject: Re: [meta-oe][morty][PATCH 0/6] merge devmem2 and gitver fixes from master
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
X-List-Received-Date: Mon, 26 Jun 2017 18:38:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/23/2017 01:37 PM, Denys Dmytriyenko wrote:
> Wasn't there already a submission for devmem2 backport on the list?

yes. running a bit behind. pulling in today.
-armin
>
> On Fri, Jun 23, 2017 at 09:23:18PM +0100, Alejandro Mery wrote:
>> The following changes have been cherry-picked from master and are
>> available in the git repository at:
>>
>> https://github.com/amery/meta-openembedded for-morty
>>
>> for you to fetch
>>
>> Alejandro Mery (4):
>>    gitver: fix try/except syntax for python3 support
>>    gitver: extend class to use EXTERNALSRC if set
>>    gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
>>    gitver: skip packages instead of panic()ing if ${GITVER} fails to
>>      expand
>>
>> Denys Dmytriyenko (1):
>>    devmem2: use different filename to avoid checksum conflicts
>>
>> Nicolas Ferre (1):
>>    devmem2: Change source URL to regain access to it
>>
>>   meta-oe/classes/gitver.bbclass             | 51 ++++++++++++++++++------------
>>   meta-oe/recipes-support/devmem2/devmem2.bb | 12 ++++---
>>   2 files changed, 38 insertions(+), 25 deletions(-)
>>
>> -- 
>> 2.13.0
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


