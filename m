Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D45457F8AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 05:37:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so28741054wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 21:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=jRDNPmL3hJ0669wUllXMHl/dnpYQxv6hU1qGb8Xs1Gw=;
	b=tWSNMwKYDyfcQbk14tdrxRdrTTetI9LxANDdD4ND9ovcCm/+w596J8ImULy6oKRPpT
	7vexaV4UV5tgfgR+qW7pIgobJU0aVkhDsl6o6mC71DESVJ4VdB/8ROS9y7yb2meRTjoW
	XVECnWLUu0XwbR6VEnZcq/GYq1lGmAUo57OTrM3Fw3J0ZNyExM4WNce+0nYvTLxOdOX2
	abfj8xT7HDtyVJd8Uv6sDIBFNwI7mX7GnYRLI74gRh7JQsbGEH5WsYelycQ8ebYH7akQ
	VLB2OY5zGVsMLrwM1bEjMhcZqdos9rdYY640C/O3PYfuuUAsIwt/MXfymgZFQm2W5d9X
	3kRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=jRDNPmL3hJ0669wUllXMHl/dnpYQxv6hU1qGb8Xs1Gw=;
	b=rgPaK2eNaFP5BpsgXb54y58O2+NkOYM33e1lBG1l+MTHKO4TJKYvrvWT4omKAyHjul
	nc/Pv/0SJtUCKjBhq7BiGAzUz+lQXLj0h7Z6AsiVGkvXLtrwgdkMReDQxtMrALnXuGKC
	Qb+XR0ADVTOwAJlY8grLye66wmKkEUcG8lEr6bzb95BQajh18wm8sYHEIzWNVQJv9JFP
	2yjJVV28HXMmcHUJF/AyoKpPHy1IkMs2O8zFWI3EW369uI+cHmTMKfsnrvrALznuBlRL
	bKlVrx99PC+bCf/SUEod/KFXAGyaXpHO/qS0O2oV7asHZ601Rv7VYqGcRkQ2zPKtqzzO
	y3Xw==
X-Gm-Message-State: APjAAAVxjUaEc3rz8VIB47CMVomZdV9tI1GLrv79EUC/XEDDVo679h5b
	KBZ/Xtxl7uL3JyqOSXg+QsU=
X-Google-Smtp-Source: APXvYqx4KNCTXH0w8YjwK4dtxJsp7bFyni696jMmznZ1c7WAzcfBZEuwzDW0WgE0rEiJ9ppAHPWBHQ==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr87527855wrw.126.1578029861558;
	Thu, 02 Jan 2020 21:37:41 -0800 (PST)
Received: from ernie.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	s3sm10981423wmh.25.2020.01.02.21.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jan 2020 21:37:40 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <98FCB86B-C534-4C8A-A0CD-4A90581C8755@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Date: Fri, 3 Jan 2020 06:37:38 +0100
In-Reply-To: <CAMKF1spL-KgeibPDCjK-bJsyPD5LkWxujbiA9Eo2NsrjS-UiUg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
References: <20200102133724.1383-1-sno@netbsd.org>
	<CAMKF1spL-KgeibPDCjK-bJsyPD5LkWxujbiA9Eo2NsrjS-UiUg@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Jan 2020 05:37:42 -0000
X-Groupsio-MsgNum: 81907
Content-Type: multipart/signed;
	boundary="Apple-Mail=_22C81658-FC55-47B8-9ECC-92239DBD548F";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_22C81658-FC55-47B8-9ECC-92239DBD548F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 03.01.2020 um 04:28 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Thu, Jan 2, 2020 at 5:37 AM Jens Rehsack <sno@netbsd.org> wrote:
