Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF79973174
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 07:23:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so8649391wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9viPlA80CH+hxVpVjPjtOtJeQ7hvJDMIgHk2UXelEeQ=;
	b=SV7+L8eluXUOtgFYIxs0G1i/8XWH9hRbeO7I1SlGYthhtYcFrmDhdqAtJ33Lp9viys
	av+mNj/ksIvI8htJ9z5g0OjpGerlzOjwHaaY6Ap9QS7DciN716MFvAVPM321i0vefTPA
	v4qKyN4J+o0Oo77UFH/cLYYg1nwsAEkMP2YIOQl1AAZbVuWu7TKD+7MsbjTSInmPLl8P
	U3N+Gedd7BYG9bQNfVJU7lp1MQQYoi1tCY4jPA76BhNGlD5E5rBVOLwlHY74Kg/EQ2Av
	RILSdoXazZmr48WMnh8FRU05gwxTs4ayFgtT/4SRUEuGEObJKKo1NSDR9DN9xXldJMLy
	ecIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=9viPlA80CH+hxVpVjPjtOtJeQ7hvJDMIgHk2UXelEeQ=;
	b=RWuRPxLq0fR5n62dqrCL2wxhlkvTY51xyzJ9M+PMwg7HxZ/HDI1d/dfgw1BPgVMBnZ
	fOG7lh+8JaymPb4O+UgIl4nso78MtUCen+EOO+x2B2YMd2wy4f9uKFPUnAMDIDi2gXuZ
	pIEMErWjAGuaLwVLoW3Uz/y+Wb1n+melJ06WKv5hdC6UqIQJsayepCon7hkWWXiC+zsW
	RkInuQ1RW/9uhVGnwy3HngxLfShGR+vU2qZHH0LzCX9tntqyvdNhDSbfKxF+IyKOX4ky
	3hoG+7yyZkHFu5VabxIR+LhftD9LMJgSl2uWDUa2Dqk0MlUWdTgrwzuJ9afhyoVoRmQX
	bArg==
X-Gm-Message-State: AOPr4FUxGFCMMSajRTPjF4Sch3MXBfijdkveR7+A1Km25s/naU4e5DIf52EjEfOLS9PuPw==
X-Received: by 10.194.115.8 with SMTP id jk8mr7024518wjb.142.1462346592258;
	Wed, 04 May 2016 00:23:12 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	k133sm3279641wmg.7.2016.05.04.00.23.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 00:23:11 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2016 08:23:31 +0100
