Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Nci4o-0007ym-IF
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 17:27:41 +0100
Received: from FBCMMO04.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Feb 2010 17:25:05 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Feb 2010 17:25:04 +0100
Received: from [192.168.1.116] ([95.244.130.46]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 3 Feb 2010 17:25:05 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265189276.5591.40.camel@mattotaupa>
References: <1265189276.5591.40.camel@mattotaupa>
Date: Wed, 03 Feb 2010 17:25:00 +0100
Message-Id: <1265214300.3729.22.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 03 Feb 2010 16:25:05.0736 (UTC)
	FILETIME=[71D35480:01CAA4ED]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IEFzdXMgRWVlIFBDIDcwMSA0RywgcGVyZm9ybWFuY2UgYW5kIGluY2x1c2lvbiBpbnRvIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Wed, 03 Feb 2010 16:27:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-02-03 at 10:27 +0100, Paul Menzel wrote:
> Dear Denis and OE developers,
>=20
>=20
> Denis committed support for Asus Eee PC 701 4G [2] some days ago [1].
>=20
> 1. Denis, could tell us something about the performance of OE on this
> netbook compared to the distribution you ran on there before.
>=20
> 2. Is it possible to include this machine in the =C3=85ngstr=C3=B6m onlin=
e builder
> [3]?
>=20
>=20
> Thanks,
>=20
> Paul
Hi,
I didn't compare the performances because my main target was to make
Angstrom use the minimum possible space.
This model has 4GB flash and xfce46-image took about 300M
I wanted a lot of space for data and to be able to swap the sd-card.
So I could re-use my 16GB micro-sd card on my htcdream or eeepc 701.

Speed-wise it boots a lot faster than ubuntu karmic for and on an usb
key(that is to say,you boot a debian-like operating system and you use
the usb key creator,and after that the usb key should work on any
machine which can boot from USB)

Angstrom x86 builds are a bit outdated(you have older gnome for
instance) compared to other architectures...

But you could build things yourself with bitbake,it sometimes fails
because of doltlibtool but this should be fixed when the software using
doltlibtool will be taken from upstream(I don't remember if it was fixed
upstream but I think it should),else there is a simple way to patch it.

Also scummvm didn't compile because of an issue in their configure
script...I bugreported and D.J.Willis is an openmedded and scummvm
developer...so it should be fixed soon

For wesnoth I have to commit a fix to the recipe to make use of the big
screen...(or simply remove tinygui)

Abiword,gnumeric,tasks(yes the pimlico client which is very nice) are
usable

Claws mails has an issue with the screen sending mails which goes over
the screen even in small screen mode.

Midori segfaults but I use firefox

The lastest gnash should land in oe when all the autotools issues will
have been fixed(it's rsavoye's job not mine)

Empathy and pidgin segfaults

tangogps works fine but I didn't test with a gps

xchat works fine

All that status is from my old build...some issues may have been fixed
and some other may have appeared.

Denis.



