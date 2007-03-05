Received: from [213.95.27.120] (helo=ganesha.gnumonks.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <laforge@openmoko.org>) id 1HOFsY-0004DY-QQ
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 17:17:38 +0100
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.50)
	id 1HOFsY-00076e-Da
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 17:17:38 +0100
Received: from laforge by prithivi.gnumonks.org with local (Exim 3.36 #1)
	id 1HOFo3-0007s6-00; Mon, 05 Mar 2007 17:12:59 +0100
Date: Mon, 5 Mar 2007 17:12:59 +0100
From: Harald Welte <laforge@openmoko.org>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20070305161259.GK25845@prithivi.gnumonks.org>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
	<45EBF776.3090505@dominion.kabel.utwente.nl>
	<1173104599.5842.62.camel@localhost.localdomain>
	<20070305143506.GF25845@prithivi.gnumonks.org>
	<1173109595.5842.88.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1173109595.5842.88.camel@localhost.localdomain>
User-Agent: Mutt/1.5.13 (2006-08-11)
Cc: openembedded-devel@openembedded.org, distro-devel@lists.openmoko.org
Subject: Re: Merging openmoko into OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2007 16:17:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 05, 2007 at 03:46:35PM +0000, Richard Purdie wrote:

> Mickey mentioned something very briefly about a problem but he was in a
> hurry and I'd actually misunderstood the problem looking at this :/. I
> also thought he'd found a solution that worked for now meaning more time
> could be spent solving it properly.

the interim solution was to rebuild everything all the time (srcdate in
PR), but that's no longer acceptable now.

> In future, please do send a mail to the bitbake development list if
> there are problems like this.  

'k

> Even if you don't switch to using 1.8.x, it would be good if you did
> have time to test it and let us known what (if any :) issues you have
> with it. I'm about to send something to the lists requesting testing
> before we release 1.8.0.

i'll see if I can find somebody 'qualified' to do that :)

> > > > Holger and I discussed something like that for the packaged-staging project, but we didn't
> > > > come up with a clean way to present it to the user. That was last year, and I'm sure
> > > > others can come up with something.
> > > 
> > > This needs packaged staging which is quite an effort. Please do discuss
> > > this before implementation as we've tried things before and know roughly
> > > how this can work.
> > 
> > ok, will do.  this is less important at the moment.
> 
> This is a long term project aim for OpenEmbedded (and me personally)
> since it doesn't just solve this problem but solves a number of others
> too. It would be great to see it developed.

well, what I actaully would love to see is native host distro rpm/dpkg
file creation for at least the toolchain, but in the end acutally also
the staging, yes.

Another issue that we're running into is this inevitable
rebuild-everything-from-scratch when you just want to temporarily test
something.  There should be an easy way to keep all native packages,
toolchain, etc. and only rebuild everything for the target, i.e. start
again with bootloader/kernel/glibc/... for arm in our case.

> > If there are existing plans/ideas in this area, or somebody with some
> > ipkg background has a good proposal and wants to implement it as paid
> > contractor, this would be the time to talk about it.
> 
> I think lots of people, me included have looked at the ipkg code and
> wanted to see it rewritten with something like a sqlite backend rather
> than parsing its ascii files all the time.

So did anyone make actual plans on how to go about this?  

Or alternatively: Is there somebody who would be available on short
notice and interested in implementign such a backend as a paid contract
job?  Please step up now :)

-- 
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
============================================================================
Software for the world's first truly open Free Software mobile phone


