Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T63SH-0007M0-1U
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 19:50:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2012 10:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,321,1344236400"; d="scan'208";a="185431067"
Received: from unknown (HELO helios.localnet) ([10.252.121.136])
	by azsmga001.ch.intel.com with ESMTP; 27 Aug 2012 10:38:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Simon Busch <morphis@gravedo.de>
Date: Mon, 27 Aug 2012 18:38:03 +0100
Message-ID: <2154638.Zymf6iV0YH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAMKF1sotij-SktKtd27iE+rNjU09XZYBQzNMssRpBZVK1myrOw@mail.gmail.com>
References: <503B8DC7.3050909@gravedo.de>
	<CAMKF1sotij-SktKtd27iE+rNjU09XZYBQzNMssRpBZVK1myrOw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] udev without initscript
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
X-List-Received-Date: Mon, 27 Aug 2012 17:50:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 August 2012 10:31:30 Khem Raj wrote:
> On Mon, Aug 27, 2012 at 8:09 AM, Simon Busch <morphis@gravedo.de> wrote:
> > recently I discovered that the udev version provided by meta-oe doesn't
> > ship an initscript for sysvinit anymore where oe-core's version of udev
> > still does. Is there a specific cause for this or is it just as
> > everybody uses systemd theses days with meta-oe instead of sysvinit?
> 
> I guess people just use systemd since it was entwined in meta-oe before it
> spun into its own layer.

Sounds like something that ought to be fixed. FYI however I believe there is a 
plan to update udev in OE-Core pretty soon, which will definitely include an 
init script if appropriate - not sure what the status of that is though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


