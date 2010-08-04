Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Ogegn-0001Bg-Hp
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:11:27 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o74EBKZq007034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Aug 2010 09:11:21 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o74EBKkC027294
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Aug 2010 09:11:20 -0500 (CDT)
Received: from dlee75.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o74EBK68012782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Aug 2010 09:11:20 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee75.ent.ti.com
	([157.170.170.72]) with mapi; Wed, 4 Aug 2010 09:11:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Aug 2010 09:11:19 -0500
Thread-Topic: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
	COMPATIBLE_MACHINES
Thread-Index: Acszy2730b5kzUXeTQSUvRy+VUTV1QAEq71g
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0802E9149F9B@dlee06.ent.ti.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org>  <20100804052042.GB7085@gmail.com>
	<1280920678.26249.33.camel@saphir>
	<1280922518.2692.377.camel@mill.internal.reciva.com>
In-Reply-To: <1280922518.2692.377.camel@mill.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 14:11:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Wednesday, August 04, 2010 6:49 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
> COMPATIBLE_MACHINES
>=20
> On Wed, 2010-08-04 at 13:17 +0200, Michael 'Mickey' Lauer wrote:
> > FWIW, minimal is using MACHINE_CLASS since quite a while to
> > reduce the need for adding the same files over and over again,
> > this is being used e.g. for HTC msm7 series and OpenEZX series
> > (see conf/machine/include).
> >
> > Perhaps it's time to standardize something like that.
>=20
> Yeah.  I certainly don't think we want a proliferation of such
> mechanisms.  If minimal is already using MACHINE_CLASS then there would
> be some sense in trying to make use of the same thing.

minimal doesn't use MACHINE_CLASS.  Perhaps this is getting confused with d=
istro/micro.conf.

>=20
> My preference would be to make the MACHINEs in question be, for example,
> "motorola-ezx-a1200", "motorola-ezx-a780" and so on.  This would then
> allow you to set COMPATIBLE_MACHINE =3D "motorola-ezx-.*" which I think
> would solve the SOC_FAMILY problem, although it wouldn't replace
> MACHINE_CLASS in OVERRIDES.

Unfortunately we can't change the MACHINE names.  They are set to correspon=
d to the real device names and part numbers.

>=20
> Failing that though, testing COMPATIBLE_MACHINE against MACHINE_CLASS
> probably is more desirable than adding a completely new variable (i.e.
> SOC_FAMILY) for that purpose.

From what I've learned it seems that MACHINE_CLASS and SOC_FAMILY are diffe=
rent in what they are trying to accomplish.

SOC_FAMILY is defining a family of processors and the features that process=
or has.  Whereas MACHINE_CLASS is defining a type of device and its feature=
s which can use different processors.  So basically SOC_FAMILY defines comm=
on processors and MACHINE_CLASS defines common end devices.

This difference is why SOC_FAMILY exists.  We can have many processors that=
 fit into an SOC_FAMILY that can be used across a variety of end applicatio=
ns from DVR to ip net camera to mobile phone.

>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


