Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PenWm-0002Jm-Jj for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 12:45:40 +0100
Received: from f053038247.adsl.alicedsl.de ([78.53.38.247]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PenWD-0000lv-Kc for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 11:45:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ih0tnm$ra$1@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>
	<1295220990.13967.18.camel@mattotaupa>
	<1295221434.13967.25.camel@mattotaupa>  <ih0tnm$ra$1@dough.gmane.org>
Date: Mon, 17 Jan 2011 12:45:04 +0100
Message-ID: <1295264704.4844.54.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 3/3 v2] libomxil-bellagio_git: add Git version
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
X-List-Received-Date: Mon, 17 Jan 2011 11:45:40 -0000
X-Groupsio-MsgNum: 28093
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-V14kzPP23DKY0GOE1Tod"

--=-V14kzPP23DKY0GOE1Tod
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 17 Jan 2011 00:15:51 +0100

The last release 0.9.2.1 is over a year old (2009-12-23).

Build tested with `angstrom-2008.1` for `MACHINE =3D "beagleboard"`. With `=
angstrom-2010.x` it fails with the following error.

        arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gn=
ueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dso=
ftfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I../.. -isystem/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/=
include -I../../include -I../../src -isystem/oe/build-angstrom-next/angstro=
m-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimi=
zations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -Wall -Werror -D=
CONFIG_DEBUG_LEVEL=3D0 -MT libomxbase_la-omx_base_component.lo -MD -MP -MF =
.deps/libomxbase_la-omx_base_component.Tpo -c omx_base_component.c  -fPIC -=
DPIC -o .libs/libomxbase_la-omx_base_component.o
        cc1: warnings being treated as errors
        omx_base_component.c: In function 'omx_base_component_GetParameter'=
:
        omx_base_component.c:991:3: error: case value '2130706435' not in e=
numerated type 'OMX_INDEXTYPE'
        omx_base_component.c:918:3: error: case value '2130706436' not in e=
numerated type 'OMX_INDEXTYPE'
        make[3]: *** [libomxbase_la-omx_base_component.lo] Error 1
        make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/libomxil-bellagio-0.9.2.1+gitr0+772f0eca88=
b242ffb5469e8e381c63ce1f7cd3e1-r7.0/git/src/base'

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Am Montag, den 17.01.2011, 09:13 +0100 schrieb Koen Kooi:
> On 17-01-11 00:43, Paul Menzel wrote:

[=E2=80=A6]

> > 1. I hope the package numbering is correctly. I used the Freesmartphone=
 packages as an example.
> > 2. Is a `DP =3D "-1"` needed? Users of this recipe speak up please!
>=20
> > +SRCREV =3D "772f0eca88b242ffb5469e8e381c63ce1f7cd3e1"
> > +SRC_URI =3D "git://omxil.git.sourceforge.net/gitroot/omxil/omxil;proto=
col=3Dgit"
> > +PV =3D "0.9.2.1+gitr${SRCPV}"
> > +PR =3D "${INC_PR}.0"
>=20
> For get recipes we generally do:
>=20
> PR_append =3D "+gitr${SRCPV}" to keep the ugly hash out of PV, but keep i=
t
> available to the users

Should the manual be a updated then [1]?


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/usermanual.html#id536032
---
 recipes/openmax/libomxil-bellagio_git.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openmax/libomxil-bellagio_git.bb

diff --git a/recipes/openmax/libomxil-bellagio_git.bb b/recipes/openmax/lib=
omxil-bellagio_git.bb
new file mode 100644
index 0000000..4e28251
--- /dev/null
+++ b/recipes/openmax/libomxil-bellagio_git.bb
@@ -0,0 +1,11 @@
+require ${PN}.inc
+
+PR =3D "${INC_PR}.0"
+
+SRCREV =3D "772f0eca88b242ffb5469e8e381c63ce1f7cd3e1"
+SRC_URI =3D "git://omxil.git.sourceforge.net/gitroot/omxil/omxil;protocol=
=3Dgit"
+PV =3D "0.9.2.1"
+PR =3D "${INC_PR}.0"
+PR_append =3D "+gitr${SRCPV}"
+
+S =3D "${WORKDIR}/git"
--=20
1.7.2.3

--=-V14kzPP23DKY0GOE1Tod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk00K8AACgkQPX1aK2wOHVg0UQCbBvLrCfMwno2heAK75dYQOa97
ZBwAnRVHE1yQp0wdZ+MhFe5Y3dWiCDEy
=3P0f
-----END PGP SIGNATURE-----

--=-V14kzPP23DKY0GOE1Tod--
