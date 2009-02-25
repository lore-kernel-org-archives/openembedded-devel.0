Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LcSr8-0003Nz-0v
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 00:08:06 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFN000JX9F0QZSZ@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	25 Feb 2009 17:04:13 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3DAE06B83A8; Wed,
	25 Feb 2009 18:04:12 -0500 (EST)
Date: Wed, 25 Feb 2009 18:04:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090225230412.GA25783@denix.org>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda> <49A4203E.3060202@balister.org>
	<59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
	<1235514594.4890.525.camel@lenovo.internal.reciva.com>
	<1235552980.5399.10.camel@dax.rpnet.com>
MIME-version: 1.0
In-reply-to: <1235552980.5399.10.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: checksums situation
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
X-List-Received-Date: Wed, 25 Feb 2009 23:08:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 25, 2009 at 09:09:40AM +0000, Richard Purdie wrote:
> On Tue, 2009-02-24 at 22:29 +0000, Phil Blundell wrote:
> > I think Tom Rini's point, which is a good one, was that the existing
> > checksums.ini workflow doesn't actually do anything to protect against
> > those threats, since there isn't any validation of the checksum against
> > an authoritative source.  Right now, the checksum that you get in
> > checksums.ini is just what was computed by the first person to build the
> > corresponding .bb file: if the file had been compromised before that, we
> > would never know.
> > 
> > Even in the case where the upstream tarball changes unexpectedly, I
> > wouldn't be at all surprised if some or other developer just decided
> > that the checksums.ini entry was wrong and quietly checked in a
> > "correction" for it.  So I tend to agree with Tom, the checksums in
> > their current form do not really buy much.
> 
> I think checksums.ini even in its current form is useful. If the
> checksum matches it tells us that your build configuration at least
> matches the configuration the original recipe submitter had. It also
> spots corrupted downloads and cases where upstream changes and we have
> seen those cases. People shouldn't be silently checking in those changes
> and if they do, would most likely get spotted by people with the old
> version in DL_DIR.
> 
> So to say it does buy much isn't really fair although I agree if you
> want verification of the sources at every level, its not good enough. If
> we want to do better, all it takes is someone to do the work. We could
> have a "verified-checksums.ini" file with some policy attached to it
> which is used instead of or supplements checksums.ini...
> 
> For overlays, I'd suggest just scanning the overlay directories (BBPATH)
> for more checksum.ini files like we do with conf/class files...

Richard,

I'm not in the position to explain how Bitbake works to the Bitbake's core 
developer and maintainer. :) So, below is just my understanding of how it 
works.

So, for overlays it currently works the same way for checksums.ini as it does 
for conf/class files - it uses only one instance of a file with the same name, 
depending on the priority either from overlay or from upstream org.oe.dev. In 
other words - if my overlay has a higher priority, it would use my 
checksums.ini INSTEAD of the upstream one in org.oe.dev. Same with conf/class 
files - if I have a copy of base.bbclass in my overlay, it REPLACES the one 
from upstream org.oe.dev...

Are you suggesting to simply combine checksums.ini files from overlay and 
org.oe.dev? That may work as long as duplicates are handled properly - I guess 
they can be overwritten based on the priorities - i.e. the entry with higher 
priority would replace the duplicate one. But it is not the way it works now. 
And this will definitely not work for conf/class files...

Or maybe I'm just completely missing your point.

-- 
Denys


