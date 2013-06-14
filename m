Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23346621CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 15:13:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5EFDdec019688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:13:39 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 14 Jun 2013 08:13:39 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id A73B47FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 11:13:23 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 494BA404B9; Fri,
	14 Jun 2013 11:13:38 -0400 (EDT)
Date: Fri, 14 Jun 2013 11:13:38 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130614151338.GF16601@windriver.com>
References: <1371114240-24672-1-git-send-email-raj.khem@gmail.com>
	<20130614135157.GA16601@windriver.com>
	<0223AC4E-DA7B-4456-BCB4-F54B4FE1166A@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0223AC4E-DA7B-4456-BCB4-F54B4FE1166A@gmail.com>
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
X-List-Received-Date: Fri, 14 Jun 2013 15:13:38 -0000
X-Groupsio-MsgNum: 45072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline

--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] ipsec-tools: Upgrade to 0.8.1 and fix bu=
ild with gcc 4.8] On 13.06.14 (Fri 08:06) Khem Raj wrote:

>=20
> On Jun 14, 2013, at 6:51 AM, Joe MacDonald <Joe.MacDonald@windriver.com> =
wrote:
>=20
> > Hey Khem,
> >=20
> > [[oe] [meta-networking][PATCH] ipsec-tools: Upgrade to 0.8.1 and fix bu=
ild with gcc 4.8] On 13.06.13 (Thu 02:04) Khem Raj wrote:
> >=20
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> .../ipsec-tools/files/ipsec-tools-install.patch    |   18 ----------
> >> .../0001-Fix-warning-with-gcc-4.8.patch            |   35 ++++++++++++=
++++++++
> >> .../ipsec-tools/ipsec-tools_0.7.2.bb               |    7 ----
> >> .../{ipsec-tools.inc =3D> ipsec-tools_0.8.1.bb}      |   13 ++++----
> >> 4 files changed, 42 insertions(+), 31 deletions(-)
> >> delete mode 100644 meta-networking/recipes-support/ipsec-tools/files/i=
psec-tools-install.patch
> >> create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-t=
ools/0001-Fix-warning-with-gcc-4.8.patch
> >> delete mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-t=
ools_0.7.2.bb
> >> rename meta-networking/recipes-support/ipsec-tools/{ipsec-tools.inc =
=3D> ipsec-tools_0.8.1.bb} (83%)
> >=20
> > No objections here, I was just doing a final review of the patch before
> > pushing it, in fact, but two questions occurred to me.
> >=20
> >   - Any reason to ditch the .inc file?  I can imagine an answer to the
> >     question, but it does seem like it might be useful.
>=20
> Its not shared. So I thought it better to squash it.

Yeah.  I'm not sure if there's value in maintaining the somewhat static
pieces separately so the update is smaller on a package update, it does
make the diffs a bit easier to read, but this recipe is small anyway.
I'm good with this.

>=20
> >=20
> >   - I had no problems testing with it but was it intentional to remove
> >     PARALLEL_MAKE=3D""?  I only ask because it's been part of the
> >     previous .inc file since the beginning of time, AFAICT.
>=20
> All my builds have been using -j14 and -j20 on multiple occasions and dif=
ferent arches and it never failed for me.=20

Works for me.  All of mine are >15, so I figured if there was anything
still wrong, I would've tripped over it, but it's nice to have the extra
data point.

So, merged.  Thanks.

-J.

