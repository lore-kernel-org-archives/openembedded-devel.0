Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 04AF174D83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:29:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v15-v6so7304953pff.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 20:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=o9KwuEICVBgUUKQxJSCRTtmhc1RCbRw3W981Cds6rCc=;
	b=D+TQIk4R+OM9crORDIyPUmOXDxWNskSOnNhTQ+HgiM85Dgda4aE8l8xlMsnYI9XpxJ
	38u6+kerz5GIpjlgyXBMMpHwB+1LvdC+3QpIla/MyvV0ni/prHIcEWNuwrgwh59KRLuM
	8R3S4/TPKZ6HMK8x9RvfsoxGTkHVcUkBV1bMJmVWOAhLFSgUX5hgJC1nYDq4UCstGVZB
	evAfS+BOREdVqU7Gpbiuvv9cAnBo9iHYYA+UwHrk9ZNdCtOmWorViBjocVA0XRylIZDA
	eAVfL3yScZM9XMD5akfhroRqepJWCOARMoAe9GQknFxj2HPqBhWWm4wqjIC3rWR6/Ady
	RMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=o9KwuEICVBgUUKQxJSCRTtmhc1RCbRw3W981Cds6rCc=;
	b=S6ODSnjn6rVCFsfcucbCFlxO/Zx3q5snyMd9cAVa7VTyNP0w1kJo8rrXjWEIBb231f
	OUeMRjhaOgyBo3/vpBkWM6WqYGncBW7w+bukUU8MCB1Ou4f3+eQ8C2YrLuFA0WbVmCGP
	OqU+kXz2Ny46Xw95aXd/4bJzgMfENuX5cnAtJptIXMsrmWN2a6FaPNaVWf3+Z/ADbHoW
	Es2oEGXdjbtiaYVb8OHmnl9O07PeZUNk4sabvJ3A1F3EURcrVkeKRufj7IzW66hacS2v
	SRrirloDV1spoi3A20W8ILGUJCL/naqy7ROdFJFMzpdJFzZITsTrhdgo5XQ1G/4bqfNz
	oubg==
X-Gm-Message-State: AOUpUlH+yCMyzQ5eXeKYQnLPHhwjkS+DmivDiyh/xtUo3PrlE+sPRKjE
	as1hxS8Grfhabkz+ZkNLWEeY9GTT
X-Google-Smtp-Source: AAOMgpdixLqAvTXJSndZUdx7x4/j0bMUsuMMx697kL2L5xq8GD9K1j1pOJ3uwz2s5qoIeRPl6k7xAg==
X-Received: by 2002:a62:e0d5:: with SMTP id
	d82-v6mr20720680pfm.59.1531798200734; 
	Mon, 16 Jul 2018 20:30:00 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:7d41:3be:d05:72ba])
	by smtp.gmail.com with ESMTPSA id
	t78-v6sm58161228pfa.160.2018.07.16.20.29.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 20:30:00 -0700 (PDT)
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20180716053602.14820-1-mingli.yu@windriver.com>
	<ee78bb47-93a1-c8c3-5ab6-2cd9bdae0d17@intel.com>
	<5B4C6167.5030100@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <af12b16f-68e3-a2df-9630-36a8500470c5@gmail.com>
Date: Mon, 16 Jul 2018 20:29:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <5B4C6167.5030100@windriver.com>
Subject: Re: [meta-oe][PATCH] bonnie++: Upgrade to 1.04
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
X-List-Received-Date: Tue, 17 Jul 2018 03:30:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 7/16/18 2:12 AM, Yu, Mingli wrote:
> 
> 
> On 2018年07月16日 15:11, Anuj Mittal wrote:
>> On 07/16/2018 01:36 PM, mingli.yu@windriver.com wrote:
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>   .../bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb}         | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>   rename meta-oe/recipes-benchmark/bonnie/{bonnie++_1.03e.bb => 
>>> bonnie++_1.04.bb} (73%)
>>>
>>> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb 
>>> b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
>>> similarity index 73%
>>> rename from meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>>> rename to meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
>>> index 2c1217e34..d7583f076 100644
>>> --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>>> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
>>> @@ -4,11 +4,10 @@ SECTION = "benchmark/tests"
>>>   LICENSE = "GPLv2"
>>>   LIC_FILES_CHKSUM = 
>>> "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
>>>
>>> -SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
>>> -           file://gcc-4.3-fixes.patch \
>>> +SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}_${PV}.tgz \
>>>   "
>>
>> Should the patch file itself be deleted too?
> 
> Can build successfully without this patch for 
> qemux86/qemux86-6/qemuppc/qemuarm/qemuarm64/qemumips/qemumips64, so this 
> patch can be safe to remove.
> 

OK thanks for testing. Send a v2 with patch removed.

> Thanks,
> 
>>
>> Thanks,
>>
>> Anuj
>>

