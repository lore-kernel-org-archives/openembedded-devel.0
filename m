Return-Path: <joe@deserted.net>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 909D46D586
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 20:26:18 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id at1so12325713iec.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Xh+3COe3WOUYppZe21yxBftE/K3RoAfm8USOYGos/vs=;
	b=RHqnqIDwt1agK/xq8w2lznn+f/Kxv2e4EaeWIOxZAxpLoI/m2FMzQmxGU6H87nW2mc
	8S79IM+kFXZvF0PmIfbzqpg8RzsP22Qy3LIF3mdkoPBGCQHCO86MdDgoVIPJduWoN6N9
	x3YwGqHxLn7UpGZeEf3wJIWGrworYqX5z1f1isUMFJu76XiByLj1UUmXRVPGdNq8QJvY
	MXsjvdL1LBpt7Ec2yVYwJig6/wp1Cp+5j69auqIPwALgkxjhSCck+Sg+IiXAC8WvS7Ga
	NzexQ9ohV2qPzfdgNaFCUQARCw/MUHblHPSvo9H3dYupwe8oEq3Q/DAC7xB9zyRWgVH6
	tJbQ==
X-Gm-Message-State: ALoCoQlDQ0oltJALyWtAd0W/Mpa/pApJIW3Tl12UVtgfIzfwYOuspkFLzQem6r4JT5ewUESi62gj
X-Received: by 10.51.17.71 with SMTP id gc7mr4254167igd.55.1385583978037;
	Wed, 27 Nov 2013 12:26:18 -0800 (PST)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	x5sm40833577iga.6.2013.11.27.12.26.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 12:26:17 -0800 (PST)
Date: Wed, 27 Nov 2013 15:26:14 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131127202612.GB4355@deserted.net>
References: <1385004460-3166-1-git-send-email-rongqing.li@windriver.com>
	<5295AA14.6080105@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5295AA14.6080105@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] quagga: Backport a patch to fix extract.pl for cross compilation
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
X-List-Received-Date: Wed, 27 Nov 2013 20:26:19 -0000
X-Groupsio-MsgNum: 47285
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH] quagga: Backport a patch to fix extract.pl for cross comp=
ilation] On 13.11.27 (Wed 16:15) Rongqing Li wrote:

> Hi Joe:
>=20
> Welcome you back oe-devel, This patch needs to merge too.

I must've missed this when I was doing a scan of my mail backlog since
it wasn't tagged meta-networking.  There's a much higher miss-rate on
those.  :-)

Merged now.

-J.

> Thanks
>=20
> -Roy
>=20
>=20
>=20
> On 11/21/2013 11:27 AM, rongqing.li@windriver.com wrote:
> >From: Roy Li <rongqing.li@windriver.com>
> >
> >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >---
> >  ...uild-fix-extract.pl-for-cross-compilation.patch |   31 ++++++++++++=
++++++++
> >  .../recipes-protocols/quagga/quagga_0.99.21.bb     |    4 ++-
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-networking/recipes-protocols/quagga/files/buil=
d-fix-extract.pl-for-cross-compilation.patch
> >
> >diff --git a/meta-networking/recipes-protocols/quagga/files/build-fix-ex=
tract.pl-for-cross-compilation.patch b/meta-networking/recipes-protocols/qu=
agga/files/build-fix-extract.pl-for-cross-compilation.patch
> >new file mode 100644
> >index 0000000..e3ccc2a
> >--- /dev/null
> >+++ b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.p=
l-for-cross-compilation.patch
> >@@ -0,0 +1,31 @@
> >+Upstream-Status: Backport
> >+
> >+From ed6e297972318a0070ad4d973401fbc6e0def558 Mon Sep 17 00:00:00 2001
> >+From: Serj Kalichev <serj.kalichev@gmail.com>
> >+Date: Fri, 7 Sep 2012 13:29:42 +0400
> >+Subject: [PATCH] build: fix extract.pl for cross compilation
> >+
> >+extract.pl should invoke the C preprocessor for the target system, not =
the
> >+host.
> >+
> >+* vtysh/extract.pl.in: use @CPP@ to get target cpp
> >+---
> >+ vtysh/extract.pl.in |    2 +-
> >+ 1 files changed, 1 insertions(+), 1 deletions(-)
> >+
> >+diff --git a/vtysh/extract.pl.in b/vtysh/extract.pl.in
> >+index 7612aff..4c3a47f 100755
> >+--- a/vtysh/extract.pl.in
> >++++ b/vtysh/extract.pl.in
> >+@@ -63,7 +63,7 @@ $ignore{'"show history"'} =3D "ignore";
> >+ foreach (@ARGV) {
> >+     $file =3D $_;
> >+
> >+-    open (FH, "cpp -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@t=
op_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/is=
isd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
> >++    open (FH, "@cpp@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I=
@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/=
isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
> >+     local $/; undef $/;
> >+     $line =3D <FH>;
> >+     close (FH);
> >+--
> >+1.7.1
> >+
> >diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb =
b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> >index 10740bc..ae93952 100644
> >--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> >+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> >@@ -3,7 +3,9 @@ require quagga.inc
> >  PR =3D "${INC_PR}.0"
> >
> >  SRC_URI +=3D "file://0001-doc-fix-makeinfo-errors-and-one-warning.patc=
h \
> >-            file://lingering-IP-address-after-deletion-BZ-486.patch"
> >+            file://lingering-IP-address-after-deletion-BZ-486.patch \
> >+            file://build-fix-extract.pl-for-cross-compilation.patch \
> >+"
> >
> >  SRC_URI[quagga-0.99.21.md5sum] =3D "99840adbe57047c90dfba6b6ed9aec7f"
> >  SRC_URI[quagga-0.99.21.sha256sum] =3D "9b8aea9026b4771a28e254a66cbd854=
723bcd0d71eebd0201d11838d4eb392ee"
> >
>=20
--=20
-Joe MacDonald.
:wq

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKWVWQACgkQwFvcllog0XzxNwCeKwUMMwLrwNP9c2uGGCg/ZZx/
Mf0AoLKQ+6lTSN0F69pgpFcYB4bVHzTS
=GfdK
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
