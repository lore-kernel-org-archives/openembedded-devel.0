Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JYqUW-0007Sy-6G
	for openembedded-devel@openembedded.org; Mon, 10 Mar 2008 23:29:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2AMREVb004002
	for <openembedded-devel@openembedded.org>; Mon, 10 Mar 2008 22:27:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03624-10 for <openembedded-devel@openembedded.org>;
	Mon, 10 Mar 2008 22:27:06 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2AMR3Bf003989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 10 Mar 2008 22:27:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803101056y50cdbd18mf39818f746fa3152@mail.gmail.com>
References: <c384c5ea0803091149g321e7086qec5b54499c7ecbc@mail.gmail.com>
	<fr3oom$clq$1@ger.gmane.org>
	<c384c5ea0803101056y50cdbd18mf39818f746fa3152@mail.gmail.com>
Date: Mon, 10 Mar 2008 22:27:05 +0000
Message-Id: <1205188025.4529.27.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-initial.inc DEPENDS on libc-initial, but why	conditionally on TARGET_ARCH?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Mar 2008 22:29:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-03-10 at 18:56 +0100, Leon Woestenberg wrote:
> On Mon, Mar 10, 2008 at 5:48 PM, Koen Kooi
> <koen@dominion.kabel.utwente.nl> wrote:
> >  | OE toolchain question: any reason why the list below includes arm*,
> >  | mips* but nothing else?
> >  |
> >  | gcc-cross-initial.inc:
> >  |
> >  "${@['virtual/${TARGET_PREFIX}libc-initial',''][bb.data.getVar('TARGET_ARCH',
> >  | d, 1) in ['arm', 'armeb', 'mips', 'mipsel']]}"
> >
> >  I think that's because we only supported nptl for arm and mips when the
> >  earth was still young and glibc even nastier than today. I asked this
> >  before and never got a conclusive answer :(
> >
> I suspected this to be NPTL related, and I vaguely remember you
> explaining the initial-intermediate dependencies.
> 
> RP answered on #oe that my logic was inverse: gcc-cross-initial *does*
> depend on libc-initial *only* when arm/mips is the target, not for
> other architectures.
> 
> Indeed, when building powerpc/glibc no libc-initial is involved.
> However, when I switch to ulibc, there is a libc-initial involved, but
> it is not depended on, and a parallel build fails.
> 
> Argh, if only I understood the whole complete picture, I could fix it,

I tried asking Phil who is/was one of our glibc gurus and he said "those
two architectures are more classically 'embedded'" than, say, i386 or
powerpc and they might well have more self-hosting runtimes." but he
wasn't sure what the exact reason was.

I've become fuzzy about how the different toolchain bits fit together so
I mapped out the chains below. I've missed out references to
TARGET_PREFIX since they just confuse things:

gcc-initial depends on virtual/libc-initial for arch != (arm|mips).
glibc-initial provides this and it looks like it just stages headers
which presumably gcc-initial needs to build.

gcc-initial is the compiler used to build the libc used by gcc-cross
which is called virtual/libc-for-gcc.

virtual/libc-for-gcc is provided either by glibc or by
glibc-intermediate depending on whether we're using NPTL.

In the case NPTL isn't used, glibc depends on gcc-initial and provides
virtual/libc-for-gcc so we have:

For arm/mips:
linux-libc-headers <- gcc-initial <- glibc <- gcc-cross
For everything else:
linux-libc-headers <- glibc-initial <- gcc-initial <- glibc <- gcc-cross

When NPTL is used for arm/mips:
linux-libc-headers <- gcc-initial <- glibc-intermediate <- gcc-cross <- glibc
For everything else:
linux-libc-headers <- glibc-initial <- gcc-initial <- glibc-intermediate <- gcc-cross <- glibc

So its all a bit complex...

What was the problem you were seeing with glibc-initial?

Cheers,

Richard




