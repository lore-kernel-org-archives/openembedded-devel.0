Return-Path: <joe@deserted.net>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6F78B70298
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 03:46:51 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so2414993igq.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Zo9xctcteqEzfm74djMDRNN+XBAqUG4ohiCErp1L+rc=;
	b=aC5tM+DcghrRkaI5wczjrrBX+cMo3IRMdj1XW+4y4Ir/+W2a0ogYdSoLQVMiZoIhmu
	FYFcjBs2NQtLqGb3sZeKn0eizHE9+lTgkZXjehW8OhJjKHRQKNA3IIuviwcxmTLhuH/C
	6RzY/2qejG6uvz4K/3j0S/VQpH8KuIwl+SFgTgKUJ7yvM/ZiJEuen2G8dgMNp7sTSWjg
	kkFfdWxR4SgAOOrgsOuHR4h4cF5sG+eOOzysphBnAnmbcUhGBXfsScoMwiJO+cG9XALj
	YpNXzl1LzpBSopdwkUkHq59e32G8IHSa/uX7idgaRwJz2Bmi+dFz5CF+dAkVUsC5dyvh
	jIaQ==
X-Gm-Message-State: ALoCoQmxC7hdbgeQ4y0+OdkXiCDng9SSkKwh9j2paTtwCnMPogdkJ3lB1QF8RszjD8GYmtPfnJpl
X-Received: by 10.42.207.68 with SMTP id fx4mr9198414icb.67.1405914412694;
	Sun, 20 Jul 2014 20:46:52 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id l5sm34723284ige.6.2014.07.20.20.46.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 20:46:52 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 2C18A1685E3; Sun, 20 Jul 2014 23:46:51 -0400 (EDT)
Date: Sun, 20 Jul 2014 23:46:51 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721034649.GA11616@deserted.net>
References: <1404796847-22332-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1404796847-22332-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking] Uprev tcpdump to 4.5.1
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
X-List-Received-Date: Mon, 21 Jul 2014 03:46:55 -0000
X-Groupsio-MsgNum: 51134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Roy.

-J.

