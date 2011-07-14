Received: from moutng.kundenserver.de ([212.227.17.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Borutta@schoeps.de>) id 1QhJKU-0001Cg-BP
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 12:39:39 +0200
Received: from ZEUS.schoeps.local (pd95ba764.dip0.t-ipconnect.de
	[217.91.167.100])
	by mrelayeu.kundenserver.de (node=mreu3) with ESMTP (Nemesis)
	id 0MeYyR-1Qqt38269f-00QCiD; Thu, 14 Jul 2011 12:29:53 +0200
Received: from ZEUS.schoeps.local ([fe80::71f0:3b18:ef63:ee9c]) by
	ZEUS.schoeps.local ([fe80::71f0:3b18:ef63:ee9c%10]) with mapi;
	Thu, 14 Jul 2011 12:29:51 +0200
From: Christian Borutta <Borutta@schoeps.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Jul 2011 12:29:47 +0200
Thread-Topic: [oe] using i2c on a mx28evk
Thread-Index: AcxBf85ZUx67ioa2RHyKvYN29/6/TwAkEKzQ
Message-ID: <311EE95A63F86C4E960B402004EAD7E310AF74E175@ZEUS.schoeps.local>
References: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
	<201107131846.45901.schnitzeltony@gmx.de>
	<201107131909.27208.schnitzeltony@gmx.de>
In-Reply-To: <201107131909.27208.schnitzeltony@gmx.de>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, de-DE
MIME-Version: 1.0
X-Provags-ID: V02:K0:aqVwD/sygm00Uulz0r32YKbdPJCd+x7Fat043vi9C7V
	21ulhhK8MzPn77bASIpcMIWKHEGHOXH5Jf1TooGpHzu+zw7zeV
	6QYO696nx3sslHTxDj34YQqIs42KbD+e+9L6ElvIM0uFVBBD8b
	B4+xrxXRff2m3ic9deV8W+2CH6bB+q2qFrNsYceDWdWFZeMY3O
	VOfk61alHq29IiaqnAYIw==
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
X-List-Received-Date: Thu, 14 Jul 2011 10:39:39 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Wednesday, July 13, 2011 06:46:45 PM Andreas Mueller wrote:
> I checked the recipe i2c: In the file I2c.init this recipe wants to
> modprobe i2c- pxa. Without having further background on this recipe it
> seems that it is not meant for any board but pxa based ( can anybody
> confirm ? )
> Additional this packet wants to modprobe i2c-dev. This is not the oe-deve=
l-
> packet but a wrapper kernel-module for creating a device node in /dev. I
> will later modify the kernel configuration so that i2c-dev is created and
> see which modules are created...
>In file i2c-api.c you can find
>
>*   @file   i2c-api.c
>*
>*   @brief  This file contains the implementation for performing I2C opera=
tions
>*           on the gumstix.

>that does not look generic...

>Anyway: I will create a patch so that the package kernel-module-i2c-dev is=
=20
>created.

I've tried your patch, but it didn't help. Maybe we need to set CONFIG_I2C_=
GPIO in the kernel configuration?

>A bit off-topic: Would you like to test the oe-core version with the meta =
layer=20
>found in https://gitorious.org/schnitzeltony-oe-meta/meta-freescale ?

I would like to test your oe-core version with meta layer but I'm not shure=
 how to do that.


Christian


