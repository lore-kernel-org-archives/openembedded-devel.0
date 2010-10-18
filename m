Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P7sW8-0005Pa-3U
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 18:24:57 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9IGOL7A027357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:24:21 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9IGOLHf024778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:24:21 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9IGOLhT000274
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:24:21 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Mon, 18 Oct 2010 11:24:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Oct 2010 11:24:20 -0500
Thread-Topic: [oe] [PATCH] qt4: replace underscore with dash in library name
Thread-Index: Actu4KSlqF8JmnyyTkylCzT7aMzbGgAABpCw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFAF0B@dlee06.ent.ti.com>
References: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>
	<4CBC5C00.2070200@freyther.de>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAE94@dlee06.ent.ti.com>
	<4CBC73DF.6080302@freyther.de>
In-Reply-To: <4CBC73DF.6080302@freyther.de>
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
X-List-Received-Date: Mon, 18 Oct 2010 16:24:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Holger Freyther
> Sent: Monday, October 18, 2010 11:21 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] qt4: replace underscore with dash in library
> name
>=20
> On 10/18/2010 05:01 PM, Maupin, Chase wrote:
>=20
> > In this case it is another library named TICPUBLT_BX which helped me
> find this issue.  So in my recipe I am adding:
> >
> > QT_EXTRA_LIBS +=3D "TICPUBLT_BX"
>=20
> Why do you need to patch Qt? :)

This library allows Qt to use the NEON processor on our Cortex-A8 for bitbl=
it operations.  Currently this recipe is being carried in our overlay but w=
ill be moved to the OE mainline once we have all the licensing worked out.

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


