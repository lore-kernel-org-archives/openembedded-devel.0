Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id EBFF1776D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 027682E48C;
	Wed,  5 Jul 2017 18:59:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 5HAHY_wMMfRW; Wed,  5 Jul 2017 18:59:18 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E5F1B2E19C;
	Wed,  5 Jul 2017 18:59:17 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D07261A066;
	Wed,  5 Jul 2017 18:59:17 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C569B1A058;
	Wed,  5 Jul 2017 18:59:17 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  5 Jul 2017 18:59:17 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id B9BE126B7;
	Wed,  5 Jul 2017 18:59:17 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 5 Jul 2017 18:59:17 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 5 Jul 2017 18:59:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 06/10] opensc: add PACKAGECONFIG openssl
Thread-Index: AQHS9Wepmqz9QuefokWrwSzwWL8PJKJFc8Zw
Date: Wed, 5 Jul 2017 16:59:17 +0000
Message-ID: <666166be44094ed88b6920367e51df06@XBOX02.axis.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
	<20170705081133.6496-7-kai.kang@windriver.com>
In-Reply-To: <20170705081133.6496-7-kai.kang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH 06/10] opensc: add PACKAGECONFIG openssl
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
X-List-Received-Date: Wed, 05 Jul 2017 16:59:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> kai.kang@windriver.com
> Sent: den 5 juli 2017 10:11
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 06/10] opensc: add PACKAGECONFIG openssl
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Add PACKAGECONFIG openssl to enable or disable build with openssl for
> opensc. Check DISTRO_FEATURE openssl-no-weak-ciphers. If it exists then
> remove PACKAGECONFIG openssl for opensc.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/opensc/opensc_0.16.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb b/meta-
> oe/recipes-support/opensc/opensc_0.16.0.bb
> index fd67181..fa7c81d 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
> @@ -21,6 +21,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e34"
>=20
>  inherit autotools pkgconfig
>=20
> +PACKAGECONFIG ??=3D "openssl"
> +PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> +
> +PACKAGECONFIG_remove =3D "${@bb.utils.contains('DISTRO_FEATURES', 'opens=
sl-no-weak-ciphers', 'openssl', '', d)}"

It is a bad idea to use _remove like this, because it makes it impossible t=
o=20
enable openssl again in a bbappend or via local.conf. It is better to do it=
=20
like this:

PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-we=
ak-ciphers', '', 'openssl', d)}"
PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"

You should do it similarly for poco and postgresql as well.

> +
>  EXTRA_OECONF =3D " \
>      --disable-static \
>      --enable-openct \
> --
> 2.10.1

//Peter


