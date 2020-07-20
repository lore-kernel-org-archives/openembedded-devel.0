Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web10.33492.1595230404996908472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 00:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=Yhy5vd44;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=46313fddc=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1595230404; x=1626766404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ytv2E7EpkJtdM2iyJZJ2ggaDL/f+FHi0lNM7bvUDBwM=;
  b=Yhy5vd44LFfEb+A8grDVN9lrwQEWBqRuDf/wHDZ6EcGbdqiy7hB9XMOB
   0k33m/sexI4vSFRrDzUlRayj4D57PGnmCc29uNpb9RCkzpvpyXkvyaszy
   grlqbLx2LZEkdcZccoMrhgRZeWXx5b7A0NuBnsj0i7HuKCuF65hlN8ErY
   w=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Jul 2020 09:33:12 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
 20 Jul 2020 09:33:12 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp) ([160.48.96.47])
 by esabb2.muc with ESMTP/TLS; 20 Jul 2020 09:33:12 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10k.europe.bmw.corp
 (160.48.96.47) with Microsoft SMTP Server (TLS;
 Mon, 20 Jul 2020 09:33:12 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 20 Jul 2020 09:33:12 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <bunk@stusta.de>
CC: <akuster808@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
Thread-Topic: [oe] [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
Thread-Index: AQHWXE3ppA55RQE+OUio4wyCVbkf1akL5EAAgAQRp4A=
Date: Mon, 20 Jul 2020 07:33:11 +0000
Message-ID: <20200720073311.GQ108868@korppu>
References: <cover.1594999160.git.akuster808@gmail.com>
 <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
 <20200717172458.GF1229@localhost>
In-Reply-To: <20200717172458.GF1229@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C357FCF9B55944A963DD48F9653640E@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2020 at 08:24:58PM +0300, Adrian Bunk wrote:
> On Fri, Jul 17, 2020 at 08:20:54AM -0700, akuster wrote:
> >...
> > --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> > +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
> >...
>=20
> This would make the version going backwards, please add
>   PV =3D "1.9.3+really1.9.2"

This will break CVE version checks unless CVE_VERSION is set to 1.9.2.
Please increment PE instead.

Cheers,

-Mikko

> cu
> Adrian

>=20
