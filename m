Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P8BTG-0001XV-Hc
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 14:39:16 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9JCcd0x020849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 07:38:39 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9JCccD0018510
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 07:38:38 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9JCccVQ012681
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 07:38:38 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 19 Oct 2010 07:38:38 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Oct 2010 07:38:37 -0500
Thread-Topic: [oe] [PATCH] qt4: replace underscore with dash in library name
Thread-Index: Actu4Zaou8WjBn/bT7eYBmln3SBvfwAp75Qg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B2FC8@dlee06.ent.ti.com>
References: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>
	<4CBC5C00.2070200@freyther.de>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAE94@dlee06.ent.ti.com>
	<4CBC73DF.6080302@freyther.de>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAF0B@dlee06.ent.ti.com>
	<4CBC7592.80807@freyther.de>
In-Reply-To: <4CBC7592.80807@freyther.de>
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
Subject: Re: [PATCH] qt4: replace underscore with dash in library name
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
X-List-Received-Date: Tue, 19 Oct 2010 12:39:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Holger Freyther
> Sent: Monday, October 18, 2010 11:28 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] qt4: replace underscore with dash in library
> name
>=20
> On 10/18/2010 06:24 PM, Maupin, Chase wrote:
>=20
> >> Why do you need to patch Qt? :)
> >
> > This library allows Qt to use the NEON processor on our Cortex-A8 for
> bitblit operations.  Currently this recipe is being carried in our overla=
y
> but will be moved to the OE mainline once we have all the licensing worke=
d
> out.
>=20
>=20
> Interesting, I worked on the raster engine in the 4.7 release cycle, did
> some
> neon code as well. Samuel has done his version from scratch and integrate=
d
> it.
>=20
> Is that handwritten neon code or using gcc mnemonics? How does it compare
> to
> what is in 4.7? Qt 4.7 can use ARM NEON even for string compares and othe=
r
> parts of libQtCore.

This is something a third party did for us.  I don't know all the details b=
ehind the library, but I do know that there is a patch to Qt to enable it t=
o use our library instead of it's normal routines (this is for 4.6.2).

>=20
>=20
> PS: Do you need someone to integrate your patch?

The patch to Qt is to use our library.  I'd be happy to share the patch to =
Qt if you are interested, but I don't think it is very useful generically s=
ince the licensing of our library says it is only to be used on TI devices =
(A third party license restriction).  Thanks for the offer though.

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


