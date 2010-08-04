Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ogi7f-0007sx-1l
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:51:28 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6N007IZ04UAXH0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Aug 2010 11:50:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E748B14AF64; Wed,
	04 Aug 2010 12:50:53 -0400 (EDT)
Date: Wed, 04 Aug 2010 12:50:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100804165053.GB7189@denix.org>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org> <20100804052042.GB7085@gmail.com>
	<1280920678.26249.33.camel@saphir>
	<1280922518.2692.377.camel@mill.internal.reciva.com>
	<131E5DFBE7373E4C8D813795A6AA7F0802E9149F9B@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F0802E9149F9B@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in	COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 17:51:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 04, 2010 at 09:11:19AM -0500, Maupin, Chase wrote:
> 
> > Failing that though, testing COMPATIBLE_MACHINE against MACHINE_CLASS
> > probably is more desirable than adding a completely new variable (i.e.
> > SOC_FAMILY) for that purpose.
> 
> From what I've learned it seems that MACHINE_CLASS and SOC_FAMILY are 
> different in what they are trying to accomplish.
> 
> SOC_FAMILY is defining a family of processors and the features that 
> processor has.  Whereas MACHINE_CLASS is defining a type of device and its 
> features which can use different processors.  So basically SOC_FAMILY 
> defines common processors and MACHINE_CLASS defines common end devices.
> 
> This difference is why SOC_FAMILY exists.  We can have many processors that 
> fit into an SOC_FAMILY that can be used across a variety of end applications 
> from DVR to ip net camera to mobile phone.

I guess this conclusion was direved solely from the names of the respective 
variables. As technically both of them are exactly the same - a variable set 
in machine config or include file and used in OVERRIDES...

-- 
Denys


