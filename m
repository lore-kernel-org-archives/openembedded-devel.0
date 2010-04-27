Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O6pQ5-0006Oh-9a
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 20:22:20 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O6pMV-0006Zo-R0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 11:18:23 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 27 Apr 2010 11:18:23 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 27 Apr 2010 18:18:23 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	27 Apr 2010 11:18:15 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100426180357.GB22763@denix.org>
References: <hqrv2b$a7u$1@dough.gmane.org>
	<1272046053.3865.425.camel@trini-m4400>
	<20100423182217.GB27322@denix.org>
	<hqsprc$no6$1@dough.gmane.org> <1272048959.3865.478.camel@trini-m4400>
	<hqt003$fvd$1@dough.gmane.org> <20100423205439.GC27322@denix.org>
	<1272058993.3865.531.camel@trini-m4400>
	<20100424170705.GB10320@denix.org>
	<1272135069.3865.539.camel@trini-m4400>
	<20100426180357.GB22763@denix.org>
Organization: Mentor Graphics Corporation
Date: Tue, 27 Apr 2010 11:18:14 -0700
Message-ID: <1272392294.3865.571.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 27 Apr 2010 18:18:23.0242 (UTC)
	FILETIME=[05BDAEA0:01CAE636]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
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
X-List-Received-Date: Tue, 27 Apr 2010 18:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-04-26 at 14:03 -0400, Denys Dmytriyenko wrote:
> On Sat, Apr 24, 2010 at 11:51:09AM -0700, Tom Rini wrote:
[snip]=20
> > Right.  I'm saying that SDKPATH should be more than /usr/local/${DISTRO=
}
> > but /usr/local/${DISTRO}/${MACHINE} by default, toss a comment above
> > about why (output is very MACHINE specific in certain cases) and maybe
> > update the default TOOLCHAIN_OUTPUTNAME too.
>=20
> Ok, you asked for a comment, I'll give you two :)
>=20
> 1. In Arago I have a way to overwrite SDKPATH from the command line when=20
> building a specific SDK/toolchain. So, I can do what you suggest, but...
>=20
> 2. My SDKs are currently not machine-specific, moreover, they don't have =
the=20
> cross-compile tools in them (i.e. no toolchain part), as Arago uses exter=
nal=20
> CodeSourcery toolchain for that. The only cross-tools I have in my SDKs a=
re=20
> those, which are missing from CS - i.e. libtool, pkgconfig, opkg, qt4e-to=
ols=20
> etc. But I still build 2 versions of SDK - armv5te and armv7a.

I'd make a very small wager that you're unknowningly wrong about #2 or a
someone adding an RRECOMMENDS/RDEPENDS_mach somewhere (or using another
machine you haven't tried yet) from machine specific stuff leaking in
and being wrong :)

It's not the gcc & co that you get from CodeSourcery or our -sdk recipes
or whatever that makes this machine-specific but the conditional
inclusion of some userland bits (be it "small" "regular" Linux stuff or
"small" stuff for FPGAs or whatever on a particular ref board).  Or even
PACKAGE_ARCH=3DMACHINE stuff already being in there, again without you
knowning (some of which can be rather easily pulled out with that
removal hook you added).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


