Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuVBj-0005u2-UG
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 19:15:50 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090416171152.RDHZ6112.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>;
	Thu, 16 Apr 2009 13:11:52 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id gHBq1b00P4dMFYL03HBr4J; Thu, 16 Apr 2009 13:11:51 -0400
X-Authority-Analysis: v=1.0 c=1 a=tid_rkRsmLIA:10 a=mbpeHvT-P2EA:10
	a=TEVjTEG01Anbt09_RzwA:9 a=PdFsQpZHt2czLae4p5cA:7
	a=oNZ1DyEISIDEJXk-Io6qdC6OD-0A:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 10:11:50 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: David Huggins-Daines <dhuggins@cs.cmu.edu>
Message-ID: <20090416171150.GI17629@smtp.west.cox.net>
References: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090416162942.GF17629@smtp.west.cox.net>
	<49E76412.50807@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <49E76412.50807@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.44
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Supply uclibc-thread-db package expected by	task-sdk-base
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
X-List-Received-Date: Thu, 16 Apr 2009 17:15:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 01:00:02PM -0400, David Huggins-Daines wrote:
> Tom Rini wrote:
> > On Tue, Apr 14, 2009 at 04:05:18PM -0400, David Huggins-Daines wrote:
> >
> >   
> >> Currently, building task-sdk-base (and by extension meta-toolchain) fails
> >> for uclibc targets.  This is because task-sdk-base depends on the thread
> >> debugging library uclibc-thread-db, but this is not built by the uclibc
> >> recipe unless PTHREADS_DEBUG_SUPPORT is enabled.  In addition, once it is
> >> built, if you are using Debian version numbers, it will be helpfully
> >> renamed to "libthread-db1" and the build will still fail.
> >>
> >>     
> As pointed out earlier on this thread (and verified - there was some
> confusion on my part since I didn't fully clean before rebuilding), the
> library renaming itself doesn't cause any problems.  The only actual
> problem is the lack of PTHREADS_DEBUG_SUPPORT.
> > That's interesting as when I pushed these changes I did test with a
> > uclibc target too.  What DISTRO/MACHINE are you using?
> >   
> I have a custom distro and machine, but broadly speaking it is
> minimal-uclibc and ep93xx...

OK, that's what I was wondering.  Khem, do we think
PTHREADS_DEBUG_SUPPORT should get enabled globally?  If so, then we
should go and audit all of the distro uClibc.distro files and get this
fixed for everybody.  Thanks.

-- 
Tom Rini


