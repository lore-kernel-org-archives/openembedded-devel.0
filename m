Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6465D59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Sep 2014 09:11:58 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so2276332wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Sep 2014 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ZHFgXFRYCNERaJW/WkW3RzOirnjHe2dznJb3yKmMHQs=;
	b=Vq39dRk5xjEx/RuzzmvyrSHliEX6NZSJaS/c+NQJEUbVSzRZw1VdB0H6XQZWxRqXzL
	ncJNjgEoB7kWI1B4ZUKd3/fMAxXFniEf4aLX0piiISqrTH2D7r/b2SqUgkYJCCR6MX9M
	ZPLrSgEx7xpN+GJGFtCobBtJmjcRzVdGP5W2fR8SgiY7GNF7UoIj5XXcyCkwkEQ+sVq4
	L+kD1OxGYRMvF1Hk+WvgV+FI4AvtMSWbg107CgkMJ8YtB3fi5J2J9JVPTWTk/bYDhbsO
	W7GxRTiaJFpAzmCsCnRO0ktvvzRUp4cERpwbbYEEx1ts5wnz5ozSTyGKQXeVUU3RzwfE
	2clQ==
X-Received: by 10.180.211.102 with SMTP id nb6mr20518146wic.11.1410167519592; 
	Mon, 08 Sep 2014 02:11:59 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	bk6sm10389690wjb.26.2014.09.08.02.11.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Sep 2014 02:11:58 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Sep 2014 09:11:44 +0000
Message-Id: <1410167504-540-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH RFC/RFT] toybox: New recipe for toybox-0.4.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Sep 2014 09:12:05 -0000

Toybox is a BSD-licensed alternative to Busybox which may be of interest to a
few people. It's still a work in progress but it already covers a large number
of the basic commands a system needs.

