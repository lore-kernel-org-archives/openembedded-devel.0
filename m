Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9259EC27C5D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.63863.1699041165611404386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D76ppVXD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p9Xhm6Qh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bee760-b69264aa-7a04-4834-9a2a-441c0ffc8334-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s5fryYGHE10CiK/087XP2bU7JqmzVHgHNXuUZ9aXqrI=;
	b=D76ppVXD6Y2glrFcBv/sPtzO5iCjChl236323uqXphAWbRpJpn/yEwq23Ih9Eo/n
	Ox6BiQpYrKHcIzmOBRbmzs8SGogzeSi37Z7bl+CXXmJMej7CAmdM9flzEyodp89X/RA
	VUgFWZpekxKxS+k0xUTONSnkQVySPwDRNkhVaW9k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s5fryYGHE10CiK/087XP2bU7JqmzVHgHNXuUZ9aXqrI=;
	b=p9Xhm6QhIqZy/vIwieifRk3Ery8zBclRql+tnZRxIqDIbWcKWSwx4eX1D1gmFZSm
	1/6XEsZ9rWOzlGl4ufyWnCuXJosB5GL7Zy3Fp7h7xATO2rbKLqlPtD4L97PqvuGUyOf
	xyL09qvQsKEGuKmqyWcSZOKQ4zTIho1OIX7bDAok=
Content-Type: multipart/mixed; boundary="===============4706915727543040374=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] toybox: upgrading to 0.8.10 SUCCEEDED
Message-ID: <0101018b96bee760-b69264aa-7a04-4834-9a2a-441c0ffc8334-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106024

--===============4706915727543040374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *toybox* to *0.8.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-toybox-upgrade-0.8.8-0.8.10.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d92e0cf96da684965640df75dc819be3b888a4ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:49:53 +0000
Subject: [PATCH] toybox: upgrade 0.8.8 -> 0.8.10

