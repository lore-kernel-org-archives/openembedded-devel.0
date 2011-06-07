Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QTveq-0006g7-IA
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 14:45:20 +0200
Received: by bwz5 with SMTP id 5so4860453bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Rr7RGqApTxarK0CzHykKxqAGY0tx4beND47Jysm4bUo=;
	b=AO2YHeQto2vlyoVciCcHejWlYNosb6BoZouT/k+tGO0F2RUuzvoNQGxZTKwIr3e5ZS
	e159YYH5DDH0/DdAbjRIm9A/gW7UuhAzdZi8vMFN2PHNlVWeW5Pezmhotiq9t4I9yrC0
	sdKz4As4L5JYZ8p/7birt3TSiyjT2zcgnqOBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mFB/uJeItyUcqP7q90zGNAPvMIqhsVFZZFMI45cpFVbCO3MqTYCltuOvSu+qgEpqPK
	UY1URKzQ7m+9/RVUszyMEB6itHwvvVlvL6NGEdskBBSSRuGlt2G9q0QEwQCv1WNJjOx7
	9A5oc/Qa1dxXtTXZlNmR9+0jE6R4qv5U3cLnc=
Received: by 10.204.74.167 with SMTP id u39mr1575465bkj.144.1307450520060;
	Tue, 07 Jun 2011 05:42:00 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t23sm4135336bkf.16.2011.06.07.05.41.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 05:41:58 -0700 (PDT)
Date: Tue, 7 Jun 2011 14:41:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110607124151.GA23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
MIME-Version: 1.0
In-Reply-To: <1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 12:45:20 -0000
X-Groupsio-MsgNum: 32541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2011 at 02:13:32PM +0200, Guillaume Beraudo wrote:
> * included alsa_8khz patch to get audio out at 8KHz rate.
> * removed dependency on patches without explaination (all others).

Thanks for updating linphone, few comments will follow

the 2 patches in linphone-3.1.0 look self-explanatory, are they applied
upstream?

