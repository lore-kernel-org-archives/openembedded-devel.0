Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 892006D128
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:43:03 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so4707044eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5uKNnWH/PQim4FZo+1MmswEIDP0g0HGleE9vNNt0lkI=;
	b=JADfyG4edDkT3KR51QRKdqw8Q08NvCq7UetdOhjMepmwxPjyrZDDGqRbeAUMAJSFLE
	wAeuvfkWNMwN/p01XGkR1mozBoYu5XsVgVSd5RorPzjSJZBRgxWXpfm/M3W2RtOzDjLH
	9Bgbc8YY8jBl++OYKWd1q6lJjRVqcnZ6t9VEckNOvkj9aMoF/HX/xyXwqlEGoite49dp
	Ivc+YRexpkia3PeeyQNzIJAtcVL3HttlrIihoAJB481UXc50RLOI+R9lwehAmu+kg2oT
	rcBgK6hbVO9dZZcCUm9UMi3wJNOWUNwYeas3gbCGJ1qbP67X6i+u/DEgfEJW4z8Vspmh
	OoMw==
X-Received: by 10.14.215.199 with SMTP id e47mr119933eep.107.1385559782666;
	Wed, 27 Nov 2013 05:43:02 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm19742070eem.9.2013.11.27.05.42.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2013 05:43:01 -0800 (PST)
Date: Wed, 27 Nov 2013 14:43:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131127134302.GP2870@jama>
References: <1385548830-6541-1-git-send-email-nickdademo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1385548830-6541-1-git-send-email-nickdademo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] opencv: bump SRCREV and make recipe multilib build compatible
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
X-List-Received-Date: Wed, 27 Nov 2013 13:43:03 -0000
X-Groupsio-MsgNum: 47279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oN4OvwWIcd1E23D1"
Content-Disposition: inline

--oN4OvwWIcd1E23D1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 09:40:30PM +1100, Nick D'Ademo wrote:
> Pass LIB_SUFFIX to CMake during a multilib build so that the generated li=
brary folder has the correct suffix.
>=20
> Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_2.4.bb |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recip=
es-support/opencv/opencv_2.4.bb
> index 9dd9cd0..8d4d8da 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -9,7 +9,7 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0"
> =20
> -SRCREV =3D "c5afaa4e8dfe507e87531f7688b9cf65c1f701c6"
> +SRCREV =3D "1253c2101b22b9e89400553fd220858cda8d6ea5"
>  SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
>             file://opencv-fix-pkgconfig-generation.patch \
>  "
> @@ -27,6 +27,8 @@ EXTRA_OECMAKE =3D "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=3D${=
STAGING_LIBDIR}/${PYTHON_DIR}
>                   -DWITH_GSTREAMER=3DOFF \
>                   -DCMAKE_SKIP_RPATH=3DON \
>                   ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENA=
BLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)=
} \
> +                 ${@bb.utils.contains("libdir", "/usr/lib64", "-DLIB_SUF=
FIX=3D64", "", d)} \
> +                 ${@bb.utils.contains("libdir", "/usr/lib32", "-DLIB_SUF=
FIX=3D32", "", d)} \

do you need contains here? Why not base_conditional?
>  "
> =20
>  PACKAGECONFIG ??=3D "eigen gtk jpeg libav png tiff v4l"
> @@ -88,4 +90,10 @@ RDEPENDS_python-opencv =3D "python-core python-numpy"
>  do_install_append() {
>      cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
>      sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> +
> +    # Move Python files into correct library folder (for multilib build)
> +    if [ "$libdir" !=3D "/usr/lib" ]; then
> +        mv ${D}/usr/lib/* ${D}/${libdir}/
> +        rm -rf ${D}/usr/lib
> +    fi
>  }
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oN4OvwWIcd1E23D1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKV9uYACgkQN1Ujt2V2gByAWgCfcIHxrIL5I2uYQ+XcP8lEscyr
cDwAnjj3BA2S2IKtHfaTtxXBZPzWE9YY
=hT43
-----END PGP SIGNATURE-----

--oN4OvwWIcd1E23D1--
