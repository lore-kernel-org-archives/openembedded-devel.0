Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M1qoZ-0001uo-J8
	for openembedded-devel@openembedded.org; Thu, 07 May 2009 01:46:15 +0200
Received: (qmail 13589 invoked from network); 6 May 2009 23:40:12 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 6 May 2009 16:40:12 -0700
Date: Wed, 6 May 2009 16:40:11 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090506234010.GS7973@smtp.west.cox.net>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
	<20090506223838.GA15339@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090506223838.GA15339@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be overridden using	GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Wed, 06 May 2009 23:46:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2009 at 06:38:38PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 06, 2009 at 03:55:57PM -0400, Michael Smith wrote:
> > If GRUB_CONFIG_PACKAGE is set, don't ship menu.lst with grub. Instead,
> > RRECOMMEND the config package. This allows overlays to override menu.lst
> > in a separate package, rather than copying the whole grub package into
> > the overlay.
> 
> It was discussed many times here - no USE flags in OE. You'll end up with 2 
> grub packages of the same name but with different contents - with menu.lst 
> and without.
> One of the recent discussions on this topic:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/22715/focus=22731

I need to find time to argue for USE flags sometime.  In short 'tho, you
only end up with 2 grub packages that differ if, well, you want them to.
Distros (Angstrom) that let people install stuff on the system from
feeds should do something like:
### DO NOT CHANGE ANY OF THE FOLLOWING IF YOU INTEND TO PUBLISH YOUR
### PACKAGES.  DOING SO WILL BREAK PEOPLE.
USE_FLAG_1 := ...
USE_FLAG_2 := ...

And distros that really want to USE (or not USE) something can set them
differently, and we don't end up with N permutations of recipes that
people have to mind when fixing things nor forking for their own use the
recipes and stripping things out.  It's really two sides of the same
coin.

> One way to solve it would be to always have menu.lst as a separate package and 
> then replace it with your own from the overlay.
> 
> >  SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \

Unrelated, this should be ${GNU_MIRROR}/grub/grub-${PV}.tar.gz

-- 
Tom Rini


