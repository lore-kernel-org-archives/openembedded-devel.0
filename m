Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtGnS-0007pk-RP for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 12:22:58 +0200
Received: from f053034117.adsl.alicedsl.de ([78.53.34.117]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtGj4-0008I2-Sd for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:18:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <60b4ca603b29e478e513eed68bacfaa22b2b223e.1313486613.git.anders@chargestorm.se>
References: <cover.1313486613.git.anders@chargestorm.se>
	<60b4ca603b29e478e513eed68bacfaa22b2b223e.1313486613.git.anders@chargestorm.se>
Date: Tue, 16 Aug 2011 12:18:22 +0200
Message-ID: <1313489902.3496.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 1/2] ckermit: import from OE rev 84812c64e7146d75004b3eeecae22b6d1118c1fb
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
X-List-Received-Date: Tue, 16 Aug 2011 10:22:58 -0000
X-Groupsio-MsgNum: 33617
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DkF7a8vtTEKp/VvPDdLO"

--=-DkF7a8vtTEKp/VvPDdLO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Anders,


Am Dienstag, den 16.08.2011, 11:24 +0200 schrieb Anders Darander:
> Adding LIC_FILES_CHKSUM, otherwise it is identical to the oe version.

I always would like to see people adding their build/test configuration
to the commit summary so that people can reproduce this when having
problems.

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-support/ckermit/ckermit_211.bb |   98 ++++++++++++++++++=
++++++
>  1 files changed, 98 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/ckermit/ckermit_211.bb
>=20
> diff --git a/meta-oe/recipes-support/ckermit/ckermit_211.bb b/meta-oe/rec=
ipes-support/ckermit/ckermit_211.bb
> new file mode 100644
> index 0000000..86330d3
> --- /dev/null
> +++ b/meta-oe/recipes-support/ckermit/ckermit_211.bb
> @@ -0,0 +1,98 @@
> +DESCRIPTION =3D "C-Kermit is a combined serial and network communication=
 \
> +software package offering a consistent, medium-independent, \
> +cross-platform approach to connection establishment, terminal \
> +sessions, file transfer, character-set translation, and automation \
> +of communication tasks."
> +LICENSE =3D "Kermit"
> +LIC_FILES_CHKSUM =3D "file://COPYING.TXT;md5=3D17dabbd2543933464b6d32083=
c3a3596"
> +HOMEPAGE =3D "http://www.columbia.edu/kermit/"
> +SECTION =3D "console/network"

Please order the variables according to the style guide [1][2].

> +SRC_URI =3D "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;s=
ubdir=3D${BPN}-${PV}"
> +PR =3D "r3"

Please start with "r0" when importing recipes.

> +
> +#
> +# From http://www.columbia.edu/kermit/ck80.html#license
> +#
> +#	"Free Unix Distributions: C-Kermit may be included in "free Unix"
> +#	distributions such as GNU/Linux, FreeBSD, NetBSD, and OpenBSD. See the
> +#	license for details."
> +#
> +# A distributions based on OpenEmbedded (OpenZaurus, OpenSimpad etc) is =
a
> +# "free Unix" distribution, therefore we can include the package.
> +#
> +#
> +# Please note that the license is not 100% because it limits what you ca=
n
> +# do:
> +#
> +#	"The C-Kermit source code may not be changed without the consent of
> +#	the Kermit Project, which will not be unreasonably withheld (this is
> +#	simply a matter of keeping a consistent and supportable code base)."
> +#
> +# But we don't change the source code in any way, so we comply to the li=
cense.
> +# So, essentially for us C-Kermit is free as in beer, but not in freedom=
.
> +#
> +# That is true for other distros. C-Kkermit is distributed by:
> +#
> +#	Debian:	http://packages.debian.org/unstable/comm/ckermit
> +#	Gentoo: http://mirror.pudas.net/gentoo-x86-portage/app-misc/ckermit/ck=
ermit-8.0.211.ebuild
> +#	SuSE: http://www.novell.com/products/linuxpackages/enterpriseserver/s3=
90/ckermit.html
> +#	Fedora Core: http://cvs.fedora.redhat.com/viewcvs/devel/ckermit/
> +#	PLD: http://cvs.pld.org.pl/SPECS/ckermit.spec
> +#
> +# and, according to the Kermit website http://www.columbia.edu/kermit/ck=
80.html also with
> +#
> +#	Red Hat 9 (on earlier Red Hat's it was on the PowerTools CD)
> +#	HP-UX
> +#	FreeBSD
> +#	NetBSD
> +#	OpenBSD
> +#
> +# ... and probably other distro's as well.
> +#

I fixed some typos and committed the patch to oe.dev [3].

[=E2=80=A6]


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Styleguide
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/recipes/ckerm=
it/ckermit_211.bb?id=3D9a13ec3a5b1dfc0100fbe1a7716db4ceaff6df7a
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/recipes/ckerm=
it/ckermit_211.bb?id=3D5350bbef01b8979617e3d0fd38939f94f1fa5315

--=-DkF7a8vtTEKp/VvPDdLO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5KQ+4ACgkQPX1aK2wOHVgFfACbB1FNn3RuJUmhCcgLgPBFMy/M
yPgAn30v7+jGtioDrffePPE8Q7Sp2hzS
=WyZ8
-----END PGP SIGNATURE-----

--=-DkF7a8vtTEKp/VvPDdLO--
