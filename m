Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P0zdL-0005Mr-Cp
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:35:57 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8TGZfYO013605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 11:35:41 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o8TGZfqx029257
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 11:35:41 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8TGZfd1017546
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 11:35:41 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 29 Sep 2010 11:35:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Sep 2010 11:35:38 -0500
Thread-Topic: [oe] [PATCH] am-benchmarks: update to latest version
Thread-Index: Actf8ukE/x1z4IhkSimgIaEe/Rlr7wAAHehg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310E15EAF@dlee06.ent.ti.com>
References: <1285776294-15073-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinLedQV+-eejzidtYa3P9nHWBCZmBH1CoNp3A0J@mail.gmail.com>
In-Reply-To: <AANLkTinLedQV+-eejzidtYa3P9nHWBCZmBH1CoNp3A0J@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 16:35:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Wednesday, September 29, 2010 11:24 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] am-benchmarks: update to latest version
>=20
> 2010/9/29 Chase Maupin <chasemaupin03@gmail.com>:
> > * Updated the SRCREV to the latest version of this project
> > =A0which includes support for multiple platforms.
> >
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > ---
> > =A0recipes/ti/am-benchmarks_svn.bb | =A0 12 +++++++++---
> > =A01 files changed, 9 insertions(+), 3 deletions(-)
> >
>=20
> Don't have the full recipe handy, but is this latter UNDEFINED needed?
> I would expect a COMPATIBLE_MACHINE somewhere causing the latter never
> to happen.
> Then again it might be a good safeguard.

Frans,

Good point.  In the past there was no difference between arm9 and cortex-a8=
 so we didn't really concern ourselves with COMPATIBLE_MACHINE because the =
code was supposed to be buildable for all of the different machines.  Now w=
e have these different directories containing sources for the different arc=
hitectures.  We could use compatible machine so I could go either way on th=
is.  Let me know if you want me to change this.

>=20
> Frans.
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


