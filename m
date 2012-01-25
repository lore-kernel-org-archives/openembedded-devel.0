Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rq6Sm-0002xt-GF
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 18:16:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2012 06:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110627692"
Received: from unknown (HELO helios.localnet) ([10.252.122.164])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2012 06:47:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Philip Balister <philip@balister.org>
Date: Wed, 25 Jan 2012 14:47:43 +0000
Message-ID: <1908796.glHMrEiIxU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <4F20130D.2010208@balister.org>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 25 Jan 2012 17:16:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 January 2012 09:34:53 Philip Balister wrote:
> On 01/25/2012 07:48 AM, Paul Eggleton wrote:
> > I think what most people want when they enable meta-oe in their layer
> > configuration is #1, and it's probably OK to get #2 along with it. They do
> > not however expect versions of toolchains, eglibc or other fairly
> > fundamental bits and pieces that might cause their build to fail when
> > everything worked fine just building with OE-Core (#4). Equally I expect
> > there will be some people who want just #3 and nothing else.
> 
> My understanding is the OE-Core toolchains lack the Linaro patches which
> a extremely useful for people using armv7. So dropping toolchains from
> meta-oe would be a really bad thing for a large portion of the user base.

I was suggesting moving these toolchains to a separate layer where those who 
don't need them aren't tripping over them. Adding such a layer to your 
configuration is more or less trivial, and once done you would not notice any 
difference.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


