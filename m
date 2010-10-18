Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P7rEM-0006Zs-7I
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 17:02:31 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9IF1tAj013354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:01:55 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9IF1tRP006798
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:01:55 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9IF1twC007623
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:01:55 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 18 Oct 2010 10:01:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Oct 2010 10:01:54 -0500
Thread-Topic: [oe] [PATCH] qt4: replace underscore with dash in library name
Thread-Index: Actu0l0BzyEslaXeQOOLT/E6C/PWDQAAs63w
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFAE94@dlee06.ent.ti.com>
References: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>
	<4CBC5C00.2070200@freyther.de>
In-Reply-To: <4CBC5C00.2070200@freyther.de>
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
X-List-Received-Date: Mon, 18 Oct 2010 15:02:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Holger Freyther
> Sent: Monday, October 18, 2010 9:39 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] qt4: replace underscore with dash in library
> name
>=20
> On 10/12/2010 03:25 PM, Chase Maupin wrote:
> > * For libraries that are added to the QT_LIB_NAMES or
> >   QT_EXTRA_LIBS variables replace any "_" characters in the
> >   library name with "-" for use in the package name.
> > * The actual library file names are left alone.
> > * Bump the PR for packages using qt4.inc
>=20
> Which library is that? OpenVG? PowerVR related things? In general it look=
s
> fine.

In this case it is another library named TICPUBLT_BX which helped me find t=
his issue.  So in my recipe I am adding:

QT_EXTRA_LIBS +=3D "TICPUBLT_BX"

>=20
> Acked-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


