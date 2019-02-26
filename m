Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A10C7C72F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F1791184F3;
	Tue, 26 Feb 2019 18:39:28 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TDcYq8U_nYnt; Tue, 26 Feb 2019 18:39:28 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 20B7918408;
	Tue, 26 Feb 2019 18:39:28 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10D231A075;
	Tue, 26 Feb 2019 18:39:28 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 056751A072;
	Tue, 26 Feb 2019 18:39:28 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 26 Feb 2019 18:39:27 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id EDD5576A;
	Tue, 26 Feb 2019 18:39:27 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 26 Feb 2019 18:39:27 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 26 Feb 2019 18:39:27 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 26 Feb 2019 18:39:27 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to	include
	meta-python
Thread-Index: AQHUytsmvhTEhQQ+d0WjpcIRxV7y+aXyXW8w
Date: Tue, 26 Feb 2019 17:39:27 +0000
Message-ID: <870da333acd14eaab709707238e1ac7d@XBOX04.axis.com>
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
	<20190222172949.3661-2-nicolas.dechesne@linaro.org>
	<CAMKF1sqPdBOQSq8Aejj5ji_yOGk3qPU_n8C_TqzEou4H0kuKpw@mail.gmail.com>
In-Reply-To: <CAMKF1sqPdBOQSq8Aejj5ji_yOGk3qPU_n8C_TqzEou4H0kuKpw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to	include meta-python
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
X-List-Received-Date: Tue, 26 Feb 2019 17:39:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 22 februari 2019 19:19
> To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to
> include meta-python
>=20
> On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > meta-oe depends on meta-python, for mongodb recipe, since
> > 5cf9a144ad16 (mongodb: Upgrade to 4.0.1 release)
> >
>=20
> The dependency was always there, but I wonder if there is a better
> place for mongodb than meta-oe

Can we please revert this? Making meta-oe depend on meta-python=20
is not the right thing to do. Either move mongodb to another layer=20
that already depends on meta-python or where it is fine to do so,=20
or move python-cheetah to meta-oe. The latter seems like the easier=20
choice.

//Peter


