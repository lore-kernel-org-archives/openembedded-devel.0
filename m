Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1OCrBB-0000Mn-Ko
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 11:27:39 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 90D27491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 11:23:43 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 14 May 2010 11:25:09 +0200
Message-ID: <4BED170A.1070907@dresearch.de>
Date: Fri, 14 May 2010 11:25:30 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>
	<4BE81DE7.90609@dresearch.de>	<1273510550.22943.298.camel@trini-m4400>
	<20100510190024.GA12534@gmail.com>
In-Reply-To: <20100510190024.GA12534@gmail.com>
X-OriginalArrivalTime: 14 May 2010 09:25:09.0964 (UTC)
	FILETIME=[5948A0C0:01CAF347]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue
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
X-List-Received-Date: Fri, 14 May 2010 09:27:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello *.*,

>>> Graeme Gregory in <20100505094242.GF2444@xora-desktop.xora.org.uk>:
>>>
>>> [Steffen Sledz]
>>>  > > It seem's not to be possible to use DEFAULT_PREFERENCE_hipox in the
>>>  > > linux-libc-headers recipes. So what's the right way to handle this?
>>>  > > Something like PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
>>>  > > in angstrom-2008.1.conf?
>>>  >
>>> [Graeme Gregory]
>>>  > I thought glibc was supposed to gracefully fall back on missing
>>>  > syscalls?
>>>
>>> Glibc is compiled against 2.6.31 headers, which is one of our main 
>>> issues here. It only ever *runs* with a 2.6.24 kernel on the target 
>>> system, though. So it cannot know about missing syscalls until runtime.
>> So, I think some of the confusion here stems from confusion about (and I
>> don't know the right answer off-hand) how glibc handles the
>> --with-kernel=VERSION stuff.
> 
> Well based on --with-kernel supplied to it during build time it 
> configures syscalls that are available in that version of kernel.

No it doesn't. Quoting the documentation of "--enable-kernel=VERSION" 
from <http://sourceware.org/ml/libc-announce/2001/msg00000.html>:

-------------
One Linux systems the configure script has a new option
`--enable-kernel' (find the documentation in the INSTALL file).  This
option allows one to strip out compatibility code for older kernel
versions.  This is of interest since configuring for a 2.4.x kernel
reduces the libc size by about 1%.  This is no high percentage but all
the code gone is in the by far most often used functions.  The
compatibility code is needed because of poor design decisions of the
kernel developers who constantly have to adjust the interface to new
requirements.  If you never expect to run kernel versions older than
the one used at compile time of the library it is a good idea to pass
`--enable-kernel=current' to configure.  But be careful since with an
older kernel the program won't even start and the whole system might
be rendered useless (unless backup kernels are available).
-------------

What it really does is providing deprecated (very, very old) kernel 
interfaces to deprecated applications running on a very recent kernel 
(which does not provide these interfaces anymore).

> unlike uclibc which configures based on the kernel headers supplied
> to it at buildtime glibc does not assume the version to be the 
> one supplied during build but with --with-kernel you can make it
> know that it will not be run on kernel versions less than one specified
> to --with-kernel

This way Glibc can decide which legacy interfaces to provide. It will be 
slightly less bloated e.g. when providing only 2.6 series compatibility 
(so applications which use 2.4 kernel interfaces deprecated by 2.6 won't 
compile or run).

> so it should be ok to compile glibc using newer version of kernel and run
> it on an older version of kernel.

No it isn't. --enable-kernel=VERSION provides kernel ABI backwards 
compatibility to applications. *At least* the kernel ABI described in 
the headers provided to glibc during compile time must be present at 
runtime.

Glibc simply has no other means than the kernel headers to figure out 
which kernel ABI functions will really be there at runtime. Glibc cannot 
figure out at runtime that it runs on an older kernel which lacks *some* 
of the ABI glibc relies on. It can only rely on the information in the 
kernel headers provided at compile time.

Even worse: At runtime glibc cannot detect that some of the kernel 
interfaces are different or not present at all. It will blindly use the 
interfaces it knows from its header files, resulting in strange 
application behaviour in these corner cases.

Regards,
Thilo

-- 
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Amtsgericht: Berlin Charlottenburg, HRB:54412
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77 http://www.dresearch.de


