Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NvbCx-0003Wc-L0
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 19:58:09 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nvb9q-0004j1-B9 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 11:54:54 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 27 Mar 2010 11:54:54 -0700
Received: from 172.30.80.117 ([172.30.80.117]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sat, 27 Mar 2010 18:54:53 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	27 Mar 2010 11:54:50 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269714709.2382.6.camel@gnutoo-desktop>
References: <1269437224.1681.134.camel@rex>
	<ac9c93b11003240815o796152a7y50601b03e91be40@mail.gmail.com>
	<b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>
	<ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>
	<1269467167.1681.169.camel@rex>
	<ac9c93b11003250045t34d59be1v5f64165f0066c7b7@mail.gmail.com>
	<1269714709.2382.6.camel@gnutoo-desktop>
Organization: Mentor Graphics Corporation
Date: Sat, 27 Mar 2010 11:54:50 -0700
Message-ID: <1269716090.23548.28.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 27 Mar 2010 18:54:54.0114 (UTC)
	FILETIME=[FCCBF820:01CACDDE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reproducible builds (Was Re: Checksums in Bitbake)
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
X-List-Received-Date: Sat, 27 Mar 2010 18:58:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-03-27 at 19:31 +0100, GNUtoo wrote:
> On Thu, 2010-03-25 at 08:45 +0100, Frans Meulenbroeks wrote:
> > I've seen too often (also outside OE) that two engineers take the same
> > source yet still get different results, and that bugs at a customer
> > site cannot be reproduced in the lab (and yes, I do know there are
> > other ways to tackle this problem)=20
> Also:
> bitbake optionaldep
> bitbake package
> And:
> bitbake package
>=20
> could result in different binaries/packages due to configure picking
> optionaldep in the first case and not in the second one.
>=20
> Maybe we should start hardcoding --without-optionaldep for all optional
> dependencies that are not in DEPENDS?
>=20
> OR...maybe packaged-staging could save us from that issue?
>=20
> ( http://marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-i=
t-gives/ )

pstaging catches the implicit required deps, but not the implicit
optional deps.  IMHO it would be nice, and I think there's been a
general OK in this direction, to move towards DISTRO_FEATURES (or so?)
toggling --enable-<feature>.  That's what's needed in this particular
case.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


