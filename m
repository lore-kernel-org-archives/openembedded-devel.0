Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D4A5A71C3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:29:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m83so1149497wmc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NDxrHd+2Kszkc2CMDiIMDX5O09ROMO8Io02h9AZgZa0=;
	b=r2+KeLQPkV7Z/pSPwiSBG7aeRmgZPAmk2FNrujYtsefOXFsoN5QPaxwYA8j7Bro3Eo
	jcnlwMnHRRDlR1+AYqghk28V1qkbkdORXW1eHyQyTXh/WcZjYhWmdq7gX+qCDneSrf+w
	L9MOMkGJGDwWS5AfGZozmiVcDq3ZK6C/N5c/ELe4HmzcE3NLzEG0So+BwxDkNQFnxLgH
	MG9Go+5QuXEx9JUIzEyYX+lQIPm0Z/VBpnLB/8qI2znVnn06PG7IcL9E+KPrHmD+Q8Xy
	y+YFh18jz2OjQY1Oryiom93oY8Py8RdTC8Kxza4hmKteEVcjDD02yOFuIcy055rEo91t
	wtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NDxrHd+2Kszkc2CMDiIMDX5O09ROMO8Io02h9AZgZa0=;
	b=BoFPcP7t9e64M4TGyp6M3oN7SyR+ZgaTlFg+k1zBIPdnnntnGaydCdz0+mbgVg2npV
	ypN+o7OLS3HWlMq+tgN9lq576mPc9EptCHh7h33oOF5oGa7PVFidcbYVGjQ1v5C6/vyY
	JMt7Q+I5Xfr1l10qkD4mtVVI2/R9ThBPbbR51ekuocYq0mFBt/sxVLexjq9bis8oMnS1
	eLYkCGIGS7DABky5UHOmzFCJoKCs0tDusT9+0J01nQuIvEHHdU3nF9oVQZGK20JrSZYa
	8v7PA6O7JeP+/QQIuEfFE7LqwmkhBsd6iNzwrBwek6Tv5mypVfbFFXTJhswTuJgx1SgN
	QMDg==
X-Gm-Message-State: ABUngveMp4qv+k8iLdGCEGknEyrELzWtd052l0IqKG0X01GkUQyDE+MtO/bxMKp8I9jAUw==
X-Received: by 10.194.41.234 with SMTP id i10mr16541822wjl.205.1477402188867; 
	Tue, 25 Oct 2016 06:29:48 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	l130sm3698118wmb.18.2016.10.25.06.29.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Oct 2016 06:29:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Oct 2016 15:29:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161025132947.GB2911@jama>
References: <20161019053834.11523-1-raj.khem@gmail.com>
	<20161019053834.11523-14-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161019053834.11523-14-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH 14/16] fwts: Update to 16.09 release
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
X-List-Received-Date: Tue, 25 Oct 2016 13:29:51 -0000
X-Groupsio-MsgNum: 63595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 10:38:32PM -0700, Khem Raj wrote:
> license change is just year change from 2014 to 2016
> Fix build with clang while here

fwts-16.09.00: fwts rdepends on dtc, but it isn't a build dependency,
missing dtc in DEPENDS or PACKAGECONFIG? [build-deps]

