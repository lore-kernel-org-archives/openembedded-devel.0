Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3049D70907
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:04:06 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id 10so1763954lbg.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TNMhCJlgVv4J+s4JkA+rxawjK+o0rmdbDfkRRADOQso=;
	b=WWSG7yA5NU4dRI240OJDe4QJ7IMi9ZGGyqZ2EzzVsTn1lB6kjkCPEhZD37z6AsvWRC
	qCf7EJcUSvTGbojBFxaC3CsAUSMK7IdiLP27aTXo4rSgV1jNi4qPbfCr2xpkI6jS33LS
	OLmcGio49NQIEBnUconAQOSrqO6YQWqFAGitMBNJaGHs84Zu5zAag/Im8JK14U32tUzv
	jl+tlxeBLfqIwImsbRKOfHkjpqS4tipJMUirPmk/fyJclb2C14lYGgA3lX2EvQIKFEOr
	8INaLapPl8D093bEw/K+vW17rg0p9+3Hz51uJMB7kIhxMcP9vWd3EupJ9+GVnnboI+6Y
	19dA==
X-Received: by 10.112.235.199 with SMTP id uo7mr10346192lbc.50.1408093447080; 
	Fri, 15 Aug 2014 02:04:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ad8sm11858459lbc.15.2014.08.15.02.04.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 02:04:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 11:04:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140815090444.GB22747@jama>
References: <1408078891-27771-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1408078891-27771-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] tcpdump: uprev it to 4.6.1
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
X-List-Received-Date: Fri, 15 Aug 2014 09:04:07 -0000
X-Groupsio-MsgNum: 51713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2014 at 01:01:31PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. uprev to 4.6.1
> 2. remove three obsolete patches
> 3. use PACKAGECONFIG, and the default value is ipv6 openssl
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../0001-minimal-IEEE802.15.4-allowed.patch        |   22 -----------
>  .../tcpdump/tcpdump-4.5.1/ipv6-cross.patch         |   41 --------------=
------
>  .../tcpdump-4.5.1/tcpdump_configure_no_-O2.patch   |   27 -------------
>  .../configure.patch                                |    0
>  .../tcpdump-configure-dlpi.patch                   |    0
>  .../tcpdump-cross-getaddrinfo.patch                |    0
>  .../unnecessary-to-check-libpcap.patch             |    0
>  .../tcpdump/{tcpdump_4.5.1.bb =3D> tcpdump_4.6.1.bb} |   12 +++---
>  8 files changed, 5 insertions(+), 97 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.5.1=
/0001-minimal-IEEE802.15.4-allowed.patch
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.5.1=
/ipv6-cross.patch
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.5.1=
/tcpdump_configure_no_-O2.patch
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 =3D> tcpdu=
mp-4.6.1}/configure.patch (100%)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 =3D> tcpdu=
mp-4.6.1}/tcpdump-configure-dlpi.patch (100%)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 =3D> tcpdu=
mp-4.6.1}/tcpdump-cross-getaddrinfo.patch (100%)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 =3D> tcpdu=
mp-4.6.1}/unnecessary-to-check-libpcap.patch (100%)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.5.1.bb =3D> tc=
pdump_4.6.1.bb} (73%)
>=20
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/0001-m=
inimal-IEEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump=
/tcpdump-4.5.1/0001-minimal-IEEE802.15.4-allowed.patch
> deleted file mode 100644
> index 9d3d60d..0000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/0001-minimal-=
IEEE802.15.4-allowed.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From: Sergey Lapin <slapin@slind.org>
> -Date: Wed, 28 Jan 2009 16:34:15 +0300
> -Subject: [PATCH] minimal IEEE802.15.4 allowed
> -
> ----
> - tcpdump.c |    3 +++
> - 1 files changed, 3 insertions(+), 0 deletions(-)
> -
> -diff --git a/tcpdump.c b/tcpdump.c
> -index 06683af..fbc944c 100644
> ---- a/tcpdump.c
> -+++ b/tcpdump.c
> -@@ -282,6 +282,9 @@ static struct printer printers[] =3D {
> - #ifdef DLT_MFR
> - 	{ mfr_if_print,		DLT_MFR },
> - #endif
> -+#ifdef DLT_IEEE802_15_4
> -+	{ raw_if_print, DLT_IEEE802_15_4 },
> -+#endif
> - #if defined(DLT_BLUETOOTH_HCI_H4_WITH_PHDR) && defined(HAVE_PCAP_BLUETO=
OTH_H)
> - 	{ bt_if_print,		DLT_BLUETOOTH_HCI_H4_WITH_PHDR},
> - #endif
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-c=
ross.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-cro=
ss.patch
> deleted file mode 100644
> index 7eba2c5..0000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-cross.pa=
tch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> ----
> - configure.in |   12 ++++++++----
> - 1 files changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure.in b/configure.in
> -index eb3e5e8..11257c9 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -181,8 +181,9 @@ yes)   AC_MSG_RESULT(yes)
> -        ipv6=3Dno
> -        ;;
> -   esac ],
> --
> --  AC_TRY_RUN([ /* AF_INET6 available check */
> -+[
> -+  if test x"$cross_compiling" !=3D "xyes"; then
> -+    AC_TRY_RUN([ /* AF_INET6 avalable check */
> - #include <sys/types.h>
> - #include <sys/socket.h>
> - main()
> -@@ -201,7 +202,10 @@ main()
> -   ipv6=3Dno],
> - [ AC_MSG_RESULT(no)
> -   ipv6=3Dno]
> --))
> -+  )
> -+else
> -+  AC_MSG_FAILURE([Unable to check for ipv6 when crosscompiling, please =
specify.])
> -+fi])
> -=20
> - ipv6type=3Dunknown
> - ipv6lib=3Dnone
> -@@ -316,7 +320,7 @@ if test "$ipv6" =3D "yes" -a "$ipv6lib" !=3D "none";=
 then
