Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9C02165D00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:41:06 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2888381eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UElg9cdTHdNqsVMc+YJ3JfDWqOEw9t56YxYxzMkxgXQ=;
	b=jFAefNKv9V/f+b78NRKFUyf5pOAlCMHouKWjn2sc/anzCd0Xi100+7S3jxCbhtzNci
	3gfLIMb4bSnQY++a6iJ8Gkl3JTV8v93UrZeclJyfga39PCc7oKd42Rn6wROzzyj3FQw7
	Q0uNMJeu0Gfw/pnd+Ofif2ePij+W7g3DxZU/rnnDX8OvJXP6BfOFF6YZ5MTtbHJzWkXa
	hv/IDO4sBYLyXcFNQu9s+cMRJaJVdWK8/XSWNZd4bJZZ9D7wTm03oxPlcw0K68hQ9QqK
	43zEP4XkoqnpeE+VNMR817CiCI7slKytkjmzBjt6iZLc5dhwul4v7CvQfMCsq3O/Zjdf
	42iA==
X-Received: by 10.15.64.75 with SMTP id n51mr37799831eex.33.1397986867410;
	Sun, 20 Apr 2014 02:41:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm93095194eex.31.2014.04.20.02.41.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:41:06 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:41:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420094111.GJ2486@jama>
References: <1397210212-26263-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397210212-26263-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] iozone: update version to 414
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
X-List-Received-Date: Sun, 20 Apr 2014 09:41:12 -0000
X-Groupsio-MsgNum: 49317
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7UxcOAJ07vnNm5/N"
Content-Disposition: inline

--7UxcOAJ07vnNm5/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 05:56:52PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - use BPN to fix multilib builds
> - drop the fileop-arm.patch since the issue is already
>   fixed in the new version.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../iozone3/iozone3/fileop-arm.patch               |   32 ------------
>  .../iozone3/{iozone3_263.bb =3D> iozone3_414.bb}     |   51 +++++++++++-=
--------
>  2 files changed, 27 insertions(+), 56 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.=
patch
>  rename meta-oe/recipes-benchmark/iozone3/{iozone3_263.bb =3D> iozone3_41=
4.bb} (63%)
>=20
> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch b=
/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
> deleted file mode 100644
> index c71bfee..0000000
> --- a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Modify makefile to compile fileop.c file for ARM architecture.
> -
> -Upstream-Status: Inappropriate [not author]
> -Index: current/makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- current.orig/makefile	2006-10-14 21:42:36.000000000 +0200
> -+++ current/makefile	2006-10-14 21:40:02.000000000 +0200
> -@@ -190,9 +190,10 @@
> - #
> - # GNU 'C' compiler Linux build with threads, largefiles, async I/O
> - #
> --linux-arm:	iozone_linux-arm.o  libbif.o libasync.o
> -+linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o
> - 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
> - 		-lrt -lpthread -o iozone
> -+	$(CC)  -O3 -Dlinux fileop_linux-arm.o -o fileop
> -=20
> - #
> - # GNU 'C' compiler Linux build with threads, largefiles, async I/O=20
> -@@ -725,6 +726,12 @@
> - 	@echo ""
> - 	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-AMD64.o
> -=20
> -+fileop_linux-arm.o:	fileop.c
> -+	@echo ""
> -+	@echo "Building fileop for Linux-arm"
> -+	@echo ""
> -+	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-arm.o
> -+
> - fileop_windows.o: fileop.c
> - 	@echo ""
> - 	@echo "Building fileop for Windows"
> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb b/meta-oe/r=
ecipes-benchmark/iozone3/iozone3_414.bb
> similarity index 63%
> rename from meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
> rename to meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
> index 9de0ac7..572d766 100644
> --- a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
> +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
> @@ -3,46 +3,49 @@ HOMEPAGE =3D "http://www.iozone.org/"
>  AUTHOR =3D "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnor=
cott@us.oracle.com>"
>  SECTION =3D "console/tests"
>  LICENSE =3D "iozone3"
> -LIC_FILES_CHKSUM =3D "file://iozone.c;beginline=3D237;endline=3D241;md5=
=3Dab42a6185fd0443978871f11a007ac0b"
> +LIC_FILES_CHKSUM =3D "file://iozone.c;beginline=3D266;endline=3D270;md5=
=3Dab42a6185fd0443978871f11a007ac0b"
> =20
> -
> -SRC_URI =3D "http://www.iozone.org/src/current/iozone3_263.tar \
> +SRC_URI =3D "http://fossies.org/unix/privat/${BPN}_${PV}.tar.gz \

