Received: from [85.37.17.114] (helo=smtp-out114.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lrgcn-00022O-3r
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2009 00:52:08 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 9 Apr 2009 00:48:57 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 9 Apr 2009 00:48:57 +0200
Received: from [192.168.1.107] ([79.17.29.155]) by FBCMCL01B02.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 9 Apr 2009 00:48:57 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <74d0deb30904060658m30f8faa0w9abc7dc6be52f91d@mail.gmail.com>
References: <1238940170.8935.87.camel@port4>
	<74d0deb30904060658m30f8faa0w9abc7dc6be52f91d@mail.gmail.com>
Date: Thu, 09 Apr 2009 00:50:03 +0200
Message-Id: <1239231003.27719.4.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 08 Apr 2009 22:48:57.0505 (UTC)
	FILETIME=[337DA110:01C9B89C]
X-SA-Exim-Connect-IP: 85.37.17.114
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Boost 1.36.0 'improvements' and wesnoth 1.6a
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
X-List-Received-Date: Wed, 08 Apr 2009 22:52:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-04-06 at 15:58 +0200, pHilipp Zabel wrote:
> On Sun, Apr 5, 2009 at 4:02 PM, GNUtoo <GNUtoo@no-log.org> wrote:
> > Hello,
> > I have:
> > *An improved but not commitable yet boost 1.36.0 recipe
> > *A wesnoth(1.6a) recipe that I'll commit when the improved boost recipe
> > hit the tree
> > What is for review here is the improved boost 1.36.0(I need it for the
> > new(as 1.6a) wesnoth recipe).
> > I send it for review because it's a dependency used by others
> > packages.(even if it's not the default I heard that this version was
> > needed for packages like GNU radio)
> >
> > The Main problem is that the *new* wesnoth recipe doesn't work on arm <
> > armv6 that lack ldrex and strex instructions...that's a boost problem.
> > I've (cross)compiled boost and wesnoth for the bug device(armv6) and it
> > cross compiled fine with minor issues such as:
> > ERROR: QA Issue: No GNU_HASH in the elf binary for each boost library
> > and:
> > NOTE: Not creating empty archive for boost-1.36.0-r5
> > NOTE: Not creating empty archive for boost-doc-1.36.0-r5
> > NOTE: Not creating empty archive for boost-locale-1.36.0-r5
> > NOTE: Not creating empty archive for boost-graph-1.36.0-r5
> > This is because in the install dir there are no doc or locales files and
> > no graph library...
> > I should fix it.
> >
> > The big problem is that I couldn't test it(my bug device had a defect
> > and will be replaced,it's replacement is coming soon)
> > But according to:
> > http://thread.gmane.org/gmane.comp.handhelds.openembedded/22228/focus=22369
> > Packages can be commited even if they are not tested(even in stable) but
> > they must compile fine...(I've tested every other package I commited but
> > here I'm in the impossibility to test it until my device arrive)
> >
> > Here the explanation of the main problem:
> > Fisrt I'd like to say that it was there before and is not specific to
> > this boost version(boost 1.36.0)...for instance it was observed on boost
> > 1.33.1 with the new wesnoth(the old compiles and runs fine)
> > The error is attached boost_error.txt
> > The Documentation is here:
> > http://gcc.gnu.org/onlinedocs/gcc-4.3.2/gcc/Atomic-Builtins.html
> > The important part is:
> > "Not all operations are supported by all target processors. If a
> > particular operation cannot be implemented on the target processor, a
> > warning will be generated and a call an external function will be
> > generated. The external function will carry the same name as the
> > builtin, with an additional suffix `_n' where n is the size of the data
> > type. "
> > So an external function must be written such as the one in the
> > arm-intrinsics.patch (attached)
> > The function written in the arm-intrinsics.patch only work for
> > architecture >= armv6
> > Question:
> > According to the manual(14128.pdf : ARM Architecture Reference Manual)
> > the ldrex and strex function are avaliable since ARMv6 and here there
> > is:
> > +#if __ARM_ARCH_7A__
> > which doesn't work for my bug device because it's an armv6 so can
> > will the fact of changing it to:
> > +#ifdef __ARM_ARCH_6J__
> > break arm > v6
> > (or is there something defined like __HAVE_LDREX__? )
> >
> > Then I tried something for not having to write the function:
> > *echo '#define BOOST_SP_USE_PTHREADS' >> ${S}/boost/config/user.hpp
> > in the recipe
> > that added it to the user.hpp file but there still was the same
> > compilation error
> > There was also -DBOOST_SP_USE_PTHREADS defined in the original recipe:
> > echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS
> > -I${includedir} linkflags -L${libdir} ;' >>
> > ${S}/tools/build/v2/user-config.jam
> >
> > none of them worked.
> >
> > Before that I was told to steal the function somewhere but I didn't find
> > it in GCC nor looked deeply at the possible licensing issues
> >
> >
> > So the last option remaining is to write this function...
> > On IRC woglinde pointed me to that article:
> > http://lwn.net/Articles/314235/
> > The interresting part is at Posted Jan 12, 2009 19:58 UTC (Mon) by
> > npitre (subscriber, #5680)
> > But there are things that I didn't understand yet(but I understood the
> > bare assembly part) such as:
> > what is r0 in:
> > subs r3, r3, r0 @ compare with oldval
> 
> That's the first argument to the function at 0xffff0fc0. The same that is
> filled with "ldr r0, [r2]" in the atomic_add macro below.
> 
> > what is #TASK_SIZE ?
> 
> I googled TASK_SIZE and found this:
> "For speed reasons, kernel is mapped in each processes memory above the
> TASK_SIZE, protected from access (requires privilege level 0 to access)."
> here: http://mail.nl.linux.org/kernelnewbies/2004-04/msg00006.html
> 
> > why is r3 assigned to 0xffff0fff in :
> > mov r3, #0xffff0fff ?
> > what is add 0xffff0fc0 - 0xffff0fff in :
> > add pc, r3, #(0xffff0fc0 - 0xffff0fff)
> 
> Those two together have the same effect as "mov pc, =0xffff0fc0".
> ARM can't do "mov pc, #0xffff0fc0" directly, I guess this is the
> fastest possible way to achieve the above.
> 
> > So I won't use,modify and commit what I dont' understand...it could have
> > disastrous results...who knows...
> >
> > PS: I've a stupid question:
> > what's the simpliest way to put a default preference = "-1" only to
> > certain arm arch such as:
> > armv4 armv4t armv5te
> > DEFAULT_PREFERENCE_armv4 = "-1"
> > DEFAULT_PREFERENCE_armv4t = "-1"
> > DEFAULT_PREFERENCE_armv5te = "-1"
> > ?
> >
> > I'll attach the git diff
> >
> > Denis.
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> 
> cheers
> Philipp

thanks a lot!!! as usual I read(the lwn article) too quickly even if I
read it several times...
I understand now...
Wesnoth now compiles fine(I've written the input/output and clobber list
but I had issue...someone helped me debug this...it was very tricky...)
I now have a segmentation fault at runtime...
gdb has a bug so I am using gdbserver+gdb
I'm now (cross)compiling boost with debug inside it(and recompiling
wesnoth)
Denis.



