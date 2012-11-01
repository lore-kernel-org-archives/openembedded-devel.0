Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TTydt-0003Ig-8W
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 18:33:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Nov 2012 10:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,693,1344236400"; d="scan'208";a="235814971"
Received: from unknown (HELO helios.localnet) ([10.252.122.134])
	by orsmga002.jf.intel.com with ESMTP; 01 Nov 2012 10:19:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Little, Morgan" <Morgan.Little@windriver.com>
Date: Thu, 01 Nov 2012 17:19:30 +0000
Message-ID: <1363930.E51Pa0kBDd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<20121101143114.GF4673@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Thu, 01 Nov 2012 17:33:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
> My rational behind splitting like that is if it is just ntpdate and you try
> to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It could be
> change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provides a
> uniquely named version.

The ssl version could be ntpdate-ssl if it needs to be unique. I think 
originally though these recipes weren't intended to be built side-by-side - 
rather they were mutually exclusive and the distro would make a choice as to 
which one was built.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


