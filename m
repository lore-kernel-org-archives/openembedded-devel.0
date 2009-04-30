Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LzZ4b-0005DZ-Vr
	for openembedded-devel@openembedded.org; Thu, 30 Apr 2009 18:25:22 +0200
Received: (qmail 14412 invoked from network); 30 Apr 2009 16:19:58 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 Apr 2009 09:19:58 -0700
Date: Thu, 30 Apr 2009 09:19:57 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090430161957.GA20619@smtp.west.cox.net>
References: <1240945982.12505.23.camel@utx.utx.cz>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7A7@hiob.intern.dresearch.de>
	<49F8463B.7040102@balister.org>
	<20090429141544.GZ18788@smtp.west.cox.net>
	<1241022375.4064.21.camel@hammer.suse.cz>
	<20090429164500.GE18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090429164500.GE18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] gcc_4.2.4.bb: QA Issue: No GNU_HASH in theelf	binary
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
X-List-Received-Date: Thu, 30 Apr 2009 16:25:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2009 at 09:45:00AM -0700, Tom Rini wrote:
> On Wed, Apr 29, 2009 at 06:26:15PM +0200, Stanislav Brabec wrote:
> > Tom Rini wrote: 
> > > On Wed, Apr 29, 2009 at 08:21:15AM -0400, Philip Balister wrote:
> > > > Sledz, Steffen wrote:
> > 
> > > >> Fix works for me. But it would be nice if some members of the core team could ack it.
> > > >
> > > > Does anyone see any downside for this patch? Have other people tested  
> > > > it? I hate blind acking things.
> > > 
> > > Khem has a patch for this issue too but wants to test it more.
> > 
> > I just tested another way to fix. It looks like a gcc bug - LDFLAGS nor
> > LDFLAGS_FOR_TARGET are not used in gcc/Makefile.
> > 
> > diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
> > index e88cee5..9ede6a2 100644
> > --- a/recipes/gcc/gcc-configure-common.inc
> > +++ b/recipes/gcc/gcc-configure-common.inc
> > @@ -73,7 +73,18 @@ do_configure () {
> >  	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
> >  	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
> >  	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
> >  	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
> > +	sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.in ${S}/Makefile.tpl
> >  	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
> >  
> >  	# splice our idea of where the headers live into gcc's world
> > 
> > 
> > My previous patch built the whole feed. But I did not test it with
> > canadian recipes.
> 
> I'll pull this in locally, and build everything today.  Just need to
> have the buildbot finish the failure on everything first.

OK, tested everything that was building and made some of the older stuff
build, or at least be a bit closer to building.

-- 
Tom Rini


