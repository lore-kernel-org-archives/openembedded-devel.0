Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TNib0-0006ZU-6h
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 13:12:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Oct 2012 03:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,587,1344236400"; d="scan'208";a="226991232"
Received: from unknown (HELO helios.localnet) ([10.252.122.76])
	by orsmga002.jf.intel.com with ESMTP; 15 Oct 2012 03:59:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 15 Oct 2012 11:59:12 +0100
Message-ID: <1973903.D9SRCPrtLZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <507BEAD5.8020302@linaro.org>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
	<3713695.RcKMCbUqi3@helios> <507BEAD5.8020302@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 0/2] modphp fixes
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
X-List-Received-Date: Mon, 15 Oct 2012 11:12:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 October 2012 12:52:05 Marcin Juszkiewicz wrote:
> W dniu 12.10.2012 19:58, Paul Eggleton pisze:
> > Looks like it thinks it's supposed to be producing static libraries for
> > some reason - when I build here (for qemuarm at the moment) I have these
> > files:
> > 
> > Not sure what would cause that specifically, but it's a clue at least.
> 
> Your do_configure did that. config.{sub,guess} were too old for AArch64.

If you can make the build succeed without overriding do_configure, then please 
send patches. I didn't have any success with that the last time I tried it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


