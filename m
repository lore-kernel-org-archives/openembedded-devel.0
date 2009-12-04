Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NGZkl-0007qv-1w
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 16:07:30 +0100
Received: (qmail 6781 invoked by uid 813007); 4 Dec 2009 15:05:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 4 Dec 2009 15:05:51 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 4 Dec 2009 16:05:59 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
References: <4B18811D.8020206@mwester.net>
	<6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
	<4B191AC0.80807@mwester.net>
In-Reply-To: <4B191AC0.80807@mwester.net>
MIME-Version: 1.0
Message-Id: <200912041606.02279.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 breaks opkg
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
X-List-Received-Date: Fri, 04 Dec 2009 15:07:30 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 4 grudnia 2009 o 15:20:48 Mike Westerhof napisa=C5=82(a):

> As a reminder, the need is that opkg must run in 32MB of physical RAM -
> it cannot be assumed that swap space is available - and an absolute
> minimum of dependencies on external libraries is required because the
> total rootfs image must fit in about 5 MB or so.

> Please understand that testing opkg is a laborious process, requiring many
> different test scenarios that involve lots of reflashing of images...

Build your image for qemuarm as 5MB ext2 image. Copy it to have clean image=
=20
for testing. Boot qemu with "mem=3D32M" given for kernel. Do test. Then cop=
y=20
clean.ext2 as base for next test.

This way you do not have to reflash your device each time, have control ove=
r=20
space available and can have small RAM.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




