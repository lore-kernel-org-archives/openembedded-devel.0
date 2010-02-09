Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NeonJ-00015T-K3 for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 13:02:20 +0100
Received: from f053032124.adsl.alicedsl.de ([78.53.32.124]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Neoks-0002A8-5e for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 11:59:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B7145A5.70808@dresearch.de>
References: <4B7145A5.70808@dresearch.de>
Date: Tue, 09 Feb 2010 12:59:44 +0100
Message-ID: <1265716784.16488.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: confused by netbase/udev
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
X-List-Received-Date: Tue, 09 Feb 2010 12:02:20 -0000
X-Groupsio-MsgNum: 16588
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TlEFmMRyPweDvttA8/N+"

--=-TlEFmMRyPweDvttA8/N+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 09.02.2010, 12:23 +0100 schrieb Steffen Sledz:=20
> I'm a bit confused about netbase and udev use im Angstrom.
> Here's what i see:
>=20
> I connect an USB-NIC.
>=20
> /etc/udev/rules.d/70-persistent-net.rules is created:

[=E2=80=A6]

> And for each new NIC another name is created?! :(
>=20
> And here's what i like to see:
> * Connect an USB-NIC should result in an DHCP-configured interface.

Do you have it configured somewhere (for example in [2])? If not you can
use a daemon like NetworkManager.

> * Disconnect the USB-NIC remove all traces from the system.

[1] is necessary because (at least under Debian (I cannot verify on
=C3=85ngstr=C3=B6m right now)) you can set certain parameters in [2], i. e.=
 if an
interface should be configured statically or dynamically. You have to
reference those devices with `ethN` (N =E2=88=88 =E2=84=95) but without [1]=
 they would
be randomly enumerated. That is why [1] is needed.

[=E2=80=A6]

I hope that helps.


Thanks,

Paul


[1] /etc/udev/rules.d/70-persistent-net.rules
[2] /etc/network/interfaces

--=-TlEFmMRyPweDvttA8/N+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktxTiMACgkQPX1aK2wOHViMaQCeNWBVhRbFjPU/Wb2vrqsYy1k9
tjwAoIMn/cz17yeHe5Zt4NbRnlJoLUXn
=xzff
-----END PGP SIGNATURE-----

--=-TlEFmMRyPweDvttA8/N+--
