Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nl6B2-0007Vy-Ct
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:48:48 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nl68J-0007nW-Ul from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 11:45:55 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 26 Feb 2010 11:45:55 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 26 Feb 2010 19:45:53 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	26 Feb 2010 12:45:49 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hm97ae$bvo$2@dough.gmane.org>
References: <4B87B283.20009@atmel.com> <hm8ggf$j65$1@dough.gmane.org>
	<1267209944.18176.575.camel@trini-m4400> <hm97ae$bvo$2@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Fri, 26 Feb 2010 12:45:49 -0700
Message-ID: <1267213549.31262.1.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 26 Feb 2010 19:45:55.0415 (UTC)
	FILETIME=[4F7EAE70:01CAB71C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC; Building multiple u-boot images for a single board
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
X-List-Received-Date: Fri, 26 Feb 2010 19:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-02-26 at 20:27 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 26-02-10 19:45, Tom Rini wrote:
> > On Fri, 2010-02-26 at 13:57 +0100, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 26-02-10 12:37, Ulf Samuelsson wrote:
> >>> If you want to support multiple boot memories, you have to
> >>> have multiple boards in the conf/machine directory
> >>>
> >>> I currently testing a change to at91bootstrap, where a defconfig
> >>> is not provided by openembedded.
> >>> Instead you provide a list of defconfig's in your machine description=
:
> >>>
> >>> I.E: in conf/machien/at91sam9g45ek.conf you have:
> >>>
> >>> AT91BOOTSTRAP_BOARD =3D "at91sam9g45df at91sam9g45ek at91sam9g45nf"
> >>>
> >>> when at91bootstrap is built it will loop through all the boards.
> >>> and build three versions.
> >>>
> >>> I think it would make sense to do the same for u-boot,
> >>> so that you can build u-boot for several configurations.
> >>
> >> Not about u-boot, but slightly related:
> >>
> >> I need something similar for uImages due to hardware limitations
> >> (daughtercards requiring conflicting pinmux) and I have created this f=
or
> >> kernel builds:
> >>
> >> http://dominion.thruhere.net/git/cgit.cgi/openembedded/tree/recipes/li=
nux/multi-kernel.inc?h=3Dti/staging
> >>
> >> It's working nicely for my usecase (validate hardware configs with
> >> multiple kernels, validate software with only one kernel).
> >=20
> > That indeed looks useful.  Any chance it'll go in soon?  Or what's left
> > to cleanup before it can?  Aside from some shellfile for pstaging that
> > is.
>=20
> The goal is "next wednesday" provided the tests on monday/tuesday pass,
> but see Denys' respone about shellfile assumptions.

Yeah, DEPLOY_DIR outside of TMPDIR needs some special thought.
DEPLOY_DIR_PSTAGING outside of TMPDIR is fine, happily.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


