Return-Path: <martin.jansa@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 23A9665E01
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 00:19:50 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q107so4595642qgd.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s9BN9UbVGIlrCGUkWsmsAjpARbznf1UoZ2TsLv2ogXA=;
	b=yqhdtqYXKs7zaPBfbqg2CdfeljB9HA0Hce+kl7bJ9xbSwNx+XWKxSYxFgyxp8G1wXN
	sZRCnSEi82ZG50bs8chOHReHS2MvUBSGuDx6hLq/d13rTJ3lFK0ctLMfjsOBBa+rXRnB
	2dIAZD3jBaEGpPiS7c7kfGO6QbRTPvS44ZmQsSqBNey3fnST2V8RGKkGUqZroPhytnSB
	szI2AvpzQ+4JbonA63X1hDqOMJiSuyrPaF5Vv1vVywHSzYXrcfRGbYRKqfj6yb/UuzTz
	3Y4HoRRS0ga+btlBU3R8ndBVqQWXx6FOxgOhag+V82EfDX2wckBi3VXOffc71a8UXssn
	lgpg==
X-Received: by 10.140.98.116 with SMTP id n107mr15038190qge.93.1398471590218; 
	Fri, 25 Apr 2014 17:19:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o16sm17262116qax.30.2014.04.25.17.19.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 17:19:49 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Apr 2014 02:19:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140426001959.GB2486@jama>
References: <1398466300-8008-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1398466300-8008-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: enable xkb by default if x11 is in DISTRO_FEATURES
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
X-List-Received-Date: Sat, 26 Apr 2014 00:19:51 -0000
X-Groupsio-MsgNum: 49514
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P4O8mEax7ExP9NSJ"
Content-Disposition: inline

--P4O8mEax7ExP9NSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2014 at 12:51:39AM +0200, Andreas Oberritter wrote:
> Fixes "Error: -no-xkbcommon is not supported on XCB platform plugin."
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes-qt/qt5/qtbase.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 8aefb5c..6ba4bd5 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -35,7 +35,7 @@ RDEPENDS_${PN}-tools +=3D "perl"
>  # http://qt.gitorious.org/qt/qtdeclarative/commit/e988998a08b1420ed10bd0=
2d9d4b3b8ed2289df9
>  PACKAGECONFIG_GL ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl=
', '', d)}"
>  PACKAGECONFIG_FB ?=3D "${@base_contains('DISTRO_FEATURES', 'directfb', '=
directfb', '', d)}"
> -PACKAGECONFIG_X11 ?=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb =
xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor g=
tkstyle', '', d)}"
> +PACKAGECONFIG_X11 ?=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb =
xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor g=
tkstyle xkb', '', d)}"

As you're already looking into this, can you please check this issue
reported by last 2 test-dependencies builds?

qtbase/qtbase-plugins/latest lost dependency on  libxcb-render libxkbcommon=
 xcb-util-renderutil

Thanks

>  PACKAGECONFIG_FONTS ?=3D ""
>  PACKAGECONFIG_SYSTEM ?=3D "jpeg libpng zlib"
>  PACKAGECONFIG_MULTIMEDIA ?=3D "${@base_contains('DISTRO_FEATURES', 'puls=
eaudio', 'pulseaudio', '', d)}"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P4O8mEax7ExP9NSJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNa+68ACgkQN1Ujt2V2gBze1QCgmsq4HvaLo/aKRMRi5KpsyDlA
hY4Anj6GfyLOPmlF24UNAAg/IZr5xRIY
=NYwD
-----END PGP SIGNATURE-----

--P4O8mEax7ExP9NSJ--
