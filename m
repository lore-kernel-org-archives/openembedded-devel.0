Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NBUyT-0008Ms-F2
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 16:00:40 +0100
Received: from [192.168.1.150] (e180135046.adsl.alicedsl.de [85.180.135.46])
	by drlauer-research.com (Postfix) with ESMTP id 05A25584110
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 16:45:53 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091120144644.76921a30@xora.org.uk>
References: <he689r$c57$1@ger.gmane.org> <4B06A6A7.1080204@SSpaeth.de>
	<200911201531.00181.marcin@juszkiewicz.com.pl>
	<1258727981.13348.7.camel@opal> <20091120144644.76921a30@xora.org.uk>
Organization: Vanille-Media
Date: Fri, 20 Nov 2009 15:59:12 +0100
Message-ID: <1258729152.13348.19.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Fri, 20 Nov 2009 15:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 20.11.2009, 14:46 +0000 schrieb Graeme Gregory:
> On Fri, 20 Nov 2009 15:39:41 +0100
> Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
>=20
> > Am Freitag, den 20.11.2009, 15:30 +0100 schrieb Marcin Juszkiewicz:
> > > Dnia pi=C4=85tek, 20 listopada 2009 o 15:24:39 Sebastian Spaeth
> > > napisa=C5=82(a):
> > >=20
> > > > Better suggestions on how to achieve this are welcome.
> > >=20
> > > In distro config:
> > >=20
> > > MACHINE_FEATURES_om-gta01 =3D "this that those butnoapm"
> > >=20
> > > This way your distro has what you want and others have what was set
> > > in machine config.
> >=20
> > Good idea.
> >=20
> > For the records though, I would consider it being the machine
> > maintainer's call to define the machine config. If he decides that ap=
m
> > is very misleading on said machine, perhaps because without taking
> > special care about the peripheral devices there will no be proper
> > suspend in the first place, then I might be inclined to follow this
> > reasoning and leave apm out there...
> >=20
>=20
> That indicates to me that FSO is broken.

On the contrary, dearest friend. FSO is actually one of the few things
which get suspend and resume right on these machines.

>  The last I checked any
> application which has opened /dev/apm_bios can choose to hold off
> the suspend until it has finished doing stuff(tm)

It's not about /dev/apm_bios, it about cooperation with userland that
needs to do certain things like configuring the modem and the gps
devices to get the suspend to work in a deterministic way.

If someone wants to write apm.d script that do the same, they can go for
it and then enable apm per DISTRO or as Koen indicated, per TASK_APM.

:M:





