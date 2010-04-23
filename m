Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O5O6H-0003Ba-Gi
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 20:59:42 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O5O2m-0005rs-5z from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 11:56:04 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 23 Apr 2010 11:56:03 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 23 Apr 2010 18:56:03 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Apr 2010 11:56:00 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqsprc$no6$1@dough.gmane.org>
References: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>
	<hqrv2b$a7u$1@dough.gmane.org> <1272046053.3865.425.camel@trini-m4400>
	<20100423182217.GB27322@denix.org>  <hqsprc$no6$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Fri, 23 Apr 2010 11:55:59 -0700
Message-ID: <1272048959.3865.478.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Apr 2010 18:56:03.0848 (UTC)
	FILETIME=[9F83C880:01CAE316]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of TARGET_SYS
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
X-List-Received-Date: Fri, 23 Apr 2010 18:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-04-23 at 20:45 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 23-04-10 20:22, Denys Dmytriyenko wrote:
> > On Fri, Apr 23, 2010 at 11:07:33AM -0700, Tom Rini wrote:
> >> On Fri, 2010-04-23 at 13:07 +0200, Koen Kooi wrote:
> > Ping
> >>>
> >>> It's better than what we have today, true.  And SDKPATH already conta=
ins
> >>> DISTRO, which is the likely changer of TOOLCHAIN_*_TASK.  So...
> >>>
> >>> Acked-by: Tom Rini <tom_rini@mentor.com>
> >=20
> >> In general:
> >=20
> >> Acked-by: Denys Dmytriyenko <denis@denix.org>
> >=20
> >> But, should we then create an arch-specific environment-setup scripts =
(e.g.=20
> >> one for armv4 and another for armv7a, as per your example below)?
>=20
> Yes, that needs to be done, as well as seperating the cross tools in
> case different archs need different versions (as is the case with
> angstrom, v5te and v7a need different binutils). This change largely to
> to cosmetically highlight that the toolchain is not really "universal"
> (yet).

And we can talk about if "universal" is really a good goal either.
Taking a bit of a guess in the dark, an SDK with support for all the fun
stuff found on Beagleboard might not be done easily with also having
support for all the fun stuff found on some other ref board too.

I tend to think of these exports as being very board specific, but that
doesn't quite flow with how others think of this stuff, today.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


