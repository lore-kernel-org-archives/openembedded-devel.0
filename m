Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NVpmg-0004pU-5q
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 18:16:33 +0100
Received: (qmail 22820 invoked by uid 813007); 15 Jan 2010 17:14:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Jan 2010 17:14:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 18:14:10 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
	<1262455806.2553.90.camel@lenovo.internal.reciva.com>
	<20100103005309.GA29588@denix.org>
In-Reply-To: <20100103005309.GA29588@denix.org>
MIME-Version: 1.0
Message-Id: <201001151814.11153.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sanity.bbclass: Reading	/proc/sys/vm/mmap_min_addr is not permitted with 2.6.33+ on host
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
X-List-Received-Date: Fri, 15 Jan 2010 17:16:33 -0000
X-Groupsio-MsgNum: 15757
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_jJKULrqfwRJFEnc"

--Boundary-00=_jJKULrqfwRJFEnc
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 3 stycznia 2010 o 01:53:09 Denys Dmytriyenko napisa=C5=82(a=
):

> BTW, wasn't the latest qemu "fixed" for this mmap() issue?

It was. I am running qemu 0.12.1 on my Debian host without problem. Did not=
=20
made recipe for it anyway.

Attached is cleaned version of Martin's patch which I use with stable/2009 =
and=20
OE.dev branches. Please Ack it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--Boundary-00=_jJKULrqfwRJFEnc
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-sanity.bbclass-handle-lack-of-permission-to-read-pro.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-sanity.bbclass-handle-lack-of-permission-to-read-pro.patch"

From 2c335c2bfba52b8a7672cec02159c9d8bba658a1 Mon Sep 17 00:00:00 2001
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 15 Jan 2010 18:10:29 +0100
Subject: [PATCH] sanity.bbclass: handle lack of permission to read /proc/sy=
s/vm/mmap_min_addr

* With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
  "cat /proc/sys/vm/mmap_min_addr" returns now
  "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
  Its probably becuse of
  http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmit;h=3D0e1a6ef2dea88101b056b6d9984f3325c5efced3
  But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
  is intentional or just bug which should be fixed in kernel.

This patch makes bitbake ignore reading error. Possible QEmu failure is not
handled yet.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/sanity.bbclass |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index f65df61..f57d8e4 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -96,11 +96,14 @@ def check_sanity(e):
 			if not check_app_exists("qemu-arm", e.data):
 				messages =3D messages + "qemu-native was in ASSUME_PROVIDED but the QE=
MU binaries (qemu-arm) can't be found in PATH"
=20
-		if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-			f =3D file("/proc/sys/vm/mmap_min_addr", "r")
-			if (f.read().strip() !=3D "0"):
-				messages =3D messages + "/proc/sys/vm/mmap_min_addr is not 0. This wil=
l cause problems with qemu so please fix the value (as root).\n\nTo fix thi=
s in later reboots, set vm.mmap_min_addr =3D 0 in /etc/sysctl.conf.\n"
-			f.close()
+		try:
+			if os.path.exists("/proc/sys/vm/mmap_min_addr"):
+				f =3D file("/proc/sys/vm/mmap_min_addr", "r")
+				if (f.read().strip() !=3D "0"):
+					messages =3D messages + "/proc/sys/vm/mmap_min_addr is not 0. This wi=
ll cause problems with qemu so please fix the value (as root).\n\nTo fix th=
is in later reboots, set vm.mmap_min_addr =3D 0 in /etc/sysctl.conf.\n"
+				f.close()
+		except:
+			pass
=20
 	for util in required_utilities.split():
 		if not check_app_exists( util, e.data ):
--=20
1.6.6


--Boundary-00=_jJKULrqfwRJFEnc--
