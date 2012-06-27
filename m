Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sjuou-0003A0-Bw
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 18:10:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116586001"
Received: from unknown (HELO helios.localnet) ([10.252.120.185])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Jun 2012 08:58:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jun 2012 16:58:39 +0100
Message-ID: <1653998.N39MDkghNa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <CAMKF1spB5Q3BHhbbnf6ARfJBZ=si-LE-7wYw07w=_ODSG4dPOA@mail.gmail.com>
References: <20317992.tBZ1YY1I5v@helios>
	<CAMKF1spB5Q3BHhbbnf6ARfJBZ=si-LE-7wYw07w=_ODSG4dPOA@mail.gmail.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] LAMP layer
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
X-List-Received-Date: Wed, 27 Jun 2012 16:10:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 27 June 2012 08:49:22 Khem Raj wrote:
> I think PHP probably is common enough to be part
> of meta-oe or core. instead of lamp call it something else may be
> meta-webservers or something
> and more alternatives can also be put in there

I don't know a huge amount about PHP but it appears to me that it can be built 
either standalone or as an Apache module - we had two separate recipes to 
build each alternative in OE-classic, and that split persists today - the 
standalone version is in meta-oe and I'm resurrecting the apache module 
version (modphp).

I don't think PHP belongs in OE-core - it's not something everyone needs. I'm 
willing to accept the standalone version might also belong in this layer 
though particularly if it turns into a more generic web server layer as you're 
suggesting. I'm not sure I can commit to cleaning up the standalone version 
though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


