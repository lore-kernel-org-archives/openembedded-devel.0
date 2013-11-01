Return-Path: <joe@deserted.net>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 295506D34D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 14:27:58 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id nc12so2634464qeb.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 07:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=7lJCJvjn57gxFSt54gBhZwJ8A/Rc2BayDlItjvBWc4M=;
	b=gd9KddocsFNWRbGIs/L1tgnDqV0X/sXXNIl2HcCcc5TdII1imkmZjon/Tyw0ry+cwg
	zeamYQdxVsyNbXOlI5cWq+cqKFrr+pEVJvaPdE6crabXC+XuBzXW5RThDOMiyupXGyjb
	8TRj6q/6zs5+RGyKLQZqUEgDIqeOmkqJQH3qQPDnroOkqUbY69r0r+Uz7H61Fjg8Ktbb
	RCuQ+LClk8/Va2Y8LW21p8YpGqOO+cwKqjpaqHUowIw9ARZIAW4xgrFGxEGiuImzZCBM
	wNgQs/6taCv0Rd8+pDq261UvPzO5NhL7Bd92p8cTOthoRxAicOO4/xPalzqIAB24aiDY
	p5YQ==
X-Gm-Message-State: ALoCoQlrofHOTaXGAmZ/xLbMzch2VLuZaGJuV27Ho7gp3hrQg4zXDD8g6lX/+urdmCUrtiZ87pmc
X-Received: by 10.224.79.12 with SMTP id n12mr4318662qak.109.1383316079695;
	Fri, 01 Nov 2013 07:27:59 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h6sm17987316qej.4.2013.11.01.07.27.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Nov 2013 07:27:58 -0700 (PDT)
Date: Fri, 1 Nov 2013 10:27:56 -0400
From: Joe MacDonald <joe@deserted.net>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20131101142754.GF4412@deserted.net>
References: <1383158754-446-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383158754-446-1-git-send-email-mark.asselstine@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] cyrus-sasl: ensure size_t is defined for use by sasl.h
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
X-List-Received-Date: Fri, 01 Nov 2013 14:27:59 -0000
X-Groupsio-MsgNum: 46980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[meta-networking][PATCH v2] cyrus-sasl: ensure size_t is defined for use b=
y sasl.h] On 13.10.30 (Wed 14:45) Mark Asselstine wrote:

> While making use of the cyrus-sasl library an external application
> will most likely include sasl.h which will cause compilation failures
> if steps haven't been taken to define size_t. This should not be the
> responsibility of the application building against the sasl library
> but rather handled already in sasl.h. Here we ensure sasl.h has the
> proper includes to have size_t defined before it is used.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>=20
> v2 changes:
> * using upstream patch. Posix I believe says to use sys/types.h
>   but in any case stddef.h works fine.
>=20
> * removed PR addition + bump
>=20
> * added upstream status line
>=20
>  ...l.h-include-stddef.h-for-size_t-on-NetBSD.patch | 31 ++++++++++++++++=
++++++
>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl=
/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h=
-include-stddef.h-for-size_t-on-NetBSD.patch b/meta-networking/recipes-daem=
ons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
> new file mode 100644
> index 0000000..ecbab84
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-includ=
e-stddef.h-for-size_t-on-NetBSD.patch
> @@ -0,0 +1,31 @@
> +From 92d72789c811b0d55f624a8bac5ccc4412f5996e Mon Sep 17 00:00:00 2001
> +From: Ken Murchison <murch@andrew.cmu.edu>
> +Date: Thu, 20 Dec 2012 18:14:50 -0500
> +Subject: [PATCH] sasl.h: #include <stddef.h> for size_t on NetBSD
> +
> +This patch was imported from git://git.cyrusimap.org/cyrus-sasl
> +commit 67a188693796a14e3a76ac603104807fbbfddfc4
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + include/sasl.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/sasl.h b/include/sasl.h
> +index fef4d51..8b8a63f 100755
> +--- a/include/sasl.h
> ++++ b/include/sasl.h
> +@@ -121,6 +121,8 @@
> + #ifndef SASL_H
> + #define SASL_H 1
> +=20
> ++#include <stddef.h>  /* For size_t */
> ++
> + /* Keep in sync with win32/common.mak */
> + #define SASL_VERSION_MAJOR 2
> + #define SASL_VERSION_MINOR 1
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index f05ab85..2abaee2 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sas=
l-${PV}.tar.gz \
>  	   file://Fix-hardcoded-libdir.patch \
>  	   file://debian_patches_0009_sasldb_al.diff \
>  	   file://debian_patches_0014_avoid_pic_overwrite.diff \
> +	   file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
>  	   "
> =20
>  inherit autotools pkgconfig useradd
--=20
-Joe MacDonald.
:wq

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJzumoACgkQwFvcllog0Xz8cgCfccQu6MWtNwyu0MDdQtNiwF1C
NrAAmgKg1Jy7c2oMXIS0tI0RhPIKcDG/
=orFz
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
