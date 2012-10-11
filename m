Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMEvR-0007pN-3p
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 11:19:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Oct 2012 02:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,570,1344236400"; d="scan'208";a="204257184"
Received: from unknown (HELO helios.localnet) ([10.252.122.70])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2012 02:05:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Oct 2012 10:05:51 +0100
Message-ID: <2029532.l8FLCLtnC1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121011090133.GA3589@jama.jama.net>
References: <20121010104253.EB7AB1034A@opal>
	<20121011090133.GA3589@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : libav: Change the PACKAGES_DYNAMIC expression to be more restrict
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
X-List-Received-Date: Thu, 11 Oct 2012 09:19:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 October 2012 11:01:33 Martin Jansa wrote:
> On Wed, Oct 10, 2012 at 10:42:52AM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: 97350f52280ea9b2f3d7b36ef248be5ba3e7c696
> > URL:   
> > http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=97350f522
> > 80ea9b2f3d7b36ef248be5ba3e7c696
> > 
> > Author: Otavio Salvador <otavio@ossystems.com.br>
> > Date:   Sat Oct  6 20:18:30 2012 +0000
> > ...
> > 
> > -PACKAGES_DYNAMIC = "lib*"
> > +PACKAGES_DYNAMIC = "lib(av(codec|device|filter|format|util)|postproc)*"
> 
> Unfortunatelly this does not work, this regexp matches everything starting
> with 'lib', so it's only a bit more strict then old version which matched
> everything starting with 'li' :).
> 
> Please change it to:
> PACKAGES_DYNAMIC = "^lib(av(codec|device|filter|format|util)|postproc)"
> or
> PACKAGES_DYNAMIC = "^lib(av(codec|device|filter|format|util)|postproc).*"
> 
> ^ isn't used in any PACKAGES_DYNAMIC in oe-core, but it could make matching
> faster * is used wrong in all PACKAGES_DYNAMIC in oe-core (as in glob, but
> not regexp), so all those last '-' are optional

Are we going to fix this to actually be a glob or are we going to start 
treating it as a regex? Frankly I'd prefer to fix it to be a glob since that's 
what everyone has assumed it was since the beginning.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


