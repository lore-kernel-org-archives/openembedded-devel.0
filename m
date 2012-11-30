Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TeU5q-0000sM-F0
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 18:09:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2012 08:55:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,192,1355126400"; d="scan'208";a="257226851"
Received: from unknown (HELO helios.localnet) ([10.252.123.9])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2012 08:55:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Fri, 30 Nov 2012 16:55:06 +0000
Message-ID: <5531449.L0Ch4936zy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <20121130163410.GP6912@windriver.com>
References: <50B8DC5A.7050203@windriver.com>
	<20121130163410.GP6912@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 30 Nov 2012 17:09:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 30 November 2012 11:34:11 Joe MacDonald wrote:
> [netperf in meta-networking] On 12.11.30 (Fri 10:18) Mark Hatle wrote:
> > I was helping someone with building netperf from meta-networking
> > last night, and stumbled on what I think is a bug.
> > 
> > SUMMARY = "A networking benchmarking tool"
> > DESCRIPTION = "Network performance benchmark including tests for
> > TCP, UDP, sockets, ATM and more."
> > SECTION = "console/network"
> > HOMEPAGE = "http://www.netperf.org/"
> > LICENSE = "netperf"
> > LICENSE_FLAGS = "commercial"
> > 
> > In the above, the LICENSE_FLAGS are set to 'commercial'.  I think
> > this is incorrect.  It should be set to 'non-commercial'.
> > 
> > There is a subtle difference between them which is why I think it's a
> > bug...
> > 
> > commercial -- there are some commercial requirements necessary to
> > use this recipe in a commercial device... you are responsible for
> > understanding them and doing whatever is necessary... (for
> > non-commercial devices you can likely use it...)
> > 
> > non-commercial -- this item is restricted to non-commercial users
> > only.  As in the case of netperf, the license says it's only for
> > non-commercial use.
> > 
> > So anyway, my suggestion is to simply change the value of the flag.
> 
> Ugh.  I had a quick look around and the first thing I found was this:
> 
> http://www.netperf.org/svn/netperf4/trunk/include/netperf.h

This is netperf4 though which I gather is distinct from the version of netperf 
we are building.

> So I had a look at the netperf source tree fetched by bitbake during a
> build.  The COPYING file says this:
> 
>   The enclosed software and documentation includes copyrighted works
>   of Hewlett-Packard Co. For as long as you comply with the following
>   limitations, you are hereby authorized to (i) use, reproduce, and
>   modify the software and documentation, and to (ii) distribute the
>   software and documentation, including modifications, for
>   non-commercial purposes only.
> 
> So I'm inclined to agree, this sounds like the definition of
> non-commercial above to me.

It's a subtlety - in either case you can't just go ahead and use it for 
commercial use. I wouldn't object to changing it to "non-commercial" though if 
it makes more sense.

Would it be practical for us to move to netperf4 which is GPLv2+ licensed? I'm 
not sure if it is a complete replacement for netperf 2.x and we'd need to 
confirm that first, but at least the license is more reasonable...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


