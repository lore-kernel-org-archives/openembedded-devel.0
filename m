Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OCzBA-0001EJ-Ft
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 20:00:10 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OCz7K-0007MY-T6 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 10:56:10 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 14 May 2010 10:56:10 -0700
Received: from 172.30.80.61 ([172.30.80.61]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 14 May 2010 17:56:08 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	14 May 2010 10:56:04 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Fri, 14 May 2010 10:55:46 -0700
Message-ID: <1273859746.22943.454.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 14 May 2010 17:56:10.0344 (UTC)
	FILETIME=[BC4B5680:01CAF38E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Fri, 14 May 2010 18:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-05-14 at 19:47 +0200, Andrea Adami wrote:
> On Sat, May 8, 2010 at 1:12 PM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
> > PARALLEL_MAKE =3D "-j5"
> > #BB_NUMBER_THREADS =3D "4"
> > BB_NUMBER_THREADS =3D "2"
> >
> > fixed the things. This time the dependencies were (correctly) built bef=
ore...
> >
> > Andrea
> >
>=20
> I repeated the build of console-image and gtk+-native always fails
> using 4 threads.
> Anyone can confirm?

With DISTRO=3D ?  I do most of my builds with 4 and haven't seen this.
But with a failure log on gtk+-native, figuring out the missing dep
shouldn't be too bad.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


