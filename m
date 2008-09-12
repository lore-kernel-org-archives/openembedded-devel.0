Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KdxtZ-0005aT-5l
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 03:56:25 +0200
Received: from gandalf.denix.org ([71.255.232.65]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K72004TV7WWREX3@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	11 Sep 2008 20:53:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7B4226B8008; Thu,
	11 Sep 2008 21:53:20 -0400 (EDT)
Date: Thu, 11 Sep 2008 21:53:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20080912000208.GA12469@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080912015320.GB17523@denix.org>
MIME-version: 1.0
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Fri, 12 Sep 2008 01:56:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

First of all, thanks for your review.

On Thu, Sep 11, 2008 at 05:02:08PM -0700, Khem Raj wrote:
> On (11/09/08 15:52), Denys Dmytriyenko wrote:
> > 
> > #1 gcc-cross-sdk 4.3.1 missing include-fixed
> > http://bugs.openembedded.net/show_bug.cgi?id=4536
> > 
> > gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
> > which are missing in the gcc-cross-sdk version, rendering external toolchain
> > unusable.
> 
> I do not like this fix. IMO Instead of copying them into include directory 
> they should be let alone in include-fixed directory and packaged. You should 
> add knowledge of this new directory to the failing package instead. What 
> packages are broken because of this.

I agree that this is not a proper fix, but rather a hack. glibc has its own 
limits.h, which wants to include gcc's limits.h like this:

 /* Get the compiler's limits.h, which defines almost all the ISO constants.
    We put this #include_next outside the double inclusion check because
    it should be possible to include this file more than once and still get
    the definitions from gcc's header.  */
#if defined __GNUC__ && !defined _GCC_LIMITS_H_
/* `_GCC_LIMITS_H_' is what GCC's file defines.  */
# include_next <limits.h>
#endif

This issue was brought up before, but as far as I can tell, it wasn't fixed 
properly.
This is initial Koen's post about the issue:
http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
And here is your own reply with one of the possible solutions:
http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html

Here is how it's "solved" (i.e. worked around) in gcc-cross_4.3.1.bb (4.3.2):

# Hack till we fix *libc properly
do_stage_append() {
        ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
}

I'd love to see it fixed properly, but for now I'm trying to bring 
gcc-cross-sdk on par with gcc-cross.

> > Provided patch copies them in the include directory as a temporary solution.
> > A similar temporary solution is present in gcc-cross_4.3.1, see
> > do_stage_append()
> > 
> > 
> > #2 external-toolchain misses providing runtime libgcc
> > http://bugs.openembedded.net/show_bug.cgi?id=4542
> > 
> > Since external-toolchain misses specifying libgcc as provided runtime library,
> > dependency tree picks up either gcc-cross or even gcc-noemu...
> 
> This one seems ok to me. 

Thanks! Whom should I ping to get it commited?

-- 
Denys