>>=20
>> Introduce Config::Autoconf module to meta-perl which will allow some
>> probes can be run without leaving perl5 context.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> .../libconfig-autoconf-perl_0.317.bb          | 41 =
+++++++++++++++++++
>> 1 file changed, 41 insertions(+)
>> create mode 100644 =
meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
>>=20
>> diff --git =
a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb =
b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
>> new file mode 100644
>> index 000000000..62983764f
>> --- /dev/null
>> +++ =
b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
>> @@ -0,0 +1,41 @@
>> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +SUMMARY =3D "A module to implement some of AutoConf macros in pure =
perl"
>> +DESCRIPTION =3D "Config::AutoConf is intended to provide the same =
opportunities to Perl \
>> +developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> =
does for \
>> +Shell developers."
>> +
>> +HOMEPAGE=3D       "https://metacpan.org/release/Config-AutoConf"
>> +
>> +SECTION =3D "libs"
>> +LICENSE =3D "Artistic-1.0 | GPL-1.0+"
>> +
>> +LIC_FILES_CHKSUM =3D =
"file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b872=
397b798 \
>> =
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=3De9e36a9de734199567a4d769498f74=
3d"
>> +
>> +SRC_URI =3D =
"${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-0.317.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "29f87fc7803f1725f6daafcf416089ce"
>> +SRC_URI[sha256sum] =3D =
"01e4b22d2fecb7cfd3cc1f4dabe95cd137cf249cc5e38184f88556e5c98a9ce1"
>> +RDEPENDS_${PN} +=3D "libcapture-tiny-perl"
>> +RDEPENDS_${PN} +=3D "perl-module-base"
>> +RDEPENDS_${PN} +=3D "perl-module-carp"
>> +RDEPENDS_${PN} +=3D "perl-module-config"
>> +RDEPENDS_${PN} +=3D "perl-module-constant"
>> +RDEPENDS_${PN} +=3D "perl-module-file-basename"
>> +RDEPENDS_${PN} +=3D "perl-module-file-spec"
>> +RDEPENDS_${PN} +=3D "perl-module-file-temp"
>> +RDEPENDS_${PN} +=3D "perl-module-extutils-cbuilder"
>> +RDEPENDS_${PN} +=3D "perl-module-extutils-cbuilder-unix"
>=20
> perl-module-extutils-cbuilder-unix seems to be not provided by anyone,
> I am seeing
>=20
> 18:24:25 WARNING: libconfig-autoconf-perl-0.317-r0 do_package_qa: QA
> Issue: libconfig-autoconf-perl rdepends on
> perl-module-extutils-cbuilder-unix, but it isn't a build dependency?
> [build-deps]

That's because the (autogenerated) package is =
perl-module-extutils-cbuilder-platform-unix - a typo.
Could be that one, too.

> perhaps you need to bring this recipe along, from meta-cpan

meta-cpan packages only CPAN distributions. That one is a core module, =
automatically
split into zillion of micro-packages ... :/

>> +RDEPENDS_${PN} +=3D "perl-module-scalar-util"
>> +RDEPENDS_${PN} +=3D "perl-module-strict"
>> +RDEPENDS_${PN} +=3D "perl-module-text-parsewords"
>> +RDEPENDS_${PN} +=3D "perl-module-warnings"
>> +RRECOMMENDS_${PN} +=3D "libfile-slurper-perl"
>> +
>> +S =3D "${WORKDIR}/Config-AutoConf-${PV}"
>> +
>> +inherit cpan ptest-perl allarch
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.17.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_22C81658-FC55-47B8-9ECC-92239DBD548F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl4O0yIACgkQRJmWrtzl
Cp2xnA/+NfYYccOGvAaT1y0iUwEoJMd3ShmLGVW0f9PgdwtW+P0xAkYfGLVJI7m4
oBOYiC9qgVy1XmTLHQW1Gu3mmm9OcEZLI0Dg6fbbj7wY1YiPRXqVRSNeLaron7nF
qkHWIU6Rk49Swgpf8Nr2/Dg15MPPtH1Y973kXaon2jXirhwvQgiD2vCRek1CAJtK
ebeQ3NrpMVOiOyuy95NB0nJ6/RG+Q8i4B2xSza8DO12NU3GjMj0xjhUf6/dx8Wlo
OfGUAtl6nXRuJ/PQuyVN3M8Kdacy1yII24rtHNf37YHh1BV2bQ7yvo8N6lMbFr+Q
uj8jytavLPtEvC0JMxiNJajSaJ+7v0e2vmdQYpeRsPIgxYCiJLtSEo5pn8D3P5TX
8t2dLGOUxs5GkxjfP6aaPvY2bV7vk3LojJ+jiQuPXmECzHRbvEIAdssqkq4y+1LX
fDIKoqd6aUuG1YO7uXlGDvOx5YJalSajN9Uq5l4lbVlP7GNcVfGqhVTOn/jPWotY
loJTo2Xyxmsvo8HgyNWASylVq1yJABWu0CK2J50LRaQlaVT/P3wPr8IBidFWEXcn
G+Vh6dMZHFXdZl7uOuRjYyaGEzjngPXv9XVTZbRlhQwN1km+FnQtYtRnyj5nYIcE
YRkOyTDBgwp9lRKJZBKezHXBtO9acDwcPshxVozX8PKNhq4hsgk=
=oIa8
-----END PGP SIGNATURE-----

--Apple-Mail=_22C81658-FC55-47B8-9ECC-92239DBD548F--
