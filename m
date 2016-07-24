Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA181606BF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 12:05:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so12648402wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nq7NnxGNFhBtHxHHN7276GiLtUejwBQZe3kDkvS1Gik=;
	b=CAsroMKwnrsPiyRJsCMChEKbUQsa132hAzQu6QFWgLTZDJfvoHyU1CVJAUKiWrLu2V
	5ZRFbASuSUAEfmjpoEfXjSKUQWHIvZApNL0qdUD7eqruVrYVSnUEVSZjQFgwrry3+obk
	74uHiX/2kPXOevwvEPXr7oLkU0WLt0MPdcD1xcoL6TepjbgmC7/bArova72kdVhcOX3Z
	N9ag82oKN6hAdCdggie+aR+xo//NfxT7QKYPz/+a9mwRfkycMTdisO6kTR1hnIEw0WU7
	Nos0Sf/lJCIe+TFErBBrgpoz6oItFatt0GJ8OjNDgGLPjyZHEuIFHnViD0uCU15bCpkf
	oEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nq7NnxGNFhBtHxHHN7276GiLtUejwBQZe3kDkvS1Gik=;
	b=bqVkIbaHNAr9l9s6Uzv7m6jxjHK5iSzrNdtDwWW7iwx9cgZfR0kmBWc02nfPCEGWdy
	HoU1v1H5fQuF+Cb1Qp89giladXx84G+B4x1LykarUZbFwoieOUpy3+k2I1EEmIDs9fqe
	H47jG0T34o6GJ0uizTF4z0oqF6NeA+wCezIb26AoA1c7Npya3vpXPOAlHXNvabTvEPWk
	PTb3+gUKUNigMHZvHK+ZwWlqES4OOajcKeUYZEuhoxHvHXLvpJHF6EiNIFpRXXp3qC9S
	SdGN2USeaQkXdAn4CEOeYbfKpChwd2TWgDfw5K6Up20T/kZL/PYeP7orSFCbABdOAXwE
	13Rw==
X-Gm-Message-State: ALyK8tJx9f3d37ScRB5ynlHOg3cx1/Gl3DfXBORSerYgUMGqN/CJHVhE/G2fPqrNRcu7gw==
X-Received: by 10.28.138.18 with SMTP id m18mr36521555wmd.63.1469361912657;
	Sun, 24 Jul 2016 05:05:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	190sm14101529wmk.13.2016.07.24.05.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Jul 2016 05:05:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Jul 2016 14:05:23 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160724120523.mjotstuu5gpnzkvx@jama>
References: <1467017831-170380-1-git-send-email-hongxu.jia@windriver.com>
	<1467101998-72781-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1467101998-72781-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V2] x11vnc: remove redundant RPATH to fix QA issue
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
X-List-Received-Date: Sun, 24 Jul 2016 12:05:13 -0000
X-Groupsio-MsgNum: 62325
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="emj37httg74nsbjv"
Content-Disposition: inline

--emj37httg74nsbjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 04:19:58AM -0400, Hongxu Jia wrote:
> The useless rpath caused oe QA issue:
> ...
> |ERROR: QA Issue: x11vnc: work/i586-poky-linux/x11vnc/0.9.13-r0/packages-=
split/
> x11vnc/usr/bin/x11vnc contains probably-redundant RPATH /usr/lib [useless=
-rpaths]
> ...
>=20
> In oe build, it is unnecessary and redundant to pass "-R/usr/lib" to the =
linker.

Probably not caused by this change, but for some reason x11vnc now fails
with:

| NOTE: Applying patch 'starting-fix.patch' (meta-openembedded/meta-oe/reci=
pes-graphics/x11vnc/files/starting-fix.patch)
| NOTE: Applying patch 'endian-fix.patch' (meta-openembedded/meta-oe/recipe=
s-graphics/x11vnc/files/endian-fix.patch)
| NOTE: Applying patch 'remove-redundant-RPATH.patch' (meta-openembedded/me=
ta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch)
| DEBUG: Python function patch_do_patch finished
| DEBUG: Python function do_patch finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'co=
mmon-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_prepare_sources
| sed: can't read acinclude.m4: No such file or directory
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_prepare_sources (log file is located at /home/=
jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/x11vnc/0.=
9.13-r0/temp/log.do_patch.3859)
NOTE: recipe x11vnc-0.9.13-r0: task do_patch: Failed
ERROR: Task /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recip=
es-graphics/x11vnc/x11vnc_0.9.13.bb:do_patch (/home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb:do_pa=
tch) failed with exit code '1'


