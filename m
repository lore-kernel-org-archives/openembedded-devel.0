Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id E24087F192
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 12:22:55 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>) id 1hoRua-00069l-Ch
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jul 2019 14:22:56 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>) id 1hoRua-0003Wq-2a
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jul 2019 14:22:56 +0200
References: <20190719115703.20858-1-alex.kiernan@gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <20190719115703.20858-1-alex.kiernan@gmail.com>
Date: Fri, 19 Jul 2019 14:22:56 +0200
Message-ID: <6rimry6wnz.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] zstd: New recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jul 2019 12:22:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Fri, Jul 19 2019 at 13:57 +0200, Alex Kiernan <alex.kiernan@gmail.com> w=
rote:
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta-oe/recipes-extended/zstd/zstd_1.4.0.bb | 50 +++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
>
> diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb b/meta-oe/recipe=
s-extended/zstd/zstd_1.4.0.bb
> new file mode 100644
> index 000000000000..823f7b5a53f6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "Zstandard - Fast real-time compression algorithm"
> +DESCRIPTION =3D "Zstandard is a fast lossless compression algorithm, tar=
geting \
> +real-time compression scenarios at zlib-level and better compression rat=
ios. \
> +It's backed by a very fast entropy stage, provided by Huff0 and FSE libr=
ary."
> +HOMEPAGE =3D "http://www.zstd.net/"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "BSD-3-Clause & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7f0b161edbe52f5f345a3d1311d0=
b32 \
> +                    file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f=
0"
> +
> +SRC_URI =3D "git://github.com/facebook/zstd.git;nobranch=3D1"
> +
> +SRCREV =3D "83b51e9f886be7c2a4d477b6e7bc6db831791d8d"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile () {
> +    oe_runmake
> +    oe_runmake -C programs zstd-compress zstd-decompress zstd-frugal
> +}
> +
> +do_install () {
> +    oe_runmake install 'DESTDIR=3D${D}'
> +    install -d -m 0755 ${D}${bindir}
> +    install -m 0755 ${S}/programs/zstd-compress ${D}${bindir}
> +    install -m 0755 ${S}/programs/zstd-decompress ${D}${bindir}
> +    install -m 0755 ${S}/programs/zstd-frugal ${D}${bindir}
> +}
> +
> +PACKAGE_BEFORE_PN +=3D " \
> +    ${PN}-compress \
> +    ${PN}-decompress \
> +    ${PN}-frugal \
> +"
> +
> +FILES_${PN}-compress =3D " \
> +    ${bindir}/zstd-compress \
> +"
> +
> +FILES_${PN}-decompress =3D " \
> +    ${bindir}/zstd-decompress \
> +"
> +
> +FILES_${PN}-frugal =3D " \
> +    ${bindir}/zstd-frugal \
> +"
> +
> +BBCLASSEXTEND =3D "native"

one of our customers needs zstd compression from the SDK as well, so
could you please enable the build of the nativesdk package, too:

  BBCLASSEXTEND =3D "native nativesdk"

Best regards
Ulrich
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

