Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LOPMP-0001pj-TT
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 05:34:10 +0100
Received: from gandalf.denix.org ([71.255.246.155])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0KDN0014CGDGEKP3@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	17 Jan 2009 22:27:16 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DEEC06B83B5; Sat,
	17 Jan 2009 23:27:15 -0500 (EST)
Date: Sat, 17 Jan 2009 23:27:15 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20090116230858.GQ6710@smtp.west.cox.net>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090118042715.GB852@denix.org>
MIME-version: 1.0
References: <20090111152021.47737188463@amethyst.openembedded.net>
	<20090111170659.GC17627@excalibur.local> <gkdanl$3ht$1@ger.gmane.org>
	<20090111175759.GE17627@excalibur.local>
	<20090111180741.GF17627@excalibur.local>
	<20090116202514.GA24280@denix.org>
	<gkqrif$bjr$1@ger.gmane.org> <20090116205723.GB24280@denix.org>
	<20090116210120.GC24280@denix.org>
	<20090116230858.GQ6710@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Koen Kooi : mtd-utils: add 1.2.0+git for ubifs-support
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
X-List-Received-Date: Sun, 18 Jan 2009 04:34:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 16, 2009 at 04:08:59PM -0700, Tom Rini wrote:
> On Fri, Jan 16, 2009 at 04:01:20PM -0500, Denys Dmytriyenko wrote:
> > On Fri, Jan 16, 2009 at 03:57:23PM -0500, Denys Dmytriyenko wrote:
> > > On Fri, Jan 16, 2009 at 09:43:59PM +0100, Koen Kooi wrote:
> [snip]
> > > > The gettext thing has been fixed for a few days now.
> > > 
> > > Only gettext-native was fixed.
> > 
> > I meant e2fsprogs-libs-native was fixed... e2fsprogs-libs was not.
> 
> True enough, but this is probably only one of many things needing fixing
> for multi-threaded bitbake, which is something else on my long-term
> list.  I didn't fix the target one for, well, no real good reason I
> suppose, sorry.  I'll poke it in later if someone doesn't beat me to it.

It was a real good reason for me, as it was breaking my build :)
But you are correct - I do use multi-threaded bitbake...
And I did beat you to it - 1556c15f8aa75c0377ad9b4188276c68b2289e10
Thanks anyway.

-- 
Denys


