Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PIV1O-0003Sx-Hy
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:33:08 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id oAGNW0VT022229
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 17:32:00 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id oAGNVxU3005520
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 17:32:00 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oAGNVx8e012228
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 17:31:59 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 16 Nov 2010 17:31:59 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Nov 2010 17:31:58 -0600
Thread-Topic: [oe] [PATCH v2] TI tools - make EULA unpack work when /opt is
	writeable
Thread-Index: Act9vJ+MkN3fCW+lShWG672pLAbqxQH7dk7g
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803112C1A7E@dlee06.ent.ti.com>
References: <4C78D1E1.9080101@mlbassoc.com> <4CB081A4.9010908@mlbassoc.com>
	<20101106141118.GG6691@excalibur.local>
In-Reply-To: <20101106141118.GG6691@excalibur.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Tue, 16 Nov 2010 23:33:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Stefan Schmidt
> Sent: Saturday, November 06, 2010 9:11 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH v2] TI tools - make EULA unpack work when /opt i=
s
> writeable
>=20
> Hello.
>=20
> On Sat, 2010-10-09 at 08:52, Gary Thomas wrote:
> > On 08/28/2010 03:07 AM, Gary Thomas wrote:
> > >This patch addresses the problem where the TI tools that need
> > >the EULA unpack into the wrong place if the user has write
> > >permission in /opt. The current behaviour of expecting the
> > >unpacker to fall back to the $HOME environment variable should
> > >not be relied on. The patch changes the unpack step to use
> > >the --prefix=3D option which will always work.
> > >
> > >Version 2:
> > >* Update patch to be against org.openembedded.dev branch
> > >* Incorporate full description into patch
> >
> > What about this patch?  It's been nearly 6 weeks and no discussion
> > or anything.
> >
> > The problem persists in today's tree.
>=20
> Can we have a comment form the TI devs here?

This looks OK to me.  Only comment I have is whether the '/' is needed in t=
he following line with the TI_BIN_UNPK_WDEXT option already add a '/'.  I g=
uess while not technically necessary it would keep this code working if som=
eone didn't define TI_BIN_UNPK_WDEXT with a leading '/'.

wdext =3D workdir + '/' + wdext

Sorry for the previous lack of response.  Thank you for the patch and fixin=
g this issue.

>=20
> regards
> Stefan Schmidt
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


