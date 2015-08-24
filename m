Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 40EE9766DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:45:08 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so71180513wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B4v02gQ03h8GZNJhNBrAfYuzxgWm57auiM88J6/KNyo=;
	b=Tv8ZyNzf5Ydx/Vnvay1JiDMBRCW10iD/EYWYxXZ+fbM7WWUtRQ6BJPcSzjmzamXUIq
	5V3pbWl5593jQ555dh7sPESkydF+GgaEuXWzby/BWXnXErNrz30/wtfLhR5lscV2cSGU
	qnhoXhgi24a2lrZnrXFw2S5KC7xGAEezW74iBT5fcORMwQem8FdKodBfka6mMp+ckET7
	vxgGJT7OliIbHBNP7BFeBTCsM7/xi2viFbfGAi0Kmqyyc6tjA4uw6FelfrU8E1/bT/2D
	gesWxozGnCYh/MwXcHSoQ0IEFod1VD1EnViorD4h0h/bz7gtafLBnCd6KRnN/m/V6sDH
	CGfA==
X-Received: by 10.180.103.69 with SMTP id fu5mr28051276wib.95.1440420308664;
	Mon, 24 Aug 2015 05:45:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r8sm12202469wik.16.2015.08.24.05.45.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:45:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Aug 2015 14:45:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150824124512.GE2446@jama>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
	<37e08b9cbf4bc8c2194e2274c1ada3f5ead965fa.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <37e08b9cbf4bc8c2194e2274c1ada3f5ead965fa.1440407387.git.samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 06/11] qt5: make qt5.inc reusable qt5-module.bbclass
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
X-List-Received-Date: Mon, 24 Aug 2015 12:45:09 -0000
X-Groupsio-MsgNum: 56946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline

--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 12:13:52PM +0300, Samuli Piippo wrote:
> qt5.inc has common parts that can be used to build any Qt5 module.
> Make it a bbclass so that it is easily usable from other meta layers.

require recipes-qt/qt5/qt5.inc

can be used in other layers as well