[[oe] [PATCH][meta-networking] Uprev tcpdump to 4.5.1] On 14.07.08 (Tue 13:=
20) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>=20
>=20
> 1. update the patch tcpdump_configure_no_-O2.patch
> 2. do not check libdlpi dependence on cross-compile, or else it will
> cause do_qa_configure to fail.
> 3. do not check libpcap dependence, since the libpcap has been added
> into DEPENDS, or else it will cause do_qa_configure to fail
> 4. make the check of getaddrinfo work on cross-compile
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../0001-minimal-IEEE802.15.4-allowed.patch        |    0
>  .../{tcpdump-4.3.0 =3D> files}/configure.patch       |    0
>  .../{tcpdump-4.3.0 =3D> files}/ipv6-cross.patch      |    0
>  .../tcpdump/files/tcpdump-configure-dlpi.patch     |   31 +++++++++++++++
>  .../tcpdump/files/tcpdump-cross-getaddrinfo.patch  |   23 +++++++++++
>  .../tcpdump/files/tcpdump_configure_no_-O2.patch   |   27 +++++++++++++
>  .../files/unnecessary-to-check-libpcap.patch       |   33 +++++++++++++++
>  .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |   42 --------------=
------
>  .../tcpdump/{tcpdump_4.3.0.bb =3D> tcpdump_4.5.1.bb} |    8 +++-
>  9 files changed, 120 insertions(+), 44 deletions(-)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.3.0 =3D> files=
}/0001-minimal-IEEE802.15.4-allowed.patch (100%)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.3.0 =3D> files=
}/configure.patch (100%)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.3.0 =3D> files=
}/ipv6-cross.patch (100%)
>  create mode 100644 meta-networking/recipes-support/tcpdump/files/tcpdump=
-configure-dlpi.patch
>  create mode 100644 meta-networking/recipes-support/tcpdump/files/tcpdump=
-cross-getaddrinfo.patch
>  create mode 100644 meta-networking/recipes-support/tcpdump/files/tcpdump=
_configure_no_-O2.patch
>  create mode 100644 meta-networking/recipes-support/tcpdump/files/unneces=
sary-to-check-libpcap.patch
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0=
/tcpdump_configure_no_-O2.patch
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.3.0.bb =3D> tc=
pdump_4.5.1.bb} (80%)
>=20
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-m=
inimal-IEEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump=
/files/0001-minimal-IEEE802.15.4-allowed.patch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-mi=
nimal-IEEE802.15.4-allowed.patch
> rename to meta-networking/recipes-support/tcpdump/files/0001-minimal-IEEE=
802.15.4-allowed.patch
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/config=
ure.patch b/meta-networking/recipes-support/tcpdump/files/configure.patch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configu=
re.patch
> rename to meta-networking/recipes-support/tcpdump/files/configure.patch
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-c=
ross.patch b/meta-networking/recipes-support/tcpdump/files/ipv6-cross.patch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cr=
oss.patch
> rename to meta-networking/recipes-support/tcpdump/files/ipv6-cross.patch
> diff --git a/meta-networking/recipes-support/tcpdump/files/tcpdump-config=
ure-dlpi.patch b/meta-networking/recipes-support/tcpdump/files/tcpdump-conf=
igure-dlpi.patch
> new file mode 100644
> index 0000000..50e2d54
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/files/tcpdump-configure-dlp=
i.patch
> @@ -0,0 +1,31 @@
> +[PATCH] tcpdump: cross-compiling not check dlpi.
> +
> +For cross-compiling on Linux platforms, we do not need to check libdlpi=
=20
> +since it is only placed on Solaris.
> +Also, checking libdlpi in native /lib would cause do_qa_configure fail.
> +
> +Upstream-Status: Pending.
> +
> +Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> +---
> + configure.in |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 7f9591c..ca277c0 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -716,7 +716,9 @@ don't.])
> + fi
> +=20
> + # libdlpi is needed for Solaris 11 and later.
> +-AC_CHECK_LIB(dlpi, dlpi_walk, LIBS=3D"$LIBS -ldlpi" LDFLAGS=3D"-L/lib $=
LDFLAGS", ,-L/lib)
> ++if test "$cross_compiling" !=3D yes; then
> ++	AC_CHECK_LIB(dlpi, dlpi_walk, LIBS=3D"$LIBS -ldlpi" LDFLAGS=3D"-L/lib =
$LDFLAGS", ,-L/lib)
> ++fi
> +=20
> + dnl portability macros for getaddrinfo/getnameinfo
> + dnl
> +--=20
> +1.7.5.4
> +
> diff --git a/meta-networking/recipes-support/tcpdump/files/tcpdump-cross-=
getaddrinfo.patch b/meta-networking/recipes-support/tcpdump/files/tcpdump-c=
ross-getaddrinfo.patch
> new file mode 100644
> index 0000000..b414b72
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/files/tcpdump-cross-getaddr=
info.patch
> @@ -0,0 +1,23 @@
> +Fix getaddinfo check when cross compiling
> +
> +Upstream-Status: Pending.
> +
> +AC_TRY_RUN defaults to td_cv_buggygetaddrinfo=3Dyes when
> +cross-compiling. So this change indicates that we
> +are cross-compiling.
> +
> +Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
> +
> +diff --git a/configure.in b/configure.in
> +index ca277c0..283035e 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -434,7 +434,7 @@ main()
> + ],
> + 	td_cv_buggygetaddrinfo=3Dno,
> + 	td_cv_buggygetaddrinfo=3Dyes,
> +-	td_cv_buggygetaddrinfo=3Dyes)])
> ++	td_cv_buggygetaddrinfo=3Dcross)])
> + 	if test "$td_cv_buggygetaddrinfo" =3D no; then
> + 		AC_MSG_RESULT(good)
> + 	else
> diff --git a/meta-networking/recipes-support/tcpdump/files/tcpdump_config=
ure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/files/tcpdump_co=
nfigure_no_-O2.patch
> new file mode 100644
> index 0000000..b2296bc
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/files/tcpdump_configure_no_=
-O2.patch
> @@ -0,0 +1,27 @@
> +---
> + configure |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 468a517..a890728 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3036,13 +3036,13 @@ if test "$ac_test_CFLAGS" =3D set; then
> +   CFLAGS=3D$ac_save_CFLAGS
> + elif test $ac_cv_prog_cc_g =3D yes; then
> +   if test "$GCC" =3D yes; then
> +-    CFLAGS=3D"-g -O2"
> ++    CFLAGS=3D"-g"
> +   else
> +     CFLAGS=3D"-g"
> +   fi
> + else
> +   if test "$GCC" =3D yes; then
> +-    CFLAGS=3D"-O2"
> ++    CFLAGS=3D
> +   else
> +     CFLAGS=3D
> +   fi
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-networking/recipes-support/tcpdump/files/unnecessary-to=
-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/files/unnece=
ssary-to-check-libpcap.patch
> new file mode 100644
> index 0000000..d7a3ac2
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/files/unnecessary-to-check-=
libpcap.patch
> @@ -0,0 +1,33 @@
> +unnecessary to check libpcap
> +
> +Upstream-Status: Pending
> +
> +since the check of libpcap did not consider the cross-compile, lead to t=
he
> +below error:
> +	This autoconf log indicates errors, it looked at host include and/or
> +	library paths while determining system capabilities.
> +
> +In fact, the libpcap has been added into the tcpdump's DEPENDS, not need=
 to
