Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9544A60030
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 18:06:18 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k14so20381811wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 10:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WZTkM6TxH91b9DPVXaTwMpHLwsZqN0vdJk5tk0Dth44=;
	b=OsqWLRKF2AWj1g5RnGQxiwiq7TNLRueLuSVPhSSIv1xT1Gnd5QITn9SyKFdNa/aKTs
	NPJM437WTCSb3u/7uEU3GkNeTlot/VoMd4x9jN9NzWrH07ERcMC0Hgk2KfjqHw1kOBA7
	uxZzWNNvqlQEIKWjAoYTc5aOK8k/Ib/yzzC4JApNVN7gBkjB6asM5V9E2bODo5R6bWK8
	kZ7BBL1r6vchHVrtBSVD0MZPn1/0KgP1803MLxfJYHxqoBUnsYCEPo2zPselsM5A02kI
	CcoGrNM8wfy0NSIEQ4cAZ7IBCsBHKfihBaSFnrO7OGII94XtODRB2xXKQpctullKI0+M
	vrzg==
X-Received: by 10.194.19.38 with SMTP id b6mr9527108wje.44.1417629978346;
	Wed, 03 Dec 2014 10:06:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kv6sm37251865wjb.9.2014.12.03.10.06.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 10:06:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Dec 2014 19:06:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141203180619.GF2455@jama>
References: <1417605241-2992-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417605241-2992-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-filesystems][PATCH] f2fs-tools: Update to Version 1.04
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
X-List-Received-Date: Wed, 03 Dec 2014 18:06:24 -0000
X-Groupsio-MsgNum: 53171
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Content-Disposition: inline

--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 12:14:01PM +0100, Sven Ebenfeld wrote:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---

The subject says 1.04 and recipe 1.4.0.

Also next time remove old version (1.1.0).

And use f2fs-tools instead of "files" directory for slightly faster
lookup.

I've updated all 3 when cherry-picking to master-next.

>  .../recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb   | 17 ++++++++++++
>  ...emove-AC_CHECK_FILE-for-cross-compilation.patch | 32 ++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_=
1.4.0.bb
>  create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/files/0001-=
Remove-AC_CHECK_FILE-for-cross-compilation.patch
>=20
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.b=
b b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> new file mode 100644
> index 0000000..c329692
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Tools for Flash-Friendly File System (F2FS)"
> +HOMEPAGE =3D "http://sourceforge.net/projects/f2fs-tools/"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D362b4b2594cd362b874a97718faa5=
1d3"
> +
> +# to provide libuuid
> +DEPENDS =3D "util-linux"
> +
> +SRCREV =3D "baac4b4e6f41ceb02511da49dd3707674f3fea21"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-=
tools.git \
> +	file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/files/0001-Remove-=
AC_CHECK_FILE-for-cross-compilation.patch b/meta-filesystems/recipes-utils/=
f2fs-tools/files/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch
> new file mode 100644
> index 0000000..cf844bf
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/files/0001-Remove-AC_CHEC=
K_FILE-for-cross-compilation.patch
> @@ -0,0 +1,32 @@
> +From 3b3c6e6376babcd9a0b0db312b0e1e3bb3ab833e Mon Sep 17 00:00:00 2001
> +From: Sven Ebenfeld <sven.ebenfeld@vaillant.de>
> +Date: Wed, 26 Nov 2014 10:36:44 +0100
> +Subject: [PATCH] Remove AC_CHECK_FILE for cross compilation
> +
> +---
> + configure.ac | 7 +------
> + 1 file changed, 1 insertion(+), 6 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0111e72..8c286d4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -20,14 +20,9 @@ AC_DEFINE([F2FS_MINOR_VERSION], m4_bpatsubst(f2fs_too=
ls_version,
> + 				[\([0-9]*\).\([0-9]*\)\(\w\|\W\)*], [\2]),
> + 				[Minor version for f2fs-tools])
> +=20
> +-AC_CHECK_FILE(.git,
> +-	AC_DEFINE([F2FS_TOOLS_DATE],
> +-		"m4_bpatsubst(f2fs_tools_gitdate,
> +-		[\([0-9-]*\)\(\w\|\W\)*], [\1])",
> +-		[f2fs-tools date based on Git commits]),
> + 	AC_DEFINE([F2FS_TOOLS_DATE],
> + 		"f2fs_tools_date",
> +-		[f2fs-tools date based on Source releases]))
> ++		[f2fs-tools date based on Source releases])
> +=20
> + AC_CONFIG_SRCDIR([config.h.in])
> + AC_CONFIG_HEADER([config.h])
> +--=20
> +1.8.1.rc3
> +
> --=20
> 1.8.1.rc3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR/URsACgkQN1Ujt2V2gBxPzwCfYvPKqvx992BHKRhckRTZfCoB
FSQAn15HRoQ/w/ERAYDYYJI+IRQ/b1Qt
=eP4l
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--
