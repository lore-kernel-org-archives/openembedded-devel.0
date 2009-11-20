Received: from ey-out-1920.google.com ([74.125.78.150])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NBUmO-0007Zw-U0
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:48:12 +0100
Received: by ey-out-1920.google.com with SMTP id 4so753625eyg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 06:46:45 -0800 (PST)
Received: by 10.213.23.155 with SMTP id r27mr1443370ebb.25.1258728405396;
	Fri, 20 Nov 2009 06:46:45 -0800 (PST)
Received: from localhost (lumison.wolfsonmicro.com [87.246.78.27])
	by mx.google.com with ESMTPS id 7sm397123eyb.34.2009.11.20.06.46.44
	(version=SSLv3 cipher=RC4-MD5); Fri, 20 Nov 2009 06:46:45 -0800 (PST)
Date: Fri, 20 Nov 2009 14:46:44 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091120144644.76921a30@xora.org.uk>
In-Reply-To: <1258727981.13348.7.camel@opal>
References: <he689r$c57$1@ger.gmane.org> <4B06A6A7.1080204@SSpaeth.de>
	<200911201531.00181.marcin@juszkiewicz.com.pl>
	<1258727981.13348.7.camel@opal>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i686-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.78.150
X-SA-Exim-Mail-From: dp@xora.org.uk
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
X-List-Received-Date: Fri, 20 Nov 2009 14:48:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2009 15:39:41 +0100
Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:

> Am Freitag, den 20.11.2009, 15:30 +0100 schrieb Marcin Juszkiewicz:
> > Dnia pi=C4=85tek, 20 listopada 2009 o 15:24:39 Sebastian Spaeth
> > napisa=C5=82(a):
> >=20
> > > Better suggestions on how to achieve this are welcome.
> >=20
> > In distro config:
> >=20
> > MACHINE_FEATURES_om-gta01 =3D "this that those butnoapm"
> >=20
> > This way your distro has what you want and others have what was set
> > in machine config.
>=20
> Good idea.
>=20
> For the records though, I would consider it being the machine
> maintainer's call to define the machine config. If he decides that apm
> is very misleading on said machine, perhaps because without taking
> special care about the peripheral devices there will no be proper
> suspend in the first place, then I might be inclined to follow this
> reasoning and leave apm out there...
>=20

That indicates to me that FSO is broken. The last I checked any
application which has opened /dev/apm_bios can choose to hold off
the suspend until it has finished doing stuff(tm)

Turning off machine features for a broken DISTRO sounds wrong.

Graeme


