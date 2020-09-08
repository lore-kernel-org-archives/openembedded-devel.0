Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.15618.1599552887946215710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2020 01:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=F20tuJIv;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=513a16eea=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1599552888; x=1631088888;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gDdISId/hWTl9QKFrUu8WawwXwAZ/sGhmT8BNzkCAR4=;
  b=F20tuJIvuWwy9gCLUkjP5/TtZV7almRvxoHPvWBRjKm4KekqO2191OCG
   4aI0CXo2uWDnDMYhoZTGZibtdDk06nKPCK/BIn0n6w7bKV1raFDyxWGla
   hBGld0riQD80/48nVwystC0ZXFpoRpJYfe/wzNt8tpZCie/3B4tJHM3B5
   4=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 08 Sep 2020 10:14:44 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 08 Sep 2020 10:14:19 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp) ([160.48.96.47])
 by esabb2.muc with ESMTP/TLS; 08 Sep 2020 10:14:19 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10k.europe.bmw.corp
 (160.48.96.47) with Microsoft SMTP Server (TLS;
 Tue, 8 Sep 2020 10:14:19 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Tue, 8
 Sep 2020 10:14:19 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <akuster808@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH 3/3] mdns: add BSD-3-Clause to LICENSE
Thread-Topic: [oe] [meta-networking][PATCH 3/3] mdns: add BSD-3-Clause to
 LICENSE
Thread-Index: AQHWg6o8q1GVKRLSMEuF/aNvoMkwr6ldVsaAgADwdgA=
Date: Tue, 8 Sep 2020 08:14:19 +0000
Message-ID: <20200908081418.GV2026@korppu>
References: <20200905172951.31808-1-mikko.rapeli@bmw.de>
 <20200905172951.31808-3-mikko.rapeli@bmw.de>
 <a9c5a31f-ddd3-3e1b-c7ef-032c64708d16@gmail.com>
In-Reply-To: <a9c5a31f-ddd3-3e1b-c7ef-032c64708d16@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71F4A36CE0F70A40AA430ABF7095865F@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2020 at 10:53:39AM -0700, akuster808 wrote:
>=20
>=20
> On 9/5/20 10:29 AM, Mikko Rapeli wrote:
> > The LICENSE file in source tree says:
> >
> > The majority of the source code in the mDNSResponder project is licens=
ed
> > under the terms of the Apache License, Version 2.0, available from:
> >    <http://www.apache.org/licenses/LICENSE-2.0>
> >
> > To accommodate license compatibility with the widest possible range
> > of client code licenses, the shared library code, which is linked
> > at runtime into the same address space as the client using it, is
> > licensed under the terms of the "Three-Clause BSD License".
> >
> > The Linux Name Service Switch code, contributed by National ICT
> > Australia Ltd (NICTA) is licensed under the terms of the NICTA Public
> > Software Licence (which is substantially similar to the "Three-Clause
> > BSD License", with some additional language pertaining to Australian l=
aw).
>=20
> Does this also affect other version like the one in Dunfell?

Yes:

build/tmp/work/cortexa57-poky-linux/mdns/878.270.2-r0/mDNSResponder-878.27=
0.2# cat LICENSE=20
The majority of the source code in the mDNSResponder project is licensed
under the terms of the Apache License, Version 2.0, available from:
   <http://www.apache.org/licenses/LICENSE-2.0>

To accommodate license compatibility with the widest possible range
of client code licenses, the shared library code, which is linked
at runtime into the same address space as the client using it, is
licensed under the terms of the "Three-Clause BSD License".

The Linux Name Service Switch code, contributed by National ICT
Australia Ltd (NICTA) is licensed under the terms of the NICTA Public
Software Licence (which is substantially similar to the "Three-Clause
BSD License", with some additional language pertaining to Australian law).

-Mikko

> -armin
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb =
b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
> > index a87b02a78..086b40869 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
> > +++ b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY =3D "Publishes & browses available services on a link accordi=
ng to the Zeroconf / Bonjour protocol"
> >  DESCRIPTION =3D "Bonjour, also known as zero-configuration networking=
, enables automatic discovery of computers, devices, and services on IP net=
works."
> >  HOMEPAGE =3D "http://developer.apple.com/networking/bonjour/"
> > -LICENSE =3D "Apache-2.0"
> > +LICENSE =3D "Apache-2.0 & BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D31c50371921e0fb731003bb=
c665f29bf"
> >  
> >  COMPATIBLE_HOST_libc-musl =3D 'null'
> >
> >