Removing toybox after it has been installed currently bricks the system though
as the postrm script runs after '/bin/toybox' has been removed (so things like
'/bin/ln' become broken links and the update-alternatives script can't run).

Toybox is patched to change the install paths of several utilities to match the
paths used by Busybox. This is needed as update-alternatives from opkg-utils
cannot handle two providers of a given utility which place their links in
different locations. Link locations have so far only been matched with Busybox,
other packages such as coreutils still cause clashes. Therefore, toybox
currently installs cleanly on core-image-minimal but fails to install cleanly on
core-image-full-cmdline.

Hopefully Toybox is still usable for testing in the current state. With further
development of the recipe it should be possible to install and uninstall toybox
cleanly on all core images. With further upstream development it should become a
viable replacement for Busybox.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/licenses/BSD-0-Clause                      |  12 +
 .../toybox/0001-Match-paths-with-busybox.patch     | 365 +++++++++++++++++++++
 meta-oe/recipes-core/toybox/toybox_0.4.9.bb        |  64 ++++
 3 files changed, 441 insertions(+)
 create mode 100644 meta-oe/licenses/BSD-0-Clause
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
 create mode 100644 meta-oe/recipes-core/toybox/toybox_0.4.9.bb

diff --git a/meta-oe/licenses/BSD-0-Clause b/meta-oe/licenses/BSD-0-Clause
new file mode 100644
index 0000000..328bdd6
--- /dev/null
+++ b/meta-oe/licenses/BSD-0-Clause
@@ -0,0 +1,12 @@
+Copyright (C) <YEAR> by <OWNER>
+
+Permission to use, copy, modify, and/or distribute this software for any
+purpose with or without fee is hereby granted.
+
+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
new file mode 100644
index 0000000..2213559
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
@@ -0,0 +1,365 @@
+From cbd9ac1d0769338411297d2cb97f1608c17c8ae9 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Mon, 18 Aug 2014 12:18:16 +0000
+Subject: [PATCH] Match paths with busybox
+
+To ensure that toybox can be installed alongside busybox without confusing
+update-alternatives, the paths of the links installed by toybox should match
+those installed by busybox. This is accomplished by changing the flags of a few
+tools within toybox.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+
+Upstream-status: Inappropriate
+    (specific to update-alternatives use in OpenEmbedded)
+---
+ toys/lsb/pidof.c        | 2 +-
+ toys/other/chvt.c       | 2 +-
+ toys/other/ifconfig.c   | 2 +-
+ toys/other/insmod.c     | 2 +-
+ toys/other/lsmod.c      | 2 +-
+ toys/other/netcat.c     | 2 +-
+ toys/other/pivot_root.c | 2 +-
+ toys/other/readlink.c   | 2 +-
+ toys/other/reboot.c     | 6 +++---
+ toys/other/rfkill.c     | 2 +-
+ toys/other/rmmod.c      | 2 +-
+ toys/other/swapoff.c    | 2 +-
+ toys/other/swapon.c     | 2 +-
+ toys/other/sysctl.c     | 2 +-
+ toys/posix/cut.c        | 2 +-
+ toys/posix/df.c         | 2 +-
+ toys/posix/head.c       | 2 +-
+ toys/posix/id.c         | 6 +++---
+ toys/posix/mkfifo.c     | 2 +-
+ toys/posix/renice.c     | 2 +-
+ toys/posix/tail.c       | 2 +-
+ toys/posix/tee.c        | 2 +-
+ toys/posix/uniq.c       | 2 +-
+ toys/posix/who.c        | 2 +-
+ 24 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/toys/lsb/pidof.c b/toys/lsb/pidof.c
+index 51b742f..a8fc8ef 100644
+--- a/toys/lsb/pidof.c
++++ b/toys/lsb/pidof.c
+@@ -5,7 +5,7 @@
+  *
+  * http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/pidof.html
+ 
+-USE_PIDOF(NEWTOY(pidof, "<1so:", TOYFLAG_USR|TOYFLAG_BIN))
++USE_PIDOF(NEWTOY(pidof, "<1so:", TOYFLAG_BIN))
+ 
+ config PIDOF
+   bool "pidof"
+diff --git a/toys/other/chvt.c b/toys/other/chvt.c
+index 6544265..a93327f 100644
+--- a/toys/other/chvt.c
++++ b/toys/other/chvt.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright (C) 2008 David Anders <danders@amltd.com>
+ 
+-USE_CHVT(NEWTOY(chvt, "<1", TOYFLAG_USR|TOYFLAG_SBIN))
++USE_CHVT(NEWTOY(chvt, "<1", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config CHVT
+   bool "chvt"
+diff --git a/toys/other/ifconfig.c b/toys/other/ifconfig.c
+index a84e26a..66c7179 100644
+--- a/toys/other/ifconfig.c
++++ b/toys/other/ifconfig.c
+@@ -6,7 +6,7 @@
+  *
+  * Not in SUSv4.
+ 
+-USE_IFCONFIG(NEWTOY(ifconfig, "?a", TOYFLAG_BIN))
++USE_IFCONFIG(NEWTOY(ifconfig, "?a", TOYFLAG_SBIN))
+ 
+ config IFCONFIG
+   bool "ifconfig"
+diff --git a/toys/other/insmod.c b/toys/other/insmod.c
+index 8aa959a..75fd7cd 100644
+--- a/toys/other/insmod.c
++++ b/toys/other/insmod.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_INSMOD(NEWTOY(insmod, "<1", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
++USE_INSMOD(NEWTOY(insmod, "<1", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
+ 
+ config INSMOD
+   bool "insmod"
+diff --git a/toys/other/lsmod.c b/toys/other/lsmod.c
+index b8f5d82..4d16048 100644
+--- a/toys/other/lsmod.c
++++ b/toys/other/lsmod.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_LSMOD(NEWTOY(lsmod, NULL, TOYFLAG_BIN))
++USE_LSMOD(NEWTOY(lsmod, NULL, TOYFLAG_SBIN))
+ 
+ config LSMOD
+   bool "lsmod"
+diff --git a/toys/other/netcat.c b/toys/other/netcat.c
+index 3c6f630..188c3d1 100644
+--- a/toys/other/netcat.c
++++ b/toys/other/netcat.c
+@@ -4,7 +4,7 @@
+  *
+  * TODO: udp, ipv6, genericize for telnet/microcom/tail-f
+ 
+-USE_NETCAT(OLDTOY(nc, netcat, USE_NETCAT_LISTEN("tl^L^")"w#p#s:q#f:", TOYFLAG_BIN))
++USE_NETCAT(OLDTOY(nc, netcat, USE_NETCAT_LISTEN("tl^L^")"w#p#s:q#f:", TOYFLAG_USR|TOYFLAG_BIN))
+ USE_NETCAT(NEWTOY(netcat, USE_NETCAT_LISTEN("tl^L^")"w#p#s:q#f:", TOYFLAG_BIN))
+ 
+ config NETCAT
+diff --git a/toys/other/pivot_root.c b/toys/other/pivot_root.c
+index 3e4beac..ce3d3a8 100644
+--- a/toys/other/pivot_root.c
++++ b/toys/other/pivot_root.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Rob Landley <rob@landley.net>
+ 
+-USE_PIVOT_ROOT(NEWTOY(pivot_root, "<2>2", TOYFLAG_USR|TOYFLAG_BIN))
++USE_PIVOT_ROOT(NEWTOY(pivot_root, "<2>2", TOYFLAG_SBIN))
+ 
+ config PIVOT_ROOT
+   bool "pivot_root"
+diff --git a/toys/other/readlink.c b/toys/other/readlink.c
+index 1c33362..fecd1ef 100644
+--- a/toys/other/readlink.c
++++ b/toys/other/readlink.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2007 Rob Landley <rob@landley.net>
+ 
+-USE_READLINK(NEWTOY(readlink, "<1>1fenq[-fe]", TOYFLAG_BIN))
++USE_READLINK(NEWTOY(readlink, "<1>1fenq[-fe]", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config READLINK
+   bool "readlink"
+diff --git a/toys/other/reboot.c b/toys/other/reboot.c
+index 5cbc4f8..f8baafc 100644
+--- a/toys/other/reboot.c
++++ b/toys/other/reboot.c
+@@ -2,9 +2,9 @@
+  *
+  * Copyright 2013 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
+-USE_REBOOT(OLDTOY(halt, reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
+-USE_REBOOT(OLDTOY(poweroff, reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
++USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
++USE_REBOOT(OLDTOY(halt, reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
++USE_REBOOT(OLDTOY(poweroff, reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
+ 
+ config REBOOT
+   bool "reboot"
+diff --git a/toys/other/rfkill.c b/toys/other/rfkill.c
+index af3efe1..7527ec7 100644
+--- a/toys/other/rfkill.c
++++ b/toys/other/rfkill.c
+@@ -5,7 +5,7 @@
+  *
+  * No Standard
+ 
+-USE_RFKILL(NEWTOY(rfkill, "<1>2", TOYFLAG_SBIN))
++USE_RFKILL(NEWTOY(rfkill, "<1>2", TOYFLAG_USR|TOYFLAG_SBIN))
+ 
+ config RFKILL
+   bool "rfkill"
+diff --git a/toys/other/rmmod.c b/toys/other/rmmod.c
+index b789acc..10c134c 100644
+--- a/toys/other/rmmod.c
++++ b/toys/other/rmmod.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_RMMOD(NEWTOY(rmmod, "<1wf", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
++USE_RMMOD(NEWTOY(rmmod, "<1wf", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
+ 
+ config RMMOD
+   bool "rmmod"
+diff --git a/toys/other/swapoff.c b/toys/other/swapoff.c
+index b89e915..fb17130 100644
+--- a/toys/other/swapoff.c
++++ b/toys/other/swapoff.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_SWAPOFF(NEWTOY(swapoff, "<1>1", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
++USE_SWAPOFF(NEWTOY(swapoff, "<1>1", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
+ 
+ config SWAPOFF
+   bool "swapoff"
+diff --git a/toys/other/swapon.c b/toys/other/swapon.c
+index 49f1249..838d382 100644
+--- a/toys/other/swapon.c
++++ b/toys/other/swapon.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_SWAPON(NEWTOY(swapon, "<1>1p#<0>32767", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
++USE_SWAPON(NEWTOY(swapon, "<1>1p#<0>32767", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
+ 
+ config SWAPON
+   bool "swapon"
+diff --git a/toys/other/sysctl.c b/toys/other/sysctl.c
+index 8e57ca1..0c6c640 100644
+--- a/toys/other/sysctl.c
++++ b/toys/other/sysctl.c
+@@ -5,7 +5,7 @@
+  *
+  * No Standard
+  
+-USE_SYSCTL(NEWTOY(sysctl, "^neNqwpaA[!ap][!aq][!aw][+aA]", TOYFLAG_USR|TOYFLAG_BIN))
++USE_SYSCTL(NEWTOY(sysctl, "^neNqwpaA[!ap][!aq][!aw][+aA]", TOYFLAG_SBIN))
+ 
+ config SYSCTL
+   bool "sysctl"
+diff --git a/toys/posix/cut.c b/toys/posix/cut.c
+index 38f136e..87a1f0d 100644
+--- a/toys/posix/cut.c
++++ b/toys/posix/cut.c
+@@ -4,7 +4,7 @@
+  *
+  * http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html 
+ 
+-USE_CUT(NEWTOY(cut, "b:|c:|f:|d:sn[!cbf]", TOYFLAG_BIN))
++USE_CUT(NEWTOY(cut, "b:|c:|f:|d:sn[!cbf]", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config CUT
+   bool "cut"
+diff --git a/toys/posix/df.c b/toys/posix/df.c
+index afb296b..6296dc9 100644
+--- a/toys/posix/df.c
++++ b/toys/posix/df.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/df.html
+ 
+-USE_DF(NEWTOY(df, "Pkt*a", TOYFLAG_USR|TOYFLAG_SBIN))
++USE_DF(NEWTOY(df, "Pkt*a", TOYFLAG_BIN))
+ 
+ config DF
+   bool "df"
+diff --git a/toys/posix/head.c b/toys/posix/head.c
+index e8517d4..3ac4373 100644
+--- a/toys/posix/head.c
++++ b/toys/posix/head.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/head.html
+ 
+-USE_HEAD(NEWTOY(head, "n#<0=10", TOYFLAG_BIN))
++USE_HEAD(NEWTOY(head, "n#<0=10", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config HEAD
+   bool "head"
+diff --git a/toys/posix/id.c b/toys/posix/id.c
+index a03a097..cfe0b59 100644
+--- a/toys/posix/id.c
++++ b/toys/posix/id.c
+@@ -6,10 +6,10 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/id.html
+ 
+-USE_ID(NEWTOY(id, ">1nGgru[!Ggu]", TOYFLAG_BIN))
++USE_ID(NEWTOY(id, ">1nGgru[!Ggu]", TOYFLAG_USR|TOYFLAG_BIN))
+ USE_ID_GROUPS(OLDTOY(groups, id, NULL, TOYFLAG_USR|TOYFLAG_BIN))
+-USE_ID_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_BIN))
+-USE_ID_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_BIN))
++USE_ID_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
++USE_ID_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config ID
+   bool "id"
+diff --git a/toys/posix/mkfifo.c b/toys/posix/mkfifo.c
+index 15fab70..4e0fca3 100644
+--- a/toys/posix/mkfifo.c
++++ b/toys/posix/mkfifo.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/mkfifo.html
+ 
+-USE_MKFIFO(NEWTOY(mkfifo, "<1m:", TOYFLAG_BIN))
++USE_MKFIFO(NEWTOY(mkfifo, "<1m:", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config MKFIFO
+   bool "mkfifo"
+diff --git a/toys/posix/renice.c b/toys/posix/renice.c
+index 8c20644..489eb13 100644
+--- a/toys/posix/renice.c
++++ b/toys/posix/renice.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://pubs.opengroup.org/onlinepubs/9699919799/utilities/renice.html
+ 
+-USE_RENICE(NEWTOY(renice, "<1gpun#|", TOYFLAG_BIN))
++USE_RENICE(NEWTOY(renice, "<1gpun#|", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config RENICE
+   bool "renice"
+diff --git a/toys/posix/tail.c b/toys/posix/tail.c
+index e1048be..ba0a55a 100644
+--- a/toys/posix/tail.c
++++ b/toys/posix/tail.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/tail.html
+ 
+-USE_TAIL(NEWTOY(tail, "fc-n-[-cn]", TOYFLAG_BIN))
++USE_TAIL(NEWTOY(tail, "fc-n-[-cn]", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config TAIL
+   bool "tail"
+diff --git a/toys/posix/tee.c b/toys/posix/tee.c
+index 0388510..5574088 100644
+--- a/toys/posix/tee.c
++++ b/toys/posix/tee.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/tee.html
+ 
+-USE_TEE(NEWTOY(tee, "ia", TOYFLAG_BIN))
++USE_TEE(NEWTOY(tee, "ia", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config TEE
+   bool "tee"
+diff --git a/toys/posix/uniq.c b/toys/posix/uniq.c
+index bd41d4a..374ceab 100644
+--- a/toys/posix/uniq.c
++++ b/toys/posix/uniq.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/uniq.html
+ 
+-USE_UNIQ(NEWTOY(uniq, "f#s#w#zicdu", TOYFLAG_BIN))
++USE_UNIQ(NEWTOY(uniq, "f#s#w#zicdu", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config UNIQ
+   bool "uniq"
+diff --git a/toys/posix/who.c b/toys/posix/who.c
+index 2c8a2e6..d5cd001 100644
+--- a/toys/posix/who.c
++++ b/toys/posix/who.c
+@@ -9,7 +9,7 @@
+  * Posix says to support many options (-abdHlmpqrstTu) but this
+  * isn't aimed at minicomputers with modem pools.
+ 
+-USE_WHO(NEWTOY(who, "a", TOYFLAG_BIN))
++USE_WHO(NEWTOY(who, "a", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config WHO
+   bool "who"
+-- 
+2.0.4
+
diff --git a/meta-oe/recipes-core/toybox/toybox_0.4.9.bb b/meta-oe/recipes-core/toybox/toybox_0.4.9.bb
new file mode 100644
index 0000000..ec76bd6
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox_0.4.9.bb
@@ -0,0 +1,64 @@
+SUMMARY = "Toybox combines common utilities together into a single executable."
+HOMEPAGE = "http://www.landley.net/toybox/"
+
+SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.bz2 \
+    file://0001-Match-paths-with-busybox.patch"
+SRC_URI[md5sum] = "a8f1022175689defec51cf5a71c41326"
+SRC_URI[sha256sum] = "e6dc9052826a3bdae1923e3301c9e3542e890af5ed66534052943f8412255bff"
+
+LICENSE = "BSD-0-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=57cc240a6204b2ea8c68450d42f9d33f"
+
+SECTION = "base"
+
+do_configure() {
+    oe_runmake defconfig
+
+    # Disable killall5 as it isn't managed by update-alternatives
+    sed -e 's/CONFIG_KILLALL5=y/# CONFIG_KILLALL5 is not set/' -i .config
+}
+
+do_compile() {
+    oe_runmake toybox_unstripped
+
+    # Create a list of links needed
+    oe_runmake generated/instlist
+    ./generated/instlist long | sed -e 's#^#/#' > toybox.links
+}
+
+do_install() {
+    # Install manually instead of using 'make install'
+    install -d ${D}${base_bindir}
+    if grep -q "CONFIG_TOYBOX_SUID=y" ${B}/.config; then
+        install -m 4755 ${B}/toybox_unstripped ${D}${base_bindir}/toybox
+    else
+        install -m 0755 ${B}/toybox_unstripped ${D}${base_bindir}/toybox
+    fi
+
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${B}/toybox.links ${D}${sysconfdir}
+}
+
+inherit update-alternatives
+
+# If you've chosen to install toybox you probably want it to take precedence
+# over busybox where possible but not over other packages
+ALTERNATIVE_PRIORITY = "60"
+
+python do_package_prepend () {
+    # Read links from /etc/toybox.links and create appropriate
+    # update-alternatives variables
+
+    dvar = d.getVar('D', True)
+    pn = d.getVar('PN', True)
+    target = "/bin/toybox"
+
+    f = open('%s/etc/toybox.links' % (dvar), 'r')
+    for alt_link_name in f:
+        alt_link_name = alt_link_name.strip()
+        alt_name = os.path.basename(alt_link_name)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
+        d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
+    f.close()
+}
-- 
2.1.0


