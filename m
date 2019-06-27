Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B55967BFB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 10:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2AE6C18507;
	Thu, 27 Jun 2019 12:56:32 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RowIEPE-cUFD; Thu, 27 Jun 2019 12:56:26 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C1A7D18505;
	Thu, 27 Jun 2019 12:56:26 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 935751A088;
	Thu, 27 Jun 2019 12:56:26 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87B1E1A082;
	Thu, 27 Jun 2019 12:56:26 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 27 Jun 2019 12:56:26 +0200 (CEST)
Received: from xbox05.axis.com (xbox05.axis.com [10.0.15.175])
	by seth.se.axis.com (Postfix) with ESMTP id 7B8DA1B78;
	Thu, 27 Jun 2019 12:56:26 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by xbox05.axis.com (10.0.15.175)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 27 Jun 2019 12:56:26 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Thu, 27 Jun 2019 12:56:26 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>, akuster808
	<akuster808@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
Thread-Index: AQHVGaVx4ZhrDq0frk6//W/ueiAxcKaOkjKAgADgJICAIAdxAA==
Date: Thu, 27 Jun 2019 10:56:26 +0000
Message-ID: <e09a230789494c4087469516707a2016@xbox06.axis.com>
References: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
	<ed9e6fc4-d91c-7457-34d7-491c153215cb@gmail.com>
	<6624e8f8b1bf2f068d9abd17d2c895517fb96fc8.camel@redrectangle.org>
In-Reply-To: <6624e8f8b1bf2f068d9abd17d2c895517fb96fc8.camel@redrectangle.org>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
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
X-List-Received-Date: Thu, 27 Jun 2019 10:56:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It is no longer possible to build cryptsetup-native after this was merged.=
=20
It now fails with:

ERROR: Nothing PROVIDES 'udev-native' (but virtual:native:.../meta-oe/recip=
es-crypto/cryptsetup/cryptsetup_2.1.0.bb DEPENDS on or otherwise requires i=
t). Close matches:
  fuse-native
  unifdef-native
  db-native
