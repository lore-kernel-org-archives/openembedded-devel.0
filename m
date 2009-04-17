Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuuQI-0004zn-5I
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 22:13:24 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090417200823.WSPV22254.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>;
	Fri, 17 Apr 2009 16:08:23 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id gk8P1b0084dMFYL04k8PJo; Fri, 17 Apr 2009 16:08:24 -0400
X-Authority-Analysis: v=1.0 c=1 a=Q7dqUReUBcIA:10 a=s9zPVp_aTL4A:10
	a=afG3kJigFXgW_zzbL_kA:9 a=1GZs-23QQdSAPLqP9RUA:7
	a=89uyL_cgGD5pKjbWoMir8ypxezQA:4
X-CM-Score: 0.00
Date: Fri, 17 Apr 2009 13:08:23 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: David Huggins-Daines <dhuggins@cs.cmu.edu>
Message-ID: <20090417200823.GV17629@smtp.west.cox.net>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
	<1239912183-25085-2-git-send-email-dhuggins@cs.cmu.edu>
	<20090416205436.GL17629@smtp.west.cox.net>
	<49E79C40.1050801@cs.cmu.edu>
	<20090416213144.GN17629@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090416213144.GN17629@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] fix do_install for MinGW gcc-canadian-sdk
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
X-List-Received-Date: Fri, 17 Apr 2009 20:19:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 02:31:44PM -0700, Tom Rini wrote:
> On Thu, Apr 16, 2009 at 04:59:44PM -0400, David Huggins-Daines wrote:
> > Tom Rini wrote:
> >>
> >> Is this using the distro / machine you mentioned before?  This should
> >> all be fine and we just end up making a 'C:' dir.  I'm very curious here
> >> as at some point prior to pushing canadian stuff originally I had the
> >> same patch, but on trying to confirm I needed it, I suddenly didn't need
> >> it anymore.
> >>
> >>   
> > Yeah - I can send you the distro, machine, and local.conf if you like,  
> > or publish my git repository. I am using these extra definitions in  
> > local.conf for building the MinGW SDK:
> >
> > SDK_ARCH = "i686"
> > SDK_OS = "mingw32"
> > SDK_EXEEXT = ".exe"
> > OVERRIDES .= ":sdk-mingw32"
> 
> Looks fine except for the OVERRIDES.  I don't use any special ones, so
> you shouldn't need any either :)  (But yes, there are bits of code that
> reference sdk-mingw32 and need fixing).

In fact, the OVERRIDES is causing the problem.  In stable there's still
some sdk-mingw32 overrides which aren't right, but I didn't notice they
needed fixing (removing usually) as I wasn't adding any additional
overrides since back when RP asked me to drop that (which explains why I
needed your patch at some point, then no longer did).  There's a few of
these left in .dev still, which I'm removing and doing a test build of
now.  Once this is done, I think Canadian stuff will be in good enough
shape that I'll get a series together for stable/2009.

-- 
Tom Rini


