Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PaWBy-0008Cq-Vl
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 17:26:31 +0100
Received: by wwi18 with SMTP id 18so16175635wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 08:26:06 -0800 (PST)
Received: by 10.227.198.203 with SMTP id ep11mr13398256wbb.221.1294244765893; 
	Wed, 05 Jan 2011 08:26:05 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	q18sm16064233wbe.11.2011.01.05.08.26.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 08:26:04 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1294244266-18700-1-git-send-email-obi@opendreambox.org>
Date: Wed, 5 Jan 2011 17:26:02 +0100
Message-Id: <BE55AB38-487C-4E1A-B4B5-400D101FCF3D@dominion.thruhere.net>
References: <C10E6CF1-BF3B-4A0F-B064-F468E0A25821@dominion.thruhere.net>
	<1294244266-18700-1-git-send-email-obi@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] qt4: fix incorrect pkg-config files
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
X-List-Received-Date: Wed, 05 Jan 2011 16:26:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 jan 2011, om 17:17 heeft Andreas Oberritter het volgende =
geschreven:

> * Previously, include statements were generated like this:
>  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore
>  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore/qt4-embedded/QtCoreE
>  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore/qtopia
>=20
> * The sed rules ignored QT_LIBINFIX.
> * The sed rules incorrectly used QT_BASE_NAME instead of QT_DIR_NAME.
>=20
> * Now, they look like this, which is what an application expects:
>  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore
>  -I.../mipsel-oe-linux/usr/include/qtopia
>=20
> * Tested with qt4-embedded on mipsel
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Koen Kooi <k.kooi@student.utwente.nl>


Acked-by: Koen Kooi <koen@openembedded.org>

> ---
> * v2: bumped INC_PR
>=20
> recipes/qt4/qt4-embedded.inc |    2 +-
> recipes/qt4/qt4-x11-free.inc |    2 +-
> recipes/qt4/qt4.inc          |   12 +++++-------
> 3 files changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/recipes/qt4/qt4-embedded.inc =
b/recipes/qt4/qt4-embedded.inc
> index 87b19d4..223c4f3 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL QPL"
> PRIORITY =3D "optional"
> HOMEPAGE =3D "http://www.trolltech.com"
> DEPENDS +=3D "directfb tslib"
> -INC_PR =3D "r26"
> +INC_PR =3D "r27"
>=20
> QT_BASE_NAME ?=3D "qt4-embedded"
> QT_BASE_LIB  ?=3D "libqt-embedded"
> diff --git a/recipes/qt4/qt4-x11-free.inc =
b/recipes/qt4/qt4-x11-free.inc
> index ae79d58..a98e268 100644
> --- a/recipes/qt4/qt4-x11-free.inc
> +++ b/recipes/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.trolltech.com"
> LICENSE =3D "GPL QPL"
> DEPENDS +=3D "virtual/libx11 fontconfig libxft libxext libxrender =
libxrandr libxcursor"
>=20
> -INC_PR =3D "r22"
> +INC_PR =3D "r23"
>=20
> SRC_URI =3D =
"ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
>            file://0001-cross-compile.patch \
> diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
> index ac1fc83..52fa146 100644
> --- a/recipes/qt4/qt4.inc
> +++ b/recipes/qt4/qt4.inc
> @@ -285,15 +285,13 @@ do_install() {
>            ${D}${libdir}/pkgconfig/*.pc
>     for name in ${QT_LIB_NAMES}; do
>            sed -i -e /Requires/s#"${name}"#"${name}${QT_LIBINFIX}"#g =
${D}${libdir}/pkgconfig/*.pc
> +           if [ -f ${D}${libdir}/pkgconfig/${name}${QT_LIBINFIX}.pc =
]; then
> +               sed -i -e /^includedir=3D/s#"/${name}"## \
> +                      -e /^Cflags:/s#"${QT_DIR_NAME}"#"${name}"# \
> +                         =
${D}${libdir}/pkgconfig/${name}${QT_LIBINFIX}.pc
> +           fi
>     done
>=20
> -	# QT abuses $includedir to point to its headers, which breaks =
pkgconfig sysroot, so manually fix it up here:
> -	for pc in ${D}${libdir}/pkgconfig/*.pc ; do
> -		sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename =
$pc .pc):prefix}/include:" \
> -		       -e "s,Cflags: ,Cflags: =
-IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
> -		       -e 's:IP{:I${:g' $pc
> -	done
> -
>     install -d ${D}/${libdir}/fonts
>     touch ${D}/${libdir}/fonts/fontdir
> }
> --=20
> 1.7.2.3
>=20
>=20



