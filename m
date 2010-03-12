Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nq6eP-0006Mz-Sv
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 16:19:48 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nq6bV-00038R-01 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 07:16:45 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 12 Mar 2010 07:16:44 -0800
Received: from 172.30.80.6 ([172.30.80.6]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 12 Mar 2010 15:16:00 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	12 Mar 2010 08:15:55 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B9A2226.7010208@ge.com>
References: <20100311131340.20219.23563.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268323892.16526.281.camel@trini-m4400>  <4B9A2226.7010208@ge.com>
Organization: Mentor Graphics Corporation
Date: Fri, 12 Mar 2010 08:15:55 -0700
Message-ID: <1268406955.15150.3.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 12 Mar 2010 15:16:44.0614 (UTC)
	FILETIME=[06A68660:01CAC1F7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale mpc8641_hpcn demo board
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
X-List-Received-Date: Fri, 12 Mar 2010 15:19:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-03-12 at 11:14 +0000, Martyn Welch wrote:
> Tom Rini wrote:
> > On Thu, 2010-03-11 at 13:13 +0000, Martyn Welch wrote:
> >  =20
> >> A demo board from Freescale, based on the MPC8641D Freescale SOC.
> >> ---
> >>
> >>  conf/machine/mpc8641-hpcn.conf                    |   23=20
> >>    =20
> >
> > I don't see this bringing in a tune file.  I have to admit I forget
> > off-hand what mpc86xx maps into, but I'm sure there's some -mcpu for it
> > (or will be), and there's always the package arch stuff).
> >  =20
> It's an e600 core. None of the current tuning files particularly sprang
> out at me. I'm open for suggestions, how important is it?

Time to create one.  I suppose we're in luck since e600 is the new name
for 74xx + altivec so the gcc flags are easy enough :)

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


