Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 2F89C601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:59:10 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s398x4uG015159;
	Wed, 9 Apr 2014 10:59:10 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Wed, 9 Apr 2014 10:59:04 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "trevor.woerner@linaro.org" <trevor.woerner@linaro.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "koen.kooi@linaro.org"
	<koen.kooi@linaro.org>, Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] checksums for multiple sources
Thread-Index: AQHPU9EGEFktRuLxFkOL7u5OeACqg5sI+ypo
Date: Wed, 9 Apr 2014 08:59:03 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3B0B78@post.tritech.se>
References: <53450A23.3060107@linaro.org>
In-Reply-To: <53450A23.3060107@linaro.org>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: Re: checksums for multiple sources
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
X-List-Received-Date: Wed, 09 Apr 2014 08:59:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
Just copy-pasted from a recipe of mine:=0A=
=0A=
SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.xz;name=
=3Dkernel \=0A=
           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.${STABLEV}.xz;=
apply=3Dyes;name=3Dstablepatch \=0A=
=0A=
           file://defconfig \=0A=
          "=0A=
=0A=
SRC_URI[kernel.md5sum] =3D "cc6ee608854e0da4b64f6c1ff8b6398c"=0A=
SRC_URI[kernel.sha256sum] =3D "2e120ec7fde19fa51dc6b6cc11c81860a0775defcad5=
a5bf910ed9a50e845a02"=0A=
SRC_URI[stablepatch.md5sum] =3D "3c5fa1eaa0fb0c124d2a2fd074041da1"=0A=
SRC_URI[stablepatch.sha256sum] =3D "4354db5c8ae783ccc0c522835206a3480b99129=
e95a720272f6f057fae35f453"=0A=
=0A=
I.e. use "name=3Dxxx" and "xxxx.md5sum"=0A=
=0A=
BR // Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Trevor Woerner [trevor.woerne=
r@linaro.org]=0A=
Sent: Wednesday, April 09, 2014 10:51 AM=0A=
To: openembeded-devel; koen.kooi@linaro.org; Martin Jansa=0A=
Subject: [oe] checksums for multiple sources=0A=
=0A=
Is there any way to specify for which source tarball a particular=0A=
checksum is referring?=0A=
=0A=
meta-openembedded/meta-oe/recipes-extended/acpica/acpitests_20140114.bb=0A=
has 2 source tarballs (and a patch):=0A=
=0A=
    SRC_URI =3D=0A=
    "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz \=0A=
=0A=
    https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \=0A=
               file://0001-Fixup-aapits-build.patch \=0A=
        "=0A=
=0A=
but only one set of checksums:=0A=
=0A=
    SRC_URI[md5sum] =3D "c72b61e092d2b25726dfff6e455116c9"=0A=
    SRC_URI[sha256sum] =3D=0A=
    "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba782f8ecf03971a3a2c"=0A=
=0A=
=0A=
My build fails because it tries to verify the one checksum against both=0A=
source tarballs, which fails:=0A=
=0A=
    File: '/home/trevor/devel/Downloads/acpica-unix2-20140114.tar.gz'=0A=
    has md5 checksum fcd4b7304f1bfabc7d4b9cfdecc6b0c6 when=0A=
    c72b61e092d2b25726dfff6e455116c9 was expected=0A=
=0A=
NOTE: this checksum is correct for the first tarball=0A=
(acpitests-unix-${PV}.tar.gz), but not the second=0A=
(acpica-unix2-${PV}.tar.gz).=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

