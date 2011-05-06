Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIT7O-0001E8-LV for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 00:03:26 +0200
Received: from f053032229.adsl.alicedsl.de ([78.53.32.229]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIT5w-0002Os-6o for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 22:01:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304337015.3949.62.camel@mattotaupa>
References: <1304324573-31754-1-git-send-email-koen@openembedded.org>
	<1304337015.3949.62.camel@mattotaupa>
Date: Sat, 07 May 2011 00:00:45 +0200
Message-ID: <1304719245.3928.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Recipe for docbook-xsl useful? (was: [PATCH] systemd: update to v26)
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
X-List-Received-Date: Fri, 06 May 2011 22:03:26 -0000
X-Groupsio-MsgNum: 31671
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SmBA1Y8mgif0j+yCXcpH"

--=-SmBA1Y8mgif0j+yCXcpH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Am Montag, den 02.05.2011, 13:50 +0200 schrieb Paul Menzel:

[=E2=80=A6]

> Anyway, using `angstrom-2010.x` for `MACHINE =3D "beagleboard"` fails wit=
h
> the following error message.
>=20
>         [=E2=80=A6]
>           CCLD   systemd-getty-generator
>           GEN    man/systemd.1
>         I/O error : Attempt to load network entity http://docbook.sourcef=
orge.net/release/xsl/current/manpages/docbook.xsl
>         warning: failed to load external entity "http://docbook.sourcefor=
ge.net/release/xsl/current/manpages/docbook.xsl"
>         cannot parse http://docbook.sourceforge.net/release/xsl/current/m=
anpages/docbook.xsl
>         make[1]: *** [man/systemd.1] Error 4
>         make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/=
work/armv7a-angstrom-linux-gnueabi/systemd-v26-r0/git'
>         make: *** [all] Error 2
>         + die 'oe_runmake failed'
>         + oefatal 'oe_runmake failed'
>         + echo FATAL: 'oe_runmake failed'
>         FATAL: oe_runmake failed
>         + exit 1

systemd depends on `docbook-xsl` to generate the manual pages. I do not
have that installed on my build system.

I found a recipe in `recipes/nonworking` [1] which dates back from the
import of the BitKeeper tree into Git and which has just `SRC_URI`
entries.

Basically these are just the XML/XSL files which need to be copied to
the correct location and somehow registered using `xmlcatalog`(?) from
`libxml2-utils`.

Has anyone of you tried to create a recipe for docbook-xsl or was it
considered not useful for the effort needed and therefore recommended to
install it locally on the build system?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/nonwork=
ing/docbook-xsl?id=3Def7114f6ac9145eb31639cc65dfdc7f3615ece9e

--=-SmBA1Y8mgif0j+yCXcpH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3Eb40ACgkQPX1aK2wOHVj31ACfXB5cscTmYcHh/ut8B+RvnxF9
Ht8Amwd7rqZ8bRWTqf14sugLveI+0mKz
=f7rs
-----END PGP SIGNATURE-----

--=-SmBA1Y8mgif0j+yCXcpH--