> - fi
> -=20
> -=20
> --if test "$ipv6" =3D "yes"; then
> -+if test x"$cross_compiling" !=3D "xyes" -a "$ipv6" =3D "yes"; then
> - 	#
> - 	# XXX - on Tru64 UNIX 5.1, there is no "getaddrinfo()"
> - 	# function in libc; there are "ngetaddrinfo()" and
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdum=
p_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-=
4.5.1/tcpdump_configure_no_-O2.patch
> deleted file mode 100644
> index b2296bc..0000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump_confi=
gure_no_-O2.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> ----
> - configure |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 468a517..a890728 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3036,13 +3036,13 @@ if test "$ac_test_CFLAGS" =3D set; then
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
> -+    CFLAGS=3D
> -   else
> -     CFLAGS=3D
> -   fi
> ---=20
> -1.7.9.5
> -
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/config=
ure.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure=
=2Epatch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/configu=
re.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure=
=2Epatch
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdum=
p-configure-dlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.=
6.1/tcpdump-configure-dlpi.patch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump=
-configure-dlpi.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-c=
onfigure-dlpi.patch
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdum=
p-cross-getaddrinfo.patch b/meta-networking/recipes-support/tcpdump/tcpdump=
-4.6.1/tcpdump-cross-getaddrinfo.patch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump=
-cross-getaddrinfo.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-c=
ross-getaddrinfo.patch
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/unnece=
ssary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpd=
ump-4.6.1/unnecessary-to-check-libpcap.patch
> similarity index 100%
> rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/unneces=
sary-to-check-libpcap.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/unnecessa=
ry-to-check-libpcap.patch
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb b/m=
eta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> similarity index 73%
> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> index 9ce02d6..f05a28f 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> @@ -7,23 +7,21 @@ DEPENDS =3D "libpcap"
> =20
>  SRC_URI =3D " \
>      http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \

tcpdump-${PV} -> ${BP}

> -    file://tcpdump_configure_no_-O2.patch \
> -    file://0001-minimal-IEEE802.15.4-allowed.patch \
> -    file://ipv6-cross.patch \
>      file://configure.patch \
>      file://unnecessary-to-check-libpcap.patch \
>      file://tcpdump-configure-dlpi.patch \
>      file://tcpdump-cross-getaddrinfo.patch \
>  "
> -SRC_URI[md5sum] =3D "973a2513d0076e34aa9da7e15ed98e1b"
> -SRC_URI[sha256sum] =3D "14ab39657128f3a650aed4cf455f76c7590601087b6101c2=
53d698f6e73f0b96"
> +SRC_URI[md5sum] =3D "dab267ec30216a069747d10314079ec7"
> +SRC_URI[sha256sum] =3D "4c88c2a9aeb4047074f344fc9b2b6577b219972d359e192f=
6d12ccf983a13fd7"
>  export LIBS=3D" -lpcap"
> =20
>  inherit autotools-brokensep
>  CACHED_CONFIGUREVARS =3D "ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}"
> =20
> -EXTRA_OECONF =3D "--without-crypto \
> -        ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--=
disable-ipv6', d)}"
> +PACKAGECONFIG ??=3D "openssl ipv6"
> +PACKAGECONFIG[openssl] =3D "--with-crypto=3Dyes, --without-openssl --wit=
hout-crypto, openssl"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> =20
>  EXTRA_AUTORECONF +=3D " -I m4"
> =20
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPtzSwACgkQN1Ujt2V2gBzFSACfXFcPcNLQSjmLuZWHdvnB3tG7
bIEAnRAnUfllt0Em2O4abRLY4qXhe5q+
=BMKL
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
