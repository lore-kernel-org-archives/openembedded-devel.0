Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.60.1587756665414193093
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 12:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=BX83J/Ne;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1929; q=dns/txt; s=axis-central1;
  t=1587756665; x=1619292665;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O803NzmWVxDUP9iS5RLE0O0/b1GDFhQs2cyNv5ba8tg=;
  b=BX83J/NeGVOpfZ60IKI8NAfDaTKuXmLqtTv6ZJeU5EY+Rke0k1C+cML4
   Cf23d+UiUaslRZ8Z/gYCioi1hT+y+h6deT4gz7f/mMvkL96vgUDAvxxw6
   GJSB1a3dhZ/EwL8dFPwFxPWSvQs2PnyKtlUVhzJNB9pFRSB31n0lx/9Q0
   saSu1yzpOXIDdcTHtrs98zFzuUN31xXt632Dc9a+Aw705s9j33bf0Yeav
   8lLSmGhSAxcIBNOs0MVoUUj7ryFwO0p1mkZr+HOAHYIKgIhSorfVFhEH0
   qyNxzo8zvl+n7atyEiN4pwf0h0zBrXZ2GHeDbgtKzsLnjWSu/+VwYuJrp
   Q==;
IronPort-SDR: wRZP1Y9eRZDxY5Lx8QCRl8D++H2ZVv53bxvZjewqb53L2mlE/F92CuWEl8fH4aZuRalUGeVNGw
 c2/omFlzXRsiRZMaNHChaYwXYbx43jwvYEAl/3pqnmzVOXmseHZqqBUAb5QdWaxIN5h7Sm34Mu
 gKwwoH8Oyh3aL4Dc4IUHOf0Ruu4BVXX9bnYH4FFDVNQ65jI9xhhZ+7FktaJjEBdNfdLV2/mlWz
 BvHhAhci3PrRGUv+z3uoCtbHymZ0CCjSA0oLkhxDdaX7FD59DdbdPY3SXXna1sy6m71zkaV4Od
 YMM=
X-IronPort-AV: E=Sophos;i="5.73,313,1583190000"; 
   d="scan'208";a="8053030"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Matt Campbell <Mcampbell@izotope.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
Thread-Topic: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
Thread-Index: AQHWGOGWLn4XZq4KlkeRiOObdn0Tl6iIq3Eg
Date: Fri, 24 Apr 2020 19:31:02 +0000
Message-ID: <e4ac0a4da76740ed8a6919b6018cd2cc@XBOX03.axis.com>
References: <20200422200630.79513-1-mcampbell@izotope.com>
In-Reply-To: <20200422200630.79513-1-mcampbell@izotope.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Matt Campbell
> Sent: den 22 april 2020 22:07
> To: openembedded-devel@lists.openembedded.org
> Cc: Matthew Campbell <mcampbell@izotope.com>
> Subject: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
>=20
> Changes from v1:
> Fix formatting of patch

The above should go below the --- line below as it relates to the=20
review process rather than the change itself.

//Peter

> Signed-off-by: Matthew Campbell <mcampbell@izotope.com>
> ---
>  ...bus-c++-tools-native_0.8.1.bb =3D> sdbus-c++-tools_0.8.1.bb} | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools-native_0.8.1.bb
> =3D> sdbus-c++-tools_0.8.1.bb} (89%)
>=20
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-
> native_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> similarity index 89%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-
> native_0.8.1.bb
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> index e18b9903d..9eaec0f2a 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "Native interface code generator for
> development with sdbus-c++"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/COPYING;md5=3D1803fa9c2c3ce8cb06b4861d75310742"
>=20
> -inherit cmake native
> +inherit cmake
>=20
>  DEPENDS +=3D "expat"
>=20
> @@ -12,3 +12,5 @@ SRCREV =3D "3a4f343fb924650e7639660efa5f143961162044"
>  SRC_URI =3D "git://github.com/Kistler-Group/sdbus-
> cpp.git;protocol=3Dhttps;branch=3Dmaster;subpath=3Dtools"
>=20
>  S =3D "${WORKDIR}/tools"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.20.1

