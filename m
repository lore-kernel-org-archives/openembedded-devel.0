Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGsiX-0004T9-DR for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 14:59:13 +0200
Received: from f053036031.adsl.alicedsl.de ([78.53.36.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGsh0-0006aF-63 for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 12:57:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304337015.3949.62.camel@mattotaupa>
References: <1304324573-31754-1-git-send-email-koen@openembedded.org>
	<1304337015.3949.62.camel@mattotaupa>
Date: Mon, 02 May 2011 14:56:37 +0200
Message-ID: <1304340997.3949.64.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] systemd: update to v26
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
X-List-Received-Date: Mon, 02 May 2011 12:59:13 -0000
X-Groupsio-MsgNum: 31560
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WHcerVAP0BmhjmBDqsOX"

--=-WHcerVAP0BmhjmBDqsOX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 02.05.2011, 13:50 +0200 schrieb Paul Menzel:
> Am Montag, den 02.05.2011, 10:22 +0200 schrieb Koen Kooi:
> > Signed-off-by: Koen Kooi <koen@openembedded.org>
> > ---
> >  recipes/systemd/files/disable_xml_generation.patch |   36 --------
> >  recipes/systemd/files/execute.patch                |   17 ----
> >  recipes/systemd/files/getty-serial@.service        |   19 ----
> >  recipes/systemd/files/replace_accpet4.patch        |   26 ------
> >  recipes/systemd/files/systemadm.patch              |   13 ---
> >  ...-disable-xml-file-stuff-and-introspection.patch |   93 ++++++++++++=
++++++++
> >  recipes/systemd/systemd-v26/execute.patch          |   17 ++++
> >  recipes/systemd/systemd-v26/getty-serial@.service  |   19 ++++
> >  recipes/systemd/systemd-v26/replace_accpet4.patch  |   26 ++++++
> >  recipes/systemd/systemd-v26/systemadm.patch        |   13 +++
> >  recipes/systemd/systemd_git.bb                     |   26 ++++--
> >  11 files changed, 185 insertions(+), 120 deletions(-)
> >  delete mode 100644 recipes/systemd/files/disable_xml_generation.patch
> >  delete mode 100644 recipes/systemd/files/execute.patch
> >  delete mode 100644 recipes/systemd/files/getty-serial@.service
> >  delete mode 100644 recipes/systemd/files/replace_accpet4.patch
> >  delete mode 100644 recipes/systemd/files/systemadm.patch
> >  create mode 100644 recipes/systemd/systemd-v26/0001-systemd-disable-xm=
l-file-stuff-and-introspection.patch
> >  create mode 100644 recipes/systemd/systemd-v26/execute.patch
> >  create mode 100644 recipes/systemd/systemd-v26/getty-serial@.service
> >  create mode 100644 recipes/systemd/systemd-v26/replace_accpet4.patch
> >  create mode 100644 recipes/systemd/systemd-v26/systemadm.patch
>=20
> `git log --stat -M -C -C` makes the diff lock much more daunting.
>=20
> [=E2=80=A6]
>=20
> > --- /dev/null
> > +++ b/recipes/systemd/systemd-v26/systemadm.patch
> > @@ -0,0 +1,13 @@
> > +Index: git/src/systemadm.vala
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/src/systemadm.vala	2010-06-15 11:02:35.863509632 +0200
> > ++++ git/src/systemadm.vala	2010-06-15 11:06:16.305986249 +0200
> > +@@ -297,7 +297,7 @@
> > +=20
> > +                 bbox.pack_start(cancel_button, false, true, 0);
> > +=20
> > +-                bus =3D Bus.get(session ? BusType.SESSION : BusType.S=
YSTEM);
> > ++                bus =3D DBus.Bus.get(session ? DBus.BusType.SESSION :=
 DBus.BusType.SYSTEM);
> > +=20
> > +                 manager =3D bus.get_object(
> > +                                 "org.freedesktop.systemd1",
> > diff --git a/recipes/systemd/systemd_git.bb b/recipes/systemd/systemd_g=
it.bb
> > index 5f98e54..7634b22 100644
> > --- a/recipes/systemd/systemd_git.bb
> > +++ b/recipes/systemd/systemd_git.bb

Thinking about it, should not this be named `system_26.bb` to avoid
confusion?

> > @@ -1,48 +1,56 @@
> >  DESCRIPTION =3D "Systemd a init replacement"
> >  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> > -LICENSE =3D "GPL"
> > +LICENSE =3D "GPLv2+
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> > +
> >  DEPENDS =3D "readline udev dbus libcap2 libcgroup gtk+"

`gtk+` should be removed. Actually I would prefer a separate patch
including disabling it.

> >  PRIORITY =3D "optional"
> >  SECTION =3D "base/shell"
> > =20
> > -PV =3D "0.0"
> > -PR_append =3D "+${SRCPV}"
> > +PV =3D "v26"
> > +#PR_append =3D "+${SRCPV}"
>=20
> Remove the commented line.
> =20
> >  inherit autotools vala
> > =20
> > -TAG =3D "1ebdf2d8793181f31b766b8342391aa1978f9917"
> > +TAG =3D "${PV}"
> > =20
> >  SRC_URI =3D "git://anongit.freedesktop.org/systemd;protocol=3Dgit;tag=
=3D${TAG} \
> >             file://execute.patch \
> > -           file://systemadm.patch \
> > -           file://disable_xml_generation.patch \
> > +#           file://systemadm.patch \
>=20
> Maybe a comment in the recipe or the commit message would be nice, why
> this is commented. Could it be needed in the future?
>=20
> > +           file://0001-systemd-disable-xml-file-stuff-and-introspectio=
n.patch \
> >             file://replace_accpet4.patch \
> >             file://getty-serial@.service \
> >            "
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> > +# The gtk+ tools should get built as a seperate recipe e.g. systemd-to=
ols
>=20
> s/seperate/separate/
>=20
> =E2=80=A6 to not force people to build all gtk+ packages/recipes.
>=20
> >  EXTRA_OECONF =3D " --with-distro=3Ddebian \
> >                   --with-rootdir=3D${base_prefix} \
> > +                 --disable-gtk \
> >                 "
> > =20
> > -PACKAGES =3D "${PN} ${PN}-gui ${PN}-dbg ${PN}-doc"
> > +PACKAGES =3D+ "${PN}-gui"
> > =20
> >  FILES_${PN}-gui =3D "${bindir}/systemadm"
> > =20
> >  FILES_${PN} =3D " ${base_bindir}/* \
> >                  ${datadir}/dbus-1/services \
> >                  ${datadir}/dbus-1/system-services \
> > +                ${datadir}/polkit-1 \
> >                  ${datadir}/${PN} \
> >                  ${sysconfdir} \
> >                  ${base_libdir}/systemd/* \
> >                  ${base_libdir}/systemd/system/* \
> >                  ${base_libdir}/udev/rules.d \
> > +                ${base_libdir}/security/*.so \
> >                  /cgroup \
> > -                ${bindir}/systemd-install \
> > +                ${bindir}/systemd* \
> > +                ${libdir}/tmpfiles.d/*.conf \
> > +                ${libdir}/systemd \
> >                 "
> > =20
> > -FILES_${PN}-dbg +=3D " /lib/systemd/.debug "
> > +FILES_${PN}-dbg +=3D "${base_libdir}/systemd/.debug ${base_libdir}/sys=
temd/*/.debug"
> > =20
> >  def get_baudrate(bb, d):
> >      return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
>=20
> A split in two commits to fix/improve the recipe and to update to v26
> would have been nice.
>=20
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
>=20
> Please find `log.do_compile` attached.


Thanks,

Paul

--=-WHcerVAP0BmhjmBDqsOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2+qgUACgkQPX1aK2wOHVgNgwCeKtAJXVTcInKZxW4KJ2Ryb+lQ
cjIAnjceUZUAVJYeImDzDah/ipo4LccZ
=2mOm
-----END PGP SIGNATURE-----

--=-WHcerVAP0BmhjmBDqsOX--