Message-Id: <1462346612-13017-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462346612-13017-1-git-send-email-paul@paulbarker.me.uk>
References: <1462346612-13017-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe][PATCH 1/2] toybox: Remove out-of-date patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 07:23:14 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../toybox/0001-Match-paths-with-busybox.patch     | 388 ---------------------
 1 file changed, 388 deletions(-)
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
deleted file mode 100644
index 9eb965d..0000000
--- a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
+++ /dev/null
@@ -1,388 +0,0 @@
-From 9b37b45067677563dc8daa73d73a015c20ad6222 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Mon, 18 Aug 2014 12:18:16 +0000
-Subject: [PATCH] Match paths with busybox
-
-To ensure that toybox can be installed alongside busybox without confusing
-update-alternatives, the paths of the links installed by toybox should match
-those installed by busybox. This is accomplished by changing the flags of a few
-tools within toybox.
-
-v3:
-    - Forward ported from v0.5.0 to v0.5.2
-
-v2:
-    - Forward ported from v0.4.9 to v0.5.0
-    - Move new 'mount' command
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-
-Upstream-status: Inappropriate
-    (specific to update-alternatives use in OpenEmbedded)
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
----
- toys/lsb/mount.c        | 2 +-
- toys/lsb/pidof.c        | 2 +-
- toys/other/chvt.c       | 2 +-
- toys/other/ifconfig.c   | 2 +-
- toys/other/insmod.c     | 2 +-
- toys/other/lsmod.c      | 2 +-
- toys/other/netcat.c     | 2 +-
- toys/other/pivot_root.c | 2 +-
- toys/other/readlink.c   | 2 +-
- toys/other/reboot.c     | 6 +++---
- toys/other/rfkill.c     | 2 +-
- toys/other/rmmod.c      | 2 +-
- toys/other/swapoff.c    | 2 +-
- toys/other/swapon.c     | 2 +-
- toys/other/sysctl.c     | 2 +-
- toys/posix/cut.c        | 2 +-
- toys/posix/df.c         | 2 +-
- toys/posix/head.c       | 2 +-
- toys/posix/id.c         | 6 +++---
- toys/posix/mkfifo.c     | 2 +-
- toys/posix/renice.c     | 2 +-
- toys/posix/tail.c       | 2 +-
- toys/posix/tee.c        | 2 +-
- toys/posix/uniq.c       | 2 +-
- toys/posix/who.c        | 2 +-
- 25 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/toys/lsb/mount.c b/toys/lsb/mount.c
-index c334681..b076ca1 100644
---- a/toys/lsb/mount.c
-+++ b/toys/lsb/mount.c
-@@ -6,7 +6,7 @@
-  * Note: -hV is bad spec, haven't implemented -FsLU yet
-  * no mtab (/proc/mounts does it) so -n is NOP.
- 
--USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
-+USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_BIN|TOYFLAG_STAYROOT))
- //USE_NFSMOUNT(NEWTOY(nfsmount, "?<2>2", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
- 
- config MOUNT
-diff --git a/toys/lsb/pidof.c b/toys/lsb/pidof.c
-index 51b742f..a8fc8ef 100644
---- a/toys/lsb/pidof.c
-+++ b/toys/lsb/pidof.c
-@@ -5,7 +5,7 @@
-  *
-  * http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/pidof.html
- 
--USE_PIDOF(NEWTOY(pidof, "<1so:", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_PIDOF(NEWTOY(pidof, "<1so:", TOYFLAG_BIN))
- 
- config PIDOF
-   bool "pidof"
-diff --git a/toys/other/chvt.c b/toys/other/chvt.c
-index 6544265..a93327f 100644
---- a/toys/other/chvt.c
-+++ b/toys/other/chvt.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright (C) 2008 David Anders <danders@amltd.com>
- 
--USE_CHVT(NEWTOY(chvt, "<1", TOYFLAG_USR|TOYFLAG_SBIN))
-+USE_CHVT(NEWTOY(chvt, "<1", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config CHVT
-   bool "chvt"
-diff --git a/toys/other/ifconfig.c b/toys/other/ifconfig.c
-index 8db3ff0..445799d 100644
---- a/toys/other/ifconfig.c
-+++ b/toys/other/ifconfig.c
-@@ -6,7 +6,7 @@
-  *
-  * Not in SUSv4.
- 
--USE_IFCONFIG(NEWTOY(ifconfig, "^?a", TOYFLAG_BIN))
-+USE_IFCONFIG(NEWTOY(ifconfig, "^?a", TOYFLAG_SBIN))
- 
- config IFCONFIG
-   bool "ifconfig"
-diff --git a/toys/other/insmod.c b/toys/other/insmod.c
-index 81721a3..cb222a5 100644
---- a/toys/other/insmod.c
-+++ b/toys/other/insmod.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_INSMOD(NEWTOY(insmod, "<1", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
-+USE_INSMOD(NEWTOY(insmod, "<1", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
- 
- config INSMOD
-   bool "insmod"
-diff --git a/toys/other/lsmod.c b/toys/other/lsmod.c
-index b8f5d82..4d16048 100644
---- a/toys/other/lsmod.c
-+++ b/toys/other/lsmod.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_LSMOD(NEWTOY(lsmod, NULL, TOYFLAG_BIN))
-+USE_LSMOD(NEWTOY(lsmod, NULL, TOYFLAG_SBIN))
- 
- config LSMOD
-   bool "lsmod"
-diff --git a/toys/other/netcat.c b/toys/other/netcat.c
-index d27aa88..0fd26f7 100644
---- a/toys/other/netcat.c
-+++ b/toys/other/netcat.c
-@@ -4,7 +4,7 @@
-  *
-  * TODO: udp, ipv6, genericize for telnet/microcom/tail-f
- 
--USE_NETCAT(OLDTOY(nc, netcat, TOYFLAG_BIN))
-+USE_NETCAT(OLDTOY(nc, netcat, TOYFLAG_USR|TOYFLAG_BIN))
- USE_NETCAT(NEWTOY(netcat, USE_NETCAT_LISTEN("^tlL")"w#p#s:q#f:", TOYFLAG_BIN))
- 
- config NETCAT
-diff --git a/toys/other/pivot_root.c b/toys/other/pivot_root.c
-index 9a1f56c..7748032 100644
---- a/toys/other/pivot_root.c
-+++ b/toys/other/pivot_root.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Rob Landley <rob@landley.net>
- 
--USE_PIVOT_ROOT(NEWTOY(pivot_root, "<2>2", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_PIVOT_ROOT(NEWTOY(pivot_root, "<2>2", TOYFLAG_SBIN))
- 
- config PIVOT_ROOT
-   bool "pivot_root"
-diff --git a/toys/other/readlink.c b/toys/other/readlink.c
-index 1c33362..fecd1ef 100644
---- a/toys/other/readlink.c
-+++ b/toys/other/readlink.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2007 Rob Landley <rob@landley.net>
- 
--USE_READLINK(NEWTOY(readlink, "<1>1fenq[-fe]", TOYFLAG_BIN))
-+USE_READLINK(NEWTOY(readlink, "<1>1fenq[-fe]", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config READLINK
-   bool "readlink"
-diff --git a/toys/other/reboot.c b/toys/other/reboot.c
-index 8baa4d8..a135888 100644
---- a/toys/other/reboot.c
-+++ b/toys/other/reboot.c
-@@ -2,9 +2,9 @@
-  *
-  * Copyright 2013 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
--USE_REBOOT(OLDTOY(halt, reboot, TOYFLAG_BIN|TOYFLAG_NEEDROOT))
--USE_REBOOT(OLDTOY(poweroff, reboot, TOYFLAG_BIN|TOYFLAG_NEEDROOT))
-+USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
-+USE_REBOOT(OLDTOY(halt, reboot, TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
-+USE_REBOOT(OLDTOY(poweroff, reboot, TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
- 
- config REBOOT
-   bool "reboot"
-diff --git a/toys/other/rfkill.c b/toys/other/rfkill.c
-index af3efe1..7527ec7 100644
---- a/toys/other/rfkill.c
-+++ b/toys/other/rfkill.c
-@@ -5,7 +5,7 @@
-  *
-  * No Standard
- 
--USE_RFKILL(NEWTOY(rfkill, "<1>2", TOYFLAG_SBIN))
-+USE_RFKILL(NEWTOY(rfkill, "<1>2", TOYFLAG_USR|TOYFLAG_SBIN))
- 
- config RFKILL
-   bool "rfkill"
-diff --git a/toys/other/rmmod.c b/toys/other/rmmod.c
-index b789acc..10c134c 100644
---- a/toys/other/rmmod.c
-+++ b/toys/other/rmmod.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_RMMOD(NEWTOY(rmmod, "<1wf", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
-+USE_RMMOD(NEWTOY(rmmod, "<1wf", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
- 
- config RMMOD
-   bool "rmmod"
-diff --git a/toys/other/swapoff.c b/toys/other/swapoff.c
-index b89e915..fb17130 100644
---- a/toys/other/swapoff.c
-+++ b/toys/other/swapoff.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_SWAPOFF(NEWTOY(swapoff, "<1>1", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
-+USE_SWAPOFF(NEWTOY(swapoff, "<1>1", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
- 
- config SWAPOFF
-   bool "swapoff"
-diff --git a/toys/other/swapon.c b/toys/other/swapon.c
-index 49f1249..838d382 100644
---- a/toys/other/swapon.c
-+++ b/toys/other/swapon.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_SWAPON(NEWTOY(swapon, "<1>1p#<0>32767", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
-+USE_SWAPON(NEWTOY(swapon, "<1>1p#<0>32767", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
- 
- config SWAPON
-   bool "swapon"
-diff --git a/toys/other/sysctl.c b/toys/other/sysctl.c
-index 8e57ca1..0c6c640 100644
---- a/toys/other/sysctl.c
-+++ b/toys/other/sysctl.c
-@@ -5,7 +5,7 @@
-  *
-  * No Standard
-  
--USE_SYSCTL(NEWTOY(sysctl, "^neNqwpaA[!ap][!aq][!aw][+aA]", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_SYSCTL(NEWTOY(sysctl, "^neNqwpaA[!ap][!aq][!aw][+aA]", TOYFLAG_SBIN))
- 
- config SYSCTL
-   bool "sysctl"
-diff --git a/toys/posix/cut.c b/toys/posix/cut.c
-index 7f10c5e..1ab3ce8 100644
---- a/toys/posix/cut.c
-+++ b/toys/posix/cut.c
-@@ -5,7 +5,7 @@
-  *
-  * http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html 
- 
--USE_CUT(NEWTOY(cut, "b:|c:|f:|d:sn[!cbf]", TOYFLAG_BIN))
-+USE_CUT(NEWTOY(cut, "b:|c:|f:|d:sn[!cbf]", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config CUT
-   bool "cut"
-diff --git a/toys/posix/df.c b/toys/posix/df.c
-index 141e8e5..5d37b45 100644
---- a/toys/posix/df.c
-+++ b/toys/posix/df.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/df.html
- 
--USE_DF(NEWTOY(df, "Pkt*a[-Pk]", TOYFLAG_USR|TOYFLAG_SBIN))
-+USE_DF(NEWTOY(df, "Pkt*a[-Pk]", TOYFLAG_BIN))
- 
- config DF
-   bool "df"
-diff --git a/toys/posix/head.c b/toys/posix/head.c
-index e8517d4..3ac4373 100644
---- a/toys/posix/head.c
-+++ b/toys/posix/head.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/head.html
- 
--USE_HEAD(NEWTOY(head, "n#<0=10", TOYFLAG_BIN))
-+USE_HEAD(NEWTOY(head, "n#<0=10", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config HEAD
-   bool "head"
-diff --git a/toys/posix/id.c b/toys/posix/id.c
-index 353aa04..7ab489e 100644
---- a/toys/posix/id.c
-+++ b/toys/posix/id.c
-@@ -6,10 +6,10 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/id.html
- 
--USE_ID(NEWTOY(id, ">1"USE_ID_SELINUX("Z")"nGgru[!"USE_ID_SELINUX("Z")"Ggu]", TOYFLAG_BIN))
-+USE_ID(NEWTOY(id, ">1"USE_ID_SELINUX("Z")"nGgru[!"USE_ID_SELINUX("Z")"Ggu]", TOYFLAG_USR|TOYFLAG_BIN))
- USE_GROUPS(NEWTOY(groups, NULL, TOYFLAG_USR|TOYFLAG_BIN))
--USE_LOGNAME(NEWTOY(logname, ">0", TOYFLAG_BIN))
--USE_WHOAMI(OLDTOY(whoami, logname, TOYFLAG_BIN))
-+USE_LOGNAME(NEWTOY(logname, ">0", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_WHOAMI(OLDTOY(whoami, logname, TOYFLAG_USR|TOYFLAG_BIN))
- 
- config ID
-   bool "id"
-diff --git a/toys/posix/mkfifo.c b/toys/posix/mkfifo.c
-index 15fab70..4e0fca3 100644
---- a/toys/posix/mkfifo.c
-+++ b/toys/posix/mkfifo.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/mkfifo.html
- 
--USE_MKFIFO(NEWTOY(mkfifo, "<1m:", TOYFLAG_BIN))
-+USE_MKFIFO(NEWTOY(mkfifo, "<1m:", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config MKFIFO
-   bool "mkfifo"
-diff --git a/toys/posix/renice.c b/toys/posix/renice.c
-index 8c20644..489eb13 100644
---- a/toys/posix/renice.c
-+++ b/toys/posix/renice.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://pubs.opengroup.org/onlinepubs/9699919799/utilities/renice.html
- 
--USE_RENICE(NEWTOY(renice, "<1gpun#|", TOYFLAG_BIN))
-+USE_RENICE(NEWTOY(renice, "<1gpun#|", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config RENICE
-   bool "renice"
-diff --git a/toys/posix/tail.c b/toys/posix/tail.c
-index e92c044..ba1d311 100644
---- a/toys/posix/tail.c
-+++ b/toys/posix/tail.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/tail.html
- 
--USE_TAIL(NEWTOY(tail, "fc-n-[-cn]", TOYFLAG_BIN))
-+USE_TAIL(NEWTOY(tail, "fc-n-[-cn]", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config TAIL
-   bool "tail"
-diff --git a/toys/posix/tee.c b/toys/posix/tee.c
-index 0388510..5574088 100644
---- a/toys/posix/tee.c
-+++ b/toys/posix/tee.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/tee.html
- 
--USE_TEE(NEWTOY(tee, "ia", TOYFLAG_BIN))
-+USE_TEE(NEWTOY(tee, "ia", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config TEE
-   bool "tee"
-diff --git a/toys/posix/uniq.c b/toys/posix/uniq.c
-index 3cfdb94..c127cfe 100644
---- a/toys/posix/uniq.c
-+++ b/toys/posix/uniq.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/uniq.html
- 
--USE_UNIQ(NEWTOY(uniq, "f#s#w#zicdu", TOYFLAG_BIN))
-+USE_UNIQ(NEWTOY(uniq, "f#s#w#zicdu", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config UNIQ
-   bool "uniq"
-diff --git a/toys/posix/who.c b/toys/posix/who.c
-index 876a562..414cdfc 100644
---- a/toys/posix/who.c
-+++ b/toys/posix/who.c
-@@ -9,7 +9,7 @@
-  * Posix says to support many options (-abdHlmpqrstTu) but this
-  * isn't aimed at minicomputers with modem pools.
- 
--USE_WHO(NEWTOY(who, "a", TOYFLAG_BIN))
-+USE_WHO(NEWTOY(who, "a", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config WHO
-   bool "who"
--- 
-1.8.1.2
-
-- 
2.1.4


