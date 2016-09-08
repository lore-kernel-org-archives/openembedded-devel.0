Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE356FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 13:36:09 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1bhzUw-0000Mo-8v from Joe_MacDonald@mentor.com ;
	Thu, 08 Sep 2016 06:36:10 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 8 Sep 2016 06:36:10 -0700
Received: by burninator (Postfix, from userid 1000)	id 7A255580AF8; Thu,  8
	Sep 2016 09:36:09 -0400 (EDT)
Date: Thu, 8 Sep 2016 09:36:09 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <mingli.yu@windriver.com>
Message-ID: <20160908133609.GA4939@mentor.com>
References: <1473325733-21840-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1473325733-21840-1-git-send-email-mingli.yu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org, jslater@windriver.com
Subject: Re: [meta-networking][PATCH] tcpreplay: 3.4.4 -> 4.1.1
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
X-List-Received-Date: Thu, 08 Sep 2016 13:36:10 -0000
X-Groupsio-MsgNum: 63014
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] tcpreplay: 3.4.4 -> 4.1.1] On 16.09.08 (Thu =
17:08) mingli.yu@windriver.com wrote:

> From: Mingli Yu <Mingli.Yu@windriver.com>
>=20
> * Upgrade tcpreplay from 3.4.4 to 4.1.1
> * Remove the backport and unapplicable patches
>   - The logic for tcpreplay-3.4.4-cross-compile.patch
>     is covered by below commit:
>     commit f204c88d0d610c09b2b0249c447fed1e4813a8cb
>     Author: Aaron Turner <synfinatic@gmail.com>
>     Date:   Tue Oct 4 03:00:44 2011 +0000
>=20
>       - mark as beta4
>       - fix autoconf quoting issues
>       - fix cross compile issue refs #489
>=20
>   - The logic for tcpreplay-3.4.4-no-bfp-support.patch
>     is covered by below commit:
>     commit 8a3647813dcb7b89cd5e1fe064890a6e1d750f24
>     Author: Alexey Indeev <aindeev@appneta.com>
>     Date:   Fri Oct 10 15:04:43 2014 -0700
>=20
>        #140 fixed bpf, netmap
>=20
>   - The logic for both
>     tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
>     and tcpreplay-3.4.4-improve-search-for-libpcap.patch are
>     covered by below commit:
>     commit e0cc16947b28cbb7040475c6fad123b8a739b34f
>     Author: Fred Klassen <fklassen@JTLM57.local>
>     Date:   Sun Dec 13 20:20:12 2015 -0800
>=20
>        #203 many fixes to libpcap discovery
>=20
> Reference https://github.com/appneta/tcpreplay.git

I don't know if there's any technical issue with the proposed change
yet, I'll pick that up from master-next soon, I expect, but I have some
feedback for you on your commit log.

   - You don't need to quote the commits from up-stream in your commit
     log.  I don't even particularly care if you quote the commit IDs
     by way of saying you're disposing of patches that are no longer
     necessary.  It's nice but not required.  Definitely don't quote the
     whole commit log for each of them, though.

   - You make no mention of what happened to the LICENSE file to cause
     it to change between versions.  I haven't looked, my guess is a
     year in the copyright changed, but changes in a file used to
     determine the license for a package are always worth commenting on.

   - Most trivially, this still uses the 'old_ver -> new_ver' subject I
     prefer not to see.  I think I'm losing that one, though, so if I
     wasn't commenting on other stuff in your log, I wouldn't've
     bothered bringing it up.

-J.