>=20
> >=20
> > -J.
> >=20
> >>=20
> >> diff --git a/meta-networking/recipes-support/ipsec-tools/files/ipsec-t=
ools-install.patch b/meta-networking/recipes-support/ipsec-tools/files/ipse=
c-tools-install.patch
> >> deleted file mode 100644
> >> index 85035b1..0000000
> >> --- a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-in=
stall.patch
> >> +++ /dev/null
> >> @@ -1,18 +0,0 @@
> >> -Avoid attempting to install vmbuf.h twice
> >> -
> >> -Upstream-Status: Accepted
> >> -
> >> -Taken from pld-linux.org:
> >> -http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipse=
c-tools-install.patch
> >> -
> >> ---- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23 13:48:40.000=
000000 +0200
> >> -+++ ipsec-tools-0.7.2/src/racoon/Makefile.am	2009-07-04 01:43:48.1484=
33975 +0200
> >> -@@ -3,7 +3,7 @@
> >> - sbin_PROGRAMS =3D racoon racoonctl plainrsa-gen
> >> - noinst_PROGRAMS =3D eaytest
> >> - include_racoon_HEADERS =3D racoonctl.h var.h vmbuf.h misc.h gcmalloc=
=2Eh admin.h \
> >> --	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h isakmp_xauth.h \
> >> -+	schedule.h sockmisc.h isakmp_var.h isakmp.h isakmp_xauth.h \
> >> - 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h
> >> - lib_LTLIBRARIES =3D libracoon.la
> >> -=20
> >> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0=
001-Fix-warning-with-gcc-4.8.patch b/meta-networking/recipes-support/ipsec-=
tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
> >> new file mode 100644
> >> index 0000000..569b545
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix=
-warning-with-gcc-4.8.patch
> >> @@ -0,0 +1,35 @@
> >> +From fc230d5ded73fe4049aa586eacbe4098aeff912f Mon Sep 17 00:00:00 2001
> >> +From: Paul Barker <paul@paulbarker.me.uk>
> >> +Date: Wed, 12 Jun 2013 17:39:06 +0100
> >> +Subject: [PATCH] Fix warning with gcc 4.8.
> >> +
> >> +The line "memset(pair, 0, sizeof(pair));" was causing the following w=
arning:
> >> +
> >> +	error: argument to 'sizeof' in 'memset' call is the same expression =
as
> >> +	the destination; did you mean to dereference
> >> +
> >> +Compiling with -Werror (as specified in configure.ac) was causing thi=
s warning
> >> +to become an error. The line itself is not needed as memory is alloca=
ted via
> >> +calloc which performs zero initialization. Therefore, the line is rem=
oved to fix
> >> +the warning and does not need replacing anything.
> >> +---
> >> + src/racoon/ipsec_doi.c | 1 -
> >> + 1 file changed, 1 deletion(-)
> >> +
> >> +Upstream-Status: Submitted
> >> +
> >> +diff --git a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
> >> +index 2b48d49..4e9d3a8 100644
> >> +--- a/src/racoon/ipsec_doi.c
> >> ++++ b/src/racoon/ipsec_doi.c
> >> +@@ -1183,7 +1183,6 @@ get_proppair_and_doi_sit(sa, mode, doitype, sit=
type)
> >> + 			"failed to get buffer.\n");
> >> + 		goto bad;
> >> + 	}
> >> +-	memset(pair, 0, sizeof(pair));
> >> +=20
> >> + 	bp =3D (caddr_t)(sab + 1);
> >> + 	tlen =3D sa->l - sizeof(*sab);
> >> +--=20
> >> +1.8.3
> >> +
> >> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0=
=2E7.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> >> deleted file mode 100644
> >> index 255246e..0000000
> >> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> >> +++ /dev/null
> >> @@ -1,7 +0,0 @@
> >> -require ipsec-tools.inc
> >> -
> >> -LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endli=
ne=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> >> -
> >> -SRC_URI +=3D "file://ipsec-tools-install.patch"
> >> -SRC_URI[ipsec-tools-0.7.2.md5sum] =3D "72861f005746ee27984b2ee715ecc6=
29"
> >> -SRC_URI[ipsec-tools-0.7.2.sha256sum] =3D "08722ff6c62de3e042fef337454=
f03622a79053108d6dcc686c9c854f9f9e031"
> >> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools.i=
nc b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> >> similarity index 83%
> >> rename from meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
> >> rename to meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
1.bb
> >> index 264b49a..ef753c0 100644
> >> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
> >> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> >> @@ -3,9 +3,15 @@ Linux-2.6 IPsec implementation."
> >> HOMEPAGE =3D "http://ipsec-tools.sourceforge.net/"
> >> SECTION =3D "console/network"
> >> LICENSE =3D "BSD"
> >> +LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endli=
ne=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> >> +
> >> DEPENDS =3D "virtual/kernel openssl readline flex"
> >>=20
> >> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.=
bz2;name=3Dipsec-tools-${PV}"
> >> +SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ips=
ec-tools-${PV}.tar.bz2 \
> >> +           file://0001-Fix-warning-with-gcc-4.8.patch \
> >> +          "
> >> +SRC_URI[md5sum] =3D "d38b39f291ba2962387c3232e7335dd8"
> >> +SRC_URI[sha256sum] =3D "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc8=
30a881d63abe8153dd4"
> >>=20
> >> inherit autotools
> >>=20
> >> @@ -44,8 +50,3 @@ EXTRA_OECONF =3D "--with-kernel-headers=3D${STAGING_=
INCDIR} \
> >>=20
> >> # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D530527
> >> CFLAGS +=3D "-fno-strict-aliasing"
> >> -
> >> -# Sometimes it attempts to use y.tab.c before it is actually
> >> -# generated. Note that the failure case is very rare, but it does
> >> -# happen.
> >> -PARALLEL_MAKE =3D ""
> > --=20
> > -Joe MacDonald.
> > :wq
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlG7MyIACgkQPN8S4W6ZZndDywCfbsGHNQsxlVaaVzuKhKIDSTyB
eLcAn1BuU2cSTHoypKqmWyRrcPMBBp7M
=+MlO
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
