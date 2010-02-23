Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk0Od-0007Vy-LK
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 20:26:18 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk0Ly-0004qG-6l from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 11:23:30 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 11:23:29 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 19:23:24 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 12:23:24 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
References: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 12:23:20 -0700
Message-ID: <1266953000.18176.52.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 19:23:29.0638 (UTC)
	FILETIME=[AE1C2860:01CAB4BD]
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
X-List-Received-Date: Tue, 23 Feb 2010 19:26:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 15:55 -0300, Otavio Salvador wrote:
> Hello Chris and others,
>=20
> Your patch looks fine however this has made me thing another issue.
>=20
> For me, it looks like the image ought to have be grabed from the package,=
 at
> image building time, not at kernel package building time.
>=20
> This solves a problem when we remove the image deploy dir and then need t=
o
> rebuild the kernel package to get the image there again.
>=20
> Do you think it makes sense?

I should note that Chris didn't notice that I had already just pushed
this upstream.  And this neatly dovetails into a conversation I was
having with Chris anyhow (about another change we have that doesn't make
sense anymore).  There's two cases for how the kernel image is used:
- On the target, ${feed install} kernel-image, write to flash, whatever.
- On the host, user loads image to target, writes to flash in
bootloader.

In the second case, why do I want to waste space with an image on the
rootfs that I don't need?  Today, that image goes from deploy dir to
<however we give stuff to the end user> or right to the device.  I could
see, however, adding images to a defined place in meta-toolchain so that
this isn't an issue anymore and we could stop putting raw kernel stuff
into the deploy directory.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