and for qemuarm it even fails to build:
http://errors.yoctoproject.org/Errors/Details/93027/

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...nstant-logical-operand-warning-with-clang.patch | 81 ++++++++++++++++=
++++++
>  meta-oe/recipes-test/fwts/fwts_git.bb              | 15 ++--
>  2 files changed, 91 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-l=
ogical-operand-warning-with-clang.patch
>=20
> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-=
operand-warning-with-clang.patch b/meta-oe/recipes-test/fwts/fwts/0001-igno=
re-constant-logical-operand-warning-with-clang.patch
> new file mode 100644
> index 0000000..ccfe580
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand=
-warning-with-clang.patch
> @@ -0,0 +1,81 @@
> +From 953cff93c85d3cfd5cbcac56e14443dc5f6e5fbd Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 19 Oct 2016 01:57:16 +0000
> +Subject: [PATCH] ignore constant-logical-operand warning with clang
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/uefi/uefirtauthvar/uefirtauthvar.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +Index: git/src/uefi/uefirtauthvar/uefirtauthvar.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/uefi/uefirtauthvar/uefirtauthvar.c
> ++++ git/src/uefi/uefirtauthvar/uefirtauthvar.c
> +@@ -142,6 +142,9 @@ static int uefirtauthvar_deinit(fwts_fra
> + 	return FWTS_OK;
> + }
> +=20
> ++#pragma clang diagnostic push
> ++#pragma clang diagnostic ignored "-Wconstant-logical-operand"
> ++
> + static int check_fw_support(fwts_framework *fw, uint64_t status)
> + {
> + 	if ((status =3D=3D EFI_INVALID_PARAMETER) &&
> +@@ -172,6 +175,8 @@ static int check_fw_support(fwts_framewo
> + 	return FWTS_OK;
> + }
> +=20
> ++#pragma clang diagnostic pop
> ++
> + /*
> +  * Set the created authenticated variable, AuthVarCreate,
> +  * and checking the data size and data.
> +Index: git/src/lib/src/fwts_acpi_tables.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/lib/src/fwts_acpi_tables.c
> ++++ git/src/lib/src/fwts_acpi_tables.c
> +@@ -392,10 +392,14 @@ static int fwts_acpi_handle_fadt(
> + 	/* Determine FACS addr and load it.
> + 	 * Will ignore the missing FACS in the hardware-reduced mode.
> + 	 */
> ++#pragma clang diagnostic push
> ++#pragma clang diagnostic ignored "-Waddress-of-packed-member"
> ++
> + 	result =3D fwts_acpi_handle_fadt_tables(fw, fadt,
> + 			"FACS", "FIRMWARE_CTRL", "X_FIRMWARE_CTRL",
> + 			&fadt->firmware_control, &fadt->x_firmware_ctrl,
> + 			provenance);
> ++
> + 	if (result !=3D FWTS_OK) {
> + 		if ((result =3D=3D FWTS_NULL_POINTER) &&
> + 				fwts_acpi_is_reduced_hardware(fadt)) {
> +@@ -414,6 +418,7 @@ static int fwts_acpi_handle_fadt(
> + 		return FWTS_ERROR;
> + 	}
> + 	return FWTS_OK;
> ++#pragma clang diagnostic pop
> + }
> +=20
> + /*
> +Index: git/src/dmi/dmicheck/dmicheck.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/dmi/dmicheck/dmicheck.c
> ++++ git/src/dmi/dmicheck/dmicheck.c
> +@@ -209,6 +209,8 @@ static const char *uuid_patterns[] =3D {
> + 	"0A0A0A0A-0A0A-0A0A-0A0A-0A0A0A0A0A0A",
> + 	NULL,
> + };
> ++#pragma clang diagnostic push
> ++#pragma clang diagnostic ignored "-Wunneeded-internal-declaration"
> +=20
> + static const fwts_chassis_type_map fwts_dmi_chassis_type[] =3D {
> + 	{ "Invalid",		FWTS_SMBIOS_CHASSIS_INVALID },
> +@@ -245,6 +247,7 @@ static const fwts_chassis_type_map fwts_
> + 	{ "Convertible",	FWTS_SMBIOS_CHASSIS_CONVERTIBLE },
> + 	{ "Detachable",		FWTS_SMBIOS_CHASSIS_DETACHABLE },
> + };
> ++#pragma clang diagnostic pop
> +=20
> + /* Remapping table from buggy version numbers to correct values */
> + static const fwts_dmi_version dmi_versions[] =3D {
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test=
/fwts/fwts_git.bb
> index 197fe20..cbf5154 100644
> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> @@ -3,12 +3,14 @@ DESCRIPTION =3D "The tool fwts comprises of over fifty =
tests that are designed to
>  HOMEPAGE =3D "https://wiki.ubuntu.com/Kernel/Reference/fwts"
> =20
>  LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://src/main.c;beginline=3D1;endline=3D16;md5=
=3Ddeb8af5388e838d133eaa036f4d1496f"
> +LIC_FILES_CHKSUM =3D "file://src/main.c;beginline=3D1;endline=3D16;md5=
=3D31da590f3e9f3bd34dcdb9e4db568519"
> =20
> -PV =3D "14.12.00"
> +PV =3D "16.09.00"
> =20
> -SRCREV =3D "efc18d16294f492b7f72bba64344b2eed50e6a69"
> -SRC_URI =3D "git://kernel.ubuntu.com/hwe/fwts.git"
> +SRCREV =3D "7fd1834a879f27647b371c18284868c9a54f6474"
> +SRC_URI =3D "git://kernel.ubuntu.com/hwe/fwts.git \
> +           file://0001-ignore-constant-logical-operand-warning-with-clan=
g.patch \
> +           "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -16,9 +18,12 @@ DEPENDS =3D "libpcre json-c glib-2.0"
> =20
>  inherit autotools-brokensep
> =20
> -CFLAGS +=3D "-I${STAGING_INCDIR}/json-c -Wno-error=3Dmisleading-indentat=
ion"
> +CFLAGS +=3D "-I${STAGING_INCDIR}/json-c -Wno-error=3Dunknown-pragmas"
> =20
>  FILES_${PN} +=3D "${libdir}/fwts/lib*${SOLIBS}"
>  FILES_${PN}-dev +=3D "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib=
*.la"
>  FILES_${PN}-staticdev +=3D "${libdir}/fwts/lib*a"
>  FILES_${PN}-dbg +=3D "${libdir}/fwts/.debug"
> +
> +TOOLCHAIN =3D "gcc"
> +
> --=20
> 2.10.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgPXksACgkQN1Ujt2V2gBwB1ACgoV/swZAgC7ka+5e3NNFCLRFk
8RgAoJy5vPV1pRwgQU0sPYX0rLJ5S1/J
=e3Jl
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
