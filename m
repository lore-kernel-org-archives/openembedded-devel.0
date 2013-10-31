Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id C3BA36CB9A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:10:09 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c1so1155185eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2YxF/UQgChZ0kXmzRP7B1yArQMbvcLLw+kq97f4Cnzk=;
	b=gWk/GH4blfGDRN6MOUxr8YFJKKLO9dHX3jZqEoi/5p9Wdxutl6uIizFU0wXqIygo7w
	IeAwIymcAIw0xJh+u3kpK4S6cWdHA0uFQ2UkpJ+LZcUedXdNSqNltkrK12B1MSudRCn2
	vU0ha3vgS0KgXbuqXs+FFbB/cmdJX5xZUqkWnfl6weR5qVnjhn3w7eLMRyG0wM/H54Cu
	nEFpNYdLliZAxH+lToKYg3gIqapnJ/S1RQEUeiTKKqYq406wbF3m2CbXdPFu1MAl0+9k
	LkZMVOgAiXLplHQQOq6rsj/EhtAF1d4B6tgtQiyOyc+trubMb10EGCw4bmdha+qgXq7P
	0RIg==
X-Received: by 10.14.219.198 with SMTP id m46mr1716431eep.41.1383207011306;
	Thu, 31 Oct 2013 01:10:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm5333093eeg.13.2013.10.31.01.10.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 01:10:10 -0700 (PDT)
Date: Thu, 31 Oct 2013 09:10:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131031081012.GC32015@jama>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1383205247-8487-1-git-send-email-b40527@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
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
X-List-Received-Date: Thu, 31 Oct 2013 08:10:10 -0000
X-Groupsio-MsgNum: 46953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline

--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 02:40:47AM -0500, b40527@freescale.com wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>=20
> *tcpreplay - a suite of GPLv3 licensed tools for UNIX operating
> systems which gives you the ability to use previously captured traffic
> in libpcap format to test a variety of network devices.
>=20
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  .../files/tcpreplay-3.4.4-cross-compile.patch      |   90 ++++++++++++++=
++++++
>  .../files/tcpreplay-3.4.4-no-bfp-support.patch     |   13 +++
>  .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |   23 +++++
>  3 files changed, 126 insertions(+)
>  create mode 100755 meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4=
=2E4-cross-compile.patch
>  create mode 100644 meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4=
=2E4-no-bfp-support.patch
>  create mode 100644 meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb

Looks like something for meta-networking?

>=20
> diff --git a/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cros=
s-compile.patch b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-c=
ross-compile.patch
> new file mode 100755
> index 0000000..226f97a
> --- /dev/null
> +++ b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compi=
le.patch
> @@ -0,0 +1,90 @@
> +Uptream-Status: Inappropriate [embedded specific]
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
> diff --git a/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-b=
fp-support.patch b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-=
no-bfp-support.patch
> new file mode 100644
> index 0000000..70fa959
> --- /dev/null
> +++ b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-supp=
ort.patch
> @@ -0,0 +1,13 @@
> +Uptream-Status: Inappropriate [embedded specific]
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
> diff --git a/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-=
oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> new file mode 100644
> index 0000000..98c9c4a
> --- /dev/null
> +++ b/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Use previously captured traffic to test network devices"
> +
> +HOMEPAGE =3D "http://tcpreplay.synfin.net/"
> +SECTION =3D "console/network"
> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3Dc33cccf72cc1603e8a72a848=
11ae3ac8"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcprepla=
y-${PV}.tar.gz \
> +           file://tcpreplay-3.4.4-cross-compile.patch \
> +           file://tcpreplay-3.4.4-no-bfp-support.patch \
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
> --=20
> 1.7.9.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyEGQACgkQN1Ujt2V2gBy5sgCfb/j+37ITc+PLejjlPUW+M2D5
4+sAoISKX8OoY9s6LQuSpREjKfi6/Gju
=LNWD
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
