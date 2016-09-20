Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6F09600BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 06:46:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 133so1614134wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ej1fyqqpGmBmgZD1k+I5fmC2ihbWq8vJhdIvq8gUbso=;
	b=iRp9imvtGzMr1soZT1+4pzqJyq9CEaoL8ETCdTK9CkwFiUfOM+EhUg9ftUo8YGR6ie
	oSITDc54ypzCoSDOr6f6xHxhdpTusgKZaWiByVYf6ZdiwMzsEODiWqHMY+QH8QTIFRCl
	4+FTFykRwd2YNDk7lwC0bbXPCg787TYDb2m5ciekrDke4O6gXK4aCKAt9v89qXIDEPON
	k5gbKccJwOYKa/TE/B82HNW5yWysNBr7fxIVpNOgjQjzGJv7HKtZ8nlX17yhzEVq2Q2w
	00pcwbH+Ugpwg/lkZRZYoMO4WRVzhKlty1lP0+gWG1n1oBnKPK1OeAiVvdTYOS8T9KaU
	rxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ej1fyqqpGmBmgZD1k+I5fmC2ihbWq8vJhdIvq8gUbso=;
	b=jTcX8B9sMiC2ct12zzjsfS0Z5A9L6im7VohWA2fW0e2BeRWlN0tNNvn5JJWA1I3j/M
	VP9TiXmTRHoVhh9n3WHFEG07qvSlupN+LoGe4M17WhnPHaKilhUtFKeq5PSCVg3OerMM
	MFpg8Y/vbuRsM1qxjGB8K99QrgHc0pgweZkLOSh2IIc6fD+Pikg/jDCXoYkOB7G7/ZOF
	DFL7SjZH1Dbo4L1qFHGzGpe8JvYShGFBnpiSY4nKOLtipcbj7jx0mkOL1E8cjpiHvNgk
	dZWLpKZ4LUYSkA+Xq3VuftrMcMCliepOIc0/nDINkFgjjrq7jB1tsOxWY/73pfTWD3/d
	l1jg==
X-Gm-Message-State: AE9vXwPFaA4g/Xj2TRenx37rtYL5BmaN5QHLeBoJgwdiPUtkCkp/FYa+TPdIRM3KrYnt5A==
X-Received: by 10.28.27.138 with SMTP id b132mr1593621wmb.81.1474353990201;
	Mon, 19 Sep 2016 23:46:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f15sm25674923wmf.8.2016.09.19.23.46.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Sep 2016 23:46:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Sep 2016 08:46:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160920064630.GA3461@jama>
