Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9Sz7-0006lt-Gc
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 00:24:21 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207232029.BZKW2948.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Dec 2008 18:20:29 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id oPLT1a0061E665w04PLTWF; Sun, 07 Dec 2008 18:20:29 -0500
X-Authority-Analysis: v=1.0 c=1 a=TfYQY3VK8FCRrPcjkcsA:9
	a=-PC_RDKMoWwoTlP0BcuSUw4TcyEA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 16:20:38 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207232038.GH15204@smtp.west.cox.net>
References: <20081207001050.GA1796@gmail.com>
	<20081207005017.GK16628@smtp.west.cox.net>
	<20081207205430.GA4642@gmail.com>
	<20081207211848.GG15204@smtp.west.cox.net>
	<20081207213400.GD4642@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20081207213400.GD4642@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: mips site files update
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
X-List-Received-Date: Sun, 07 Dec 2008 23:24:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2008 at 01:34:00PM -0800, Khem Raj wrote:
> On (07/12/08 14:18), Tom Rini wrote:
> > On Sun, Dec 07, 2008 at 12:54:30PM -0800, Khem Raj wrote:
> > > On (06/12/08 17:50), Tom Rini wrote:
> > > > On Sat, Dec 06, 2008 at 04:10:50PM -0800, Khem Raj wrote:
> > > > 
> > > > > Hi 
> > > > > 
> > > > > Trying to build for mips based machines. I needed this patch to get the
> > > > > console-image building. 
> > > > > 
> > > > > OK for .dev
> > > > 
> > > > Can we please please please start splitting things up into common-linux
> > > > and common-glibc/uclibc instead?  That way we fix more than mips.
> > > 
> > > Good. I figured that I only needed this change to get it going.
> > > 
> > > Thanks
> > > -Khem
> > 
> > > diff --git a/site/common-linux b/site/common-linux
> > > index 8d915d0..17d7a8d 100644
> > > --- a/site/common-linux
> > > +++ b/site/common-linux
> > > @@ -10,3 +10,7 @@ samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILIT
> > >  # coreutils
> > >  fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
> > >  
> > > +# popt
> > > +ac_cv_va_copy=${ac_cv_va_copy=yes}
> > > +ac_cv___va_copy=${ac_cv___va_copy=yes}
> > > +
> > 
> > I've been thinking about this (but not found much time to act, sorry),
> > but we should, at least for common-linux/glibc/uclibc stop grouping by
> > package and start grouping by function.  And in this case, perhaps we
> > should do:
> 
> Configure tests may differ for same function on different packages. Its
> useful to know which package needs what defines. va_copy may be tested
> in different ways in different package's configure scripts.

True.  But we don't list every package which wants va_copy vs __va_copy,
just the first one someone hit.  IOW, it could be interesting
information, but except for packages which do MYPACKAGE_ac_cv_foofunc,
we don't know anything but the first one someone hit.  I wouldn't object
to listing the packages, but I think grouping functions together makes
more sense than grouping packages together.

> > # va_copy
> > ac_cv_va_copy=${ac_cv_va_copy=yes}
> > ac_cv___va_copy=${ac_cv___va_copy=yes}
> 
> > 
> > And similar for *{get,set}*uid* and so on.
> > 
> > In both -glibc and -uclibc, as that's a glibc feature.
> 
> Thats why a common file is preferred most of defines could be common
> for uclibc and glibc. Keeping two copies is unnessary. 

Yes, that too.

> Anyway for now I will add this to both -uclibc and -glibc files.

Thanks.

> How they should be organised logically I will leave for laters.

I'll start a thread / comment on my bug sometime tonight hopefully, but
common-libc? :)

-- 
Tom Rini


