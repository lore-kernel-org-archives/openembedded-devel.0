Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 98DAE6D330
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 09:11:57 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e51so135762eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 01:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kaA5gn5uTzzOqXrhkziPHjzOeb4tBxx5Jg5H7ZkG+CI=;
	b=vmOns7otiZjMOPxuzKp+5sg9ip4wDvwjbts/bPajVRxDrU+20y2jaAqxSX6gVNKuM7
	Y27R6pRnBoTR4V/lga4T9osD2BVpVKcPoMWrdrfGzk4gUu3V/LVcnsNnzeANG2J7Ez7j
	TPeePA8KvjE5jZYlsGmjb6D9BaJBckNzpg32djyEhFZussvuYm/Fsh0TvUaErXTjX8xB
	z7qRyAVueGG2ZnhJEl47M1QD8GGzjcG5D5jPUfMj/jpOGnmde//Ft92I1XTboS1ol3oE
	xZ7QWZAnIjYTG3iU3Qx8/fQue95nAmdxs1Sp6/aM9XDXhspbu+TBzQCWC1kRWkRR+xit
	KFrg==
X-Received: by 10.15.107.193 with SMTP id cb41mr757679eeb.82.1383815518758;
	Thu, 07 Nov 2013 01:11:58 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h8sm6607254eew.16.2013.11.07.01.11.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 01:11:57 -0800 (PST)
Date: Thu, 7 Nov 2013 10:12:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Zongchun.Yu@freescale.com
Message-ID: <20131107091210.GA3682@jama>
References: <1383792523-9623-1-git-send-email-Zongchun.Yu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1383792523-9623-1-git-send-email-Zongchun.Yu@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCHv2] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
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
X-List-Received-Date: Thu, 07 Nov 2013 09:11:58 -0000
X-Groupsio-MsgNum: 47034
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2013 at 08:48:43PM -0600, Zongchun.Yu@freescale.com wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>=20
> *mv tcpdump from meta-oe to meta-networking
> *add tcpreplay - a suite of GPLv3 licensed tools for UNIX operating
> systems which gives you the ability to use previously captured traffic
> in libpcap format to test a variety of network devices.

Can you update the packagegroup in meta-oe which depends on tcpdump?
PACKAGECONFIG or just dropping tcpdump from it is fine with me.

> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  .../0001-minimal-IEEE802.15.4-allowed.patch        |    0
>  .../tcpdump/tcpdump-4.3.0/configure.patch          |    0
>  .../tcpdump/tcpdump-4.3.0/ipv6-cross.patch         |    0
>  .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |    0
>  .../recipes-support/tcpdump/tcpdump_4.3.0.bb       |    0
>  .../files/tcpreplay-3.4.4-cross-compile.patch      |   92 ++++++++++++++=
++++++
>  ...ay-3.4.4-fix-unable-to-link-libpcap-issue.patch |   17 ++++
>  .../files/tcpreplay-3.4.4-no-bfp-support.patch     |   15 ++++
>  .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |   22 +++++
>  .../packagegroups/packagegroup-cli-tools.bb        |    1 -
>  10 files changed, 146 insertions(+), 1 deletion(-)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/0001-minimal-IEEE802.15.4-allowed.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/configure.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/ipv6-cross.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/tcpdump_configure_no_-O2.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump_4.=
3.0.bb (100%)
>  create mode 100755 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-cross-compile.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-fix-unable-to-link-libpcap-issue.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-no-bfp-support.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay_3=
=2E4.4.bb
>=20
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-I=
EEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump/tcpdump=
-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IE=
EE802.15.4-allowed.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-mini=
mal-IEEE802.15.4-allowed.patch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patc=
h b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure=
=2Epatch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.pat=
ch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cros=
s.patch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_config=
ure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tc=
pdump_configure_no_-O2.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configu=
re_no_-O2.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_c=
onfigure_no_-O2.patch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-netw=
orking/recipes-support/tcpdump/tcpdump_4.3.0.bb
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-cross-compile.patch b/meta-networking/recipes-support/tcpreplay/files/t=
cpreplay-3.4.4-cross-compile.patch
> new file mode 100755
> index 0000000..a856b18
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cro=
ss-compile.patch
> @@ -0,0 +1,92 @@
> +Uptream-Status: Pending
> +
> +Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -402,7 +402,6 @@
> +=20
> + dnl 0.9.6 (which is still thinks it is 0.9.5 due to a bug) introduces a=
n important
> + dnl fix for OSX.  See: http://tcpreplay.synfin.net/trac/ticket/167
> +-libpcap_version_096=3Dno
> + AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> + #include <string.h>
> + #include <stdlib.h>
> +@@ -419,11 +418,12 @@
> +             exit(0);
> +=20
> +     exit(1);
> +-]]), [
> +-    libpcap_version_096=3Dyes
> +-])
> ++]]),
> ++ [libpcap_version_096=3Dyes],
> ++ [libpcap_version_096=3Dno],
> ++ [libpcap_version_096=3Dyes]
> ++)
> +=20
> +-libpcap_ver8=3Dno
> + AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> + #include <string.h>
> + #include <stdlib.h>
> +@@ -444,13 +444,12 @@
> +         exit(0);
> +=20
> +     exit(1);
> +-]]), [
> +-    libpcap_ver8=3Dyes
> +-], [
> +-    libpcap_ver8=3Dno
> +-])
> ++]]),
> ++ [libpcap_ver8=3Dyes],
> ++ [libpcap_ver8=3Dno],
> ++ [libpcap_ver8=3Dyes]
> ++)
> +=20
> +-libpcap_ver7=3Dno
> + AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> + #include <string.h>
> + #include <stdlib.h>
> +@@ -469,11 +468,11 @@
> +             exit(0);
> +=20
> +     exit(1);
> +-]]), [
> +-    libpcap_ver7=3Dyes
> +-], [
> +-    libpcap_ver7=3Dno
> +-])
> ++]]),
> ++ [libpcap_ver7=3Dyes],
> ++ [libpcap_ver7=3Dno],
> ++ [libpcap_ver7=3Dyes]
> ++)
> +=20
> + if test x$libpcap_ver8 =3D xyes ; then
> +     AC_MSG_RESULT(>=3D 0.8.0)
> +@@ -761,8 +760,8 @@
> +=20
> + have_bpf=3Dno
> + dnl Check for BSD's BPF
> +-AC_MSG_CHECKING(for BPF device sending support)
> +-AC_TRY_RUN([
> ++AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
> ++[AC_TRY_RUN([
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <sys/types.h>
> +@@ -796,8 +795,11 @@
> +             [Do we have BPF device support?])
> +     AC_MSG_RESULT(yes)
> +     have_bpf=3Dyes
> +-],[
> +-    AC_MSG_RESULT(no)
> ++],
> ++[AC_MSG_RESULT(no)],
> ++[AC_MSG_ERROR([cross-compiling,
> ++  presetting ac_cv_have_bpf=3D(yes|no) will help])]
> ++)
> + ])
> +=20
> +=20
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-fix-unable-to-link-libpcap-issue.patch b/meta-networking/recipes-suppor=
t/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
> new file mode 100644
> index 0000000..5f36c68
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix=
-unable-to-link-libpcap-issue.patch
> @@ -0,0 +1,17 @@
> +Uptream-Status: Pending
> +
> +Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> +
> +Index: tcpreplay-3.4.4/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- tcpreplay-3.4.4.orig/configure.ac
> ++++ tcpreplay-3.4.4/configure.ac
> +@@ -389,7 +389,7 @@ CFLAGS=3D"$CFLAGS -I$LPCAPINCDIR"
> + AC_SEARCH_LIBS([pcap_close], [pcap],
> +     LPCAPLIB=3D"$LIBS",
> +     AC_ERROR([Unable to link libpcap in ${foundpcap}]),
> +-    -lnl)
> ++    -lnl-3)
> +=20
> + AC_SUBST(LPCAPINC)
> + AC_SUBST(LPCAPLIB)
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.=
4.4-no-bfp-support.patch b/meta-networking/recipes-support/tcpreplay/files/=
tcpreplay-3.4.4-no-bfp-support.patch
> new file mode 100644
> index 0000000..3c11c92
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-=
bfp-support.patch
> @@ -0,0 +1,15 @@
> +Uptream-Status: Pending
> +
> +Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -758,6 +758,8 @@
> +     AC_MSG_RESULT(no)
> + ])
> +=20
> ++ac_cv_have_bpf=3Dno
> ++
> + have_bpf=3Dno
> + dnl Check for BSD's BPF
> + AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb=
 b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> new file mode 100644
> index 0000000..d211888
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Use previously captured traffic to test network devices"
> +
> +HOMEPAGE =3D "http://tcpreplay.synfin.net/"
> +SECTION =3D "console/network"
> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3Dc33cccf72cc1603e8a72a848=
11ae3ac8"
> +
> +SRC_URI =3D "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcprepla=
y-${PV}.tar.gz \
> +           file://tcpreplay-3.4.4-cross-compile.patch \
> +           file://tcpreplay-3.4.4-no-bfp-support.patch \
> +           file://tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch=
 \
> +           "
> +SRC_URI[md5sum] =3D "22725feb9b2590809f9350308ec65180"
> +SRC_URI[sha256sum] =3D "7a809c58ddec86407fd6e5597ac883d7874a19bea81d716b=
b2b1c6e3b0e7b58f"
> +
> +DEPENDS =3D "libpcap"
> +
> +EXTRA_OECONF +=3D "--with-libpcap=3D${STAGING_DIR_HOST}/usr"
> +
> +inherit siteinfo autotools
> +
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> index fa53a67..8807fd1 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> @@ -45,7 +45,6 @@ RDEPENDS_${PN}-debug =3D "\
>      s3c64xx-gpio \
>      serial-forward \
>      strace \
> -    tcpdump \
>  "
> =20
>  RRECOMMENDS_${PN}-debug =3D "\
> --=20
> 1.7.9.7
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ7WWoACgkQN1Ujt2V2gByoSwCePtSnV11wjLcRGmr0vUixqkwo
qzMAnjD1zL913tUiMPuoCq2LP+OgbNzM
=a84p
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
