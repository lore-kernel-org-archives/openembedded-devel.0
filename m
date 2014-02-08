Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3B86E30D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Feb 2014 18:46:14 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so396921eak.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Feb 2014 10:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FxKBZq4ZO3fGfsaWpVQCk/IeFV/bliqKTT8HI1FZWlc=;
	b=z4aR62s1W/MQuu3t2mGNGz9iv90+7sMlDu42Ix7vwzH13h44dOa7YykC7/KHZHge4j
	MP6W/h4xnz2QnvVVobKHGpCChDtXz6z4D4bomJ1Oi5bJWXFo1NcCxq8UF5HlPYqPFti0
	wDaH8hnabcroWioY9Ou9Ur813akS05Xp/xHuqm0400p8pFHtq+HxRg4GW9xtsAie+V4O
	jHGdDW5oUKXC/vwmvLV0n0NC5jjYHz5sbtbdKjYgC70TTrCl2X1SGn9VP2S4CtZa0p5q
	sgzpsHKESUmBxYvVOjBUoMWAiyF9hNQleAyaZZEK82xhdKdtV8mUO3R6o6K855BKYps1
	Z8pg==
X-Received: by 10.14.202.8 with SMTP id c8mr3065065eeo.88.1391885174608;
	Sat, 08 Feb 2014 10:46:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x2sm31961241eeo.8.2014.02.08.10.46.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Feb 2014 10:46:13 -0800 (PST)
Date: Sat, 8 Feb 2014 19:46:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140208184629.GP3698@jama>
References: <1391628912-17880-1-git-send-email-schnitzeltony@googlemail.com>
	<1391628912-17880-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1391628912-17880-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-qt5 2/2] qtwayland: fix qml-compositor shader
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
X-List-Received-Date: Sat, 08 Feb 2014 18:46:14 -0000
X-Groupsio-MsgNum: 48072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pwWdILMQNxDD/Cps"
Content-Disposition: inline

--pwWdILMQNxDD/Cps
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2014 at 08:35:12PM +0100, Andreas M=FCller wrote:
> running
>=20
> | qmlcompositor -platform eglfs
> | qmlscene -platform wayland foo.qml
>=20
> causes
>=20
> QOpenGLShader::compile(Fragment): Compile failed.
> ERROR: 0:6: 'float' : No precision defined for this type
> ERROR: 0:7: 'vec4' : No precision defined for this type
> ERROR: 0:8: 'float' : No precision defined for this type
> ERROR: 0:11: 'vec4' : No precision defined for this type
> ERROR: 0:12: 'vec3' : No precision defined for this type
> ERROR: 0:13: 'vec3' : No precision defined for this type
> ERROR: 6 compilation errors. No code generated.
>=20
> *** Problematic Fragment shader source code ***
>=20
>     uniform sampler2D source;
>     uniform float qt_Opacity;
>     uniform vec4 color;
>     uniform float blend;
>     varying highp vec2 qt_TexCoord0;
>     void main() {
>         vec4 sourceColor =3D texture2D(source, qt_TexCoord0);
>         vec3 delta =3D sourceColor.rgb - vec3(0.5);
>         vec3 lowerContrast =3D vec3(0.5) + 0.4 * delta;
>         gl_FragColor =3D qt_Opacity * mix(sourceColor, color * sourceColo=
r.a * dot(lowerContrast, vec3(11, 16, 5) * (1. /  32.)), blend);
>     }
>=20
> ***
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...002-Fix-ConstrastEffect-in-qml-compositor.patch | 48 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtwayland_git.bb                    |  4 ++
>  2 files changed, 52 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-=
qml-compositor.patch
>=20
> diff --git a/recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-com=
positor.patch b/recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-co=
mpositor.patch
> new file mode 100644
> index 0000000..1b40be6
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-compositor=
=2Epatch
> @@ -0,0 +1,48 @@
> +From 309e9b03d24eb6b0b8fff04d883329c2f93a6a1c Mon Sep 17 00:00:00 2001
> +From: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
> +Date: Sun, 29 Dec 2013 14:15:41 +0100
> +Subject: [PATCH] Fix ConstrastEffect in qml-compositor
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Specify precision to make the shader working.
> +
> +Change-Id: I055fe47e1073403dc981274236fa82e091e0eca4
> +Reviewed-by: J=F8rgen Lind <jorgen.lind@digia.com>
> +Reviewed-by: Andy Nichols <andy.nichols@digia.com>
> +Upstream-status: applied

This one should be Backport, but please check jansa/qt5-5.2.1 branch,
I've updated all recipes for 5.2.1 release and newer qtwayland revision
used there includes this patch already.

Your qtbase patch still does apply, I'll add that to branch now.

> +---
> + examples/qml-compositor/ContrastEffect.qml | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/examples/qml-compositor/ContrastEffect.qml b/examples/qml-c=
ompositor/ContrastEffect.qml
> +index 5159950..c284b29 100644
> +--- a/examples/qml-compositor/ContrastEffect.qml
> ++++ b/examples/qml-compositor/ContrastEffect.qml
> +@@ -75,15 +75,15 @@ ShaderEffect {
> +     vertexShader: source && source.isYInverted ? vShaderInvertedY : vSh=
ader
> +=20
> +     fragmentShader: "
> +-    uniform sampler2D source;
> +-    uniform float qt_Opacity;
> +-    uniform vec4 color;
> +-    uniform float blend;
> ++    uniform lowp sampler2D source;
> ++    uniform highp float qt_Opacity;
> ++    uniform highp vec4 color;
> ++    uniform highp float blend;
> +     varying highp vec2 qt_TexCoord0;
> +     void main() {
> +-        vec4 sourceColor =3D texture2D(source, qt_TexCoord0);
> +-        vec3 delta =3D sourceColor.rgb - vec3(0.5);
> +-        vec3 lowerContrast =3D vec3(0.5) + 0.4 * delta;
> ++        highp vec4 sourceColor =3D texture2D(source, qt_TexCoord0);
> ++        highp vec3 delta =3D sourceColor.rgb - vec3(0.5);
> ++        highp vec3 lowerContrast =3D vec3(0.5) + 0.4 * delta;
> +         gl_FragColor =3D qt_Opacity * mix(sourceColor, color * sourceCo=
lor.a * dot(lowerContrast, vec3(11, 16, 5) * (1. /  32.)), blend);
> +     }
> +     "
> +--=20
> +1.8.3.1
> +
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index 640373e..cf91908 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -5,3 +5,7 @@ require ${PN}.inc
>  # qt5-git PV is only to indicate that this recipe is compatible with qt5=
 5.2.0
> =20
>  SRCREV =3D "3e9412e2fd91e64a565ed8ddbef76f57ca9413d5"
> +
> +SRC_URI +=3D " \
> +    file://0002-Fix-ConstrastEffect-in-qml-compositor.patch \
> +"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pwWdILMQNxDD/Cps
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL2e4UACgkQN1Ujt2V2gBz2LgCffay48k3NYwwOlusVA0oPCr49
ehsAn0sfEuSd/aHe5Bv+i/nOVTlhelwX
=oEG3
-----END PGP SIGNATURE-----

--pwWdILMQNxDD/Cps--
