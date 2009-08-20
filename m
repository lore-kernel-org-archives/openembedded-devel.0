Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Me2aa-0002V9-Uh
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 10:01:41 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KOO00IG1059EF83@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Aug 2009 02:44:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5268514AF5F; Thu,
	20 Aug 2009 03:43:57 -0400 (EDT)
Date: Thu, 20 Aug 2009 03:43:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820074357.GC459@denix.org>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<200908200749.07494.holger+oe@freyther.de>
	<6ec4247d0908200032s44cd3230s9b3e0d06777116c3@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <6ec4247d0908200032s44cd3230s9b3e0d06777116c3@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf: Kill CCACHE. Implicit, automatic	use of things which can fail is bad.
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
X-List-Received-Date: Thu, 20 Aug 2009 08:01:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 20, 2009 at 05:02:31PM +0930, Graham Gower wrote:
> 2009/8/20 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> > On Thursday 20 August 2009 05:24:37 Chris Larson wrote:
> >> To re-enable, set CCACHE = "ccache ".
> >>
> >> Signed-off-by: Chris Larson <clarson@mvista.com>
> >
> > Could you elaborate on the need of that? Which platforms do you deal with that
> > break due the usage of ccache?
> 
> I run Slackware 12.2, whose build of ccache does not seem to be
> accepted. I don't recall the exact mechanism of failure, but
> shasum-native fails before getting to any other pacakges. Currently I
> have to move the ccache binary out of my $PATH or OE tries to use it.

Same exact problem has been reported many times with RedHat-based distros as 
well - it just fails to build shasum-native (the very first package) w/o any 
meaningful messages...

-- 
Denys


