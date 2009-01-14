Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LMtJO-0008N4-Is
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 01:08:46 +0100
Received: (qmail invoked by alias); 14 Jan 2009 00:02:12 -0000
Received: from e177084010.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.177.84.10]
	by mail.gmx.net (mp008) with SMTP; 14 Jan 2009 01:02:12 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+cYF0tM9yc/K8Qwwgrtcgzj3qxCdY/5+/VElaFLq
	0iBQPPftlxUha3
Message-ID: <496D2BDB.6030603@gmx.net>
Date: Wed, 14 Jan 2009 01:03:39 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: rpurdie@rpsys.net
References: <1230827114.5320.42.camel@dax.rpnet.com>
In-Reply-To: <1230827114.5320.42.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.45
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Wed, 14 Jan 2009 00:08:46 -0000
X-Groupsio-MsgNum: 7215
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig10CE3C6C3D3DF67E86756B97"

--------------enig10CE3C6C3D3DF67E86756B97
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I somehow missed this thread.

Richard Purdie schrieb:
> Proposal Step A:
>=20
> Having to set:
>=20
> FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/foo-${PV}=
"
>=20
> and
>=20
> S =3D "${WORKDIR}/foo-${PV}
>=20
> is fairly pointless and it would be nice the the defaults just did the
> right thing.=20
>=20
> http://git.pokylinux.org/cgit.cgi/poky/commit/?h=3Dexperimental-virtual=
native&id=3Db8f0510a5567f6d1b90934fe513fd40423f11086
>=20
> is a patch introducing BASEPN which is PN with a range of specified
> suffixes removed (-native, -cross-sdk, -cross, -sdk as specified by
> SPECIAL_PKGSUFFIX).
>=20
> FILESPATH and S can then be constructed with BASEPN instead of PN
> removing the need to need to hardcode them:
>=20
> http://git.pokylinux.org/cgit.cgi/poky/commit/?h=3Dexperimental-virtual=
native&id=3Ded829661d51b8f23628e97404ed507c2e56d8495
>=20
> This reduces my hypothetical example to:
>=20
> foo/foo.inc:
>=20
> SRC_URI =3D "http://somwehere/${BASEPN}-${PV}.tar.bz2 \
>            file://some.patch;patch=3D1"
> inherit autotools
>=20
> foo/foo-native_1.0.bb:
> require foo_${PV}.bb
> inherit native
>=20
> The above proposal is worthwhile in itself alone.
Like koen said we have something like this in OE already but your
implementation looks better:

a) BASEPN, BASEP instead of BPN, BP:
This is less prone to be confused with "B". Furthermore I just tried to
put the BPN code into my local Poky and it turned out that somehow BPN
and BP are not set by the 'base_package_name' although its the same code
as in OE's org.oe.dev. There not many packages in OE which use BPN/BP so
we can quickly rename those that do.

I use BP/BPN more extensively in Jalimo but I already have a patch to
fix this.

b) Use of SPECIAL_PKGSUFFIX variable to define known suffixes
In OE's implementation this is hardcoded in the function code. Not so
nice but heck I am no python coder. :$

Regards
Robert



--------------enig10CE3C6C3D3DF67E86756B97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkltK+MACgkQG9cfwmwwEtrJWgCfYa5+AD75A3Z942MYnnR0Zr+j
PcIAniETZbXVjvczxMjDFHqJaWbEmp9B
=D6Z8
-----END PGP SIGNATURE-----

--------------enig10CE3C6C3D3DF67E86756B97--
