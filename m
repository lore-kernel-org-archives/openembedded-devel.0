Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OA7AR-0000RY-DT
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 21:55:44 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OA76i-0006Bn-V6 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:51:41 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 6 May 2010 12:51:40 -0700
Received: from 172.30.80.24 ([172.30.80.24]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  6 May 2010 19:51:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	06 May 2010 12:51:36 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <s2vac9c93b11005061143mab3462f4sb14fd57dfe197707@mail.gmail.com>
References: <m2pac9c93b11005060635j1abeb64er76c391d607e43993@mail.gmail.com>
	<v2n141020e31005061031ub521d900vf405fe9c6e682e7f@mail.gmail.com>
	<s2vac9c93b11005061143mab3462f4sb14fd57dfe197707@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Thu, 06 May 2010 12:51:24 -0700
Message-ID: <1273175484.457.293.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 06 May 2010 19:51:40.0513 (UTC)
	FILETIME=[8BB13510:01CAED55]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4134f55dc7d99516d750b24a60e5cec400ae5ef3: eglibc: Move away from legacy staging
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
X-List-Received-Date: Thu, 06 May 2010 19:55:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-05-06 at 20:43 +0200, Frans Meulenbroeks wrote:
> 2010/5/6 Martin Jansa <martin.jansa@gmail.com>:
> > On Thu, May 6, 2010 at 3:35 PM, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> >> I feel the above commit is not sound.
> >> If I pull the head eglibc does not build for me because apparently
> >> eglibc-initial does not stage limits.h any more.
> >> If I revert to the commit before this one, eglibc and eglibc-initial
> >> build, so this seems to break things.
> >>
> >> It might be that this went unnoticed, because there is no PR bump in
> >> this commit (which I would have expected, but technically if the new
> >> and old staging result is identical is not necessary).
> >
> > Hi,
> >
> > What version are you trying to build?
> > Today I've built version 2.11 before this patch as well as after this p=
atch.
> > Both during rebuild from scratch and both after RP's WIP branch merge.
>=20
> I'm trying to build 2.10; distro is angstrom, machine is calamari
> (which is a powerpc).

I'm getting ready to report my results, but calamari and mpc8313e-rdb
both fail, before and after the changes.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


