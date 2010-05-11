Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OBqNq-0005VI-BU
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 16:25:02 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OBqK4-0004TS-1M from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 07:20:36 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 11 May 2010 07:20:27 -0700
Received: from 172.30.80.82 ([172.30.80.82]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 11 May 2010 14:20:26 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	11 May 2010 07:20:25 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimVI9XVOGxamG2PBswtGO1n2X73751GaGvliTY2@mail.gmail.com>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
	<AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
	<1273510041.22943.295.camel@trini-m4400>
	<AANLkTimVI9XVOGxamG2PBswtGO1n2X73751GaGvliTY2@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 11 May 2010 07:20:25 -0700
Message-ID: <1273587625.22943.381.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 11 May 2010 14:20:27.0725 (UTC)
	FILETIME=[1AA727D0:01CAF115]
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
X-List-Received-Date: Tue, 11 May 2010 14:25:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-05-11 at 08:53 +0200, Frans Meulenbroeks wrote:
> 2010/5/10 Tom Rini <tom_rini@mentor.com>:
> > On Mon, 2010-05-10 at 10:40 +0200, Frans Meulenbroeks wrote:
>=20
> >> MACHINE =3D "calamari"
> >> DISTRO =3D "angstrom-2008.1"
> >> ANGSTROMLIBC =3D "eglibc"
> >
> > This should just be LIBC, btw
>=20
> Angstrom has ANGSTROMLIBC
>=20
> From the code (grepping in the conf dir):
> conf/distro/include/angstrom.inc:ANGSTROMLIBC ?=3D "glibc"
> conf/distro/include/angstrom.inc:LIBC ?=3D "${ANGSTROMLIBC}"
>=20
> No idea why we have ANGSTROMLIBC next to LIBC.

Because Angstrom initiated the hook and then I made it generic and made
all of the distros use it.  ANGSTROMLIBC is still there for
compatibility.

> >> # e500v2 supports the SPE instruction set.
> >> TARGET_OS =3D "linux-gnuspe"
> >
> > This should also be picked out automatically, iirc.
>=20
> Hm, It was there in the conf that I got when I took over this project.
> I seem to recall having tried to build without it, and that it failed,
> but it is a while ago, so not 100% sure about that.

Well, more accurately, sane-toolchain.inc has a function to get
TARGET_OS right and I assume angstrom is either using it or has a
similar one.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


