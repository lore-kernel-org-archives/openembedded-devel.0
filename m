Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDgNt-0001Rl-8q
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 20:21:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Mar 2013 11:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,803,1355126400"; d="scan'208";a="273376555"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by orsmga001.jf.intel.com with ESMTP; 07 Mar 2013 11:05:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Mar 2013 19:05:02 +0000
Message-ID: <3810027.HT6CULjW6h@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <20130307160542.GR32228@jama.dyndns-home.com>
References: <20130213190804.GA11672@windriver.com>
	<20130307160542.GR32228@jama.dyndns-home.com>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH][meta-selinux] policycoreutils dependency issues
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
X-List-Received-Date: Thu, 07 Mar 2013 19:21:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 07 March 2013 17:05:42 Martin Jansa wrote:
> On Wed, Feb 13, 2013 at 02:08:04PM -0500, Amy Fong wrote:
> > policyutilutils: needs some dependencies unconditionally
> > 
> > policycoreutils will fail to compile if selinux isn't in the
> > DISTROFEATURES. We move these packages out of @target_selinux.
> > 
> > Signed-off-by: Amy Fong <amy.fong@windriver.com>
> 
> Where is this meta-selinux layer?
> 
> I don't see it on
> http://www.openembedded.org/wiki/LayerIndex

I think this was an oversight. I've just added it in any case.

> Was this meant for openembedded-devel@lists.openembedded.org?

According to the MAINTAINERS file in the layer, patches should be sent to 
yocto@yoctoproject.org. Amy, could you please re-send your patch there?

> And BTW: use better syntax for PRINC to allow multiple .bbappends.. hmm
> well you're having PRINC in .inc.. interesting.

Yes that's probably not best practice.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


