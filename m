Return-Path: <joe@deserted.net>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 10C84607FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:10:06 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id h18so1222657igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 19:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=+oPahsA+QqTntmk3EhpZnNlBsb2Ds1a/FaE5mqdYrjw=;
	b=lJjZRcC9FKLyD52U3II+Qx3n16FcuFka8fxdAB4kQahRUdGnAdYplhR6LD6kknMzFz
	nZ+kglePpmaecHZR02ZmRZxhf/6QE+rQUy3CANrwlKog/tey9UaXdk3E/HTYhMzW1wX4
	7y8mgKmeXY1yHfaBl/iR9m1baaJKaH979ib1QUSCJRu2Lzqgoe6gWLyfhE4qa9056iDJ
	f6vQYGOM5dqe4INvx/UtKH5MmTFUtrPzlaf0TGbfGHlJYUhL+OVHDf8KvaTjD/WR7FnZ
	rmxm2FLNenU5JWgrDRTAflgfCSw7nZuI388omBcFxJy4ihsVwd/OOYu5q52gCe86t+sD
	mytQ==
X-Gm-Message-State: ALoCoQm6o/g6NkHn/QivHkTLf7gTsUTkNVer0GwoJiRgCItiK8mIF4GQvLkO8lMKX3Xl9Nju+tVI
X-Received: by 10.42.107.68 with SMTP id c4mr4402193icp.60.1403662207686;
	Tue, 24 Jun 2014 19:10:07 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id p12sm2575774igx.18.2014.06.24.19.10.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 19:10:06 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 90844168543; Tue, 24 Jun 2014 22:10:05 -0400 (EDT)
Date: Tue, 24 Jun 2014 22:10:05 -0400
From: Joe MacDonald <joe@deserted.net>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140625021001.GC31512@deserted.net>
References: <1402596658-17371-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1402596658-17371-1-git-send-email-fcooper@ti.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ptpd: update to 2.3.0
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
X-List-Received-Date: Wed, 25 Jun 2014 02:10:13 -0000
X-Groupsio-MsgNum: 50564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline

--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] ptpd: update to 2.3.0] On 14.06.12 (Thu 13:1=
0) Franklin S. Cooper Jr wrote:

> ---
>  .../ptpd/ptpd-2.2.0/ld-as-needed.patch             |   37 --------------=
------
>  .../ptpd/{ptpd_2.2.0.bb =3D> ptpd_2.3.0.bb}          |   21 ++++++-----
>  2 files changed, 11 insertions(+), 47 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as=
-needed.patch
>  rename meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb =3D> ptpd_2.3=
=2E0.bb} (57%)

I merged a version of this.  My changes are:

   - changed do_install to (hopefully) play nice with B!=3DS

   - explicitly disabled net-snmp support since it was not called out as
     a dependency in the recipe, it wasn't immediately obvious to me how
     to safely update the recipe to find the proper net-snmp support,
     and ntp already sets that precedent

   - removed setting of PR

Please also be sure to add a SOB line for any patches you send in the
future.

-J.

>=20
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed=
=2Epatch b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.pat=
ch
> deleted file mode 100644
> index 7d5251b..0000000
> --- a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Patch from http://patch-tracker.debian.org/package/ptpd
> -
> -Description: Fix ld --as-needed
> - This patch fixes the order of gcc arguments to fix ld --as-needed
> -Author: Roland Stigge <stigge@antcom.de>
> -Bug-Debian: http://bugs.debian.org/607583
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - src/Makefile |    4 ++--
> - 1 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index a672625..88a2fc8 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -40,7 +40,7 @@ CFLAGS +=3D -DDBG_SIGUSR2_CHANGE_DEBUG
> -=20
> - CFLAGS +=3D -DPTP_EXPERIMENTAL
> -=20
> --LDFLAGS+=3D -lm -lrt
> -+LIBS +=3D -lm -lrt
> -=20
> - PROG =3D ptpd
> - SRCS =3D ptpd.c arith.c bmc.c protocol.c display.c\
> -@@ -63,7 +63,7 @@ TAGFILES =3D GPATH GRTAGS GSYMS GTAGS cscope.in.out cs=
cope.out cscope.po.out
> - all: $(PROG)
> -=20
> - $(PROG): $(OBJS)
> --	$(CC) -o $@ $(OBJS) $(LDFLAGS)
> -+	$(CC) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
> -=20
> - $(OBJS): $(HDRS)
> -=20
> ---=20
> -1.7.4
> -
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb b/meta-ne=
tworking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> similarity index 57%
> rename from meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> rename to meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> index f2e895d..1febbb1 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> @@ -6,23 +6,24 @@ time coordination of LAN connected computers."
>  HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
>  SECTION =3D "network"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://../COPYRIGHT;md5=3D3d8ac2c46c116bce2d2ad838=
b6cf3491"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D4019cad2b3cd55f22ea819ffad6=
ccd41"
> =20
> -PR =3D "r1"
> +DEPENDS =3D "libpcap"
> =20
> -SRC_URI =3D "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/pt=
pd-${PV}.tar.gz \
> -           file://ld-as-needed.patch;striplevel=3D2 \
> -"
> +PR =3D "r0"
> =20
> -SRC_URI[md5sum] =3D "c63a3a149d30c710773ccb02df5782a3"
> -SRC_URI[sha256sum] =3D "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9=
643fa675a07c26b4"
> +inherit autotools
> =20
> -S =3D "${WORKDIR}/ptpd-${PV}/src"
> +SRC_URI =3D "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/pt=
pd-${PV}.tar.gz"
> +
> +S =3D "${WORKDIR}/ptpd-${PV}"
> +SRC_URI[md5sum] =3D "f5e931b4a229705ff0dbdfe22490566b"
> +SRC_URI[sha256sum] =3D "1a4e90496f004bfd91657ccc49209101dc25b787e540648c=
07c0973469f1d8f7"
> =20
>  EXTRA_OEMAKE =3D ""
> =20
>  do_install() {
>      install -d ${D}${bindir} ${D}${mandir}/man8
> -    install -m 0755 ptpd2 ${D}${bindir}
> -    install -m 0644 ptpd2.8 ${D}${mandir}/man8
> +    install -m 0755 ${S}/src/ptpd2 ${D}${bindir}
> +    install -m 0644 ${S}/src/ptpd2.8 ${D}${mandir}/man8
>  }
> --=20
> 1.7.0.4
>=20
--=20
-Joe MacDonald.
:wq

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlOqL3kACgkQwFvcllog0XwKlgCfcGtKagGJHbJmzyHqgKuGukeC
tXwAnRCogvuMEq5w+IG0dznwq7ms6Byt
=NWw6
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
