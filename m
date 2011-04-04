Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1Q6s39-0008Px-Jq
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 00:15:07 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 7E7C020013F;
	Tue,  5 Apr 2011 00:12:58 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 00:12:56 +0200
Message-Id: <1301955176-14829-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Mon, 04 Apr 2011 22:15:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In the current state, udev init script is loaded as 3rd and modutils.sh a=
s
20th, so udevadm called in udev init script loads all kernel modules in s=
ome
unpredictable order, not honoring in any way specified order of modules i=
n
/etc/modules. This causes some troubles mainly in the first boot. So to f=
ix
this we now move loading of the kernel modules just before we exec udev i=
nit
script. Example of the current state:

	Starting udev
	rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
	rtc-m48t86 rtc-m48t86: battery ok
	ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1

	root@ts72xx:~# cat /etc/modules
	rtc-ep93xx
	ohci-hcd
	ts72xx_sbcinfo
	rtc-m48t86

As you can guess, this is really wrong behaviour, because I've rtc1 as th=
e
main time source for my system.

	root@ts72xx:~# cat /etc/default/hwclock
	HWCLOCKACCESS=3Dyes
	HWCLOCKDEVICE=3D/dev/rtc1

Expected behaviour with this patch applied:

	Please wait: booting...
	ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
	usbcore: registered new device driver usb
	ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
	...
	rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
	rtc-m48t86 rtc-m48t86: battery ok
	Starting udev

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/modutils/modutils-initscripts.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/modutils/modutils-initscripts.bb b/recipes/modutils/=
modutils-initscripts.bb
index 07f4810..797acb3 100644
--- a/recipes/modutils/modutils-initscripts.bb
+++ b/recipes/modutils/modutils-initscripts.bb
@@ -2,10 +2,10 @@ SECTION =3D "base"
 DESCRIPTION =3D "modutils configuration files"
 LICENSE =3D "PD"
 SRC_URI =3D "file://modutils.sh"
-PR =3D "r3"
+PR =3D "r4"
=20
 INITSCRIPT_NAME =3D "modutils.sh"
-INITSCRIPT_PARAMS =3D "start 20 S ."
+INITSCRIPT_PARAMS =3D "start 2 S ."
=20
 inherit update-rc.d
=20
--=20
1.7.1



