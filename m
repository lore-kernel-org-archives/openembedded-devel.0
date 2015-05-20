Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B036601E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 17:18:40 +0000 (UTC)
Received: by pdea3 with SMTP id a3so75922702pde.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7I47Uwdvew4CfEXYbDuq4J5bN3L5iLnsjuHQYI6ZZFU=;
	b=onjuoQ0kcdShMz6M7PM17n9pOP6dbxwwLki4iwY0DhRJmLw9EHTsTSmx+OshQ7HsUB
	+lgE1k/p9qbEoEzLZXlDEGdRczVhfb/C+E1Dq+f3tucOzM9YqqzfMRtqQOeqJnDancAy
	CDl11RekIOHtTHbzVPpVnIWkBZW6Csl/50mqyJ1eXPirtye0zFoXJ/Ds/Qc34G5kOmWi
	vEiZ8mMXnN82uHo7Uu9DfzrSr4CZ3pagWDy3Ss3MQU35tFy09Sw8/5vSFVKGCgoSLvV7
	fCjCo/sq9FWV5lVEhJlC3n22lDQGl6zcBHUjOQcDUrlpKVSczifsJ6ut3tNkDd/B+h22
	RC2g==
X-Received: by 10.70.136.67 with SMTP id py3mr65813122pdb.112.1432142321918;
	Wed, 20 May 2015 10:18:41 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:256b:16fc:c06a:3641?
	([2601:c:a700:3ba7:256b:16fc:c06a:3641])
	by mx.google.com with ESMTPSA id
	ie3sm16701745pbb.49.2015.05.20.10.18.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 May 2015 10:18:40 -0700 (PDT)
Message-ID: <555CC1EE.7090501@gmail.com>
Date: Wed, 20 May 2015 10:18:38 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <555B59D4.80304@linux.intel.com>
	<555B9872.50301@gmail.com>	<CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>
	<555CA7FF.4050702@linux.intel.com>
In-Reply-To: <555CA7FF.4050702@linux.intel.com>
Subject: Re: [meta-ruby] proposal: moving ruby to oe-core
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
X-List-Received-Date: Wed, 20 May 2015 17:18:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Alex,

On 05/20/2015 08:27 AM, Alexander Kanavin wrote:
> On 05/20/2015 12:18 PM, Burton, Ross wrote:
>>
>>> I don't have an issue with that. Do you need both Ruby and bundler? I
>>> believe there is value in having additional ruby packages outside core,
>>> like python is structured.
>>>
>> Agreed, meta-ruby should continue to exist for anything outside of the
>> core
>> Ruby runtime, exactly like meta-python and meta-cpan.
>>
>>
>
>
> Alright then. I'll add the ruby runtime to oe-core and won't touch the
> rest. When it appears in master, meta-ruby should be updated to remove
> the recipe.

I have some ruby class changes but I will wait for this transition to 
complete.

thanks,
Armin

> Alex

