Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56C797F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 21:29:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so6926944wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 13:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=ZZw4RzEqknU2BNYZ1WWHzVTdQu9xO5vmR6nYrfQwFEk=;
	b=UqOFHTUZ667HCKctYysjTxtXt+VDjROPVxpHI7FNJnkdfqO3MWQp7Mzw/izVDrPxg9
	z9PfBNOVUgOqajFu/8hzwPOSHr/srlKq6KeB0x8okhXHhsTXS127Q2ze+X9v/+0xvO3H
	64kdy0WhtWQOgE2f5gdm3BGMfxFcRqAF1bvEuGM8JKT7S2F6Sa+pN5MsG2YHyjbVoc6i
	4LgJD1b/E5g96NSNLHlAJ+ujRvPNbfEVkOnxSy8uJwGQtnoo9e8ikJPVgajx7uVMP3Yu
	+cU/+h6kySR96cz1Vg2kBzcxfIBdrP9iJpjUoeI10m3oI1hYM2Vprx9vIbbF99WWcvV4
	WlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=ZZw4RzEqknU2BNYZ1WWHzVTdQu9xO5vmR6nYrfQwFEk=;
	b=qLmxrq/GlA4uOuKFd9u3aKZidHuPffntDmQDmD2UEJOw5IVZi3PbNAostFASAAXq4F
	YY9qgIBaadyf5dLfB6+fM2tYIwoCNgI2FKdRIjfBC4HHzz4qlWNoEk7WSRiDSrGlVE48
	MnllsBXlgbrj3VKDkgykoX0fqLndONQ/1bzHMW+11t1JOYBBi2VCkRxVYRHRbUPa+EzT
	gsHcQP2Z/05whFEaESm8Z8z4AFwVUX7HtX+sIRyQOBoAfYjBPsTzo7tCbk8vEMv9ARRK
	kMIvW4Euq2jZ8Lv0yIhjguR28FIcav/Ec9jItz0b3ibKIGbl1IcrvURx34MtU0or3b7Q
	OZWQ==
X-Gm-Message-State: APjAAAUl4RcnKnNUP8J544AOAECQer5tH4GmBH2F58bhUtOEC4aUm7Fp
	H0fKfFeVeNW4UOPrwvWA2ew=
X-Google-Smtp-Source: APXvYqwnuzchs5NhL0Ep12DPqEB2ETNRjN8jaLG0eopgKySln4i1c6a6epRplvwnmSESY4H2zGdwkQ==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr15455354wmi.118.1578000589072;
	Thu, 02 Jan 2020 13:29:49 -0800 (PST)
Received: from ernie.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	r6sm57370590wrq.92.2020.01.02.13.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jan 2020 13:29:48 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <D2F21018-F908-4E42-8CF5-BCFE22EAA9DB@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Date: Thu, 2 Jan 2020 22:29:47 +0100
In-Reply-To: <20200102133724.1383-1-sno@netbsd.org>
To: Khem Raj <raj.khem@gmail.com>
References: <20200102133724.1383-1-sno@netbsd.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libconfig-autoconf-perl: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 21:29:48 -0000
X-Groupsio-MsgNum: 81877
Content-Type: multipart/signed;
	boundary="Apple-Mail=_775525FB-93CE-40CC-85AD-6EF860A39866";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_775525FB-93CE-40CC-85AD-6EF860A39866
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I uploaded 0.318 today to PAUSE.
Sending new patch for that or an update - depending whether this is in =
master tomorrow morning or not ;)

