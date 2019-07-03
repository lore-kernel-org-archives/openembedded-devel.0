Return-Path: <prvs=0800548a1=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jul 2019 07:06:43 UTC
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id C1A2B79D54
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1562137606; x=1593673606;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=Q8FxFsK0UgYomYxNXaMloRS8+Z1ioWLJxTU1oYHME88=;
	b=WTNLOo1fDwK+2f1iPcK/gRQBR86B0SxcrOQV1vI3KKiAulPfuuMNTJ8i
	yW6/xktfBF9FjN4V1Tq3hXwtbp/RqJo7ZsKx9xCXcxTDDU6+kcBfDLB16
	f4qysKEQQPIfkViYaPdetynaYXHcjDqXcQk5vH5Kw7IMDx4J4goG7ePfl A=;
IronPort-SDR: tgAF73eVCoPAgjHDqHRZNNChsj5UZIRMg5L0Ns0XBAiiGG7Q38upz6q08/9cj9qbbKSjgQoINt
	jkydWTqnQb3kr3QzO8eYjHkdKcOufuSM1KHmilbLPoulElOnFkFtAZs4cTAO4NyZWEeDSIC54Q
	8tFQkWp5lu94QAvLNpfGL4YGs/ZpPC4bEKYI09qzsuiRDxqHTdSUIIjYp0O0QYZB4pD2eNSmid
	VrZSMrYDtvVIXyFxi5g2ouJgI0POafbdFvD4HXDFWjcAWxM2RNM+EkgfWqZEQpVEPNsFiKHdbu
	YC8=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 03 Jul 2019 08:59:38 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
	03 Jul 2019 08:59:37 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb1.muc with ESMTP/TLS; 03 Jul 2019 08:59:36 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Wed, 3 Jul 2019 08:59:36 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 3 Jul 2019 08:59:36 +0200
From: <Mikko.Rapeli@bmw.de>
To: <robert.joslyn@redrectangle.org>
Thread-Topic: [oe] [meta-oe][PATCH] cryptsetup: Don't enable udev for native
	build
Thread-Index: AQHVMVsihXnhz3+asEmhSvIeKTzvOaa4VYIA
Date: Wed, 3 Jul 2019 06:59:36 +0000
Message-ID: <20190703065936.GS3459@hiutale>
References: <20190703045118.13041-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20190703045118.13041-1-robert.joslyn@redrectangle.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.39]
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] cryptsetup: Don't enable udev for native build
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
X-List-Received-Date: Wed, 03 Jul 2019 07:06:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43BCBA111FBE794AB02EB5FA941B7EAD@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2019 at 09:51:18PM -0700, Robert Joslyn wrote:
> When building cryptsetup-native, don't enable udev support since there
> is not a udev-native recipe.
>=20
> When udev is enabled, change the dependency from a DEPENDS to an
> RDEPENDS. The --enable-udev option adds a runtime check for udev before
> using udev features of libdevmapper. Because of this, udev isn't needed
> at build time, just runtime.
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>

Thanks!

Reviewed-by: Mikko Rapeli <mikko.rapeli@bmw.de>

> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> index 51cecf5d2..a500b1898 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> @@ -31,13 +31,15 @@ PACKAGECONFIG ??=3D " \
>      cryptsetup-reencrypt \
>      integritysetup \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> -    udev \
>      kernel_crypto \
>      internal-argon2 \
>      blkid \
>      luks-adjust-xts-keysize \
>      openssl \
>  "
> +PACKAGECONFIG_append_class-target =3D " \
> +    udev \
> +"
> =20
>  PACKAGECONFIG[keyring] =3D "--enable-keyring,--disable-keyring"
>  PACKAGECONFIG[fips] =3D "--enable-fips,--disable-fips"
> @@ -48,7 +50,7 @@ PACKAGECONFIG[veritysetup] =3D "--enable-veritysetup,--=
disable-veritysetup"
>  PACKAGECONFIG[cryptsetup-reencrypt] =3D "--enable-cryptsetup-reencrypt,-=
-disable-cryptsetup-reencrypt"
>  PACKAGECONFIG[integritysetup] =3D "--enable-integritysetup,--disable-int=
egritysetup"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
> -PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
> +PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,udev"
>  PACKAGECONFIG[kernel_crypto] =3D "--enable-kernel_crypto,--disable-kerne=
l_crypto"
>  # gcrypt-pkbdf2 requries --with-crypto_backend=3Dgcrypt or the flag isn'=
t
>  # recognized.
> --=20
> 2.21.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=

