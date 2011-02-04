Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PlMI7-0001Bl-G9 for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 15:05:39 +0100
Received: from f053034071.adsl.alicedsl.de ([78.53.34.71]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PlMHD-0006eh-Tr for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 14:04:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1296324303.5925.26.camel@mattotaupa>
References: <1296324303.5925.26.camel@mattotaupa>
Date: Fri, 04 Feb 2011 15:04:43 +0100
Message-ID: <1296828283.3967.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] xbmc: add `gperf-native` to `DEPENDS`
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
X-List-Received-Date: Fri, 04 Feb 2011 14:05:39 -0000
X-Groupsio-MsgNum: 28815
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gF2woh6VADzo2a6ha0Re"

--=-gF2woh6VADzo2a6ha0Re
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 29.01.2011, 19:05 +0100 schrieb Paul Menzel:
> Date: Mon Jan 24 08:19:04 2011 +0100
>=20
> Task `configure` fails otherwise with the following error.
>=20
>     configure: =3D=3D VDADecoder support manually disabled. =3D=3D
>     checking OpenMAX/il/OMX_Types.h usability... no
>     checking OpenMAX/il/OMX_Types.h presence... no
>     checking for OpenMAX/il/OMX_Types.h... no
>     =3D=3D Could not find libnvomx. OpenMax support disabled. =3D=3D
>     checking for gawk... yes
>     checking for cmake... yes
>     checking for gperf... no
>     configure: error: Could not find a required program. Please see the R=
EADME f
>     ERROR: Function do_configure failed
>=20
> This patch is build tested with `angstrom-2008.1` for `MACHINE =3D "beagl=
eboard"`.
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Could someone please commit and push this patch [1].


Thanks,

Paul


[1] http://patches.openembedded.org/patch/403/

> ---
>  recipes/xbmc/xbmc_svn.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
> index 3689715..be2e34e 100644
> --- a/recipes/xbmc/xbmc_svn.bb
> +++ b/recipes/xbmc/xbmc_svn.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "XBMC Media Center"
>  LICENSE =3D "xbmc"
> =20
> -DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python=
 libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-m=
ixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enc=
a avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl j=
asper zip-native zlib"
> +DEPENDS =3D "gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfi=
g curl python libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-i=
mage libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre b=
oost lzo2 enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 vir=
tual/libsdl jasper zip-native zlib"
>  require recipes/egl/egl.inc
> =20
>  SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"

--=-gF2woh6VADzo2a6ha0Re
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1MB3sACgkQPX1aK2wOHVh7ywCfa6K79yeUyBEUdZqDa0kMNEol
xoAAnj1183Wsla3YU62Wmbv9hQc7BRLf
=MdPV
-----END PGP SIGNATURE-----

--=-gF2woh6VADzo2a6ha0Re--
