Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OZSfM-0005uD-Q5
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 19:56:13 +0200
Received: from gandalf.denix.org ([unknown] [71.251.56.71])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L5M00GYO1SJWQ73@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	15 Jul 2010 12:55:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4801714AF60; Thu,
	15 Jul 2010 13:55:31 -0400 (EDT)
Date: Thu, 15 Jul 2010 13:55:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100715175531.GH12383@denix.org>
References: <4C3EA720.1080804@gmail.com>
	<201007150906.32710.marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <201007150906.32710.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Specific distro defconfig for all busybox versions
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
X-List-Received-Date: Thu, 15 Jul 2010 17:56:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jul 15, 2010 at 09:06:30AM +0200, Marcin Juszkiewicz wrote:
> Dnia czwartek, 15 lipca 2010 o 08:13:52 Dmitry Vinokurov napisa??(a):
> > Hi!
> > 
> > Is there a way to set defconfig for specific distribution that will
> > apply to all versions of busybox? Now when new busybox version appear, I
> > should move <distro_name> directory from one busybox-${PV} to another
> > and it's not very convenient. Or maybe I missed something.
> 
> place defconfig in recipes/busybox/busybox/DISTRONAME/defconfig

Or recipes/busybox/files/DISTRONAME/defconfig :)

> and learn about OVERRIDES D:

+1 :)

-- 
Denys


