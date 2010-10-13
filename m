Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P66FY-0001tY-JY
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 20:40:30 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9DIdtxn024198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 13 Oct 2010 13:39:55 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9DIdscn012119;
	Wed, 13 Oct 2010 13:39:54 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9DIdsiM012652;
	Wed, 13 Oct 2010 13:39:54 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Wed, 13 Oct 2010 13:39:54 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Oct 2010 13:39:53 -0500
Thread-Topic: [oe] [PATCH 1/5] matrix-gui-common: skip qa check on prebuilt
	binaries
Thread-Index: Actq9+fQN+1g662TS+2tbRnR4PokigADfmcw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA7DE@dlee06.ent.ti.com>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
	<20101013165840.GA11514@denix.org>
In-Reply-To: <20101013165840.GA11514@denix.org>
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
Subject: Re: [PATCH 1/5] matrix-gui-common: skip qa check on prebuilt	binaries
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
X-List-Received-Date: Wed, 13 Oct 2010 18:40:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable





> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Wednesday, October 13, 2010 11:59 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [PATCH 1/5] matrix-gui-common: skip qa check on prebuil=
t
> binaries
>=20
> On Wed, Oct 13, 2010 at 09:01:27AM -0500, Chase Maupin wrote:
> > * Skip the QA check on the prebuilt binaries used for dm365
> >   devices.
>=20
> And why do we have prebuilt binaries in OE?

They are not so much in the OE repository as they are part of the matrix re=
pository.  That being said I'm working to get these buildable in OE and I'l=
l make this an RDEPENDS.  So go ahead and ignore this patch.

>=20
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes/ti/matrix-gui-common.inc |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-
> common.inc
> > index 096c321..46c0bd6 100644
> > --- a/recipes/ti/matrix-gui-common.inc
> > +++ b/recipes/ti/matrix-gui-common.inc
> > @@ -32,4 +32,7 @@ do_install() {
> >
> >  }
> >
> > +# Skip the QA for pre-built binaries
> > +INSANE_SKIP_${PN}_dm365 =3D "True"
> > +
> >  FILES_${PN} +=3D "${datadir}/matrix/*"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


