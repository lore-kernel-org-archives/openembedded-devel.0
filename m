Received: from [64.233.178.250] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JlXdF-0004yK-Ax
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 00:58:37 +0200
Received: by hs-out-0708.google.com with SMTP id 23so572347hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 15:58:33 -0700 (PDT)
Received: by 10.100.14.2 with SMTP id 2mr13319924ann.67.1208213913361;
	Mon, 14 Apr 2008 15:58:33 -0700 (PDT)
Received: from ?10.235.23.2? ( [71.146.14.115])
	by mx.google.com with ESMTPS id c4sm11033931anc.29.2008.04.14.15.58.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Apr 2008 15:58:32 -0700 (PDT)
Message-ID: <4803E192.6040501@gmail.com>
Date: Mon, 14 Apr 2008 15:58:26 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200804141504.29481.geoffrey@pager.net>
In-Reply-To: <200804141504.29481.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
OpenPGP: id=A57A7A6E
Subject: Re: Building gdbserver only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2008 22:58:37 -0000
X-Groupsio-MsgNum: 4958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig444AB9D6703EB49F2530E91D"

--------------enig444AB9D6703EB49F2530E91D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Geoffrey Wossum wrote:
> Hi all,
>=20
> I'm working on getting OE to build gdb-6.7.1.atmel.1.0.3 for the AVR32.=
  I=20
> have the gdb-cross working, but gdb is a little tricker.  gdb has not b=
een=20
> ported to be hosted on the AVR32, so do_compile() quits when running th=
e=20
> gdb/configure script.
>=20
> It does support building gdbserver for the AVR32, though.  Trouble is, =
there=20
> doesn't seem to be an "easy" way to build just gdbserver.  To build jus=
t=20
> gdbserver, you run the gdb-${PV}/gdb/gdbserver/configure instead of=20
> gdb-${PV}/configure.  oe_runconf() substitutes the value of ${S} in.  I=
f you=20
> try to modify ${S} so that oe_runconf() executes the correct configure =

> script, then ${S} is screwed  up for do_patch() and the patches won't a=
pply. =20
>=20
> Any ideas on how to solve this dillemma?

How about building gdb completely but package only gdbserver.


Thanks

-Khem


--------------enig444AB9D6703EB49F2530E91D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIA+GVHnJKy6V6em4RAobYAJwKrHeaVncUeDfWI6ntG/GcmaaEpwCfYkzl
PgNQQNu8NSma/S5txGWOM+s=
=OhOE
-----END PGP SIGNATURE-----

--------------enig444AB9D6703EB49F2530E91D--
