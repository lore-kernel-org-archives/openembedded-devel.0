Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 01F96610CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 18:23:29 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so649265eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L6EKHr6fjrYxbJwGPpYypwPWUtF3IefSx5A62GcPgNU=;
	b=JwJI5ONnMdlLUvoJaIUk5xfovG4rlS1HJHBk1ZRsctJilIj4WlCAUaoiX7MIGpV6Ut
	HW3aF7IaNN+Hy3JSD7ry34Pzl7yyUbE6p/7S5YtYJc49Ex9URDmM4WG2dQWJ5yFyrD+P
	YTgNOXAvdCXm4NeeUxuHKIAzVJIoSJ8mieJcsIhIqQIVqVVtosDi3MHqtA1GMbKnmXHc
	Bo8qsRMLIivSOQutNObfMFmLE/R5a6m2mkEzp9UR1ZLqmyukBVrg4CesaHpP9MOROAdW
	iaaWq87OdQBAbi8zgx7jSGALb4JZdryJ1aG+2u7CgWiyVS8WCdMJt8FtBJpMQzeHR196
	7gGg==
X-Received: by 10.14.246.68 with SMTP id p44mr7539746eer.72.1394043809403;
	Wed, 05 Mar 2014 10:23:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q44sm11995794eez.1.2014.03.05.10.23.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 10:23:27 -0800 (PST)
Date: Wed, 5 Mar 2014 19:23:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305182334.GB26981@jama>
References: <1393948468-19612-1-git-send-email-florin.sarbu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1393948468-19612-1-git-send-email-florin.sarbu@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][dora][PATCH] Fix Project ERROR: Module v8 has no public API. make[1]:
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
X-List-Received-Date: Wed, 05 Mar 2014 18:23:32 -0000
X-Groupsio-MsgNum: 48528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VHnRLfjpj1i6VFsc"
Content-Disposition: inline

--VHnRLfjpj1i6VFsc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2014 at 05:54:28PM +0200, Florin Sarbu wrote:
> From: "florin.sarbu" <florin.sarbu@windriver.com>

Cherry-pick 7327781083aea593b4911b6da7105e4984e28c68 from meta-qt5/master

Your version is breaking recipes-qt/qt5/qtwayland_git.bb recipe I guess.

> Cherry-picked from:
> https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896c08=
a634909cb9d1
>=20
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  .../fix.missing.v8.public.api.patch                | 30 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtwayland.inc                       |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.pub=
lic.api.patch
>=20
> diff --git a/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api=
=2Epatch b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.pat=
ch
> new file mode 100644
> index 0000000..6bbbaa1
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
> @@ -0,0 +1,30 @@
> +From b455f5acaec811b70ae3eb896c08a634909cb9d1 Mon Sep 17 00:00:00 2001
> +From: Carsten Munk <carsten.munk@jollamobile.com>
> +Date: Wed, 17 Jul 2013 07:28:04 +0000
> +Subject: [PATCH] Fix Project ERROR: Module v8 has no public API. make[1]=
: ***
> + [sub-qml-compositor-make_first] Error 3
> +
> +Cherry-picked from:
> +https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896c0=
8a634909cb9d1
> +
> +Signed-off-by: Carsten Munk <carsten.munk@jollamobile.com>
> +---
> + qtwayland/examples/qml-compositor/qml-compositor.pro | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/examples/qml-compositor/qml-compositor.pro b/examples/qml-c=
ompositor/qml-compositor.pro
> +index 0bc0b02..e397002 100644
> +--- a/examples/qml-compositor/qml-compositor.pro
> ++++ b/examples/qml-compositor/qml-compositor.pro
> +@@ -2,7 +2,7 @@ DEFINES +=3D QT_COMPOSITOR_QUICK
> +=20
> + LIBS +=3D -L ../../lib
> +=20
> +-QT +=3D quick qml v8
> ++QT +=3D quick qml
> + QT +=3D quick-private
> +=20
> + QT +=3D compositor
> +--=20
> +1.8.4
> +
> diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
> index 40dd803..2d5d6af 100644
> --- a/recipes-qt/qt5/qtwayland.inc
> +++ b/recipes-qt/qt5/qtwayland.inc
> @@ -17,6 +17,7 @@ SRC_URI +=3D " \
>      file://0001-xcbcommon-should-not-be-a-mandatory-dependency.patch \
>      file://0002-Temporarily-patching-this-out-as-Qt5.0.0-does-not-ha.pat=
ch \
>      file://0003-eglCreateImageKHR-requires-the-context-to-be-NULL.patch \
> +    file://fix.missing.v8.public.api.patch \
>  "
> =20
>  QT_WAYLAND_CONFIG ?=3D "wayland-compositor"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VHnRLfjpj1i6VFsc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlMXa6YACgkQN1Ujt2V2gBydFACXSejN1laKEh3vF0e87Ohd+r/q
oQCaAw4wblCHmPvbIrkDoUDvJBOeBuU=
=7c+c
-----END PGP SIGNATURE-----

--VHnRLfjpj1i6VFsc--
