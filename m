Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id CDA47605B3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 05:47:00 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id d1so1478755wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 22:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lO1SQ6bpnrhdWwdjnWfCsgl8ZrKbOQtJ4Y8MdllIZSY=;
	b=HDHE8xF1ktiVf4rx6Txwzf6n1TSAD330h4TJr2L+RlUTC/oAdf6WNfZZ7biT4CeSHw
	rMd/OM0wrhLl1pXhul8TKFyg5Kcgb+KXja725JIF+N2SCQbqrQSHs9NeWgTs0S4BrM+4
	mRnUglpIQo7W1r5N3hFiPEYWLjQFQ41kdnD8yfJ+pMgCd2y/9qMLrXG0T8Rnkj9+/vbZ
	NJe1vUc/FUI3VOf0j/BGJVUNjB4NnHr4XZcr9bH8kEYaqo27xtqBCLYv1ub+O9FENAkv
	tyxi9feCMpfYpO1RFiMIOMf+J788Y2P8BFO5AIxZh0b2fsU58n53+gqU98U1EO4ZvkW9
	xkiA==
X-Received: by 10.180.19.230 with SMTP id i6mr51534201wie.48.1411883220511;
	Sat, 27 Sep 2014 22:47:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q18sm7448859wik.12.2014.09.27.22.46.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Sep 2014 22:46:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 28 Sep 2014 07:47:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140928054750.GQ25706@jama>
References: <1411881077-86222-1-git-send-email-coldnew.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1411881077-86222-1-git-send-email-coldnew.tw@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH v2] qt5: Add Qt 5.3.2 packages
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
X-List-Received-Date: Sun, 28 Sep 2014 05:47:04 -0000
X-Groupsio-MsgNum: 52249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ngPZezdD7QsvFaqQ"
Content-Disposition: inline

--ngPZezdD7QsvFaqQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2014 at 01:11:17PM +0800, Yen-Chin Lee wrote:
> Qt 5.3.2 has been released in September 16th, 2014.
>=20
> We still keep QT_VERSION to 5.3.1, if users want to upgrade to QT 5.3.2
> they should modified the QT_VERSION variable on their own.
>=20

I would remove the 5.3.1 version (and _git recipes will later be used
for 5.4)

> Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
> ---
>  conf/distro/include/qt5-versions.inc       |  2 +-
>  recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb   |  5 +++++
>  recipes-qt/qt5/nativesdk-qttools_5.3.2.bb  |  5 +++++
>  recipes-qt/qt5/qt5-5.3.2.inc               | 19 +++++++++++++++++++
>  recipes-qt/qt5/qtbase-native_5.3.2.bb      | 11 +++++++++++
>  recipes-qt/qt5/qtbase_5.3.2.bb             |  5 +++++
>  recipes-qt/qt5/qtconnectivity_5.3.2.bb     |  5 +++++
>  recipes-qt/qt5/qtdeclarative_5.3.2.bb      |  5 +++++
>  recipes-qt/qt5/qtenginio_5.3.2.bb          |  5 +++++
>  recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb |  5 +++++
>  recipes-qt/qt5/qtimageformats_5.3.2.bb     |  5 +++++
>  recipes-qt/qt5/qtlocation_5.3.2.bb         |  5 +++++
>  recipes-qt/qt5/qtmultimedia_5.3.2.bb       |  5 +++++
>  recipes-qt/qt5/qtquick1_5.3.2.bb           |  5 +++++
>  recipes-qt/qt5/qtquickcontrols_5.3.2.bb    |  5 +++++
>  recipes-qt/qt5/qtscript_5.3.2.bb           |  5 +++++
>  recipes-qt/qt5/qtsensors_5.3.2.bb          |  5 +++++
>  recipes-qt/qt5/qtserialport_5.3.2.bb       |  5 +++++
>  recipes-qt/qt5/qtsvg_5.3.2.bb              |  5 +++++
>  recipes-qt/qt5/qttools-native_5.3.2.bb     |  5 +++++
>  recipes-qt/qt5/qttools_5.3.2.bb            |  5 +++++
>  recipes-qt/qt5/qtwebkit-examples_5.3.2.bb  |  5 +++++
>  recipes-qt/qt5/qtwebkit_5.3.2.bb           |  5 +++++
>  recipes-qt/qt5/qtwebsockets_5.3.2.bb       |  5 +++++
>  recipes-qt/qt5/qtx11extras_5.3.2.bb        |  5 +++++
>  recipes-qt/qt5/qtxmlpatterns_5.3.2.bb      |  5 +++++
>  26 files changed, 146 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qt5-5.3.2.inc
>  create mode 100644 recipes-qt/qt5/qtbase-native_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtbase_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtconnectivity_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtdeclarative_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtenginio_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtimageformats_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtlocation_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtmultimedia_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtquick1_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtscript_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtsensors_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtserialport_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtsvg_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qttools-native_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qttools_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtwebkit_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtwebsockets_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtx11extras_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
>=20
> diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/q=
t5-versions.inc
> index 0fc4e62..e862fa6 100644
> --- a/conf/distro/include/qt5-versions.inc
> +++ b/conf/distro/include/qt5-versions.inc
> @@ -1,5 +1,5 @@
>  # Select which version you prefer by defining QT5_VERSION and including =
this file
> -# possible values now "5.3.1", "5.3.0+git%"
> +# possible values now "5.3.1", "5.3.2", "5.3.0+git%"
> =20
>  QT5_VERSION ?=3D "5.3.1"
> =20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb b/recipes-qt/qt5/na=
tivesdk-qtbase_5.3.2.bb
> new file mode 100644
> index 0000000..49b9072
> --- /dev/null
> +++ b/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "563e2b10274171f1184b3fd7260b4991"
> +SRC_URI[sha256sum] =3D "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a31=
91d07347d7826cb8"
> diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb b/recipes-qt/qt5/n=
ativesdk-qttools_5.3.2.bb
> new file mode 100644
> index 0000000..3efed85
> --- /dev/null
> +++ b/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "9074cc89bc52aea7f76a4d231d2f0ef6"
> +SRC_URI[sha256sum] =3D "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3a=
e6b5b81deb49983e"
> diff --git a/recipes-qt/qt5/qt5-5.3.2.inc b/recipes-qt/qt5/qt5-5.3.2.inc
> new file mode 100644
> index 0000000..21c1a22
> --- /dev/null
> +++ b/recipes-qt/qt5/qt5-5.3.2.inc
> @@ -0,0 +1,19 @@
> +# Copyright (C) 2012 O.S. Systems Software LTDA.
> +# Copyright (C) 2013 Martin Jansa <martin.jansa@gmail.com>
> +
> +QT_VERSION ?=3D "${PV}"
> +
> +# it's different for RC versions
> +QT_VERSION_DIR ?=3D "5.3"
> +
> +SRC_URI +=3D " \
> +    http://download.qt-project.org/official_releases/qt/${QT_VERSION_DIR=
}/${QT_VERSION}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz=
 \
