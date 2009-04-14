Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lto2t-0003gO-S0
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 21:11:53 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI3001GPUGUKNK2@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 14:07:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6D60B6B83A8; Tue,
	14 Apr 2009 15:07:42 -0400 (EDT)
Date: Tue, 14 Apr 2009 15:07:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414190742.GD28306@denix.org>
References: <20090414050720.GA22247@denix.org> <49E4303C.10600@xora.org.uk>
	<20090414161157.GB28306@denix.org>
MIME-version: 1.0
In-reply-to: <20090414161157.GB28306@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: e2fsprogs is broken in configure/autoreconf
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
X-List-Received-Date: Tue, 14 Apr 2009 19:11:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 14, 2009 at 12:11:57PM -0400, Denys Dmytriyenko wrote:
> On Tue, Apr 14, 2009 at 07:42:04AM +0100, Graeme Gregory wrote:
> > Denys Dmytriyenko wrote:
> > > Hi,
> > >
> > > XorA's commit[1] seems to break e2fsprogs for me (omap3evm/davinci), not fix. 
> > > I know, it's not a bug, it's a feature! :) All I know it used to work and it's 
> > > too late now for me to debug it...
> > >
> > > Anyway, the logs are at [2] and [3]. Thanks!
> > >
> > > http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=d187eec071bb0afe8bda13cbf7b89170fe99e384
> > > http://tinderbox.openembedded.net/packages/477200/
> > > http://tinderbox.openembedded.net/public/logs/4350191.txt
> > >
> > >   
> > Interesting, but that log isnt an omap log. Looks to me like an
> > incomplete tmp/ directory for armv5te.
> 
> It is an omap, don't worry. It's just not called such :) Or, you can think 
> about as a generic armv5te machine...
> 
> Anyway, that was a clean build - removing tmp and deploy directory. I'll check 
> if there any configuration issues.

Ah, it now depends on gettext-native, fixed.

-- 
Denys


