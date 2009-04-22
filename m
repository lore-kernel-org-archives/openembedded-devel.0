Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LwTBH-0003W0-JM
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 05:31:27 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIH00I71G8EL3G1@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Apr 2009 22:26:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8A1CE6B83A8; Tue,
	21 Apr 2009 23:26:38 -0400 (EDT)
Date: Tue, 21 Apr 2009 23:26:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090422032638.GA11408@denix.org>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<20090421204132.GL17629@smtp.west.cox.net> <gslcfj$t2k$1@ger.gmane.org>
	<20090421213731.GN17629@smtp.west.cox.net>
	<20090421215519.GO17629@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090421215519.GO17629@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Wed, 22 Apr 2009 03:31:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 21, 2009 at 02:55:19PM -0700, Tom Rini wrote:
> On Tue, Apr 21, 2009 at 02:37:31PM -0700, Tom Rini wrote:
> > On Tue, Apr 21, 2009 at 11:05:55PM +0200, Koen Kooi wrote:
> > > On 21-04-09 22:41, Tom Rini wrote:
> > >> On Mon, Mar 30, 2009 at 11:59:57AM +0400, Roman I Khimov wrote:
> > >>
> > >>> Places do_rootfs function before do_install in image creation process.
> > >>>
> > >>> This change allows multiimage builds, when one image depends on another (before
> > >>> that second image creation raced with do_rootfs for the first one) and uses
> > >>> it for some purpose.
> > >>>
> > >>> Multiimage builds are useful in situations like creating an installer image
> > >>> with initramfs (built in OE) and an image of the target FS (also built in OE)
> > >>> or for building virtualized system images to be placed on target FS.
> > >>
> > >> So, the problem we have happen is that opkg (or dpkg or ...) gets into a
> > >> race because>1 image are trying to muck around in ${TMPDIR}/rootfs,
> > >
> > > No, there's a lockfile for that, otherwise 'bitbake foo-image bar-image'  
> > > wouldn't work (it didn't for a long time).
> > 
> > My snapshot is slighlty stale, but with BB_NUMBER_THREADS >1 it doesn't.
> > Lemme go fire up a build real quick in my current checkout tho..
> 
> OK, old snapshot on my end then.

Not sure how old your snapshot should be for it not to work - multiple images 
on a single bitbake command line worked for a very long time...

-- 
Denys


