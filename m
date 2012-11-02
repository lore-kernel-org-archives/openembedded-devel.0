Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TUIAM-0004Ia-CC
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 15:24:11 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Nov 2012 07:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,699,1344236400"; d="scan'208";a="163785084"
Received: from unknown (HELO helios.localnet) ([10.252.122.125])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Nov 2012 07:10:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Fri, 02 Nov 2012 14:10:27 +0000
Message-ID: <4865473.CrnCVaFvWL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121102140222.GG4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<5635412.CqmEY78XQ7@helios> <20121102140222.GG4416@windriver.com>
MIME-Version: 1.0
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 02 Nov 2012 14:24:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:
> On 12.11.02 (Fri 13:38) Paul Eggleton wrote:
> > I have to say I think that these days this could be better implemented
> > as one ntp recipe with a PACKAGECONFIG that you can use to enable
> > OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> > done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> > choice as to whether this is enabled as I believe was originally
> > intended.
> 
> I'm also perfectly fine with that.  Question, though.  Do you mean that
> the presence of OpenSSL in the distro would then mean you get ntp-ssl
> all the time?  That would be fine for me, but I wonder if anyone else
> might want OpenSSL on their system but a non-ssl-enabled ntp?  Probably
> a silly case to be thinking about anyway.

The idea with PACKAGECONFIG is it allows per-recipe control over this kind of 
thing. The default would be for OpenSSL support to be disabled, but it could 
be enabled with a bbappend containing PACKAGECONFIG += "openssl"; 
alternatively you could do PACKAGECONFIG_append_pn-ntp = " openssl" in the 
distro .conf file or even local.conf.

I'll send a patch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


