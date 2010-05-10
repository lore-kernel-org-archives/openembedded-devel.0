Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OBWCK-0000Pp-D8
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 18:51:17 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OBW8Z-0003ut-FC from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 09:47:23 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 10 May 2010 09:47:22 -0700
Received: from 172.30.80.82 ([172.30.80.82]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 10 May 2010 16:47:22 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 May 2010 09:47:21 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
	<AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Mon, 10 May 2010 09:47:21 -0700
Message-ID: <1273510041.22943.295.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 May 2010 16:47:22.0893 (UTC)
	FILETIME=[767D4BD0:01CAF060]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Mon, 10 May 2010 16:51:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-05-10 at 10:40 +0200, Frans Meulenbroeks wrote:
> 2010/5/9 Tom Rini <tom_rini@mentor.com>:
> > On Sat, 2010-05-08 at 08:11 -0700, Tom Rini wrote:
> >> On Sat, 2010-05-08 at 09:06 +0200, Frans Meulenbroeks wrote:
> >> > 2010/5/7 Tom Rini <tom_rini@mentor.com>:
> >> > > Hey all,
> >> > >
> >> > > With DISTRO=3Dminimal and MACHINE=3Dcalamari, I see the following =
failure in
> >> > > gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
> >> > > http://pastebin.com/cjAStcLb and I confirmed this prior to the RP =
merge,
> >> > > so this is unrelated.
> >> >
> >> > Which eglibc is that?
> >> > The issues I had seemed due to some catch22 situation that I cured; =
I
> >> > started a clean build yesterday before I left work & can tell the
> >> > results on monday.
> >> > My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
> >> > minimal also using 2.10 or is it at 2.11
> >> >
> >> > I can also try to kick off a minimal build on monday
> >>
> >> minimal is eglibc 2.10.  I'll try an Angstrom build.
> >
> > With Angstrom, gcc-cross-initial fails building libgcc, config.log has:
> > cc1: error: not configured for ABI: 'spe'
> > configure:2591: $? =3D 1
> > configure: failed program was:
> > ... standard empty program ...
> > configure:2605: error: cannot compute suffix of object files: cannot
> > compile
> >
> > Ubuntu 9.10 x86_64 host
> >
>=20
> I made a mistake when doing the clean build, and kicked it off again.
> I don't think I saw your error.
> In  my local.conf I have:
>=20
> MACHINE =3D "calamari"
> DISTRO =3D "angstrom-2008.1"
> ANGSTROMLIBC =3D "eglibc"

This should just be LIBC, btw.

> # e500v2 supports the SPE instruction set.
> TARGET_OS =3D "linux-gnuspe"

This should also be picked out automatically, iirc.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


