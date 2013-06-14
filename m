Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D510460E12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 13:51:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5EDpxQd002491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 06:51:59 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 14 Jun 2013 06:51:59 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id BAEF77FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 09:51:43 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4B2BF404B9; Fri,
	14 Jun 2013 09:51:58 -0400 (EDT)
Date: Fri, 14 Jun 2013 09:51:58 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130614135157.GA16601@windriver.com>
References: <1371114240-24672-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1371114240-24672-1-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] ipsec-tools: Upgrade to 0.8.1 and fix build with gcc 4.8
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
X-List-Received-Date: Fri, 14 Jun 2013 13:51:59 -0000
X-Groupsio-MsgNum: 45070
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Khem,

[[oe] [meta-networking][PATCH] ipsec-tools: Upgrade to 0.8.1 and fix build =
with gcc 4.8] On 13.06.13 (Thu 02:04) Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../ipsec-tools/files/ipsec-tools-install.patch    |   18 ----------
>  .../0001-Fix-warning-with-gcc-4.8.patch            |   35 ++++++++++++++=
++++++
>  .../ipsec-tools/ipsec-tools_0.7.2.bb               |    7 ----
>  .../{ipsec-tools.inc =3D> ipsec-tools_0.8.1.bb}      |   13 ++++----
>  4 files changed, 42 insertions(+), 31 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/ipsec-tools/files/ips=
ec-tools-install.patch
>  create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls/0001-Fix-warning-with-gcc-4.8.patch
>  delete mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls_0.7.2.bb
>  rename meta-networking/recipes-support/ipsec-tools/{ipsec-tools.inc =3D>=
 ipsec-tools_0.8.1.bb} (83%)

No objections here, I was just doing a final review of the patch before
pushing it, in fact, but two questions occurred to me.

   - Any reason to ditch the .inc file?  I can imagine an answer to the
     question, but it does seem like it might be useful.

   - I had no problems testing with it but was it intentional to remove
     PARALLEL_MAKE=3D""?  I only ask because it's been part of the
     previous .inc file since the beginning of time, AFAICT.

-J.

>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tool=
s-install.patch b/meta-networking/recipes-support/ipsec-tools/files/ipsec-t=
ools-install.patch
> deleted file mode 100644
> index 85035b1..0000000
> --- a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-insta=
ll.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Avoid attempting to install vmbuf.h twice
> -
> -Upstream-Status: Accepted
> -
> -Taken from pld-linux.org:
> -http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-t=
ools-install.patch
> -
> ---- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23 13:48:40.000000=
000 +0200
> -+++ ipsec-tools-0.7.2/src/racoon/Makefile.am	2009-07-04 01:43:48.1484339=
75 +0200
> -@@ -3,7 +3,7 @@
> - sbin_PROGRAMS =3D racoon racoonctl plainrsa-gen
> - noinst_PROGRAMS =3D eaytest
> - include_racoon_HEADERS =3D racoonctl.h var.h vmbuf.h misc.h gcmalloc.h =
admin.h \
> --	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h isakmp_xauth.h \
> -+	schedule.h sockmisc.h isakmp_var.h isakmp.h isakmp_xauth.h \
> - 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h
> - lib_LTLIBRARIES =3D libracoon.la
> -=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001=
-Fix-warning-with-gcc-4.8.patch b/meta-networking/recipes-support/ipsec-too=
ls/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
> new file mode 100644
> index 0000000..569b545
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-wa=
rning-with-gcc-4.8.patch
> @@ -0,0 +1,35 @@
> +From fc230d5ded73fe4049aa586eacbe4098aeff912f Mon Sep 17 00:00:00 2001
> +From: Paul Barker <paul@paulbarker.me.uk>
> +Date: Wed, 12 Jun 2013 17:39:06 +0100
> +Subject: [PATCH] Fix warning with gcc 4.8.
> +
> +The line "memset(pair, 0, sizeof(pair));" was causing the following warn=
ing:
> +
> +	error: argument to 'sizeof' in 'memset' call is the same expression as
> +	the destination; did you mean to dereference
> +
> +Compiling with -Werror (as specified in configure.ac) was causing this w=
arning
> +to become an error. The line itself is not needed as memory is allocated=
 via
> +calloc which performs zero initialization. Therefore, the line is remove=
d to fix
> +the warning and does not need replacing anything.
> +---
> + src/racoon/ipsec_doi.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +Upstream-Status: Submitted
> +
> +diff --git a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
> +index 2b48d49..4e9d3a8 100644
> +--- a/src/racoon/ipsec_doi.c
> ++++ b/src/racoon/ipsec_doi.c
> +@@ -1183,7 +1183,6 @@ get_proppair_and_doi_sit(sa, mode, doitype, sittyp=
e)
> + 			"failed to get buffer.\n");
> + 		goto bad;
> + 	}
> +-	memset(pair, 0, sizeof(pair));
> +=20
> + 	bp =3D (caddr_t)(sab + 1);
> + 	tlen =3D sa->l - sizeof(*sab);
> +--=20
> +1.8.3
> +
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.=
2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> deleted file mode 100644
> index 255246e..0000000
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require ipsec-tools.inc
> -
> -LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endline=
=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> -
> -SRC_URI +=3D "file://ipsec-tools-install.patch"
> -SRC_URI[ipsec-tools-0.7.2.md5sum] =3D "72861f005746ee27984b2ee715ecc629"
> -SRC_URI[ipsec-tools-0.7.2.sha256sum] =3D "08722ff6c62de3e042fef337454f03=
622a79053108d6dcc686c9c854f9f9e031"
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc =
b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> similarity index 83%
> rename from meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
> rename to meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> index 264b49a..ef753c0 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> @@ -3,9 +3,15 @@ Linux-2.6 IPsec implementation."
>  HOMEPAGE =3D "http://ipsec-tools.sourceforge.net/"
>  SECTION =3D "console/network"
>  LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endline=
=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> +
>  DEPENDS =3D "virtual/kernel openssl readline flex"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2=
;name=3Dipsec-tools-${PV}"
> +SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-=
tools-${PV}.tar.bz2 \
> +           file://0001-Fix-warning-with-gcc-4.8.patch \
> +          "
> +SRC_URI[md5sum] =3D "d38b39f291ba2962387c3232e7335dd8"
> +SRC_URI[sha256sum] =3D "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a=
881d63abe8153dd4"
> =20
>  inherit autotools
> =20
> @@ -44,8 +50,3 @@ EXTRA_OECONF =3D "--with-kernel-headers=3D${STAGING_INC=
DIR} \
> =20
>  # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D530527
>  CFLAGS +=3D "-fno-strict-aliasing"
> -
> -# Sometimes it attempts to use y.tab.c before it is actually
> -# generated. Note that the failure case is very rare, but it does
> -# happen.
> -PARALLEL_MAKE =3D ""
--=20
-Joe MacDonald.
:wq

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlG7H/0ACgkQPN8S4W6ZZndFwgCdHMDr9fHxvXvHnfC1Qwq6xmzW
VdwAnjRugYmHw1lTIIC54b/TW9g0TejD
=+MUY
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
