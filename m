Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RIFci-00052f-Gh for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 10:11:08 +0200
Received: from f053042016.adsl.alicedsl.de ([78.53.42.16]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RIFX0-0006an-HT for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 08:05:14 +0000
Message-ID: <1319443507.3844.9.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 10:05:07 +0200
In-Reply-To: <1319427652-9401-1-git-send-email-joelagnel@ti.com>
References: <1319427652-9401-1-git-send-email-joelagnel@ti.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH meta-oe] memtester: Import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 08:11:08 -0000
X-Groupsio-MsgNum: 34992
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-lzKalxCJHXfiiaWjzFJA"

--=-lzKalxCJHXfiiaWjzFJA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Koen,


could you please wait at least a day until merging the patches to get
time for proper review.


Am Sonntag, den 23.10.2011, 22:40 -0500 schrieb Joel A Fernandes:

Joel, when importing recipes please add the corresponding commit ID too
as required by the commit guide lines [1].

> Added LIC_FILES_CHKSUM
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> This package is required by the beaglebone-tester
>=20
>  .../memtester/files/Makefile.patch                 |   15 +++++++++++
>  .../recipes-benchmark/memtester/memtester_4.1.3.bb |   27 ++++++++++++++=
++++++
>  2 files changed, 42 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/memtester/files/Makefile.pa=
tch
>  create mode 100644 meta-oe/recipes-benchmark/memtester/memtester_4.1.3.b=
b
>=20
> diff --git a/meta-oe/recipes-benchmark/memtester/files/Makefile.patch b/m=
eta-oe/recipes-benchmark/memtester/files/Makefile.patch
> new file mode 100644
> index 0000000..57a0464
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch

Please add a patch header.

> @@ -0,0 +1,15 @@
> +Index: memtester-4.0.5/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- memtester-4.0.5.orig/Makefile	2005-03-14 06:02:30.000000000 -0800
> ++++ memtester-4.0.5/Makefile	2006-07-08 23:53:42.000000000 -0700
> +@@ -24,8 +24,8 @@
> + auto-ccld.sh: \
> + conf-cc conf-ld warn-auto.sh
> + 	( cat warn-auto.sh; \
> +-	echo CC=3D\'`head -1 conf-cc`\'; \
> +-	echo LD=3D\'`head -1 conf-ld`\' \
> ++	echo CC=3D\'`head -n 1 conf-cc`\'; \
> ++	echo LD=3D\'`head -n 1 conf-ld`\' \
> + 	) > auto-ccld.sh
> +=20
> + compile: \
> diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb b/met=
a-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
> new file mode 100644
> index 0000000..9f4e53e
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
> @@ -0,0 +1,27 @@
> +SECTION =3D "console/utils"
> +DESCRIPTION =3D "Utility to test for faulty memory subsystem"
> +LICENSE =3D "GPLv2"

The ordering is wrong and the field `HOMEPAGE` is missing [3].

> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +SRC_URI =3D "http://pyropus.ca/software/memtester/old-versions/memtester=
-${PV}.tar.gz"
> +SRC_URI +=3D "file://Makefile.patch"
> +
> +SRC_URI[md5sum] =3D "e562451620cf5343016950462bc0dc38"
> +SRC_URI[sha256sum] =3D "ac56f0b6d6d6e58bcf2a3fa7f2c9b29894f5177871f21115=
a1906c535106acf6"
> +
> +S =3D "${WORKDIR}/memtester-${PV}"

This is the default.

> +
> +do_compile () {
> +	echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
> +	echo '${CC} ${LDFLAGS}' > conf-ld
> +	oe_runmake
> +}
> +
> +do_install () {
> +	install -d ${D}${bindir}
> +	install -d ${D}${mandir}/man8
> +	install -m 0755 memtester ${D}${bindir}/
> +	install -m 0755 memtester.8 ${D}${mandir}/man8/
> +}
> +

No empty line at the end is needed.

I fixed some of the above in OE classic. Please fix the issues mentioned
above in meta-oe with follow-up patches.


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Import=
ing_from_Elsewhere
[2] http://git.openembedded.org/openembedded/tree/recipes/memtester?id=3D07=
e215db9870db1a0f88edb328024781eb9ac852
[3] http://wiki.openembedded.org/index.php/Styleguide

--=-lzKalxCJHXfiiaWjzFJA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6lHDMACgkQPX1aK2wOHVgYwQCgiJL5SPHkbv9aZ+9ku72FXvEa
QWQAnRzDaspextfn9Y0QHRew0Eb4SEar
=9VuI
-----END PGP SIGNATURE-----

--=-lzKalxCJHXfiiaWjzFJA--
