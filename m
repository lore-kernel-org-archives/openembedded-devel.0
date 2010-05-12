Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OCDqc-0003Wn-K3
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 17:27:47 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OCDmo-0004mx-VQ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 08:23:51 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 12 May 2010 08:23:50 -0700
Received: from 172.30.80.82 ([172.30.80.82]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 12 May 2010 15:23:49 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	12 May 2010 08:23:47 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BEA448D.5060008@dresearch.de>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>
	<4BEA448D.5060008@dresearch.de>
Organization: Mentor Graphics Corporation
Date: Wed, 12 May 2010 08:23:47 -0700
Message-ID: <1273677827.22943.415.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 12 May 2010 15:23:50.0758 (UTC)
	FILETIME=[1FD9B060:01CAF1E7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Wed, 12 May 2010 15:27:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-05-12 at 08:02 +0200, Steffen Sledz wrote:
> 11.05.2010 16:27, Tom Rini wrote:
> > All of this information is _not_ coming from glibc claiming that a
> > syscall exists, but it's coming from the linux-libc-headers having them
> > (which is why if you downgrade, they build and run as you expect them
> > to).  Then there's the problem, as others have stated, that it's up to
> > userland to gracefully handle if a syscall isn't really available.
>=20
> <grrrr> Now i'm totally confused. Here's a short summary as i understand
> this thread (may be i misunderstand something).

Well, here is my understanding.

> My initial understanding was:
>=20
> linux-libc-headers match to kernel version

In an ideal world, yes.  Because the various <asm/...> and <linux/...>
files that are exported for use do indeed get new features added over
time. And...

> -> autotools report existing syscalls

All the autotools stuff does is:
(a) If we provide in openembedded/site/... a variable to set a check to
a value, use it
(b) Try and compile a test program to check for availability (since it
can't then run the program for a cross build).

> -> apps can use them
> -> fine

Right.

> Then Koen wrote: no chance to change linux-libc-headers for angstrom

Right.  Angstrom has a publicly usable download feed and there's no way
to tell if a file there was built vs .31 (and may have syscalls
introduced around then) or .25 (and won't).  That's a very bad situation
for Angstrom.

> Graeme and Phil wrote something like no problem, "glibc was supposed
> to gracefully fall back on missing syscalls". What i understand as
>=20
> linux-libc-headers may be newer than kernel version
> -> autotools report availability of some syscalls (e.g. inotify_init1 or =
epoll_create1)
> -> apps can use them
> -> if called on older kernels glibc will handle this "gracefully"
> -> fine
>=20
> But tests showed that glibc did not handle syscalls this way.

Yes.  And just now, Phil has provided an example of handling a syscall.

> Then you wrote that *every app* itself is responsible to handle syscalls
> which are reported by autotools (linux-libc-headers) as *available* but
> are *not available* ? I can't believe that. This sounds absurd for me.

This is how I read what Phil and possibly someone else too were saying,
and based on your observation that glib for example will fall back at
run time.

> So please enlighten my confusions.
>=20
> Regards,
> Steffen
>=20
> PS:
>=20
> > You noted before that glib-2.0 falls back to using something very
> > inefficient, rather than a less efficient syscall that does exist, yes?
>=20
> What glib does is checking the availability (by using autotools) of inoti=
fy (in various levels), fam, or plain polling.

So you did not see it change behavior at run time?  That's how I had
read your email before.

>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


