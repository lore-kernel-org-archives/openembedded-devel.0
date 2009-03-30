Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joerg@hakker.de>) id 1LoOFx-0002d2-0x
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 22:38:53 +0200
Received: from tristan.localnet (port-92-202-121-238.dynamic.qsc.de
	[92.202.121.238])
	by mrelayeu.kundenserver.de (node=mrelayeu7) with ESMTP (Nemesis)
	id 0ML2xA-1LoODq3nCh-0007a4; Mon, 30 Mar 2009 22:36:43 +0200
From: =?iso-8859-1?q?J=F6rg_Bakker?= <joerg@hakker.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 22:36:41 +0200
User-Agent: KMail/1.11.1 (Linux/2.6.27-11-generic; KDE/4.2.1; i686; ; )
References: <200903302155.17027.joerg@hakker.de>
	<20090330200610.GD14278@smtp.west.cox.net>
In-Reply-To: <20090330200610.GD14278@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200903302236.41493.joerg@hakker.de>
X-Provags-ID: V01U2FsdGVkX18/VJztQs8BuhqqZ96rRT2NbthmWsyTkT9uyJQ
	UhaomYJ1+61uhb2n3pQX4Dgs+doAZBmBKmSgg/yMbPVJYu3sAJ
	3OqCKfi2vaE94F4zJ/tRw==
Subject: Re: [PATCH] linux-epia-2.6.19.2
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
X-List-Received-Date: Mon, 30 Mar 2009 20:38:53 -0000
X-Groupsio-MsgNum: 8848
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Z1S0JKPFKeDHkbc"

--Boundary-00=_Z1S0JKPFKeDHkbc
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Montag 30 M=E4rz 2009 22:06:10 schrieb Tom Rini:
> On Mon, Mar 30, 2009 at 09:55:16PM +0200, J=F6rg Bakker wrote:
> > Building of linux-epia-2.6.19.2 stops with the following error:
>
> [snip]
>
> This is actually quite a common error.  Can we call the patch something
> more generic and stick it into files/ ? Thanks.

ok, called the actual patch linux-2.6-limits.patch and moved it to files/

Resulting diff is attached. However, the patch is currently only applyed in=
=20
linux-epia_2.6.19.2.bb as I don't know which recipes are affected also.

Thanx for your input.



--Boundary-00=_Z1S0JKPFKeDHkbc
Content-Type: text/x-patch;
  charset="UTF-8";
  name="linux-26-limits.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="linux-26-limits.patch"

diff -Nur openembedded/recipes/linux/files/linux-2.6-limits.patch build/recipes/linux/files/linux-2.6-limits.patch
--- openembedded/recipes/linux/files/linux-2.6-limits.patch	1970-01-01 01:00:00.000000000 +0100
+++ build/recipes/linux/files/linux-2.6-limits.patch	2009-03-30 22:20:00.000000000 +0200
@@ -0,0 +1,10 @@
+--- linux/scripts/mod/sumversion.c.orig	2009-03-15 21:44:58.000000000 +0100
++++ linux/scripts/mod/sumversion.c	2009-03-15 21:44:58.000000000 +0100
+@@ -8,6 +8,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include "modpost.h"
++#include <linux/limits.h>
+ 
+ /*
+  * Stolen form Cryptographic API.
diff -Nur openembedded/recipes/linux/linux-epia_2.6.19.2.bb build/recipes/linux/linux-epia_2.6.19.2.bb
--- openembedded/recipes/linux/linux-epia_2.6.19.2.bb	2009-03-21 10:44:07.000000000 +0100
+++ build/recipes/linux/linux-epia_2.6.19.2.bb	2009-03-30 22:25:22.000000000 +0200
@@ -6,7 +6,8 @@
 KERNEL_CCSUFFIX = "-3.3.4"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
-           file://epia_defconfig"
+           file://epia_defconfig \
+	   file://linux-2.6-limits.patch;patch=1"
 S = "${WORKDIR}/linux-${PV}"
 
 COMPATIBLE_HOST = 'i.86.*-linux'

--Boundary-00=_Z1S0JKPFKeDHkbc--
