Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S2V5U-0006ah-Ki for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 23:00:00 +0100
Received: from f053036183.adsl.alicedsl.de ([78.53.36.183]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S2UxO-0003Sc-7H; Tue, 28 Feb 2012 21:51:38 +0000
Message-ID: <1330465883.14757.3.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 22:51:23 +0100
In-Reply-To: <1330464996-24176-2-git-send-email-Chase.Maupin@ti.com>
References: <1330464996-24176-1-git-send-email-Chase.Maupin@ti.com>
	<1330464996-24176-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [meta-oe][PATCH 1/1] nbench-byte: import recipe for oe-classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 22:00:00 -0000
X-Groupsio-MsgNum: 37543
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-FRIYgTBe2C4sBbGfD2M6"

--=-FRIYgTBe2C4sBbGfD2M6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase,


thank you for your patch.


Am Dienstag, den 28.02.2012, 15:36 -0600 schrieb Chase Maupin:

Please add the version number to the commit summary.

Also s/for/from/.

    nbench-byte: Add 2.2.3 (initial version)

> * Import the nbench-byte recipe from the oe-classic git repo at
>   git://git.openembedded.org/openembedded commit id:
>     * 6fe7cef27069415f2eba36bc640cf59013d4979b
> * Update LICENSE checksums
> * Original Author:
>     * Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> * Modifications by:
>     * Koen Kooi <koen@openembedded.org>
>     * Martin Jansa <Martin.Jansa@gmail.com>
>     * Chris Larson <chris_larson@mentor.com>

Information on how you tested it would be nice.

> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../nbench-byte/nbench-byte/nbench_32bits.patch    |   46 ++++++++++++++=
++++++
>  .../nbench-byte/nbench-byte_2.2.3.bb               |   26 +++++++++++
>  2 files changed, 72 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbe=
nch_32bits.patch
>  create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2=
.3.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32b=
its.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits=
.patch
> new file mode 100644
> index 0000000..1b8a4dc
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.pat=
ch
> @@ -0,0 +1,46 @@
> +From 81f4043a6787060029ef20eed21cdcf3e50337df Mon Sep 17 00:00:00 2001
> +From: Chase Maupin <Chase.Maupin@ti.com>
> +Date: Tue, 28 Feb 2012 14:58:35 -0600
> +Subject: [PATCH] nbench: modify Makefile for 32bit
> +
> +* Patch taken from OE classic git repository as of commit id
> +  ad42bf9065928b2902d7d9534709d3ccea7ec956 and was added by:
> +    * Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> +* Notes from original patch were:
> +
> +BYTE Magazine's native benchmarks (also called BYTEmark) designed to
> +expose the capabilities of a system's CPU, FPU and memory system.
> +
> +http://www.tux.org/~mayer/linux/
> +
> +Recipe from old Atmel overlay.
> +
> +Upstream-Status: Inappropriate [no upstream]
> +
> +Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> +---
> + Makefile |    8 ++------
> + 1 files changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 5045c77..915866d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -119,12 +119,8 @@ emfloat.o: emfloat.h emfloat.c nmglobal.h pointer.h=
 Makefile
> + 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
> + 		-c emfloat.c
> +=20
> +-pointer.h: pointer Makefile
> +-	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
> +-		-o pointer pointer.c
> +-	rm -f pointer.h
> +-	if [ "4" =3D `./pointer` ] ; then touch pointer.h ;\
> +-	else echo "#define LONG64" >pointer.h ; fi
> ++pointer.h: Makefile
> ++	touch pointer.h ;
> +=20
> + misc.o: misc.h misc.c Makefile
> + 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
> +--=20
> +1.7.0.4
> +
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b=
/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> new file mode 100644
> index 0000000..9a002de
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "BYTE Magazine's native benchmarks (also called BYTEmark=
) \
> +designed to expose the capabilities of a system's CPU, FPU, \
> +and memory system."
> +HOMEPAGE =3D "http://www.tux.org/~mayer/linux/"
> +LICENSE =3D "freely distributable"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D57;endline=3D66;md5=3D02=
0ef579f8fa5746b7e307a54707834f"
> +SECTION =3D "console/utils"
> +
> +SRC_URI =3D "http://www.tux.org/~mayer/linux/${PN}-${PV}.tar.gz \
> +           file://nbench_32bits.patch"
> +
> +PR =3D "r1"

Please start with `r0` or to please Koen remove that line entirely.

> +
> +TARGET_CC_ARCH +=3D "${CFLAGS} ${LDFLAGS}"
> +do_compile() {
> +	oe_runmake
> +}
> +
> +do_install () {
> +	install -d ${D}${bindir}
> +	install -m 0644 NNET.DAT ${D}${bindir}/
> +	install -m 0755 nbench ${D}${bindir}/
> +}
> +
> +SRC_URI[md5sum] =3D "285dfab361080759d477ea1fe7d3093a"
> +SRC_URI[sha256sum] =3D "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac=
488d8f5aed9101ac"


Thanks,

Paul

--=-FRIYgTBe2C4sBbGfD2M6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk9NTFsACgkQPX1aK2wOHVj8fQCdHF7CZKsi0bk8np9r9v24UDSS
Q+UAn1yPNggCXTz99xsf/he89ejY7hlf
=Zrut
-----END PGP SIGNATURE-----

--=-FRIYgTBe2C4sBbGfD2M6--
