Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJtry-0002id-M4
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 20:40:22 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLT006WU4O28H0B@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	25 Jun 2009 13:28:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8AC1714AF5F; Thu,
	25 Jun 2009 14:28:49 -0400 (EDT)
Date: Thu, 25 Jun 2009 14:28:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090625182849.GL32082@denix.org>
References: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: OMAP3530 bring-up (and installation of Angstrom)
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
X-List-Received-Date: Thu, 25 Jun 2009 18:40:23 -0000
X-Groupsio-MsgNum: 11630
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2009 at 09:50:41PM +0400, Sergey Lapin wrote:
> Hi, all!
>=20
> I have a new OMAP3530-based board which is totally empty.
> omapzoom tools recognize ASIC ID on serial port, so I think it should
> be possible
> to bring it up this way. Do anybody have some minimal testing program
> to flip some GPIO,
> or character on serial?
> I can't get any output from x-loader on either UART1 or UART3.. How
> should I build binary for
> it to be recognized by boot loader over serial?
> No JTAG is here for this processor, and I have some troubles with
> understanding of
> Windows tools.

Does your board have any buttons or DIP-switches to select boot order? You =
may=20
need to select the serial boot in order for the BootROM to send a handshake=
=20
sequence on the UART3. The handshake on the therminal looks like several=20
characters of garbage, starting with '40T'. The boot order is selected by a=
=20
DIP-switch on OMAP3EVM and by a "User" button on BeagleBoard.

Then you need to use one of the available peripheral loaders to load a smal=
l=20
version of U-boot over UART or USB into OMAP's SRAM and from there you can=
=20
flash a final versions of x-load and U-boot into NAND. There are HOWTO's=20
available, for example, here is one for BeagleBoard:
http://elinux.org/BeagleBoardRecovery

There should be a similar one for OMAP3EVM, but I currently cannot seem to=
=20
find it...

--=20
Denys

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkpDweEACgkQQypAvBzwgeyqQACeI8wRZohn6uMUQ4bRltyLfHw9
NUYAn31164lg2I+C1CsnBgBr9y1jmtdi
=F/o8
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
