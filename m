Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qh2c8-0002Zm-GX
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 18:48:44 +0200
Received: (qmail invoked by alias); 13 Jul 2011 16:44:45 -0000
Received: from p5B0A2C48.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.44.72]
	by mail.gmx.net (mp047) with SMTP; 13 Jul 2011 18:44:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+NX9ZlQNONn/IpoRNaZpVM8L9edokgMAgY/pLIwq
	lN31AVv+LtyFaK
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2011 18:46:45 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
In-Reply-To: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
MIME-Version: 1.0
Message-Id: <201107131846.45901.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: using i2c on a mx28evk
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
X-List-Received-Date: Wed, 13 Jul 2011 16:48:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, July 13, 2011 02:30:15 PM Christian Borutta wrote:
> Hello,
>=20
> I'm running an Angstr=F6m Linux on a Freescale mx28evk board. For using t=
he
> i2c ports of the board I compiled and installed the packages i2c and
> i2c-dev, but the Kernelmoduls are missing.
>=20
> While booting the system sends the message:
>=20
> " FATAL: Module i2c-pxa not found.
>    FATAL: Module i2c-pxa not found."
>=20
> I'm neither able to load the modules with modprobe nor do I find the
> modules ( I think one of them is  i2c-dev.ko) anywhere in the filesystem.
>=20
> Can anybody help me solving this issue?
>=20
> Christian Borutta
Hi Christian,

I checked the recipe i2c: In the file I2c.init this recipe wants to modprob=
e i2c-
pxa. Without having further background on this recipe it seems that it is n=
ot=20
meant for any board but pxa based ( can anybody confirm ? )
Additional this packet wants to modprobe i2c-dev. This is not the oe-devel-
packet but a wrapper kernel-module for creating a device node in /dev. I wi=
ll=20
later modify the kernel configuration so that i2c-dev is created and see wh=
ich=20
modules are created...

Regards

Andreas


