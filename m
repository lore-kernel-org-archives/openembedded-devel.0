Return-Path: <joe@deserted.net>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 549E56D156
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:16:37 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id nc12so782052qeb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 06:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=+y52iMEETKMsDnjXHT88YaskqHzkDfFDkhxSXSzn7dg=;
	b=akLwAUmX6X3Xw1oXCSpbEzl9DI8RqyHBmCFtwGpzHz0452jHcCsqcx7RnMtp5eR++R
	S91gP2kjrV7MDZx1tn8yHwGMM/VwDAh+cjT3pzaoC90x8qHbv6nvMq/J6JIJO47UDwZC
	UYgzeXB9gmIaXNePo0LM/9JiigEylUFtj6gGTKv4LI5sKXySfH/UZZl+pZ5sRRkq24db
	LpBNt+l4Z5onjGm5pOmCOUHM8vValDbYkKKh+RemwqY9YCbXa93SagAG8zQDBBBHRC0k
	UnCVwDSH1Stx4tYkmgtblTNv0xx2o99p1LIUaq2VMHbRAB2Dh4zg4OoOKOrYg4XuVHtk
	ksAQ==
X-Gm-Message-State: ALoCoQnx3o5kG4NUWjkOWG8hBhId0nI/uULk5TgG+y/ETkG13eN1y/mXHs501UvvMszeULYpiWkU
X-Received: by 10.224.94.8 with SMTP id x8mr7768798qam.1.1383138999090;
	Wed, 30 Oct 2013 06:16:39 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id r1sm76945975qam.4.2013.10.30.06.16.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Oct 2013 06:16:38 -0700 (PDT)
Date: Wed, 30 Oct 2013 09:16:35 -0400
From: Joe MacDonald <joe@deserted.net>
To: Mark Asselstine <asselsm@gmail.com>
Message-ID: <20131030131634.GB3716@deserted.net>
References: <1383105036-21256-1-git-send-email-asselsm@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1383105036-21256-1-git-send-email-asselsm@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] cyrus-sasl: ensure size_t is defined for use by sasl.h
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
X-List-Received-Date: Wed, 30 Oct 2013 13:16:37 -0000
X-Groupsio-MsgNum: 46933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH] cyrus-sasl: ensure size_t is defined for use by s=
asl.h] On 13.10.29 (Tue 23:50) Mark Asselstine wrote:

> While making use of the cyrus-sasl library an external application
> will most likely include sasl.h which will cause compilation failures
> if steps haven't been taken to define size_t. This should not be the
> responsibility of the application building against the sasl library
> but rather handled already in sasl.h. Here we ensure sasl.h has the
> proper includes to have size_t defined before it is used.
>=20
> Signed-off-by: Mark Asselstine <asselsm@gmail.com>
> ---
>  ...clude-sasl.h-needs-to-include-sys-types.h.patch | 37 ++++++++++++++++=
++++++
>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  3 ++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl=
/include-sasl.h-needs-to-include-sys-types.h.patch
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/includ=
e-sasl.h-needs-to-include-sys-types.h.patch b/meta-networking/recipes-daemo=
ns/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch
> new file mode 100644
> index 0000000..ac47b4f
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.=
h-needs-to-include-sys-types.h.patch
> @@ -0,0 +1,37 @@
> +From 471b4436a69917fba7c44e366b0393cebc3dace6 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <asselsm@gmail.com>
> +Date: Tue, 29 Oct 2013 23:07:26 -0400
> +Subject: [PATCH] include: sasl.h needs to include sys/types.h
> +
> +size_t is used in sasl.h yet sys/types.h is neither included directly
> +or indirectly. This causes build errors if you try to build something
> +against the sasl library where .c files including sasl.h haven't
> +included sys/types.h or defined size_t on their own. Similar to this
> +one:
> +
> +In file included from rpc/virnetsaslcontext.h:24:0,
> +                 from rpc/virnetsaslcontext.c:25:
> +../poky/x86-64/tmp/sysroots/qemux86-64/usr/include/sasl/sasl.h:230:38: e=
rror: unknown type name 'size_t'
> + typedef void *sasl_realloc_t(void *, size_t);
> +
> +Signed-off-by: Mark Asselstine <asselsm@gmail.com>

Can I get the upstream-status of this?  I can update the patch myself in
my tree or you can send out another version, whatever you prefer.

> +---
> + include/sasl.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/sasl.h b/include/sasl.h
> +index fef4d51..36b2553 100755
> +--- a/include/sasl.h
> ++++ b/include/sasl.h
> +@@ -130,6 +130,8 @@
> + #define SASL_VERSION_FULL ((SASL_VERSION_MAJOR << 16) |\
> +       (SASL_VERSION_MINOR << 8) | SASL_VERSION_STEP)
> +=20
> ++#include <sys/types.h>
> ++
> + #include "prop.h"
> +=20
> + /*************
> +--=20
> +1.8.1.2
> +
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index f05ab85..5899291 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -4,11 +4,14 @@ DEPENDS =3D "openssl virtual/db"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d206=
396"
> =20
> +PR =3D "r1"
> +

I'm pretty sure we don't need a PR bump here anymore.

-J.

>  SRC_URI =3D "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
>  	   file://avoid-to-call-AC_TRY_RUN.patch \
>  	   file://Fix-hardcoded-libdir.patch \
>  	   file://debian_patches_0009_sasldb_al.diff \
>  	   file://debian_patches_0014_avoid_pic_overwrite.diff \
> +	   file://include-sasl.h-needs-to-include-sys-types.h.patch \
>  	   "
> =20
>  inherit autotools pkgconfig useradd
--=20
-Joe MacDonald.
:wq

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJxBrIACgkQwFvcllog0XzaigCfTlQrYMpwxiGVwqTVPSxJ7Tkr
xKkAn2X38lhW/IkirzFB4Us7XdxUpOlS
=cix/
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
