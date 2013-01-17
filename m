Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvpAR-0003XV-TK
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 14:06:05 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so1098308dac.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KQFkVjuzaZRZPArZQHEMay0y5N6zW5MYG5fmzDI5Ptw=;
	b=cLJxao6sdM+wuKO+7qBzTqDxw/uPMQpGnMJy70u97tsUGnYg/wFoSsGcYjXWCGfF63
	DqIbAgYn4gNCiYNtT5gCZWe8TBHhJUhhF2SKWAyvmBugxX2Yc6w4PzCu96vUBth5NsD6
	QXAm0LxyICfB0FIj9tMeMIv0YkG4T95kjbo2EbfhbTBgEyDn37I96JaTX5j/7Fxv04a5
	DmQYD3IzyEqgyyZtPSsXH5U4c8VprbneP8N8h3WdRaK2RKQ7z4NA8rgmLWuesLF7a4p/
	TGfSAPwyAoPgcN9DwSZnOcEPdtiX+s7YjUBDWc4qVncZs3VU4mTcsuUcfEji3vGri9HS
	v7uQ==
X-Received: by 10.68.236.2 with SMTP id uq2mr12984083pbc.55.1358427040205;
	Thu, 17 Jan 2013 04:50:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qr8sm1027052pbc.64.2013.01.17.04.50.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 04:50:39 -0800 (PST)
Date: Thu, 17 Jan 2013 13:50:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130117125034.GG3067@jama>
References: <50F76342.80505@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50F76342.80505@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: lpd-eng-pull@windriver.com, Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: Check in Request for WIND00398740 : autofs_5.0.7 do_compile failed with the msg "#error Failed to locate modprobe
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
X-List-Received-Date: Thu, 17 Jan 2013 13:06:07 -0000
X-Groupsio-MsgNum: 42726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
Content-Disposition: inline

--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 10:34:42AM +0800, yzhu1 wrote:
> Hi, JoeM
>=20
> GK && TK is OK.
>=20
> Please check it this patch. The patch is in the attachment. Please check =
it.
>=20
> Thanks a lot.
> Zhu Yanjun

It looks like missing meta-networking prefix in patch and subject tag.

Cheers,

> From 4fff087eb52462e0817a8d22d6187f9dcd32f924 Mon Sep 17 00:00:00 2001
> From: yanjun.zhu <yanjun.zhu@windriver.com>
> Date: Tue, 15 Jan 2013 12:45:44 +0800
> Subject: [PATCH 1/1] autofs:do not check for modprobe
>=20
> CQID: WIND00398740
>=20
> Reference:http://www.spinics.net/lists/autofs/msg00139.html
>=20
> Loading autofs module is #ifdef'ed in the source, so
> there is no need to check for /proc (which is only used
> to load module) or modprobe.  Both modprobe and /proc
> are always in the fixed location so there's no need to
> check for these to start with.
>=20
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>  .../autofs-5.0.7-do-not-check-for-modprobe.patch   |   66 ++++++++++++++=
++++++
>  recipes-daemons/autofs/autofs_5.0.7.bb             |    1 +
>  2 files changed, 67 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-n=
ot-check-for-modprobe.patch
>=20
> diff --git a/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-chec=
k-for-modprobe.patch b/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-=
not-check-for-modprobe.patch
> new file mode 100644
> index 0000000..9f89b3c
> --- /dev/null
> +++ b/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-m=
odprobe.patch
> @@ -0,0 +1,66 @@
> +diff -urpN a/configure.in b/configure.in
> +--- a/configure.in	2013-01-15 11:30:22.000000000 +0800
> ++++ b/configure.in	2013-01-15 11:31:45.000000000 +0800
> +@@ -34,11 +34,6 @@ AC_MSG_CHECKING([for binaries in])
> + AC_MSG_RESULT([$searchpath])
> +=20
> + #
> +-# Make sure we have "/proc"
> +-#
> +-AF_LINUX_PROCFS()
> +-
> +-#
> + # Location of init.d directory?
> + #
> + AF_INIT_D()
> +@@ -142,7 +137,6 @@ AF_PATH_INCLUDE(UMOUNT, umount, /bin/umo
> + AF_PATH_INCLUDE(E2FSCK, fsck.ext2 e2fsck, , $searchpath)
> + AF_PATH_INCLUDE(E3FSCK, fsck.ext3 e3fsck, , $searchpath)
> + AF_PATH_INCLUDE(E4FSCK, fsck.ext4 e4fsck, , $searchpath)
> +-AF_PATH_INCLUDE(MODPROBE, modprobe, , $searchpath)
> +=20
> + AF_CHECK_PROG(LEX, flex lex, , $searchpath)
> + AF_CHECK_PROG(YACC, bison, , $searchpath)
> +diff -urpN a/daemon/module.c b/daemon/module.c
> +--- a/daemon/module.c	2013-01-15 11:30:49.000000000 +0800
> ++++ b/daemon/module.c	2013-01-15 11:32:00.000000000 +0800
> +@@ -18,6 +18,8 @@
> + #include <stdlib.h>
> + #include "automount.h"
> +=20
> ++#if 0
> ++/* see comment in daemon/automount.c around load_autofs4_module() call =
*/
> + int load_autofs4_module(void)
> + {
> + 	FILE *fp;
> +@@ -52,6 +54,7 @@ int load_autofs4_module(void)
> +=20
> + 	return 1;
> + }
> ++#endif
> +=20
> + struct lookup_mod *open_lookup(const char *name, const char *err_prefix,
> + 			       const char *mapfmt, int argc, const char *const *argv)
> +diff -urpN a/include/automount.h b/include/automount.h
> +--- a/include/automount.h	2013-01-15 11:31:10.000000000 +0800
> ++++ b/include/automount.h	2013-01-15 11:32:06.000000000 +0800
> +@@ -50,16 +50,11 @@
> + #error Failed to locate umount(8)!
> + #endif
> +=20
> +-#ifndef HAVE_MODPROBE
> +-#error Failed to locate modprobe(8)!
> +-#endif
> +-
> +-#ifndef HAVE_LINUX_PROCFS
> +-#error Failed to verify existence of procfs filesystem!
> +-#endif
> +-
> ++#if 0
> ++/* see comment in daemon/automount.c around load_autofs4_module() call =
*/
> + #define FS_MODULE_NAME  "autofs4"
> + int load_autofs4_module(void);
> ++#endif
> +=20
> + /* The -s (sloppy) option to mount is good, if we have it... */
> +=20
> diff --git a/recipes-daemons/autofs/autofs_5.0.7.bb b/recipes-daemons/aut=
ofs/autofs_5.0.7.bb
> index ad737e3..bf679b4 100644
> --- a/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -30,6 +30,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v=
5/autofs-${PV}.tar.bz2 \
>             file://cross.patch \
>             file://libtirpc.patch \
>             file://libtirpc-name-clash-backout.patch \
> +           file://autofs-5.0.7-do-not-check-for-modprobe.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "bc46838dece83c02d800ff144ed9f431"
> --=20
> 1.7.1
>=20

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD385oACgkQN1Ujt2V2gByvNwCfb6i3V5tony/XJwuEEcIV7ueS
rHsAn3c8ShKitrVLRPFik/EZUkaN0Erd
=G9/3
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--
