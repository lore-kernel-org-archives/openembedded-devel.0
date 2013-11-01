Return-Path: <joe@deserted.net>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id A860C6D624
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 18:15:28 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id k4so803736qaq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 11:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=fNekGvfAvf+hvD6PFX7kykchEu75q3m+Hp8PdKt/Ku0=;
	b=Jmh6ZZGNJL+vlaBb6Ho8BwVcfJdj1uvG9j1ZhTYn9bpLiqRlZoQ+T6OWArrSfvmphu
	cXn3wQY36xrgb7WdyYUUPa2veuK4y46BfYyCSeg2x1gN00qLGIy27j7DNwXF0tcTK5xQ
	jVFFurIH7lEMGwXXutX1S3KfHBb4f0zhP/UWBamTDIcxJ+k8VbNIVdvx4xgODOzOldIm
	pYXEGwC4IhP3/7gvBK1Rt0LpT+dofrB+UJTHlPGWRCxfTH2D7pWZ8z01K26tIY8sO+Eg
	ZITj2EV0CSvnefpsjycFaA6ZsGn9qwobSI0XfOwU7F44Qp9qM9cbiuwTRKy9ZFOE9YHj
	Mf0g==
X-Gm-Message-State: ALoCoQnQJbrYB4+xPyHGfdYqU0ZFdbxSFwPIe8/qbdSqLtKt2/gnMXFLkYZD//VrhHocbzoODHh6
X-Received: by 10.49.131.200 with SMTP id oo8mr5941631qeb.0.1383329730090;
	Fri, 01 Nov 2013 11:15:30 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id v19sm23654736qaw.0.2013.11.01.11.15.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Nov 2013 11:15:29 -0700 (PDT)
Date: Fri, 1 Nov 2013 14:15:27 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131101181525.GH4412@deserted.net>
References: <1383329653-16005-1-git-send-email-joe@deserted.net>
MIME-Version: 1.0
In-Reply-To: <1383329653-16005-1-git-send-email-joe@deserted.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: correct QA issues with orphaned systemd files
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
X-List-Received-Date: Fri, 01 Nov 2013 18:15:28 -0000
X-Groupsio-MsgNum: 46987
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwGu8mu1E+uYXPWP"
Content-Disposition: inline

--RwGu8mu1E+uYXPWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Okay, that'd be 'no'.  Wrong version of the patch, v2 coming soon.

-J.

[[oe] [meta-networking][PATCH] autofs: correct QA issues with orphaned syst=
emd files] On 13.11.01 (Fri 14:14) Joe MacDonald wrote:

> If we build a project without systemd support on a system that has systemd
> enabled, the following QA items get flagged:
>=20
>   /lib
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/autofs.service
>=20
> Trying to keep the solution to the problem as contained as possible in a
> way that may be accepted up-stream by adding an optional parameter to the
> --with-systemd flag.
>=20
> Signed-off-by: Joe MacDonald <joe@deserted.net>
> ---
>  ...emd-allow-with-systemd-to-take-a-path-arg.patch | 45 ++++++++++++++++=
++++++
>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |  4 +-
>  2 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/0=
001-systemd-allow-with-systemd-to-take-a-path-arg.patch
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-sys=
temd-allow-with-systemd-to-take-a-path-arg.patch b/meta-networking/recipes-=
daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-=
arg.patch
> new file mode 100644
> index 0000000..0eeceb0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-al=
low-with-systemd-to-take-a-path-arg.patch
> @@ -0,0 +1,45 @@
> +From 40971911d653bf53de295d7462c643e4073916b9 Mon Sep 17 00:00:00 2001
> +From: Joe MacDonald <joe@deserted.net>
> +Date: Fri, 1 Nov 2013 12:47:18 -0400
> +Subject: [PATCH] systemd: allow --with-systemd to take a path arg
> +
> +If building for a cross-compile environment with systemd it is convenient
> +to be able to specify a systemd path for the target that may not be the
> +same as that on the host.
> +
> +Signed-off-by: Joe MacDonald <joe@deserted.net>
> +---
> + aclocal.m4 |   10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/aclocal.m4 b/aclocal.m4
> +index 3e6f223..105e3e9 100644
> +--- a/aclocal.m4
> ++++ b/aclocal.m4
> +@@ -229,8 +229,10 @@ dnl Check the location of the systemd unit files di=
rectory
> + dnl -------------------------------------------------------------------=
-------
> + AC_DEFUN([AF_WITH_SYSTEMD],
> + [AC_ARG_WITH(systemd,
> +-[  --with-systemd         install systemd unit file if systemd unit dir=
ectory
> +-			  is found on system],
> ++[  --with-systemd@<:@=3Dsystemddir@:>@  install systemd unit file.  If =
'yes'
> ++			  probe the system for unit directory.
> ++			  If a path is specified, assume that
> ++			  is a valid install path.],
> + [if test "$withval" =3D yes; then
> +   if test -z "$systemddir"; then
> +     AC_MSG_CHECKING([location of the systemd unit files directory])
> +@@ -247,6 +249,10 @@ AC_DEFUN([AF_WITH_SYSTEMD],
> +   else
> +     AC_MSG_RESULT(not found)
> +   fi
> ++else
> ++ if test "$withval" !=3D no; then
> ++  systemddir=3D$withval
> ++ fi
> + fi])
> + ])
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index c4eea31..54e89f5 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -60,6 +60,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v=
5/autofs-${PV}.tar.bz2 \
>             file://autofs-5.0.7-do-not-check-for-modprobe.patch \
>             file://fix_disable_ldap.patch \
>             file://autofs-5.0.7-fix-lib-deps.patch \
> +           file://0001-systemd-allow-with-systemd-to-take-a-path-arg.pat=
ch \
>  "
> =20
>  SRC_URI[md5sum] =3D "bc46838dece83c02d800ff144ed9f431"
> @@ -73,7 +74,7 @@ INITSCRIPT_PARAMS =3D "defaults"
>  # FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
>  CFLAGS +=3D "${LDFLAGS}"
> =20
> -PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
> +PACKAGECONFIG[systemd] =3D "--with-systemd=3D${systemd_unitdir}/system,-=
-without-systemd,systemd"
> =20
>  PACKAGECONFIG ?=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'syst=
emd', '', d)}"
> =20
> @@ -85,7 +86,6 @@ EXTRA_OECONF +=3D "--disable-mount-locking \
>  "
>  CACHED_CONFIGUREVARS =3D "ac_cv_path_RANLIB=3D${RANLIB} \
>                          ac_cv_path_RPCGEN=3Drpcgen \
> -                        systemddir=3D${systemd_unitdir}/system \
>  "
> =20
>  do_configure_prepend () {
--=20
-Joe MacDonald.
:wq

--RwGu8mu1E+uYXPWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJz770ACgkQwFvcllog0Xw58ACfWDkS2ngu0u2tXybkGTpcZqoR
gosAn3rsOrsnbUAXsMkjc/4t+pouCX22
=KkiT
-----END PGP SIGNATURE-----

--RwGu8mu1E+uYXPWP--
