Received: from [82.182.55.65] (helo=pcjr2.rosbacke.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mikael@rosbacke.org>) id 1L2Syv-00042B-3H
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 16:59:13 +0100
Received: from [192.168.0.195] by pcjr2.rosbacke.org with esmtp (Exim 4.63)
	(envelope-from <mikael@rosbacke.org>) id 1L2SwW-0003Hd-LD
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 16:56:45 +0100
From: Mikael Rosbacke <mikael@rosbacke.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gfrr9a$p4c$2@ger.gmane.org>
References: <1226923118.6891.54.camel@akaza1> <gfrnrh$e05$1@ger.gmane.org>
	<1226925784.6891.58.camel@akaza1>  <gfrr9a$p4c$2@ger.gmane.org>
Date: Tue, 18 Nov 2008 15:56:44 +0100
Message-Id: <1227020204.4137.41.camel@akaza1>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
X-SA-Exim-Connect-IP: 192.168.0.195
X-SA-Exim-Mail-From: mikael@rosbacke.org
X-SA-Exim-Scanned: No (on pcjr2.rosbacke.org); SAEximRunCond expanded to false
Subject: Re: KERNEL_INCLUDES in uClibc.
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
X-List-Received-Date: Tue, 18 Nov 2008 15:59:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tnx, good to have a recommended way to do it.

Tried it but failed on the same spot. Checked bugzilla and found bug
#4289 which seems to be the same behaviour as I see, but on another
target. I've added my findings to that bug-report.

I'll think I'll wait a bit with the uclibc version until that bug can be
fixed or otherwise worked around.

Thank you for your time,

--- Mikael R=20


m=C3=A5n 2008-11-17 klockan 14:23 +0100 skrev Koen Kooi:
> On 17-11-08 13:43, Mikael Rosbacke wrote:
> > m=C3=A5n 2008-11-17 klockan 13:25 +0100 skrev Koen Kooi:
> >> On 17-11-08 12:58, Mikael Rosbacke wrote:
> >>> Good day.
> >>>
> >>> I'm currently trying to get a uClibc based minimal image for x86 to
> >>> build and have some problems with it. I'm using DISTRO=3D'minimal-ucl=
ibc'
> >>> and MACHINE=3D'x86' and trying to build the target 'minimal-image'.
> >> Try using the angstrom distribution, since minima-uclibc isn't really
> >> support or working currently.
> >>
> > I've managed to get Angstrom working with glibc some days ago. But I
> > would like to have something smaller.
>=20
> Images tell what goes into a rootfs, not a distro, so 'smaller' isn't a=20
> criterium for switching distro.
>=20
> > I scanned the distro folder but
> > couldn't find a uClibc variant of it. Is there some other way to make
> > angstrom use the uclibc?
>=20
> ANGSTROM_MODE =3D "uclibc" in local.conf or 'ANGSTROM_MODE=3Duclibc bitba=
ke=20
> <foo>"
>=20
> regards,
>=20
> Koen
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



