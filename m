Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD57C60721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 11:14:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i204so2557697wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aumaidlzHpgK5hxWQskpnhCwzcaA1n4n08iF1Kg9K1I=;
	b=mJoJzsiqDpAs1Wye4uR54dkPFyQ7ZgZlBLYSEFE97QIMJIMcG68h+AlQ/T6LBSpazf
	lelmpJu5QHW/a/OVJEiGb/i5wv56wCwCEd1FEnW9XTIl8DT/pERRSq5rLZ3gbttXsUlD
	AUaIFDt/rl71pSEpm72IoXAU5xLuvduOg2BiSfL+yoqSdMCdYDJDutsKONq3ADBHxF5r
	CfgZiFp3qL/pHZETcxpn01z7/MVFqaBOH5PXtZzf172WQIFIOVCWH4NiUeXkh9FL80uv
	Xd/zQfiiJqxKI1/eNaoFjHt0eZfRaHo1+tomGpdQ7BprQgs+59wtmADkLdqekWD7LPUt
	Pd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aumaidlzHpgK5hxWQskpnhCwzcaA1n4n08iF1Kg9K1I=;
	b=jzAVs4+dG/RPCu3GcNR6TmeL5v3OdnDb5rlogiI9sxgqNGYQIiUVbbakV6KDtyEDh1
	vtnBgVnD0dITlo/ycPlwh+oS77SernJ4tD1eqLiGvSiHR5kGt5ZUO0HXL8NIRK0jUhIt
	GVGESqlIG2RSxB+aw3LTD/L/P0F3GEioQHP7M4dT4OTYiDRVITskuHIYWNV8kL8e4yFX
	6eF3VWaJ+wyNz0Q02NONmfXmuFj2Rf+e0Lv3o9q6PWCXOCpJtGmoK9rqhMZ9CCA/7eNh
	8o/9U8joAFyNv2nvf1LY1O3gmpqkPLAeNSKvspKwVPxMwmPjrWIii2yzW8/v9Wmuj7X8
	9Oyg==
X-Gm-Message-State: AD7BkJKn97uKJfGRckhrfQtZtn+V2QDVr1+cOHFU4nwZ85py3fnls50PtN1oytMVY7DDWA==
X-Received: by 10.28.212.6 with SMTP id l6mr2471683wmg.21.1459250060041;
	Tue, 29 Mar 2016 04:14:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u133sm14271024wmg.8.2016.03.29.04.14.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 04:14:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Mar 2016 13:14:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160329111412.GB2555@jama>
