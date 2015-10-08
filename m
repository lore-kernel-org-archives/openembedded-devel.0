Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 08F3376710
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 09:59:02 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so17441579wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4EGeH/XUPvhtw8zBbdjUGXsQbnDM71O1BRg63k3BoC4=;
	b=HESS0wm7wiX6Di+V0ucupIyBn7CNX3ks9q72Vrw/e+aoNVgT17Z031vEMP3yYINmuP
	GD12DiT3A3HvBnx5dxUE18YhKPL5fRmFrWqAXWac+5LHID1FgS0o7N5ERPmC3G5zLrpD
	pYAzAH/BbirtXjiOdsJHk9FL6feOH5FkYpDk1QpCeMs1lniHdjcJzZ3bfStlVNvVxrud
	czAexy03aJ6Ncfzx9ruU1LbnxWdUeFlZxYa55Dnd+2mWDTtieALzbce3gs6zE7aVkvbA
	ZmwQlNW2ZhgWbhLpY8CTuSGDHtXmcViywPTXiWc8hPsN+oUIHgkcMy39LGFkJH898Dvt
	dkVw==
X-Received: by 10.194.6.106 with SMTP id z10mr6750308wjz.104.1444298342076;
	Thu, 08 Oct 2015 02:59:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ly4sm45072951wjb.4.2015.10.08.02.59.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 02:59:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 11:59:12 +0200
To: kai.kang@windriver.com
Message-ID: <20151008095912.GA2385@jama>
References: <1443510290-26782-1-git-send-email-kai.kang@windriver.com>
	<1443510290-26782-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1443510290-26782-2-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Thu, 08 Oct 2015 09:59:05 -0000
X-Groupsio-MsgNum: 57727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 03:04:49PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Upgrade efivar from 0.7 to 0.21.
>=20
> * update HOMEPAGE and git repo.
> * add -native recipe to provide command makeguids
>   and add patch for target package to use this native makeguids command

-native version is failing on hosts with older gcc (like Ubuntu 12.04
with 4.6*).

http://errors.yoctoproject.org/Errors/Details/20231/

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 28 ++++++++++++++++=
+++
>  meta-oe/recipes-extended/efivar/efivar_git.bb      | 18 -------------
>  3 files changed, 59 insertions(+), 18 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-fi=
x-for-cross-compile.patch
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar_git.bb
>=20
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-c=
ross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix=
-for-cross-compile.patch
> new file mode 100644
> index 0000000..4bd7d95
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-co=
mpile.patch
> @@ -0,0 +1,31 @@
> +From 7036e8b0dca61432970789e5397b6fb02b362c2b Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Fri, 25 Sep 2015 18:14:31 +0800
> +Subject: [PATCH] efivar: fix for cross compile
> +
> +It builds and calls elf file makeguids to generate a header file which
> +doesn't work for cross compile. Fix it.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 6eac858..ef4eb1d 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
> + makeguids : makeguids.o fakeguid.o
> + 	$(CC) $(cflags) -o $@ $^ -ldl
> +=20
> +-include/efivar/efivar-guids.h : makeguids guids.txt
> +-	./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
> ++include/efivar/efivar-guids.h : guids.txt
> ++	makeguids guids.txt guids.bin names.bin guid-symbols.S $@
> +=20
> + guidlist.o : guids.S include/efivar/efivar-guids.h
> + 	$(CC) $(cflags) -c -o guidlist.o guids.S
> +--=20
> +2.6.0.rc2.10.gf4d9753
> +
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/rec=
ipes-extended/efivar/efivar_0.21.bb
> new file mode 100644
> index 0000000..2e3b643
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Tools to manipulate UEFI variables"
> +DESCRIPTION =3D "efivar provides a simple command line interface to the =
UEFI variable facility"
> +HOMEPAGE =3D "https://github.com/rhinstaller/efivar"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189cfa95f2c508ba286=
393"
> +
> +DEPENDS_class-target =3D "popt efivar-native"
> +
> +SRCREV =3D "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> +SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
> +SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-compi=
le.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +do_compile_class-native() {
> +    oe_runmake -C src makeguids
> +}
> +
> +do_install_class-native() {
> +    install -D ${B}/src/makeguids ${D}${bindir}/makeguids
> +}
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/reci=
pes-extended/efivar/efivar_git.bb
> deleted file mode 100644
> index 18446a0..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar_git.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =3D "Tools to manipulate UEFI variables"
> -DESCRIPTION =3D "efivar provides a simple command line interface to the =
UEFI variable facility"
> -HOMEPAGE =3D "https://github.com/vathpela/efivar"
> -
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> -
> -DEPENDS =3D "popt"
> -
> -SRCREV =3D "c9e1f24a81b5374408bca5616402276e47171cf7"
> -PV =3D "0.7+git${SRCPV}"
> -SRC_URI =3D "git://github.com/vathpela/efivar.git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> -}
> --=20
> 2.6.0.rc2.10.gf4d9753
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWPmMACgkQN1Ujt2V2gBwwzgCfc98P3xSTfhjSmJ7aYW9zOaB4
6roAnjFSGMSBo0iSopCud2axbKmAQYZw
=TeBY
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