ERROR: Required build target 'cryptsetup-native' has no buildable providers=
.
Missing or unbuildable dependency chain was: ['cryptsetup-native', 'udev-na=
tive']

This is with systemd in DISTRO_FEATURES.

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Robert Joslyn
> Sent: den 7 juni 2019 05:46
> To: akuster808 <akuster808@gmail.com>; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG
> options
>=20
> On Thu, 2019-06-06 at 07:24 -0700, akuster808 wrote:
> >
> > On 6/2/19 4:12 PM, Robert Joslyn wrote:
> > > Add various PACKAGECONFIG options, keeping the default options
> > > enabled.
> > the PACKCONFIG went from openssl to a lot more, how is that keeping
> > the
> > defaults?
>=20
> My intent was to add PACKAGECONFIG options, but to keep the resulting
> build the same as before. This should match the default options that
> are set by upstream when you don't specify any --enable or --disable
> options.
>=20
> I can send a v2 with a better description if desired.
>=20
> Thanks,
> Robert
>=20
> > > ---
> > >  .../cryptsetup/cryptsetup_2.1.0.bb            | 51
> > > ++++++++++++++++++-
> > >  1 file changed, 49 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > index cf1d22242..51cecf5d2 100644
> > > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > @@ -9,7 +9,12 @@ SECTION =3D "console"
> > >  LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> > >  LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312326"
> > >
> > > -DEPENDS =3D "util-linux libdevmapper popt libgcrypt json-c"
> > > +DEPENDS =3D " \
> > > +    json-c \
> > > +    libdevmapper \
> > > +    popt \
> > > +    util-linux \
> > > +"
> > >
> > >  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV
> > > ').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
> > >  SRC_URI[md5sum] =3D "41d8b985ef69242852b93e95d53e8e28"
> > > @@ -19,9 +24,45 @@ inherit autotools gettext pkgconfig
> > >
> > >  # Use openssl because libgcrypt drops root privileges
> > >  # if libgcrypt is linked with libcap support
> > > -PACKAGECONFIG ??=3D "openssl"
> > > +PACKAGECONFIG ??=3D " \
> > > +    keyring \
> > > +    cryptsetup \
> > > +    veritysetup \
> > > +    cryptsetup-reencrypt \
> > > +    integritysetup \
> > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> > > +    udev \
> > > +    kernel_crypto \
> > > +    internal-argon2 \
> > > +    blkid \
> > > +    luks-adjust-xts-keysize \
> > > +    openssl \
> > > +"
> > > +
> > > +PACKAGECONFIG[keyring] =3D "--enable-keyring,--disable-keyring"
> > > +PACKAGECONFIG[fips] =3D "--enable-fips,--disable-fips"
> > > +PACKAGECONFIG[pwquality] =3D "--enable-pwquality,--disable-
> > > pwquality,libpwquality"
> > > +PACKAGECONFIG[passwdqc] =3D "--enable-passwdqc,--disable-
> > > passwdqc,passwdqc"
> > > +PACKAGECONFIG[cryptsetup] =3D "--enable-cryptsetup,--disable-
> > > cryptsetup"
> > > +PACKAGECONFIG[veritysetup] =3D "--enable-veritysetup,--disable-
> > > veritysetup"
> > > +PACKAGECONFIG[cryptsetup-reencrypt] =3D "--enable-cryptsetup-
> > > reencrypt,--disable-cryptsetup-reencrypt"
> > > +PACKAGECONFIG[integritysetup] =3D "--enable-integritysetup,
> > > --disable-integritysetup"
> > > +PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
> > > +PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
> > > +PACKAGECONFIG[kernel_crypto] =3D "--enable-kernel_crypto,--disable-
> > > kernel_crypto"
> > > +# gcrypt-pkbdf2 requries --with-crypto_backend=3Dgcrypt or the flag
> > > isn't
> > > +# recognized.
> > > +PACKAGECONFIG[gcrypt-pbkdf2] =3D "--enable-gcrypt-pbkdf2"
> > > +PACKAGECONFIG[internal-argon2] =3D "--enable-internal-argon2,
> > > --disable-internal-argon2"
> > > +PACKAGECONFIG[internal-sse-argon2] =3D "--enable-internal-sse-
> > > argon2,--disable-internal-sse-argon2"
> > > +PACKAGECONFIG[blkid] =3D "--enable-blkid,--disable-blkid,util-linux"
> > > +PACKAGECONFIG[dev-random] =3D "--enable-dev-random,--disable-dev-
> > > random"
> > > +PACKAGECONFIG[luks-adjust-xts-keysize] =3D "--enable-luks-adjust-
> > > xts-keysize,--disable-luks-adjust-xts-keysize"
> > >  PACKAGECONFIG[openssl] =3D "--with-crypto_backend=3Dopenssl,,openssl=
"
> > >  PACKAGECONFIG[gcrypt] =3D "--with-crypto_backend=3Dgcrypt,,libgcrypt=
"
> > > +PACKAGECONFIG[nss] =3D "--with-crypto_backend=3Dnss,,nss"
> > > +PACKAGECONFIG[kernel] =3D "--with-crypto_backend=3Dkernel"
> > > +PACKAGECONFIG[nettle] =3D "--with-crypto_backend=3Dnettle,,nettle"
> > >
> > >  RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> > >                       kernel-module-dm-crypt \
> > > @@ -32,6 +73,12 @@ RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> > >  "
> > >
> > >  EXTRA_OECONF =3D "--enable-static"
> > > +# Building without largefile is not supported by upstream
> > > +EXTRA_OECONF +=3D "--enable-largefile"
> > > +# Requires a static popt library
> > > +EXTRA_OECONF +=3D "--disable-static-cryptsetup"
> > > +# There's no recipe for libargon2 yet
> > > +EXTRA_OECONF +=3D "--disable-libargon2"
> > >
> > >  FILES_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','
> > > ${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
> > >
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

