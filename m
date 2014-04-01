Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5578560DD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:59:40 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id x48so6099602wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RSh1QjtrRniqoDgCCOlcvSOjG2HzmIVRELvTqHtCzMg=;
	b=wQnDMeqbod2PXKP0yXMZrnwrxnEH/YLBWQKbZVnyCSXSsZoluo8agEnS/KT/irLF8S
	VVRqkha7mUBReT+r4tLs10vPTnNyLOsmfxKcQFz5HqB3BuRHggvVnX5jJNIhK/lITfWd
	OuVxcgnZdR092kdHSlXHuaoesF3ylogJIeVDZQ7lgR7QipuW85w/bgTr0fN1J2Wrhd7P
	KqGMz+madMcxFJO+q9AbxqWh0sb3+RbXynGidn2xfip6bv1LwQfNXkp/PBdOuiINHsB7
	wE9cmm9Ek0xmWMZyZ6VXsulJT4oSlZX+DW8h9vA9V/UsTEEJGHEg+vCMnD9jJJs5R0Fi
	Ei/Q==
X-Received: by 10.180.102.42 with SMTP id fl10mr19909637wib.42.1396357181034; 
	Tue, 01 Apr 2014 05:59:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc51sm40432971eeb.22.2014.04.01.05.59.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 05:59:40 -0700 (PDT)
Date: Tue, 1 Apr 2014 14:59:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140401125940.GP2425@jama>
References: <1396185772-20185-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396185772-20185-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] qtwebkit: add packageconfig for qtmultimedia
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 12:59:42 -0000
X-Groupsio-MsgNum: 48950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+d/sD+4Memv8CeGA"
Content-Disposition: inline

--+d/sD+4Memv8CeGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 12:22:52AM +1100, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  recipes-qt/qt5/qtwebkit.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index 90bd981..a6322cb 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -7,10 +7,11 @@ LIC_FILES_CHKSUM =3D "file://Source/WebCore/rendering/R=
enderApplet.h;endline=3D22;md
> =20
>  DEPENDS +=3D "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libx=
slt"
> =20
> -PACKAGECONFIG ??=3D "gstreamer qtlocation qtsensors"
> +PACKAGECONFIG ??=3D "gstreamer qtlocation qtmultimedia qtsensors"
>  PACKAGECONFIG[gstreamer] =3D ",,gstreamer1.0 gstreamer1.0-plugins-base"
>  PACKAGECONFIG[gstreamer010] =3D ",,gstreamer gst-plugins-base"
>  PACKAGECONFIG[qtlocation] =3D ",,qtlocation"
> +PACKAGECONFIG[qtmultimedia] =3D ",,qtmultimedia"
>  PACKAGECONFIG[qtsensors] =3D ",,qtsensors"
> =20
>  do_configure_prepend() {
> @@ -20,6 +21,8 @@ do_configure_prepend() {
>      sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAME=
R010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
>      # disable qtlocation test if it isn't enabled by PACKAGECONFIG
>      sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/=
' -i ${S}/Tools/qmake/mkspecs/features/features.prf
> +    # disable qtmultimedia test if it isn't enabled by PACKAGECONFIG
> +    sed -e 's/(video):\(qtHaveModule(multimediawidgets)\)/(video):OE_QTM=
ULTIMEDIA_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
>      # disable qtsensors test if it isn't enabled by PACKAGECONFIG
>      sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i =
${S}/Tools/qmake/mkspecs/features/features.prf
>  }
> @@ -27,6 +30,7 @@ do_configure_prepend() {
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'gstreamer',=
 'CONFIG+=3DOE_GSTREAMER_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'gstreamer01=
0', 'CONFIG+=3DOE_GSTREAMER010_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtlocation'=
, 'CONFIG+=3DOE_QTLOCATION_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtmultimedi=
a', 'CONFIG+=3DOE_QTMULTIMEDIA_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtsensors',=
 'CONFIG+=3DOE_QTSENSORS_ENABLED', '', d)}"
> =20
>  # qtwebkit gets terribly big when linking with all debug info, disable b=
y default

can you check qtwebkit-examples recipe if it needs similar change (or maybe=
 we can just add qtmultimedia dependency there)?

It failed in last build:

| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/include/qt5/QtWebKitWidgets/QtWebKitWidgets:3:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.2.1-r0/qtwebkit-examp=
les-opensource-src-5.2.1/examples/webkitwidgets/embedded/anomaly/src/Browse=
rView.cpp:46:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/include/qt5/QtWebKitWidgets/QtWebKitWidgetsDepends:4:51: fatal error: Qt=
MultimediaWidgets/QtMultimediaWidgets: No such file or directory
|  #include <QtMultimediaWidgets/QtMultimediaWidgets>
|                                                    ^
| compilation terminated.
| make[4]: *** [.obj/BrowserView.o] Error 1
| make[4]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.2.1-r0/build/ex=
amples/webkitwidgets/embedded/anomaly'
| make[3]: *** [sub-anomaly-make_first] Error 2
| make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.2.1-r0/build/ex=
amples/webkitwidgets/embedded'
| make[2]: *** [sub-embedded-make_first] Error 2
| make[2]: *** Waiting for unfinished jobs....
| compiling .moc/moc_plotwidget.cpp
| linking framecapture
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/ld:=
 error: cannot find -lQt5MultimediaWidgets
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/ld:=
 error: cannot find -lQt5Multimedia
| collect2: error: ld returned 1 exit status
| make[3]: *** [framecapture] Error 1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+d/sD+4Memv8CeGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM6uDwACgkQN1Ujt2V2gBzr2wCfduGWfzB4KQxmM4E/QMvKWmJW
Zz0An3fdVzGMruIjwbenhu7GBnTSek7o
=qwGc
-----END PGP SIGNATURE-----

--+d/sD+4Memv8CeGA--
