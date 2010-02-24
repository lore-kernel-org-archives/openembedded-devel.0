Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NkQMG-0002tL-HM
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 00:09:33 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYD00L4QC6TB161@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Feb 2010 17:06:35 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 80FBC14AF60; Wed,
	24 Feb 2010 18:06:29 -0500 (EST)
Date: Wed, 24 Feb 2010 18:06:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100224230629.GA8672@denix.org>
References: <1267044772-10182-1-git-send-email-denis@denix.org>
	<1267045217.5437.326.camel@lenovo.internal.reciva.com>
	<6ec4247d1002241348i6dd2db32ifb3f9482287d91bd@mail.gmail.com>
	<1267048766.5437.330.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1267048766.5437.330.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rootfs_ipk.bbclass: fix BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 24 Feb 2010 23:09:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 24, 2010 at 09:59:26PM +0000, Phil Blundell wrote:
> On Thu, 2010-02-25 at 08:18 +1030, Graham Gower wrote:
> > This is an unintended side effect of other changes, however I'm not
> > sure that I consider it inappropriate behaviour. That status does
> > apply to a particular package version, does it not?
> 
> No, the SW_xx flags should apply to any version and architecture rather
> than being nailed down to a specific tuple.  Otherwise, these flags
> would be subverted as soon as a new version appears in the feed.

The thing is, those SW_xx flags are not preserved anyway - the status file is 
primed with BAD_RECOMMENDATIONS (Status: deinstall), but later gets 
overwritten by the list of only installed packages. Of course, "deinstall" 
packages are being skipped, but they are not preserved in the status file for 
later use...

But, on the other hand, if there are multiple versions of the package present 
in the deploy/feed, then it will, probably, deinstall one version and install 
another one, which is not the correct behavior.

-- 
Denys


