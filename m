Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OjDyL-0005Sy-0k
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 18:16:11 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6Z00HIJX5ZERE1@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	11 Aug 2010 11:15:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B037214AF64; Wed,
	11 Aug 2010 12:15:35 -0400 (EDT)
Date: Wed, 11 Aug 2010 12:15:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100811161535.GI7189@denix.org>
References: <4C607E6C.2030104@mlbassoc.com>
	<AANLkTi=zp9r7hoym3kFEx9hpCgoQ8iOBVNZ6FhN7F4q6@mail.gmail.com>
	<4C6130EC.9030602@mlbassoc.com> <4C614AB7.2050709@mlbassoc.com>
	<20100810192710.GE7189@denix.org>
	<20100811072031.GA7282@mi.fu-berlin.de>
MIME-version: 1.0
In-reply-to: <20100811072031.GA7282@mi.fu-berlin.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Can't build gstreamer-ti
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
X-List-Received-Date: Wed, 11 Aug 2010 16:16:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 11, 2010 at 09:20:31AM +0200, Henning Heinold wrote:
> On Tue, Aug 10, 2010 at 03:27:10PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Aug 10, 2010 at 06:48:55AM -0600, Gary Thomas wrote:
> > > On 08/10/2010 04:58 AM, Gary Thomas wrote:
> > >> But I've downloaded those tools and was able to build this recipe just
> > >> a few weeks ago. I think something in the staged packaging has broken it.
> > >
> > > I worked past this problem by installing a symlink by hand to my DVSDK 
> > > installed tools.
> > >
> > > Next problem :-(
> > >
> > > | Engine.c:(.text+0x19d4): undefined reference to `__aeabi_uidiv'
> > >
> > > How were these packages built to be put on the Angstrom package feed?
> > > Am I doing something wrong?
> > 
> > As Henning already said, Codec Engine only builds and works with binutils 2.18 
> > (which IS Angstrom's default, btw) on TI OMAP3/DaVinci processors.
> 
> Hm,
> 
> that is not 100% correct, but at the moment I dont have the time to make the patches for oe.

Until you have patches to fix the situation, I say it's 100% correct :) :)

-- 
Denys


