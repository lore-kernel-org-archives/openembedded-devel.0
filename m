Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11AA3731F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 10:52:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so1055368wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fAhfg7B5iktrbhxr6hmvRPxgBgayuv+cki7oCwdukpY=;
	b=uOCGRf9Eks1P18UMsO4GOyYB8WZGNhUAeGFBh1gWkF7xNo7o7fWxRqKVF97ae7YyQx
	9b1gc0PgVutyNdYnTc/hGu00j8Ts0lo7mWc2NBn3q/l+K7L/Vv6U+PIgpwU963PhnhSQ
	d7syu1Rveh45ZM7rMokOohhIGYVJaF7x9ugK6i7V86dqtdm5EM0CrM5I6bv2gJRPR9Oi
	/ZRx4zvdKMoAWVnWASVoiaZst/2sDT5hiinQbt/8VOQYJpkezL7ciMsZHqXVTnbD3c/f
	xLsOlebgWc6IOr0tGGSTkhF127CdUd7wJ4F2z8NcZMKZ6GijbK6IMQoAeRyLgHkuzDRz
	1oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fAhfg7B5iktrbhxr6hmvRPxgBgayuv+cki7oCwdukpY=;
	b=MeJdi51yolQzw8WMzLTSxX/4Z52lL/nn/ymY/7RA21YcLL1lJXA7B5noq/FCrDOGNF
	yYjqBau7EDnm8M0zwlcU4iQ0o+CoYyiLrDGZ1U6uK6sTQKRtZaFqkqCjiKoSCmCjVT1I
	hnlS69eR505SjRFgAQZhXaHzQinz9FPChvSnlpYNizqKxNuVhJERnlmMtUTr5kamlDkI
	/lpG8lfGwxG7RFF5BcHAvJskWpBpwhGNxjXUMEgMcolcLeYpKSJFRj+m13vEn/eCLsTr
	howzkri/enlwiTpQg5k4KNbTZx5YkrhaRq45x5pMSBCGgQJhB8+g0iWoiZJq7BYN0w/9
	YpLA==
X-Gm-Message-State: AEkooutQhfEQTFFmgZRUtPozV5ZTL34qXW5KodK1FKINWZvRCJTz3T05mw/P4s1+RmvY6A==
X-Received: by 10.195.18.129 with SMTP id gm1mr19979207wjd.148.1469530340672; 
	Tue, 26 Jul 2016 03:52:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id f10sm305051wje.14.2016.07.26.03.52.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jul 2016 03:52:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Jul 2016 12:52:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160726105221.h2moj7mrfihp5v74@jama>
References: <cover.1469524511.git.jackie.huang@windriver.com>
	<c5db424fbf578e677fb4b731f96aa48ee97ff4d8.1469524511.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c5db424fbf578e677fb4b731f96aa48ee97ff4d8.1469524511.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH 1/2] unixodbc: Add the new recipe
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
X-List-Received-Date: Tue, 26 Jul 2016 10:52:21 -0000
X-Groupsio-MsgNum: 62339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hqyoiyczqxhuz4jl"
Content-Disposition: inline

--hqyoiyczqxhuz4jl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 05:18:07AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> unixODBC is an Open Source ODBC sub-system and an
> ODBC SDK for Linux, Mac OSX, and UNIX.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../do-not-use-libltdl-source-directory.patch      | 43 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb | 27 ++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-oe/recipes-support/unixodbc/files/do-not-use-lib=
ltdl-source-directory.patch
>  create mode 100644 meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
>=20
> diff --git a/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-so=
urce-directory.patch b/meta-oe/recipes-support/unixodbc/files/do-not-use-li=
bltdl-source-directory.patch
> new file mode 100644
> index 0000000..69d26ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-di=
rectory.patch
> @@ -0,0 +1,43 @@
> +Subject: [PATCH] do not use libltdl source directory
> +
> +Don't use the included libltdl, use the one provided
> +by our libtool instead.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Song.Li <Song.Li@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + Makefile.am  | 1 -
> + configure.ac | 2 --
> + 2 files changed, 3 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index e881cca..1321802 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -5,7 +5,6 @@ SUBDIRS =3D \
> + 	log \
> + 	lst \
> + 	ini \
> +-    libltdl \
> + 	odbcinst \
> + 	DriverManager \
> + 	exe \
> +diff --git a/configure.ac b/configure.ac
> +index 218502f..d50b7af 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -136,9 +136,7 @@ dnl AC_CONFIG_MACRO_DIR([libltdl/m4])
> + dnl LT_CONFIG_LTDL_DIR([libltdl])
> + dnl LTDL_INIT
> +=20
> +-LT_CONFIG_LTDL_DIR([libltdl])
> + LT_INIT([dlopen])
> +-LTDL_INIT([convenience])
> +=20
> + dnl Substitute INCLTDL and LIBLTDL in the Makefiles
> + AC_SUBST(LTDLINCL)
> +--=20
> +2.8.1
> +
> diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb b/meta-oe=
/recipes-support/unixodbc/unixodbc_2.3.4.bb
> new file mode 100644
> index 0000000..23d6d04
> --- /dev/null
> +++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "An Open Source ODBC sub-system"
> +DESCRIPTION =3D "unixODBC is an Open Source ODBC sub-system and an ODBC =
SDK \
> +for Linux, Mac OSX, and UNIX."
> +
> +HOMEPAGE =3D "http://www.unixodbc.org/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7b37bf80a3df5a65b355433ae36d=
206"
> +
> +DEPENDS =3D "libtool mysql5"
> +
> +SRC_URI =3D "ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${PV}.tar.gz \
> +           file://do-not-use-libltdl-source-directory.patch \
> +"
> +SRC_URI[md5sum] =3D "bd25d261ca1808c947cb687e2034be81"
> +SRC_URI[sha256sum] =3D "2e1509a96bb18d248bf08ead0d74804957304ff7c6f8b2e5=
965309c632421e39"
> +
> +inherit autotools-brokensep
> +
> +S =3D "${WORKDIR}/unixODBC-${PV}"
> +
> +EXTRA_OEMAKE +=3D "LIBS=3D-lltdl"
> +
> +do_configure_prepend() {
> +	# old m4 files will cause libtool version don't match
> +	rm -rf m4/*
> +	rm -fr libltdl

Don't use tabs in meta-oe layers. I'll fix it this time, but next time
just reject it.

> +}
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hqyoiyczqxhuz4jl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleXQOQACgkQN1Ujt2V2gBwC6wCgpvBjgCjitmr6NptDAhKOX0Cl
+bMAn0/YQNK3LmFF/D6svyS7poodKdHC
=/bxk
-----END PGP SIGNATURE-----

--hqyoiyczqxhuz4jl--
