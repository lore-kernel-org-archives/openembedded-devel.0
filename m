Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0F308719DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:54:20 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id i7so3392982wjf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fjIN0mRmQCWODlZoMt9od4mP+G1Z+ngJ+aUh9lrIQ5c=;
	b=uwmwSAWO7hXQ/8B/qP/aWmzNTE8jwutbobkAk1vJadUMvi+qzPamrcfsSc6dJsPs6+
	ywGobruSsKX9VyS8Rk0ULGPyaXzCyVL0+ivluDNblJTKpK4KVKlSVtGpvul5nAYwOYZJ
	DrLJ0lrgvIrz4hx5k7UMpXGavuZNa4vjBlYrCbDBJxeseqYUtjbe0u5uE2B6wqwPL61s
	UsXSSUxGVlnJIwbC4QWgwfuHKEBbyUFjzI/0BJEMXUAtUlYqlg3lEuM/BOF4zczQFRzS
	+ULhFLYjcsDN//Mv8sRCAUuHPNH0LO0fm+l5XXiHbwbWhojBMSQxpSV92iD5+2GzBiXU
	xW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fjIN0mRmQCWODlZoMt9od4mP+G1Z+ngJ+aUh9lrIQ5c=;
	b=rvDXM7lxtW+qCyxzqlJWDd99J1hbAj/BVwndV5jRxjMqaYXmOqsCyTDLN91AwYv9m8
	FtOUni6ThFnso0pKKLwllp5G79zAoFbggYNhNzF9HY0UGM3VMu8Ina054EkvZ3Yz5Mbs
	HkGrzAwxVsTXELn0YfRGgwRfjHrIZGS9fqQEqfcYKViOiKfu3n1onCUO6woda1AErnKO
	v3xFTSnm8Ey6PSTWDZ22TfUsp32fqyfQtDXb8qNkJ5eIGf1Nn38r+AX9WZytdVlytA5J
	JjbJ3dtn6j3o3g4qmT5hE+l1xs1wKmHR8g/MHeA/EDLS0gy2Ht8o0h4H4Gu+fhTqH/7F
	0VkQ==
X-Gm-Message-State: AIkVDXKLMef9HctOb6Q3ztZjG04FGvDvsGX2KkFTfghFuerXXmTgipAyY4m7RQElHhd98Q==
X-Received: by 10.223.171.149 with SMTP id s21mr33421358wrc.64.1485356060866; 
	Wed, 25 Jan 2017 06:54:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c202sm31715392wmd.10.2017.01.25.06.54.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 06:54:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 15:54:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170125145422.GB3260@jama>
References: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH] nano: upgrade to 2.7.4
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
X-List-Received-Date: Wed, 25 Jan 2017 14:54:21 -0000
X-Groupsio-MsgNum: 64844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 12:36:28PM +0100, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

nano-2.7.4: nano rdepends on file, but it isn't a build dependency,
missing file in DEPENDS or PACKAGECONFIG? [build-deps]

> ---
>  .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12 ------=
------
>  meta-oe/recipes-support/nano/nano.inc                        |  6 +++---
>  meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8 ------=
--
>  meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  6 ++++++
>  4 files changed, 9 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.incl=
udedir.patch
>  delete mode 100644 meta-oe/recipes-support/nano/nano_2.2.5.bb
>  create mode 100644 meta-oe/recipes-support/nano/nano_2.7.4.bb
>=20
> diff --git a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.=
patch b/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> deleted file mode 100644
> index 0f224be..0000000
> --- a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -uNr nano-2.2.5.orig//configure.ac nano-2.2.5/configure.ac
> ---- nano-2.2.5.orig//configure.ac	2010-08-06 03:00:51.000000000 +0200
> -+++ nano-2.2.5/configure.ac	2010-08-10 14:11:52.000000000 +0200
> -@@ -442,7 +442,7 @@
> -     AC_CHECK_HEADERS(ncurses.h)
> -=20
> -     if test x$enable_utf8 !=3D xno; then
> --	AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB=3D"-lncursesw" CPPFLAGS=3D=
"-I/usr/include/ncursesw $CPPFLAGS" CURSES_LIB_NAME=3Dncursesw CURSES_LIB_W=
IDE=3Dyes])
> -+	AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB=3D"-lncursesw" CURSES_LIB_=
NAME=3Dncursesw CURSES_LIB_WIDE=3Dyes])
> -     fi
> -=20
> -     if eval "test x$CURSES_LIB_NAME =3D x"; then
> diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-supp=
ort/nano/nano.inc
> index 0f31c6c..8a9f1e8 100644
> --- a/meta-oe/recipes-support/nano/nano.inc
> +++ b/meta-oe/recipes-support/nano/nano.inc
> @@ -12,8 +12,8 @@ INC_PR =3D "r3"
> =20
>  PV_MAJOR =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> =20
> -SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
> +SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
> =20
> -inherit autotools gettext
> +inherit autotools gettext pkgconfig
> =20
> -PACKAGECONFIG[tiny] =3D "--enable-tiny,--enable-all,"
> +PACKAGECONFIG[tiny] =3D "--enable-tiny,"
> diff --git a/meta-oe/recipes-support/nano/nano_2.2.5.bb b/meta-oe/recipes=
-support/nano/nano_2.2.5.bb
> deleted file mode 100644
> index e656f46..0000000
> --- a/meta-oe/recipes-support/nano/nano_2.2.5.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -include nano.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://ncursesw.includedir.patch"
> -
> -SRC_URI[md5sum] =3D "77a10a49589f975ce98350a4527a2ebf"
> -SRC_URI[sha256sum] =3D "9015945d1badabbada203b37c4779d3dd1066234235c714d=
eb439989c5cd7d9e"
> diff --git a/meta-oe/recipes-support/nano/nano_2.7.4.bb b/meta-oe/recipes=
-support/nano/nano_2.7.4.bb
> new file mode 100644
> index 0000000..5016f2e
> --- /dev/null
> +++ b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> @@ -0,0 +1,6 @@
> +include nano.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "c011c7f9e47cb1da27d4e7cc8b56ec6a"
> +SRC_URI[sha256sum] =3D "752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7=
259a63e225b659b9"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIi8HgAKCRA3VSO3ZXaA
HOxqAJ9bXrfHsus2e0XtwRz+dxrLTcCKnwCZAZCiaCYRzEoKzDueQ4Sf6SusYRk=
=3tbQ
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
