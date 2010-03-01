Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmDRN-0001wy-M7
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:46:18 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmDOc-0002KI-TJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 13:43:22 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 13:43:22 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Mar 2010 21:43:20 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 14:43:20 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a91003011337m5870f0c2w7bc347f0ffe2c06e@mail.gmail.com>
References: <E1NlqMw-0004yw-KS@melo.openembedded.org>
	<1267396888.9295.30.camel@trini-m4400> <hmfqnd$7an$1@dough.gmane.org>
	<19c1b8a91003011337m5870f0c2w7bc347f0ffe2c06e@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 14:43:20 -0700
Message-ID: <1267479800.4739.271.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Mar 2010 21:43:22.0355 (UTC)
	FILETIME=[3709A430:01CAB988]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graeme Gregory : firefox_3.6.bb : add new version, convert to new staging
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
X-List-Received-Date: Mon, 01 Mar 2010 21:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-03-01 at 13:37 -0800, Khem Raj wrote:
> On Sun, Feb 28, 2010 at 11:35 PM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 28-02-10 23:41, Tom Rini wrote:
> >> On Sun, 2010-02-28 at 21:08 +0000, git version control wrote:
> >>> Module: openembedded.git
> >>> Branch: org.openembedded.dev
> >>> Commit: 0ca0394c94028b941603b2d6f7264d3eaaed5a98
> >>> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D0ca0394c94028b941603b2d6f7264d3eaaed5a98
> >>>
> >>> Author: Graeme Gregory <dp@xora.org.uk>
> >>> Date:   Sun Feb 28 21:07:28 2010 +0000
> >>>
> >>> firefox_3.6.bb : add new version, convert to new staging
> >>
> >> Do we still honestly need PARALLEL_MAKE =3D "" ?
> >>
> >
> > The firefox hg version I tested in december still needed it, haven't
> > tried 3.6.
>=20
> >From Firefox FAQ
>=20
> you have to add the -j option to .mozconfig file like this
> mk_add_options MOZ_MAKE_FLAGS=3D-jN
>=20
>=20
> Parallel building with -j4 and -j8 seems to work well.

Since you've tested it, patch please? :)

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