References: <CA37575B-457D-4C92-8A2F-307E94BB47D8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA37575B-457D-4C92-8A2F-307E94BB47D8@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-java][PATCH 1/4] Avoid parse time errors due to dependency on x11, for distros without x11
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
X-List-Received-Date: Tue, 29 Mar 2016 11:14:23 -0000
X-Groupsio-MsgNum: 60721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 09:27:36PM +0100, Jens Rehsack wrote:
>=20
> BitBake raises some errors when processing recipes that depend on x11
> for distros that don't have x11 in DISTRO_FEATURES. To work around
> that issue, REQUIRED_DISTRO_FEATURES =3D "x11" (from
> distro_features_check.bbclass) has been set for the following recipes:
>=20
> * cacao (_class-target)
> * classpath (_class-target)
> * jamvm (_class-target)
> * openjdk-7-release
>=20
> That makes BitBake skip those recipes during the cache generation
> (they'd still be parsed, but ignored).
>=20
> This patch improves the idea from Mario Domenech Goulart <mario@ossystems=
=2Ecom.br>
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  recipes-core/cacao/cacao_1.6.1.bb             | 1 +
>  recipes-core/classpath/classpath.inc          | 4 +---
>  recipes-core/classpath/classpath_0.99.bb      | 4 ++++
>  recipes-core/jamvm/jamvm.inc                  | 4 +---
>  recipes-core/jamvm/jamvm_git.bb               | 4 ++++
>  recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb | 4 ++++
>  recipes-core/openjdk/openjdk-common.inc       | 4 +---
>  7 files changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao=
_1.6.1.bb
> index 564dd1e..f88293b 100644
> --- a/recipes-core/cacao/cacao_1.6.1.bb
> +++ b/recipes-core/cacao/cacao_1.6.1.bb
> @@ -18,6 +18,7 @@ SRC_URI[sha256sum] =3D "eecc8bd1b528a028f43d9d1d0c06b97=
855bbf1d40e03826d911ebbc0b6
>  inherit java autotools-brokensep update-alternatives pkgconfig distro_fe=
atures_check
> =20
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> +REQUIRED_DISTRO_FEATURES_class-native :=3D ""
> =20
>  EXTRA_OECONF_class-native =3D "\
>      --enable-debug \
> diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpat=
h/classpath.inc
> index 0f760fe..1bdfd78 100644
> --- a/recipes-core/classpath/classpath.inc
> +++ b/recipes-core/classpath/classpath.inc
> @@ -7,9 +7,7 @@ LICENSE =3D "Classpath"
> =20
>  PBN =3D "classpath"
> =20
> -inherit autotools java gettext distro_features_check
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +inherit autotools java gettext
> =20
>  DEPENDS =3D "virtual/javac-native fastjar-native zip-native gmp antlr-na=
tive gtk+ gconf libxtst file"
> =20
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/clas=
spath/classpath_0.99.bb
> index 8b3a6e3..6aa3baa 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -1,5 +1,9 @@
>  require classpath.inc
> =20
> +inherit distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"

Does it make sense to enable gtk peer with PACKAGECONFIG and to allow to
build x11-less (gui-less) classpath?

> +
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92acc79f1f429143f4624d07b2537=
02a"
> =20
>  SRC_URI +=3D " \
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index e00813e..5893cbc 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -21,9 +21,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.ta=
r.gz \
>            "
> =20
> =20
> -inherit java autotools update-alternatives pkgconfig distro_features_che=
ck
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +inherit java autotools update-alternatives pkgconfig
> =20
>  # This uses 32 bit arm, so force the instruction set to arm, not thumb
>  ARM_INSTRUCTION_SET =3D "arm"
> diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_g=
it.bb
> index 07eed6a..63364aa 100644
> --- a/recipes-core/jamvm/jamvm_git.bb
> +++ b/recipes-core/jamvm/jamvm_git.bb
> @@ -3,6 +3,10 @@
> =20
>  require jamvm.inc
> =20
> +inherit distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
>  SRCREV =3D "ebd11bde0a97b57f0d18938c6b65468d3c932719"
>  PV =3D "1.5.5+1.6.0-devel+git${SRCPV}"
> =20
> diff --git a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb b/recipes-core=
/openjdk/openjdk-7_85b01-2.6.1.bb
> index 1ca3b08..e631c13 100644
> --- a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
> +++ b/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
> @@ -1,5 +1,9 @@
>  require openjdk-7-release-85b01.inc
> =20
> +inherit distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
>  PR =3D "${INC_PR}.1"
> =20
>  SRC_URI[iced.md5sum] =3D "efac44117a94b9d3278988959e336e05"
> diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openj=
dk/openjdk-common.inc
> index e3e597a..dc26522 100644
> --- a/recipes-core/openjdk/openjdk-common.inc
> +++ b/recipes-core/openjdk/openjdk-common.inc
> @@ -17,9 +17,7 @@ DEPENDS_append_libc-uclibc =3D " virtual/libiconv "
>  # because structure sizes and/or alignment may differ.
>  DEPENDS_append =3D " qemu-native "
> =20
> -inherit java autotools gettext qemu pkgconfig distro_features_check
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +inherit java autotools gettext qemu pkgconfig
> =20
>  # OpenJDK uses slightly different names for certain arches. We need to k=
now
>  #	this to create some files which are expected by the build.
> --=20
> 1.9.1
>=20
>=20
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb6Y4MACgkQN1Ujt2V2gBy8UACfQzRQC8SJbsfuA22HTrOcr4Ku
CHQAoKbg7NIEJapJgKkdJR5belhfzLoU
=NMTV
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
