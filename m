Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MdXfH-0001AG-SR
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 01:00:28 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KOL003D6GFF8WL6@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	18 Aug 2009 17:42:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6689314AF5F; Tue,
	18 Aug 2009 18:42:51 -0400 (EDT)
Date: Tue, 18 Aug 2009 18:42:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090818224251.GA26195@denix.org>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
	<1250612879.6785.12.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
	<1250620212.6785.43.camel@conroy-linux>
	<20090818195028.GU2227@smtp.west.cox.net>
	<1250626236.6785.50.camel@conroy-linux>
	<19c1b8a90908181425jca25c63ia12b7d9a9793636f@mail.gmail.com>
	<1250631162.4215.233.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1250631162.4215.233.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: External Toolchains Re: gcc-cross-sdk (GCC 4.2.3) limits.h	woes
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
X-List-Received-Date: Tue, 18 Aug 2009 23:00:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 18, 2009 at 10:32:42PM +0100, Phil Blundell wrote:
> On Tue, 2009-08-18 at 14:25 -0700, Khem Raj wrote:
> > Do you have to use glibc built externally ? I would think that use
> > external compiler
> > and tools but build everything else that goes on target which is also libc.
> 
> I think that, for most folks, avoiding the epic glibc build process is
> probably one of the main attractions of an external toolchain.
> 
> In any case, building glibc from source wouldn't actually remove this
> problem since you would then just have the same trouble with libgcc,
> libobjc and suchlike.

Those libraries and their pkgdata have to be provided in the ipk/, pkgdata/ 
and shlibs/ directories of an external toolchain. The external-toolchain.bb 
recipe itself then copies them into the deploy directory and they are then 
used during the image generation process. I've been using it for quite some 
time and see no problems with debian naming, i.e. glibc vs. libc6. Check 
do_stage of external-toolchain.bb to see what it expects.

Please note, that meta-toolchain.bb by default produces an SDK, which can be 
used outside of OE for cross-compiling. It can also be used inside OE for 
compilation by using external-toolchain.bb, but the step which packages ipks 
and pkgdata for libc and libgcc to be installed into the filesystem, is 
missing from the meta-toolchain.bb...

BTW, I'm using external-toolchain.bb in my project for prebuilt binary 
toolchains, like CodeSourcery Lite or old MontaVista Pro. I have their 
libraries packaged into ipks for rootfs to work. One way is to extend 
external-toolchain.bb recipe to do the packaging...

-- 
Denys


