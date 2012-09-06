Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9XfU-0001d8-8q
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 10:42:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Sep 2012 01:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,377,1344236400"; d="scan'208";a="218478395"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2012 01:30:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Thu, 06 Sep 2012 09:30:05 +0100
Message-ID: <1477981.pb89MerWOV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <50485B04.4030002@communistcode.co.uk>
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<1718555.hFmUFu8O5x@helios> <50485B04.4030002@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Thu, 06 Sep 2012 08:42:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 September 2012 09:12:52 Jack Mitchell wrote:
> On 05/09/12 22:32, Paul Eggleton wrote:
> > On Wednesday 05 September 2012 21:28:18 Martin Jansa wrote:
> >> On Wed, Sep 05, 2012 at 03:16:10PM +0100, Paul Eggleton wrote:
> >>> It's not totally clear but it doesn't look like 1.8.2 has been released
> >>> yet judging from their website; if that's the case then PV should be set
> >>> to "1.8.1+git${SRCPV}".
> >> 
> >> Or rather
> >> "1.8.1+gitr${SRCPV}"
> >> like most meta-* recipes
> > 
> > This was discussed not that long ago IIRC - the r is superfluous for git.
> > In fact if you look at most OE-Core recipes that use SRCPV they do not
> > precede it with r.
> > 
> > Cheers,
> > Paul
> 
> So even though it is the 1.8.1 release commit it should still be tagged
> with the git SRCPV?

Well, I don't personally think so - if it really is 1.8.1 (and it's pointing 
at the same revision as the "1.8.1" tag, so it ought to be) then I don't think 
it should be needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