> Am 02.01.2020 um 14:37 schrieb Jens Rehsack <sno@NetBSD.org>:
>=20
> Introduce Config::Autoconf module to meta-perl which will allow some
> probes can be run without leaving perl5 context.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> .../libconfig-autoconf-perl_0.317.bb          | 41 +++++++++++++++++++
> 1 file changed, 41 insertions(+)
> create mode 100644 =
meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
>=20
> diff --git =
a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb =
b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
> new file mode 100644
> index 000000000..62983764f
> --- /dev/null
> +++ =
b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
> @@ -0,0 +1,41 @@
> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "A module to implement some of AutoConf macros in pure =
perl"
> +DESCRIPTION =3D "Config::AutoConf is intended to provide the same =
opportunities to Perl \
> +developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> =
does for \
> +Shell developers."
> +
> +HOMEPAGE=3D       "https://metacpan.org/release/Config-AutoConf"
> +
> +SECTION =3D "libs"
> +LICENSE =3D "Artistic-1.0 | GPL-1.0+"
> +
> +LIC_FILES_CHKSUM =3D =
"file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b872=
397b798 \
> =
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=3De9e36a9de734199567a4d769498f74=
3d"
> +
> +SRC_URI =3D =
"${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-0.317.tar.gz"
> +
> +SRC_URI[md5sum] =3D "29f87fc7803f1725f6daafcf416089ce"
> +SRC_URI[sha256sum] =3D =
"01e4b22d2fecb7cfd3cc1f4dabe95cd137cf249cc5e38184f88556e5c98a9ce1"
> +RDEPENDS_${PN} +=3D "libcapture-tiny-perl"
> +RDEPENDS_${PN} +=3D "perl-module-base"
> +RDEPENDS_${PN} +=3D "perl-module-carp"
> +RDEPENDS_${PN} +=3D "perl-module-config"
> +RDEPENDS_${PN} +=3D "perl-module-constant"
> +RDEPENDS_${PN} +=3D "perl-module-file-basename"
> +RDEPENDS_${PN} +=3D "perl-module-file-spec"
> +RDEPENDS_${PN} +=3D "perl-module-file-temp"
> +RDEPENDS_${PN} +=3D "perl-module-extutils-cbuilder"
> +RDEPENDS_${PN} +=3D "perl-module-extutils-cbuilder-unix"
> +RDEPENDS_${PN} +=3D "perl-module-scalar-util"
> +RDEPENDS_${PN} +=3D "perl-module-strict"
> +RDEPENDS_${PN} +=3D "perl-module-text-parsewords"
> +RDEPENDS_${PN} +=3D "perl-module-warnings"
> +RRECOMMENDS_${PN} +=3D "libfile-slurper-perl"
> +
> +S =3D "${WORKDIR}/Config-AutoConf-${PV}"
> +
> +inherit cpan ptest-perl allarch
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_775525FB-93CE-40CC-85AD-6EF860A39866
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl4OYMsACgkQRJmWrtzl
Cp3w5g//djMnrxJv97HFpFSz2BL0AKUagIXEd+J/KKAZ0J0dA+JNmPzocYfssCm4
YeM7mcZTZP7Foh5a1e532Dz67UDuIVkvdMrz9apazSr2dfSzI7a+Q3PxszZF7SI8
y/75Zc+t3ZBUCK5HRsK6I6Ryz6E+xGVg+hBqu1cP2mvK0AbdwTVfz6P66Uuuxz4G
IFgfTb5qNYWa9dT71cGvIYqc24zRv8xQnVpgQ9ts07VZNtgC+QWUXY8l5xav0DhJ
w3hBJ3MPKil9AZYo5GefNcy7VsJHbhoW58H1gZs1y60R8cx3RYnoGTpiyq0aAJfi
melRWAQrrNm4IF9FONNQv/XO96y/xYFGRUnyc5fU+YaXR2hK9cgIM1y5yXIevgIq
BiJKeUygJQx5Az2dsdWaGs1sLVUVDQtMTWHlfEFwQiZH3Wrx4I0jq2NmCKbPgfMs
ZB0/ob4ANf5RN1KwXo0i3rqLDkVUTEMbsaIF59AbOMSjdgQpcr/2INDqz0s2Lbcj
jHaNiuwS+ALHHC2gQmKx2r4lIZnaCuPQXv0v6Hg0ecRYiEfylHdQVm0d+4u1t4N6
CcrpMr7c11y8R72PqbOMsYCM2k/v4oNAYJfip5eOvbQhTNlBFuPdSX+iHPq9Ke11
SeXQMyudiR0M1vDMQv2Rpue07xQMX9RiwA2zj4ngYOUhtiymBA4=
=eaQW
-----END PGP SIGNATURE-----

--Apple-Mail=_775525FB-93CE-40CC-85AD-6EF860A39866--
