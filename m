Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NlaRj-0000RQ-RH
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 05:08:03 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NlaOz-0000mN-V0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 20:05:09 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 27 Feb 2010 20:05:09 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun, 28 Feb 2010 04:04:57 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	27 Feb 2010 21:04:47 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100228033438.GE30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
	<20100228033438.GE30145@xora-desktop.xora.org.uk>
Organization: Mentor Graphics Corporation
Date: Sat, 27 Feb 2010 21:04:47 -0700
Message-ID: <1267329887.9295.20.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 28 Feb 2010 04:05:09.0659 (UTC)
	FILETIME=[380756B0:01CAB82B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sun, 28 Feb 2010 04:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-02-28 at 03:34 +0000, Graeme Gregory wrote:
> On Sat, Feb 27, 2010 at 08:46:47PM +0000, Phil Blundell wrote:
> > On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
> > > NAK on creating extra levels.
> > >=20
> > > Changing the level where recipes are held is not an option do to the =
way
> > > you tell bitbake how to find them.
> > >=20
> > > BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
> >=20
> > Is that really such a big deal?  We seemed to manage to switch BBFILES
> > from /packages/ to /recipes/ without any major casualties, and I would
> > have thought that adding an extra level in there would be equally
> > straightforward.  Or of course, even better, the distro-specific recipe=
s
> > could go in an overlay which the distro config would select.
> >=20
> I have been talking about using overlays for distros at every OE meetup
> since kergoth made it easy to do. So I fully support that idea.

This would also move a bunch of the distro overrides into amend.inc
files in the in-tree distro overlay, just like out of tree users.  This
might help encourage problems to be fixed or better dealt with, perhaps.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