>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>  recipes-qt/qt5/qt5.inc =3D> classes/qt5-module.bbclass | 0
>  recipes-qt/examples/cinematicexperience_1.0.bb       | 2 +-
>  recipes-qt/examples/qt5everywheredemo_1.0.bb         | 2 +-
>  recipes-qt/examples/qt5nmapcarousedemo_1.0.bb        | 2 +-
>  recipes-qt/examples/qt5nmapper_1.0.bb                | 2 +-
>  recipes-qt/examples/qtsmarthome_1.0.bb               | 2 +-
>  recipes-qt/examples/quitbattery_1.0.0.bb             | 2 +-
>  recipes-qt/examples/quitindicators_1.0.1.bb          | 2 +-
>  recipes-qt/libconnman-qt/libconnman-qt5_git.bb       | 2 +-
>  recipes-qt/qt5/qt3d_git.bb                           | 2 +-
>  recipes-qt/qt5/qtbase_git.bb                         | 2 +-
>  recipes-qt/qt5/qtconnectivity_git.bb                 | 2 +-
>  recipes-qt/qt5/qtdeclarative_git.bb                  | 2 +-
>  recipes-qt/qt5/qtenginio_git.bb                      | 2 +-
>  recipes-qt/qt5/qtgraphicaleffects_git.bb             | 2 +-
>  recipes-qt/qt5/qtimageformats_git.bb                 | 2 +-
>  recipes-qt/qt5/qtlocation_git.bb                     | 2 +-
>  recipes-qt/qt5/qtmultimedia_git.bb                   | 2 +-
>  recipes-qt/qt5/qtquick1_git.bb                       | 2 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb                | 2 +-
>  recipes-qt/qt5/qtscript_git.bb                       | 2 +-
>  recipes-qt/qt5/qtsensors_git.bb                      | 2 +-
>  recipes-qt/qt5/qtserialport_git.bb                   | 2 +-
>  recipes-qt/qt5/qtsvg_git.bb                          | 2 +-
>  recipes-qt/qt5/qtsystems_git.bb                      | 2 +-
>  recipes-qt/qt5/qttools_git.bb                        | 2 +-
>  recipes-qt/qt5/qttranslations_git.bb                 | 2 +-
>  recipes-qt/qt5/qtwayland_git.bb                      | 2 +-
>  recipes-qt/qt5/qtwebchannel_git.bb                   | 2 +-
>  recipes-qt/qt5/qtwebengine_git.bb                    | 2 +-
>  recipes-qt/qt5/qtwebkit-examples_git.bb              | 2 +-
>  recipes-qt/qt5/qtwebkit_git.bb                       | 2 +-
>  recipes-qt/qt5/qtwebsockets_git.bb                   | 2 +-
>  recipes-qt/qt5/qtx11extras_git.bb                    | 2 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb                  | 2 +-
>  35 files changed, 34 insertions(+), 34 deletions(-)
>  rename recipes-qt/qt5/qt5.inc =3D> classes/qt5-module.bbclass (100%)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/classes/qt5-module.bbclass
> similarity index 100%
> rename from recipes-qt/qt5/qt5.inc
> rename to classes/qt5-module.bbclass
> diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/=
examples/cinematicexperience_1.0.bb
> index 116127f..b1eee73 100644
> --- a/recipes-qt/examples/cinematicexperience_1.0.bb
> +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> @@ -21,7 +21,7 @@ S =3D "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
>  DEPENDS =3D "qtdeclarative qtgraphicaleffects"
>  RDEPENDS_${PN} =3D "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugi=
ns"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/ex=
amples/qt5everywheredemo_1.0.bb
> index 0546b00..b906741 100644
> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "${QT_GIT}/qt-labs/qt5-everywhere-demo.git"
> =20
>  S =3D "${WORKDIR}/git/QtDemo"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb b/recipes-qt/e=
xamples/qt5nmapcarousedemo_1.0.bb
> index 7edf727..67525ca 100644
> --- a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
> +++ b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D "445da212074a10a432f4508d1258142=
12bbe7a967bfa47b015b92dfac6
> =20
>  S =3D "${WORKDIR}/Qt5_NMap_CarouselDemo_1.0"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/examples/qt5nmapper_1.0.bb b/recipes-qt/examples/=
qt5nmapper_1.0.bb
> index 77cb067..cc61b18 100644
> --- a/recipes-qt/examples/qt5nmapper_1.0.bb
> +++ b/recipes-qt/examples/qt5nmapper_1.0.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "607fbf4c448f00d3c563f9ef8a582bc=
b6e8fe550e80b56bf8d9127a417
> =20
>  S =3D "${WORKDIR}/Qt5_NMapper_1.0"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/examples/qtsmarthome_1.0.bb b/recipes-qt/examples=
/qtsmarthome_1.0.bb
> index 944c4dc..3af01f4 100644
> --- a/recipes-qt/examples/qtsmarthome_1.0.bb
> +++ b/recipes-qt/examples/qtsmarthome_1.0.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "fceaa813c33e462bad6c0383eaef81a=
6f6e586c15d1fa73898173b517f
> =20
>  S =3D "${WORKDIR}/smarthome_src"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/examples/quitbattery_1.0.0.bb b/recipes-qt/exampl=
es/quitbattery_1.0.0.bb
> index ea218d7..a8fb77d 100644
> --- a/recipes-qt/examples/quitbattery_1.0.0.bb
> +++ b/recipes-qt/examples/quitbattery_1.0.0.bb
> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D "38dcb7630553c397f9d8a53c6411b1a=
6237956ed8dd4859e01487b1dd8
> =20
>  S =3D "${WORKDIR}/QUItBattery_1.0.0"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/examples/quitindicators_1.0.1.bb b/recipes-qt/exa=
mples/quitindicators_1.0.1.bb
> index 19a861a..0377350 100644
> --- a/recipes-qt/examples/quitindicators_1.0.1.bb
> +++ b/recipes-qt/examples/quitindicators_1.0.1.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "db84112adbde9b6f28c129e8fb37a69=
12f4bc34bed18e57f570fb78ea0
> =20
>  S =3D "${WORKDIR}/QUItIndicators_1.0.1"
> =20
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  do_install() {
>      install -d ${D}${datadir}/${P}
> diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/=
libconnman-qt/libconnman-qt5_git.bb
> index f79dc0c..fcd7cbf 100644
> --- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> +++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> @@ -1,4 +1,4 @@
> -require recipes-qt/qt5/qt5.inc
> +inherit qt5-module
> =20
>  SUMMARY =3D "Qt Library for ConnMan"
>  HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index 62f17e1..e658690 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 33620cb..92faf29 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconn=
ectivity_git.bb
> index c758d04..688d844 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdecla=
rative_git.bb
> index d186705..273891b 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_g=
it.bb
> index a0aff8f..2edc931 100644
> --- a/recipes-qt/qt5/qtenginio_git.bb
> +++ b/recipes-qt/qt5/qtenginio_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
> diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qt=
graphicaleffects_git.bb
> index 9da5c94..0641f80 100644
> --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimag=
eformats_git.bb
> index 31d4fb0..17784c0 100644
> --- a/recipes-qt/qt5/qtimageformats_git.bb
> +++ b/recipes-qt/qt5/qtimageformats_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation=
_git.bb
> index 12416bb..0264b93 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultim=
edia_git.bb
> index bab9bee..abaa28f 100644
> --- a/recipes-qt/qt5/qtmultimedia_git.bb
> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git=
=2Ebb
> index 928963b..994d0bc 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtqui=
ckcontrols_git.bb
> index af11119..769c191 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
> diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git=
=2Ebb
> index 5751e20..6c1c20c 100644
> --- a/recipes-qt/qt5/qtscript_git.bb
> +++ b/recipes-qt/qt5/qtscript_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_g=
it.bb
> index ec33355..ee1f579 100644
> --- a/recipes-qt/qt5/qtsensors_git.bb
> +++ b/recipes-qt/qt5/qtsensors_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserial=
port_git.bb
> index c59eef6..19748c2 100644
> --- a/recipes-qt/qt5/qtserialport_git.bb
> +++ b/recipes-qt/qt5/qtserialport_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than =
what
> diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> index 1dce8c6..6350b38 100644
> --- a/recipes-qt/qt5/qtsvg_git.bb
> +++ b/recipes-qt/qt5/qtsvg_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_g=
it.bb
> index edc0360..6bde2af 100644
> --- a/recipes-qt/qt5/qtsystems_git.bb
> +++ b/recipes-qt/qt5/qtsystems_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
> index a4f63c7..e27d6ef 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttran=
slations_git.bb
> index 9341453..75130b7 100644
> --- a/recipes-qt/qt5/qttranslations_git.bb
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index 0be7afe..83cdbf4 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebcha=
nnel_git.bb
> index 8433652..ce5f2fe 100644
> --- a/recipes-qt/qt5/qtwebchannel_git.bb
> +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengi=
ne_git.bb
> index 4b89ddd..3bd75af 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -25,7 +25,7 @@ inherit gettext
>  inherit pythonnative
>  inherit perlnative
> =20
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # To avoid trouble start with not separated build directory
> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtw=
ebkit-examples_git.bb
> index 5fd6436..f98dd63 100644
> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git=
=2Ebb
> index db1a098..674d8ed 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "BSD & LGPLv2+ | GPL-2.0"
> diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsoc=
kets_git.bb
> index 85e9156..bd77d52 100644
> --- a/recipes-qt/qt5/qtwebsockets_git.bb
> +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3=
=2E0)"
> diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extr=
as_git.bb
> index 6f60f2b..6428711 100644
> --- a/recipes-qt/qt5/qtx11extras_git.bb
> +++ b/recipes-qt/qt5/qtx11extras_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpa=
tterns_git.bb
> index da2255a..98bab6e 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -1,4 +1,4 @@
> -require qt5.inc
> +inherit qt5-module
>  require qt5-git.inc
> =20
>  # There are no LGPLv3-only licensed files in this component.
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXbEdcACgkQN1Ujt2V2gBzVgwCfZ3iKRANB991aCngwevilv4eo
2r0AniLSYjmtM7Dj61rroiirOSNkvzXy
=NaI4
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