---
 ...timer_settime_wrap-for-32bit-systems.patch | 37 -------------------
 .../{toybox_0.8.8.bb => toybox_0.8.10.bb}     |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.8.8.bb => toybox_0.8.10.bb} (95%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch b/meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch
deleted file mode 100644
index 8976b3748..000000000
--- a/meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7284c7ae0df9aa5a9c8aa0a81a018e17289fe2c4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Sep 2022 07:22:26 -0700
-Subject: [PATCH] portability: Fix timer_settime_wrap for 32bit systems with
- 64bit time_t
-
-glibc does not define SYS_timer_settime if the 32bit syscall is not
-available, new architectures like riscv32 has defaulted to 64bit time_t
-from get go and avoided wiring 32bit syscall, therefore alias it to
-64bit version here
-
-Upstream-Status: Submitted [https://github.com/landley/toybox/pull/373]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/portability.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/lib/portability.c b/lib/portability.c
-index d955d081..4baa9367 100644
---- a/lib/portability.c
-+++ b/lib/portability.c
-@@ -711,6 +711,12 @@ int timer_create_wrap(clockid_t c, struct sigevent *se, timer_t *t)
-   return 0;
- }
- 
-+#if !defined(SYS_timer_settime) && defined(SYS_timer_settime64)
-+// glibc does not define defines SYS_timer_settime on 32-bit systems
-+// with 64-bit time_t defaults e.g. riscv32
-+#define SYS_timer_settime SYS_timer_settime64
-+#endif
-+
- int timer_settime_wrap(timer_t t, int flags, struct itimerspec *val,
-   struct itimerspec *old)
- {
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.8.bb b/meta-oe/recipes-core/toybox/toybox_0.8.10.bb
similarity index 95%
rename from meta-oe/recipes-core/toybox/toybox_0.8.8.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.10.bb
index 6836b1468..d747ebf36 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.10.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-           file://0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch \
-           "
-SRC_URI[sha256sum] = "dafd41978d40f02a61cf1be99a2b4a25812bbfb9c3157e679ee7611202d6ac58"
+SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d3afee05ca90bf425ced73f527e418fecd626c5340b5f58711a14531f8d7d108"
 
 SECTION = "base"
 
-- 
2.39.2


--===============4706915727543040374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/toybox: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox: SRC_URI changed from "http://www.landley.net/toybox/downloads/toybox-0.8.8.tar.gz file://0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch" to "http://www.landley.net/toybox/downloads/toybox-0.8.10.tar.gz"
packages/core2-64-poky-linux/toybox/toybox-dbg: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox-dbg: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox-dbg: PKGSIZE changed from 3779936 to 3970696 (+5%)
packages/core2-64-poky-linux/toybox/toybox-dev: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox-dev: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox-doc: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox-doc: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox-locale: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox-locale: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox-src: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox-src: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox-src: PKGSIZE changed from 1061416 to 1102358 (+4%)
packages/core2-64-poky-linux/toybox/toybox-src: FILELIST: directory renamed /usr/src/debug/toybox/0.8.8-r0/toys/lsb -> /usr/src/debug/toybox/0.8.10-r0/toys/lsb, directory renamed /usr/src/debug/toybox/0.8.8-r0/toys/net -> /usr/src/debug/toybox/0.8.10-r0/toys/net, directory renamed /usr/src/debug/toybox/0.8.8-r0 -> /usr/src/debug/toybox/0.8.10-r0, directory renamed /usr/src/debug/toybox/0.8.8-r0/lib -> /usr/src/debug/toybox/0.8.10-r0/lib, directory renamed /usr/src/debug/toybox/0.8.8-r0/generated -> /usr/src/debug/toybox/0.8.10-r0/generated, removed "/usr/src/debug/toybox/0.8.8-r0/toys/posix/cp.c /usr/src/debug/toybox/0.8.8-r0/toys/other/hwclock.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/grep.c /usr/src/debug/toybox/0.8.8-r0/toys/other/tac.c /usr/src/debug/toybox/0.8.8-r0/toys/other/blockdev.c /usr/src/debug/toybox/0.8.8-r0/toys/other/fmt.c /usr/src/debug/toybox/0.8.8-r0/toys/other/mkpasswd.c /usr/src/debug/toybox/0.8.8-r0/toys/other/watchdog.c /usr/src/debug/toybox/0.8.8-r0/toys/oth
 er/acpi.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/nl.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/ls.c /usr/src/debug/toybox/0.8.8-r0/toys/other/uclampset.c /usr/src/debug/toybox/0.8.8-r0/toys/other/freeramdisk.c /usr/src/debug/toybox/0.8.8-r0/toys/other/ascii.c /usr/src/debug/toybox/0.8.8-r0/toys/other/blkid.c /usr/src/debug/toybox/0.8.8-r0/toys/other/bzcat.c /usr/src/debug/toybox/0.8.8-r0/toys/other/clear.c /usr/src/debug/toybox/0.8.8-r0/toys/other/count.c /usr/src/debug/toybox/0.8.8-r0/toys/other/eject.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/cal.c /usr/src/debug/toybox/0.8.8-r0/toys/other/flock.c /usr/src/debug/toybox/0.8.8-r0/toys/other/modinfo.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/rm.c /usr/src/debug/toybox/0.8.8-r0/toys/other/blkdiscard.c /usr/src/debug/toybox/0.8.8-r0/toys/other/sha3sum.c /usr/src/debug/toybox/0.8.8-r0/toys/other/rev.c /usr/src/debug/toybox/0.8.8-r0/toys/other/nbd_client.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/touch.c /usr/src/debug/toybox/0.8.
 8-r0/toys/posix/uname.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/xargs.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/chgrp.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/chmod.c /usr/src/debug/toybox/0.8.8-r0/toys/other/switch_root.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/cpio.c /usr/src/debug/toybox/0.8.8-r0/toys/other/vmstat.c /usr/src/debug/toybox/0.8.8-r0/toys/other/base64.c /usr/src/debug/toybox/0.8.8-r0/toys/other/chroot.c /usr/src/debug/toybox/0.8.8-r0/toys/other/devmem.c /usr/src/debug/toybox/0.8.8-r0/toys/other/factor.c /usr/src/debug/toybox/0.8.8-r0/toys/other/insmod.c /usr/src/debug/toybox/0.8.8-r0/toys/other/ionice.c /usr/src/debug/toybox/0.8.8-r0/toys/other/lsattr.c /usr/src/debug/toybox/0.8.8-r0/toys/other/mkswap.c /usr/src/debug/toybox/0.8.8-r0/toys/other/openvt.c /usr/src/debug/toybox/0.8.8-r0/toys/other/readelf.c /usr/src/debug/toybox/0.8.8-r0/toys/other/swapoff.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/uniq.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/test.c /usr/s
 rc/debug/toybox/0.8.8-r0/toys/posix/getconf.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/cksum.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/false.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/iconv.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/mkdir.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/nohup.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/paste.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/patch.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/rmdir.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/sleep.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/split.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/kill.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/echo.c /usr/src/debug/toybox/0.8.8-r0/toys/other/gpiod.c /usr/src/debug/toybox/0.8.8-r0/toys/other/fsfreeze.c /usr/src/debug/toybox/0.8.8-r0/toys/other/uptime.c /usr/src/debug/toybox/0.8.8-r0/toys/other/usleep.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/id.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/head.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/tar.c /usr
 /src/debug/toybox/0.8.8-r0/toys/posix/du.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/date.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/time.c /usr/src/debug/toybox/0.8.8-r0/toys/other/free.c /usr/src/debug/toybox/0.8.8-r0/toys/other/partprobe.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/file.c /usr/src/debug/toybox/0.8.8-r0/toys/other/pmap.c /usr/src/debug/toybox/0.8.8-r0/toys/other/xxd.c /usr/src/debug/toybox/0.8.8-r0/toys/other/readlink.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/tail.c /usr/src/debug/toybox/0.8.8-r0/toys/other/vconfig.c /usr/src/debug/toybox/0.8.8-r0/toys/other/reboot.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/strings.c /usr/src/debug/toybox/0.8.8-r0/toys/other/fallocate.c /usr/src/debug/toybox/0.8.8-r0/toys/other/mcookie.c /usr/src/debug/toybox/0.8.8-r0/toys/other/rtcwake.c /usr/src/debug/toybox/0.8.8-r0/toys/other/chrt.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/comm.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/link.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/tee
 .c /usr/src/debug/toybox/0.8.8-r0/toys/other/pwdx.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/env.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/tty.c /usr/src/debug/toybox/0.8.8-r0/toys/other/i2ctools.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/ln.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/cat.c /usr/src/debug/toybox/0.8.8-r0/toys/other/pivot_root.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/find.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/cmp.c /usr/src/debug/toybox/0.8.8-r0/toys/other/makedevs.c /usr/src/debug/toybox/0.8.8-r0/toys/other/dos2unix.c /usr/src/debug/toybox/0.8.8-r0/toys/other/setsid.c /usr/src/debug/toybox/0.8.8-r0/toys/other/sysctl.c /usr/src/debug/toybox/0.8.8-r0/toys/other/inotifyd.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/sed.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/sort.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/od.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/pwd.c /usr/src/debug/toybox/0.8.8-r0/toys/other/setfattr.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/t
 rue.c /usr/src/debug/toybox/0.8.8-r0/toys/other/mountpoint.c /usr/src/debug/toybox/0.8.8-r0/toys/other/help.c /usr/src/debug/toybox/0.8.8-r0/toys/other/hexedit.c /usr/src/debug/toybox/0.8.8-r0/toys/other/taskset.c /usr/src/debug/toybox/0.8.8-r0/toys/other/timeout.c /usr/src/debug/toybox/0.8.8-r0/toys/other/w.c /usr/src/debug/toybox/0.8.8-r0/toys/other/stat.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/df.c /usr/src/debug/toybox/0.8.8-r0/toys/other/nsenter.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/basename.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/wc.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/who.c /usr/src/debug/toybox/0.8.8-r0/toys/other/losetup.c /usr/src/debug/toybox/0.8.8-r0/toys/other/login.c /usr/src/debug/toybox/0.8.8-r0/toys/other/lsmod.c /usr/src/debug/toybox/0.8.8-r0/toys/other/lsusb.c /usr/src/debug/toybox/0.8.8-r0/toys/other/oneit.c /usr/src/debug/toybox/0.8.8-r0/toys/other/pwgen.c /usr/src/debug/toybox/0.8.8-r0/toys/other/reset.c /usr/src/debug/toybox/0.8.8-r0/toys/o
 ther/rmmod.c /usr/src/debug/toybox/0.8.8-r0/toys/other/watch.c /usr/src/debug/toybox/0.8.8-r0/toys/other/which.c /usr/src/debug/toybox/0.8.8-r0/toys/other/shred.c /usr/src/debug/toybox/0.8.8-r0/toys/other/readahead.c /usr/src/debug/toybox/0.8.8-r0/toys/other/mix.c /usr/src/debug/toybox/0.8.8-r0/toys/other/printenv.c /usr/src/debug/toybox/0.8.8-r0/toys/other/truncate.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/nice.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/expand.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/logger.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/mkfifo.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/printf.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/ps.c /usr/src/debug/toybox/0.8.8-r0/toys/other/uuidgen.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/renice.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/ulimit.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/unlink.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/dirname.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/cut.c /usr/src/debug/toybox
 /0.8.8-r0/toys/posix/uudecode.c /usr/src/debug/toybox/0.8.8-r0/toys/posix/uuencode.c /usr/src/debug/toybox/0.8.8-r0/toys/other/fsync.c /usr/src/debug/toybox/0.8.8-r0/toys/other/yes.c", added "/usr/src/debug/toybox/0.8.10-r0/toys/posix/echo.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/file.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/find.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/pwd.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/grep.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/head.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/kill.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/uniq.c /usr/src/debug/toybox/0.8.10-r0/toys/other/free.c /usr/src/debug/toybox/0.8.10-r0/toys/other/acpi.c /usr/src/debug/toybox/0.8.10-r0/toys/other/chrt.c /usr/src/debug/toybox/0.8.10-r0/toys/other/help.c /usr/src/debug/toybox/0.8.10-r0/toys/other/pmap.c /usr/src/debug/toybox/0.8.10-r0/toys/other/pwdx.c /usr/src/debug/toybox/0.8.10-r0/toys/other/shuf.c /usr/src/debug/toybox/0.8.10-r0/toys/other/stat.c /usr/s
 rc/debug/toybox/0.8.10-r0/toys/other/makedevs.c /usr/src/debug/toybox/0.8.10-r0/toys/other/switch_root.c /usr/src/debug/toybox/0.8.10-r0/toys/other/swapoff.c /usr/src/debug/toybox/0.8.10-r0/toys/other/pivot_root.c /usr/src/debug/toybox/0.8.10-r0/toys/other/fsfreeze.c /usr/src/debug/toybox/0.8.10-r0/toys/other/ionice.c /usr/src/debug/toybox/0.8.10-r0/toys/other/uptime.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/printf.c /usr/src/debug/toybox/0.8.10-r0/toys/other/clear.c /usr/src/debug/toybox/0.8.10-r0/toys/other/count.c /usr/src/debug/toybox/0.8.10-r0/toys/other/eject.c /usr/src/debug/toybox/0.8.10-r0/toys/other/fsync.c /usr/src/debug/toybox/0.8.10-r0/toys/other/login.c /usr/src/debug/toybox/0.8.10-r0/toys/other/lsmod.c /usr/src/debug/toybox/0.8.10-r0/toys/other/lsusb.c /usr/src/debug/toybox/0.8.10-r0/toys/other/oneit.c /usr/src/debug/toybox/0.8.10-r0/toys/other/pwgen.c /usr/src/debug/toybox/0.8.10-r0/toys/other/reset.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/getconf.c /usr/src/d
 ebug/toybox/0.8.10-r0/toys/posix/who.c /usr/src/debug/toybox/0.8.10-r0/toys/other/freeramdisk.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/strings.c /usr/src/debug/toybox/0.8.10-r0/toys/other/nbd_server.c /usr/src/debug/toybox/0.8.10-r0/toys/other/printenv.c /usr/src/debug/toybox/0.8.10-r0/toys/other/i2ctools.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/mkfifo.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/env.c /usr/src/debug/toybox/0.8.10-r0/toys/other/uuidgen.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/od.c /usr/src/debug/toybox/0.8.10-r0/toys/other/yes.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cal.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/tar.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/tty.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/tee.c /usr/src/debug/toybox/0.8.10-r0/toys/other/uclampset.c /usr/src/debug/toybox/0.8.10-r0/toys/other/hexedit.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cut.c /usr/src/debug/toybox/0.8.10-r0/toys/other/tac.c /usr/src/debug/toybox/0.8.10-r0
 /toys/other/flock.c /usr/src/debug/toybox/0.8.10-r0/toys/other/ascii.c /usr/src/debug/toybox/0.8.10-r0/toys/other/blkid.c /usr/src/debug/toybox/0.8.10-r0/toys/other/bzcat.c /usr/src/debug/toybox/0.8.10-r0/toys/other/gpiod.c /usr/src/debug/toybox/0.8.10-r0/toys/other/rmmod.c /usr/src/debug/toybox/0.8.10-r0/toys/other/shred.c /usr/src/debug/toybox/0.8.10-r0/toys/other/watch.c /usr/src/debug/toybox/0.8.10-r0/toys/other/which.c /usr/src/debug/toybox/0.8.10-r0/toys/other/xxd.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/nl.c /usr/src/debug/toybox/0.8.10-r0/toys/other/vmstat.c /usr/src/debug/toybox/0.8.10-r0/toys/other/reboot.c /usr/src/debug/toybox/0.8.10-r0/toys/other/fmt.c /usr/src/debug/toybox/0.8.10-r0/toys/other/openvt.c /usr/src/debug/toybox/0.8.10-r0/toys/other/setfattr.c /usr/src/debug/toybox/0.8.10-r0/toys/other/modinfo.c /usr/src/debug/toybox/0.8.10-r0/toys/other/readelf.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/basename.c /usr/src/debug/toybox/0.8.10-r0/toys/other/w.c /usr/s
 rc/debug/toybox/0.8.10-r0/toys/posix/dd.c /usr/src/debug/toybox/0.8.10-r0/toys/other/mkpasswd.c /usr/src/debug/toybox/0.8.10-r0/toys/other/readlink.c /usr/src/debug/toybox/0.8.10-r0/toys/other/blkdiscard.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cmp.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/wc.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/df.c /usr/src/debug/toybox/0.8.10-r0/toys/other/nbd_client.c /usr/src/debug/toybox/0.8.10-r0/toys/other/readahead.c /usr/src/debug/toybox/0.8.10-r0/toys/other/losetup.c /usr/src/debug/toybox/0.8.10-r0/toys/other/partprobe.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/expand.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/logger.c /usr/src/debug/toybox/0.8.10-r0/toys/other/dos2unix.c /usr/src/debug/toybox/0.8.10-r0/toys/other/timeout.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/ulimit.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/chgrp.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/chmod.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cksum.c /usr/src/de
 bug/toybox/0.8.10-r0/toys/posix/false.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/iconv.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/mkdir.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/nohup.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/paste.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/patch.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/du.c /usr/src/debug/toybox/0.8.10-r0/toys/other/rev.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/sed.c /usr/src/debug/toybox/0.8.10-r0/toys/other/sha3sum.c /usr/src/debug/toybox/0.8.10-r0/toys/other/nsenter.c /usr/src/debug/toybox/0.8.10-r0/toys/other/rtcwake.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cat.c /usr/src/debug/toybox/0.8.10-r0/toys/other/mcookie.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/unlink.c /usr/src/debug/toybox/0.8.10-r0/toys/other/fallocate.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/ps.c /usr/src/debug/toybox/0.8.10-r0/toys/other/sysctl.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/uudecode.c /usr/src/debug/toybox/0.8.10-r0/to
 ys/posix/uuencode.c /usr/src/debug/toybox/0.8.10-r0/toys/other/taskset.c /usr/src/debug/toybox/0.8.10-r0/toys/other/watchdog.c /usr/src/debug/toybox/0.8.10-r0/toys/other/vconfig.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/ls.c /usr/src/debug/toybox/0.8.10-r0/toys/other/blockdev.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/renice.c /usr/src/debug/toybox/0.8.10-r0/toys/other/inotifyd.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/link.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/sort.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/test.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/time.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/true.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/nice.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/tail.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/comm.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cpio.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/date.c /usr/src/debug/toybox/0.8.10-r0/toys/other/hwclock.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/dirname.c /us
 r/src/debug/toybox/0.8.10-r0/toys/other/mkswap.c /usr/src/debug/toybox/0.8.10-r0/toys/other/usleep.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/rm.c /usr/src/debug/toybox/0.8.10-r0/toys/other/insmod.c /usr/src/debug/toybox/0.8.10-r0/toys/other/setsid.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/ln.c /usr/src/debug/toybox/0.8.10-r0/toys/other/truncate.c /usr/src/debug/toybox/0.8.10-r0/toys/other/base64.c /usr/src/debug/toybox/0.8.10-r0/toys/other/factor.c /usr/src/debug/toybox/0.8.10-r0/toys/other/lsattr.c /usr/src/debug/toybox/0.8.10-r0/toys/other/mix.c /usr/src/debug/toybox/0.8.10-r0/toys/other/devmem.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/id.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/cp.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/rmdir.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/sleep.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/split.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/touch.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/uname.c /usr/src/debug/toybox/0.8.10-r0/to
 ys/other/mountpoint.c /usr/src/debug/toybox/0.8.10-r0/toys/posix/xargs.c /usr/src/debug/toybox/0.8.10-r0/toys/other/chroot.c"
packages/core2-64-poky-linux/toybox/toybox-staticdev: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox-staticdev: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox: PKGV changed from 0.8.8 [default] to 0.8.10 [default]
packages/core2-64-poky-linux/toybox/toybox: PV changed from "0.8.8" to "0.8.10"
packages/core2-64-poky-linux/toybox/toybox: PKGSIZE changed from 454870 to 471903 (+4%)
packages/core2-64-poky-linux/toybox/toybox: latest.pkg_postinst changed from "#!/bin/sh
set -e
	update-alternatives --install /bin/[ [ /usr/bin/toybox 60
	update-alternatives --install /usr/bin/acpi acpi /usr/bin/toybox 60
	update-alternatives --install /usr/bin/arch arch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ascii ascii /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base32 base32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base64 base64 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/basename basename /usr/bin/toybox 60
	update-alternatives --install /bin/blkdiscard blkdiscard /usr/bin/toybox 60
	update-alternatives --install /bin/blkid blkid /usr/bin/toybox 60
	update-alternatives --install /sbin/blockdev blockdev /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bunzip2 bunzip2 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bzcat bzcat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cal cal /usr/bin/toybox 60
	update-alternatives --install /bin/cat cat /usr/bin/toybox 60
	update-alternatives --install /bin/chattr chattr /usr/bin/toybox 60
	update-alternatives --install /bin/chgrp chgrp /usr/bin/toybox 60
	update-alternatives --install /bin/chmod chmod /usr/bin/toybox 60
	update-alternatives --install /bin/chown chown /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/chroot chroot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chrt chrt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chvt chvt /usr/bin/toybox 60
	update-alternatives --install /bin/cksum cksum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/clear clear /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cmp cmp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/comm comm /usr/bin/toybox 60
	update-alternatives --install /usr/bin/count count /usr/bin/toybox 60
	update-alternatives --install /bin/cp cp /usr/bin/toybox 60
	update-alternatives --install /bin/cpio cpio /usr/bin/toybox 60
	update-alternatives --install /bin/crc32 crc32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cut cut /usr/bin/toybox 60
	update-alternatives --install /bin/date date /usr/bin/toybox 60
	update-alternatives --install /usr/bin/deallocvt deallocvt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/devmem devmem /usr/bin/toybox 60
	update-alternatives --install /sbin/df df /usr/bin/toybox 60
	update-alternatives --install /usr/bin/dirname dirname /usr/bin/toybox 60
	update-alternatives --install /bin/dmesg dmesg /usr/bin/toybox 60
	update-alternatives --install /bin/dnsdomainname dnsdomainname /usr/bin/toybox 60
	update-alternatives --install /bin/dos2unix dos2unix /usr/bin/toybox 60
	update-alternatives --install /usr/bin/du du /usr/bin/toybox 60
	update-alternatives --install /bin/echo echo /usr/bin/toybox 60
	update-alternatives --install /bin/egrep egrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/eject eject /usr/bin/toybox 60
	update-alternatives --install /usr/bin/env env /usr/bin/toybox 60
	update-alternatives --install /usr/bin/expand expand /usr/bin/toybox 60
	update-alternatives --install /usr/bin/factor factor /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fallocate fallocate /usr/bin/toybox 60
	update-alternatives --install /bin/false false /usr/bin/toybox 60
	update-alternatives --install /bin/fgrep fgrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/file file /usr/bin/toybox 60
	update-alternatives --install /usr/bin/find find /usr/bin/toybox 60
	update-alternatives --install /usr/bin/flock flock /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fmt fmt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/free free /usr/bin/toybox 60
	update-alternatives --install /sbin/freeramdisk freeramdisk /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/fsfreeze fsfreeze /usr/bin/toybox 60
	update-alternatives --install /bin/fstype fstype /usr/bin/toybox 60
	update-alternatives --install /bin/fsync fsync /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpget ftpget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpput ftpput /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiodetect gpiodetect /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiofind gpiofind /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioget gpioget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioinfo gpioinfo /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioset gpioset /usr/bin/toybox 60
	update-alternatives --install /bin/grep grep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/groups groups /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gunzip gunzip /usr/bin/toybox 60
	update-alternatives --install /sbin/halt halt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/head head /usr/bin/toybox 60
	update-alternatives --install /bin/help help /usr/bin/toybox 60
	update-alternatives --install /usr/bin/hexedit hexedit /usr/bin/toybox 60
	update-alternatives --install /usr/bin/host host /usr/bin/toybox 60
	update-alternatives --install /bin/hostname hostname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/httpd httpd /usr/bin/toybox 60
	update-alternatives --install /sbin/hwclock hwclock /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cdetect i2cdetect /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cdump i2cdump /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cget i2cget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cset i2cset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/id id /usr/bin/toybox 60
	update-alternatives --install /sbin/ifconfig ifconfig /usr/bin/toybox 60
	update-alternatives --install /usr/bin/inotifyd inotifyd /usr/bin/toybox 60
	update-alternatives --install /sbin/insmod insmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/install install /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ionice ionice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iorenice iorenice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iotop iotop /usr/bin/toybox 60
	update-alternatives --install /bin/kill kill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/killall killall /usr/bin/toybox 60
	update-alternatives --install /usr/bin/link link /usr/bin/toybox 60
	update-alternatives --install /usr/bin/linux32 linux32 /usr/bin/toybox 60
	update-alternatives --install /bin/ln ln /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logger logger /usr/bin/toybox 60
	update-alternatives --install /bin/login login /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logname logname /usr/bin/toybox 60
	update-alternatives --install /sbin/losetup losetup /usr/bin/toybox 60
	update-alternatives --install /bin/ls ls /usr/bin/toybox 60
	update-alternatives --install /bin/lsattr lsattr /usr/bin/toybox 60
	update-alternatives --install /sbin/lsmod lsmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lspci lspci /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lsusb lsusb /usr/bin/toybox 60
	update-alternatives --install /usr/bin/makedevs makedevs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mcookie mcookie /usr/bin/toybox 60
	update-alternatives --install /usr/bin/md5sum md5sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/microcom microcom /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mix mix /usr/bin/toybox 60
	update-alternatives --install /bin/mkdir mkdir /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkfifo mkfifo /usr/bin/toybox 60
	update-alternatives --install /bin/mknod mknod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkpasswd mkpasswd /usr/bin/toybox 60
	update-alternatives --install /sbin/mkswap mkswap /usr/bin/toybox 60
	update-alternatives --install /bin/mktemp mktemp /usr/bin/toybox 60
	update-alternatives --install /sbin/modinfo modinfo /usr/bin/toybox 60
	update-alternatives --install /bin/mount mount /usr/bin/toybox 60
	update-alternatives --install /bin/mountpoint mountpoint /usr/bin/toybox 60
	update-alternatives --install /bin/mv mv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nbd-client nbd-client /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nc nc /usr/bin/toybox 60
	update-alternatives --install /bin/netcat netcat /usr/bin/toybox 60
	update-alternatives --install /bin/netstat netstat /usr/bin/toybox 60
	update-alternatives --install /bin/nice nice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nl nl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nohup nohup /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nproc nproc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nsenter nsenter /usr/bin/toybox 60
	update-alternatives --install /usr/bin/od od /usr/bin/toybox 60
	update-alternatives --install /sbin/oneit oneit /usr/bin/toybox 60
	update-alternatives --install /bin/openvt openvt /usr/bin/toybox 60
	update-alternatives --install /sbin/partprobe partprobe /usr/bin/toybox 60
	update-alternatives --install /usr/bin/passwd passwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/paste paste /usr/bin/toybox 60
	update-alternatives --install /usr/bin/patch patch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pgrep pgrep /usr/bin/toybox 60
	update-alternatives --install /bin/pidof pidof /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping ping /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping6 ping6 /usr/bin/toybox 60
	update-alternatives --install /sbin/pivot_root pivot_root /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pkill pkill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pmap pmap /usr/bin/toybox 60
	update-alternatives --install /sbin/poweroff poweroff /usr/bin/toybox 60
	update-alternatives --install /bin/printenv printenv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/printf printf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/prlimit prlimit /usr/bin/toybox 60
	update-alternatives --install /bin/ps ps /usr/bin/toybox 60
	update-alternatives --install /bin/pwd pwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwdx pwdx /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwgen pwgen /usr/bin/toybox 60
	update-alternatives --install /bin/readahead readahead /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readelf readelf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readlink readlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/realpath realpath /usr/bin/toybox 60
	update-alternatives --install /sbin/reboot reboot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/renice renice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/reset reset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rev rev /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/rfkill rfkill /usr/bin/toybox 60
	update-alternatives --install /bin/rm rm /usr/bin/toybox 60
	update-alternatives --install /bin/rmdir rmdir /usr/bin/toybox 60
	update-alternatives --install /sbin/rmmod rmmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rtcwake rtcwake /usr/bin/toybox 60
	update-alternatives --install /bin/sed sed /usr/bin/toybox 60
	update-alternatives --install /usr/bin/seq seq /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setfattr setfattr /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setsid setsid /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha1sum sha1sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha224sum sha224sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha256sum sha256sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha384sum sha384sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha3sum sha3sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha512sum sha512sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/shred shred /usr/bin/toybox 60
	update-alternatives --install /bin/sleep sleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sntp sntp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sort sort /usr/bin/toybox 60
	update-alternatives --install /usr/bin/split split /usr/bin/toybox 60
	update-alternatives --install /bin/stat stat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/strings strings /usr/bin/toybox 60
	update-alternatives --install /bin/su su /usr/bin/toybox 60
	update-alternatives --install /sbin/swapoff swapoff /usr/bin/toybox 60
	update-alternatives --install /sbin/switch_root switch_root /usr/bin/toybox 60
	update-alternatives --install /bin/sync sync /usr/bin/toybox 60
	update-alternatives --install /sbin/sysctl sysctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tac tac /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tail tail /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tar tar /usr/bin/toybox 60
	update-alternatives --install /usr/bin/taskset taskset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tee tee /usr/bin/toybox 60
	update-alternatives --install /usr/bin/test test /usr/bin/toybox 60
	update-alternatives --install /usr/bin/time time /usr/bin/toybox 60
	update-alternatives --install /usr/bin/timeout timeout /usr/bin/toybox 60
	update-alternatives --install /usr/bin/top top /usr/bin/toybox 60
	update-alternatives --install /bin/touch touch /usr/bin/toybox 60
	update-alternatives --install /bin/true true /usr/bin/toybox 60
	update-alternatives --install /usr/bin/truncate truncate /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tty tty /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tunctl tunctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uclampset uclampset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ulimit ulimit /usr/bin/toybox 60
	update-alternatives --install /bin/umount umount /usr/bin/toybox 60
	update-alternatives --install /bin/uname uname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unicode unicode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uniq uniq /usr/bin/toybox 60
	update-alternatives --install /bin/unix2dos unix2dos /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unlink unlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unshare unshare /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uptime uptime /usr/bin/toybox 60
	update-alternatives --install /bin/usleep usleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uudecode uudecode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuencode uuencode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuidgen uuidgen /usr/bin/toybox 60
	update-alternatives --install /sbin/vconfig vconfig /usr/bin/toybox 60
	update-alternatives --install /bin/vmstat vmstat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/w w /usr/bin/toybox 60
	update-alternatives --install /usr/bin/watch watch /usr/bin/toybox 60
	update-alternatives --install /bin/watchdog watchdog /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wc wc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wget wget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/which which /usr/bin/toybox 60
	update-alternatives --install /usr/bin/who who /usr/bin/toybox 60
	update-alternatives --install /usr/bin/whoami whoami /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xargs xargs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xxd xxd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/yes yes /usr/bin/toybox 60
	update-alternatives --install /usr/bin/zcat zcat /usr/bin/toybox 60
" to "#!/bin/sh
set -e
	update-alternatives --install /bin/[ [ /usr/bin/toybox 60
	update-alternatives --install /usr/bin/acpi acpi /usr/bin/toybox 60
	update-alternatives --install /usr/bin/arch arch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ascii ascii /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base32 base32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base64 base64 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/basename basename /usr/bin/toybox 60
	update-alternatives --install /bin/blkdiscard blkdiscard /usr/bin/toybox 60
	update-alternatives --install /bin/blkid blkid /usr/bin/toybox 60
	update-alternatives --install /sbin/blockdev blockdev /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bunzip2 bunzip2 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bzcat bzcat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cal cal /usr/bin/toybox 60
	update-alternatives --install /bin/cat cat /usr/bin/toybox 60
	update-alternatives --install /bin/chattr chattr /usr/bin/toybox 60
	update-alternatives --install /bin/chgrp chgrp /usr/bin/toybox 60
	update-alternatives --install /bin/chmod chmod /usr/bin/toybox 60
	update-alternatives --install /bin/chown chown /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/chroot chroot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chrt chrt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chvt chvt /usr/bin/toybox 60
	update-alternatives --install /bin/cksum cksum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/clear clear /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cmp cmp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/comm comm /usr/bin/toybox 60
	update-alternatives --install /usr/bin/count count /usr/bin/toybox 60
	update-alternatives --install /bin/cp cp /usr/bin/toybox 60
	update-alternatives --install /bin/cpio cpio /usr/bin/toybox 60
	update-alternatives --install /bin/crc32 crc32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cut cut /usr/bin/toybox 60
	update-alternatives --install /bin/date date /usr/bin/toybox 60
	update-alternatives --install /usr/bin/dd dd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/deallocvt deallocvt /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/devmem devmem /usr/bin/toybox 60
	update-alternatives --install /bin/df df /usr/bin/toybox 60
	update-alternatives --install /usr/bin/dirname dirname /usr/bin/toybox 60
	update-alternatives --install /bin/dmesg dmesg /usr/bin/toybox 60
	update-alternatives --install /bin/dnsdomainname dnsdomainname /usr/bin/toybox 60
	update-alternatives --install /bin/dos2unix dos2unix /usr/bin/toybox 60
	update-alternatives --install /usr/bin/du du /usr/bin/toybox 60
	update-alternatives --install /bin/echo echo /usr/bin/toybox 60
	update-alternatives --install /bin/egrep egrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/eject eject /usr/bin/toybox 60
	update-alternatives --install /usr/bin/env env /usr/bin/toybox 60
	update-alternatives --install /usr/bin/expand expand /usr/bin/toybox 60
	update-alternatives --install /usr/bin/factor factor /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fallocate fallocate /usr/bin/toybox 60
	update-alternatives --install /bin/false false /usr/bin/toybox 60
	update-alternatives --install /bin/fgrep fgrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/file file /usr/bin/toybox 60
	update-alternatives --install /usr/bin/find find /usr/bin/toybox 60
	update-alternatives --install /usr/bin/flock flock /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fmt fmt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/free free /usr/bin/toybox 60
	update-alternatives --install /sbin/freeramdisk freeramdisk /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/fsfreeze fsfreeze /usr/bin/toybox 60
	update-alternatives --install /bin/fstype fstype /usr/bin/toybox 60
	update-alternatives --install /bin/fsync fsync /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpget ftpget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpput ftpput /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiodetect gpiodetect /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiofind gpiofind /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioget gpioget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioinfo gpioinfo /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioset gpioset /usr/bin/toybox 60
	update-alternatives --install /bin/grep grep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/groups groups /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gunzip gunzip /usr/bin/toybox 60
	update-alternatives --install /sbin/halt halt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/head head /usr/bin/toybox 60
	update-alternatives --install /bin/help help /usr/bin/toybox 60
	update-alternatives --install /usr/bin/hexedit hexedit /usr/bin/toybox 60
	update-alternatives --install /usr/bin/host host /usr/bin/toybox 60
	update-alternatives --install /bin/hostname hostname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/httpd httpd /usr/bin/toybox 60
	update-alternatives --install /sbin/hwclock hwclock /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cdetect i2cdetect /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cdump i2cdump /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cget i2cget /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cset i2cset /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2ctransfer i2ctransfer /usr/bin/toybox 60
	update-alternatives --install /usr/bin/id id /usr/bin/toybox 60
	update-alternatives --install /sbin/ifconfig ifconfig /usr/bin/toybox 60
	update-alternatives --install /usr/bin/inotifyd inotifyd /usr/bin/toybox 60
	update-alternatives --install /sbin/insmod insmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/install install /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ionice ionice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iorenice iorenice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iotop iotop /usr/bin/toybox 60
	update-alternatives --install /bin/kill kill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/killall killall /usr/bin/toybox 60
	update-alternatives --install /usr/bin/link link /usr/bin/toybox 60
	update-alternatives --install /usr/bin/linux32 linux32 /usr/bin/toybox 60
	update-alternatives --install /bin/ln ln /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logger logger /usr/bin/toybox 60
	update-alternatives --install /bin/login login /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logname logname /usr/bin/toybox 60
	update-alternatives --install /sbin/losetup losetup /usr/bin/toybox 60
	update-alternatives --install /bin/ls ls /usr/bin/toybox 60
	update-alternatives --install /bin/lsattr lsattr /usr/bin/toybox 60
	update-alternatives --install /sbin/lsmod lsmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lspci lspci /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lsusb lsusb /usr/bin/toybox 60
	update-alternatives --install /usr/bin/makedevs makedevs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mcookie mcookie /usr/bin/toybox 60
	update-alternatives --install /usr/bin/md5sum md5sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/microcom microcom /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mix mix /usr/bin/toybox 60
	update-alternatives --install /bin/mkdir mkdir /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkfifo mkfifo /usr/bin/toybox 60
	update-alternatives --install /bin/mknod mknod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkpasswd mkpasswd /usr/bin/toybox 60
	update-alternatives --install /sbin/mkswap mkswap /usr/bin/toybox 60
	update-alternatives --install /bin/mktemp mktemp /usr/bin/toybox 60
	update-alternatives --install /sbin/modinfo modinfo /usr/bin/toybox 60
	update-alternatives --install /bin/mount mount /usr/bin/toybox 60
	update-alternatives --install /bin/mountpoint mountpoint /usr/bin/toybox 60
	update-alternatives --install /bin/mv mv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nbd-client nbd-client /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nbd-server nbd-server /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nc nc /usr/bin/toybox 60
	update-alternatives --install /bin/netcat netcat /usr/bin/toybox 60
	update-alternatives --install /bin/netstat netstat /usr/bin/toybox 60
	update-alternatives --install /bin/nice nice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nl nl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nohup nohup /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nproc nproc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nsenter nsenter /usr/bin/toybox 60
	update-alternatives --install /usr/bin/od od /usr/bin/toybox 60
	update-alternatives --install /sbin/oneit oneit /usr/bin/toybox 60
	update-alternatives --install /bin/openvt openvt /usr/bin/toybox 60
	update-alternatives --install /sbin/partprobe partprobe /usr/bin/toybox 60
	update-alternatives --install /usr/bin/passwd passwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/paste paste /usr/bin/toybox 60
	update-alternatives --install /usr/bin/patch patch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pgrep pgrep /usr/bin/toybox 60
	update-alternatives --install /bin/pidof pidof /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping ping /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping6 ping6 /usr/bin/toybox 60
	update-alternatives --install /sbin/pivot_root pivot_root /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pkill pkill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pmap pmap /usr/bin/toybox 60
	update-alternatives --install /sbin/poweroff poweroff /usr/bin/toybox 60
	update-alternatives --install /bin/printenv printenv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/printf printf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/prlimit prlimit /usr/bin/toybox 60
	update-alternatives --install /bin/ps ps /usr/bin/toybox 60
	update-alternatives --install /bin/pwd pwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwdx pwdx /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwgen pwgen /usr/bin/toybox 60
	update-alternatives --install /bin/readahead readahead /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readelf readelf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readlink readlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/realpath realpath /usr/bin/toybox 60
	update-alternatives --install /sbin/reboot reboot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/renice renice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/reset reset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rev rev /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/rfkill rfkill /usr/bin/toybox 60
	update-alternatives --install /bin/rm rm /usr/bin/toybox 60
	update-alternatives --install /bin/rmdir rmdir /usr/bin/toybox 60
	update-alternatives --install /sbin/rmmod rmmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rtcwake rtcwake /usr/bin/toybox 60
	update-alternatives --install /bin/sed sed /usr/bin/toybox 60
	update-alternatives --install /usr/bin/seq seq /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setfattr setfattr /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setsid setsid /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha1sum sha1sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha224sum sha224sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha256sum sha256sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha384sum sha384sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha3sum sha3sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha512sum sha512sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/shred shred /usr/bin/toybox 60
	update-alternatives --install /usr/bin/shuf shuf /usr/bin/toybox 60
	update-alternatives --install /bin/sleep sleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sntp sntp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sort sort /usr/bin/toybox 60
	update-alternatives --install /usr/bin/split split /usr/bin/toybox 60
	update-alternatives --install /bin/stat stat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/strings strings /usr/bin/toybox 60
	update-alternatives --install /bin/su su /usr/bin/toybox 60
	update-alternatives --install /sbin/swapoff swapoff /usr/bin/toybox 60
	update-alternatives --install /sbin/switch_root switch_root /usr/bin/toybox 60
	update-alternatives --install /bin/sync sync /usr/bin/toybox 60
	update-alternatives --install /sbin/sysctl sysctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tac tac /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tail tail /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tar tar /usr/bin/toybox 60
	update-alternatives --install /usr/bin/taskset taskset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tee tee /usr/bin/toybox 60
	update-alternatives --install /usr/bin/test test /usr/bin/toybox 60
	update-alternatives --install /usr/bin/time time /usr/bin/toybox 60
	update-alternatives --install /usr/bin/timeout timeout /usr/bin/toybox 60
	update-alternatives --install /usr/bin/top top /usr/bin/toybox 60
	update-alternatives --install /bin/touch touch /usr/bin/toybox 60
	update-alternatives --install /bin/true true /usr/bin/toybox 60
	update-alternatives --install /usr/bin/truncate truncate /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tty tty /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tunctl tunctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uclampset uclampset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ulimit ulimit /usr/bin/toybox 60
	update-alternatives --install /bin/umount umount /usr/bin/toybox 60
	update-alternatives --install /bin/uname uname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unicode unicode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uniq uniq /usr/bin/toybox 60
	update-alternatives --install /bin/unix2dos unix2dos /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unlink unlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unshare unshare /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uptime uptime /usr/bin/toybox 60
	update-alternatives --install /bin/usleep usleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uudecode uudecode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuencode uuencode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuidgen uuidgen /usr/bin/toybox 60
	update-alternatives --install /sbin/vconfig vconfig /usr/bin/toybox 60
	update-alternatives --install /bin/vmstat vmstat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/w w /usr/bin/toybox 60
	update-alternatives --install /usr/bin/watch watch /usr/bin/toybox 60
	update-alternatives --install /sbin/watchdog watchdog /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wc wc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wget wget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/which which /usr/bin/toybox 60
	update-alternatives --install /usr/bin/who who /usr/bin/toybox 60
	update-alternatives --install /usr/bin/whoami whoami /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xargs xargs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xxd xxd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/yes yes /usr/bin/toybox 60
	update-alternatives --install /usr/bin/zcat zcat /usr/bin/toybox 60
"
packages/core2-64-poky-linux/toybox/toybox: latest.pkg_prerm changed from "#!/bin/sh
set -e
	update-alternatives --remove  [ /usr/bin/toybox
	update-alternatives --remove  acpi /usr/bin/toybox
	update-alternatives --remove  arch /usr/bin/toybox
	update-alternatives --remove  ascii /usr/bin/toybox
	update-alternatives --remove  base32 /usr/bin/toybox
	update-alternatives --remove  base64 /usr/bin/toybox
	update-alternatives --remove  basename /usr/bin/toybox
	update-alternatives --remove  blkdiscard /usr/bin/toybox
	update-alternatives --remove  blkid /usr/bin/toybox
	update-alternatives --remove  blockdev /usr/bin/toybox
	update-alternatives --remove  bunzip2 /usr/bin/toybox
	update-alternatives --remove  bzcat /usr/bin/toybox
	update-alternatives --remove  cal /usr/bin/toybox
	update-alternatives --remove  cat /usr/bin/toybox
	update-alternatives --remove  chattr /usr/bin/toybox
	update-alternatives --remove  chgrp /usr/bin/toybox
	update-alternatives --remove  chmod /usr/bin/toybox
	update-alternatives --remove  chown /usr/bin/toybox
	update-alternatives --remove  chroot /usr/bin/toybox
	update-alternatives --remove  chrt /usr/bin/toybox
	update-alternatives --remove  chvt /usr/bin/toybox
	update-alternatives --remove  cksum /usr/bin/toybox
	update-alternatives --remove  clear /usr/bin/toybox
	update-alternatives --remove  cmp /usr/bin/toybox
	update-alternatives --remove  comm /usr/bin/toybox
	update-alternatives --remove  count /usr/bin/toybox
	update-alternatives --remove  cp /usr/bin/toybox
	update-alternatives --remove  cpio /usr/bin/toybox
	update-alternatives --remove  crc32 /usr/bin/toybox
	update-alternatives --remove  cut /usr/bin/toybox
	update-alternatives --remove  date /usr/bin/toybox
	update-alternatives --remove  deallocvt /usr/bin/toybox
	update-alternatives --remove  devmem /usr/bin/toybox
	update-alternatives --remove  df /usr/bin/toybox
	update-alternatives --remove  dirname /usr/bin/toybox
	update-alternatives --remove  dmesg /usr/bin/toybox
	update-alternatives --remove  dnsdomainname /usr/bin/toybox
	update-alternatives --remove  dos2unix /usr/bin/toybox
	update-alternatives --remove  du /usr/bin/toybox
	update-alternatives --remove  echo /usr/bin/toybox
	update-alternatives --remove  egrep /usr/bin/toybox
	update-alternatives --remove  eject /usr/bin/toybox
	update-alternatives --remove  env /usr/bin/toybox
	update-alternatives --remove  expand /usr/bin/toybox
	update-alternatives --remove  factor /usr/bin/toybox
	update-alternatives --remove  fallocate /usr/bin/toybox
	update-alternatives --remove  false /usr/bin/toybox
	update-alternatives --remove  fgrep /usr/bin/toybox
	update-alternatives --remove  file /usr/bin/toybox
	update-alternatives --remove  find /usr/bin/toybox
	update-alternatives --remove  flock /usr/bin/toybox
	update-alternatives --remove  fmt /usr/bin/toybox
	update-alternatives --remove  free /usr/bin/toybox
	update-alternatives --remove  freeramdisk /usr/bin/toybox
	update-alternatives --remove  fsfreeze /usr/bin/toybox
	update-alternatives --remove  fstype /usr/bin/toybox
	update-alternatives --remove  fsync /usr/bin/toybox
	update-alternatives --remove  ftpget /usr/bin/toybox
	update-alternatives --remove  ftpput /usr/bin/toybox
	update-alternatives --remove  gpiodetect /usr/bin/toybox
	update-alternatives --remove  gpiofind /usr/bin/toybox
	update-alternatives --remove  gpioget /usr/bin/toybox
	update-alternatives --remove  gpioinfo /usr/bin/toybox
	update-alternatives --remove  gpioset /usr/bin/toybox
	update-alternatives --remove  grep /usr/bin/toybox
	update-alternatives --remove  groups /usr/bin/toybox
	update-alternatives --remove  gunzip /usr/bin/toybox
	update-alternatives --remove  halt /usr/bin/toybox
	update-alternatives --remove  head /usr/bin/toybox
	update-alternatives --remove  help /usr/bin/toybox
	update-alternatives --remove  hexedit /usr/bin/toybox
	update-alternatives --remove  host /usr/bin/toybox
	update-alternatives --remove  hostname /usr/bin/toybox
	update-alternatives --remove  httpd /usr/bin/toybox
	update-alternatives --remove  hwclock /usr/bin/toybox
	update-alternatives --remove  i2cdetect /usr/bin/toybox
	update-alternatives --remove  i2cdump /usr/bin/toybox
	update-alternatives --remove  i2cget /usr/bin/toybox
	update-alternatives --remove  i2cset /usr/bin/toybox
	update-alternatives --remove  id /usr/bin/toybox
	update-alternatives --remove  ifconfig /usr/bin/toybox
	update-alternatives --remove  inotifyd /usr/bin/toybox
	update-alternatives --remove  insmod /usr/bin/toybox
	update-alternatives --remove  install /usr/bin/toybox
	update-alternatives --remove  ionice /usr/bin/toybox
	update-alternatives --remove  iorenice /usr/bin/toybox
	update-alternatives --remove  iotop /usr/bin/toybox
	update-alternatives --remove  kill /usr/bin/toybox
	update-alternatives --remove  killall /usr/bin/toybox
	update-alternatives --remove  link /usr/bin/toybox
	update-alternatives --remove  linux32 /usr/bin/toybox
	update-alternatives --remove  ln /usr/bin/toybox
	update-alternatives --remove  logger /usr/bin/toybox
	update-alternatives --remove  login /usr/bin/toybox
	update-alternatives --remove  logname /usr/bin/toybox
	update-alternatives --remove  losetup /usr/bin/toybox
	update-alternatives --remove  ls /usr/bin/toybox
	update-alternatives --remove  lsattr /usr/bin/toybox
	update-alternatives --remove  lsmod /usr/bin/toybox
	update-alternatives --remove  lspci /usr/bin/toybox
	update-alternatives --remove  lsusb /usr/bin/toybox
	update-alternatives --remove  makedevs /usr/bin/toybox
	update-alternatives --remove  mcookie /usr/bin/toybox
	update-alternatives --remove  md5sum /usr/bin/toybox
	update-alternatives --remove  microcom /usr/bin/toybox
	update-alternatives --remove  mix /usr/bin/toybox
	update-alternatives --remove  mkdir /usr/bin/toybox
	update-alternatives --remove  mkfifo /usr/bin/toybox
	update-alternatives --remove  mknod /usr/bin/toybox
	update-alternatives --remove  mkpasswd /usr/bin/toybox
	update-alternatives --remove  mkswap /usr/bin/toybox
	update-alternatives --remove  mktemp /usr/bin/toybox
	update-alternatives --remove  modinfo /usr/bin/toybox
	update-alternatives --remove  mount /usr/bin/toybox
	update-alternatives --remove  mountpoint /usr/bin/toybox
	update-alternatives --remove  mv /usr/bin/toybox
	update-alternatives --remove  nbd-client /usr/bin/toybox
	update-alternatives --remove  nc /usr/bin/toybox
	update-alternatives --remove  netcat /usr/bin/toybox
	update-alternatives --remove  netstat /usr/bin/toybox
	update-alternatives --remove  nice /usr/bin/toybox
	update-alternatives --remove  nl /usr/bin/toybox
	update-alternatives --remove  nohup /usr/bin/toybox
	update-alternatives --remove  nproc /usr/bin/toybox
	update-alternatives --remove  nsenter /usr/bin/toybox
	update-alternatives --remove  od /usr/bin/toybox
	update-alternatives --remove  oneit /usr/bin/toybox
	update-alternatives --remove  openvt /usr/bin/toybox
	update-alternatives --remove  partprobe /usr/bin/toybox
	update-alternatives --remove  passwd /usr/bin/toybox
	update-alternatives --remove  paste /usr/bin/toybox
	update-alternatives --remove  patch /usr/bin/toybox
	update-alternatives --remove  pgrep /usr/bin/toybox
	update-alternatives --remove  pidof /usr/bin/toybox
	update-alternatives --remove  ping /usr/bin/toybox
	update-alternatives --remove  ping6 /usr/bin/toybox
	update-alternatives --remove  pivot_root /usr/bin/toybox
	update-alternatives --remove  pkill /usr/bin/toybox
	update-alternatives --remove  pmap /usr/bin/toybox
	update-alternatives --remove  poweroff /usr/bin/toybox
	update-alternatives --remove  printenv /usr/bin/toybox
	update-alternatives --remove  printf /usr/bin/toybox
	update-alternatives --remove  prlimit /usr/bin/toybox
	update-alternatives --remove  ps /usr/bin/toybox
	update-alternatives --remove  pwd /usr/bin/toybox
	update-alternatives --remove  pwdx /usr/bin/toybox
	update-alternatives --remove  pwgen /usr/bin/toybox
	update-alternatives --remove  readahead /usr/bin/toybox
	update-alternatives --remove  readelf /usr/bin/toybox
	update-alternatives --remove  readlink /usr/bin/toybox
	update-alternatives --remove  realpath /usr/bin/toybox
	update-alternatives --remove  reboot /usr/bin/toybox
	update-alternatives --remove  renice /usr/bin/toybox
	update-alternatives --remove  reset /usr/bin/toybox
	update-alternatives --remove  rev /usr/bin/toybox
	update-alternatives --remove  rfkill /usr/bin/toybox
	update-alternatives --remove  rm /usr/bin/toybox
	update-alternatives --remove  rmdir /usr/bin/toybox
	update-alternatives --remove  rmmod /usr/bin/toybox
	update-alternatives --remove  rtcwake /usr/bin/toybox
	update-alternatives --remove  sed /usr/bin/toybox
	update-alternatives --remove  seq /usr/bin/toybox
	update-alternatives --remove  setfattr /usr/bin/toybox
	update-alternatives --remove  setsid /usr/bin/toybox
	update-alternatives --remove  sha1sum /usr/bin/toybox
	update-alternatives --remove  sha224sum /usr/bin/toybox
	update-alternatives --remove  sha256sum /usr/bin/toybox
	update-alternatives --remove  sha384sum /usr/bin/toybox
	update-alternatives --remove  sha3sum /usr/bin/toybox
	update-alternatives --remove  sha512sum /usr/bin/toybox
	update-alternatives --remove  shred /usr/bin/toybox
	update-alternatives --remove  sleep /usr/bin/toybox
	update-alternatives --remove  sntp /usr/bin/toybox
	update-alternatives --remove  sort /usr/bin/toybox
	update-alternatives --remove  split /usr/bin/toybox
	update-alternatives --remove  stat /usr/bin/toybox
	update-alternatives --remove  strings /usr/bin/toybox
	update-alternatives --remove  su /usr/bin/toybox
	update-alternatives --remove  swapoff /usr/bin/toybox
	update-alternatives --remove  switch_root /usr/bin/toybox
	update-alternatives --remove  sync /usr/bin/toybox
	update-alternatives --remove  sysctl /usr/bin/toybox
	update-alternatives --remove  tac /usr/bin/toybox
	update-alternatives --remove  tail /usr/bin/toybox
	update-alternatives --remove  tar /usr/bin/toybox
	update-alternatives --remove  taskset /usr/bin/toybox
	update-alternatives --remove  tee /usr/bin/toybox
	update-alternatives --remove  test /usr/bin/toybox
	update-alternatives --remove  time /usr/bin/toybox
	update-alternatives --remove  timeout /usr/bin/toybox
	update-alternatives --remove  top /usr/bin/toybox
	update-alternatives --remove  touch /usr/bin/toybox
	update-alternatives --remove  true /usr/bin/toybox
	update-alternatives --remove  truncate /usr/bin/toybox
	update-alternatives --remove  tty /usr/bin/toybox
	update-alternatives --remove  tunctl /usr/bin/toybox
	update-alternatives --remove  uclampset /usr/bin/toybox
	update-alternatives --remove  ulimit /usr/bin/toybox
	update-alternatives --remove  umount /usr/bin/toybox
	update-alternatives --remove  uname /usr/bin/toybox
	update-alternatives --remove  unicode /usr/bin/toybox
	update-alternatives --remove  uniq /usr/bin/toybox
	update-alternatives --remove  unix2dos /usr/bin/toybox
	update-alternatives --remove  unlink /usr/bin/toybox
	update-alternatives --remove  unshare /usr/bin/toybox
	update-alternatives --remove  uptime /usr/bin/toybox
	update-alternatives --remove  usleep /usr/bin/toybox
	update-alternatives --remove  uudecode /usr/bin/toybox
	update-alternatives --remove  uuencode /usr/bin/toybox
	update-alternatives --remove  uuidgen /usr/bin/toybox
	update-alternatives --remove  vconfig /usr/bin/toybox
	update-alternatives --remove  vmstat /usr/bin/toybox
	update-alternatives --remove  w /usr/bin/toybox
	update-alternatives --remove  watch /usr/bin/toybox
	update-alternatives --remove  watchdog /usr/bin/toybox
	update-alternatives --remove  wc /usr/bin/toybox
	update-alternatives --remove  wget /usr/bin/toybox
	update-alternatives --remove  which /usr/bin/toybox
	update-alternatives --remove  who /usr/bin/toybox
	update-alternatives --remove  whoami /usr/bin/toybox
	update-alternatives --remove  xargs /usr/bin/toybox
	update-alternatives --remove  xxd /usr/bin/toybox
	update-alternatives --remove  yes /usr/bin/toybox
	update-alternatives --remove  zcat /usr/bin/toybox
" to "#!/bin/sh
set -e
	update-alternatives --remove  [ /usr/bin/toybox
	update-alternatives --remove  acpi /usr/bin/toybox
	update-alternatives --remove  arch /usr/bin/toybox
	update-alternatives --remove  ascii /usr/bin/toybox
	update-alternatives --remove  base32 /usr/bin/toybox
	update-alternatives --remove  base64 /usr/bin/toybox
	update-alternatives --remove  basename /usr/bin/toybox
	update-alternatives --remove  blkdiscard /usr/bin/toybox
	update-alternatives --remove  blkid /usr/bin/toybox
	update-alternatives --remove  blockdev /usr/bin/toybox
	update-alternatives --remove  bunzip2 /usr/bin/toybox
	update-alternatives --remove  bzcat /usr/bin/toybox
	update-alternatives --remove  cal /usr/bin/toybox
	update-alternatives --remove  cat /usr/bin/toybox
	update-alternatives --remove  chattr /usr/bin/toybox
	update-alternatives --remove  chgrp /usr/bin/toybox
	update-alternatives --remove  chmod /usr/bin/toybox
	update-alternatives --remove  chown /usr/bin/toybox
	update-alternatives --remove  chroot /usr/bin/toybox
	update-alternatives --remove  chrt /usr/bin/toybox
	update-alternatives --remove  chvt /usr/bin/toybox
	update-alternatives --remove  cksum /usr/bin/toybox
	update-alternatives --remove  clear /usr/bin/toybox
	update-alternatives --remove  cmp /usr/bin/toybox
	update-alternatives --remove  comm /usr/bin/toybox
	update-alternatives --remove  count /usr/bin/toybox
	update-alternatives --remove  cp /usr/bin/toybox
	update-alternatives --remove  cpio /usr/bin/toybox
	update-alternatives --remove  crc32 /usr/bin/toybox
	update-alternatives --remove  cut /usr/bin/toybox
	update-alternatives --remove  date /usr/bin/toybox
	update-alternatives --remove  dd /usr/bin/toybox
	update-alternatives --remove  deallocvt /usr/bin/toybox
	update-alternatives --remove  devmem /usr/bin/toybox
	update-alternatives --remove  df /usr/bin/toybox
	update-alternatives --remove  dirname /usr/bin/toybox
	update-alternatives --remove  dmesg /usr/bin/toybox
	update-alternatives --remove  dnsdomainname /usr/bin/toybox
	update-alternatives --remove  dos2unix /usr/bin/toybox
	update-alternatives --remove  du /usr/bin/toybox
	update-alternatives --remove  echo /usr/bin/toybox
	update-alternatives --remove  egrep /usr/bin/toybox
	update-alternatives --remove  eject /usr/bin/toybox
	update-alternatives --remove  env /usr/bin/toybox
	update-alternatives --remove  expand /usr/bin/toybox
	update-alternatives --remove  factor /usr/bin/toybox
	update-alternatives --remove  fallocate /usr/bin/toybox
	update-alternatives --remove  false /usr/bin/toybox
	update-alternatives --remove  fgrep /usr/bin/toybox
	update-alternatives --remove  file /usr/bin/toybox
	update-alternatives --remove  find /usr/bin/toybox
	update-alternatives --remove  flock /usr/bin/toybox
	update-alternatives --remove  fmt /usr/bin/toybox
	update-alternatives --remove  free /usr/bin/toybox
	update-alternatives --remove  freeramdisk /usr/bin/toybox
	update-alternatives --remove  fsfreeze /usr/bin/toybox
	update-alternatives --remove  fstype /usr/bin/toybox
	update-alternatives --remove  fsync /usr/bin/toybox
	update-alternatives --remove  ftpget /usr/bin/toybox
	update-alternatives --remove  ftpput /usr/bin/toybox
	update-alternatives --remove  gpiodetect /usr/bin/toybox
	update-alternatives --remove  gpiofind /usr/bin/toybox
	update-alternatives --remove  gpioget /usr/bin/toybox
	update-alternatives --remove  gpioinfo /usr/bin/toybox
	update-alternatives --remove  gpioset /usr/bin/toybox
	update-alternatives --remove  grep /usr/bin/toybox
	update-alternatives --remove  groups /usr/bin/toybox
	update-alternatives --remove  gunzip /usr/bin/toybox
	update-alternatives --remove  halt /usr/bin/toybox
	update-alternatives --remove  head /usr/bin/toybox
	update-alternatives --remove  help /usr/bin/toybox
	update-alternatives --remove  hexedit /usr/bin/toybox
	update-alternatives --remove  host /usr/bin/toybox
	update-alternatives --remove  hostname /usr/bin/toybox
	update-alternatives --remove  httpd /usr/bin/toybox
	update-alternatives --remove  hwclock /usr/bin/toybox
	update-alternatives --remove  i2cdetect /usr/bin/toybox
	update-alternatives --remove  i2cdump /usr/bin/toybox
	update-alternatives --remove  i2cget /usr/bin/toybox
	update-alternatives --remove  i2cset /usr/bin/toybox
	update-alternatives --remove  i2ctransfer /usr/bin/toybox
	update-alternatives --remove  id /usr/bin/toybox
	update-alternatives --remove  ifconfig /usr/bin/toybox
	update-alternatives --remove  inotifyd /usr/bin/toybox
	update-alternatives --remove  insmod /usr/bin/toybox
	update-alternatives --remove  install /usr/bin/toybox
	update-alternatives --remove  ionice /usr/bin/toybox
	update-alternatives --remove  iorenice /usr/bin/toybox
	update-alternatives --remove  iotop /usr/bin/toybox
	update-alternatives --remove  kill /usr/bin/toybox
	update-alternatives --remove  killall /usr/bin/toybox
	update-alternatives --remove  link /usr/bin/toybox
	update-alternatives --remove  linux32 /usr/bin/toybox
	update-alternatives --remove  ln /usr/bin/toybox
	update-alternatives --remove  logger /usr/bin/toybox
	update-alternatives --remove  login /usr/bin/toybox
	update-alternatives --remove  logname /usr/bin/toybox
	update-alternatives --remove  losetup /usr/bin/toybox
	update-alternatives --remove  ls /usr/bin/toybox
	update-alternatives --remove  lsattr /usr/bin/toybox
	update-alternatives --remove  lsmod /usr/bin/toybox
	update-alternatives --remove  lspci /usr/bin/toybox
	update-alternatives --remove  lsusb /usr/bin/toybox
	update-alternatives --remove  makedevs /usr/bin/toybox
	update-alternatives --remove  mcookie /usr/bin/toybox
	update-alternatives --remove  md5sum /usr/bin/toybox
	update-alternatives --remove  microcom /usr/bin/toybox
	update-alternatives --remove  mix /usr/bin/toybox
	update-alternatives --remove  mkdir /usr/bin/toybox
	update-alternatives --remove  mkfifo /usr/bin/toybox
	update-alternatives --remove  mknod /usr/bin/toybox
	update-alternatives --remove  mkpasswd /usr/bin/toybox
	update-alternatives --remove  mkswap /usr/bin/toybox
	update-alternatives --remove  mktemp /usr/bin/toybox
	update-alternatives --remove  modinfo /usr/bin/toybox
	update-alternatives --remove  mount /usr/bin/toybox
	update-alternatives --remove  mountpoint /usr/bin/toybox
	update-alternatives --remove  mv /usr/bin/toybox
	update-alternatives --remove  nbd-client /usr/bin/toybox
	update-alternatives --remove  nbd-server /usr/bin/toybox
	update-alternatives --remove  nc /usr/bin/toybox
	update-alternatives --remove  netcat /usr/bin/toybox
	update-alternatives --remove  netstat /usr/bin/toybox
	update-alternatives --remove  nice /usr/bin/toybox
	update-alternatives --remove  nl /usr/bin/toybox
	update-alternatives --remove  nohup /usr/bin/toybox
	update-alternatives --remove  nproc /usr/bin/toybox
	update-alternatives --remove  nsenter /usr/bin/toybox
	update-alternatives --remove  od /usr/bin/toybox
	update-alternatives --remove  oneit /usr/bin/toybox
	update-alternatives --remove  openvt /usr/bin/toybox
	update-alternatives --remove  partprobe /usr/bin/toybox
	update-alternatives --remove  passwd /usr/bin/toybox
	update-alternatives --remove  paste /usr/bin/toybox
	update-alternatives --remove  patch /usr/bin/toybox
	update-alternatives --remove  pgrep /usr/bin/toybox
	update-alternatives --remove  pidof /usr/bin/toybox
	update-alternatives --remove  ping /usr/bin/toybox
	update-alternatives --remove  ping6 /usr/bin/toybox
	update-alternatives --remove  pivot_root /usr/bin/toybox
	update-alternatives --remove  pkill /usr/bin/toybox
	update-alternatives --remove  pmap /usr/bin/toybox
	update-alternatives --remove  poweroff /usr/bin/toybox
	update-alternatives --remove  printenv /usr/bin/toybox
	update-alternatives --remove  printf /usr/bin/toybox
	update-alternatives --remove  prlimit /usr/bin/toybox
	update-alternatives --remove  ps /usr/bin/toybox
	update-alternatives --remove  pwd /usr/bin/toybox
	update-alternatives --remove  pwdx /usr/bin/toybox
	update-alternatives --remove  pwgen /usr/bin/toybox
	update-alternatives --remove  readahead /usr/bin/toybox
	update-alternatives --remove  readelf /usr/bin/toybox
	update-alternatives --remove  readlink /usr/bin/toybox
	update-alternatives --remove  realpath /usr/bin/toybox
	update-alternatives --remove  reboot /usr/bin/toybox
	update-alternatives --remove  renice /usr/bin/toybox
	update-alternatives --remove  reset /usr/bin/toybox
	update-alternatives --remove  rev /usr/bin/toybox
	update-alternatives --remove  rfkill /usr/bin/toybox
	update-alternatives --remove  rm /usr/bin/toybox
	update-alternatives --remove  rmdir /usr/bin/toybox
	update-alternatives --remove  rmmod /usr/bin/toybox
	update-alternatives --remove  rtcwake /usr/bin/toybox
	update-alternatives --remove  sed /usr/bin/toybox
	update-alternatives --remove  seq /usr/bin/toybox
	update-alternatives --remove  setfattr /usr/bin/toybox
	update-alternatives --remove  setsid /usr/bin/toybox
	update-alternatives --remove  sha1sum /usr/bin/toybox
	update-alternatives --remove  sha224sum /usr/bin/toybox
	update-alternatives --remove  sha256sum /usr/bin/toybox
	update-alternatives --remove  sha384sum /usr/bin/toybox
	update-alternatives --remove  sha3sum /usr/bin/toybox
	update-alternatives --remove  sha512sum /usr/bin/toybox
	update-alternatives --remove  shred /usr/bin/toybox
	update-alternatives --remove  shuf /usr/bin/toybox
	update-alternatives --remove  sleep /usr/bin/toybox
	update-alternatives --remove  sntp /usr/bin/toybox
	update-alternatives --remove  sort /usr/bin/toybox
	update-alternatives --remove  split /usr/bin/toybox
	update-alternatives --remove  stat /usr/bin/toybox
	update-alternatives --remove  strings /usr/bin/toybox
	update-alternatives --remove  su /usr/bin/toybox
	update-alternatives --remove  swapoff /usr/bin/toybox
	update-alternatives --remove  switch_root /usr/bin/toybox
	update-alternatives --remove  sync /usr/bin/toybox
	update-alternatives --remove  sysctl /usr/bin/toybox
	update-alternatives --remove  tac /usr/bin/toybox
	update-alternatives --remove  tail /usr/bin/toybox
	update-alternatives --remove  tar /usr/bin/toybox
	update-alternatives --remove  taskset /usr/bin/toybox
	update-alternatives --remove  tee /usr/bin/toybox
	update-alternatives --remove  test /usr/bin/toybox
	update-alternatives --remove  time /usr/bin/toybox
	update-alternatives --remove  timeout /usr/bin/toybox
	update-alternatives --remove  top /usr/bin/toybox
	update-alternatives --remove  touch /usr/bin/toybox
	update-alternatives --remove  true /usr/bin/toybox
	update-alternatives --remove  truncate /usr/bin/toybox
	update-alternatives --remove  tty /usr/bin/toybox
	update-alternatives --remove  tunctl /usr/bin/toybox
	update-alternatives --remove  uclampset /usr/bin/toybox
	update-alternatives --remove  ulimit /usr/bin/toybox
	update-alternatives --remove  umount /usr/bin/toybox
	update-alternatives --remove  uname /usr/bin/toybox
	update-alternatives --remove  unicode /usr/bin/toybox
	update-alternatives --remove  uniq /usr/bin/toybox
	update-alternatives --remove  unix2dos /usr/bin/toybox
	update-alternatives --remove  unlink /usr/bin/toybox
	update-alternatives --remove  unshare /usr/bin/toybox
	update-alternatives --remove  uptime /usr/bin/toybox
	update-alternatives --remove  usleep /usr/bin/toybox
	update-alternatives --remove  uudecode /usr/bin/toybox
	update-alternatives --remove  uuencode /usr/bin/toybox
	update-alternatives --remove  uuidgen /usr/bin/toybox
	update-alternatives --remove  vconfig /usr/bin/toybox
	update-alternatives --remove  vmstat /usr/bin/toybox
	update-alternatives --remove  w /usr/bin/toybox
	update-alternatives --remove  watch /usr/bin/toybox
	update-alternatives --remove  watchdog /usr/bin/toybox
	update-alternatives --remove  wc /usr/bin/toybox
	update-alternatives --remove  wget /usr/bin/toybox
	update-alternatives --remove  which /usr/bin/toybox
	update-alternatives --remove  who /usr/bin/toybox
	update-alternatives --remove  whoami /usr/bin/toybox
	update-alternatives --remove  xargs /usr/bin/toybox
	update-alternatives --remove  xxd /usr/bin/toybox
	update-alternatives --remove  yes /usr/bin/toybox
	update-alternatives --remove  zcat /usr/bin/toybox
"

--===============4706915727543040374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/toybox/toybox: latest.pkg_postinst changed from "#!/bin/sh
set -e
	update-alternatives --install /bin/[ [ /usr/bin/toybox 60
	update-alternatives --install /usr/bin/acpi acpi /usr/bin/toybox 60
	update-alternatives --install /usr/bin/arch arch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ascii ascii /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base32 base32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base64 base64 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/basename basename /usr/bin/toybox 60
	update-alternatives --install /bin/blkdiscard blkdiscard /usr/bin/toybox 60
	update-alternatives --install /bin/blkid blkid /usr/bin/toybox 60
	update-alternatives --install /sbin/blockdev blockdev /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bunzip2 bunzip2 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bzcat bzcat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cal cal /usr/bin/toybox 60
	update-alternatives --install /bin/cat cat /usr/bin/toybox 60
	update-alternatives --install /bin/chattr chattr /usr/bin/toybox 60
	update-alternatives --install /bin/chgrp chgrp /usr/bin/toybox 60
	update-alternatives --install /bin/chmod chmod /usr/bin/toybox 60
	update-alternatives --install /bin/chown chown /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/chroot chroot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chrt chrt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chvt chvt /usr/bin/toybox 60
	update-alternatives --install /bin/cksum cksum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/clear clear /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cmp cmp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/comm comm /usr/bin/toybox 60
	update-alternatives --install /usr/bin/count count /usr/bin/toybox 60
	update-alternatives --install /bin/cp cp /usr/bin/toybox 60
	update-alternatives --install /bin/cpio cpio /usr/bin/toybox 60
	update-alternatives --install /bin/crc32 crc32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cut cut /usr/bin/toybox 60
	update-alternatives --install /bin/date date /usr/bin/toybox 60
	update-alternatives --install /usr/bin/deallocvt deallocvt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/devmem devmem /usr/bin/toybox 60
	update-alternatives --install /sbin/df df /usr/bin/toybox 60
	update-alternatives --install /usr/bin/dirname dirname /usr/bin/toybox 60
	update-alternatives --install /bin/dmesg dmesg /usr/bin/toybox 60
	update-alternatives --install /bin/dnsdomainname dnsdomainname /usr/bin/toybox 60
	update-alternatives --install /bin/dos2unix dos2unix /usr/bin/toybox 60
	update-alternatives --install /usr/bin/du du /usr/bin/toybox 60
	update-alternatives --install /bin/echo echo /usr/bin/toybox 60
	update-alternatives --install /bin/egrep egrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/eject eject /usr/bin/toybox 60
	update-alternatives --install /usr/bin/env env /usr/bin/toybox 60
	update-alternatives --install /usr/bin/expand expand /usr/bin/toybox 60
	update-alternatives --install /usr/bin/factor factor /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fallocate fallocate /usr/bin/toybox 60
	update-alternatives --install /bin/false false /usr/bin/toybox 60
	update-alternatives --install /bin/fgrep fgrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/file file /usr/bin/toybox 60
	update-alternatives --install /usr/bin/find find /usr/bin/toybox 60
	update-alternatives --install /usr/bin/flock flock /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fmt fmt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/free free /usr/bin/toybox 60
	update-alternatives --install /sbin/freeramdisk freeramdisk /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/fsfreeze fsfreeze /usr/bin/toybox 60
	update-alternatives --install /bin/fstype fstype /usr/bin/toybox 60
	update-alternatives --install /bin/fsync fsync /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpget ftpget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpput ftpput /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiodetect gpiodetect /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiofind gpiofind /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioget gpioget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioinfo gpioinfo /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioset gpioset /usr/bin/toybox 60
	update-alternatives --install /bin/grep grep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/groups groups /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gunzip gunzip /usr/bin/toybox 60
	update-alternatives --install /sbin/halt halt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/head head /usr/bin/toybox 60
	update-alternatives --install /bin/help help /usr/bin/toybox 60
	update-alternatives --install /usr/bin/hexedit hexedit /usr/bin/toybox 60
	update-alternatives --install /usr/bin/host host /usr/bin/toybox 60
	update-alternatives --install /bin/hostname hostname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/httpd httpd /usr/bin/toybox 60
	update-alternatives --install /sbin/hwclock hwclock /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cdetect i2cdetect /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cdump i2cdump /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cget i2cget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/i2cset i2cset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/id id /usr/bin/toybox 60
	update-alternatives --install /sbin/ifconfig ifconfig /usr/bin/toybox 60
	update-alternatives --install /usr/bin/inotifyd inotifyd /usr/bin/toybox 60
	update-alternatives --install /sbin/insmod insmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/install install /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ionice ionice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iorenice iorenice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iotop iotop /usr/bin/toybox 60
	update-alternatives --install /bin/kill kill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/killall killall /usr/bin/toybox 60
	update-alternatives --install /usr/bin/link link /usr/bin/toybox 60
	update-alternatives --install /usr/bin/linux32 linux32 /usr/bin/toybox 60
	update-alternatives --install /bin/ln ln /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logger logger /usr/bin/toybox 60
	update-alternatives --install /bin/login login /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logname logname /usr/bin/toybox 60
	update-alternatives --install /sbin/losetup losetup /usr/bin/toybox 60
	update-alternatives --install /bin/ls ls /usr/bin/toybox 60
	update-alternatives --install /bin/lsattr lsattr /usr/bin/toybox 60
	update-alternatives --install /sbin/lsmod lsmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lspci lspci /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lsusb lsusb /usr/bin/toybox 60
	update-alternatives --install /usr/bin/makedevs makedevs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mcookie mcookie /usr/bin/toybox 60
	update-alternatives --install /usr/bin/md5sum md5sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/microcom microcom /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mix mix /usr/bin/toybox 60
	update-alternatives --install /bin/mkdir mkdir /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkfifo mkfifo /usr/bin/toybox 60
	update-alternatives --install /bin/mknod mknod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkpasswd mkpasswd /usr/bin/toybox 60
	update-alternatives --install /sbin/mkswap mkswap /usr/bin/toybox 60
	update-alternatives --install /bin/mktemp mktemp /usr/bin/toybox 60
	update-alternatives --install /sbin/modinfo modinfo /usr/bin/toybox 60
	update-alternatives --install /bin/mount mount /usr/bin/toybox 60
	update-alternatives --install /bin/mountpoint mountpoint /usr/bin/toybox 60
	update-alternatives --install /bin/mv mv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nbd-client nbd-client /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nc nc /usr/bin/toybox 60
	update-alternatives --install /bin/netcat netcat /usr/bin/toybox 60
	update-alternatives --install /bin/netstat netstat /usr/bin/toybox 60
	update-alternatives --install /bin/nice nice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nl nl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nohup nohup /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nproc nproc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nsenter nsenter /usr/bin/toybox 60
	update-alternatives --install /usr/bin/od od /usr/bin/toybox 60
	update-alternatives --install /sbin/oneit oneit /usr/bin/toybox 60
	update-alternatives --install /bin/openvt openvt /usr/bin/toybox 60
	update-alternatives --install /sbin/partprobe partprobe /usr/bin/toybox 60
	update-alternatives --install /usr/bin/passwd passwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/paste paste /usr/bin/toybox 60
	update-alternatives --install /usr/bin/patch patch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pgrep pgrep /usr/bin/toybox 60
	update-alternatives --install /bin/pidof pidof /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping ping /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping6 ping6 /usr/bin/toybox 60
	update-alternatives --install /sbin/pivot_root pivot_root /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pkill pkill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pmap pmap /usr/bin/toybox 60
	update-alternatives --install /sbin/poweroff poweroff /usr/bin/toybox 60
	update-alternatives --install /bin/printenv printenv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/printf printf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/prlimit prlimit /usr/bin/toybox 60
	update-alternatives --install /bin/ps ps /usr/bin/toybox 60
	update-alternatives --install /bin/pwd pwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwdx pwdx /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwgen pwgen /usr/bin/toybox 60
	update-alternatives --install /bin/readahead readahead /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readelf readelf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readlink readlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/realpath realpath /usr/bin/toybox 60
	update-alternatives --install /sbin/reboot reboot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/renice renice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/reset reset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rev rev /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/rfkill rfkill /usr/bin/toybox 60
	update-alternatives --install /bin/rm rm /usr/bin/toybox 60
	update-alternatives --install /bin/rmdir rmdir /usr/bin/toybox 60
	update-alternatives --install /sbin/rmmod rmmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rtcwake rtcwake /usr/bin/toybox 60
	update-alternatives --install /bin/sed sed /usr/bin/toybox 60
	update-alternatives --install /usr/bin/seq seq /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setfattr setfattr /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setsid setsid /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha1sum sha1sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha224sum sha224sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha256sum sha256sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha384sum sha384sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha3sum sha3sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha512sum sha512sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/shred shred /usr/bin/toybox 60
	update-alternatives --install /bin/sleep sleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sntp sntp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sort sort /usr/bin/toybox 60
	update-alternatives --install /usr/bin/split split /usr/bin/toybox 60
	update-alternatives --install /bin/stat stat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/strings strings /usr/bin/toybox 60
	update-alternatives --install /bin/su su /usr/bin/toybox 60
	update-alternatives --install /sbin/swapoff swapoff /usr/bin/toybox 60
	update-alternatives --install /sbin/switch_root switch_root /usr/bin/toybox 60
	update-alternatives --install /bin/sync sync /usr/bin/toybox 60
	update-alternatives --install /sbin/sysctl sysctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tac tac /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tail tail /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tar tar /usr/bin/toybox 60
	update-alternatives --install /usr/bin/taskset taskset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tee tee /usr/bin/toybox 60
	update-alternatives --install /usr/bin/test test /usr/bin/toybox 60
	update-alternatives --install /usr/bin/time time /usr/bin/toybox 60
	update-alternatives --install /usr/bin/timeout timeout /usr/bin/toybox 60
	update-alternatives --install /usr/bin/top top /usr/bin/toybox 60
	update-alternatives --install /bin/touch touch /usr/bin/toybox 60
	update-alternatives --install /bin/true true /usr/bin/toybox 60
	update-alternatives --install /usr/bin/truncate truncate /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tty tty /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tunctl tunctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uclampset uclampset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ulimit ulimit /usr/bin/toybox 60
	update-alternatives --install /bin/umount umount /usr/bin/toybox 60
	update-alternatives --install /bin/uname uname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unicode unicode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uniq uniq /usr/bin/toybox 60
	update-alternatives --install /bin/unix2dos unix2dos /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unlink unlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unshare unshare /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uptime uptime /usr/bin/toybox 60
	update-alternatives --install /bin/usleep usleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uudecode uudecode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuencode uuencode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuidgen uuidgen /usr/bin/toybox 60
	update-alternatives --install /sbin/vconfig vconfig /usr/bin/toybox 60
	update-alternatives --install /bin/vmstat vmstat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/w w /usr/bin/toybox 60
	update-alternatives --install /usr/bin/watch watch /usr/bin/toybox 60
	update-alternatives --install /bin/watchdog watchdog /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wc wc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wget wget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/which which /usr/bin/toybox 60
	update-alternatives --install /usr/bin/who who /usr/bin/toybox 60
	update-alternatives --install /usr/bin/whoami whoami /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xargs xargs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xxd xxd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/yes yes /usr/bin/toybox 60
	update-alternatives --install /usr/bin/zcat zcat /usr/bin/toybox 60
" to "#!/bin/sh
set -e
	update-alternatives --install /bin/[ [ /usr/bin/toybox 60
	update-alternatives --install /usr/bin/acpi acpi /usr/bin/toybox 60
	update-alternatives --install /usr/bin/arch arch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ascii ascii /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base32 base32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/base64 base64 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/basename basename /usr/bin/toybox 60
	update-alternatives --install /bin/blkdiscard blkdiscard /usr/bin/toybox 60
	update-alternatives --install /bin/blkid blkid /usr/bin/toybox 60
	update-alternatives --install /sbin/blockdev blockdev /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bunzip2 bunzip2 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/bzcat bzcat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cal cal /usr/bin/toybox 60
	update-alternatives --install /bin/cat cat /usr/bin/toybox 60
	update-alternatives --install /bin/chattr chattr /usr/bin/toybox 60
	update-alternatives --install /bin/chgrp chgrp /usr/bin/toybox 60
	update-alternatives --install /bin/chmod chmod /usr/bin/toybox 60
	update-alternatives --install /bin/chown chown /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/chroot chroot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chrt chrt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/chvt chvt /usr/bin/toybox 60
	update-alternatives --install /bin/cksum cksum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/clear clear /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cmp cmp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/comm comm /usr/bin/toybox 60
	update-alternatives --install /usr/bin/count count /usr/bin/toybox 60
	update-alternatives --install /bin/cp cp /usr/bin/toybox 60
	update-alternatives --install /bin/cpio cpio /usr/bin/toybox 60
	update-alternatives --install /bin/crc32 crc32 /usr/bin/toybox 60
	update-alternatives --install /usr/bin/cut cut /usr/bin/toybox 60
	update-alternatives --install /bin/date date /usr/bin/toybox 60
	update-alternatives --install /usr/bin/dd dd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/deallocvt deallocvt /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/devmem devmem /usr/bin/toybox 60
	update-alternatives --install /bin/df df /usr/bin/toybox 60
	update-alternatives --install /usr/bin/dirname dirname /usr/bin/toybox 60
	update-alternatives --install /bin/dmesg dmesg /usr/bin/toybox 60
	update-alternatives --install /bin/dnsdomainname dnsdomainname /usr/bin/toybox 60
	update-alternatives --install /bin/dos2unix dos2unix /usr/bin/toybox 60
	update-alternatives --install /usr/bin/du du /usr/bin/toybox 60
	update-alternatives --install /bin/echo echo /usr/bin/toybox 60
	update-alternatives --install /bin/egrep egrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/eject eject /usr/bin/toybox 60
	update-alternatives --install /usr/bin/env env /usr/bin/toybox 60
	update-alternatives --install /usr/bin/expand expand /usr/bin/toybox 60
	update-alternatives --install /usr/bin/factor factor /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fallocate fallocate /usr/bin/toybox 60
	update-alternatives --install /bin/false false /usr/bin/toybox 60
	update-alternatives --install /bin/fgrep fgrep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/file file /usr/bin/toybox 60
	update-alternatives --install /usr/bin/find find /usr/bin/toybox 60
	update-alternatives --install /usr/bin/flock flock /usr/bin/toybox 60
	update-alternatives --install /usr/bin/fmt fmt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/free free /usr/bin/toybox 60
	update-alternatives --install /sbin/freeramdisk freeramdisk /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/fsfreeze fsfreeze /usr/bin/toybox 60
	update-alternatives --install /bin/fstype fstype /usr/bin/toybox 60
	update-alternatives --install /bin/fsync fsync /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpget ftpget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ftpput ftpput /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiodetect gpiodetect /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpiofind gpiofind /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioget gpioget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioinfo gpioinfo /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gpioset gpioset /usr/bin/toybox 60
	update-alternatives --install /bin/grep grep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/groups groups /usr/bin/toybox 60
	update-alternatives --install /usr/bin/gunzip gunzip /usr/bin/toybox 60
	update-alternatives --install /sbin/halt halt /usr/bin/toybox 60
	update-alternatives --install /usr/bin/head head /usr/bin/toybox 60
	update-alternatives --install /bin/help help /usr/bin/toybox 60
	update-alternatives --install /usr/bin/hexedit hexedit /usr/bin/toybox 60
	update-alternatives --install /usr/bin/host host /usr/bin/toybox 60
	update-alternatives --install /bin/hostname hostname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/httpd httpd /usr/bin/toybox 60
	update-alternatives --install /sbin/hwclock hwclock /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cdetect i2cdetect /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cdump i2cdump /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cget i2cget /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2cset i2cset /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/i2ctransfer i2ctransfer /usr/bin/toybox 60
	update-alternatives --install /usr/bin/id id /usr/bin/toybox 60
	update-alternatives --install /sbin/ifconfig ifconfig /usr/bin/toybox 60
	update-alternatives --install /usr/bin/inotifyd inotifyd /usr/bin/toybox 60
	update-alternatives --install /sbin/insmod insmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/install install /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ionice ionice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iorenice iorenice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/iotop iotop /usr/bin/toybox 60
	update-alternatives --install /bin/kill kill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/killall killall /usr/bin/toybox 60
	update-alternatives --install /usr/bin/link link /usr/bin/toybox 60
	update-alternatives --install /usr/bin/linux32 linux32 /usr/bin/toybox 60
	update-alternatives --install /bin/ln ln /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logger logger /usr/bin/toybox 60
	update-alternatives --install /bin/login login /usr/bin/toybox 60
	update-alternatives --install /usr/bin/logname logname /usr/bin/toybox 60
	update-alternatives --install /sbin/losetup losetup /usr/bin/toybox 60
	update-alternatives --install /bin/ls ls /usr/bin/toybox 60
	update-alternatives --install /bin/lsattr lsattr /usr/bin/toybox 60
	update-alternatives --install /sbin/lsmod lsmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lspci lspci /usr/bin/toybox 60
	update-alternatives --install /usr/bin/lsusb lsusb /usr/bin/toybox 60
	update-alternatives --install /usr/bin/makedevs makedevs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mcookie mcookie /usr/bin/toybox 60
	update-alternatives --install /usr/bin/md5sum md5sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/microcom microcom /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mix mix /usr/bin/toybox 60
	update-alternatives --install /bin/mkdir mkdir /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkfifo mkfifo /usr/bin/toybox 60
	update-alternatives --install /bin/mknod mknod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/mkpasswd mkpasswd /usr/bin/toybox 60
	update-alternatives --install /sbin/mkswap mkswap /usr/bin/toybox 60
	update-alternatives --install /bin/mktemp mktemp /usr/bin/toybox 60
	update-alternatives --install /sbin/modinfo modinfo /usr/bin/toybox 60
	update-alternatives --install /bin/mount mount /usr/bin/toybox 60
	update-alternatives --install /bin/mountpoint mountpoint /usr/bin/toybox 60
	update-alternatives --install /bin/mv mv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nbd-client nbd-client /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nbd-server nbd-server /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nc nc /usr/bin/toybox 60
	update-alternatives --install /bin/netcat netcat /usr/bin/toybox 60
	update-alternatives --install /bin/netstat netstat /usr/bin/toybox 60
	update-alternatives --install /bin/nice nice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nl nl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nohup nohup /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nproc nproc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/nsenter nsenter /usr/bin/toybox 60
	update-alternatives --install /usr/bin/od od /usr/bin/toybox 60
	update-alternatives --install /sbin/oneit oneit /usr/bin/toybox 60
	update-alternatives --install /bin/openvt openvt /usr/bin/toybox 60
	update-alternatives --install /sbin/partprobe partprobe /usr/bin/toybox 60
	update-alternatives --install /usr/bin/passwd passwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/paste paste /usr/bin/toybox 60
	update-alternatives --install /usr/bin/patch patch /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pgrep pgrep /usr/bin/toybox 60
	update-alternatives --install /bin/pidof pidof /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping ping /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ping6 ping6 /usr/bin/toybox 60
	update-alternatives --install /sbin/pivot_root pivot_root /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pkill pkill /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pmap pmap /usr/bin/toybox 60
	update-alternatives --install /sbin/poweroff poweroff /usr/bin/toybox 60
	update-alternatives --install /bin/printenv printenv /usr/bin/toybox 60
	update-alternatives --install /usr/bin/printf printf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/prlimit prlimit /usr/bin/toybox 60
	update-alternatives --install /bin/ps ps /usr/bin/toybox 60
	update-alternatives --install /bin/pwd pwd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwdx pwdx /usr/bin/toybox 60
	update-alternatives --install /usr/bin/pwgen pwgen /usr/bin/toybox 60
	update-alternatives --install /bin/readahead readahead /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readelf readelf /usr/bin/toybox 60
	update-alternatives --install /usr/bin/readlink readlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/realpath realpath /usr/bin/toybox 60
	update-alternatives --install /sbin/reboot reboot /usr/bin/toybox 60
	update-alternatives --install /usr/bin/renice renice /usr/bin/toybox 60
	update-alternatives --install /usr/bin/reset reset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rev rev /usr/bin/toybox 60
	update-alternatives --install /usr/sbin/rfkill rfkill /usr/bin/toybox 60
	update-alternatives --install /bin/rm rm /usr/bin/toybox 60
	update-alternatives --install /bin/rmdir rmdir /usr/bin/toybox 60
	update-alternatives --install /sbin/rmmod rmmod /usr/bin/toybox 60
	update-alternatives --install /usr/bin/rtcwake rtcwake /usr/bin/toybox 60
	update-alternatives --install /bin/sed sed /usr/bin/toybox 60
	update-alternatives --install /usr/bin/seq seq /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setfattr setfattr /usr/bin/toybox 60
	update-alternatives --install /usr/bin/setsid setsid /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha1sum sha1sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha224sum sha224sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha256sum sha256sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha384sum sha384sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha3sum sha3sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sha512sum sha512sum /usr/bin/toybox 60
	update-alternatives --install /usr/bin/shred shred /usr/bin/toybox 60
	update-alternatives --install /usr/bin/shuf shuf /usr/bin/toybox 60
	update-alternatives --install /bin/sleep sleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sntp sntp /usr/bin/toybox 60
	update-alternatives --install /usr/bin/sort sort /usr/bin/toybox 60
	update-alternatives --install /usr/bin/split split /usr/bin/toybox 60
	update-alternatives --install /bin/stat stat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/strings strings /usr/bin/toybox 60
	update-alternatives --install /bin/su su /usr/bin/toybox 60
	update-alternatives --install /sbin/swapoff swapoff /usr/bin/toybox 60
	update-alternatives --install /sbin/switch_root switch_root /usr/bin/toybox 60
	update-alternatives --install /bin/sync sync /usr/bin/toybox 60
	update-alternatives --install /sbin/sysctl sysctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tac tac /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tail tail /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tar tar /usr/bin/toybox 60
	update-alternatives --install /usr/bin/taskset taskset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tee tee /usr/bin/toybox 60
	update-alternatives --install /usr/bin/test test /usr/bin/toybox 60
	update-alternatives --install /usr/bin/time time /usr/bin/toybox 60
	update-alternatives --install /usr/bin/timeout timeout /usr/bin/toybox 60
	update-alternatives --install /usr/bin/top top /usr/bin/toybox 60
	update-alternatives --install /bin/touch touch /usr/bin/toybox 60
	update-alternatives --install /bin/true true /usr/bin/toybox 60
	update-alternatives --install /usr/bin/truncate truncate /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tty tty /usr/bin/toybox 60
	update-alternatives --install /usr/bin/tunctl tunctl /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uclampset uclampset /usr/bin/toybox 60
	update-alternatives --install /usr/bin/ulimit ulimit /usr/bin/toybox 60
	update-alternatives --install /bin/umount umount /usr/bin/toybox 60
	update-alternatives --install /bin/uname uname /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unicode unicode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uniq uniq /usr/bin/toybox 60
	update-alternatives --install /bin/unix2dos unix2dos /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unlink unlink /usr/bin/toybox 60
	update-alternatives --install /usr/bin/unshare unshare /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uptime uptime /usr/bin/toybox 60
	update-alternatives --install /bin/usleep usleep /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uudecode uudecode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuencode uuencode /usr/bin/toybox 60
	update-alternatives --install /usr/bin/uuidgen uuidgen /usr/bin/toybox 60
	update-alternatives --install /sbin/vconfig vconfig /usr/bin/toybox 60
	update-alternatives --install /bin/vmstat vmstat /usr/bin/toybox 60
	update-alternatives --install /usr/bin/w w /usr/bin/toybox 60
	update-alternatives --install /usr/bin/watch watch /usr/bin/toybox 60
	update-alternatives --install /sbin/watchdog watchdog /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wc wc /usr/bin/toybox 60
	update-alternatives --install /usr/bin/wget wget /usr/bin/toybox 60
	update-alternatives --install /usr/bin/which which /usr/bin/toybox 60
	update-alternatives --install /usr/bin/who who /usr/bin/toybox 60
	update-alternatives --install /usr/bin/whoami whoami /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xargs xargs /usr/bin/toybox 60
	update-alternatives --install /usr/bin/xxd xxd /usr/bin/toybox 60
	update-alternatives --install /usr/bin/yes yes /usr/bin/toybox 60
	update-alternatives --install /usr/bin/zcat zcat /usr/bin/toybox 60
"
packages/core2-64-poky-linux/toybox/toybox: latest.pkg_prerm changed from "#!/bin/sh
set -e
	update-alternatives --remove  [ /usr/bin/toybox
	update-alternatives --remove  acpi /usr/bin/toybox
	update-alternatives --remove  arch /usr/bin/toybox
	update-alternatives --remove  ascii /usr/bin/toybox
	update-alternatives --remove  base32 /usr/bin/toybox
	update-alternatives --remove  base64 /usr/bin/toybox
	update-alternatives --remove  basename /usr/bin/toybox
	update-alternatives --remove  blkdiscard /usr/bin/toybox
	update-alternatives --remove  blkid /usr/bin/toybox
	update-alternatives --remove  blockdev /usr/bin/toybox
	update-alternatives --remove  bunzip2 /usr/bin/toybox
	update-alternatives --remove  bzcat /usr/bin/toybox
	update-alternatives --remove  cal /usr/bin/toybox
	update-alternatives --remove  cat /usr/bin/toybox
	update-alternatives --remove  chattr /usr/bin/toybox
	update-alternatives --remove  chgrp /usr/bin/toybox
	update-alternatives --remove  chmod /usr/bin/toybox
	update-alternatives --remove  chown /usr/bin/toybox
	update-alternatives --remove  chroot /usr/bin/toybox
	update-alternatives --remove  chrt /usr/bin/toybox
	update-alternatives --remove  chvt /usr/bin/toybox
	update-alternatives --remove  cksum /usr/bin/toybox
	update-alternatives --remove  clear /usr/bin/toybox
	update-alternatives --remove  cmp /usr/bin/toybox
	update-alternatives --remove  comm /usr/bin/toybox
	update-alternatives --remove  count /usr/bin/toybox
	update-alternatives --remove  cp /usr/bin/toybox
	update-alternatives --remove  cpio /usr/bin/toybox
	update-alternatives --remove  crc32 /usr/bin/toybox
	update-alternatives --remove  cut /usr/bin/toybox
	update-alternatives --remove  date /usr/bin/toybox
	update-alternatives --remove  deallocvt /usr/bin/toybox
	update-alternatives --remove  devmem /usr/bin/toybox
	update-alternatives --remove  df /usr/bin/toybox
	update-alternatives --remove  dirname /usr/bin/toybox
	update-alternatives --remove  dmesg /usr/bin/toybox
	update-alternatives --remove  dnsdomainname /usr/bin/toybox
	update-alternatives --remove  dos2unix /usr/bin/toybox
	update-alternatives --remove  du /usr/bin/toybox
	update-alternatives --remove  echo /usr/bin/toybox
	update-alternatives --remove  egrep /usr/bin/toybox
	update-alternatives --remove  eject /usr/bin/toybox
	update-alternatives --remove  env /usr/bin/toybox
	update-alternatives --remove  expand /usr/bin/toybox
	update-alternatives --remove  factor /usr/bin/toybox
	update-alternatives --remove  fallocate /usr/bin/toybox
	update-alternatives --remove  false /usr/bin/toybox
	update-alternatives --remove  fgrep /usr/bin/toybox
	update-alternatives --remove  file /usr/bin/toybox
	update-alternatives --remove  find /usr/bin/toybox
	update-alternatives --remove  flock /usr/bin/toybox
	update-alternatives --remove  fmt /usr/bin/toybox
	update-alternatives --remove  free /usr/bin/toybox
	update-alternatives --remove  freeramdisk /usr/bin/toybox
	update-alternatives --remove  fsfreeze /usr/bin/toybox
	update-alternatives --remove  fstype /usr/bin/toybox
	update-alternatives --remove  fsync /usr/bin/toybox
	update-alternatives --remove  ftpget /usr/bin/toybox
	update-alternatives --remove  ftpput /usr/bin/toybox
	update-alternatives --remove  gpiodetect /usr/bin/toybox
	update-alternatives --remove  gpiofind /usr/bin/toybox
	update-alternatives --remove  gpioget /usr/bin/toybox
	update-alternatives --remove  gpioinfo /usr/bin/toybox
	update-alternatives --remove  gpioset /usr/bin/toybox
	update-alternatives --remove  grep /usr/bin/toybox
	update-alternatives --remove  groups /usr/bin/toybox
	update-alternatives --remove  gunzip /usr/bin/toybox
	update-alternatives --remove  halt /usr/bin/toybox
	update-alternatives --remove  head /usr/bin/toybox
	update-alternatives --remove  help /usr/bin/toybox
	update-alternatives --remove  hexedit /usr/bin/toybox
	update-alternatives --remove  host /usr/bin/toybox
	update-alternatives --remove  hostname /usr/bin/toybox
	update-alternatives --remove  httpd /usr/bin/toybox
	update-alternatives --remove  hwclock /usr/bin/toybox
	update-alternatives --remove  i2cdetect /usr/bin/toybox
	update-alternatives --remove  i2cdump /usr/bin/toybox
	update-alternatives --remove  i2cget /usr/bin/toybox
	update-alternatives --remove  i2cset /usr/bin/toybox
	update-alternatives --remove  id /usr/bin/toybox
	update-alternatives --remove  ifconfig /usr/bin/toybox
	update-alternatives --remove  inotifyd /usr/bin/toybox
	update-alternatives --remove  insmod /usr/bin/toybox
	update-alternatives --remove  install /usr/bin/toybox
	update-alternatives --remove  ionice /usr/bin/toybox
	update-alternatives --remove  iorenice /usr/bin/toybox
	update-alternatives --remove  iotop /usr/bin/toybox
	update-alternatives --remove  kill /usr/bin/toybox
	update-alternatives --remove  killall /usr/bin/toybox
	update-alternatives --remove  link /usr/bin/toybox
	update-alternatives --remove  linux32 /usr/bin/toybox
	update-alternatives --remove  ln /usr/bin/toybox
	update-alternatives --remove  logger /usr/bin/toybox
	update-alternatives --remove  login /usr/bin/toybox
	update-alternatives --remove  logname /usr/bin/toybox
	update-alternatives --remove  losetup /usr/bin/toybox
	update-alternatives --remove  ls /usr/bin/toybox
	update-alternatives --remove  lsattr /usr/bin/toybox
	update-alternatives --remove  lsmod /usr/bin/toybox
	update-alternatives --remove  lspci /usr/bin/toybox
	update-alternatives --remove  lsusb /usr/bin/toybox
	update-alternatives --remove  makedevs /usr/bin/toybox
	update-alternatives --remove  mcookie /usr/bin/toybox
	update-alternatives --remove  md5sum /usr/bin/toybox
	update-alternatives --remove  microcom /usr/bin/toybox
	update-alternatives --remove  mix /usr/bin/toybox
	update-alternatives --remove  mkdir /usr/bin/toybox
	update-alternatives --remove  mkfifo /usr/bin/toybox
	update-alternatives --remove  mknod /usr/bin/toybox
	update-alternatives --remove  mkpasswd /usr/bin/toybox
	update-alternatives --remove  mkswap /usr/bin/toybox
	update-alternatives --remove  mktemp /usr/bin/toybox
	update-alternatives --remove  modinfo /usr/bin/toybox
	update-alternatives --remove  mount /usr/bin/toybox
	update-alternatives --remove  mountpoint /usr/bin/toybox
	update-alternatives --remove  mv /usr/bin/toybox
	update-alternatives --remove  nbd-client /usr/bin/toybox
	update-alternatives --remove  nc /usr/bin/toybox
	update-alternatives --remove  netcat /usr/bin/toybox
	update-alternatives --remove  netstat /usr/bin/toybox
	update-alternatives --remove  nice /usr/bin/toybox
	update-alternatives --remove  nl /usr/bin/toybox
	update-alternatives --remove  nohup /usr/bin/toybox
	update-alternatives --remove  nproc /usr/bin/toybox
	update-alternatives --remove  nsenter /usr/bin/toybox
	update-alternatives --remove  od /usr/bin/toybox
	update-alternatives --remove  oneit /usr/bin/toybox
	update-alternatives --remove  openvt /usr/bin/toybox
	update-alternatives --remove  partprobe /usr/bin/toybox
	update-alternatives --remove  passwd /usr/bin/toybox
	update-alternatives --remove  paste /usr/bin/toybox
	update-alternatives --remove  patch /usr/bin/toybox
	update-alternatives --remove  pgrep /usr/bin/toybox
	update-alternatives --remove  pidof /usr/bin/toybox
	update-alternatives --remove  ping /usr/bin/toybox
	update-alternatives --remove  ping6 /usr/bin/toybox
	update-alternatives --remove  pivot_root /usr/bin/toybox
	update-alternatives --remove  pkill /usr/bin/toybox
	update-alternatives --remove  pmap /usr/bin/toybox
	update-alternatives --remove  poweroff /usr/bin/toybox
	update-alternatives --remove  printenv /usr/bin/toybox
	update-alternatives --remove  printf /usr/bin/toybox
	update-alternatives --remove  prlimit /usr/bin/toybox
	update-alternatives --remove  ps /usr/bin/toybox
	update-alternatives --remove  pwd /usr/bin/toybox
	update-alternatives --remove  pwdx /usr/bin/toybox
	update-alternatives --remove  pwgen /usr/bin/toybox
	update-alternatives --remove  readahead /usr/bin/toybox
	update-alternatives --remove  readelf /usr/bin/toybox
	update-alternatives --remove  readlink /usr/bin/toybox
	update-alternatives --remove  realpath /usr/bin/toybox
	update-alternatives --remove  reboot /usr/bin/toybox
	update-alternatives --remove  renice /usr/bin/toybox
	update-alternatives --remove  reset /usr/bin/toybox
	update-alternatives --remove  rev /usr/bin/toybox
	update-alternatives --remove  rfkill /usr/bin/toybox
	update-alternatives --remove  rm /usr/bin/toybox
	update-alternatives --remove  rmdir /usr/bin/toybox
	update-alternatives --remove  rmmod /usr/bin/toybox
	update-alternatives --remove  rtcwake /usr/bin/toybox
	update-alternatives --remove  sed /usr/bin/toybox
	update-alternatives --remove  seq /usr/bin/toybox
	update-alternatives --remove  setfattr /usr/bin/toybox
	update-alternatives --remove  setsid /usr/bin/toybox
	update-alternatives --remove  sha1sum /usr/bin/toybox
	update-alternatives --remove  sha224sum /usr/bin/toybox
	update-alternatives --remove  sha256sum /usr/bin/toybox
	update-alternatives --remove  sha384sum /usr/bin/toybox
	update-alternatives --remove  sha3sum /usr/bin/toybox
	update-alternatives --remove  sha512sum /usr/bin/toybox
	update-alternatives --remove  shred /usr/bin/toybox
	update-alternatives --remove  sleep /usr/bin/toybox
	update-alternatives --remove  sntp /usr/bin/toybox
	update-alternatives --remove  sort /usr/bin/toybox
	update-alternatives --remove  split /usr/bin/toybox
	update-alternatives --remove  stat /usr/bin/toybox
	update-alternatives --remove  strings /usr/bin/toybox
	update-alternatives --remove  su /usr/bin/toybox
	update-alternatives --remove  swapoff /usr/bin/toybox
	update-alternatives --remove  switch_root /usr/bin/toybox
	update-alternatives --remove  sync /usr/bin/toybox
	update-alternatives --remove  sysctl /usr/bin/toybox
	update-alternatives --remove  tac /usr/bin/toybox
	update-alternatives --remove  tail /usr/bin/toybox
	update-alternatives --remove  tar /usr/bin/toybox
	update-alternatives --remove  taskset /usr/bin/toybox
	update-alternatives --remove  tee /usr/bin/toybox
	update-alternatives --remove  test /usr/bin/toybox
	update-alternatives --remove  time /usr/bin/toybox
	update-alternatives --remove  timeout /usr/bin/toybox
	update-alternatives --remove  top /usr/bin/toybox
	update-alternatives --remove  touch /usr/bin/toybox
	update-alternatives --remove  true /usr/bin/toybox
	update-alternatives --remove  truncate /usr/bin/toybox
	update-alternatives --remove  tty /usr/bin/toybox
	update-alternatives --remove  tunctl /usr/bin/toybox
	update-alternatives --remove  uclampset /usr/bin/toybox
	update-alternatives --remove  ulimit /usr/bin/toybox
	update-alternatives --remove  umount /usr/bin/toybox
	update-alternatives --remove  uname /usr/bin/toybox
	update-alternatives --remove  unicode /usr/bin/toybox
	update-alternatives --remove  uniq /usr/bin/toybox
	update-alternatives --remove  unix2dos /usr/bin/toybox
	update-alternatives --remove  unlink /usr/bin/toybox
	update-alternatives --remove  unshare /usr/bin/toybox
	update-alternatives --remove  uptime /usr/bin/toybox
	update-alternatives --remove  usleep /usr/bin/toybox
	update-alternatives --remove  uudecode /usr/bin/toybox
	update-alternatives --remove  uuencode /usr/bin/toybox
	update-alternatives --remove  uuidgen /usr/bin/toybox
	update-alternatives --remove  vconfig /usr/bin/toybox
	update-alternatives --remove  vmstat /usr/bin/toybox
	update-alternatives --remove  w /usr/bin/toybox
	update-alternatives --remove  watch /usr/bin/toybox
	update-alternatives --remove  watchdog /usr/bin/toybox
	update-alternatives --remove  wc /usr/bin/toybox
	update-alternatives --remove  wget /usr/bin/toybox
	update-alternatives --remove  which /usr/bin/toybox
	update-alternatives --remove  who /usr/bin/toybox
	update-alternatives --remove  whoami /usr/bin/toybox
	update-alternatives --remove  xargs /usr/bin/toybox
	update-alternatives --remove  xxd /usr/bin/toybox
	update-alternatives --remove  yes /usr/bin/toybox
	update-alternatives --remove  zcat /usr/bin/toybox
" to "#!/bin/sh
set -e
	update-alternatives --remove  [ /usr/bin/toybox
	update-alternatives --remove  acpi /usr/bin/toybox
	update-alternatives --remove  arch /usr/bin/toybox
	update-alternatives --remove  ascii /usr/bin/toybox
	update-alternatives --remove  base32 /usr/bin/toybox
	update-alternatives --remove  base64 /usr/bin/toybox
	update-alternatives --remove  basename /usr/bin/toybox
	update-alternatives --remove  blkdiscard /usr/bin/toybox
	update-alternatives --remove  blkid /usr/bin/toybox
	update-alternatives --remove  blockdev /usr/bin/toybox
	update-alternatives --remove  bunzip2 /usr/bin/toybox
	update-alternatives --remove  bzcat /usr/bin/toybox
	update-alternatives --remove  cal /usr/bin/toybox
	update-alternatives --remove  cat /usr/bin/toybox
	update-alternatives --remove  chattr /usr/bin/toybox
	update-alternatives --remove  chgrp /usr/bin/toybox
	update-alternatives --remove  chmod /usr/bin/toybox
	update-alternatives --remove  chown /usr/bin/toybox
	update-alternatives --remove  chroot /usr/bin/toybox
	update-alternatives --remove  chrt /usr/bin/toybox
	update-alternatives --remove  chvt /usr/bin/toybox
	update-alternatives --remove  cksum /usr/bin/toybox
	update-alternatives --remove  clear /usr/bin/toybox
	update-alternatives --remove  cmp /usr/bin/toybox
	update-alternatives --remove  comm /usr/bin/toybox
	update-alternatives --remove  count /usr/bin/toybox
	update-alternatives --remove  cp /usr/bin/toybox
	update-alternatives --remove  cpio /usr/bin/toybox
	update-alternatives --remove  crc32 /usr/bin/toybox
	update-alternatives --remove  cut /usr/bin/toybox
	update-alternatives --remove  date /usr/bin/toybox
	update-alternatives --remove  dd /usr/bin/toybox
	update-alternatives --remove  deallocvt /usr/bin/toybox
	update-alternatives --remove  devmem /usr/bin/toybox
	update-alternatives --remove  df /usr/bin/toybox
	update-alternatives --remove  dirname /usr/bin/toybox
	update-alternatives --remove  dmesg /usr/bin/toybox
	update-alternatives --remove  dnsdomainname /usr/bin/toybox
	update-alternatives --remove  dos2unix /usr/bin/toybox
	update-alternatives --remove  du /usr/bin/toybox
	update-alternatives --remove  echo /usr/bin/toybox
	update-alternatives --remove  egrep /usr/bin/toybox
	update-alternatives --remove  eject /usr/bin/toybox
	update-alternatives --remove  env /usr/bin/toybox
	update-alternatives --remove  expand /usr/bin/toybox
	update-alternatives --remove  factor /usr/bin/toybox
	update-alternatives --remove  fallocate /usr/bin/toybox
	update-alternatives --remove  false /usr/bin/toybox
	update-alternatives --remove  fgrep /usr/bin/toybox
	update-alternatives --remove  file /usr/bin/toybox
	update-alternatives --remove  find /usr/bin/toybox
	update-alternatives --remove  flock /usr/bin/toybox
	update-alternatives --remove  fmt /usr/bin/toybox
	update-alternatives --remove  free /usr/bin/toybox
	update-alternatives --remove  freeramdisk /usr/bin/toybox
	update-alternatives --remove  fsfreeze /usr/bin/toybox
	update-alternatives --remove  fstype /usr/bin/toybox
	update-alternatives --remove  fsync /usr/bin/toybox
	update-alternatives --remove  ftpget /usr/bin/toybox
	update-alternatives --remove  ftpput /usr/bin/toybox
	update-alternatives --remove  gpiodetect /usr/bin/toybox
	update-alternatives --remove  gpiofind /usr/bin/toybox
	update-alternatives --remove  gpioget /usr/bin/toybox
	update-alternatives --remove  gpioinfo /usr/bin/toybox
	update-alternatives --remove  gpioset /usr/bin/toybox
	update-alternatives --remove  grep /usr/bin/toybox
	update-alternatives --remove  groups /usr/bin/toybox
	update-alternatives --remove  gunzip /usr/bin/toybox
	update-alternatives --remove  halt /usr/bin/toybox
	update-alternatives --remove  head /usr/bin/toybox
	update-alternatives --remove  help /usr/bin/toybox
	update-alternatives --remove  hexedit /usr/bin/toybox
	update-alternatives --remove  host /usr/bin/toybox
	update-alternatives --remove  hostname /usr/bin/toybox
	update-alternatives --remove  httpd /usr/bin/toybox
	update-alternatives --remove  hwclock /usr/bin/toybox
	update-alternatives --remove  i2cdetect /usr/bin/toybox
	update-alternatives --remove  i2cdump /usr/bin/toybox
	update-alternatives --remove  i2cget /usr/bin/toybox
	update-alternatives --remove  i2cset /usr/bin/toybox
	update-alternatives --remove  i2ctransfer /usr/bin/toybox
	update-alternatives --remove  id /usr/bin/toybox
	update-alternatives --remove  ifconfig /usr/bin/toybox
	update-alternatives --remove  inotifyd /usr/bin/toybox
	update-alternatives --remove  insmod /usr/bin/toybox
	update-alternatives --remove  install /usr/bin/toybox
	update-alternatives --remove  ionice /usr/bin/toybox
	update-alternatives --remove  iorenice /usr/bin/toybox
	update-alternatives --remove  iotop /usr/bin/toybox
	update-alternatives --remove  kill /usr/bin/toybox
	update-alternatives --remove  killall /usr/bin/toybox
	update-alternatives --remove  link /usr/bin/toybox
	update-alternatives --remove  linux32 /usr/bin/toybox
	update-alternatives --remove  ln /usr/bin/toybox
	update-alternatives --remove  logger /usr/bin/toybox
	update-alternatives --remove  login /usr/bin/toybox
	update-alternatives --remove  logname /usr/bin/toybox
	update-alternatives --remove  losetup /usr/bin/toybox
	update-alternatives --remove  ls /usr/bin/toybox
	update-alternatives --remove  lsattr /usr/bin/toybox
	update-alternatives --remove  lsmod /usr/bin/toybox
	update-alternatives --remove  lspci /usr/bin/toybox
	update-alternatives --remove  lsusb /usr/bin/toybox
	update-alternatives --remove  makedevs /usr/bin/toybox
	update-alternatives --remove  mcookie /usr/bin/toybox
	update-alternatives --remove  md5sum /usr/bin/toybox
	update-alternatives --remove  microcom /usr/bin/toybox
	update-alternatives --remove  mix /usr/bin/toybox
	update-alternatives --remove  mkdir /usr/bin/toybox
	update-alternatives --remove  mkfifo /usr/bin/toybox
	update-alternatives --remove  mknod /usr/bin/toybox
	update-alternatives --remove  mkpasswd /usr/bin/toybox
	update-alternatives --remove  mkswap /usr/bin/toybox
	update-alternatives --remove  mktemp /usr/bin/toybox
	update-alternatives --remove  modinfo /usr/bin/toybox
	update-alternatives --remove  mount /usr/bin/toybox
	update-alternatives --remove  mountpoint /usr/bin/toybox
	update-alternatives --remove  mv /usr/bin/toybox
	update-alternatives --remove  nbd-client /usr/bin/toybox
	update-alternatives --remove  nbd-server /usr/bin/toybox
	update-alternatives --remove  nc /usr/bin/toybox
	update-alternatives --remove  netcat /usr/bin/toybox
	update-alternatives --remove  netstat /usr/bin/toybox
	update-alternatives --remove  nice /usr/bin/toybox
	update-alternatives --remove  nl /usr/bin/toybox
	update-alternatives --remove  nohup /usr/bin/toybox
	update-alternatives --remove  nproc /usr/bin/toybox
	update-alternatives --remove  nsenter /usr/bin/toybox
	update-alternatives --remove  od /usr/bin/toybox
	update-alternatives --remove  oneit /usr/bin/toybox
	update-alternatives --remove  openvt /usr/bin/toybox
	update-alternatives --remove  partprobe /usr/bin/toybox
	update-alternatives --remove  passwd /usr/bin/toybox
	update-alternatives --remove  paste /usr/bin/toybox
	update-alternatives --remove  patch /usr/bin/toybox
	update-alternatives --remove  pgrep /usr/bin/toybox
	update-alternatives --remove  pidof /usr/bin/toybox
	update-alternatives --remove  ping /usr/bin/toybox
	update-alternatives --remove  ping6 /usr/bin/toybox
	update-alternatives --remove  pivot_root /usr/bin/toybox
	update-alternatives --remove  pkill /usr/bin/toybox
	update-alternatives --remove  pmap /usr/bin/toybox
	update-alternatives --remove  poweroff /usr/bin/toybox
	update-alternatives --remove  printenv /usr/bin/toybox
	update-alternatives --remove  printf /usr/bin/toybox
	update-alternatives --remove  prlimit /usr/bin/toybox
	update-alternatives --remove  ps /usr/bin/toybox
	update-alternatives --remove  pwd /usr/bin/toybox
	update-alternatives --remove  pwdx /usr/bin/toybox
	update-alternatives --remove  pwgen /usr/bin/toybox
	update-alternatives --remove  readahead /usr/bin/toybox
	update-alternatives --remove  readelf /usr/bin/toybox
	update-alternatives --remove  readlink /usr/bin/toybox
	update-alternatives --remove  realpath /usr/bin/toybox
	update-alternatives --remove  reboot /usr/bin/toybox
	update-alternatives --remove  renice /usr/bin/toybox
	update-alternatives --remove  reset /usr/bin/toybox
	update-alternatives --remove  rev /usr/bin/toybox
	update-alternatives --remove  rfkill /usr/bin/toybox
	update-alternatives --remove  rm /usr/bin/toybox
	update-alternatives --remove  rmdir /usr/bin/toybox
	update-alternatives --remove  rmmod /usr/bin/toybox
	update-alternatives --remove  rtcwake /usr/bin/toybox
	update-alternatives --remove  sed /usr/bin/toybox
	update-alternatives --remove  seq /usr/bin/toybox
	update-alternatives --remove  setfattr /usr/bin/toybox
	update-alternatives --remove  setsid /usr/bin/toybox
	update-alternatives --remove  sha1sum /usr/bin/toybox
	update-alternatives --remove  sha224sum /usr/bin/toybox
	update-alternatives --remove  sha256sum /usr/bin/toybox
	update-alternatives --remove  sha384sum /usr/bin/toybox
	update-alternatives --remove  sha3sum /usr/bin/toybox
	update-alternatives --remove  sha512sum /usr/bin/toybox
	update-alternatives --remove  shred /usr/bin/toybox
	update-alternatives --remove  shuf /usr/bin/toybox
	update-alternatives --remove  sleep /usr/bin/toybox
	update-alternatives --remove  sntp /usr/bin/toybox
	update-alternatives --remove  sort /usr/bin/toybox
	update-alternatives --remove  split /usr/bin/toybox
	update-alternatives --remove  stat /usr/bin/toybox
	update-alternatives --remove  strings /usr/bin/toybox
	update-alternatives --remove  su /usr/bin/toybox
	update-alternatives --remove  swapoff /usr/bin/toybox
	update-alternatives --remove  switch_root /usr/bin/toybox
	update-alternatives --remove  sync /usr/bin/toybox
	update-alternatives --remove  sysctl /usr/bin/toybox
	update-alternatives --remove  tac /usr/bin/toybox
	update-alternatives --remove  tail /usr/bin/toybox
	update-alternatives --remove  tar /usr/bin/toybox
	update-alternatives --remove  taskset /usr/bin/toybox
	update-alternatives --remove  tee /usr/bin/toybox
	update-alternatives --remove  test /usr/bin/toybox
	update-alternatives --remove  time /usr/bin/toybox
	update-alternatives --remove  timeout /usr/bin/toybox
	update-alternatives --remove  top /usr/bin/toybox
	update-alternatives --remove  touch /usr/bin/toybox
	update-alternatives --remove  true /usr/bin/toybox
	update-alternatives --remove  truncate /usr/bin/toybox
	update-alternatives --remove  tty /usr/bin/toybox
	update-alternatives --remove  tunctl /usr/bin/toybox
	update-alternatives --remove  uclampset /usr/bin/toybox
	update-alternatives --remove  ulimit /usr/bin/toybox
	update-alternatives --remove  umount /usr/bin/toybox
	update-alternatives --remove  uname /usr/bin/toybox
	update-alternatives --remove  unicode /usr/bin/toybox
	update-alternatives --remove  uniq /usr/bin/toybox
	update-alternatives --remove  unix2dos /usr/bin/toybox
	update-alternatives --remove  unlink /usr/bin/toybox
	update-alternatives --remove  unshare /usr/bin/toybox
	update-alternatives --remove  uptime /usr/bin/toybox
	update-alternatives --remove  usleep /usr/bin/toybox
	update-alternatives --remove  uudecode /usr/bin/toybox
	update-alternatives --remove  uuencode /usr/bin/toybox
	update-alternatives --remove  uuidgen /usr/bin/toybox
	update-alternatives --remove  vconfig /usr/bin/toybox
	update-alternatives --remove  vmstat /usr/bin/toybox
	update-alternatives --remove  w /usr/bin/toybox
	update-alternatives --remove  watch /usr/bin/toybox
	update-alternatives --remove  watchdog /usr/bin/toybox
	update-alternatives --remove  wc /usr/bin/toybox
	update-alternatives --remove  wget /usr/bin/toybox
	update-alternatives --remove  which /usr/bin/toybox
	update-alternatives --remove  who /usr/bin/toybox
	update-alternatives --remove  whoami /usr/bin/toybox
	update-alternatives --remove  xargs /usr/bin/toybox
	update-alternatives --remove  xxd /usr/bin/toybox
	update-alternatives --remove  yes /usr/bin/toybox
	update-alternatives --remove  zcat /usr/bin/toybox
"

--===============4706915727543040374==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-toybox-upgrade-0.8.8-0.8.10.patch"

RnJvbSBkOTJlMGNmOTZkYTY4NDk2NTY0MGRmNzVkYzgxOWJlM2I4ODhhNGVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODo0OTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRv
eWJveDogdXBncmFkZSAwLjguOCAtPiAwLjguMTAKCi0tLQogLi4udGltZXJfc2V0dGltZV93cmFw
LWZvci0zMmJpdC1zeXN0ZW1zLnBhdGNoIHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3t0
b3lib3hfMC44LjguYmIgPT4gdG95Ym94XzAuOC4xMC5iYn0gICAgIHwgIDYgKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS1vZS9yZWNpcGVzLWNvcmUvdG95Ym94L3RveWJveC8wMDAxLXBvcnRhYmlsaXR5
LUZpeC10aW1lcl9zZXR0aW1lX3dyYXAtZm9yLTMyYml0LXN5c3RlbXMucGF0Y2gKIHJlbmFtZSBt
ZXRhLW9lL3JlY2lwZXMtY29yZS90b3lib3gve3RveWJveF8wLjguOC5iYiA9PiB0b3lib3hfMC44
LjEwLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC90
b3lib3gvMDAwMS1wb3J0YWJpbGl0eS1GaXgtdGltZXJfc2V0dGltZV93cmFwLWZvci0zMmJpdC1z
eXN0ZW1zLnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvdG95Ym94L3RveWJveC8wMDAxLXBv
cnRhYmlsaXR5LUZpeC10aW1lcl9zZXR0aW1lX3dyYXAtZm9yLTMyYml0LXN5c3RlbXMucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDg5NzZiMzc0OC4uMDAwMDAwMDAwCi0tLSBh
L21ldGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC90b3lib3gvMDAwMS1wb3J0YWJpbGl0eS1GaXgt
dGltZXJfc2V0dGltZV93cmFwLWZvci0zMmJpdC1zeXN0ZW1zLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzcgKzAsMCBAQAotRnJvbSA3Mjg0YzdhZTBkZjlhYTVhOWM4YWEwYTgxYTAxOGUxNzI4
OWZlMmM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KLURhdGU6IFRodSwgOCBTZXAgMjAyMiAwNzoyMjoyNiAtMDcwMAotU3ViamVj
dDogW1BBVENIXSBwb3J0YWJpbGl0eTogRml4IHRpbWVyX3NldHRpbWVfd3JhcCBmb3IgMzJiaXQg
c3lzdGVtcyB3aXRoCi0gNjRiaXQgdGltZV90Ci0KLWdsaWJjIGRvZXMgbm90IGRlZmluZSBTWVNf
dGltZXJfc2V0dGltZSBpZiB0aGUgMzJiaXQgc3lzY2FsbCBpcyBub3QKLWF2YWlsYWJsZSwgbmV3
IGFyY2hpdGVjdHVyZXMgbGlrZSByaXNjdjMyIGhhcyBkZWZhdWx0ZWQgdG8gNjRiaXQgdGltZV90
Ci1mcm9tIGdldCBnbyBhbmQgYXZvaWRlZCB3aXJpbmcgMzJiaXQgc3lzY2FsbCwgdGhlcmVmb3Jl
IGFsaWFzIGl0IHRvCi02NGJpdCB2ZXJzaW9uIGhlcmUKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJt
aXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9sYW5kbGV5L3RveWJveC9wdWxsLzM3M10KLVNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBsaWIvcG9ydGFi
aWxpdHkuYyB8IDYgKysrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQotCi1k
aWZmIC0tZ2l0IGEvbGliL3BvcnRhYmlsaXR5LmMgYi9saWIvcG9ydGFiaWxpdHkuYwotaW5kZXgg
ZDk1NWQwODEuLjRiYWE5MzY3IDEwMDY0NAotLS0tIGEvbGliL3BvcnRhYmlsaXR5LmMKLSsrKyBi
L2xpYi9wb3J0YWJpbGl0eS5jCi1AQCAtNzExLDYgKzcxMSwxMiBAQCBpbnQgdGltZXJfY3JlYXRl
X3dyYXAoY2xvY2tpZF90IGMsIHN0cnVjdCBzaWdldmVudCAqc2UsIHRpbWVyX3QgKnQpCi0gICBy
ZXR1cm4gMDsKLSB9Ci0gCi0rI2lmICFkZWZpbmVkKFNZU190aW1lcl9zZXR0aW1lKSAmJiBkZWZp
bmVkKFNZU190aW1lcl9zZXR0aW1lNjQpCi0rLy8gZ2xpYmMgZG9lcyBub3QgZGVmaW5lIGRlZmlu
ZXMgU1lTX3RpbWVyX3NldHRpbWUgb24gMzItYml0IHN5c3RlbXMKLSsvLyB3aXRoIDY0LWJpdCB0
aW1lX3QgZGVmYXVsdHMgZS5nLiByaXNjdjMyCi0rI2RlZmluZSBTWVNfdGltZXJfc2V0dGltZSBT
WVNfdGltZXJfc2V0dGltZTY0Ci0rI2VuZGlmCi0rCi0gaW50IHRpbWVyX3NldHRpbWVfd3JhcCh0
aW1lcl90IHQsIGludCBmbGFncywgc3RydWN0IGl0aW1lcnNwZWMgKnZhbCwKLSAgIHN0cnVjdCBp
dGltZXJzcGVjICpvbGQpCi0gewotLS0gCi0yLjM3LjMKLQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWNvcmUvdG95Ym94L3RveWJveF8wLjguOC5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb3Jl
L3RveWJveC90b3lib3hfMC44LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9t
IG1ldGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC90b3lib3hfMC44LjguYmIKcmVuYW1lIHRvIG1l
dGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC90b3lib3hfMC44LjEwLmJiCmluZGV4IDY4MzZiMTQ2
OC4uZDc0N2ViZjM2IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtY29yZS90b3lib3gvdG95
Ym94XzAuOC44LmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC90b3lib3hfMC44
LjEwLmJiCkBAIC03LDEwICs3LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9Nzg2NTlhNTk5YjkzMjVkYTM2OGYyZjFlYjg4ZjE5YzciCiAKIGluaGVyaXQgY21sMSB1
cGRhdGUtYWx0ZXJuYXRpdmVzCiAKLVNSQ19VUkkgPSAiaHR0cDovL3d3dy5sYW5kbGV5Lm5ldC90
b3lib3gvZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIuZ3ogXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1wb3J0YWJpbGl0eS1GaXgtdGltZXJfc2V0dGltZV93cmFwLWZvci0zMmJpdC1zeXN0ZW1z
LnBhdGNoIFwKLSAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRhZmQ0MTk3OGQ0
MGYwMmE2MWNmMWJlOTlhMmI0YTI1ODEyYmJmYjljMzE1N2U2NzllZTc2MTEyMDJkNmFjNTgiCitT
UkNfVVJJID0gImh0dHA6Ly93d3cubGFuZGxleS5uZXQvdG95Ym94L2Rvd25sb2Fkcy8ke0JQTn0t
JHtQVn0udGFyLmd6IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQzYWZlZTA1Y2E5MGJmNDI1Y2Vk
NzNmNTI3ZTQxOGZlY2Q2MjZjNTM0MGI1ZjU4NzExYTE0NTMxZjhkN2QxMDgiCiAKIFNFQ1RJT04g
PSAiYmFzZSIKIAotLSAKMi4zOS4yCgo=

--===============4706915727543040374==--

