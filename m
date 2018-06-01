Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4D474BC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:48:40 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id t12-v6so15641130plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 09:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=NM1et8C9vA9kCHm/uK2UJqis2dYhtD6ABAo6o1VFIAQ=;
	b=VHT/H2EODSCWYVxHfoj6HKUvTa1W+826G/EjQbaaHVka+P/kiXQXO5oCm4JKcH3eCD
	LeXutdd3Y0eZ/B31eKZsnrvL4aB1s2+q+5P/V+ANDtf2/gWxcb1vxlCTenOD0Y00CzyG
	Sb+LULka0iSDz2psspIo/TfHzky+VSoo6Vn7jSU3d7Gs44hkOTjLNbkIj0yZIFZShFbT
	AhLaAfUGsCjcARrVtb7yoxoD/L/YeFnloV3C4AeZh5sAiO/yxytaMBn8MgrlQMxiQUWn
	CZP+AChqYCuQrZWLVwWA4JLbPFhfcGuQO1uoR8VZLqMDR9jrmY2n5kW2wmxN3KBtkhIc
	8Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=NM1et8C9vA9kCHm/uK2UJqis2dYhtD6ABAo6o1VFIAQ=;
	b=O0ikWiIpkXMbP1OqCZEviMSifzlCAveuXtDIP1M5yr8MU7hpiWGVlWyB97ss4Bm9Gd
	w+aR3xcRs/F1MJ/hCwWVYTAZ5z/L7ERtSYNK2/buH2xs3aU1CYiVnWKer24K/reNI91I
	wOBlOYeFfNRrsZ4zg3XCTK7EByR3A8YGYX+SdokzDF95M+dfYBhGaAd+mWDIIoY8Bj9n
	BHQllsiPQ+bLmr+7XAAPqzvTm9o0Ht44Ue7Tok8zIfLdB4MOaL2g44+FtKmLM9vzqINm
	mcUMJU/Y5aAxxGBV9O+3YQ8Xzx4wdugb7Kj7yFHZdQCX7M6G8KGsOJQOxVbKC9VNvHg8
	0FXQ==
X-Gm-Message-State: ALKqPwfDQkniJjUjw28M+T6m4/C2giiwbGAIN2in+jc1uxldjV3bA5lK
	ptJyvc+3vIwHiTclv3Lq3PQ2kx5J
X-Google-Smtp-Source: ADUXVKJbN0s7eoxaLcgx/X+Sylg6EyFv2WfNnU4qaSx7SzpnkLlp2iq81ZT4PmGSqHxvmgn6RG2Itg==
X-Received: by 2002:a17:902:ac97:: with SMTP id
	h23-v6mr11857417plr.140.1527871720980; 
	Fri, 01 Jun 2018 09:48:40 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	q24-v6sm66923643pff.9.2018.06.01.09.48.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 09:48:40 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	openembedded-devel@lists.openembedded.org
References: <1527854794-22548-1-git-send-email-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f037c80f-2b51-48a8-9846-1ef1c8217396@gmail.com>
Date: Fri, 1 Jun 2018 09:48:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1527854794-22548-1-git-send-email-krzk@kernel.org>
Subject: Re: [meta-oe][PATCH] lshw: Add new recipe with B.02.18 version
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
X-List-Received-Date: Fri, 01 Jun 2018 16:48:40 -0000
X-Groupsio-MsgNum: 72565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Dy8WD3gjuakzAE4So5ZawUXxhKhO2TlMc"

--Dy8WD3gjuakzAE4So5ZawUXxhKhO2TlMc
Content-Type: multipart/mixed; boundary="VB8IaNm8Ux1zeqJNZWa1y1GV4qbCBBA37";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 openembedded-devel@lists.openembedded.org
Message-ID: <f037c80f-2b51-48a8-9846-1ef1c8217396@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lshw: Add new recipe with B.02.18 version
References: <1527854794-22548-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1527854794-22548-1-git-send-email-krzk@kernel.org>

--VB8IaNm8Ux1zeqJNZWa1y1GV4qbCBBA37
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof

On 6/1/18 5:06 AM, Krzysztof Kozlowski wrote:
> Add new recipe for lshw B.02.18 version - a small tool to provide
> detailed information on the hardware configuration of the machine.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> ---
>=20
> The recipe is based on existing meta-linaro:
> https://layers.openembedded.org/layerindex/recipe/5446/
>=20
> with changes:
> 1. Bump to 02.18,
> 2. Fix QA issue with GNU_HASH,
> 3. Minor recipe styling fixes.
> ---
>  ...e-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch | 33 ++++++++++++++=
++++
>  .../lshw/files/cross-compile.patch                 | 39 ++++++++++++++=
++++++++
>  meta-oe/recipes-devtools/lshw/lshw_02.18.bb        | 37 ++++++++++++++=
++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Makefile-U=
se-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
>  create mode 100644 meta-oe/recipes-devtools/lshw/files/cross-compile.p=
atch
>  create mode 100644 meta-oe/recipes-devtools/lshw/lshw_02.18.bb
>=20
> diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supp=
lied-LDFLAGS-to-silence-OE-GNU_HASH.patch b/meta-oe/recipes-devtools/lshw=
/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
> new file mode 100644
> index 000000000000..627619fd137f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LD=
FLAGS-to-silence-OE-GNU_HASH.patch
> @@ -0,0 +1,33 @@
> +From 2f69ba75608619ba7fc962b1a0338682b644a406 Mon Sep 17 00:00:00 2001=

