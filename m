Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LppCF-0008UX-4r
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 21:37:02 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090403193421.YCMB4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Apr 2009 15:34:21 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id b7aL1b0014dMFYL047aLNp; Fri, 03 Apr 2009 15:34:20 -0400
X-Authority-Analysis: v=1.0 c=1 a=jdP34snFAAAA:8 a=Zq0JP12G8bVblQtA4GYA:9
	a=RbxVt1VuiVg_xithi0YA:7 a=qNISEVTbWeDSbJZMB7Lvi2ozwW0A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 3 Apr 2009 12:34:19 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090403193419.GF30840@smtp.west.cox.net>
References: <20090403175901.GA11095@smtp.west.cox.net>
	<20090403191733.GC29161@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090403191733.GC29161@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.43
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-kernel-3.3.4
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
X-List-Received-Date: Fri, 03 Apr 2009 19:37:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2009 at 12:17:33PM -0700, Khem Raj wrote:
> On (03/04/09 10:59), Tom Rini wrote:
> > On Wed, Apr 01, 2009 at 09:48:56AM -0000, =?utf-8?b?SsO2cmcgQmFra2VyIDxqb2VyZ0BoYWtrZXIuZGU+?= wrote:
> > 
> > > Yes, you're right. Changed patch is attached.
> > [snip]
> > > diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb
> > > --- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 10:44:02.000000000 +0100
> > > +++ build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 17:39:11.000000000 +0100
> > > @@ -1,2 +1,3 @@
> > >  require gcc-cross-initial_${PV}.bb
> > >  require gcc-cross-kernel.inc
> > > +SRC_URI_append = "file://gcc334-collect2_file_open_args.patch;patch=1"
> > 
> > Grabbed this as mbox from patchwork, so I hope this gets followed-up
> > right.  The patch is good, but we should be doing this for all 3.3.4's
> > we have left.  I'll take care of that and push shortly.  Thanks.
> 
> I have a slightly different opinion. This only solves one problem which
> is due to FORTIFY_SOURCES on ubuntu native gcc. On newer host distributions (with
> gcc 4.x). When we chose a OE distro (target) which uses old compilers (
> 3.4 or below) we end up compiling the cross compilers with relatively
> newer compiler which may have problems. Same could be true for other
> host utilities which are old. 
> 
> I think best solution is to build a native compiler from the same
> version first. Now it will add to compilation time but
> then we can have ASSUME_PROVIDED.

Note that there's also a few other problems needing to be patched, at
least on Ubuntu 8.10, to start with, needing
https://dev.openwrt.org/browser/trunk/toolchain/gcc/patches/3.4.6/820-i386_inhibit_libc.patch?rev=14370
and I'm trying to nail down a glibc that builds with all of this as
well (2.2.5 had some problem for DISTRO=angstrom-2008.1 MACHINE=epia).
All in all, I'm about to give up on 3.* (I was building for some SDK
patches I'm going to post shortly, need to get back to testing that
stuff..)

-- 
Tom Rini


