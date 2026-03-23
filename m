Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11468F483CC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21909.1774283264778913378
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 09:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HWZIDQK1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260323162742cd7d2578e3000207aa-w6qnnk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260323162742cd7d2578e3000207aa
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 23 Mar 2026 17:27:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=08WHIoW9q6ZP/h9hgtgQL07JXF2r0Gfy6YLXVJm70Zc=;
 b=HWZIDQK1YhC28/mMHyz6ZTSxUbudXC4DhzyawmYPEy+f9Z4Zz7TlNozJFqK/NGwRXsYLk2
 KZ4qgrOKCcpRtfIodmzA0wm3EAVmT9agQFBXP3w1TgHMppFXJ6BLGprwrkU1PePIUepsjcHp
 MiwuF+ZxGgCAA2OWn/pPkzlWVal3VAZWQbCrU3RXefItwae2IIc86hCTlpmehWNPLFE5J5kQ
 CyaLkfUCRYC4RgiI7nPcGx+9TM1tdml1YZ1o57WSoeRiTZYiTisBn4u+czSYzsoEM/NDb4ZA
 xunQwJrzOcFpNU07kGEHA1Os/DmMGfQWb4cJk5gBYBeN5GV4eCam8mzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/3] lvm2: upgrade 2.03.38 -> 2.03.39
Date: Mon, 23 Mar 2026 17:27:29 +0100
Message-Id: <20260323162731.8483-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 16:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125521

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:

Add lvmlockd compare and write, index man pages, and a lot of fixes.
* Add atomic leases using Compare and Write (CAW) to lvmlockd.
* Add lvm-index(7), lvm-categories(7) and lvm-args(7) man pages.
* Use temporary activations for integrity, writecache, thin and VDO pool conv
  preventing interference.
* Fix `vgreduce --removemissing --force` infinite loop for raid/mirror snapshot.
* Improve RAID LV health report to distinguish 'refresh needed' from 'repair needed'.
* Support `--interval +N` to delay first poll in pvmove and lvpoll.
* Show active cache mode in kernel table line with `lvs -o kernel_cache_mode`.
* Reject lvreduce of CoW snapshot COW store when it would truncate exception data.
* Skip filesystem resize handling for CoW snapshot COW store LVs in lvresize.
* Fix vgsplit to not fail on no active LV on a PV being split to an existing VG.
* Preserve file desciptors with CLOEXEC opened in library constructors.
* Add lvmpolld 'cmd' log keyword to enable verbose lvpoll output.
* Add `activate_lv_temporary()` to consolidate `LV_TEMPORARY` and sync handling.
* Add missing sync in `add_mirror_log()` and `activate_and_wipe_lv_list()`.
* Fix cachevol cmeta/cdata device offsets.
* Fix pofile generation to include SOURCES2 binaries and update xgettext options.

[1] https://github.com/lvmteam/lvm2/releases/tag/v2_03_39

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0001-implement-libc-specific-reopen_stream.patch  | 6 +++---
 .../lvm2/files/0001-include-libgen.h-for-basename.patch     | 2 +-
 .../files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch   | 2 +-
 .../lvm2/files/0005-do-not-build-manual.patch               | 4 ++--
 meta-oe/recipes-support/lvm2/files/reproducible-build.patch | 2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                       | 4 ++--
 meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch  | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index 1f6b89f2b6..e157c5518e 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -48,7 +48,7 @@ diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
 index 22ae1e3bb..b0928bc04 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3407,7 +3407,7 @@ static int _check_standard_fds(void)
+@@ -3427,7 +3427,7 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -57,7 +57,7 @@ index 22ae1e3bb..b0928bc04 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3417,7 +3417,7 @@ static int _check_standard_fds(void)
+@@ -3437,7 +3437,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -66,7 +66,7 @@ index 22ae1e3bb..b0928bc04 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3425,7 +3425,7 @@ static int _check_standard_fds(void)
+@@ -3445,7 +3445,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
diff --git a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
index 2fcbc12b22..c2c83dbb7e 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
@@ -21,7 +21,7 @@ index a3f341bfc..0c05eb151 100644
 +++ b/lib/device/device_id.c
 @@ -27,6 +27,7 @@
  #include "lib/display/display.h"
- #include "device_mapper/misc/dm-ioctl.h"
+ #include "libdm/misc/dm-ioctl.h"
  
 +#include <libgen.h>
  #include <sys/stat.h>
diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index ac5c440e4e..49f8d27c00 100644
--- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -24,7 +24,7 @@ diff --git a/configure.ac b/configure.ac
 index e5e5e71ce..3af73c781 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1742,8 +1742,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
+@@ -1746,8 +1746,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
  ])
  
  ################################################################################
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index f7a85b4b3f..c2d4da5c41 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -47,7 +47,7 @@ index 06c4b1823..90df7b09c 100644
      libdaemon lib tools daemons libdm \
      udev po
  tools.distclean: test.distclean
-@@ -59,7 +59,7 @@ unit-test  run-unit-test: test libdm
+@@ -57,7 +57,7 @@ unit-test  run-unit-test: test libdm
  
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
@@ -60,7 +60,7 @@ diff --git a/configure.ac b/configure.ac
 index 3af73c781..f32d1f376 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2076,7 +2076,6 @@ libdaemon/server/Makefile
+@@ -2083,7 +2083,6 @@ libdaemon/server/Makefile
  libdm/Makefile
  libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
diff --git a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
index ca632d213f..f6c561aeb1 100644
--- a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
+++ b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
@@ -16,7 +16,7 @@ diff --git a/configure.ac b/configure.ac
 index 5364dd68e..c2dbf3c9f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -15,7 +15,15 @@ AC_PREREQ(2.69)
+@@ -14,7 +14,15 @@ AC_PREREQ(2.69)
  ################################################################################
  dnl -- Process this file with autoconf to produce a configure script.
  AC_INIT
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 9e6bd807a2..fa4970aa1b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "657e10bd75fcb3dffbd40bb1ffc6f1bfd768a10e"
-PV = "2.03.38"
+SRCREV = "6c5b6cee9f21908bdaff830c210222cc7e08f1ab"
+PV = "2.03.39"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch b/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
index 200f2f044a..fd8faaf1fe 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/tweak-for-lvmdbusd.patch
@@ -21,7 +21,7 @@ diff --git a/configure.ac b/configure.ac
 index 9dfdcfe01..fcf5c8b78 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1282,8 +1282,8 @@ AS_IF([test "$BUILD_LVMDBUSD" = "yes"], [
+@@ -1338,8 +1338,8 @@ AS_IF([test "$BUILD_LVMDBUSD" = "yes"], [
  	AS_IF([test "$PYTHON3_BINDINGS" = "yes"], [PYTHON_BINDINGS="yes"])
  
  	# To get this macro, install autoconf-archive package then run autoreconf

