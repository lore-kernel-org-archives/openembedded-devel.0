Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 78F016F0FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 21:05:27 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id c13so855693eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HKLaRBddqlJNFjGR9IQZ2udmjdJcB0Rt21QiV0cPaSA=;
	b=K3eqYeylY0SV/jTTdZ8Pdthv3x1sTf5M3uVmW2mLhV4qn4LUMkx7E+kGz92Y7CheRw
	eP7MFzN92QvRHOywkLu12SzE9tNns/jQxZvKxGW2slA0z6yyoAZQKr40ZRAk+YcWQkZu
	jr3Poc1vq0gf/n3OUDC2bvmB2oPpBRPBspmmA70GQM4SyH8V2NXqDMDrxUyLwNUilIUr
	mWb1Yr+lCQLHcxM+7vXy8WyhdRC+z9sEt7nsnLgxijJBy1Q09GJmmYfZTKJAyAL08mSi
	txXbKUF0hz9487mVsQAyF4l4QW7DFCTKg8k0iALSyOnP6CIkuZ/vdqjfWoxVE87fyVpa
	1CFw==
X-Received: by 10.14.203.71 with SMTP id e47mr5262560eeo.99.1393448727815;
	Wed, 26 Feb 2014 13:05:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm8319212eeh.13.2014.02.26.13.05.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 13:05:26 -0800 (PST)
Date: Wed, 26 Feb 2014 22:05:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140226210522.GT26981@jama>
References: <1393446351-9280-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1393446351-9280-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] qtwebkit: accept gstreamer 0.10 as an option
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
X-List-Received-Date: Wed, 26 Feb 2014 21:05:31 -0000
X-Groupsio-MsgNum: 48370
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rHeCoQbvuHTnkkIZ"
Content-Disposition: inline

--rHeCoQbvuHTnkkIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2014 at 09:25:51PM +0100, Andreas Oberritter wrote:
> There's no configuration knob, though. QtWebKit will prefer
> gstreamer 1.0 if available.

Can you please add configuration knob first?

The problem is that without the knob it will be undeterministic, with
gstreamer010 in PACKAGECONFIG you can run 2nd build with gstreamer10
already staged for some other component and the resulting qtwebkit will
be different than in 1st build.

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes-qt/qt5/qtwebkit.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index aea9dad..5e96f39 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -5,7 +5,11 @@ LIC_FILES_CHKSUM =3D "file://Source/WebCore/rendering/Re=
nderApplet.h;endline=3D22;md
>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=3D2=
1;md5=3Db4fbe9f4a944f1d071dba1d2c76b3351 \
>                      file://Source/JavaScriptCore/parser/Parser.h;endline=
=3D21;md5=3Dbd69f72183a7af673863f057576e21ee"
> =20
> -DEPENDS +=3D "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqli=
te3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
> +DEPENDS +=3D "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqli=
te3 glib-2.0 libxslt"
> +
> +PACKAGECONFIG ??=3D "gstreamer10"
> +PACKAGECONFIG[gstreamer010] =3D ",,gstreamer gst-plugins-base"
> +PACKAGECONFIG[gstreamer10] =3D ",,gstreamer1.0 gstreamer1.0-plugins-base"
> =20
>  # qtwebkit gets terribly big when linking with all debug info, disable b=
y default
>  QTWEBKIT_DEBUG =3D "QMAKE_CFLAGS+=3D-g0 QMAKE_CXXFLAGS+=3D-g0"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rHeCoQbvuHTnkkIZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMOVxIACgkQN1Ujt2V2gBxJXACgm3ljvVtDSvHxb5eGcLWkjl6O
zC0An2kgdrZu506b0AszWxj6kNVM9gLm
=7URY
-----END PGP SIGNATURE-----

--rHeCoQbvuHTnkkIZ--
