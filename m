Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qs9Z1-0002lu-Ug for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 10:27:29 +0200
Received: from f053039208.adsl.alicedsl.de ([78.53.39.208]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qs9Uq-000248-4Q for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 08:23:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313190057-17104-1-git-send-email-schnitzeltony@gmx.de>
References: <1313190057-17104-1-git-send-email-schnitzeltony@gmx.de>
Date: Sat, 13 Aug 2011 10:22:53 +0200
Message-ID: <1313223773.3493.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-xfce] xfce4-screenshooter: Add new recipe
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
X-List-Received-Date: Sat, 13 Aug 2011 08:27:29 -0000
X-Groupsio-MsgNum: 33589
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hDUj2sjLpT+o1lr+evIZ"

--=-hDUj2sjLpT+o1lr+evIZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 13.08.2011, 01:00 +0200 schrieb Andreas Mueller:

To be consistent with your other commits this should be

	Add initial recipe with version 1.8.0

although =C2=BB=E2=80=A6 recipe for version =E2=80=A6=C2=AB is better as fa=
r as I know.

> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  .../xfce4-screenshooter_1.8.0.bb                   |   18 ++++++++++++++=
++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-scre=
enshooter_1.8.0.bb
>=20
> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.8.0.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoote=
r_1.8.0.bb
> new file mode 100644
> index 0000000..9b008c3
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.=
0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "An application to take screenshots"

=C2=BBAn=C2=AB can be left out.

Please add the following fields.

        HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-s=
creenshooter"
        SECTION =3D "x11/application"


> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599=
855"
> +DEPENDS =3D "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.=
0 libsoup-2.4 exo libxfixes xext virtual/libx11"
> +
> +PR =3D "r0"
> +
> +inherit xfce
> +
> +# SRC_URI must follow inherited one
> +SRC_URI =3D "http://archive.xfce.org/src/apps/${PN}//${@'${PV}'[0:3]}/${=
PN}-${PV}.tar.bz2 \
> +"

Maybe add an example URL as a comment, so that people not familiar with
regular expression know what is done here.

> +
> +FILES_${PN} +=3D "${datadir}/xfce4/panel-plugins/*"
> +FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug"
> +
> +SRC_URI[md5sum] =3D "b51ab5725418e7258273c4a6402adb02"
> +SRC_URI[sha256sum] =3D "68748a42ae68c5a8e9ed1c14ec5c741a344ab30b5b325b88=
12220539548ad83e"

I would put the checksums right below the other `SRC_URI` fields, but
your other recipes seem to use put it at the end too.

You can put

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

to the iteration with these comments addressed.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Styleguide

--=-hDUj2sjLpT+o1lr+evIZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5GNF0ACgkQPX1aK2wOHVjvCACeP7hCM3Ah0dPBT3jRmGZrnoeN
r44AnR5Lwu97Lc+LvhsXA8wZqfhYou1j
=YSee
-----END PGP SIGNATURE-----

--=-hDUj2sjLpT+o1lr+evIZ--
