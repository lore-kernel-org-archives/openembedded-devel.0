Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NM8AK-0005BQ-CJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 23:52:51 +0100
Received: (qmail 16408 invoked by uid 813007); 19 Dec 2009 22:51:00 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Dec 2009 22:51:00 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Dec 2009 23:50:38 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32; KDE/4.3.4; x86_64; ; )
References: <4B2B7131.6020604@mayer-electronics.de>
	<4B2D3E19.6010402@mayer-electronics.de>
In-Reply-To: <4B2D3E19.6010402@mayer-electronics.de>
MIME-Version: 1.0
Message-Id: <200912192350.39349.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: init becomes a zombie process on ARM device
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
X-List-Received-Date: Sat, 19 Dec 2009 22:52:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 19 grudnia 2009 o 21:56:57 Florian Mayer (Mayer Electronics)=20
napisa=B3(a):
> I found out why the system behaves such strange (thanks to Florian Boor=20
> for pulling me in the right direction). In my constellation thumb=20
> interworking does not work. glibc is arm compiled, the rest is thumb=20
> format. To test it I added
>=20
> ARM_INSTRUCTION_SET=3D"arm"
> THUMB_INTERWORK=3D"no"
>=20
> to my machine configuration. But that did not help!
>=20
> Both variables are overwritten in=20
> openembedded/conf/dist/include/angstrom.inc. So I commented it out in=20
> that file and voila, the result boots correctly. Is there a more elegant=
=20
> way to solve this? Perhaps allow to configure this in the machine conf?

Start using OE to build your kernel and let your kernel recipe use linux.in=
c=20
file. This will automatically enable Thumb support for your ARM cpu and=20
Angstrom will start working without those hacks.=20


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




