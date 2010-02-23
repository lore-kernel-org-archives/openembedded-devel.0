Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk1AO-0006Y1-Ka
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:15:39 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk17i-0004Uh-Nn from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 12:12:50 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 12:12:50 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 20:12:49 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 13:12:49 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d1002231141y2fde23afn787781d354f5ead@mail.gmail.com>
References: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
	<1266953000.18176.52.camel@trini-m4400>
	<be7a9f3d1002231141y2fde23afn787781d354f5ead@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 13:12:49 -0700
Message-ID: <1266955969.18176.59.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 20:12:50.0156 (UTC)
	FILETIME=[92B75AC0:01CAB4C4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Kernel image stagging [was Re: [PATCH] kernel.bbclass: Stage the raw zImage and modules tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 20:15:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 16:41 -0300, Otavio Salvador wrote:
> Hello,
>=20
> On Tue, Feb 23, 2010 at 4:23 PM, Tom Rini <tom_rini@mentor.com> wrote:
>=20
> >  In the second case, why do I want to waste space with an image on the
> > rootfs that I don't need?  Today, that image goes from deploy dir to
> > <however we give stuff to the end user> or right to the device.  I coul=
d
> > see, however, adding images to a defined place in meta-toolchain so tha=
t
> > this isn't an issue anymore and we could stop putting raw kernel stuff
> > into the deploy directory.
> >
>=20
> I think that a binary fine, copied from the built package, in deploy dir =
is
> wrong by conception. It ought to be puted there as an image, if it is nee=
ded
> by an image.

What do you mean by an image?  a uImage is an image.  Sure, there's a
corner case where you put a raw vmlinux into flash but...  But what I'm
saying is that you need a kernel ready for use somewhere.  I could live
with it coming out of meta-toolchain, but that's ugly.

As a use case, I configure for beagleboard.  I bitbake console-image.  I
stick console-image.tar.bz2 onto partition 2 of my SD card.  I grab my
kernel from where? and stick it onto partition 1 so that I can put it
into the beagleboard and mmc init;run loaduimage;run mmcboot.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


