Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OBWBL-00088R-4g
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 18:50:36 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OBW7Z-0003kP-Q4 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 09:46:21 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 10 May 2010 09:46:21 -0700
Received: from 172.30.80.82 ([172.30.80.82]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 10 May 2010 16:46:20 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 May 2010 09:46:20 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hs8gds$jel$1@dough.gmane.org>
References: <4BE185C7.50305@dresearch.de>
	<1273140949-14699-1-git-send-email-sledz@dresearch.de>
	<hru6f7$4qk$1@dough.gmane.org>	<4BE29E46.2000600@dresearch.de>
	<4BE3BA38.1010102@dresearch.de>	<hs0f5k$sl$1@dough.gmane.org>
	<4BE3C2B1.5040307@dresearch.de> <4BE7B795.1010607@dresearch.de>
	<hs8gds$jel$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Mon, 10 May 2010 09:46:19 -0700
Message-ID: <1273509979.22943.294.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 May 2010 16:46:21.0238 (UTC)
	FILETIME=[51BD7D60:01CAF060]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Mon, 10 May 2010 16:50:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-05-10 at 10:34 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 10-05-10 09:36, Steffen Sledz wrote:
> >>>>>  #This is unrelated to the kernel version, but userspace apps (e.g.=
 HAL) require a recent version to build against
> >>>>> -PREFERRED_VERSION_linux-libc-headers 	=3D "2.6.31"
> >>>>> +PREFERRED_VERSION_linux-libc-headers       ?=3D "2.6.31"
> >>>>> +PREFERRED_VERSION_linux-libc-headers_hipox ?=3D "2.6.24"
> >>>>
> >>>> NACK, that creates undefined behaviour for multimachine builds.
> >>
> >>> -PREFERRED_VERSION_linux-libc-headers 	=3D "2.6.31"
> >>> +PREFERRED_VERSION_linux-libc-headers       =3D "2.6.31"
> >>> +PREFERRED_VERSION_linux-libc-headers_hipox =3D "2.6.24"
> >>
> >>> Is this better?
> >>
> >> No, it still changes the headers for one machine, which leads to
> >> undefined behaviour for other machines using the same arch.
> >> Any solution that doesn't mark *all* packages as machine specific for
> >> hipox is going to cause that behaviour.
> >=20
> > Would be a
> >=20
> > -PREFERRED_VERSION_linux-libc-headers 	=3D "2.6.31"
> > +PREFERRED_VERSION_linux-libc-headers  ?=3D "2.6.31"
> >=20
> > acceptable to allow overwrites in local.conf?
>=20
> This comes up about every month (search the archives) and the answer
> remains the same: no
> This will introduce the same undefined behaviour that was pointed out
> earlier.

Perhaps the fact that this comes up once a month means the Angstrom
folks may want to think about how to have a very clear to the user not
compatible with the main feeds and so on custom distribution, but that
doesn't start out with cp conf/distro/angstrom-2008.1.conf
conf/distro/mystrom.conf ?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


