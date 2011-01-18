Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PfFYm-0000aR-07
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 18:41:36 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p0IHeuOi024650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 11:40:56 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id p0IHetsO013895
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 11:40:55 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p0IHet2t026380
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 11:40:55 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Tue, 18 Jan 2011 11:40:55 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jan 2011 11:40:54 -0600
Thread-Topic: [oe] Bulding multiple U-Boot configs for one machine
Thread-Index: Acu2lK30a9LeKCvXQauBLgDRRl67sAAoffmg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08032A0AF697@dlee06.ent.ti.com>
References: <4D34BD0A.3010206@atmel.com> <4D34BFB2.6030605@mentor.com>
In-Reply-To: <4D34BFB2.6030605@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Bulding multiple U-Boot configs for one machine
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
X-List-Received-Date: Tue, 18 Jan 2011 17:41:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Monday, January 17, 2011 4:16 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Bulding multiple U-Boot configs for one machine
>=20
> On 01/17/2011 03:04 PM, Ulf Samuelsson wrote:
> > Managed to get some time over and checked in a recipe
> > for u-boot-2010.12 which builds all u-boot configs
> > specified in the UBOOT_MACHINES (note "S" at the end)
> >
> > The frecipe is available in a private branch:
> > "ulf/linux-2.6.30-2011-01-16" (or similar).
> >
> > There is a SAM9M10 machine checked in as well as a test case.
> > grep for UBOOT_MACHINES in the conf/machine directory to find out which=
.
> >
> > Note that
> > UBOOT_MACHINE =3D "at91sam9m10g45ek_config"
> >
> > but
> >
> > UBOOT_MACHINES =3D "at91sam9m10g45ek_dataflash at91sam9m10g45ek_sd"
> >
> > I.E: No "_config" in the list.
> >
> > The goal of the new branch is to test booting from an SD-Card
> > without any other flash in the system.
> > Have tested this outside openembedded so far, but
> > the current branch is still to be tested on a board.
>=20
> I can see a number of other use cases for this type of functionality so
> +1 on the concept from me.

Agreed.  Would love to see a patch for this because the concept is good.

>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


