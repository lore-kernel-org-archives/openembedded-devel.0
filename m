Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P7pwD-0003yc-BP
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 15:39:42 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9IDd6Q3032725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Oct 2010 08:39:06 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9IDd6F7003890;
	Mon, 18 Oct 2010 08:39:06 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9IDd6uV014981;
	Mon, 18 Oct 2010 08:39:06 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 18 Oct 2010 08:39:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Oct 2010 08:39:05 -0500
Thread-Topic: [PATCH] qt4: replace underscore with dash in library name
Thread-Index: ActqEOrqH40+Fvj+TGSvQj0VWs8itQEuMgtg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFAE3B@dlee06.ent.ti.com>
References: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4: replace underscore with dash in library name
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
X-List-Received-Date: Mon, 18 Oct 2010 13:39:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Tuesday, October 12, 2010 8:25 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase; Maupin, Chase
> Subject: [PATCH] qt4: replace underscore with dash in library name
>=20
> * For libraries that are added to the QT_LIB_NAMES or
>   QT_EXTRA_LIBS variables replace any "_" characters in the
>   library name with "-" for use in the package name.
> * The actual library file names are left alone.
> * Bump the PR for packages using qt4.inc
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

ping

> ---
>  recipes/qt4/qt4-embedded.inc |    2 +-
>  recipes/qt4/qt4-x11-free.inc |    2 +-
>  recipes/qt4/qt4.inc          |    4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index 111716d..9331302 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL QPL"
>  PRIORITY =3D "optional"
>  HOMEPAGE =3D "http://www.trolltech.com"
>  DEPENDS +=3D "directfb tslib"
> -INC_PR =3D "r23"
> +INC_PR =3D "r24"
>=20
>  QT_BASE_NAME ?=3D "qt4-embedded"
>  QT_BASE_LIB  ?=3D "libqt-embedded"
> diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
> index 66e6d1c..ff4e454 100644
> --- a/recipes/qt4/qt4-x11-free.inc
> +++ b/recipes/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.trolltech.com"
>  LICENSE =3D "GPL QPL"
>  DEPENDS +=3D "virtual/libx11 fontconfig libxft libxext libxrender libxra=
ndr
> libxcursor"
>=20
> -INC_PR =3D "r20"
> +INC_PR =3D "r21"
>=20
>  SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-
> ${PV}.tar.gz \
>             file://0001-cross-compile.patch \
> diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
> index ffd56dd..6721265 100644
> --- a/recipes/qt4/qt4.inc
> +++ b/recipes/qt4/qt4.inc
> @@ -34,7 +34,7 @@ python __anonymous () {
>      dev_packages =3D []
>      dbg_packages =3D []
>      for name in bb.data.getVar("QT_LIB_NAMES", d, 1).split():
> -        pkg =3D "${QT_BASE_LIB}" + name.lower().replace("qt", "") + "4"
> +        pkg =3D "${QT_BASE_LIB}" + name.lower().replace("qt",
> "").replace("_", "-") + "4"
>          # NOTE: the headers for QtAssistantClient are different
>          incname =3D name.replace("QtAssistantClient", "QtAssistant")
>          bb.data.setVar("FILES_%s" % pkg,
> "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
> @@ -52,7 +52,7 @@ python __anonymous () {
>          dbg_packages.append("%s-dbg" % name)
>=20
>      for name in bb.data.getVar("QT_EXTRA_LIBS", d, 1).split():
> -        pkg =3D "${QT_BASE_LIB}" + name.lower().replace("qt", "") + "4"
> +        pkg =3D "${QT_BASE_LIB}" + name.lower().replace("qt",
> "").replace("_", "-") + "4"
>          bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" %
> locals(), d)
>          bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.pr=
l
>                    ${libdir}/lib%(name)s.a
> --
> 1.7.0.4



