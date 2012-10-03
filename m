Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJOte-00014U-FW
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:21:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2012 06:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="229998204"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2012 06:08:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 14:08:52 +0100
Message-ID: <2127422.3DHfZaTr9h@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <k4h8l4$2d0$1@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<1913726.eYu8z7U0Ds@helios> <k4h8l4$2d0$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 6/6] xdebug: add new recipe
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
X-List-Received-Date: Wed, 03 Oct 2012 13:21:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 13:47:52 Koen Kooi wrote:
> >> Why not do autotools_do_configure?
> > 
> > Because AFAICT PHP modules are somewhat unusual when it comes to
> > configure, and totally break if you try to autoreconf. IIRC this was the
> > only way I could get the thing to build.
> 
> Can you add a comment saying that? A lot of recipes in OE classic replace
> the configure step, but our autotools support has improved a lot, so a
> comment saying what is going wrong will help people updating the recipe.

That's a good point, I've added a comment within do_configure on the branch 
noting why it's been done that way.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


