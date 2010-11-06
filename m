Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEf8E-0000V1-Qc for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 10:32:19 +0100
Received: from f053041208.adsl.alicedsl.de ([78.53.41.208]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEf7P-0007Ff-0v for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 09:31:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101106075118.GM15069@ibawizard.net>
References: <1288776534.3980.33.camel@mattotaupa>
	<4CD1A210.5000007@telus.net> <1288999268.4113.51.camel@mattotaupa>
	<20101106075118.GM15069@ibawizard.net>
Date: Sat, 06 Nov 2010 10:31:25 +0100
Message-ID: <1289035885.4901.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: vlc_1.1.4.1: Why is `lua5.1-native` not added to `DEPENDS` automatically?
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
X-List-Received-Date: Sat, 06 Nov 2010 09:32:19 -0000
X-Groupsio-MsgNum: 25945
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-CKwc0+waD45D0Jil5ueN"

--=-CKwc0+waD45D0Jil5ueN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 06.11.2010, 08:51 +0100 schrieb Petr =C5=A0tetiar:
> Paul Menzel <paulepanter@users.sourceforge.net> [2010-11-06 00:21:08]:
>=20
> > Indeed in all my tests there is no `luac` staged.
> > This should be done by adding `lua5.1-native` to `DEPENDS` as you
> > suggested. But I am wondering why `lua5.1` is not providing `luac`. Is
> > there a problem with the `lua5.1` recipe [4][5]?
>=20
> The question is, why there's no luac for you :-) It's working for me (tm)=
, see bellow.=20
>=20
> ynezz@ntbk:/media/data/devel/oe/ts72xx.git/tmp/work$ ls armv4t-angstrom-l=
inux-*/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/bin/*
> armv4t-angstrom-linux-gnueabi/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/b=
in/lua
> armv4t-angstrom-linux-gnueabi/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/b=
in/luac
> armv4t-angstrom-linux-uclibceabi/lua5.1-5.1.4-r9/packages-split/lua5.1/us=
r/bin/lua
> armv4t-angstrom-linux-uclibceabi/lua5.1-5.1.4-r9/packages-split/lua5.1/us=
r/bin/luac

I think my question is, why `luac` is not staged if `vlc` `DEPENDS` on
`lua5.1`.

Or is is inevitable to add `lua5.1-native` to `DEPENDS`?


Thanks,

Paul

--=-CKwc0+waD45D0Jil5ueN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzVIGcACgkQPX1aK2wOHVhkRACfUhCGublrQwVCMNmymYO3e3h+
csgAn3I/reZsZ0kC+HD1nXvB50bKcOyN
=JlFD
-----END PGP SIGNATURE-----

--=-CKwc0+waD45D0Jil5ueN--
