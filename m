Received: from mail-yh0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFpK2-0001ro-AV
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 18:18:38 +0100
Received: by mail-yh0-f41.google.com with SMTP id 47so209207yhr.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o5Ojr9twmidd0Uw9z4sL/B+PlkbjjYQPIhzDke3ufbc=;
	b=eanqSkiMDzDzEw0LayHwDGgDNz6wClqbkKfeEqOETUhlQo1A059CsVWntw2bpJc99L
	hRIsvpI+uYsLOe2lSwJT4dWl8viCFrtOP1C+qCSnaY7Feqot7UYW8V4X4s72DMugtcgD
	GtKkLHWzIRZu/bOyDnbBIjEvcp8Ejcz1hMZ4suN8jN0elGlni9Q+LJJpaFavTF6ZPRG8
	yvrCje6Sd08CUzTuRDRFnn7g2UIVscG/lprHomt2vmyf1k+P6+Yd8AvF2Wm6E10kIY7p
	dy2OtUcHWeClj8zCXuRdBnE6ELKvX4zWtTylIt1SqAJJJV2YQk4L42KTtpw2v6QfciA3
	bt/w==
X-Received: by 10.236.88.135 with SMTP id a7mr16366035yhf.143.1363194107131;
	Wed, 13 Mar 2013 10:01:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u41sm36433758yhb.20.2013.03.13.10.01.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 10:01:46 -0700 (PDT)
Date: Wed, 13 Mar 2013 18:01:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313170139.GD3260@jama>
References: <CAP9ODKoT2KTTWB=DiLXwyjy7K_2wK8Osa2_i9tmbsbQXS8s+4Q@mail.gmail.com>
	<1361449895-30626-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1361449895-30626-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] onig: do not use system headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 17:18:49 -0000
X-Groupsio-MsgNum: 43542
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="irrheVdOic6+Kbak"
Content-Disposition: inline

--irrheVdOic6+Kbak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2013 at 01:31:35PM +0100, Marcin Juszkiewicz wrote:
> When build on host with older eglibc (Ubuntu 12.04) build fails with:

Applied, thanks!

>=20
> /tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h=
:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-pr=
edef.h> instead."
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../onig/files/do-not-use-system-headers.patch     | 44 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/onig/onig_5.9.3.bb         |  3 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/onig/files/do-not-use-system-=
headers.patch
>=20
> diff --git a/meta-oe/recipes-support/onig/files/do-not-use-system-headers=
=2Epatch b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.pat=
ch
> new file mode 100644
> index 0000000..b93602a
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
> @@ -0,0 +1,44 @@
> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +When build on host with older eglibc (Ubuntu 12.04) build fails with:
> +
> +/tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.=
h:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-p=
redef.h> instead."
> +
> +Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +---
> + Makefile.am        |    2 +-
> + sample/Makefile.am |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +--- onig-5.9.3.orig/Makefile.am
> ++++ onig-5.9.3/Makefile.am
> +@@ -4,11 +4,11 @@ sampledir =3D $(top_srcdir)/sample
> + libname =3D libonig.la
> +
> + ACLOCAL_AMFLAGS =3D -I m4
> + #AM_CFLAGS =3D -DNOT_RUBY
> + AM_CFLAGS =3D
> +-INCLUDES  =3D -I$(top_srcdir) -I$(includedir)
> ++INCLUDES  =3D -I$(top_srcdir)
> +
> + SUBDIRS =3D . sample
> +
> + include_HEADERS =3D oniguruma.h oniggnu.h onigposix.h
> + lib_LTLIBRARIES =3D $(libname)
> +--- onig-5.9.3.orig/sample/Makefile.am
> ++++ onig-5.9.3/sample/Makefile.am
> +@@ -1,10 +1,10 @@
> + noinst_PROGRAMS =3D encode listcap names posix simple sql syntax crnl
> +
> + libname =3D $(top_builddir)/libonig.la
> + LDADD   =3D $(libname)
> +-INCLUDES  =3D -I$(top_srcdir) -I$(includedir)
> ++INCLUDES  =3D -I$(top_srcdir)
> +
> + encode_SOURCES  =3D encode.c
> + listcap_SOURCES =3D listcap.c
> + names_SOURCES   =3D names.c
> + posix_SOURCES   =3D posix.c
> diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes=
-support/onig/onig_5.9.3.bb
> index 230e585..f67ceed 100644
> --- a/meta-oe/recipes-support/onig/onig_5.9.3.bb
> +++ b/meta-oe/recipes-support/onig/onig_5.9.3.bb
> @@ -5,7 +5,8 @@ HOMEPAGE =3D "http://www.geocities.jp/kosako3/oniguruma/"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0d4861b5bc0c392a5aa90d9d76ebd=
86f"
> =20
> -SRC_URI =3D "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV=
}.tar.gz"
> +SRC_URI =3D "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV=
}.tar.gz \
> +           file://do-not-use-system-headers.patch"
> =20
>  SRC_URI[md5sum] =3D "0d4eda2066d3c92970842a6790ce897a"
>  SRC_URI[sha256sum] =3D "c3bba66b2a84760e6582c40881db97c839d94f3278700097=
24bb8b4d0c051f2a"
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--irrheVdOic6+Kbak
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAsPMACgkQN1Ujt2V2gBx5HwCfewGwqqTLYpg7DGcqTT/ubFe3
ZgoAnRyjVC9+oJ5A4eLA/XPAaah9Z9sw
=Nf6J
-----END PGP SIGNATURE-----

--irrheVdOic6+Kbak--