> +check if libpcap existed.
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + configure.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 06fade1..9125de7 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -567,7 +567,7 @@ AC_SEARCH_LIBS(getrpcbynumber, nsl,
> + dnl AC_CHECK_LIB(z, uncompress)
> + dnl AC_CHECK_HEADERS(zlib.h)
> +=20
> +-AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
> ++#AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
> +=20
> + #
> + # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdum=
p_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-=
4.3.0/tcpdump_configure_no_-O2.patch
> deleted file mode 100644
> index 7929da5..0000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_confi=
gure_no_-O2.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> ----
> - configure |    8 ++++----
> - 1 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure b/configure
> -index cb51d19..73d51af 100755
> ---- a/configure
> -+++ b/configure
> -@@ -2691,13 +2691,13 @@ if test "$ac_test_CFLAGS" =3D set; then
> -   CFLAGS=3D$ac_save_CFLAGS
> - elif test $ac_cv_prog_cc_g =3D yes; then
> -   if test "$GCC" =3D yes; then
> --    CFLAGS=3D"-g -O2"
> -+    CFLAGS=3D"-g"
> -   else
> -     CFLAGS=3D"-g"
> -   fi
> - else
> -   if test "$GCC" =3D yes; then
> --    CFLAGS=3D"-O2"
> -+    CFLAGS=3D""
> -   else
> -     CFLAGS=3D
> -   fi
> -@@ -2830,7 +2830,7 @@ ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> -     if test "$GCC" =3D yes ; then
> - 	    if test "$SHLICC2" =3D yes ; then
> - 		    ac_cv_lbl_gcc_vers=3D2
> --		    V_CCOPT=3D"-O2"
> -+		    V_CCOPT=3D""
> - 	    else
> - 		    { echo "$as_me:$LINENO: checking gcc version" >&5
> - echo $ECHO_N "checking gcc version... $ECHO_C" >&6; }
> -@@ -2847,7 +2847,7 @@ fi
> - 		    { echo "$as_me:$LINENO: result: $ac_cv_lbl_gcc_vers" >&5
> - echo "${ECHO_T}$ac_cv_lbl_gcc_vers" >&6; }
> - 		    if test $ac_cv_lbl_gcc_vers -gt 1 ; then
> --			    V_CCOPT=3D"-O2"
> -+			    V_CCOPT=3D""
> - 		    fi
> - 	    fi
> -     else
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/m=
eta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
> similarity index 80%
> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
> index 0d88990..9ce02d6 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
> @@ -11,9 +11,13 @@ SRC_URI =3D " \
>      file://0001-minimal-IEEE802.15.4-allowed.patch \
>      file://ipv6-cross.patch \
>      file://configure.patch \
> +    file://unnecessary-to-check-libpcap.patch \
> +    file://tcpdump-configure-dlpi.patch \
> +    file://tcpdump-cross-getaddrinfo.patch \
>  "
> -SRC_URI[md5sum] =3D "a3fe4d30ac85ff5467c889ff46b7e1e8"
> -SRC_URI[sha256sum] =3D "efd08b610210d39977ec3175fa82dad9fbd33587930081be=
2a905a712dba4286"
> +SRC_URI[md5sum] =3D "973a2513d0076e34aa9da7e15ed98e1b"
> +SRC_URI[sha256sum] =3D "14ab39657128f3a650aed4cf455f76c7590601087b6101c2=
53d698f6e73f0b96"
> +export LIBS=3D" -lpcap"
> =20
>  inherit autotools-brokensep
>  CACHED_CONFIGUREVARS =3D "ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlPMjSkACgkQwFvcllog0XyvEQCfaRWJr93wQ0W/yCiEz+0CMHR8
fEAAn1Wb531ShRFGt0+XJ+C1/iDva0SB
=NFlO
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
