Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUKc7-0007oS-PJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 19:33:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 10:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,528,1363158000"; d="scan'208";a="322410485"
Received: from unknown (HELO helios.localnet) ([10.255.13.204])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 10:15:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Frederick Stakem -X (fstakem - INSIGHT GLOBAL INC@Cisco)" <fstakem@cisco.com>
Date: Mon, 22 Apr 2013 18:15:32 +0100
Message-ID: <8286419.6fgEXAJ5OG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <48B972723E0C6F45AE2F2588F9846DFE0FB3AAB1@xmb-rcd-x09.cisco.com>
References: <48B972723E0C6F45AE2F2588F9846DFE0FB3AAB1@xmb-rcd-x09.cisco.com>
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
X-List-Received-Date: Mon, 22 Apr 2013 17:33:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 April 2013 12:39:21 Frederick Stakem -X wrote:
> I have been poking through the bitbake python code and can't seem to figure
> out this problem. I want to parse all of the bitbake files for a build and
> have this information exported into a text format. In short I want the
> information in the recipes condensed into an easier to parse format so that
> I can use it in my own software. Does anyone know how to do this or where
> in the code I can gain access to this information. I have put a decent
> amount of debug code in the bitbake cooker but have come up empty so far.

So, you might like to look at the update script I wrote for the layer index:

https://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/tree/layerindex/update.py

Because I needed it to ignore parsing errors it does parse one file at a time 
(doing the internal equivalent of a bitbake -e) rather than relying on the
cache, something I hope to re-engineer in future. I'm not sure if how it
does things will exactly fit what you're trying to do but it should allow
you to extract information from each recipe if that's all you need.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


