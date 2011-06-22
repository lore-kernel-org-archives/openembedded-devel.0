Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QZLUA-0005p5-2r
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 13:20:42 +0200
Received: by wyb34 with SMTP id 34so548196wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=kG4EpFjx9ucgsBo5sU+eI0pIswHgmiOYePQuCbzJ7hQ=;
	b=r4/1JUE9aewMf49maXaU+wREF1RY2ujXvp5FdVjvUH4EArxfZ23mIJTyYn+xPE2hWD
	l3OxA77nlMkMsKNY0uzSLLauUxinJjF8jmkCwp0RSmlgQY99HFeerv6HvdOAfMIP7jlv
	LCYKBpeTzWB1zDGnb39DrHdEqZii4Lgypa7mo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=Z/oVLPUEc4cVVu1lCI+PC8LkLCEbQBtTfvQmYrfiNN1Z3XYW8smqzMITCZ3Nq/h8HU
	lxcjv00XwKGKw+aQlLJle++jaCREbScptYg1eYPVvWrgbtu72H6l5Z7VslNc47fvpJO4
	cRI+W6TKHLllHhWT6QpGebyEM5x9yh99jC7e8=
Received: by 10.227.180.130 with SMTP id bu2mr603973wbb.71.1308741425417;
	Wed, 22 Jun 2011 04:17:05 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id fl19sm353410wbb.66.2011.06.22.04.17.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 04:17:04 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Wed, 22 Jun 2011 13:16:59 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: Guillaume Beraudo <guillaume.beraudo@belledonne-communications.com>
Message-ID: <20110622131659.4399ce87@guibc>
In-Reply-To: <1308128541-5714-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
References: <guillaume.beraudo@belledonne-communications.com>
	<1308128541-5714-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Wed, 22 Jun 2011 11:20:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,


What is the process for getting this patch merged?


Regards,

Guillaume

Le Wed, 15 Jun 2011 11:02:21 +0200,
Guillaume Beraudo <guillaume.beraudo@belledonne-communications.com> a
=E9crit :

