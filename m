Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7C48671388
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:26:07 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XRLQv-0001kl-A7 from Joe_MacDonald@mentor.com ;
	Tue, 09 Sep 2014 06:26:09 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3; Tue, 9 Sep 2014
	06:26:09 -0700
Received: by burninator (Postfix, from userid 1000)	id 8447D5814C3; Tue,  9
	Sep 2014 09:26:06 -0400 (EDT)
Date: Tue, 9 Sep 2014 09:26:06 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909132604.GH2125@mentor.com>
References: <1409552147-23457-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1409552147-23457-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking] inetutils: uprev to 1.9.2
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
X-List-Received-Date: Tue, 09 Sep 2014 13:26:15 -0000
X-Groupsio-MsgNum: 52046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline

--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm also merging this since I haven't seen any objection to the patch
removal and I don't have a C89 compiler kicking around to try this on,
but I'm adding Chunrong Guo to the CC list specifically so if the
patches are still required, we don't have an apparent regression.

Please let me know if we need to resurrect / update these two patches
(frankly, I'm not opposed to the gets() one anyway, producing warnings
for using frequently misused APIs is something of a public service...).

-J.

[[oe] [PATCH][meta-networking] inetutils: uprev to 1.9.2] On 14.09.01 (Mon =
14:15) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. remove unneeded patches:
>  inetutils-1.9.1/disable-pre-ANSI-compilers.patch
>  inetutils-1.9.1/remove-gets.patch
> 2. Update the version from 1.9.1 to 1.9.2 in version.patch
> 3. remove PR
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../disable-pre-ANSI-compilers.patch               |   16 ---------------
>  .../inetutils/inetutils-1.9.1/remove-gets.patch    |   21 --------------=
------
>  .../fix-disable-ipv6.patch                         |    0
>  ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |    0
>  .../inetutils-1.8-0003-wchar.patch                 |    0
>  .../inetutils-1.9-PATH_PROCNET_DEV.patch           |    0
>  .../rexec.xinetd.inetutils                         |    0
>  .../rlogin.xinetd.inetutils                        |    0
>  .../rsh.xinetd.inetutils                           |    0
>  .../telnet.xinetd.inetutils                        |    0
>  .../tftpd.xinetd.inetutils                         |    0
>  .../version.patch                                  |    2 +-
>  .../{inetutils_1.9.1.bb =3D> inetutils_1.9.2.bb}     |    7 ++-----
>  13 files changed, 3 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/disable-pre-ANSI-compilers.patch
>  delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/remove-gets.patch
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/fix-disable-ipv6.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/inetutils-1.8-0001-printf-parse-pull-in-features.h-fo=
r-__GLIBC__.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/inetutils-1.8-0003-wchar.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/rexec.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/rlogin.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/rsh.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/telnet.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/tftpd.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 =
=3D> inetutils-1.9.2}/version.patch (93%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.1.b=
b =3D> inetutils_1.9.2.bb} (96%)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/disable-pre-ANSI-compilers.patch b/meta-networking/recipes-connectivit=
y/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
> deleted file mode 100644
> index a7fa61c..0000000
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disa=
ble-pre-ANSI-compilers.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status: Pending
> -
> -disable pre-ANSI compilers
> -
> -Signed-off-by: Chunrong Guo <b40290@freescale.com>
> ---- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
> -+++ inetutils-1.9.1/configure.ac	2012-11-12 14:05:30.756957063 +0800
> -@@ -586,7 +586,7 @@
> - 		  #include <arpa/tftp.h>])
> -=20
> - ### Checks for compiler characteristics.
> --AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI comp=
ilers?
> -+#AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI com=
pilers?
> - AC_C_CONST
> -=20
> - dnl See if `weak refs' are possible; these make it possible (with shared
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/remove-gets.patch b/meta-networking/recipes-connectivity/inetutils/ine=
tutils-1.9.1/remove-gets.patch
> deleted file mode 100644
> index 61d16e3..0000000
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remo=
ve-gets.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Uptream-Status: Pending
> -
> -remove gets function
> -
> -Signed-off-by: Chunrong Guo <b40290@freescale.com>
> ---- inetutils-1.9.1.org/lib/stdio.in.h	2012-01-06 22:11:13.000000000 +08=
00
> -+++ inetutils-1.9.1/lib/stdio.in.h	2012-11-12 14:30:49.044958001 +0800
> -@@ -715,9 +715,13 @@
> - /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> -+#if defined gets
> -+#undef gets
> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> - #endif
> -=20
> -+#endif
> -+
> -=20
> - #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
> - struct obstack;
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutil=
s/inetutils-1.9.2/fix-disable-ipv6.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/fix-disable-ipv6.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
fix-disable-ipv6.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch=
 b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils=
-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/=
inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/inetutils-1.8-0003-wchar.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
inetutils-1.8-0003-wchar.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connect=
ivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/inetutils-1.9-PATH_PROCNET_DEV.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
inetutils-1.9-PATH_PROCNET_DEV.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils-1.9.2/rexec.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/rexec.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
rexec.xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils-1.9.2/rlogin.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/rlogin.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
rlogin.xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/=
inetutils-1.9.2/rsh.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/rsh.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
rsh.xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils-1.9.2/telnet.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/telnet.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
telnet.xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils-1.9.2/tftpd.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/tftpd.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
tftpd.xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/version.patch b/meta-networking/recipes-connectivity/inetutils/inetuti=
ls-1.9.2/version.patch
> similarity index 93%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
1/version.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/=
version.patch
> index ac3181d..1caa2d3 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/vers=
ion.patch
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/vers=
ion.patch
> @@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
>  =20
>  -AC_INIT([GNU inetutils],
>  - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v=
/;s/_/./g']),
> -+AC_INIT([GNU inetutils],[1.9.1],
> ++AC_INIT([GNU inetutils],[1.9.2],
>    [bug-inetutils@gnu.org])
>  =20
>   AC_CONFIG_SRCDIR([src/inetd.c])
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> similarity index 96%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.9.=
1.bb
> rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.=
bb
> index 315e374..2bae3ee 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> @@ -8,11 +8,8 @@ LICENSE =3D "GPLv3"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0c7051aef9219dc7237f206c5c417=
9a7"
> =20
> -PR =3D "r1"
>  SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> -           file://disable-pre-ANSI-compilers.patch \
>             file://version.patch \
> -           file://remove-gets.patch \
>             file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for=
-__GLIBC__.patch \
>             file://inetutils-1.8-0003-wchar.patch \
>             file://rexec.xinetd.inetutils  \
> @@ -23,8 +20,8 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.ta=
r.gz \
>             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "944f7196a2b3dba2d400e9088576000c"
> -SRC_URI[sha256sum] =3D "02a9ebde8a198cb85f87545b9d88fb103a183958139864a8=
5fe9e027ad79ff2b"
> +SRC_URI[md5sum] =3D "aa1a9a132259db83e66c1f3265065ba2"
> +SRC_URI[sha256sum] =3D "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56a=
0509117a36a89913"
> =20
>  inherit autotools gettext update-alternatives
> =20
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDv/sAAoJEEn8ffcsOfaW+z0IAIcvQYO1N0d+O06w+UY9qUwU
9ZxLpyM0pb1ROUpKd47YGoP2fBevAnZnrd8tfHCNXUGv297r1rRcNgr2FgTL4pxU
oBnAz0Bftn74WMsdhB0hEuVdUOU7LOQ4SJUnzvGdW9yzbCbtv5++kPAldfuEbVqA
qqooJ4BcmsGm4PlsFOiks18MjzRNw7YIUMlteJMTpQRI2bic8nHaLRvF7Cu33trH
vxFxIP+MsPbNqCbxa1A8TPMVijSM6aSeoTQ9QfuVIXSU2z+2xEIN7W/Oc511lfHn
2kIkkI/SCm7bP5z+JbaomWokx90IooMQVUXQUGxnoDunstKxOL8A5LDXb2yDpZI=
=rv+r
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--
