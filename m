Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Osz3Y-0006u0-3s
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 16:21:54 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o87EL7FA026709
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Sep 2010 09:21:07 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o87EL61O020022
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Sep 2010 09:21:06 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o87EL5dL024619
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Sep 2010 09:21:05 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Tue, 7 Sep 2010 09:21:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Sep 2010 09:21:04 -0500
Thread-Topic: [oe] [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make
	it	global
Thread-Index: ActMChI2fH9cct28Rn2nRwUvrwqhHACjZsfg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
In-Reply-To: <AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it	global
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
X-List-Received-Date: Tue, 07 Sep 2010 14:21:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Saturday, September 04, 2010 3:20 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make
> it global
>=20
> 2010/9/4 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> > 2010/9/4 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>:
> >> add global OVERRIDES ${TARGET_SOC_FAMILY} and
> ${TARGET_ARCH}_${TARGET_SOC_FAMILY}
> >>
> >
> > What is the rationale for this?
> > And why not fix the problem there is in base.bbclass as well.
> >
> > Frans.
> >
> Forgot about this, but a variable should go with documentation.
> This already has been raised with the orginal patch, but was ignored
> by the submitters.

Frans, Are you counting me as one of the original submitters?  I mainly use=
 the SOC_FAMILY, I didn't create it.  That being said, if you have a recomm=
ended section of the usermanual that this should be documented in I'll try =
to add something.

>=20
> Consider this a NAK.
>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


