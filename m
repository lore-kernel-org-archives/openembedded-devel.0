Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUKix-0008T1-Re
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 19:40:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Apr 2013 10:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,528,1363158000"; d="scan'208";a="230393884"
Received: from unknown (HELO helios.localnet) ([10.255.13.204])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Apr 2013 10:22:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Frederick Stakem -X (fstakem - INSIGHT GLOBAL INC@Cisco)" <fstakem@cisco.com>
Date: Mon, 22 Apr 2013 18:22:37 +0100
Message-ID: <1873251.PVL8ihXRQi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <8286419.6fgEXAJ5OG@helios>
References: <48B972723E0C6F45AE2F2588F9846DFE0FB3AAB1@xmb-rcd-x09.cisco.com>
	<8286419.6fgEXAJ5OG@helios>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Information from a bitbake parse
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
X-List-Received-Date: Mon, 22 Apr 2013 17:40:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 22 April 2013 18:15:32 Paul Eggleton wrote:
> On Thursday 18 April 2013 12:39:21 Frederick Stakem -X wrote:
> > I have been poking through the bitbake python code and can't seem to
> > figure
> > out this problem. I want to parse all of the bitbake files for a build and
> > have this information exported into a text format. In short I want the
> > information in the recipes condensed into an easier to parse format so
> > that
> > I can use it in my own software. Does anyone know how to do this or where
> > in the code I can gain access to this information. I have put a decent
> > amount of debug code in the bitbake cooker but have come up empty so far.
> 
> So, you might like to look at the update script I wrote for the layer index:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/tree/layerindex/up
> date.py
> 
> Because I needed it to ignore parsing errors it does parse one file at a
> time (doing the internal equivalent of a bitbake -e) rather than relying on
> the cache, something I hope to re-engineer in future. I'm not sure if how
> it does things will exactly fit what you're trying to do but it should
> allow you to extract information from each recipe if that's all you need.

Sorry, it would help if I mentioned a couple of things about the script 
specifically:

* This script uses the "tinfoil" wrapper around BitBake that is useful for 
creating small BitBake-based utilities such as this one.

* The update_recipe_file() function is where you need to look for the actual 
code that reads the information from each recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


