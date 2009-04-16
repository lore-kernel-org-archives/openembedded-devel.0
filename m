Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LuFBz-00031g-F7
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 02:11:57 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI600HNX2ZAYCT6@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	15 Apr 2009 19:06:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 15D926B83C6; Wed,
	15 Apr 2009 20:06:46 -0400 (EDT)
Date: Wed, 15 Apr 2009 20:06:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090416000646.GB2118@denix.org>
References: <20090414234609.GA27890@denix.org>
	<1239752998-7677-1-git-send-email-denis@denix.org>
	<gs3vuj$8tl$1@ger.gmane.org>
	<200904150854.04328.hs4233@mail.mn-solutions.de>
MIME-version: 1.0
In-reply-to: <200904150854.04328.hs4233@mail.mn-solutions.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel	change or its bootargs/cmdline
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
X-List-Received-Date: Thu, 16 Apr 2009 00:12:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 15, 2009 at 08:54:04AM +0200, Holger Schurig wrote:
> > On 15-04-09 01:49, Denys Dmytriyenko wrote:
> > > +			mv /tmp/uname /etc/uname
> > > +			mv /tmp/cmdline /etc/cmdline
> >
> > I think we should put those in /etc/udev or /var/lib/udev if
> > udev will be the only consumer.
> 
> +1, e.g.
> 
> /etc/udev/saved.uname
> /etc/udev/saved.cmdline

Good point, I'll be sending the update. Are there any other 
comments/suggestions?

-- 
Denys