>=20
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  .../files/tcpreplay-3.4.4-cross-compile.patch      | 92 ----------------=
------
>  ...ay-3.4.4-fix-unable-to-link-libpcap-issue.patch | 17 ----
>  ...cpreplay-3.4.4-improve-search-for-libpcap.patch | 33 --------
>  .../files/tcpreplay-3.4.4-no-bfp-support.patch     | 15 ----
>  .../{tcpreplay_3.4.4.bb =3D> tcpreplay_4.1.1.bb}     | 10 +--
>  5 files changed, 3 insertions(+), 164 deletions(-)
>  delete mode 100755 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-cross-compile.patch
>  delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-fix-unable-to-link-libpcap-issue.patch
>  delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-improve-search-for-libpcap.patch
>  delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-no-bfp-support.patch
>  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_3.4.4.bb =3D=
> tcpreplay_4.1.1.bb} (43%)
>=20
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-cross-compile.patch b/meta-networking/recipes-support/tcpreplay/files/t=
cpreplay-3.4.4-cross-compile.patch
> deleted file mode 100755
> index a856b18..0000000
> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cro=
ss-compile.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -Uptream-Status: Pending
> -
> -Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -402,7 +402,6 @@
> -=20
> - dnl 0.9.6 (which is still thinks it is 0.9.5 due to a bug) introduces a=
n important
> - dnl fix for OSX.  See: http://tcpreplay.synfin.net/trac/ticket/167
> --libpcap_version_096=3Dno
> - AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> - #include <string.h>
> - #include <stdlib.h>
> -@@ -419,11 +418,12 @@
> -             exit(0);
> -=20
> -     exit(1);
> --]]), [
> --    libpcap_version_096=3Dyes
> --])
> -+]]),
> -+ [libpcap_version_096=3Dyes],
> -+ [libpcap_version_096=3Dno],
> -+ [libpcap_version_096=3Dyes]
> -+)
> -=20
> --libpcap_ver8=3Dno
> - AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> - #include <string.h>
> - #include <stdlib.h>
> -@@ -444,13 +444,12 @@
> -         exit(0);
> -=20
> -     exit(1);
> --]]), [
> --    libpcap_ver8=3Dyes
> --], [
> --    libpcap_ver8=3Dno
> --])
> -+]]),
> -+ [libpcap_ver8=3Dyes],
> -+ [libpcap_ver8=3Dno],
> -+ [libpcap_ver8=3Dyes]
> -+)
> -=20
> --libpcap_ver7=3Dno
> - AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> - #include <string.h>
> - #include <stdlib.h>
> -@@ -469,11 +468,11 @@
> -             exit(0);
> -=20
> -     exit(1);
> --]]), [
> --    libpcap_ver7=3Dyes
> --], [
> --    libpcap_ver7=3Dno
> --])
> -+]]),
> -+ [libpcap_ver7=3Dyes],
> -+ [libpcap_ver7=3Dno],
> -+ [libpcap_ver7=3Dyes]
> -+)
> -=20
> - if test x$libpcap_ver8 =3D xyes ; then
> -     AC_MSG_RESULT(>=3D 0.8.0)
> -@@ -761,8 +760,8 @@
> -=20
> - have_bpf=3Dno
> - dnl Check for BSD's BPF
> --AC_MSG_CHECKING(for BPF device sending support)
> --AC_TRY_RUN([
> -+AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
> -+[AC_TRY_RUN([
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <sys/types.h>
> -@@ -796,8 +795,11 @@
> -             [Do we have BPF device support?])
> -     AC_MSG_RESULT(yes)
> -     have_bpf=3Dyes
> --],[
> --    AC_MSG_RESULT(no)
> -+],
> -+[AC_MSG_RESULT(no)],
> -+[AC_MSG_ERROR([cross-compiling,
> -+  presetting ac_cv_have_bpf=3D(yes|no) will help])]
> -+)
> - ])
> -=20
> -=20
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-fix-unable-to-link-libpcap-issue.patch b/meta-networking/recipes-suppor=
t/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
> deleted file mode 100644
> index 5f36c68..0000000
> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix=
-unable-to-link-libpcap-issue.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Uptream-Status: Pending
> -
> -Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> -
> -Index: tcpreplay-3.4.4/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- tcpreplay-3.4.4.orig/configure.ac
> -+++ tcpreplay-3.4.4/configure.ac
> -@@ -389,7 +389,7 @@ CFLAGS=3D"$CFLAGS -I$LPCAPINCDIR"
> - AC_SEARCH_LIBS([pcap_close], [pcap],
> -     LPCAPLIB=3D"$LIBS",
> -     AC_ERROR([Unable to link libpcap in ${foundpcap}]),
> --    -lnl)
> -+    -lnl-3)
> -=20
> - AC_SUBST(LPCAPINC)
> - AC_SUBST(LPCAPLIB)
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-improve-search-for-libpcap.patch b/meta-networking/recipes-support/tcpr=
eplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
> deleted file mode 100644
> index 50f024c..0000000
> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-imp=
rove-search-for-libpcap.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -tcpreplay: improve search for libpcap
> -
> -Add a test which will find libpcap if $testdir/.. is a sysroot.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -350,14 +350,20 @@ for testdir in $trypcapdir /usr/local /o
> -     if test -f "${testdir}/include/pcap.h" -a $foundpcap =3D no ; then
> -         LPCAPINC=3D"${testdir}/include/pcap.h"
> -         LPCAPINCDIR=3D"${testdir}/include"
> -+        # If testdir/.. is a sysroot, then sDir should point to where t=
he libraries are.
> -+        sDir=3D$(readlink -m ${testdir}/../${libdir})
> -         if test $dynamic_link =3D yes; then
> --            if test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
> -+            if test -f "${sDir}/libpcap${shrext_cmds}" ; then
> -+                LPCAPLIB=3D"-L${sDir} -lpcap"
> -+            elif test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
> -                 LPCAPLIB=3D"-L${testdir}/lib64 -lpcap"
> -             elif test -f "${testdir}/lib/libpcap${shrext_cmds}" ; then
> -                 LPCAPLIB=3D"-L${testdir}/lib -lpcap"
> -             else
> -                 AC_ERROR([Unable to find libpcap in ${testdir}])
> -             fi
> -+        elif test -f "${sDir}/libpcap.${libext}" ; then
> -+            LPCAPLIB=3D"${sDir}/libpcap.${libext}"
> -         elif test -f "${testdir}/lib64/libpcap.${libext}" ; then
> -             LPCAPLIB=3D"${testdir}/lib64/libpcap.${libext}"
> -         elif test -f "${testdir}/lib/libpcap.${libext}" ; then
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-no-bfp-support.patch b/meta-networking/recipes-support/tcpreplay/files/=
tcpreplay-3.4.4-no-bfp-support.patch
> deleted file mode 100644
> index 3c11c92..0000000
> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-=
bfp-support.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Uptream-Status: Pending
> -
> -Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -758,6 +758,8 @@
> -     AC_MSG_RESULT(no)
> - ])
> -=20
> -+ac_cv_have_bpf=3Dno
> -+
> - have_bpf=3Dno
> - dnl Check for BSD's BPF
> - AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb=
 b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
