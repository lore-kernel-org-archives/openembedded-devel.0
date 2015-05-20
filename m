Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3A997601E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 15:27:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 May 2015 08:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,464,1427785200"; d="scan'208";a="697826346"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by orsmga001.jf.intel.com with ESMTP; 20 May 2015 08:27:26 -0700
Message-ID: <555CA7FF.4050702@linux.intel.com>
Date: Wed, 20 May 2015 18:27:59 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <555B59D4.80304@linux.intel.com> <555B9872.50301@gmail.com>
	<CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 May 2015 15:27:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2015 12:18 PM, Burton, Ross wrote:
>
>> I don't have an issue with that. Do you need both Ruby and bundler? I
>> believe there is value in having additional ruby packages outside core,
>> like python is structured.
>>
> Agreed, meta-ruby should continue to exist for anything outside of the core
> Ruby runtime, exactly like meta-python and meta-cpan.
>
>


Alright then. I'll add the ruby runtime to oe-core and won't touch the 
rest. When it appears in master, meta-ruby should be updated to remove 
the recipe.


Alex

