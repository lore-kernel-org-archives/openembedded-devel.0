Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OBqU8-00072l-TO
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 16:31:02 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OBqQM-0005YU-M1 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 07:27:06 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 11 May 2010 07:27:06 -0700
Received: from 172.30.80.82 ([172.30.80.82]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 11 May 2010 14:27:05 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	11 May 2010 07:27:04 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BE90A56.3090605@dresearch.de>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>
	<4BE90A56.3090605@dresearch.de>
Organization: Mentor Graphics Corporation
Date: Tue, 11 May 2010 07:27:04 -0700
Message-ID: <1273588024.22943.391.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 11 May 2010 14:27:06.0387 (UTC)
	FILETIME=[08462630:01CAF116]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Tue, 11 May 2010 14:31:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-05-11 at 09:42 +0200, Steffen Sledz wrote:
> Am 10.05.2010 21:14, Tom Rini wrote:
> > Looking at it again and based on what Khem said (and re-reading your
> > failures), the problem is not with glibc, but with other programs (glib=
,
> > udev are both mentioned specifically) and these programs specifically
> > not failing gracefully.  For example, it's quoted over in:
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/019626=
.html
> > that glib falls way back.  I think Phil was wrong here and without
> > checking the code, I imagine glib is trying fancy newer syscall,
> > failing, and then falling far back, rather than to just inotify_init as
> > you expected.  So the bug here is with glib.
> >=20
> > As for the udev issue, I do not know how they will react to making the
> > udev version be soft-assign as that too may raise issues.  And iirc,
> > udev is or at least can be more tied to min kernel versions.
>=20
> No, it seems not to be a problem of glib, rsyslog, or udev.
>=20
> As i see in the build logs glibc is build using --enable-kernel=3D2.6.16 =
(i do not know any --with-kernel option).

Yes, my fault, sorry, it's indeed --enable-kernel=3D.

> After running autotools config.h of e.g. glib-2.0 contains
>=20
>  /* Define to 1 if you have the `inotify_init1' function. */
>  #define HAVE_INOTIFY_INIT1 1
>=20
> So the glib-2.0 is allowed to use inotify_init1. But this is only availab=
le for kernel version >=3D 2.6.27.
>=20
> Same behaviour for epoll_create1 in e.g. rsyslog
>=20
>  /* Define to 1 if you have the `epoll_create' function. */
>  #define HAVE_EPOLL_CREATE 1
>=20
>  /* Define to 1 if you have the `epoll_create1' function. */
>  #define HAVE_EPOLL_CREATE1 1
>=20
> Conclusion: glibc reports functions "available" which are not available f=
or our kernel 2.6.24 (and not "emulated" inside glibc). :(

All of this information is _not_ coming from glibc claiming that a
syscall exists, but it's coming from the linux-libc-headers having them
(which is why if you downgrade, they build and run as you expect them
to).  Then there's the problem, as others have stated, that it's up to
userland to gracefully handle if a syscall isn't really available.  You
noted before that glib-2.0 falls back to using something very
inefficient, rather than a less efficient syscall that does exist, yes?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


