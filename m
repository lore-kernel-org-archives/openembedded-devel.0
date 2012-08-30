Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T75vv-0005Qm-Ju
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 16:41:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Aug 2012 07:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,341,1344236400"; d="scan'208";a="187171424"
Received: from unknown (HELO helios.localnet) ([10.252.121.146])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2012 07:29:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mateusz Nowaczyk <mateusz.nowaczyk@wisene.pl>
Date: Thu, 30 Aug 2012 15:29:05 +0100
Message-ID: <1354802.G46xZeSRAF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <503F773F.6020409@wisene.pl>
References: <503E506E.2010002@wisene.pl> <k1n6oh$8ve$1@ger.gmane.org>
	<503F773F.6020409@wisene.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Newbie question: Angstrom on at91sam9g20
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
X-List-Received-Date: Thu, 30 Aug 2012 14:41:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 30 August 2012 16:22:55 Mateusz Nowaczyk wrote:
> Pseudo is not present but is required, building this first before the
> main build
> ERROR: ParseError at
> /home/mn/angstrom/setup-scripts/sources/meta-atmel/recipes-bsp/u-boot/u-boot
> .inc:62: unparsed line: 'INSANE_SKIP_${PN} = True':  --:--:--
> ERROR: Command execution failed: Exited with 1
> Is there any way to fix it?

Whoever maintains the meta-atmel layer needs to fix it up to use quotes around 
that value - also True is probably no longer an appropriate value for 
INSANE_SKIP_. 

It sounds like meta-atmel is somewhat out of date with respect to master since 
the quoting change went in a few months ago.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