> +"
> +
> +S =3D "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
> +
> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D2abca611d56c23eb99943bde=
21c80a0d \
> +                    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> +                    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c=
139dfb268fb6 \
> +                    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6=
aaf7e"
> diff --git a/recipes-qt/qt5/qtbase-native_5.3.2.bb b/recipes-qt/qt5/qtbas=
e-native_5.3.2.bb
> new file mode 100644
> index 0000000..44dd984
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase-native_5.3.2.bb
> @@ -0,0 +1,11 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +do_install_append() {
> +    # for modules which are still using syncqt and call qtPrepareTool(QM=
AKE_SYNCQT, syncqt)
> +    # e.g. qt3d, qtwayland
> +    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> +}
> +
> +SRC_URI[md5sum] =3D "563e2b10274171f1184b3fd7260b4991"
> +SRC_URI[sha256sum] =3D "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a31=
91d07347d7826cb8"
> diff --git a/recipes-qt/qt5/qtbase_5.3.2.bb b/recipes-qt/qt5/qtbase_5.3.2=
=2Ebb
> new file mode 100644
> index 0000000..49b9072
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "563e2b10274171f1184b3fd7260b4991"
> +SRC_URI[sha256sum] =3D "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a31=
91d07347d7826cb8"
> diff --git a/recipes-qt/qt5/qtconnectivity_5.3.2.bb b/recipes-qt/qt5/qtco=
nnectivity_5.3.2.bb
> new file mode 100644
> index 0000000..ca0013b
> --- /dev/null
> +++ b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "e496963407bb0c7b2e6c07133715a9cf"
> +SRC_URI[sha256sum] =3D "2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48=
177734c4dbd9096f"
> diff --git a/recipes-qt/qt5/qtdeclarative_5.3.2.bb b/recipes-qt/qt5/qtdec=
larative_5.3.2.bb
> new file mode 100644
> index 0000000..655f316
> --- /dev/null
> +++ b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "72ae60527ebb15f4b85cfbadc4c174de"
> +SRC_URI[sha256sum] =3D "04108193b9642c0394c157e98b5c1d81f555f9f495289e07=
ebfb6f03448b2382"
> diff --git a/recipes-qt/qt5/qtenginio_5.3.2.bb b/recipes-qt/qt5/qtenginio=
_5.3.2.bb
> new file mode 100644
> index 0000000..f7a7b1e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtenginio_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "53b67cf5470dfa9bcfc59aa5b8bfd66d"
> +SRC_URI[sha256sum] =3D "d5b84656dc6a349db380e42690a18137e562dbaba1930216=
bb3e3815df6af708"
> diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb b/recipes-qt/qt5/=
qtgraphicaleffects_5.3.2.bb
> new file mode 100644
> index 0000000..1900f9d
> --- /dev/null
> +++ b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "6dd8dd6906bbfb52a292cd25927bb9a8"
> +SRC_URI[sha256sum] =3D "688f2658a13d2919487d3f5acacb037364ee5c8fe0319f52=
4a7d0a4987ba7ffc"
> diff --git a/recipes-qt/qt5/qtimageformats_5.3.2.bb b/recipes-qt/qt5/qtim=
ageformats_5.3.2.bb
> new file mode 100644
> index 0000000..69dfaae
> --- /dev/null
> +++ b/recipes-qt/qt5/qtimageformats_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "255bb7f28c667ab91303e6af271753b5"
> +SRC_URI[sha256sum] =3D "d303cbceb73774edc0cfdbde6b97b0e41077e242ff652071=
0890f81bea40e2d4"
> diff --git a/recipes-qt/qt5/qtlocation_5.3.2.bb b/recipes-qt/qt5/qtlocati=
on_5.3.2.bb
> new file mode 100644
> index 0000000..eaf16a7
> --- /dev/null
> +++ b/recipes-qt/qt5/qtlocation_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "1ad3ee98f6f5d71df8dda14edc06346c"
> +SRC_URI[sha256sum] =3D "37b4072b531c35389b3acbbbd7259ab6ce4106177b96d67b=
fe5d3236139814d7"
> diff --git a/recipes-qt/qt5/qtmultimedia_5.3.2.bb b/recipes-qt/qt5/qtmult=
imedia_5.3.2.bb
> new file mode 100644
> index 0000000..6c46934
> --- /dev/null
> +++ b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "5ef68e85b9d32865a4bf7f491ff31f96"
> +SRC_URI[sha256sum] =3D "255fac66c93f33743c707da3d41d95c7c562924fe4eb829c=
bb7b21b2274a0e0b"
> diff --git a/recipes-qt/qt5/qtquick1_5.3.2.bb b/recipes-qt/qt5/qtquick1_5=
=2E3.2.bb
> new file mode 100644
> index 0000000..20cbb3a
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquick1_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "3a57c52d6d4d6632d67a4ebd35abe0c5"
> +SRC_URI[sha256sum] =3D "9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc=
5fc433c6de6273fb"
> diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb b/recipes-qt/qt5/qtq=
uickcontrols_5.3.2.bb
> new file mode 100644
> index 0000000..6d9a9d6
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "05f490fd6a7d3bca0c4d4a59989daef0"
> +SRC_URI[sha256sum] =3D "5f890f014d087141b0aaa8954b21b1f85740233b60a556e0=
e9624227bff6d94e"
> diff --git a/recipes-qt/qt5/qtscript_5.3.2.bb b/recipes-qt/qt5/qtscript_5=
=2E3.2.bb
> new file mode 100644
> index 0000000..8b21571
> --- /dev/null
> +++ b/recipes-qt/qt5/qtscript_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "d0e70adf7c993f33bad27290dae778d5"
> +SRC_URI[sha256sum] =3D "6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff74=
1e9a3b3ce9d6d7be"
> diff --git a/recipes-qt/qt5/qtsensors_5.3.2.bb b/recipes-qt/qt5/qtsensors=
_5.3.2.bb
> new file mode 100644
> index 0000000..3a4c287
> --- /dev/null
> +++ b/recipes-qt/qt5/qtsensors_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "d0a8dc3173bfc9dc9f2632d509a76e6f"
> +SRC_URI[sha256sum] =3D "f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a56=
91d1a31d08953ae4"
> diff --git a/recipes-qt/qt5/qtserialport_5.3.2.bb b/recipes-qt/qt5/qtseri=
alport_5.3.2.bb
> new file mode 100644
> index 0000000..1f1126d
> --- /dev/null
> +++ b/recipes-qt/qt5/qtserialport_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "0a38cfe5c81364f2b93d0d38b94d375f"
> +SRC_URI[sha256sum] =3D "a886e0cb08be60e57958676dc91c6f649468184a03c89c2a=
eabc904d36fd5a4b"
> diff --git a/recipes-qt/qt5/qtsvg_5.3.2.bb b/recipes-qt/qt5/qtsvg_5.3.2.bb
> new file mode 100644
> index 0000000..9c71dac
> --- /dev/null
> +++ b/recipes-qt/qt5/qtsvg_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "f7972e80970ff26a908c43defb3d10e6"
> +SRC_URI[sha256sum] =3D "1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32ab=
bd967535e71ae30f"
> diff --git a/recipes-qt/qt5/qttools-native_5.3.2.bb b/recipes-qt/qt5/qtto=
ols-native_5.3.2.bb
> new file mode 100644
> index 0000000..3efed85
> --- /dev/null
> +++ b/recipes-qt/qt5/qttools-native_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "9074cc89bc52aea7f76a4d231d2f0ef6"
> +SRC_URI[sha256sum] =3D "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3a=
e6b5b81deb49983e"
> diff --git a/recipes-qt/qt5/qttools_5.3.2.bb b/recipes-qt/qt5/qttools_5.3=
=2E2.bb
> new file mode 100644
> index 0000000..3efed85
> --- /dev/null
> +++ b/recipes-qt/qt5/qttools_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "9074cc89bc52aea7f76a4d231d2f0ef6"
> +SRC_URI[sha256sum] =3D "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3a=
e6b5b81deb49983e"
> diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb b/recipes-qt/qt5/q=
twebkit-examples_5.3.2.bb
> new file mode 100644
> index 0000000..9c93c20
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "6f88c2a99002801a1943483331f8b4f0"
> +SRC_URI[sha256sum] =3D "c8081a0863b7d8e2e39ec0e2fe288331ddab093a682959ba=
7378392512296482"
> diff --git a/recipes-qt/qt5/qtwebkit_5.3.2.bb b/recipes-qt/qt5/qtwebkit_5=
=2E3.2.bb
> new file mode 100644
> index 0000000..aa49463
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebkit_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "0497b5b46540848e0db6a9e219d756fb"
> +SRC_URI[sha256sum] =3D "e47122ed15e8e1cc32e11b3cd89bacc056437215134a2048=
99f2fddb4fd92e5b"
> diff --git a/recipes-qt/qt5/qtwebsockets_5.3.2.bb b/recipes-qt/qt5/qtwebs=
ockets_5.3.2.bb
> new file mode 100644
> index 0000000..8ebc50e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebsockets_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "093ddc113952e47bd0e251986e03f1e4"
> +SRC_URI[sha256sum] =3D "60533d413b0fa27b1e08642ae77bcaa76a845fa39ddc3d49=
af573a77e73a38c2"
> diff --git a/recipes-qt/qt5/qtx11extras_5.3.2.bb b/recipes-qt/qt5/qtx11ex=
tras_5.3.2.bb
> new file mode 100644
> index 0000000..9bfe71b
> --- /dev/null
> +++ b/recipes-qt/qt5/qtx11extras_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "59f6cbbdf2ad48c6b95b65f8b333df2d"
> +SRC_URI[sha256sum] =3D "ca6a28c95be0bf18080b4a20ae9e2c24a77a45aaf557f060=
47e65b1280c17251"
> diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb b/recipes-qt/qt5/qtxml=
patterns_5.3.2.bb
> new file mode 100644
> index 0000000..9cda6cc
> --- /dev/null
> +++ b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "857e8040b2bf45c114a7d75ec6ef94ee"
> +SRC_URI[sha256sum] =3D "acab0307039e117475caf2c95e425ead09ab5ee08ce15205=
fb3c0af7d7ec1abb"
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ngPZezdD7QsvFaqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQnoQYACgkQN1Ujt2V2gBzbyACfbJyN3b6rL+/qJtRG7yoQGcEU
5yMAnR3VE4AEBVTATD/xaulJB2nFWeEG
=JBbk
-----END PGP SIGNATURE-----

--ngPZezdD7QsvFaqQ--
