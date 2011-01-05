Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PaT32-0004bj-Co
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 14:05:04 +0100
Received: by wyb40 with SMTP id 40so15706246wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 05:04:38 -0800 (PST)
Received: by 10.227.155.75 with SMTP id r11mr13313150wbw.3.1294232678319;
	Wed, 05 Jan 2011 05:04:38 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	p4sm11161585wer.29.2011.01.05.05.04.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 05:04:37 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1294231700-27043-1-git-send-email-obi@opendreambox.org>
Date: Wed, 5 Jan 2011 14:04:35 +0100
Message-Id: <C10E6CF1-BF3B-4A0F-B064-F468E0A25821@dominion.thruhere.net>
References: <1294231700-27043-1-git-send-email-obi@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] qt4: fix incorrect pkg-config files
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
X-List-Received-Date: Wed, 05 Jan 2011 13:05:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

That will need a INC_PR bump in qt4-x11-free.inc and qt4-embedded.inc to =
take effect. Other than that, looks OK to me.

Op 5 jan 2011, om 13:48 heeft Andreas Oberritter het volgende =
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
> ---
> recipes/qt4/qt4.inc |   12 +++++-------
> 1 files changed, 5 insertions(+), 7 deletions(-)
>=20
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