> +From: Krzysztof Kozlowski <krzysztof.kozlowski@proceq.com>
> +Date: Thu, 31 May 2018 16:22:23 +0200
> +Subject: [PATCH] Makefile: Use supplied LDFLAGS to silence OE GNU_HASH=
 QA
> + warning
> +
> +Fix OpenEmbedded/Yocto QA warning:
> +
> +    ERROR: lshw-02.16-r1 do_package_qa: QA Issue: No GNU_HASH in the e=
lf binary: 'build/tmp/work/cortexa5hf-neon-poky-linux-gnueabi/lshw/02.16-=
r1/packages-split/lshw/usr/sbin/lshw' [ldflags]
> +    ERROR: lshw-02.16-r1 do_package_qa: QA run found fatal errors. Ple=
ase consider fixing them.
> +    ERROR: lshw-02.16-r1 do_package_qa: Function failed: do_package_qa=

> +
> +Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@proceq.com>
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index f474ff9d56b3..dd7a2a400be2 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -25,7 +25,7 @@ CXXFLAGS=3D-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_=
OPT_FLAGS)
> + ifeq ($(SQLITE), 1)
> + 	CXXFLAGS+=3D -DSQLITE $(shell pkg-config --cflags sqlite3)
> + endif
> +-LDFLAGS=3D-L./core/ -g
> ++LDFLAGS+=3D-L./core/ -g
> + ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
> + 	LDFLAGS+=3D -Wl,--as-needed
> + endif
> +--=20
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/lshw/files/cross-compile.patch b/=
meta-oe/recipes-devtools/lshw/files/cross-compile.patch
> new file mode 100644
> index 000000000000..221b7e538c00
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/files/cross-compile.patch
> @@ -0,0 +1,39 @@
> +---
> + src/Makefile      |    2 +-
> + src/core/Makefile |    2 +-
> + src/gui/Makefile  |    4 ++--
> + 3 files changed, 4 insertions(+), 4 deletions(-)
> +
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -18,7 +18,7 @@ export MANDIR
> + export DATADIR
> + export SQLITE
> +=20
> +-CXX?=3Dc++
> ++CXX?=3D$(CROSS_COMPILE)c++
> + INCLUDES=3D-I./core/
> + DEFINES=3D-DPREFIX=3D\"$(PREFIX)\" -DSBINDIR=3D\"$(SBINDIR)\" -DMANDI=
R=3D\"$(MANDIR)\" -DDATADIR=3D\"$(DATADIR)\"
> + CXXFLAGS=3D-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
> +--- a/src/core/Makefile
> ++++ b/src/core/Makefile
> +@@ -1,6 +1,6 @@
> + PACKAGENAME?=3Dlshw
> +=20
> +-CXX=3Dc++
> ++CXX?=3D$(CROSS_COMPILE)c++
> + INCLUDES=3D
> + DEFINES=3D-DPREFIX=3D\"$(PREFIX)\" -DSBINDIR=3D\"$(SBINDIR)\" -DMANDI=
R=3D\"$(MANDIR)\" -DDATADIR=3D\"$(DATADIR)\"
> + CXXFLAGS?=3D-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
> +--- a/src/gui/Makefile
> ++++ b/src/gui/Makefile
> +@@ -1,7 +1,7 @@
> + PACKAGENAME?=3Dlshw
> +=20
> +-CXX?=3Dc++
> +-CC?=3Dcc
> ++CXX?=3D$(CROSS_COMPILE)c++
> ++CC?=3D$(CROSS_COMPILE)cc
> + STRIP?=3Dstrip
> + OBJCOPY?=3Dobjcopy
> +=20
> diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb b/meta-oe/reci=
pes-devtools/lshw/lshw_02.18.bb
> new file mode 100644
> index 000000000000..aac6707fcea4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION =3D "A small tool to provide detailed information on the h=
ardware \
> +configuration of the machine. It can report exact memory configuration=
, \
> +firmware version, mainboard configuration, CPU version and speed, cach=
e \
> +configuration, bus speed, etc. on DMI-capable or EFI systems."
> +SUMMARY =3D "Hardware lister"
> +HOMEPAGE =3D "http://ezix.org/project/wiki/HardwareLiSter"
> +SECTION =3D "console/tools"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> +
> +DEPENDS =3D " \
> +    pciutils \
> +    usbutils \
> +"
> +COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
> +
> +SRC_URI =3D " \
> +    http://ezix.org/software/files/lshw-B.${PV}.tar.gz \
> +    file://cross-compile.patch \
> +    file://0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.p=
atch \
> +"
> +SRC_URI[md5sum] =3D "8671c6d94d6324a744b7f21f1bfecfd2"
> +SRC_URI[sha256sum] =3D "ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979=
da280d342a89ca3c2f"
> +
> +S =3D "${WORKDIR}/lshw-B.${PV}"
> +
> +do_compile() {
> +    # build core only - don't ship gui
> +    oe_runmake -C src core
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +    # data files provided by dependencies
> +    rm -rf ${D}/usr/share/lshw

who should be providing these files ?
should these packages be in rrecommends for this to work effectively ?

> +}
>=20



--VB8IaNm8Ux1zeqJNZWa1y1GV4qbCBBA37--

--Dy8WD3gjuakzAE4So5ZawUXxhKhO2TlMc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxF44gAKCRC7BTNVkZ0z
FNzzAJ4uWYVX0IZ12ENcYamMe7hA4p9kgACgg4ckZI6jDqZr5hIgoUBGQAvurX4=
=75b6
-----END PGP SIGNATURE-----

--Dy8WD3gjuakzAE4So5ZawUXxhKhO2TlMc--
