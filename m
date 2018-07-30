Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB2878DC3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 16:23:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b15-v6so13536229wrv.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M07g0BPSoreRnBEJtGNfgjtUZ8i7o6zVa5M+iICk+LM=;
	b=JlTdUv1mftRVIkIdHEufgxiwHNnhwJk22odD56835114JMU0q1fQFPuQaedmXLbey8
	FlgmPxQaOU5Z8iBgJVdleLS09+d9u4jTOXRsBt+Y4UNTEoSsh+/upXdugE0XK+4hvNyb
	Q2A7ruCYT53/mjyOE5iIBKtRGCc5OBANRMl5DRHwoIdGuhzslEVvtOAr+40OlR+T2Bzj
	GmZqSjoVqulaAOyUSn7IB3h6BrRQQNQttDhqV6Pcvx+5QV8R+lA3jGslT9Xfhxmi+imV
	SFUCniPp9/Y7OJhsX91sL+sCNMOtpOHdADXCCJQwP0OnfPRA67slRXbN7jOy2vEPY7+I
	0ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M07g0BPSoreRnBEJtGNfgjtUZ8i7o6zVa5M+iICk+LM=;
	b=bYi9FkOWfrZsnlO1eOX6yS/59q3K5BpVSahD0KYH8D0t0zc6rVww5HuhLVKUbAk0Eq
	uWznJEgT1oLlZHcAlk8zsJiTmGQWQ1+7xKfmp0hcoYg3qemqP9n3EOzvzKTsnhvvCkoq
	ddUbYUz89uDG7rCvwzqzs2Fj2stTlx4/wetjgKP79zETt4ecl+5P0Gy6NDRgTEMrBmAu
	bgtQy2nqhFbW+IDI/6Rvj+2CUiWXLNInEd1MZGT5rsNa9gguBe+T9cM0VYdy2ynbRHwq
	laadjqJ8hdpOU3vDsY3mHYort8Dxl5GdwiSBvnpKB0u/gHjC+5w078tnn+nfwPK/U60R
	0mBw==
X-Gm-Message-State: AOUpUlG7PgM6bOdCu9+Icclwf3MrlMAf/j/te0Ozqg7LlQ7X4vo9K71f
	7dz3KsD6thOAP2Fd+wT9VD9lUInH
X-Google-Smtp-Source: AAOMgpd5yBKEElumeOYCHYtSriFVTQso8UUe3qCYUN7sznabSHSnfcaVyLeZHenYBQmsSnQtiZULBQ==
X-Received: by 2002:adf:c98d:: with SMTP id
	f13-v6mr14039747wrh.148.1532967785059; 
	Mon, 30 Jul 2018 09:23:05 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm23292503wrw.78.2018.07.30.09.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jul 2018 09:23:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2018 18:23:07 +0200
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20180730162307.GA1361@jama>
References: <20180730161223.9299-1-oleksandr.kravchuk@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <20180730161223.9299-1-oleksandr.kravchuk@pelagicore.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org,
	Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [meta-oe][PATCH] Revert "glibmm: Upgrade to 2.56.0"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 16:23:04 -0000
X-Groupsio-MsgNum: 73651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 06:12:23PM +0200, Oleksandr Kravchuk wrote:
> sumo branch of poky contains glib v2.54 which makes compilation of this
> package fail due to nonexistent functions in the library used by the
> C++ bindings.

This explanation doesn't make any sense to me.

With sumo branch of poky use sumo branch of meta-oe which still has
2.54.1 version.

>=20
> This reverts commit acfba081bbe49fd9dccbf12be6535d5342c6d747.
> ---
>  .../0001-Glib-Threads-Private-Fix-gobj.patch  | 40 +++++++++++++++++++
>  .../{glibmm_2.56.0.bb =3D> glibmm_2.54.1.bb}    |  5 ++-
>  2 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Thread=
s-Private-Fix-gobj.patch
>  rename meta-oe/recipes-core/glib-2.0/{glibmm_2.56.0.bb =3D> glibmm_2.54.=
1.bb} (86%)
>=20
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Priva=
te-Fix-gobj.patch b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-=
Private-Fix-gobj.patch
> new file mode 100644
> index 000000000..7899022f1
> --- /dev/null
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-=
gobj.patch
> @@ -0,0 +1,40 @@
> +From 838fe84c2ddcc9af51c34f751defbf3dd0ba8a06 Mon Sep 17 00:00:00 2001
> +From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
> +Date: Wed, 20 Dec 2017 20:00:32 +0100
> +Subject: [PATCH] Glib::Threads::Private: Fix gobj()
> +
> +Bug 791711
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Backport [https://github.com/GNOME/glibmm/commit/37d57a=
e9572b7d74aa385a30313eceae7f2d3fce]
> + glib/glibmm/threads.h | 2 +-
> + glib/src/threads.hg   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/glib/glibmm/threads.h b/glib/glibmm/threads.h
> +index f7e2b82a..2c0cbe8c 100644
> +--- a/glib/glibmm/threads.h
> ++++ b/glib/glibmm/threads.h
> +@@ -657,7 +657,7 @@ public:
> +    */
> +   inline void replace(T* data);
> +=20
> +-  GPrivate* gobj() { return gobject_; }
> ++  GPrivate* gobj() { return &gobject_; }
> +=20
> + private:
> +   GPrivate gobject_;
> +diff --git a/glib/src/threads.hg b/glib/src/threads.hg
> +index 86d7a17b..c82a6130 100644
> +--- a/glib/src/threads.hg
> ++++ b/glib/src/threads.hg
> +@@ -628,7 +628,7 @@ public:
> +    */
> +   inline void replace(T* data);
> +=20
> +-  GPrivate* gobj() { return gobject_; }
> ++  GPrivate* gobj() { return &gobject_; }
> +=20
> + private:
> +   GPrivate gobject_;
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb b/meta-oe/rec=
ipes-core/glib-2.0/glibmm_2.54.1.bb
> similarity index 86%
> rename from meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
> rename to meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
> index 2f048d2f6..4706432ab 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
> @@ -13,9 +13,10 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.ge=
tVar('PV').split('.')[1]}"
>  SRC_URI =3D " \
>      ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV=
}.tar.xz \
>      file://remove-examples.patch \
> +    file://0001-Glib-Threads-Private-Fix-gobj.patch \
>  "
> -SRC_URI[md5sum] =3D "5aa7a60084fe3e01d746c96f4a115302"
> -SRC_URI[sha256sum] =3D "6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9=
b1e816c5209e79a9"
> +SRC_URI[md5sum] =3D "dee5ebe309f5976c3dacfcf5c43a062b"
> +SRC_URI[sha256sum] =3D "7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b=
4be5b38802bf6a4a"
> =20
>  do_install_append() {
>      install -d ${D}${datadir}/glibmm-2.4
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW187aQAKCRA3VSO3ZXaA
HC5hAJwMgBiqXNHkEzjF/0wmrGJL5nzemACfUSHXsRr4VrkI6yT8DskiKu1yJLs=
=0ker
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
