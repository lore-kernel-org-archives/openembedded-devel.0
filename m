Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4A41785D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Feb 2018 17:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 32A3618946;
	Fri,  9 Feb 2018 18:30:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iQceajXAL6DX; Fri,  9 Feb 2018 18:30:00 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0EFC018446;
	Fri,  9 Feb 2018 18:30:00 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE5E41A069;
	Fri,  9 Feb 2018 18:29:59 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1C191A061;
	Fri,  9 Feb 2018 18:29:59 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri,  9 Feb 2018 18:29:59 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id D5505311;
	Fri,  9 Feb 2018 18:29:59 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 9 Feb 2018 18:29:59 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 9 Feb 2018 18:29:59 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 9 Feb 2018 18:29:59 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "pidge@toganlabs.com" <pidge@toganlabs.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [RFC] Using OE with Fossology.
Thread-Index: AQHToPjHDc1lbc8yH0C3jL4/C3T7i6OcU87A
Date: Fri, 9 Feb 2018 17:29:59 +0000
Message-ID: <f51cf26bd4424c64953d3f6590289180@XBOX02.axis.com>
References: <014bfa20-b9c7-9a23-4fc7-ac515a3c3452@toganlabs.com>
In-Reply-To: <014bfa20-b9c7-9a23-4fc7-ac515a3c3452@toganlabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [RFC] Using OE with Fossology.
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
X-List-Received-Date: Fri, 09 Feb 2018 17:30:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Beth 'pidge' Flanagan
> Sent: den 8 februari 2018 17:21
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [RFC] Using OE with Fossology.
>=20
> All,
>=20
> I wanted to make folks aware that we've released a new layer to do
> automated fossology runs within OE. The old spdx.bbclass is bitrot and
> we needed something to make some of our license clearance and tracking
> easier to manage.
>=20
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-licens=
e-tools/
>=20
> This layer takes patched archives created by the source archiver during
> the build and, using a utility we wrote called fossup, sends them on to
> a fossology instance for out of build scanning.
>=20
> The impact on build times is relatively small. If you want to use it,
> you'll need to install fossup (https://gitlab.com/toganlabs/fossup), set

Any particular reason you don't provide a recipe for fossup in the=20
layer so you can avoid having to install it manually?

> up the fossup rc file to point to your fossology instance (all of this
> is in the README), and ensure that the bits needed for an archiver build
> are included in your local.conf
>=20
> Typically this will look like the following:
>=20
> INHERIT +=3D "archiver"
> ARCHIVER_MODE[src] =3D "patched"
> ARCHIVER_MODE[diff] =3D "0"
> ARCHIVER_MODE[dumpdata] =3D "0"
> ARCHIVER_MODE[recipe] =3D "1"
> COPYLEFT_LICENSE_INCLUDE =3D 'GPL* LGPL*'
> COPYLEFT_LICENSE_EXCLUDE =3D 'CLOSED Proprietary'
> COPYLEFT_RECIPE_TYPES =3D 'target'
> INHERIT +=3D "fossology"
>=20
> Feedback welcome of course.
>=20
> -b
>=20
> ----
> Beth 'pidge' Flanagan
> pidge@toganlabs.com

//Peter


