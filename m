Return-Path: <joe@deserted.net>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 593236D3DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 15:56:27 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id 2so9132368qeb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 07:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=o/6D1EXCRdLFLUTCbOzYmaTp3+i7gGIpJFFnS+sIQUY=;
	b=K0AP6mT48fkv8cdG3cNE8hD10P0EbaGergBgGDLZgtx3yZkYJruMyc+ohxDDa14y4s
	bBLIcmH+qEQXWZkENhwqt+rQirnPwytOq2Zw/1Y4bhJlGjt5prL7yvCAkackOJsApKx6
	jIZd14IiBBdhaMl1apBEcVvu00aAyDRTJs55oxoW5KIxMx8BVXZUOpc9EUjuys/Gi9p/
	TndY8RibkrpCUfU2131M+ivFr6W1a+/fdsC3U+s/myb6md9XVPSZeX+hr4gHDOPpxPR2
	vevbWqVC9Q+XGA9OyjjMUT0MJ8JNd3JjoU2q7CFd6UeaswMdQtwUn0bDI+xGUhy5w3Kn
	vz6g==
X-Gm-Message-State: ALoCoQnhSxOQgXcE1UTjKhPdvrkINnuWWsd2+0nsMBAxZuPpRnfxaDMuwiVUPhyI7BDuk4rKJOUs
X-Received: by 10.229.226.2 with SMTP id iu2mr42456685qcb.22.1385654186789;
	Thu, 28 Nov 2013 07:56:26 -0800 (PST)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	s17sm72179829qac.12.2013.11.28.07.56.25 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Nov 2013 07:56:26 -0800 (PST)
Date: Thu, 28 Nov 2013 10:56:23 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131128155621.GB3724@deserted.net>
References: <1385434314-4030-1-git-send-email-b40527@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1385434314-4030-1-git-send-email-b40527@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, otavio.salvador@gmail.com
Subject: Re: [meta-networking][PATCH] tcpreplay: add recipe
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
X-List-Received-Date: Thu, 28 Nov 2013 15:56:27 -0000
X-Groupsio-MsgNum: 47302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] tcpreplay: add recipe] On 13.11.26 (Tue 10:5=
1) b40527@freescale.com wrote:

> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>=20
> tcpreplay - a suite of GPLv3 licensed tools for UNIX operating systems
> which gives you the ability to use previously captured traffic in libpcap
> format to test a variety of network devices.
>=20
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  .../files/tcpreplay-3.4.4-cross-compile.patch      |   92 ++++++++++++++=
++++++
>  ...ay-3.4.4-fix-unable-to-link-libpcap-issue.patch |   17 ++++
>  .../files/tcpreplay-3.4.4-no-bfp-support.patch     |   15 +++
>  .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |   22 +++++
>  4 files changed, 146 insertions(+), 0 deletions(-)
>  create mode 100755 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-cross-compile.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-fix-unable-to-link-libpcap-issue.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpre=
play-3.4.4-no-bfp-support.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay_3=
=2E4.4.bb
>=20
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
--=20
-Joe MacDonald.
:wq

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKXZ6UACgkQwFvcllog0Xw5VwCfeUGEsXbib8QA7sWiVhmudYOc
SS0AoJAdIkEAJlrrLQK1R34inCz1TKE2
=UhHh
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
