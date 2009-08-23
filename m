Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MfAhJ-00033c-2q
	for openembedded-devel@openembedded.org; Sun, 23 Aug 2009 12:53:17 +0200
Received: (qmail 21654 invoked by uid 813007); 23 Aug 2009 10:35:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Aug 2009 10:35:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2009 12:35:37 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <4A8FBCA1.9050601@atmel.com>
In-Reply-To: <4A8FBCA1.9050601@atmel.com>
MIME-Version: 1.0
Message-Id: <200908231235.39555.marcin@juszkiewicz.com.pl>
Subject: Re: Cleaning up the "linux" directory
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
X-List-Received-Date: Sun, 23 Aug 2009 10:53:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 22 sierpnia 2009 o 11:38:41 Ulf Samuelsson napisa=C5=82(a):
> As everyone knows, the kernel directory is a mess:
> I have been thinking about what to do about this,
> and with the ability to include files in subdirectories,
> I think I have found a nice solution.

I had a look at this and for me it adds lot of things to care when kernel=20
needs to be updated/changed.

With current linux_X.Y.Z(.A).bb recipes it is easy to add new device - just=
=20
one file needs to be edited and thats all. If new patch has to be added the=
n=20
still one file to edit. New board to be added - same amount of work. If=20
patches common for few targets needs to be added then you can create new=20
variable for them:

AT91_PATCHES =3D "\
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
1-
andrew-victor.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
2-
experimental.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
3-
ac97-0001-sam9g45-r1.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
3-
ac97-0002-ac97-sam9rlek-r1.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
4-
NAND-001-configurable-partition-size.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
5-
touchscreen-001-sam9g45ek.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
6-
EHCI-001.sam9g45ek.patch;patch=3D1 \
        file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at91-00=
7-
CLK-001-debug-clocks.patch;patch=3D1 \
        "

And use it in SRC_URI for all boards. If patches do not touch files used by=
=20
other devices then adding them directly to default SRC_URI should also be=20
possible (thats how at91 patch was added in linux_2.6.30.bb recipe).

With your solution I have to check about 10 files in many directories or=20
regenerate all of them by some script (what about caring of manual changes =
in=20
those files?).

Maybe Buildroot uses such way (I do not know because last time I used it=20
before OE) but for me as long time OE developer it just adds lot of possibl=
e=20
errors to do.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




