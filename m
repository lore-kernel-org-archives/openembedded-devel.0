Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaRE-00087U-I1
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:19:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2012 09:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="251136172"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2012 09:05:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2012 17:05:29 +0000
Message-ID: <4785971.dXgzFbP6o7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <7c3ea4dccee800720d34bbc4aa81e297e6c4ebab.1353602922.git.paul.eggleton@linux.intel.com>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
	<7c3ea4dccee800720d34bbc4aa81e297e6c4ebab.1353602922.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH v2 2/2] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Thu, 22 Nov 2012 17:19:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 November 2012 16:49:35 Paul Eggleton wrote:
> People can't blindly use pool.ntp.org, especially if they are building
> for a product or something that could be used in a product, so at least
> try to get people to do the right thing and not use pool.ntp.org by
> default.
> 
> The previous network interface up script is now installed as
> ntpdate-sync in ${bindir} (and symlinked as the network if-up script).
> NTPSERVERS needs to be set in /etc/default/ntpdate.default at runtime,

Martin points out that should be "/etc/default/ntpdate" not 
"/etc/default/ntpdate.default" - I have fixed the commit message on the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


