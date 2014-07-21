Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id F22327018E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:04:54 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so10686595pab.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=LC560K/lcd27g/nOGzS6065m6fVZhbEMSu6SkEBAyes=;
	b=f6/fpJhDeRVsBpUgiABr4Afrz4Flmxo8iZUcYy2rPOXmSlqYLRGTTIrin4I7zMYJUq
	KKjkUpiqe2URBgcrZygxxsFXU9jsOl7TXkDxE7ThTOYjaDOYjRNbuqefvNBlrqd18x5m
	Um+dH6oNHThSV+cc9hz/+W/6Rc3hdHWcmUUHbd109NvVjRHcqdVwZWZNO3vNVEiIBZpf
	P2wQUlkHdxICziLvkJYO+zitMRJyqiQUlxX1L2KCsIOWMuMjR/lqxB/q4YpWRSql625f
	2hVmZZwMehT74lEbZMKT9/oZFXAjx456R+kzBnK1kJtq4LWrZbuewQ1P1edwQ8hjRT6i
	HWRw==
X-Received: by 10.70.37.99 with SMTP id x3mr29026534pdj.48.1405983896049;
	Mon, 21 Jul 2014 16:04:56 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id v8sm3375704pdr.45.2014.07.21.16.04.53
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jul 2014 16:04:54 -0700 (PDT)
Message-ID: <53CD9C93.5070704@gmail.com>
Date: Mon, 21 Jul 2014 16:04:51 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOd_LFzaYUmCQB0vq_bxi0bWDRvEX8mGb7gFV7YQfRckTzKacQ@mail.gmail.com>
	<CAP9ODKoq4Qb6novXBgH4JB=c=-V04n5smkWp-464xqLRoDm9nQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoq4Qb6novXBgH4JB=c=-V04n5smkWp-464xqLRoDm9nQ@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][diasy] pull request, cpuburn-neon, v4l-utils, zeroc-ice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 23:04:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Armin Kuster <akuster808@gmail.com>


On 07/18/2014 09:26 AM, Otavio Salvador wrote:
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> On Wed, Jul 16, 2014 at 4:32 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>> The following changes since commit ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>>
>>    rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>>
>> are available in the git repository at:
>>
>>    https://github.com/cbrake/meta-openembedded.git 2014-07-16_merge-to-daisy
>>
>> for you to fetch changes up to d85b01997ce8cc354ccc53f97fdffc79cf2277d5:
>>
>>    v4l-utils: Add virtual/libx11 dependency only if X11 is available
>> (2014-07-16 15:28:40 -0400)
>>
>> ----------------------------------------------------------------
>> Lauren Post (1):
>>        cpuburn-neon: Upgrade to version 20140626
>>
>> Otavio Salvador (1):
>>        v4l-utils: Add virtual/libx11 dependency only if X11 is available
>>
>> Philip Balister (1):
>>        zeroc-ice : Add recipe.
>>
>>   .../cpuburn/{cpuburn-neon_20120610.bb => cpuburn-neon_20140626.bb}  |   9 +-
>>   .../zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch    |
>> 292 ++++++++++++++++++++++++++++++
>>   meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb           |
>>   77 ++++++++
>>   meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb              |   3 +-
>>   4 files changed, 376 insertions(+), 5 deletions(-)
>>   rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon_20120610.bb =>
>> cpuburn-neon_20140626.bb} (69%)
>>   create mode 100644
>> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
>>   create mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
>>
>> --
>> =================
>> http://bec-systems.com
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

