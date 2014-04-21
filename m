Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C9FCD65D10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:47:12 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3564522eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pTG2hqPFz7h1viteT431u9xd2MvwqRhDxsQ9jiDJ/YI=;
	b=B6IrbZtZlciNUvFHBm7wJryDX4UHvmxU2aIhem4EoGyULsyvEfDxO75BloN572QLxK
	YifcwrCPjMbEqYfI0zvoJmBgOcZZFConmtFoVdK/2i7wOBrrAS7iYL/Mb2A6rlEQLwiA
	h4NWkr/ef//w3LmCE8JJ0dPlpGylilx5g12692DmT/E690U9yLXMzJvVp/C7rX76/2zK
	S5XWtCh22B+0Yb/+s3Ok65q0hV0DWvsh2IplwXihTNvsUryTDVr4WPIOfPs1twDvezdk
	6rsxB5zXA/dJyfGGBWHo2TqZobg8NGKAHM8ITxXFETeiWKFVODODCK7AY5wIfY9etysN
	N+Qw==
X-Received: by 10.14.37.8 with SMTP id x8mr46823933eea.32.1398080832986;
	Mon, 21 Apr 2014 04:47:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm102926220eev.5.2014.04.21.04.47.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:47:11 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:47:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421114718.GE2486@jama>
References: <1396185772-20185-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396185772-20185-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Mon, 21 Apr 2014 11:47:13 -0000
X-Groupsio-MsgNum: 49397
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tZPt2X9wWvZFnOOr"
Content-Disposition: inline

--tZPt2X9wWvZFnOOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 12:22:52AM +1100, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  recipes-qt/qt5/qtwebkit.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Merged, thanks!

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
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tZPt2X9wWvZFnOOr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVBUYACgkQN1Ujt2V2gBzi/gCePZG5825cv+12alb45R05fbnF
8AEAn1X0ogsc4dc6C5QdFXL6ox93lWKM
=pfbi
-----END PGP SIGNATURE-----

--tZPt2X9wWvZFnOOr--
