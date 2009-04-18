Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>)
	id 1LvFwb-0007Io-JM; Sat, 18 Apr 2009 21:11:17 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090418190707.UZQ15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>;
	Sat, 18 Apr 2009 15:07:07 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id h7771b0014dMFYL04777Pk; Sat, 18 Apr 2009 15:07:07 -0400
X-Authority-Analysis: v=1.0 c=1 a=tMTI6gMU-LIA:10 a=E3OW10eJljYA:10
	a=CR1jXKU5AAAA:8 a=Q4-j1AaZAAAA:8 a=0gcC27t9AAAA:8 a=4HVRqb_MAAAA:8
	a=zzvRiSgDAAAA:8 a=gGcnfxqfAAAA:8 a=22pK5S-mAAAA:8
	a=Pt0x_nSXgVdh6R_X6WEA:9
	a=hVDc5thsiZ1WK4N2pE8A:7 a=tPXtAap6Cf2weAffXjaCq5UxZycA:4
	a=mrHAsc3WxYIA:10
	a=UcWZWmDdwLsA:10 a=4KgpRpU3nOMA:10 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Sat, 18 Apr 2009 12:07:06 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090418190706.GA17629@smtp.west.cox.net>
References: <1240039366-5095-1-git-send-email-k.kooi@student.utwente.nl>
	<20090418175731.GB8535@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090418175731.GB8535@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] libelf: fix another GNU_HASH issues while	building libelf
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
X-List-Received-Date: Sat, 18 Apr 2009 19:11:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 18, 2009 at 01:57:31PM -0400, Denys Dmytriyenko wrote:
> On Sat, Apr 18, 2009 at 09:22:46AM +0200, Koen Kooi wrote:
> > From: Carsten Haitzler (Rasterman <raster@rasterman.com>
> > 
> > 
> > Signed-off-by: Koen Kooi <koen@openembedded.org>
> 
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Assuming this is in dev:
Acked-by: Tom Rini <trini@embeddedalley.com>

> > ---
> >  recipes/libelf/libelf_0.8.6.bb |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> > 
> > diff --git a/recipes/libelf/libelf_0.8.6.bb b/recipes/libelf/libelf_0.8.6.bb
> > index 4bd548e..f0903d7 100644
> > --- a/recipes/libelf/libelf_0.8.6.bb
> > +++ b/recipes/libelf/libelf_0.8.6.bb
> > @@ -2,6 +2,7 @@ DESCRIPTION = "libelf is an ELF object file access library. \
> >  The elf library provides routines to access, and manipulate, Elf object files."
> >  LICENSE = "LGPL"
> >  SECTION = "libs"
> > +PR = "r1"
> >  
> >  SRC_URI = "http://www.mr511.de/software/libelf-${PV}.tar.gz \
> >             http://www.stud.uni-hannover.de/~michael/software/libelf-${PV}.tar.gz"
> > @@ -10,6 +11,8 @@ inherit autotools
> >  
> >  PARALLEL_MAKE = ""
> >  
> > +TARGET_CC_ARCH += "${LDFLAGS}"
> > +
> >  do_configure_prepend () {
> >  	if test ! -e acinclude.m4; then
> >  		cp aclocal.m4 acinclude.m4
> > -- 
> > 1.5.6.5
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


