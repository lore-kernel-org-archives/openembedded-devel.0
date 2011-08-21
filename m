Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qv3In-0007Na-2h for openembedded-devel@lists.openembedded.org;
	Sun, 21 Aug 2011 10:22:41 +0200
Received: from f053036105.adsl.alicedsl.de ([78.53.36.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qv3EU-00012s-F1 for openembedded-devel@lists.openembedded.org;
	Sun, 21 Aug 2011 08:18:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313913636-31667-1-git-send-email-dbaryshkov@gmail.com>
References: <1313913636-31667-1-git-send-email-dbaryshkov@gmail.com>
Date: Sun, 21 Aug 2011 10:17:58 +0200
Message-ID: <1313914678.4583.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-gnome 1/2] gnome-disk-utility: disable scrollkeeper
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
X-List-Received-Date: Sun, 21 Aug 2011 08:22:41 -0000
X-Groupsio-MsgNum: 33747
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-M/iMpw67k5ElG9HwnZ6H"

--=-M/iMpw67k5ElG9HwnZ6H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dmitry,


Am Sonntag, den 21.08.2011, 12:00 +0400 schrieb Dmitry Eremin-Solenikov:
> scrollkeeper isn't packaged neither in oe.dev, nor in any oe-core based
> layer. Disable scrollkeeper in gnome-disk-utils.
>=20
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../gnome-disk-utility/disable-scrollkeeper.patch  |   27 ++++++++++++++=
++++++
>  .../gnome-disk-utility_2.32.0.bb                   |    6 ++++
>  2 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-dis=
k-utility/disable-scrollkeeper.patch
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty/disable-scrollkeeper.patch b/meta-gnome/recipes-gnome/gnome-disk-utility=
/gnome-disk-utility/disable-scrollkeeper.patch
> new file mode 100644
> index 0000000..ccc6f6a
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/disa=
ble-scrollkeeper.patch
> @@ -0,0 +1,27 @@
> +From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +Subject: Disable scrollkeeper-config not found message
> +Upstream-Status: Not-Applicable
> +
> +If scrollkeeper-config isn't found, configure fails with an error.
> +Fix that by commenting out the check.
> +
> +Signed-Off-By: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +
> +
> +Index: gnome-disk-utility-2.32.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnome-disk-utility-2.32.0.orig/configure.ac	2010-09-15 19:07:25.0000=
00000 +0400
> ++++ gnome-disk-utility-2.32.0/configure.ac	2011-08-20 01:29:48.000000000=
 +0400
> +@@ -188,9 +188,9 @@
> + # *************
> +=20
> + AC_PATH_PROG(SCROLLKEEPER_CONFIG, scrollkeeper-config,no)
> +-if test x$SCROLLKEEPER_CONFIG =3D xno; then
> +-  AC_MSG_ERROR(Couldn't find scrollkeeper-config, please install the sc=
rollkeeper package)
> +-fi
> ++dnl if test x$SCROLLKEEPER_CONFIG =3D xno; then
> ++dnl  AC_MSG_ERROR([Couldn't find scrollkeeper-config, please install th=
e scrollkeeper package])
> ++dnl fi

is changing the error to a warning a better alternative and send it
upstream [1]?

> +=20
> + # ********************
> + # Internationalization
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb
> index e8069e9..f7945c5 100644
> --- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
.0.bb
> @@ -9,5 +9,11 @@ inherit gnome
>  SRC_URI[archive.md5sum] =3D "f0366c8baebca0404d190b2d78f3582d"
>  SRC_URI[archive.sha256sum] =3D "03e461b6bda7f773f8018d25fa3213d3073d4dc8=
3a76e6b39d962652f4de6a98"
> =20
> +SRC_URI +=3D "\
> +     file://disable-scrollkeeper.patch \
> +     "
> +
> +EXTRA_OECONF +=3D "--disable-scrollkeeper"
> +
>  PACKAGES =3D+ "${PN}-nautilus-extension"
>  FILES_${PN}-nautilus-extension +=3D "${libdir}/nautilus/extensions-2.0/*=
.so"

I guess increasing `PR` is necessary for this.

Please resend the patch (`--subject-prefix=3D"PATCH v2"` [2]).


Thanks,

Paul


[1] http://www.gnu.org/software/hello/manual/autoconf/Printing-Messages.htm=
l
[2] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded=
#Create_and_Commit_your_patch

--=-M/iMpw67k5ElG9HwnZ6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5QvzYACgkQPX1aK2wOHVg4BQCeMcT+/V0UXVXysZFJz7s+wTUD
xDQAnirjG+U7o9Ss1b7qk8WWpZZ3RsKC
=iwKI
-----END PGP SIGNATURE-----

--=-M/iMpw67k5ElG9HwnZ6H--