$ wget http://fossies.org/unix/privat/iozone3_414.tar.gz
--2014-04-20 09:40:22--
http://fossies.org/unix/privat/iozone3_414.tar.gz
Resolving fossies.org (fossies.org)... 78.46.58.28
Connecting to fossies.org (fossies.org)|78.46.58.28|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2014-04-20 09:40:23 ERROR 404: Not Found.


>      file://copyright.txt \
> -    file://fileop-arm.patch \
>  "
> -SRC_URI[md5sum] =3D "44fd88df361ec4508e10c8d6615245fa"
> -SRC_URI[sha256sum] =3D "920fde1a3843539570e2df4aa611e74df102e52d363c5973=
d5a9d15bdf976461"
> +SRC_URI[md5sum] =3D "85a3e292f84580a36e6c99762a459dd6"
> +SRC_URI[sha256sum] =3D "f6c2fde4bfaef1ff8aaf99a315737a846886aa54751a6d93=
09e14fbec0cbe7a9"
> =20
> -S =3D "${WORKDIR}/${PN}_${PV}/src/current/"
> +S =3D "${WORKDIR}/${BPN}_${PV}/src/current/"
> =20
> -EXTRA_OEMAKE_powerpc =3D "linux-powerpc CC=3D'${CC}'"
> -EXTRA_OEMAKE_powerpc64 =3D "linux-powerpc64 CC=3D'${CC}'"
> -EXTRA_OEMAKE_arm =3D "linux-arm CC=3D'${CC}'"
> -EXTRA_OEMAKE =3D "linux CC=3D'${CC}'"
> +#
> +# All other arches can use the default OEMAKE except those
> +# explicitly listed below. Another, the iozone3 Makefile
> +# needs to be told about the cross-compiler explicitly here.
> +#
> +EXTRA_OEMAKE_powerpc =3D "linux-powerpc CC=3D'${CC}' GCC=3D'${CC}'"
> +EXTRA_OEMAKE_powerpc64 =3D "linux-powerpc64 CC=3D'${CC}' GCC=3D'${CC}'"
> +EXTRA_OEMAKE_arm =3D "linux-arm CC=3D'${CC}' GCC=3D'${CC}'"
> +EXTRA_OEMAKE =3D "linux CC=3D'${CC}' GCC=3D'${CC}'"
> =20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> =20
>  do_install() {
>      install -d ${D}${bindir} \
> -        ${D}${mandir}/man1 \
> -    ${D}${datadir}/doc/${PN}/examples
> +               ${D}${mandir}/man1 \
> +               ${D}${datadir}/doc/${BPN}/examples
> =20
>      install -m 0755 ${S}/iozone ${D}${bindir}
>      install -m 0755 ${S}/fileop ${D}${bindir}
> -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/iozone.1 ${D}${mandir}/m=
an1/
> -    install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${PN}/
> +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/iozone.1 ${D}${mandir}/=
man1/
> +    install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${BPN}/
> =20
> -    install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${PN}/examples
> -    install -m 0644 ${S}/client_list ${D}${datadir}/doc/${PN}/examples
> -    install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${PN}/examples
> +    install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${BPN}/examples
> +    install -m 0644 ${S}/client_list ${D}${datadir}/doc/${BPN}/examples
> +    install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${BPN}/examples
> =20
> -    install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${PN}/exampl=
es
> -    install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${PN}/examples
> -    install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${PN}/examples
> +    install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${BPN}/examp=
les
> +    install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${BPN}/examples
> +    install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${BPN}/examples
> =20
> -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Iozone_ps.gz ${D}${datad=
ir}/doc/${PN}/
> -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/IOzone_msword_98.pdf ${D=
}${datadir}/doc/${PN}/
> -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Run_rules.doc ${D}${data=
dir}/doc/${PN}/
> +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Iozone_ps.gz ${D}${data=
dir}/doc/${BPN}/
> +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/IOzone_msword_98.pdf ${=
D}${datadir}/doc/${BPN}/
> +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Run_rules.doc ${D}${dat=
adir}/doc/${BPN}/
>  }
> =20
>  FILES_${PN} +=3D "${datadir}/doc/${PN}/copyright.txt"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7UxcOAJ07vnNm5/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTljcACgkQN1Ujt2V2gByufACcCSCZlXe10b7gnpv6iAf7xwBk
GU4Anih+DLF7K+AZm/bnPGWtmBrtBiZ5
=Ti00
-----END PGP SIGNATURE-----

--7UxcOAJ07vnNm5/N--