> Signed-off-by: Guillaume Beraudo <guillaume.beraudo@belledonne-communicat=
ions.com>
> ---
>  recipes/linphone/files/igep0020/alsa_8khz.patch |   13 ++++
>  recipes/linphone/linphone-common.inc            |   75 +++++++++++++++++=
++++++
>  recipes/linphone/linphone-common_3.4.3.inc      |   11 +++
>  recipes/linphone/linphone_3.4.3+nogtk.bb        |    9 +++
>  4 files changed, 108 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linphone/files/igep0020/alsa_8khz.patch
>  create mode 100644 recipes/linphone/linphone-common.inc
>  create mode 100644 recipes/linphone/linphone-common_3.4.3.inc
>  create mode 100644 recipes/linphone/linphone_3.4.3+nogtk.bb
>=20
> diff --git a/recipes/linphone/files/igep0020/alsa_8khz.patch b/recipes/li=
nphone/files/igep0020/alsa_8khz.patch
> new file mode 100644
> index 0000000..17774d4
> --- /dev/null
> +++ b/recipes/linphone/files/igep0020/alsa_8khz.patch
> @@ -0,0 +1,13 @@
> +--- linphone/mediastreamer2/src/alsa.c_orig	2011-05-24 12:39:33.82460010=
9 +0200
> ++++ linphone/mediastreamer2/src/alsa.c	2011-05-24 12:40:04.760407404 +02=
00
> +@@ -32,8 +32,8 @@
> + /*in case of troubles with a particular driver, try incrementing ALSA_P=
ERIOD_SIZE
> + to 512, 1024, 2048, 4096...
> + then try incrementing the number of periods*/
> +-#define ALSA_PERIODS 8
> +-#define ALSA_PERIOD_SIZE 256
> ++#define ALSA_PERIODS 4
> ++#define ALSA_PERIOD_SIZE 512
> +=20
> + /*uncomment the following line if you have problems with an alsa driver
> + having sound quality trouble:*/
> diff --git a/recipes/linphone/linphone-common.inc b/recipes/linphone/linp=
hone-common.inc
> new file mode 100644
> index 0000000..98e0288
> --- /dev/null
> +++ b/recipes/linphone/linphone-common.inc
> @@ -0,0 +1,75 @@
> +SECTION =3D "x11/network"
> +SECTION_liblinphone =3D "libs/network"
> +SECTION_libmediastreamer =3D "libs/network"
> +SECTION_libortp =3D "libs/network"
> +SECTION_linphonec =3D  "console/network"
> +
> +SRC_URI_append_igep0020 =3D " file://alsa_8khz.patch"
> +
> +DEPENDS =3D "intltool readline libosip2 libexosip2 speex alsa-lib"
> +DEPENDS_append_video =3D " libxv ffmpeg libv4l"
> +DEPENDS_append_gtk =3D " gtk+"
> +DEPENDS_${PN} =3D "intltool liblinphone"
> +DEPENDS_${PN}_append_gtk =3D " gtk+"
> +DEPENDS_${PN}_append_video =3D " libxv"
> +DEPENDS_${PN}c =3D "liblinphone readline"
> +DEPENDS_liblinphone =3D "libmediastreamer libortp libosip2 libexosip2"
> +DEPENDS_libmediastreamer =3D "speex alsa-lib libortp"
> +DEPENDS_libmediastreamer_append_video =3D " ffmpeg libv4l"
> +
> +PROVIDES =3D "linphonec liblinphone libmediastreamer libortp"
> +PROVIDES_gtk =3D "linphone linphonec liblinphone libmediastreamer libort=
p"
> +
> +inherit autotools pkgconfig gettext
> +
> +export PKG_CONFIG=3D${STAGING_BINDIR_NATIVE}/pkg-config
> +
> +
> +LINPHONE_OE_ENABLE_VIDEO =3D "--disable-video"
> +LINPHONE_OE_ENABLE_VIDEO_video =3D "--with-ffmpeg=3D${STAGING_DIR_HOST}$=
{layout_exec_prefix} --enable-video"
> +
> +LINPHONE_OE_ENABLE_CONSOLE_UI =3D "no"
> +LINPHONE_OE_ENABLE_CONSOLE_UI_console =3D "yes"
> +
> +LINPHONE_OE_ENABLE_GTK_UI =3D "no"
> +LINPHONE_OE_ENABLE_GTK_UI_gtk =3D "yes"
> +
> +do_install_append(){
> +	install -d ${D}${bindir}
> +	install -m 0755 ${S}/coreapi/.libs/test_ecc ${D}${bindir}/test_ecc
> +	install -m 0755 ${S}/coreapi/.libs/test_lsd ${D}${bindir}/test_lsd
> +}
> +
> +EXTRA_OECONF =3D " \
> +                ${LINPHONE_OE_ENABLE_VIDEO} \
> +                --enable-alsa \
> +                --with-osip=3D${STAGING_DIR_HOST}${layout_exec_prefix} \
> +                --with-readline=3D${STAGING_DIR_HOST}${layout_exec_prefi=
x} \
> +                --with-speex=3D${STAGING_DIR_HOST}${layout_exec_prefix} \
> +                --disable-manual \
> +		--enable-console_ui=3D${LINPHONE_OE_ENABLE_CONSOLE_UI} \
> +		--enable-gtk_ui=3D${LINPHONE_OE_ENABLE_GTK_UI} \
> +		--with-realprefix=3D/usr \
> +		"
> +
> +PACKAGES_gtk =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale ${PN}=
c linphone-rings liblinphone libmediastreamer-bin libmediastreamer libortp =
${PN}-utils"
> +PACKAGES =3D "${PN}c linphone-rings liblinphone libmediastreamer-bin lib=
mediastreamer libortp ${PN}-utils"
> +
> +FILES_${PN} =3D " \=20
> +	    ${bindir}/linphone \
> +            ${datadir}/linphone \
> + 	    ${datadir}/pixmaps \
> +	    ${datadir}/applications \
> +	    ${datadir}/gnome/apps \
> +	    ${datadir}/sounds/linphone/hello8000.wav \
> +	    ${datadir}/sounds/linphone/hello16000.wav \
> +	    ${datadir}/images/nowebcamCIF.jpg \
> +	    "
> +FILES_${PN}c =3D "${bindir}/linphonec ${bindir}/linphonecsh ${bindir}/si=
pomatic ${datadir}/sounds/linphone/ringback.wav"
> +FILES_${PN}-rings =3D "${datadir}/sounds/linphone/rings"
> +FILES_liblinphone =3D "${libdir}/liblinphone.so.*"
> +FILES_libmediastreamer-bin =3D "/usr/libexec/mediastream"
> +FILES_libmediastreamer =3D "${libdir}/libmediastreamer.so.*"
> +FILES_libortp =3D "${libdir}/libortp.so.*"
> +FILES_${PN}-dev +=3D "${libdir}/*.a ${libdir}/*.la ${libdir}/pkgconfig $=
{includedir}"
> +FILES_${PN}-utils =3D "${bindir}/test_ecc ${bindir}/test_lsd"
> diff --git a/recipes/linphone/linphone-common_3.4.3.inc b/recipes/linphon=
e/linphone-common_3.4.3.inc
> new file mode 100644
> index 0000000..5865ab0
> --- /dev/null
> +++ b/recipes/linphone/linphone-common_3.4.3.inc
> @@ -0,0 +1,11 @@
> +
> +SRC_URI =3D "${SAVANNAH_MIRROR}/releases/linphone/3.4.x/sources/linphone=
-3.4.3.tar.gz \
> +	file://cif10fps.patch"

where is this file?

> +
> +SRC_URI[md5sum] =3D "66e21f36d62c2094f7b4360262c46f20"
> +SRC_URI[sha256sum] =3D "92e7a0a01f2bb53bfaa4d7de4972e63ad528731154c36e05=
a9b6ba097e296692"
> +
> +S =3D "${WORKDIR}/linphone-3.4.3"
> +
> +
> +require linphone-common.inc
> diff --git a/recipes/linphone/linphone_3.4.3+nogtk.bb b/recipes/linphone/=
linphone_3.4.3+nogtk.bb
> new file mode 100644
> index 0000000..9bec7b1
> --- /dev/null
> +++ b/recipes/linphone/linphone_3.4.3+nogtk.bb

what does +nogtk mean in version?

> @@ -0,0 +1,9 @@
> +DESCRIPTION =3D "Audio/video SIP-based IP phone (console edition)"
> +HOMEPAGE =3D "http://www.linphone.org/?lang=3Dus"
> +LICENSE =3D "GPLv2"
> +PR=3D"r6"
> +
> +DEFAULT_PREFERENCE =3D "2"

why D_P =3D "2" when all other recipes have default D_P =3D "1" and this has
highest PV?

> +OVERRIDES_append =3D ":video:console"

This looks like someone trying to implement USE flags in OE :). But I'm
not sure it's right way and I haven't noticed this used in any other
recipe. So it would be better to discuss first.

> +
> +require linphone-common_3.4.3.inc
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3uHI8ACgkQN1Ujt2V2gBxPtwCePWGwxtB6FSL8cEfJj19CEqkr
S6AAn0UG8WKdA5FpIpT/cswIp8+fVq5E
=QwQn
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
