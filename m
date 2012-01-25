Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rq4b2-0004kr-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 16:17:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2012 07:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="102554307"
Received: from unknown (HELO helios.localnet) ([10.252.122.164])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2012 07:09:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 15:09:21 +0000
Message-ID: <1986227.xc2nDXUkFr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <20120125141018.GE3843@jama.jama.net>
References: <1592899.mTy93uB97i@helios> <20120125141018.GE3843@jama.jama.net>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 15:17:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 January 2012 15:10:18 Martin Jansa wrote:
> I don't see problems as it's now and I fear that splitting it even more
> will result only in more complexity.

We deal with a high-level of complexity in OE, I don't think there's any 
getting away from it; and I'm not entirely convinced this is a significant 
increase. Debugging a build failure can be pretty complex - it can be a 
complete showstopper for someone just getting started, so let's try to avoid 
at least one class of failure that we can fairly easily avoid.

> If there are problems with some recipes then we should try to fix them
> no matter in which even smaller layer they belong.

Sure, this always applies. I just think it would be a worthwhile effort to 
reduce the likelihood of people coming across unexpected failures in parts of 
the system they don't need or would rather not have to debug themselves.
 
> I think we should rather address that issue with layer "priority" which
> should be easier to understand and adjust in bblayers.conf.

This is fine for advanced users like you and me who would know that adding a 
layer has introduced something they don't need and they should just adjust the 
priority to fix it. For the uninitiated, priority values in bblayers.conf will 
be yet more knobs they have to adjust before their build will work.

> And that DEFAULT_PREFERRENCE should be respected across layers, IIRC if
> you add newer less-well tested version of some recipe (like I did with
> libsoup-2.4 in meta-efl) then it's preferred over "stable" version in
> oe-core even when it has lower D_P -1.

I agree that in its most common usage DEFAULT_PREFERENCE is likely to be more 
valuable independent of the layer priority - we should consider this. The 
usefulness in this context is of course dependent on people actually setting 
DEFAULT_PREFERENCE = "-1" when they add the new recipe however.
 
> And we should continue to replace .bb files which exists in meta-oe and
> also in oe-core with .bbappends.

Agreed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