> similarity index 43%
> rename from meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
> index ccbab9f..389d61b 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
> @@ -4,16 +4,12 @@ HOMEPAGE =3D "http://tcpreplay.synfin.net/"
>  SECTION =3D "net"
> =20
>  LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3Dc33cccf72cc1603e8a72a848=
11ae3ac8"
> +LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3D890b830b22fd632e9ffd996d=
f20338f8"
> =20
>  SRC_URI =3D "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcprepla=
y-${PV}.tar.gz \
> -           file://tcpreplay-3.4.4-cross-compile.patch \
> -           file://tcpreplay-3.4.4-no-bfp-support.patch \
> -           file://tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch=
 \
> -           file://tcpreplay-3.4.4-improve-search-for-libpcap.patch \
>             "
> -SRC_URI[md5sum] =3D "22725feb9b2590809f9350308ec65180"
> -SRC_URI[sha256sum] =3D "7a809c58ddec86407fd6e5597ac883d7874a19bea81d716b=
b2b1c6e3b0e7b58f"
> +SRC_URI[md5sum] =3D "80394c33fe697b53b69eac9bb0968ae9"
> +SRC_URI[sha256sum] =3D "61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc=
91cf3a798497ffe4"
> =20
>  DEPENDS =3D "libpcap"
> =20
> --=20
> 2.8.1
>=20
--=20
-Joe MacDonald.
:wq

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJX0WlFAAoJEEn8ffcsOfaWTVEH+QGZQA5bGxiYujo2ZH9fpISo
eDOOj6ljFtCRyb1rOl0dVHialijNKjCuZRyNGpHdPwat4UUEbolCNESZ+zeJjxtv
OGOT5HXcWjYv6XpVpOyNdq8GG1Q4xt8qP7ttPCWQ4Z3VLKF2eP5yl22+hOYEzwtN
dWVm6gIaSsXLZ3DnBLfa7w++uCOCU++Ju7ouNktSMIYRWsoX4mHP/OtH/xVl6Tt4
1qgWuclxPZ92WxoACBvexnFueHJh7GPicXjQTjsSYeWAuvS0b5c+6ZqZccZ95jhl
D0UWU103Xr1z21h9QOg3O/SBfv7xtDmKvMoJvO9WdFJe63kNBQdq8L8QKLO1XC4=
=VWzu
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
