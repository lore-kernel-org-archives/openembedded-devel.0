Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PPdJa-0002xh-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 16:49:24 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id oB6Fls9e012649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Dec 2010 09:47:54 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id oB6FlsOJ005884
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Dec 2010 09:47:54 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oB6Flsvh008695
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Dec 2010 09:47:54 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Mon, 6 Dec 2010 09:47:54 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Dec 2010 09:47:53 -0600
Thread-Topic: [oe] PREFERRED_PROVIDER and RDEPENDS
Thread-Index: AcuUygbA/4JMxod1QMmgj+jf1OLhuQAkpurg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329CC20E3@dlee06.ent.ti.com>
References: <AANLkTi=hznaSZz6erP3oQF4Ffnw+jxdK=+1hzYK-kusU@mail.gmail.com>
In-Reply-To: <AANLkTi=hznaSZz6erP3oQF4Ffnw+jxdK=+1hzYK-kusU@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PREFERRED_PROVIDER and RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Dec 2010 15:49:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Bj=F6rn Krombholz
> Sent: Sunday, December 05, 2010 4:15 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] PREFERRED_PROVIDER and RDEPENDS
>=20
> qt4-x11-free and qt4-x11-free-gles both provide qt4-x11-free.
>=20
> Setting
>=20
> PREFERRED_PROVIDER_qt4-x11-free =3D "qt4-x11-free-gles"
>=20
> works as expected. When you bitbake qt4-x11-free you will get the -gles
> variant.
>=20
> On the other hand, when bitbaking task-qt4-x11 which RDEPENDS
> on qt4-x11-free it is trying to build qt4-x11-free.bb and not the -gles
> recipe.
>=20
> Is this a general bug? Or would the correct way be adding something like
> RPROVIDES +=3D "virtual/qt4-x11"
> to qt4-x11-free.inc and changing the RDEPENDS to the virtual package?

When I was doing something similar I added the following lines to my recipe=
:

RPROVIDES_${PN} =3D "qt4-embedded"
RPROVIDES_${PN}-dev =3D "qt4-embedded-dev"

This was for an embedded variant but I would image the same holds true for =
x11 (of course with a change to qt4-x11-free, etc)

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


