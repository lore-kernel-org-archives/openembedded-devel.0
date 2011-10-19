Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGdOr-0000PU-2s for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 23:10:09 +0200
Received: from f053042198.adsl.alicedsl.de ([78.53.42.198]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGdJK-0006Qb-GA for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 21:04:26 +0000
Message-ID: <1319058258.12686.14.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2011 23:04:18 +0200
In-Reply-To: <790990daa702e1ca0c4688b0c45d2fd95c4ed0eb.1319038482.git.otavio@ossystems.com.br>
References: <cover.1319038482.git.otavio@ossystems.com.br>
	<790990daa702e1ca0c4688b0c45d2fd95c4ed0eb.1319038482.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] udev: udev-systemd refactory
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
X-List-Received-Date: Wed, 19 Oct 2011 21:10:09 -0000
X-Groupsio-MsgNum: 34912
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-B2hmgF9XpV9Q2hh3QSB/"

--=-B2hmgF9XpV9Q2hh3QSB/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Otavio,


Am Mittwoch, den 19.10.2011, 15:35 +0000 schrieb Otavio Salvador:

your Signed-off-by line is missing. Additionally please describe your
changes in the commit message [1].

In this case

    udev_173: Package all systemd files in udev-systemd

should be good.

Is that change just cosmetic or does it yield a (big?) size reduction of
package `udev`?

> ---
>  meta-oe/recipes-core/udev/udev_173.bb |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core=
/udev/udev_173.bb
> index 56ebb77..e4e634a 100644
> --- a/meta-oe/recipes-core/udev/udev_173.bb
> +++ b/meta-oe/recipes-core/udev/udev_173.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe \
>  # Needed for udev-extras
>  DEPENDS =3D "gperf-native usbutils acl glib-2.0"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  # version specific SRC_URI
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.t=
ar.gz \
> @@ -61,7 +61,8 @@ INITSCRIPT_PARAMS =3D "start 04 S ."
> =20
>  PACKAGES =3D+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit=
"
> =20
> -FILES_${PN}-systemd =3D "${base_libdir}/systemd/system/"
> +FILES_${PN}-systemd =3D "${base_libdir}/systemd"
> +RDEPENDS_${PN}-systemd +=3D "udev"
> =20
>  FILES_libudev =3D "${base_libdir}/libudev.so.*"
>  FILES_libgudev =3D "${base_libdir}/libgudev*.so.*"
> @@ -82,9 +83,6 @@ FILES_${PN}-dbg +=3D "/lib/udev/.debug"
>  FILES_${PN}-consolekit +=3D "${libdir}/ConsoleKit"
>  RDEPENDS_${PN}-consolekit +=3D "consolekit"
> =20
> -# Package up systemd files
> -FILES_${PN} +=3D "${base_libdir}/systemd"
> -
>  do_install () {
>  	install -d ${D}${usrsbindir} \
>  		   ${D}${sbindir}


Thanks,

Paul


[1] http://openembedded.org/wiki/Commit_Patch_Message_Guidelines

--=-B2hmgF9XpV9Q2hh3QSB/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6fO1IACgkQPX1aK2wOHVickQCbBzBL++Av4Zjiu8dUZhNsmLwU
s/oAn1AbCME21537h3PZhGHgVM3r11yh
=pLH9
-----END PGP SIGNATURE-----

--=-B2hmgF9XpV9Q2hh3QSB/--
