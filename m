Return-Path: <prvs=0797b1b50=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jul 2019 07:09:42 UTC
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 645587D217
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1562051384; x=1593587384;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=+dgR14B+lLCCNdD0lQS7+sne8nCUtiGjK+bVe0/2LHU=;
	b=L6kmwtqxi8MXfldeIHlpEg9FKlx0RlTZ90bIr6P5kgDpk6rAVjDrCeDo
	QHSiROmfP1/7idGTT2BfiZPPJtfL2QBZt7Xw01FK1ee+yLwTnrGrKp9t6
	U4xbtClqRyDyFhn8qxLKN5F1Wued/LxDvTNF2fGOrWrqJAsopkOLQgnax 8=;
IronPort-SDR: Pju2KfrJ1RBmLeqjF9BvWJsH/wDQf3rlhqraqEG4WJ89ai+ArxOvrIL6hY2xYqYsfksaS81JNr
	olsXCYwC0s61dpfCYM8INfPRqvcJyxwGYweJeQQAkhwUmzGqKatX1uyMjcD4OT0w2dhuSKVche
	5OcGbKWCVgFrx88OGXxn6BAFdfsLXhoKwmNpksIOypDIgAK5nC0HlFfAtx9hsq/N2q5RtLKYLc
	Oo5ETtvVgX0GFH1by/c9Ug6oQfc4lLcAN7wyYODqIQlbjl5NYm+axXq1z5Lwo+gPg55wUkIXoT
	Do0=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 02 Jul 2019 09:02:35 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw3.muc with ESMTP/TLS;
	02 Jul 2019 09:02:34 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb6.muc with ESMTP/TLS; 02 Jul 2019 09:02:34 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Tue, 2 Jul 2019 09:02:34 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 2 Jul 2019 09:02:34 +0200
From: <Mikko.Rapeli@bmw.de>
To: <peter.kjellerstedt@axis.com>
Thread-Topic: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
Thread-Index: AQHVGaV9pbUKLf9Q6EykhwaGVZ//n6aOkjKAgADgJICAH+bGAIABG2+AgAYG44CAAHf8AA==
Date: Tue, 2 Jul 2019 07:02:34 +0000
Message-ID: <20190702070138.GG3459@hiutale>
References: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
	<ed9e6fc4-d91c-7457-34d7-491c153215cb@gmail.com>
	<6624e8f8b1bf2f068d9abd17d2c895517fb96fc8.camel@redrectangle.org>
	<e09a230789494c4087469516707a2016@xbox06.axis.com>
	<d8448c1b0b28e1a502bbd1c8a6cae3f8690d54e9.camel@redrectangle.org>
	<45e5da62990f4748b245c0c96c8add8c@xbox06.axis.com>