>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../x11vnc/files/remove-redundant-RPATH.patch      | 86 ++++++++++++++++=
++++++
>  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   |  4 +-
>  2 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-graphics/x11vnc/files/remove-redundan=
t-RPATH.patch
>=20
> diff --git a/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH=
=2Epatch b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.pat=
ch
> new file mode 100644
> index 0000000..8e894bd
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
> @@ -0,0 +1,86 @@
> +From 7be055c13c7d0d640941830a3291af3b404928c1 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 27 Jun 2016 04:44:14 -0400
> +Subject: [PATCH] configure.ac: remove redundant RPATH
> +
> +It caused oe QA issue:
> +...
> +|ERROR: QA Issue: x11vnc: work/i586-poky-linux/x11vnc/0.9.13-r0/packages=
-split/
> +x11vnc/usr/bin/x11vnc contains probably-redundant RPATH /usr/lib [useles=
s-rpaths]
> +...
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.ac | 21 +++++----------------
> + 1 file changed, 5 insertions(+), 16 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 6f664d0..f986686 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -330,10 +330,8 @@ if test "x$with_crypto" !=3D "xno" -a "x$with_ssl" =
!=3D "xno"; then
> + 		saved_LDFLAGS=3D"$LDFLAGS"
> + 		CPPFLAGS=3D"$CPPFLAGS -I$with_ssl/include"
> + 		LDFLAGS=3D"$LDFLAGS -L$with_ssl/lib"
> +-		if test "x$ld_minus_R" =3D "xno"; then
> ++		if test "x$ld_minus_R" =3D "xno" -o "x$GCC" =3D "xyes"; then
> + 			:
> +-		elif test "x$GCC" =3D "xyes"; then
> +-			LDFLAGS=3D"$LDFLAGS -Xlinker -R$with_ssl/lib"
> + 		else
> + 			LDFLAGS=3D"$LDFLAGS -R$with_ssl/lib"
> + 		fi
> +@@ -447,10 +445,8 @@ if test ! -z "$with_system_libvncserver" -a "x$with=
_system_libvncserver" !=3D "xno
> + 	fi
> + 	if test "x$with_system_libvncserver" !=3D "xyes"; then
> + 		rflag=3D""
> +-		if test "x$ld_minus_R" =3D "xno"; then
> ++		if test "x$ld_minus_R" =3D "xno" -o "x$GCC" =3D "xyes"; then
> + 			:
> +-		elif test "x$GCC" =3D "xyes"; then
> +-			rflag=3D"-Xlinker -R$with_system_libvncserver/lib"
> + 		else
> + 			rflag=3D"-R$with_system_libvncserver/lib"
> + 		fi
> +@@ -484,10 +480,8 @@ new enough.
> + 	elif libvncserver-config --version 1>/dev/null 2>&1; then
> + 		rflag=3D""
> + 		rprefix=3D`libvncserver-config --prefix`
> +-		if test "x$ld_minus_R" =3D "xno"; then
> ++		if test "x$ld_minus_R" =3D "xno" -o "x$GCC" =3D "xyes"; then
> + 			:
> +-		elif test "x$GCC" =3D "xyes"; then
> +-			rflag=3D" -Xlinker -R$rprefix/lib "
> + 		else
> + 			rflag=3D" -R$rprefix/lib "
> + 		fi
> +@@ -541,11 +535,8 @@ if test "x$with_jpeg" !=3D "xno"; then
> + 		saved_LDFLAGS=3D"$LDFLAGS"
> + 		CPPFLAGS=3D"$CPPFLAGS -I$with_jpeg/include"
> + 		LDFLAGS=3D"$LDFLAGS -L$with_jpeg/lib"
> +-		if test "x$ld_minus_R" =3D "xno"; then
> ++		if test "x$ld_minus_R" =3D "xno" -o "x$GCC" =3D "xyes"; then
> + 			:
> +-		elif test "x$GCC" =3D "xyes"; then
> +-			# this is not complete... in general a rat's nest.
> +-			LDFLAGS=3D"$LDFLAGS -Xlinker -R$with_jpeg/lib"
> + 		else
> + 			LDFLAGS=3D"$LDFLAGS -R$with_jpeg/lib"
> + 		fi
> +@@ -590,10 +581,8 @@ if test "x$with_zlib" !=3D "xno" -a "x$with_libz" !=
=3D "xno"; then
> + 		saved_LDFLAGS=3D"$LDFLAGS"
> + 		CPPFLAGS=3D"$CPPFLAGS -I$with_zlib/include"
> + 		LDFLAGS=3D"$LDFLAGS -L$with_zlib/lib"
> +-		if test "x$ld_minus_R" =3D "xno"; then
> ++		if test "x$ld_minus_R" =3D "xno" -o "x$GCC" =3D "xyes"; then
> + 			:
> +-		elif test "x$GCC" =3D "xyes"; then
> +-			LDFLAGS=3D"$LDFLAGS -Xlinker -R$with_zlib/lib"
> + 		else
> + 			LDFLAGS=3D"$LDFLAGS -R$with_zlib/lib"
> + 		fi
> +--=20
> +2.8.1
> +
> diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/r=
ecipes-graphics/x11vnc/x11vnc_0.9.13.bb
> index 64c8a5d..98a0734 100644
> --- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> +++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26=
c6900a926b62aada5f \
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV=
}.tar.gz\
>             file://starting-fix.patch \
> -           file://endian-fix.patch "
> +           file://endian-fix.patch \
> +           file://remove-redundant-RPATH.patch \
> +"
> =20
>  SRC_URI[md5sum] =3D "a372ec4fe8211221547b1c108cf56e4c"
>  SRC_URI[sha256sum] =3D "f6829f2e629667a5284de62b080b13126a0736499fe47cdb=
447aedb07a59f13b"
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--emj37httg74nsbjv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleUrvkACgkQN1Ujt2V2gBy2dACfUwpBvdgGOHy3R057svwmy0/o
YdEAn0u3qabUfSxsEKWdEihm49lcdF+p
=W4e/
-----END PGP SIGNATURE-----

--emj37httg74nsbjv--
