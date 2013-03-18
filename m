Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHfvH-0007RR-DF
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 20:40:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2IJNswH010249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 12:23:54 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 12:23:54 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 959337FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 15:23:15 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 895D72264D; Mon,
	18 Mar 2013 15:23:53 -0400 (EDT)
Date: Mon, 18 Mar 2013 15:23:53 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130318192353.GE14025@windriver.com>
References: <1363209819-5886-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363209819-5886-1-git-send-email-obi@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: fix compile with uclibc
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
X-List-Received-Date: Mon, 18 Mar 2013 19:40:54 -0000
X-Groupsio-MsgNum: 43590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Content-Disposition: inline

--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged.  Thanks.

-J.

[[oe] [meta-networking][PATCH] autofs: fix compile with uclibc] On 13.03.13=
 (Wed 22:23) Andreas Oberritter wrote:

> * Backport patch to make yp optional, which uclibc doesn't provide.
> * Create patch to include linux/nfs.h instead of nfs/nfs.h.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  ...7-include-linux-nfs.h-directly-in-rpc_sub.patch |   32 +++++
>  ...-5.0.7-make-yellow-pages-support-optional.patch |  145 ++++++++++++++=
++++++
>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |    4 +-
>  3 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
>  create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/a=
utofs-5.0.7-make-yellow-pages-support-optional.patch
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-include-linux-nfs.h-directly-in-rpc_sub.patch b/meta-networking/reci=
pes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-i=
n-rpc_sub.patch
> new file mode 100644
> index 0000000..3a87898
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-in=
clude-linux-nfs.h-directly-in-rpc_sub.patch
> @@ -0,0 +1,32 @@
> +Upstream-Status: Pending
> +
> +From 44bdce8c6ed9b30c1643e5981172a4f9025f013c Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Wed, 13 Mar 2013 16:17:08 +0100
> +Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
> +
> +Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
> +nothing but "#include linux/nfs.h". rpc_subs.h already includes
> +other linux/nfs*.h files directly.
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +---
> + include/rpc_subs.h |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/rpc_subs.h b/include/rpc_subs.h
> +index b6d59f9..a2d9648 100644
> +--- a/include/rpc_subs.h
> ++++ b/include/rpc_subs.h
> +@@ -18,7 +18,7 @@
> +=20
> + #include <rpc/rpc.h>
> + #include <rpc/pmap_prot.h>
> +-#include <nfs/nfs.h>
> ++#include <linux/nfs.h>
> + #include <linux/nfs2.h>
> + #include <linux/nfs3.h>
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5=
=2E0.7-make-yellow-pages-support-optional.patch b/meta-networking/recipes-d=
aemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.=
patch
> new file mode 100644
> index 0000000..9504d8e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-ma=
ke-yellow-pages-support-optional.patch
> @@ -0,0 +1,145 @@
> +Upstream-Status: Backport
> +
> +autofs-5.0.7 - make yellow pages support optional
> +
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +If rpcsvc/ypclnt.h is not available don't compile in Yellow Pages
> +support.
> +---
> +
> + Makefile.conf.in    |    3 +++
> + configure           |   16 ++++++++++++++++
> + configure.in        |    9 +++++++++
> + include/config.h.in |    3 +++
> + lib/rpc_subs.c      |    1 -
> + modules/Makefile    |    9 +++++++--
> + 7 files changed, 39 insertions(+), 3 deletions(-)
> +
> +
> +diff --git a/Makefile.conf.in b/Makefile.conf.in
> +index 802318b..3766d45 100644
> +--- a/Makefile.conf.in
> ++++ b/Makefile.conf.in
> +@@ -43,6 +43,9 @@ NISPLUS =3D @HAVE_NISPLUS@
> + # SMBFS support: yes (1) no (0)
> + SMBFS =3D @HAVE_SMBMOUNT@
> +=20
> ++# YellowPages support: yes (1) no (0)
> ++YPCLNT =3D @HAVE_YPCLNT@
> ++
> + # Support for calling e2fsck when mounting ext2 filesystems
> + EXT2FS =3D @HAVE_E2FSCK@
> +=20
> +diff --git a/configure b/configure
> +index 3722a46..cf6428c 100755
> +--- a/configure
> ++++ b/configure
> +@@ -614,6 +614,7 @@ XML_FLAGS
> + LIBLDAP
> + HAVE_LDAP
> + LDAP_FLAGS
> ++HAVE_YPCLNT
> + HAVE_NISPLUS
> + EGREP
> + GREP
> +@@ -4575,6 +4576,21 @@ fi
> +=20
> +=20
> +=20
> ++# YellowPages support?
> ++HAVE_YPCLNT=3D0
> ++ac_fn_c_check_header_mongrel "$LINENO" "rpcsvc/ypclnt.h" "ac_cv_header_=
rpcsvc_ypclnt_h" "$ac_includes_default"
> ++if test "x$ac_cv_header_rpcsvc_ypclnt_h" =3D xyes; then :
> ++  HAVE_YPCLNT=3D1
> ++fi
> ++
> ++
> ++
> ++if test "$HAVE_YPCLNT" =3D "1"; then
> ++
> ++$as_echo "#define HAVE_YPCLNT 1" >>confdefs.h
> ++
> ++fi
> ++
> + #
> + # OpenLDAP support?  Expect that this may have a special directory...
> + #
> +diff --git a/configure.in b/configure.in
> +index 90bda62..363c376 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -213,6 +213,15 @@ HAVE_NISPLUS=3D0
> + AC_CHECK_HEADER(rpcsvc/nis.h, HAVE_NISPLUS=3D1)
> + AC_SUBST(HAVE_NISPLUS)
> +=20
> ++# YellowPages support?
> ++HAVE_YPCLNT=3D0
> ++AC_CHECK_HEADER([rpcsvc/ypclnt.h], HAVE_YPCLNT=3D1)
> ++AC_SUBST(HAVE_YPCLNT)
> ++if test "$HAVE_YPCLNT" =3D "1"; then
> ++	AC_DEFINE(HAVE_YPCLNT, 1,
> ++		[Define if using YellowPages])
> ++fi
> ++
> + #
> + # OpenLDAP support?  Expect that this may have a special directory...
> + #
> +diff --git a/include/config.h.in b/include/config.h.in
> +index 9bdf98a..7f1c5b5 100644
> +--- a/include/config.h.in
> ++++ b/include/config.h.in
> +@@ -72,6 +72,9 @@
> + /* Define to 1 if you have the <unistd.h> header file. */
> + #undef HAVE_UNISTD_H
> +=20
> ++/* Define if using YellowPages */
> ++#undef HAVE_YPCLNT
> ++
> + /* Use libxml2 tsd usage workaround */
> + #undef LIBXML2_WORKAROUND
> +=20
> +diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
> +index ad1d557..718caf9 100644
> +--- a/lib/rpc_subs.c
> ++++ b/lib/rpc_subs.c
> +@@ -27,7 +27,6 @@
> + #include <net/if.h>
> + #include <netinet/in.h>
> + #include <arpa/inet.h>
> +-#include <rpcsvc/ypclnt.h>
> + #include <errno.h>
> + #include <sys/ioctl.h>
> + #include <ctype.h>
> +diff --git a/modules/Makefile b/modules/Makefile
> +index 939da7c..c5deb24 100644
> +--- a/modules/Makefile
> ++++ b/modules/Makefile
> +@@ -5,13 +5,13 @@
> + -include ../Makefile.conf
> + include ../Makefile.rules
> +=20
> +-SRCS :=3D	lookup_yp.c  lookup_file.c lookup_program.c  lookup_userhome.=
c \
> ++SRCS :=3D	lookup_file.c lookup_program.c  lookup_userhome.c \
> + 	lookup_multi.c lookup_hosts.c lookup_dir.c \
> + 	parse_sun.c    \
> + 	mount_generic.c  mount_nfs.c  mount_afs.c  mount_autofs.c \
> + 	mount_changer.c  mount_bind.c
> +=20
> +-MODS :=3D	lookup_yp.so lookup_file.so lookup_program.so lookup_userhome=
=2Eso \
> ++MODS :=3D	lookup_file.so lookup_program.so lookup_userhome.so \
> + 	lookup_multi.so lookup_hosts.so lookup_dir.so \
> + 	parse_sun.so \
> + 	mount_generic.so mount_nfs.so mount_afs.so mount_autofs.so \
> +@@ -37,6 +37,11 @@ ifeq ($(NISPLUS), 1)
> +   MODS +=3D lookup_nisplus.so
> + endif
> +=20
> ++ifeq ($(YPCLNT), 1)
> ++  SRCS +=3D lookup_yp.c
> ++  MODS +=3D lookup_yp.so
> ++endif
> ++
> + ifeq ($(LDAP), 1)
> +   SRCS +=3D lookup_ldap.c
> +   MODS +=3D lookup_ldap.so
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index 215d293..44985b2 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -3,7 +3,7 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  DEPENDS +=3D "libtirpc flex-native bison-native"
> =20
> @@ -27,6 +27,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v=
5/autofs-${PV}.tar.bz2 \
>             file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
>             file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
>             file://autofs-5.0.7-handle-new-location-of-systemd.patch \
> +           file://autofs-5.0.7-make-yellow-pages-support-optional.patch \
> +           file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.p=
atch \
>             file://Makefile.rules-cross.patch \
>             file://no-bash.patch \
>             file://cross.patch \
--=20
-Joe MacDonald.
:wq

--Yb+qhiCg54lqZFXW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFHackACgkQPN8S4W6ZZnfXYQCeJahy+6Wt+J/rtLeAWZlD6D3P
MtAAn1Yxrv6zcQZXA6I+SGDdqy5k1EzE
=kTeZ
-----END PGP SIGNATURE-----

--Yb+qhiCg54lqZFXW--
