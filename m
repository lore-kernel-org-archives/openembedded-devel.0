Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7C42D6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:03:47 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v188so118134908wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2tHKM6rO7bv3qxhxDu7zzZiFW/NA8b8vkQaSM4nwaXo=;
	b=G0gHhgyUCA++PIK7/WSqoYvpUDeWv4h5TKnBW8oPRn5Up7EpCCxQVRhUiqKQyhAs9s
	pWgP6pOvIPlsl4tRLNyUiW6siml68DRmRBuvx3tWjTUT0CaUt/ORkQwe7ajub5ia+y8m
	xTXxL/CgYo1O1AK4oLVqpLhnyiCXlkRLlYSeEKc/iV7w57nHLa+8V0TZS8Jb+IMl/rPW
	Zm7f1/SPcQNABJKfo9/ByKGV5Q8XJZDLxhv6EbgOrUfUJzdhZW2hgbzwneW/z0wSWb8B
	apU/5uPCGRXaVvBOSuhRHydnMt1adykTvjyt8CKeVZHvEaa9zaox/m9Z0iIpE/KqC8fI
	Bl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2tHKM6rO7bv3qxhxDu7zzZiFW/NA8b8vkQaSM4nwaXo=;
	b=Cx/mrLF7jtm8i1iqlGsGGIjIG7f76fvuj2Rp0RSwqDBF3EMg3bj2EBarNnJInT86zI
	tn4nv4OVwOdsRKllJzekCa+UXJSH6eg9QJwWCeLyRrEslzJgOA4U7m/z8UTI55g9mRFE
	YtiK4Sr2MNuUI/lBC68sl+znxoCzfkQ1TivTVGAq2TaoDHNnBaJZCgTf3yvNXBjIghDS
	L/72z+NSImrgv+LzUud65pr/BSVecgG3ohCuoYJ+vkwGtE1UpvQkQsUJADIw2j9m9b4z
	4dd3MgbVhLax7oTqVwqXLxualvG8X22THs47QvBTwRmBHYXHLtOCYghxHPTFni4Iyy+0
	zNBw==
X-Gm-Message-State: AD7BkJIg8QKt+2TyeuFEjnYgOZ/Z1kthTkzjHywY+UzIl8l+wF06o0hl+gpu/MB15wf5Fg==
X-Received: by 10.28.153.203 with SMTP id b194mr23995072wme.3.1460451827877;
	Tue, 12 Apr 2016 02:03:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u3sm21631226wmg.15.2016.04.12.02.03.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 02:03:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Apr 2016 11:05:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160412090518.GA2564@jama>
References: <1459236536-15190-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1459236536-15190-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] cpupower: add recipes
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
X-List-Received-Date: Tue, 12 Apr 2016 09:03:49 -0000
X-Groupsio-MsgNum: 60963
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 03:28:56PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> cpupower is tools to shows and sets processor power related values
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-oe/recipes-kernel/cpupower/cpupower.bb | 41 +++++++++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/cpupower/cpupower.bb
>=20
> diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipe=
s-kernel/cpupower/cpupower.bb
> new file mode 100644
> index 0000000..d53deac
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "Shows and sets processor power related values"
> +DESCRIPTION =3D "cpupower is a collection of tools to examine and tune p=
ower \
> +saving related features of your processor."
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +DEPENDS =3D "pciutils"
> +
> +inherit kernelsrc kernel-arch
> +
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> +
> +PROVIDES =3D "virtual/cpupower"
> +
> +B =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE =3D '\
> +    -C ${S}/tools/power/cpupower \
> +    O=3D${B} \
> +    CROSS=3D${TARGET_PREFIX} \
> +    ARCH=3D${ARCH} \
> +    CC=3D"${CC}" \
> +    AR=3D"${AR}" \
> +'
> +do_compile() {
> +	unset CFLAGS
> +	oe_runmake all

Use 4 spaces for indentation.

> +}
> +
> +do_install() {
> +	unset CFLAGS
> +	oe_runmake DESTDIR=3D${D} install
> +	chown root:root ${D}/${libdir}/*
> +}
> +
> +python do_package_prepend() {
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +RDEPENDS_${PN} =3D "bash"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcMuk4ACgkQN1Ujt2V2gBwh4wCeLWIdlaoh09MjYSKre/OkhX7l
E+UAn3spcwIwFCkqlhv1aSvL/dd3BfIn
=Gb58
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
