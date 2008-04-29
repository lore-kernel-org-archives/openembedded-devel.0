Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1Jqp1g-0000W9-IQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 14:33:40 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id CAF51832CA; Tue, 29 Apr 2008 14:33:10 +0200 (CEST)
Date: Tue, 29 Apr 2008 14:33:10 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080429123310.GA30664@deadlock.dhs.org>
References: <20080428192607.GB28476@deadlock.dhs.org>
	<19c1b8a90804281454m3e3ea43fv2d84596976c0487@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90804281454m3e3ea43fv2d84596976c0487@mail.gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: problem building meta-toolchain for arm/uclibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 12:33:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Apr 28, 2008 at 02:54:34PM -0700, Khem Raj wrote:
> try running the link step alone manually

[...]

did that, -v did not tell anything that seemed useful but then I noticed
one thing:

> libgcc/./_udiv_w_sdiv_s.o libgcc/./_udivmoddi4_s.o libgcc/./bpabi_s.o
> libgcc/./unaligned-funcs_s.o libgcc/./unwind-arm_s.o
> libgcc/./libunwind_s.o libgcc/./pr-support_s.o libgcc/./unwind-c_s.o
> -lc && rm -f ./libgcc_s.so && if [ -f ./libgcc_s.so.1 ]; then mv -f
> ./libgcc_s.so.1 ./libgcc_s.so.1.backup; else true; fi && mv
> ./libgcc_s.so.1.tmp ./libgcc_s.so.1 && ln -s libgcc_s.so.1
> ./libgcc_s.so

actually, for this test, I should have stopped here:
...
> libgcc/./_udiv_w_sdiv_s.o libgcc/./_udivmoddi4_s.o libgcc/./bpabi_s.o
> libgcc/./unaligned-funcs_s.o libgcc/./unwind-arm_s.o
> libgcc/./libunwind_s.o libgcc/./pr-support_s.o libgcc/./unwind-c_s.o
> -lc

the stuff after it is just moving around and so on.

> and pass options to generate verbose output. It could be related to binutils.

And there it was staring at me: the -lc thing. When I was grepping for 
libc.so.6 in the whole work directory I found this:

binutils-2.18/build.i686-linux.arm-angstrom-linux-uclibcgnueabi/ld/earmelf_linux_eabi.c:494

  /* We issue a warning if it looks like we are including two
     different versions of the same shared library.  For example,
     there may be a problem if -lc picks up libc.so.6 but some other
     shared library has a DT_NEEDED entry of libc.so.5.  This is a
     heuristic test, and it will only work if the name looks like
     NAME.so.VERSION.  FIXME: Depending on file names is error-prone.
     If we really want to issue warnings about mixing version numbers
     of shared libraries, we need to find a better way.  */

Can this be somehow related to the issue that I am experiencing?

Btw, just for the fun of it, I tried simply removing the -lc parameter - and
then it linked without error. But then of course I am not sure if that
is correct or if by doing that I produced garbage...

Any further ideas?

Kind regards,
Jin




> 
> 
> 
> 
> On Mon, Apr 28, 2008 at 12:26 PM, Sergey 'Jin' Bostandzhyan
> <jin@mediatomb.cc> wrote:
> > Hi everyone,
> >
> > I keep struggling with meta-toolchain and I hope to get some input on this.
> >
> > I'm on oe stable, angstrom-2007.1, ARM9, uclibc, EABI
> >
> > I start with a clean build: bitbake meta-toolchain
> >
> > Unfortunately gcc-cross-sdk fails to build:
> > NOTE: package gcc-cross-sdk-4.1.2-r11: task do_compile: failed
> >
> > And here's the most interesting part:
> > | /opt/44296fe048e6bdbb2da959e5d681dfdf/etcb/OE/build/angstrom/cross/bin/arm-angstrom-linux-uclibcgnueabi-ld: cannot find libc.so.6
> > | collect2: ld returned 1 exit status
> > | make[3]: *** [libgcc_s.so] Error 1
> >
> > Is it looking for libc.so.6 on a uclibc build?
> >
> > Here is the full log:
> > http://www.deadlock.dhs.org/jin/log_do_compile_uclibcgnueabi_gcc_cross_sdk.txt
> >
> > I started to poke around, looking for differences between the configuration
> > options of the sdk and non-sdk versions.
> >
> > Apart of the directories most things are the same, the only other additonal
> > options were in the gcc-cross-sdk (vs. gcc-cross)  configuration:
> > --enable-clocale=generic and --disable-nls (the non-sdk gcc-cross did not have
> > those).
> >
> > I also looked at binutils-cross and binutils-cross-sdk, here binutils-cross
> > had two more options: --enable-install-libbfd --disable-werror The rest,
> > except for the paths was the same.
> >
> > I also noticed that the sdk variants use the already available tools from
> > the cross directory, not sure if that can be related to my problem
> > binutils-cross:
> > checking for arm-angstrom-linux-uclibcgnueabi-gcc... no
> >
> > binutils-cross-sdk:
> > checking for arm-angstrom-linux-uclibcgnueabi-gcc... arm-angstrom-linux-uclibcgnueabi-gcc
> >
> > At this point I am sort of stuck, so if anyone has an idea or a clue - I'll
> > be happy to hear about it. Thanks!
> >
> > Kind regards,
> > Jin
> >
> > P.S. I'd submit a bug... but the bugtracker is still down :(
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