> Recipe support linphone built with video support and without GTK.
>=20
> * included IGEPv2 specific patch to get audio playback at 8KHz rate.
> * included infrastructure to create flavoured recipes
>         - with(out) video
>         - with(out) gtk
> * removed dependency on:
>         - obsolete disable-gtk-doc.patch;
>         - cryptic b64_assert.patch;
>         - already upstream preferences-segv.patch;
>         - already upstream fix.unused.variable.patch
> ---
>  recipes/linphone/files/igep0020/alsa_8khz.patch |   13 +++++
>  recipes/linphone/linphone-common.inc            |   61
> +++++++++++++++++++++++
> recipes/linphone/linphone-common_3.4.3.inc      |   11 ++++
> recipes/linphone/linphone-nogtk_3.4.3.bb        |   15 ++++++ 4 files
> changed, 100 insertions(+), 0 deletions(-) create mode 100644
> recipes/linphone/files/igep0020/alsa_8khz.patch create mode 100644
> recipes/linphone/linphone-common.inc create mode 100644
> recipes/linphone/linphone-common_3.4.3.inc create mode 100644
> recipes/linphone/linphone-nogtk_3.4.3.bb
>=20
> diff --git a/recipes/linphone/files/igep0020/alsa_8khz.patch
> b/recipes/linphone/files/igep0020/alsa_8khz.patch new file mode 100644
> index 0000000..17774d4
> --- /dev/null
> +++ b/recipes/linphone/files/igep0020/alsa_8khz.patch
> @@ -0,0 +1,13 @@
> +--- linphone/mediastreamer2/src/alsa.c_orig	2011-05-24
> 12:39:33.824600109 +0200 ++++
> linphone/mediastreamer2/src/alsa.c	2011-05-24
> 12:40:04.760407404 +0200 +@@ -32,8 +32,8 @@
> + /*in case of troubles with a particular driver, try incrementing
> ALSA_PERIOD_SIZE
> + to 512, 1024, 2048, 4096...
> + then try incrementing the number of periods*/
> +-#define ALSA_PERIODS 8
> +-#define ALSA_PERIOD_SIZE 256
> ++#define ALSA_PERIODS 4
> ++#define ALSA_PERIOD_SIZE 512
> +=20
> + /*uncomment the following line if you have problems with an alsa
> driver
> + having sound quality trouble:*/
> diff --git a/recipes/linphone/linphone-common.inc
> b/recipes/linphone/linphone-common.inc new file mode 100644
> index 0000000..a9d0f5b
> --- /dev/null
> +++ b/recipes/linphone/linphone-common.inc
> @@ -0,0 +1,61 @@
> +inherit autotools pkgconfig gettext
> +#export PKG_CONFIG=3D${STAGING_BINDIR_NATIVE}/pkg-config
> +
> +SECTION =3D "x11/network"
> +SECTION_liblinphone =3D "libs/network"
> +SECTION_libmediastreamer =3D "libs/network"
> +SECTION_libortp =3D "libs/network"
> +SECTION_linphonec =3D  "console/network"
> +
> +DEPENDS =3D "intltool readline libosip2 libexosip2 speex alsa-lib \
> +	${@base_conditional('LINPHONE_FLAVOUR_WITH_VIDEO', '1', '
> libxv ffmpeg libv4l', '', d)} \
> +	${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', '
> gtk+', '', d)} \
> +	"
> +
> +PROVIDES =3D "linphonec liblinphone libmediastreamer libortp \
> +	${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', '
> linphone', '', d)}" +
> +SRC_URI_append_igep0020 =3D " file://alsa_8khz.patch"
> +
> +
> +do_install_append(){
> +	install -d ${D}${bindir}
> +	install -m 0755 ${S}/coreapi/.libs/test_ecc
> ${D}${bindir}/test_ecc
> +	install -m 0755 ${S}/coreapi/.libs/test_lsd
> ${D}${bindir}/test_lsd +}
> +
> +EXTRA_OECONF =3D " \
> +	${@base_conditional('LINPHONE_FLAVOUR_WITH_VIDEO', '1',
> '--with-ffmpeg=3D${STAGING_DIR_HOST}${layout_exec_prefix}
> --enable-video', '--disable-video', d)} \
> +        --enable-alsa \
> +        --with-osip=3D${STAGING_DIR_HOST}${layout_exec_prefix} \
> +        --with-readline=3D${STAGING_DIR_HOST}${layout_exec_prefix} \
> +        --with-speex=3D${STAGING_DIR_HOST}${layout_exec_prefix} \
> +        --disable-manual \
> +	--enable-console_ui=3Dyes \
> +	--enable-gtk_ui=3D${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK',
> '1', 'yes', 'no', d)} \
> +	--with-realprefix=3D/usr \
> +	"
> +
> +PACKAGES =3D " \
> +	${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1',
> '${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale', '', d)} \
> +	${PN}-console linphone-rings liblinphone
> libmediastreamer-bin libmediastreamer libortp ${PN}-utils" +
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
> +
> +FILES_${PN}-console =3D "${bindir}/linphonec ${bindir}/linphonecsh
> ${bindir}/sipomatic ${datadir}/sounds/linphone/ringback.wav"
> +FILES_${PN}-rings =3D "${datadir}/sounds/linphone/rings"
> +FILES_liblinphone =3D "${libdir}/liblinphone.so.*"
> +FILES_libmediastreamer-bin =3D "/usr/libexec/mediastream"
> +FILES_libmediastreamer =3D "${libdir}/libmediastreamer.so.*"
> +FILES_libortp =3D "${libdir}/libortp.so.*" +FILES_${PN}-dev +=3D
> "${libdir}/*.a ${libdir}/*.la ${libdir}/pkgconfig ${includedir}"
> +FILES_${PN}-utils =3D "${bindir}/test_ecc ${bindir}/test_lsd" diff
> --git a/recipes/linphone/linphone-common_3.4.3.inc
> b/recipes/linphone/linphone-common_3.4.3.inc new file mode 100644
> index 0000000..bbf6e8d --- /dev/null
> +++ b/recipes/linphone/linphone-common_3.4.3.inc
> @@ -0,0 +1,11 @@
> +
> +SRC_URI =3D
> "${SAVANNAH_MIRROR}/releases/linphone/3.4.x/sources/linphone-3.4.3.tar.gz
> \
> +	"
> +
> +SRC_URI[md5sum] =3D "66e21f36d62c2094f7b4360262c46f20"
> +SRC_URI[sha256sum] =3D
> "92e7a0a01f2bb53bfaa4d7de4972e63ad528731154c36e05a9b6ba097e296692" +
> +S =3D "${WORKDIR}/linphone-3.4.3"
> +
> +
> +require linphone-common.inc
> diff --git a/recipes/linphone/linphone-nogtk_3.4.3.bb
> b/recipes/linphone/linphone-nogtk_3.4.3.bb new file mode 100644
> index 0000000..83ad0c3
> --- /dev/null
> +++ b/recipes/linphone/linphone-nogtk_3.4.3.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "Audio/video SIP-based IP phone (console edition)"
> +HOMEPAGE =3D "http://www.linphone.org/?lang=3Dus"
> +LICENSE =3D "GPLv2"
> +PR=3D"r1"
> +
> +DEFAULT_PREFERENCE =3D "1"
> +
> +# Build without GTK
> +LINPHONE_FLAVOUR_WITH_GTK =3D '0'
> +
> +# Build with video
> +LINPHONE_FLAVOUR_WITH_VIDEO =3D '1'
> +
> +
> +require linphone-common_3.4.3.inc



