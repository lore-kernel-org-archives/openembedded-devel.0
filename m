Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TTjUO-0003WH-IZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 02:22:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Oct 2012 18:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,690,1344236400"; d="scan'208";a="163137591"
Received: from unknown (HELO helios.localnet) ([10.252.122.137])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2012 18:08:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Morgan Little <morgan.little@windriver.com>
Date: Thu, 01 Nov 2012 01:08:51 +0000
Message-ID: <3989989.S5U52SNN0R@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1351009220-30119-4-git-send-email-morgan.little@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1351009220-30119-4-git-send-email-morgan.little@windriver.com>
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
X-List-Received-Date: Thu, 01 Nov 2012 01:22:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 23 October 2012 12:20:20 Morgan Little wrote: 
> -PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
...
> +PACKAGES += "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"

I'm not particularly happy with this change. Apart from the fact that it 
wasn't mentioned in the commit message, it breaks any recipe that depends upon 
the previous ntpdate package. Could we go back to the old ntpdate name for the 
package or at the very least provide an RPROVIDES for the old name? I'm happy 
to submit a patch to do this once there is agreement either way.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


