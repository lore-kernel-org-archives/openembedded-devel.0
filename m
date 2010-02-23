Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk1QO-0002NJ-0O
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:32:11 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk1Ni-0007ip-4z from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 12:29:22 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 12:29:21 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 20:29:21 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 13:29:20 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d1002231218g19c58eefiad8260dd9551e559@mail.gmail.com>
References: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
	<1266953000.18176.52.camel@trini-m4400>
	<be7a9f3d1002231141y2fde23afn787781d354f5ead@mail.gmail.com>
	<1266955969.18176.59.camel@trini-m4400>
	<be7a9f3d1002231218g19c58eefiad8260dd9551e559@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 13:29:20 -0700
Message-ID: <1266956960.18176.68.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 20:29:21.0537 (UTC)
	FILETIME=[E1A01710:01CAB4C6]
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
X-List-Received-Date: Tue, 23 Feb 2010 20:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 17:18 -0300, Otavio Salvador wrote:
> Hello,
>=20
> On Tue, Feb 23, 2010 at 5:12 PM, Tom Rini <tom_rini@mentor.com> wrote:
>=20
> > As a use case, I configure for beagleboard.  I bitbake console-image.  =
I
> > stick console-image.tar.bz2 onto partition 2 of my SD card.  I grab my
> > kernel from where? and stick it onto partition 1 so that I can put it
> > into the beagleboard and mmc init;run loaduimage;run mmcboot.
> >
>=20
> I see your point and I'm not saying we shouldn't have the kernel availabl=
e
> somewhere. We need it somewhere.
>=20
> However I disable when it is copied to deploy; in my opinion it ought to =
be
> done at rootfs creation so it will _always_ have a {z,bz,u}Image availabl=
e
> in deploy dir.
>=20
> Just try:
>=20
> bitbake console-image (works)
> rm $DEPLOY_DIR
> bitbake console-image (fails)
>=20
> and this is wrong IMO.

No, it works today since I was bad (and forgot the policy about getting
acks) and just fixed it.  That said, I'll admit I'm not 100% sure that
everything is correct in other cases.  We've caught the uImage case, but
I'm thinking device trees are probably broken.  So, a PoC patch to get
image.bbclass to do something sane to DEPLOY_DIR would be fine with me,
if I don't get to it first ;)

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


