Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RQ2W6-0006qo-Bv for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 20:48:30 +0100
Received: from f053043055.adsl.alicedsl.de ([78.53.43.55]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RQ2Pz-0003yh-Eh for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 19:42:11 +0000
Message-ID: <1321299729.3580.17.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 20:42:09 +0100
In-Reply-To: <1321283862-3579-1-git-send-email-todd.kempel@gmail.com>
References: <1321283862-3579-1-git-send-email-todd.kempel@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH v2] batctl: Add version 2011.3.0 (initial recipe)
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
X-List-Received-Date: Mon, 14 Nov 2011 19:48:30 -0000
X-Groupsio-MsgNum: 35392
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-NXP5CBvNZY1/SqHlaS5w"

--=-NXP5CBvNZY1/SqHlaS5w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Todd,


thank you for the follow up.

Am Montag, den 14.11.2011, 09:17 -0600 schrieb Todd Kempel:
> * batmand is included in the current OE repository but is not being activ=
ely maintained.
>   The batman-adv kernel module is a replacement for batmand and requires =
batctl for operation.

Is batmand still useful? If yes, could you do a clean up?

>   Recipe has been tested and binary found fully operational using Angstro=
m on gumstix board.
>=20
> Signed-off-by: Todd Kempel <todd.kempel@gmail.com>
> ---
>  recipes/batctl/batctl.inc         |   20 ++++++++++++++++++++
>  recipes/batctl/batctl_2011.3.0.bb |    6 ++++++
>  2 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/batctl/batctl.inc
>  create mode 100644 recipes/batctl/batctl_2011.3.0.bb
>=20
> diff --git a/recipes/batctl/batctl.inc b/recipes/batctl/batctl.inc
> new file mode 100644
> index 0000000..75bb62f
> --- /dev/null
> +++ b/recipes/batctl/batctl.inc
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Control application for B.A.T.M.A.N. routing protocol k=
ernel module for multi-hop ad-hoc mesh networks."
> +HOMEPAGE =3D "http://www.open-mesh.net/"
> +SECTION =3D "console/network"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"

I corrected the license field.

/*
 * Copyright (C) 2007-2011 B.A.T.M.A.N. contributors:
 *
 * Andreas Langer <an.langer@gmx.de>, Marek Lindner <lindner_marek@yahoo.de=
>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA
 *
 */

> +
> +INC_PR =3D "r0"
> +
> +RDEPENDS_${PN} =3D "kernel-module-batman-adv"
> +
> +SRC_URI =3D "http://downloads.open-mesh.net/batman/stable/sources/batctl=
/batctl-${PV}.tar.gz"
> +
> +do_compile() {
> +  oe_runmake
> +}
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -m 0755 batctl ${D}${bindir}
> +}
> diff --git a/recipes/batctl/batctl_2011.3.0.bb b/recipes/batctl/batctl_20=
11.3.0.bb
> new file mode 100644
> index 0000000..97d8e17
> --- /dev/null
> +++ b/recipes/batctl/batctl_2011.3.0.bb
> @@ -0,0 +1,6 @@
> +require batctl.inc
> +PR =3D "${INC_PR}.0"
> +
> +
> +SRC_URI[md5sum] =3D "8eb197896049bb04a6beef56015a16b6"
> +SRC_URI[sha256sum] =3D "94922fd167d2bca5193cc7465bfc212c2c3595da70e65350=
6493dfc65e4410fb"

I pushed this as ee6171ae [1]. Could you please update the state in the
patch queue [2].

Otherwise please note that OE-core and meta-oe get the most development
today. It would be great if you could also submit your recipe for
inclusion in meta-oe.


Thanks,

Paul


[1] http://git.openembedded.org/openembedded/commit/?id=3Dee6171aee5f69f079=
bf87dd143f80899bddd6755
[2] http://www.openembedded.org/wiki/Patchwork

--=-NXP5CBvNZY1/SqHlaS5w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7BbxEACgkQPX1aK2wOHViPUACfb2g1ECvZhN0/gzWZ0ZydOW5u
mnQAnjtOm0BeQgiwhfek3ElVvE7oQQO1
=040A
-----END PGP SIGNATURE-----

--=-NXP5CBvNZY1/SqHlaS5w--
