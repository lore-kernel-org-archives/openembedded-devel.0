Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7728.1630831389035679977
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 01:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=VATo3uW0;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630831389;
  x=1662367389;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=AvbAmZdSsTNRqRpvuvrYD6Jjxi09oBUl/CXyqeOKdEY=;
  b=VATo3uW07yaKz7NpcWHOUJe7FrQknnaWOJSnL7JC2BW1BSfkVsKDwyCu
   IbtZNwRDdWUjATLxDBjvQuqCa7SNXCORJNjBYnR9Y3xPcPeKf+LAhQQBR
   s07pwVnRpgZ+OsPyJMGOWOgkyUYQCHZQ1MmaLsP3NssNKyXba+TBxrlVv
   j3N82vF2CIOlZSF786gAizzQ0WqeTEV/xF38EFLMoGu+OyC+aZq6JTlqd
   CzOJATKmF8uyVft4lQvSIu8JYMrMGoWWhjQwGvEbHrgcWSkkv1iYiVwcN
   Pn+sEKbxluTY6vtVssGWnOkPxAUry9fm3Zf+fFTSzYtVmow7Q66NFi8eB
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] toybox-inittab: Use 0BSD for LIC_FILES_CHKSUM
Thread-Topic: [meta-oe][PATCH] toybox-inittab: Use 0BSD for LIC_FILES_CHKSUM
Thread-Index: AQHXoednIwKiZl4fsESiYfaN77zfgquVIBnw
Date: Sun, 5 Sep 2021 08:43:07 +0000
Message-ID: <f02146dd4ad14777a0352d28d72d463a@axis.com>
References: <20210904234839.2689048-1-raj.khem@gmail.com>
In-Reply-To: <20210904234839.2689048-1-raj.khem@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: den 5 september 2021 01:49
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>; Peter Kjellerstedt
> <peter.kjellerstedt@axis.com>
> Subject: [meta-oe][PATCH] toybox-inittab: Use 0BSD for LIC_FILES_CHKSUM
>=20
> BSD-0-Clause has been deleted from common licenses
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb b/meta-
> oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> index b91a1d864e..21d4dcc19f 100644
> --- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> +++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Toybox Inittab Configuration"
>  LICENSE =3D "BSD-0-Clause"

Might as well change to use 0BSD for LICENSE as well then.

> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD-=
0-Clause;md5=3D81eeb0083e31f11ab1e33ded846d521c"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/0BSD=
;md5=3Df667a3c3830a55a17ec3067709f4526c"
>=20
>  # Unpack to ${S}/orig
>  #
> --
> 2.33.0

//Peter

