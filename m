Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJvN0-0002eM-J0
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 22:16:30 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLT0051X93MJUW1@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	25 Jun 2009 15:04:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F05CC14AF5F; Thu,
	25 Jun 2009 16:04:33 -0400 (EDT)
Date: Thu, 25 Jun 2009 16:04:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090625200433.GM32082@denix.org>
References: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
	<20090625182849.GL32082@denix.org>
	<48239d390906251241p73ff7f5rcdae350df20ef41c@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <48239d390906251241p73ff7f5rcdae350df20ef41c@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] OMAP3530 bring-up (and installation of	Angstrom)
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
X-List-Received-Date: Thu, 25 Jun 2009 20:16:30 -0000
X-Groupsio-MsgNum: 11634
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-disposition: inline

--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2009 at 11:41:03PM +0400, Sergey Lapin wrote:
> On Thu, Jun 25, 2009 at 10:28 PM, Denys Dmytriyenko<denis@denix.org> wrot=
e:
> > On Thu, Jun 25, 2009 at 09:50:41PM +0400, Sergey Lapin wrote:
> >> Hi, all!
> >>
> >> I have a new OMAP3530-based board which is totally empty.
> >> omapzoom tools recognize ASIC ID on serial port, so I think it should
> >> be possible
> >> to bring it up this way. Do anybody have some minimal testing program
> >> to flip some GPIO,
> >> or character on serial?
> >> I can't get any output from x-loader on either UART1 or UART3.. How
> >> should I build binary for
> >> it to be recognized by boot loader over serial?
> >> No JTAG is here for this processor, and I have some troubles with
> >> understanding of
> >> Windows tools.
> >
> > Does your board have any buttons or DIP-switches to select boot order? =
You may
> > need to select the serial boot in order for the BootROM to send a hands=
hake
> > sequence on the UART3. The handshake on the therminal looks like several
> > characters of garbage, starting with '40T'. The boot order is selected =
by a
> > DIP-switch on OMAP3EVM and by a "User" button on BeagleBoard.
> I probably skipped some details on last email, sorry. I see ASIC ID
> pattern (some garbage containing 40T).
> I use pserial from omapzoom and try to upload self-built x-loader
> binary, it reports success,
> but I see no output on either of serial ports. No error messages,
> nothing at all. That's why I'm interested in
> minimal test program to use oscilloscope on some pins. I see that GPIO
> configuration on OMAP3 is a lot
> more complex than on AT91 and PXA, so I look for samples to check what
> debugging could be inserted into
> x-loader to look what happens. Also, a question remains - is it needed
> for binary to be signed
> befor uploading to serial, or not?

Yes, x-load/MLO need to be "signed". OMAP35x "signing" is just adding a=20
header, see signGP tool:
http://beagleboard.googlecode.com/files/signGP.c

It's not that simple for OMAP34x, though...

Check the x-load build/sign procedures here:
http://code.google.com/p/beagleboard/wiki/BeagleSoftCompile

--=20
Denys

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkpD2FEACgkQQypAvBzwgexgCQCfXgqcnkXU1pxgaTCRBCn2KeyU
xDcAoJPRVvq5LNxzhyhtPkQTc4dcJchG
=uIae
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