In-Reply-To: <45e5da62990f4748b245c0c96c8add8c@xbox06.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.45]
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 02 Jul 2019 07:09:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9306FB065226594D827BAE809D5DBB76@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2019 at 11:53:05PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Robert Joslyn <robert.joslyn@redrectangle.org>
> > Sent: den 28 juni 2019 05:51
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; akuster808
> > <akuster808@gmail.com>; openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG
> > options
> >=20
> > On Thu, 2019-06-27 at 10:56 +0000, Peter Kjellerstedt wrote:
> > > It is no longer possible to build cryptsetup-native after this was
> > > merged.
> > > It now fails with:
> > >
> > > ERROR: Nothing PROVIDES 'udev-native' (but virtual:native:.../meta-
> > > oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb DEPENDS on or otherw=
ise
> > > requires it). Close matches:
> > >   fuse-native
> > >   unifdef-native
> > >   db-native
> > > ERROR: Required build target 'cryptsetup-native' has no buildable > p=
roviders.
> > > Missing or unbuildable dependency chain was: ['cryptsetup-native', 'u=
dev-native']
> > >
> > > This is with systemd in DISTRO_FEATURES.
> > >
> > > //Peter
> >=20
> > Sorry about that. Is there a reasonable set of options useful for the
> > native build? Any preference for an empty native PACKAGECONFIG or
> > should it be the same as the target (minus udev obviously)?
>=20
> I have no idea. I don't even know why cryptsetup-native is being built,=20
> all I know is that it can't depend on udev-native. Locally, I have fixed =
=20
> it by adding a bbappend with PACKAGECONFIG_remove_class-native =3D "udev"=
,=20
> so now it builds again. For meta-oe I would instead suggest to add the=20
> udev feature using PACKAGECONFIG_append_class-target =3D " udev".

FWIW, I'm doing the same. Using cryptsetup-native for building
dmverity images and the udev-native dependency is not needed and causes
build failures with systemd-native...

-Mikko

> One thing that worries me though is that you stated in the commit message=
=20
> that the set of enabled PACKAGECONFIGs should match the default when no=20
> enable/disable options are specified. However, this does not seem to hold=
=20
> true for udev, as there was no dependency on udev before your change. So=
=20
> maybe udev should not be enabled by default for target either?
>=20
> > Thanks,
> > Robert
>=20
> //Peter
>=20
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> > <openembedded-
> > > > devel-bounces@lists.openembedded.org> On Behalf Of Robert Joslyn
> > > > Sent: den 7 juni 2019 05:46
> > > > To: akuster808 <akuster808@gmail.com>; openembedded-
> > > > devel@lists.openembedded.org
> > > > Subject: Re: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG
> > > > options
> > > >
> > > > On Thu, 2019-06-06 at 07:24 -0700, akuster808 wrote:
> > > > > On 6/2/19 4:12 PM, Robert Joslyn wrote:
> > > > > > Add various PACKAGECONFIG options, keeping the default options
> > > > > > enabled.
> > > > > the PACKCONFIG went from openssl to a lot more, how is that
> > keeping
> > > > > the
> > > > > defaults?
> > > >
> > > > My intent was to add PACKAGECONFIG options, but to keep the
> > resulting
> > > > build the same as before. This should match the default options
> > that
> > > > are set by upstream when you don't specify any --enable or --
> > disable
> > > > options.
> > > >
> > > > I can send a v2 with a better description if desired.
> > > >
> > > > Thanks,
> > > > Robert
> > > >
> > > > > > ---
> > > > > >  .../cryptsetup/cryptsetup_2.1.0.bb            | 51
> > > > > > ++++++++++++++++++-
> > > > > >  1 file changed, 49 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/meta-oe/recipes-
> > crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > > > b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > > > index cf1d22242..51cecf5d2 100644
> > > > > > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > > > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > > > @@ -9,7 +9,12 @@ SECTION =3D "console"
> > > > > >  LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> > > > > >  LIC_FILES_CHKSUM =3D
> > > > > > "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312326"
> > > > > >
> > > > > > -DEPENDS =3D "util-linux libdevmapper popt libgcrypt json-c"
> > > > > > +DEPENDS =3D " \
> > > > > > +    json-c \
> > > > > > +    libdevmapper \
> > > > > > +    popt \
> > > > > > +    util-linux \
> > > > > > +"
> > > > > >
> > > > > >  SRC_URI =3D
> > "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('P
> > > > > > V
> > > > > >
> > ').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
> > > > > >  SRC_URI[md5sum] =3D "41d8b985ef69242852b93e95d53e8e28"
> > > > > > @@ -19,9 +24,45 @@ inherit autotools gettext pkgconfig
> > > > > >
> > > > > >  # Use openssl because libgcrypt drops root privileges
> > > > > >  # if libgcrypt is linked with libcap support
> > > > > > -PACKAGECONFIG ??=3D "openssl"
> > > > > > +PACKAGECONFIG ??=3D " \
> > > > > > +    keyring \
> > > > > > +    cryptsetup \
> > > > > > +    veritysetup \
> > > > > > +    cryptsetup-reencrypt \
> > > > > > +    integritysetup \
> > > > > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> > > > > > +    udev \
> > > > > > +    kernel_crypto \
> > > > > > +    internal-argon2 \
> > > > > > +    blkid \
> > > > > > +    luks-adjust-xts-keysize \
> > > > > > +    openssl \
> > > > > > +"
> > > > > > +
> > > > > > +PACKAGECONFIG[keyring] =3D "--enable-keyring,--disable-keyring=
"
> > > > > > +PACKAGECONFIG[fips] =3D "--enable-fips,--disable-fips"
> > > > > > +PACKAGECONFIG[pwquality] =3D "--enable-pwquality,--disable-
> > > > > > pwquality,libpwquality"
> > > > > > +PACKAGECONFIG[passwdqc] =3D "--enable-passwdqc,--disable-
> > > > > > passwdqc,passwdqc"
> > > > > > +PACKAGECONFIG[cryptsetup] =3D "--enable-cryptsetup,--disable-
> > > > > > cryptsetup"
> > > > > > +PACKAGECONFIG[veritysetup] =3D "--enable-veritysetup,--disable=
-
> > > > > > veritysetup"
> > > > > > +PACKAGECONFIG[cryptsetup-reencrypt] =3D "--enable-cryptsetup-
> > > > > > reencrypt,--disable-cryptsetup-reencrypt"
> > > > > > +PACKAGECONFIG[integritysetup] =3D "--enable-integritysetup,
> > > > > > --disable-integritysetup"
> > > > > > +PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux=
"
> > > > > > +PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
> > > > > > +PACKAGECONFIG[kernel_crypto] =3D "--enable-kernel_crypto,--
> > disable-
> > > > > > kernel_crypto"
> > > > > > +# gcrypt-pkbdf2 requries --with-crypto_backend=3Dgcrypt or the
> > flag
> > > > > > isn't
> > > > > > +# recognized.
> > > > > > +PACKAGECONFIG[gcrypt-pbkdf2] =3D "--enable-gcrypt-pbkdf2"
> > > > > > +PACKAGECONFIG[internal-argon2] =3D "--enable-internal-argon2,
> > > > > > --disable-internal-argon2"
> > > > > > +PACKAGECONFIG[internal-sse-argon2] =3D "--enable-internal-sse-
> > > > > > argon2,--disable-internal-sse-argon2"
> > > > > > +PACKAGECONFIG[blkid] =3D "--enable-blkid,--disable-blkid,util-
> > > > > > linux"
> > > > > > +PACKAGECONFIG[dev-random] =3D "--enable-dev-random,--disable-
> > dev-
> > > > > > random"
> > > > > > +PACKAGECONFIG[luks-adjust-xts-keysize] =3D "--enable-luks-
> > adjust-
> > > > > > xts-keysize,--disable-luks-adjust-xts-keysize"
> > > > > >  PACKAGECONFIG[openssl] =3D "--with-
> > crypto_backend=3Dopenssl,,openssl"
> > > > > >  PACKAGECONFIG[gcrypt] =3D "--with-
> > crypto_backend=3Dgcrypt,,libgcrypt"
> > > > > > +PACKAGECONFIG[nss] =3D "--with-crypto_backend=3Dnss,,nss"
> > > > > > +PACKAGECONFIG[kernel] =3D "--with-crypto_backend=3Dkernel"
> > > > > > +PACKAGECONFIG[nettle] =3D "--with-crypto_backend=3Dnettle,,net=
tle"
> > > > > >
> > > > > >  RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> > > > > >                       kernel-module-dm-crypt \
> > > > > > @@ -32,6 +73,12 @@ RRECOMMENDS_${PN} =3D "kernel-module-aes-
> > generic
> > > > > > \
> > > > > >  "
> > > > > >
> > > > > >  EXTRA_OECONF =3D "--enable-static"
> > > > > > +# Building without largefile is not supported by upstream
> > > > > > +EXTRA_OECONF +=3D "--enable-largefile"
> > > > > > +# Requires a static popt library
> > > > > > +EXTRA_OECONF +=3D "--disable-static-cryptsetup"
> > > > > > +# There's no recipe for libargon2 yet
> > > > > > +EXTRA_OECONF +=3D "--disable-libargon2"
> > > > > >
> > > > > >  FILES_${PN} +=3D
> > "${@bb.utils.contains('DISTRO_FEATURES','systemd',
> > > > > > '
> > > > > > ${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
> > > > > >
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=

