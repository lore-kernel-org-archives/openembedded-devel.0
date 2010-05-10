Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1OBUmk-0003N0-Lj
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 17:21:09 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 89106491278
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 16:52:22 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 10 May 2010 16:53:37 +0200
Message-ID: <4BE81DE7.90609@dresearch.de>
Date: Mon, 10 May 2010 16:53:27 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>
In-Reply-To: <4BE13C20.1010902@dresearch.de>
X-OriginalArrivalTime: 10 May 2010 14:53:37.0652 (UTC)
	FILETIME=[92542B40:01CAF050]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Kernel Headers Quality Issue (was: linux vs. linux-libc-headers?)
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
X-List-Received-Date: Mon, 10 May 2010 15:21:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Guys,

this is a somewhat cumulated response - I'd like to address some of the 
things mentioned at different points in the discussion in one place. 
Please forgive me should I misquote things.



Graeme Gregory in <20100505094242.GF2444@xora-desktop.xora.org.uk>:

[Steffen Sledz]
 > > It seem's not to be possible to use DEFAULT_PREFERENCE_hipox in the
 > > linux-libc-headers recipes. So what's the right way to handle this?
 > > Something like PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
 > > in angstrom-2008.1.conf?
 >
[Graeme Gregory]
 > I thought glibc was supposed to gracefully fall back on missing
 > syscalls?

Glibc is compiled against 2.6.31 headers, which is one of our main 
issues here. It only ever *runs* with a 2.6.24 kernel on the target 
system, though. So it cannot know about missing syscalls until runtime.

And no, it isn't very gracefully falling anywhere then - it simply 
cannot, as there is no runtime type checking in C. All you got is 
compile-time checking. You can happily link together completely 
incompatible interfaces if the header files are lying to you. And you 
won't even notice.

Basically, that's what's happening to us: We need to use 2.6.24 but the 
build system tells everybody (including the C library) that they will 
run with (at least) 2.6.31. As the kernel/userspace ABI is guaranteed to 
be stable (let's forget about EABI/OABI for a sec...) this will work the 
other way around, i.e. it's OK to build libc, say, against 2.6.28 kernel 
headers, and have it run on a 2.6.32 system (which, by the way, the 
latest ubuntu does). You're unable to use kernel ABI features which came 
after 2.6.28 in any userspace application linking to that libc, but the 
runtime will work.

I think pretending to have a 2.6.31 ABI while only providing a 2.6.24 
runtime is dangerous at least. And I think it is a massive bug in the 
build system if it lets you build such a dysfunctional system (because 
oe *knows* that 2.6.24 will run the system and still provides 2.6.31 
headers, thereby breaking things).


------------


Phil Blundell in <1273053926.18119.331.camel@mill.internal.reciva.com>:

 > That sounds like it's just a bug in glibc.  I guess you should fix it
 > there.

What way are we supposed to fix missing kernel ABI features (mind the 
2.6.31 / 2.6.24 feature gap) in the C library? By implementing the 
misssing functionality in the library? Then maybe port these 
library-added-kernel-features to uClibc, dietlibc, or any other C 
library if we feel the need to switch libraries? I don't think so.


------------


Phil Blundell in <1273222986.4378.18.camel@lenovo.internal.reciva.com>:

 > > So for the moment i would prefer to work with linux-libc-headers
 > > of version 2.6.24.
 > >
 > > But what's the recommended way to select them in OE/Angstrom?
 >
 > As far as OE goes, it's fairly easy: you just set
 > PREFERRED_VERSION_linux-libc-headers appropriately.

I think that's the way to go, then.

 >
 > If you are not willing to fix glibc then I think there are only three
 > sensible ways to proceed:
 >

I don't think you can "fix" missing kernel features in the library.

 > a) update your machine to use the 2.6.31 kernel so that the problem
 > goes away; or

That's my dream option ^_^ It's just that we inherited tons of legacy 
driver code. That's the sole reason we still use 2.6.24. And that won't 
change for a while. Meh.

 > b) persuade the Angstrom maintainers to adopt 2.6.24 headers as their
 > DISTRO standard, though this will presumably cause some fallout in
 > terms of other incompatibilities so I suspect it will be a struggle;
 > or

"Hey, we'd like you guys to build your C library against totally 
outdated kernel header files for your whole distribution, thereby 
breaking all the user space software which depends on newer features 
(like udev does), because we're sitting on a legacy kernel version for 
our architecture (which no one's using except us)."

Let me think.

NO. ^_^

 > c) create your own DISTRO, which can be a derivative/fork of Angstrom
 > if you wish, and in which you can obviously do whatever you like.
 > This probably seems like a bit of a large hammer to crack that
 > particular nut but it is more or less the only way in which you can
 > use a different version from the other Angstrom folks.

I think this is the way to go here. We need to make sure that everything 
is built against our build of glibc which in turn is built against 
kernel 2.6.24 header files, or things might silently break. We basically 
do have a different distribution already (as we use a *way* older kernel 
than Angstrom, and lie to the C library about it). We just didn't notice.


------------------


There's just one issue left: I can make openembedded build my target 
libraries and applications against a more recent kernel version than the 
one I'll provide on the target. I think building against a way newer 
kernel than the one the system will run is bad. And I think openembedded 
could detect, and warn about, this issue, but it doesn't, which is also 
bad. What do you guys think?


Regards,
Thilo

-- 
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Amtsgericht: Berlin Charlottenburg, HRB:54412
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77 http://www.dresearch.de


