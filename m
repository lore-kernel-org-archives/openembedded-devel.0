Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TeULX-0001Du-44
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 18:25:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUHBUN6012111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Nov 2012 09:11:30 -0800 (PST)
Received: from msp-dhcp46.wrs.com (172.25.34.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 30 Nov 2012 09:11:30 -0800
Message-ID: <50B8E8C3.20806@windriver.com>
Date: Fri, 30 Nov 2012 11:11:31 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <50B8DC5A.7050203@windriver.com>
	<20121130163410.GP6912@windriver.com> <5531449.L0Ch4936zy@helios>
In-Reply-To: <5531449.L0Ch4936zy@helios>
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: netperf in meta-networking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 17:25:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/12 10:55 AM, Paul Eggleton wrote:
> On Friday 30 November 2012 11:34:11 Joe MacDonald wrote:
>> [netperf in meta-networking] On 12.11.30 (Fri 10:18) Mark Hatle wrote:
>>> I was helping someone with building netperf from meta-networking
>>> last night, and stumbled on what I think is a bug.
>>>
>>> SUMMARY = "A networking benchmarking tool"
>>> DESCRIPTION = "Network performance benchmark including tests for
>>> TCP, UDP, sockets, ATM and more."
>>> SECTION = "console/network"
>>> HOMEPAGE = "http://www.netperf.org/"
>>> LICENSE = "netperf"
>>> LICENSE_FLAGS = "commercial"
>>>
>>> In the above, the LICENSE_FLAGS are set to 'commercial'.  I think
>>> this is incorrect.  It should be set to 'non-commercial'.
>>>
>>> There is a subtle difference between them which is why I think it's a
>>> bug...
>>>
>>> commercial -- there are some commercial requirements necessary to
>>> use this recipe in a commercial device... you are responsible for
>>> understanding them and doing whatever is necessary... (for
>>> non-commercial devices you can likely use it...)
>>>
>>> non-commercial -- this item is restricted to non-commercial users
>>> only.  As in the case of netperf, the license says it's only for
>>> non-commercial use.
>>>
>>> So anyway, my suggestion is to simply change the value of the flag.
>>
>> Ugh.  I had a quick look around and the first thing I found was this:
>>
>> http://www.netperf.org/svn/netperf4/trunk/include/netperf.h
>
> This is netperf4 though which I gather is distinct from the version of netperf
> we are building.
>
>> So I had a look at the netperf source tree fetched by bitbake during a
>> build.  The COPYING file says this:
>>
>>    The enclosed software and documentation includes copyrighted works
>>    of Hewlett-Packard Co. For as long as you comply with the following
>>    limitations, you are hereby authorized to (i) use, reproduce, and
>>    modify the software and documentation, and to (ii) distribute the
>>    software and documentation, including modifications, for
>>    non-commercial purposes only.
>>
>> So I'm inclined to agree, this sounds like the definition of
>> non-commercial above to me.
>
> It's a subtlety - in either case you can't just go ahead and use it for
> commercial use. I wouldn't object to changing it to "non-commercial" though if
> it makes more sense.
>
> Would it be practical for us to move to netperf4 which is GPLv2+ licensed? I'm
> not sure if it is a complete replacement for netperf 2.x and we'd need to
> confirm that first, but at least the license is more reasonable...

There are things that netperf4 can not do, that netperf 2.x can.  So I would 
recommend that we add a 'netperf4_<PV>.bb' recipe as well.  This way the user 
can select either or both of the netperf's depending on their requirements.

According to the netperf home page, if you want something "more open source" 
they suggest you use netperf4.

--Mark

> Cheers,
> Paul
>



