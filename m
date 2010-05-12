Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OC55k-0000Bc-BS
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 08:06:50 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 434DC49127F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 08:02:54 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 12 May 2010 08:04:14 +0200
Message-ID: <4BEA448D.5060008@dresearch.de>
Date: Wed, 12 May 2010 08:02:53 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>
	<4BE81DE7.90609@dresearch.de>	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>
In-Reply-To: <1273588024.22943.391.camel@trini-m4400>
X-OriginalArrivalTime: 12 May 2010 06:04:14.0324 (UTC)
	FILETIME=[F2BC7340:01CAF198]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Wed, 12 May 2010 06:06:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

11.05.2010 16:27, Tom Rini wrote:
> All of this information is _not_ coming from glibc claiming that a
> syscall exists, but it's coming from the linux-libc-headers having them
> (which is why if you downgrade, they build and run as you expect them
> to).  Then there's the problem, as others have stated, that it's up to
> userland to gracefully handle if a syscall isn't really available.

<grrrr> Now i'm totally confused. Here's a short summary as i understand
this thread (may be i misunderstand something).

My initial understanding was:

linux-libc-headers match to kernel version
-> autotools report existing syscalls
-> apps can use them
-> fine

Then Koen wrote: no chance to change linux-libc-headers for angstrom

Graeme and Phil wrote something like no problem, "glibc was supposed
to gracefully fall back on missing syscalls". What i understand as

linux-libc-headers may be newer than kernel version
-> autotools report availability of some syscalls (e.g. inotify_init1 or epoll_create1)
-> apps can use them
-> if called on older kernels glibc will handle this "gracefully"
-> fine

But tests showed that glibc did not handle syscalls this way.

Then you wrote that *every app* itself is responsible to handle syscalls
which are reported by autotools (linux-libc-headers) as *available* but
are *not available* ? I can't believe that. This sounds absurd for me.

So please enlighten my confusions.

Regards,
Steffen

PS:

> You noted before that glib-2.0 falls back to using something very
> inefficient, rather than a less efficient syscall that does exist, yes?

What glib does is checking the availability (by using autotools) of inotify (in various levels), fam, or plain polling.