References: <cover.1474348826.git.jackie.huang@windriver.com>
	<3eedb5bcccfc787f9673143098f394efa6ae6124.1474348826.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <3eedb5bcccfc787f9673143098f394efa6ae6124.1474348826.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-networking][PATCH 1/4] libtalloc: fixes for deterministic builds
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
X-List-Received-Date: Tue, 20 Sep 2016 06:46:30 -0000
X-Groupsio-MsgNum: 63200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 01:42:23PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> * Add configure option and PACKAGECONFIG for
>   the following packages:
>   - acl
>   - attr
>   - libaio
>   - libcap
>   - valgrind
>=20
> * They are all optional, so disable by default
>   or control them based on DISTRO_FEATURES.
>=20
> * Remove the direct dependency on libaio
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...talloc-Add-configure-options-for-packages.patch | 124 +++++++++++++++=
++++++
>  .../recipes-support/libtalloc/libtalloc_2.1.8.bb   |  16 ++-
>  2 files changed, 137 insertions(+), 3 deletions(-)
>  create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/t=
alloc-Add-configure-options-for-packages.patch
>=20
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/talloc-A=
dd-configure-options-for-packages.patch b/meta-networking/recipes-support/l=
ibtalloc/libtalloc/talloc-Add-configure-options-for-packages.patch
> new file mode 100644
> index 0000000..d383df4
> --- /dev/null
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/talloc-Add-conf=
igure-options-for-packages.patch
> @@ -0,0 +1,124 @@
> +From 77fd757624c9b20073a7abefaca8382caa4fd376 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Wed, 14 Sep 2016 11:11:35 +0800
> +Subject: [PATCH] talloc: Add configure options for packages
> +
> +Add configure options for the following packages:
> + - acl
> + - attr
> + - libaio
> + - libcap
> + - valgrind
> +
> +Upstream-Status: Inappropriate [oe deterministic build specific]
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + lib/replace/system/wscript_configure |  6 ++++-
> + lib/replace/wscript                  | 43 +++++++++++++++++++++++++++++=
++-----
> + wscript                              |  4 ++++
> + 3 files changed, 46 insertions(+), 7 deletions(-)
> +
> +diff --git a/lib/replace/system/wscript_configure b/lib/replace/system/w=
script_configure
> +index 2035474..10f9ae7 100644
> +--- a/lib/replace/system/wscript_configure
> ++++ b/lib/replace/system/wscript_configure
> +@@ -1,6 +1,10 @@
> + #!/usr/bin/env python
> +=20
> +-conf.CHECK_HEADERS('sys/capability.h')
> ++import Options
> ++
> ++if Options.options.enable_libcap:
> ++    conf.CHECK_HEADERS('sys/capability.h')
> ++
> + conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
> +=20
> + # solaris varients of getXXent_r
> +diff --git a/lib/replace/wscript b/lib/replace/wscript
> +index fc43e1a..a899dd2 100644
> +--- a/lib/replace/wscript
> ++++ b/lib/replace/wscript
> +@@ -23,6 +23,22 @@ def set_options(opt):
> +     opt.PRIVATE_EXTENSION_DEFAULT('')
> +     opt.RECURSE('buildtools/wafsamba')
> +=20
> ++    opt.add_option('--with-acl',
> ++                   help=3D("Enable use of acl"),
> ++                   action=3D"store_true", dest=3D'enable_acl', default=
=3DFalse)
> ++
> ++    opt.add_option('--with-attr',
> ++                   help=3D("Enable use of attr"),
> ++                   action=3D"store_true", dest=3D'enable_attr', default=
=3DFalse)
> ++
> ++    opt.add_option('--with-libaio',
> ++                   help=3D("Enable use of libaio"),
> ++                   action=3D"store_true", dest=3D'enable_libaio', defau=
lt=3DFalse)
> ++
> ++    opt.add_option('--with-libcap',
> ++                   help=3D("Enable use of libcap"),
> ++                   action=3D"store_true", dest=3D'enable_libcap', defau=
lt=3DFalse)
> ++
> + @Utils.run_once
> + def configure(conf):
> +     conf.RECURSE('buildtools/wafsamba')
> +@@ -32,12 +48,25 @@ def configure(conf):
> +     conf.DEFINE('HAVE_LIBREPLACE', 1)
> +     conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
> +=20
> +-    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h com=
pat.h')
> +-    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dust=
at.h')
> ++    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
> ++    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
> +     conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langi=
nfo.h')
> +-    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
> +-    conf.CHECK_HEADERS('shadow.h sys/acl.h')
> +-    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capabili=
ty.h sys/dir.h sys/epoll.h')
> ++    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
> ++    conf.CHECK_HEADERS('shadow.h')
> ++    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
> ++
> ++    if Options.options.enable_acl:
> ++        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
> ++
> ++    if Options.options.enable_attr:
> ++        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
> ++
> ++    if Options.options.enable_libaio:
> ++        conf.CHECK_HEADERS('libaio.h')
> ++
> ++    if Options.options.enable_libcap:
> ++        conf.CHECK_HEADERS('sys/capability.h')
> ++
> +     conf.CHECK_HEADERS('port.h')
> +     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5p=
aram.h sys/fs/vx/quota.h')
> +     conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/m=
ode.h sys/ndir.h sys/priv.h')
> +@@ -73,7 +102,9 @@ def configure(conf):
> +=20
> +     conf.CHECK_CODE('', headers=3D'rpc/rpc.h rpcsvc/yp_prot.h', define=
=3D'HAVE_RPCSVC_YP_PROT_H')
> +=20
> +-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memchec=
k.h')
> ++    if Options.options.enable_valgrind:
> ++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/mem=
check.h')
> ++
> +     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
> +     conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs=
=2Eh')
> +     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
> +diff --git a/wscript b/wscript
> +index 41f3be7..f900c24 100644
> +--- a/wscript
> ++++ b/wscript
> +@@ -35,6 +35,10 @@ def set_options(opt):
> +         opt.add_option('--disable-python',
> +                        help=3D("disable the pytalloc module"),
> +                        action=3D"store_true", dest=3D'disable_python', =
default=3DFalse)
> ++        opt.add_option('--with-valgrind',
> ++                       help=3D("enable use of valgrind"),
> ++                       action=3D"store_true", dest=3D'enable_valgrind',=
 default=3DFalse)
> ++
> +=20
> +=20
> + def configure(conf):
> +--=20
> +2.8.3
> +
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb=
 b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> index 7c85ab3..8b2ae33 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
> @@ -3,9 +3,11 @@ HOMEPAGE =3D "http://talloc.samba.org"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> =20
> -DEPENDS +=3D "libaio libbsd"
> +DEPENDS +=3D "libbsd"
> =20
> -SRC_URI =3D "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
> +SRC_URI =3D "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
> +           file://talloc-Add-configure-options-for-packages.patch \
> +"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
>                      file://${COREBASE}/meta/files/common-licenses/GPL-3.=
0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"

I know you haven't changed this, but

This is wrong, we should use some files in talloc source, not
common-license.

> =20
> @@ -15,7 +17,15 @@ SRC_URI[sha256sum] =3D "22d14911164d4de67ff76b5269fa52=
50d01f78c955bc77e28615350996
> =20
>  inherit waf-samba
> =20
> -PACKAGECONFIG[attr] =3D ",,attr"
> +PACKAGECONFIG ??=3D "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
> +"
> +PACKAGECONFIG[acl] =3D "--with-acl,,acl"
> +PACKAGECONFIG[attr] =3D "--with-attr,,attr"
> +PACKAGECONFIG[libaio] =3D "--with-libaio,,libaio,"
> +PACKAGECONFIG[libcap] =3D "--with-libcap,,libcap,"
> +PACKAGECONFIG[valgrind] =3D "--with-valgrind,,valgrind,"

What about disable options for clarity?

> =20
>  SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://=
avoid-attr-unless-wanted.patch', d)}"
> =20
> --=20
> 2.8.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfg20QACgkQN1Ujt2V2gBwD3QCfXdT7jz5dE5t7cIk31Ko7HSQu
dYgAn2oDKLY//yZmz3pL+jguKYiyQc5t
=oSwY
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
