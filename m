Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LRvD5-0004mi-74
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 22:11:05 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KE500HDBEGYOIN5@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	27 Jan 2009 15:03:04 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 00B456B83B5; Tue,
	27 Jan 2009 16:02:57 -0500 (EST)
Date: Tue, 27 Jan 2009 16:02:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <f20732e90901271019s6f2fa8abvc596f72091decdef@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090127210257.GA31920@denix.org>
MIME-version: 1.0
References: <5899DAF1-278D-43D5-8C90-BECD7FC3E4B5@beagleboard.org>
	<f20732e90901270708t65dc4a67jfe0829bb6ca4c540@mail.gmail.com>
	<B1B8AC48-51AB-435E-A431-AC1494B171DA@beagleboard.org>
	<670B7A54-3C74-42FD-A6F8-DAAFD4AEC73A@beagleboard.org>
	<A69FA2915331DC488A831521EAE36FE4012470D042@dlee06.ent.ti.com>
	<f20732e90901271019s6f2fa8abvc596f72091decdef@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: beagleboard@googlegroups.com
Subject: Re: [beagleboard] Re: Beagle actions for Rev C validation	software image
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
X-List-Received-Date: Tue, 27 Jan 2009 21:11:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 27, 2009 at 12:19:36PM -0600, Jason Kridner wrote:
> Adding oe-dev mailing list...
> 
> On Tue, Jan 27, 2009 at 12:10 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> >
> >>> It's a bit sad that we're going to miss out on NEON and vo_omapfb by
> >>> going armv5te :(
> >
> >> Koen,
> >
> >> I am rebuilding 'mplayer' now with 'MACHINE=beagleboard bitbake mplayer', 
> >> so that concern should go away.  It shouldn't matter much about this 
> >> mplayer, since it should only be used to test the hardware.
> >
> >> Can you consider inclusion of:
> >
> >> mplayer and FFmpeg dependency changes:
> >> http://www.beagleboard.org/gitweb/?p=arago-oe.git;a=commitdiff_plain;h=0b53219005c8daa95bcff40742d7c807bda17eca
> >
> > Hmm, I like these curl-inspired *_FEATURES handlers. The only problem with 
> > those is they won't trigger automatic rebuild when the featureset in the 
> > variable changes - don't forget to run bitbake -c rebuild manually...
> 
> Can I get a few comments on [1]?  I found there is also a dependency
> in libtheora on x11 that doesn't seem necessary.  I find this very
> useful to avoid making a new recipe.  Anyone have ideas to address
> Denys' concern about needing to issue 'bitbake -c rebuild'?
> 
> [1] http://www.beagleboard.org/gitweb/?p=arago-oe.git;a=commitdiff_plain;h=0b53219005c8daa95bcff40742d7c807bda17eca

For some reason Koen's reply never made it to the oe-dev list... Sorry for 
copying it here to continue the discussion.

Koen said:
> I'm against adding such 'USE flags' to OE, they basically make QA impossible. 
> If people want a different mplayer, they are free to make an 'mplayer-nox' or 
> 'mplayer-nosdl' recipe to fill their needs.

But on the other hand it would make overlays, such as Arago, as well as OE 
itself, much cleaner and reduce the recipe creep.

As of the rebuild issue when featureset in the variable changes, I was 
thinking about storing a hash of variable's value, in addition to the 
standard version and revision numbers, should trigger an automatic rebuild. 
Similar to bumping up a PR, but without modifying the recipe. Any thoughts?

-- 
Denys


