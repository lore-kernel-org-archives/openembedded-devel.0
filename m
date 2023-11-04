Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED261C4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:48:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5511.1699084092451523673
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gYTNvhQq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dpKDcOTb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b994dc112-68b18ad4-f431-4c01-a44b-7e5029c23619-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WHfO1D/MhsoXCrugWrWD9XS31bhWgvi4s0i+UPQ4LLs=;
	b=gYTNvhQqRZsC4uqHOXg5bI2aFK8dYlM9Zije5ft6PM+I6gSfso6k2WstUJ+tWWtN
	+e/v72UkOvIjv4dpVq6L6XK8uAO3msKqAxVBZHkBdAoDA3KToHUyxQYSsLIKyHodBKK
	4v9WoibtNbHoAsBhYPOW0D3qQXp2nKPnAcK2OSYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WHfO1D/MhsoXCrugWrWD9XS31bhWgvi4s0i+UPQ4LLs=;
	b=dpKDcOTbKbNp6BAVWk9dYTX7cp81beikQnciPjq5UM3ezQQI9r8odzqMUDjJvEJ3
	dQUIQoKN+Pry4tbTaKOHk0BIce/fuzScUP6e4Tv3MubwfdU5EoRGXNCpic8nmzyyna9
	go9W06iIPAlbQtGEc388h+2Gwx6U72VFi098JA28=
Content-Type: multipart/mixed; boundary="===============8302202563831552789=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfsprogs: upgrading to 6.5.0 SUCCEEDED
Message-ID: <0101018b994dc112-68b18ad4-f431-4c01-a44b-7e5029c23619-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:48:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106357

--===============8302202563831552789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfsprogs* to *6.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfsprogs-upgrade-6.1.1-6.5.0.patch
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
From c12c9adcb2389a03606a695b1e7f52326fabf6a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:35:36 +0000
Subject: [PATCH] xfsprogs: upgrade 6.1.1 -> 6.5.0

---
 .../xfsprogs/{xfsprogs_6.1.1.bb => xfsprogs_6.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_6.1.1.bb => xfsprogs_6.5.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.5.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.5.0.bb
index 6267fd9a1..fd2797982 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.5.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
            file://0005-Replace-off64_t-stat64-with-off_t-stat.patch \
            "
-SRC_URI[sha256sum] = "05e8a137870db1d6182df72dda98ab7a7100deb376947e854b9d59c914c2c7bb"
+SRC_URI[sha256sum] = "8db81712b32756b97d89dd9a681ac5e325bbb75e585382cd4863fab7f9d021c6"
 inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.39.2


--===============8302202563831552789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfsprogs: SRC_URI changed from "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.1.1.tar.xz file://remove_flags_from_build_flags.patch file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch file://0001-support-usrmerge.patch file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch file://0005-Replace-off64_t-stat64-with-off_t-stat.patch" to "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.5.0.tar.xz file://remove_flags_from_build_flags.patch file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch file://0001-support-usrmerge.patch file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch file://0005-Replace-off64_t-stat64-with-off_t-stat.patch"
packages/core2-64-poky-linux/xfsprogs: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/libhandle: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/libhandle: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
Changes to packages/core2-64-poky-linux/xfsprogs (sysroot):
  /usr/share/xfsprogs/mkfs/lts_6.6.conf was added
packages/core2-64-poky-linux/xfsprogs/xfsprogs-dbg: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-dbg: PKGSIZE changed from 19616352 to 20120576 (+3%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs-dbg: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-dev: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-dev: PKGSIZE changed from 192616 to 195871 (+2%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs-dev: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-doc: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-doc: PKGSIZE changed from 143289 to 144907 (+1%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs-doc: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-fsck: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-fsck: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-locale: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-locale: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-mkfs: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-mkfs: PKGSIZE changed from 528456 to 543688 (+3%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs-mkfs: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-repair: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-repair: PKGSIZE changed from 728392 to 736584 (+1%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs-repair: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-src: FILELIST: directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/copy -> /usr/src/debug/xfsprogs/6.5.0-r0/copy, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/fsr -> /usr/src/debug/xfsprogs/6.5.0-r0/fsr, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/include -> /usr/src/debug/xfsprogs/6.5.0-r0/include, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/mkfs -> /usr/src/debug/xfsprogs/6.5.0-r0/mkfs, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/growfs -> /usr/src/debug/xfsprogs/6.5.0-r0/growfs, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/repair -> /usr/src/debug/xfsprogs/6.5.0-r0/repair, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/libhandle -> /usr/src/debug/xfsprogs/6.5.0-r0/libhandle, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/estimate -> /usr/src/debug/xfsprogs/6.5.0-r0/estimate, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/spaceman -> /usr/src/debug/xfsprogs/6.5.0-r0/spaceman, directory rename
 d /usr/src/debug/xfsprogs/6.1.1-r0/libxlog -> /usr/src/debug/xfsprogs/6.5.0-r0/libxlog, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/logprint -> /usr/src/debug/xfsprogs/6.5.0-r0/logprint, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/mdrestore -> /usr/src/debug/xfsprogs/6.5.0-r0/mdrestore, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/libxfs -> /usr/src/debug/xfsprogs/6.5.0-r0/libxfs, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/quota -> /usr/src/debug/xfsprogs/6.5.0-r0/quota, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/rtcp -> /usr/src/debug/xfsprogs/6.5.0-r0/rtcp, directory renamed /usr/src/debug/xfsprogs/6.1.1-r0/libxcmd -> /usr/src/debug/xfsprogs/6.5.0-r0/libxcmd, removed "/usr/src/debug/xfsprogs/6.1.1-r0/libfrog/projects.h /usr/src/debug/xfsprogs/6.1.1-r0/io/cowextsize.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/linux.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/projects.c /usr/src/debug/xfsprogs/6.1.1-r0/db/attrshort.c /usr/src/debug/xfsprogs/6.1.1-r0
 /libfrog/logging.c /usr/src/debug/xfsprogs/6.1.1-r0/db/attrshort.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/logging.h /usr/src/debug/xfsprogs/6.1.1-r0/db/btheight.c /usr/src/debug/xfsprogs/6.1.1-r0/db/btblock.h /usr/src/debug/xfsprogs/6.1.1-r0/io/resblks.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/paths.c /usr/src/debug/xfsprogs/6.1.1-r0/db/bmroot.h /usr/src/debug/xfsprogs/6.1.1-r0/io/io.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/paths.h /usr/src/debug/xfsprogs/6.1.1-r0/db/btblock.c /usr/src/debug/xfsprogs/6.1.1-r0/io/pwrite.c /usr/src/debug/xfsprogs/6.1.1-r0/db/bmroot.c /usr/src/debug/xfsprogs/6.1.1-r0/db/output.c /usr/src/debug/xfsprogs/6.1.1-r0/db/output.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/workqueue.c /usr/src/debug/xfsprogs/6.1.1-r0/io/copy_file_range.c /usr/src/debug/xfsprogs/6.1.1-r0/io/readdir.c /usr/src/debug/xfsprogs/6.1.1-r0/io/sync_file_range.c /usr/src/debug/xfsprogs/6.1.1-r0/db/logformat.h /usr/src/debug/xfsprogs/6.1.1-r0/io/fsmap.c /usr/src/debug/xfsprogs/6.1.1-r
 0/io/swapext.c /usr/src/debug/xfsprogs/6.1.1-r0/db/logformat.c /usr/src/debug/xfsprogs/6.1.1-r0/io/pread.c /usr/src/debug/xfsprogs/6.1.1-r0/io/shutdown.c /usr/src/debug/xfsprogs/6.1.1-r0/io/reflink.c /usr/src/debug/xfsprogs/6.1.1-r0/io/encrypt.c /usr/src/debug/xfsprogs/6.1.1-r0/io/crc32cselftest.c /usr/src/debug/xfsprogs/6.1.1-r0/db/timelimit.c /usr/src/debug/xfsprogs/6.1.1-r0/io/parent.c /usr/src/debug/xfsprogs/6.1.1-r0/db/io.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/bitmap.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/fsgeom.h /usr/src/debug/xfsprogs/6.1.1-r0/io/mincore.c /usr/src/debug/xfsprogs/6.1.1-r0/db/io.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/bitmap.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/fsgeom.c /usr/src/debug/xfsprogs/6.1.1-r0/io/bulkstat.c /usr/src/debug/xfsprogs/6.1.1-r0/db/dir2sf.c /usr/src/debug/xfsprogs/6.1.1-r0/db/dir2sf.h /usr/src/debug/xfsprogs/6.1.1-r0/io/init.c /usr/src/debug/xfsprogs/6.1.1-r0/io/link.c /usr/src/debug/xfsprogs/6.1.1-r0/io/mmap.c /usr/src/de
 bug/xfsprogs/6.1.1-r0/db/quit.c /usr/src/debug/xfsprogs/6.1.1-r0/db/text.c /usr/src/debug/xfsprogs/6.1.1-r0/db/type.c /usr/src/debug/xfsprogs/6.1.1-r0/db/echo.c /usr/src/debug/xfsprogs/6.1.1-r0/db/frag.c /usr/src/debug/xfsprogs/6.1.1-r0/db/agfl.c /usr/src/debug/xfsprogs/6.1.1-r0/db/addr.c /usr/src/debug/xfsprogs/6.1.1-r0/db/attr.c /usr/src/debug/xfsprogs/6.1.1-r0/db/inode.c /usr/src/debug/xfsprogs/6.1.1-r0/db/write.c /usr/src/debug/xfsprogs/6.1.1-r0/db/fuzz.c /usr/src/debug/xfsprogs/6.1.1-r0/db/hash.c /usr/src/debug/xfsprogs/6.1.1-r0/db/help.c /usr/src/debug/xfsprogs/6.1.1-r0/db/info.c /usr/src/debug/xfsprogs/6.1.1-r0/db/init.c /usr/src/debug/xfsprogs/6.1.1-r0/db/bmap.c /usr/src/debug/xfsprogs/6.1.1-r0/db/dir2.c /usr/src/debug/xfsprogs/6.1.1-r0/db/dir2.h /usr/src/debug/xfsprogs/6.1.1-r0/db/attr.h /usr/src/debug/xfsprogs/6.1.1-r0/db/bmap.h /usr/src/debug/xfsprogs/6.1.1-r0/db/write.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/workqueue.h /usr/src/debug/xfsprogs/6.1.1-r0/db/fuzz.h /usr/s
 rc/debug/xfsprogs/6.1.1-r0/db/hash.h /usr/src/debug/xfsprogs/6.1.1-r0/db/help.h /usr/src/debug/xfsprogs/6.1.1-r0/db/init.h /usr/src/debug/xfsprogs/6.1.1-r0/db/inode.h /usr/src/debug/xfsprogs/6.1.1-r0/db/command.h /usr/src/debug/xfsprogs/6.1.1-r0/db/debug.c /usr/src/debug/xfsprogs/6.1.1-r0/db/addr.h /usr/src/debug/xfsprogs/6.1.1-r0/db/agfl.h /usr/src/debug/xfsprogs/6.1.1-r0/db/echo.h /usr/src/debug/xfsprogs/6.1.1-r0/db/frag.h /usr/src/debug/xfsprogs/6.1.1-r0/db/command.c /usr/src/debug/xfsprogs/6.1.1-r0/db/quit.h /usr/src/debug/xfsprogs/6.1.1-r0/db/debug.h /usr/src/debug/xfsprogs/6.1.1-r0/db/text.h /usr/src/debug/xfsprogs/6.1.1-r0/db/type.h /usr/src/debug/xfsprogs/6.1.1-r0/io/truncate.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/avl64.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/crc32table.h /usr/src/debug/xfsprogs/6.1.1-r0/db/faddr.c /usr/src/debug/xfsprogs/6.1.1-r0/io/fsync.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/avl64.h /usr/src/debug/xfsprogs/6.1.1-r0/db/faddr.h /usr/src/debug/xfs
 progs/6.1.1-r0/io/sendfile.c /usr/src/debug/xfsprogs/6.1.1-r0/io/inject.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/convert.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/convert.h /usr/src/debug/xfsprogs/6.1.1-r0/io/freeze.c /usr/src/debug/xfsprogs/6.1.1-r0/io/getrusage.c /usr/src/debug/xfsprogs/6.1.1-r0/db/dquot.c /usr/src/debug/xfsprogs/6.1.1-r0/db/flist.c /usr/src/debug/xfsprogs/6.1.1-r0/db/input.c /usr/src/debug/xfsprogs/6.1.1-r0/db/print.c /usr/src/debug/xfsprogs/6.1.1-r0/db/dquot.h /usr/src/debug/xfsprogs/6.1.1-r0/db/flist.h /usr/src/debug/xfsprogs/6.1.1-r0/db/input.h /usr/src/debug/xfsprogs/6.1.1-r0/db/print.h /usr/src/debug/xfsprogs/6.1.1-r0/io/utimes.c /usr/src/debug/xfsprogs/6.1.1-r0/db/fsmap.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/platform.h /usr/src/debug/xfsprogs/6.1.1-r0/db/fsmap.h /usr/src/debug/xfsprogs/6.1.1-r0/db/convert.c /usr/src/debug/xfsprogs/6.1.1-r0/db/field.c /usr/src/debug/xfsprogs/6.1.1-r0/db/symlink.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/bulkstat.c /us
 r/src/debug/xfsprogs/6.1.1-r0/libfrog/bulkstat.h /usr/src/debug/xfsprogs/6.1.1-r0/db/field.h /usr/src/debug/xfsprogs/6.1.1-r0/db/symlink.c /usr/src/debug/xfsprogs/6.1.1-r0/io/scrub.c /usr/src/debug/xfsprogs/6.1.1-r0/db/attrset.h /usr/src/debug/xfsprogs/6.1.1-r0/io/fiemap.c /usr/src/debug/xfsprogs/6.1.1-r0/io/prealloc.c /usr/src/debug/xfsprogs/6.1.1-r0/db/malloc.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/crc32cselftest.h /usr/src/debug/xfsprogs/6.1.1-r0/db/attrset.c /usr/src/debug/xfsprogs/6.1.1-r0/db/malloc.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/util.c /usr/src/debug/xfsprogs/6.1.1-r0/io/label.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/util.h /usr/src/debug/xfsprogs/6.1.1-r0/db/sb.c /usr/src/debug/xfsprogs/6.1.1-r0/db/sb.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/crc32.c /usr/src/debug/xfsprogs/6.1.1-r0/io/fadvise.c /usr/src/debug/xfsprogs/6.1.1-r0/io/madvise.c /usr/src/debug/xfsprogs/6.1.1-r0/db/strvec.c /usr/src/debug/xfsprogs/6.1.1-r0/db/fprint.c /usr/src/debug/xfsprogs/6.1.1
 -r0/libfrog/crc32c.h /usr/src/debug/xfsprogs/6.1.1-r0/db/fprint.h /usr/src/debug/xfsprogs/6.1.1-r0/db/strvec.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/list_sort.c /usr/src/debug/xfsprogs/6.1.1-r0/db/agf.c /usr/src/debug/xfsprogs/6.1.1-r0/db/agi.c /usr/src/debug/xfsprogs/6.1.1-r0/db/bit.c /usr/src/debug/xfsprogs/6.1.1-r0/db/crc.c /usr/src/debug/xfsprogs/6.1.1-r0/db/sig.c /usr/src/debug/xfsprogs/6.1.1-r0/db/agf.h /usr/src/debug/xfsprogs/6.1.1-r0/db/agi.h /usr/src/debug/xfsprogs/6.1.1-r0/db/bit.h /usr/src/debug/xfsprogs/6.1.1-r0/db/crc.h /usr/src/debug/xfsprogs/6.1.1-r0/db/sig.h /usr/src/debug/xfsprogs/6.1.1-r0/db/namei.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/scrub.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/scrub.h /usr/src/debug/xfsprogs/6.1.1-r0/db/block.c /usr/src/debug/xfsprogs/6.1.1-r0/db/check.c /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/radix-tree.c /usr/src/debug/xfsprogs/6.1.1-r0/io/open.c /usr/src/debug/xfsprogs/6.1.1-r0/io/seek.c /usr/src/debug/xfsprogs/6.1.1-r0/io/stat.c 
 /usr/src/debug/xfsprogs/6.1.1-r0/io/sync.c /usr/src/debug/xfsprogs/6.1.1-r0/io/attr.c /usr/src/debug/xfsprogs/6.1.1-r0/io/bmap.c /usr/src/debug/xfsprogs/6.1.1-r0/io/file.c /usr/src/debug/xfsprogs/6.1.1-r0/db/block.h /usr/src/debug/xfsprogs/6.1.1-r0/db/check.h /usr/src/debug/xfsprogs/6.1.1-r0/io/imap.c /usr/src/debug/xfsprogs/6.1.1-r0/io/init.h /usr/src/debug/xfsprogs/6.1.1-r0/libfrog/radix-tree.h /usr/src/debug/xfsprogs/6.1.1-r0/db/metadump.c /usr/src/debug/xfsprogs/6.1.1-r0/db/freesp.h /usr/src/debug/xfsprogs/6.1.1-r0/db/btdump.c /usr/src/debug/xfsprogs/6.1.1-r0/db/freesp.c /usr/src/debug/xfsprogs/6.1.1-r0/db/metadump.h", added "/usr/src/debug/xfsprogs/6.5.0-r0/libfrog/projects.h /usr/src/debug/xfsprogs/6.5.0-r0/io/cowextsize.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/linux.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/projects.c /usr/src/debug/xfsprogs/6.5.0-r0/db/attrshort.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/logging.c /usr/src/debug/xfsprogs/6.5.0-r0/db/attrshort.h /usr/src/d
 ebug/xfsprogs/6.5.0-r0/libfrog/bitmask.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/logging.h /usr/src/debug/xfsprogs/6.5.0-r0/db/btheight.c /usr/src/debug/xfsprogs/6.5.0-r0/db/btblock.h /usr/src/debug/xfsprogs/6.5.0-r0/io/resblks.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/paths.c /usr/src/debug/xfsprogs/6.5.0-r0/db/bmroot.h /usr/src/debug/xfsprogs/6.5.0-r0/io/io.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/paths.h /usr/src/debug/xfsprogs/6.5.0-r0/db/btblock.c /usr/src/debug/xfsprogs/6.5.0-r0/db/bmroot.c /usr/src/debug/xfsprogs/6.5.0-r0/io/pwrite.c /usr/src/debug/xfsprogs/6.5.0-r0/db/output.c /usr/src/debug/xfsprogs/6.5.0-r0/db/output.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/workqueue.c /usr/src/debug/xfsprogs/6.5.0-r0/io/copy_file_range.c /usr/src/debug/xfsprogs/6.5.0-r0/io/readdir.c /usr/src/debug/xfsprogs/6.5.0-r0/io/sync_file_range.c /usr/src/debug/xfsprogs/6.5.0-r0/db/logformat.h /usr/src/debug/xfsprogs/6.5.0-r0/io/fsmap.c /usr/src/debug/xfsprogs/6.5.0-r0/io/swapext.c /usr/src/de
 bug/xfsprogs/6.5.0-r0/db/logformat.c /usr/src/debug/xfsprogs/6.5.0-r0/io/pread.c /usr/src/debug/xfsprogs/6.5.0-r0/io/shutdown.c /usr/src/debug/xfsprogs/6.5.0-r0/io/reflink.c /usr/src/debug/xfsprogs/6.5.0-r0/db/btdump.c /usr/src/debug/xfsprogs/6.5.0-r0/io/encrypt.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/dahashselftest.h /usr/src/debug/xfsprogs/6.5.0-r0/io/crc32cselftest.c /usr/src/debug/xfsprogs/6.5.0-r0/db/timelimit.c /usr/src/debug/xfsprogs/6.5.0-r0/io/parent.c /usr/src/debug/xfsprogs/6.5.0-r0/db/io.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/bitmap.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/fsgeom.h /usr/src/debug/xfsprogs/6.5.0-r0/io/mincore.c /usr/src/debug/xfsprogs/6.5.0-r0/db/io.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/bitmap.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/fsgeom.c /usr/src/debug/xfsprogs/6.5.0-r0/io/bulkstat.c /usr/src/debug/xfsprogs/6.5.0-r0/db/dir2sf.c /usr/src/debug/xfsprogs/6.5.0-r0/db/dir2sf.h /usr/src/debug/xfsprogs/6.5.0-r0/io/init.c /usr/src/debug/xfspr
 ogs/6.5.0-r0/io/link.c /usr/src/debug/xfsprogs/6.5.0-r0/io/mmap.c /usr/src/debug/xfsprogs/6.5.0-r0/db/type.c /usr/src/debug/xfsprogs/6.5.0-r0/db/echo.c /usr/src/debug/xfsprogs/6.5.0-r0/db/frag.c /usr/src/debug/xfsprogs/6.5.0-r0/db/agfl.c /usr/src/debug/xfsprogs/6.5.0-r0/db/addr.c /usr/src/debug/xfsprogs/6.5.0-r0/db/attr.c /usr/src/debug/xfsprogs/6.5.0-r0/db/inode.c /usr/src/debug/xfsprogs/6.5.0-r0/db/write.c /usr/src/debug/xfsprogs/6.5.0-r0/db/fuzz.c /usr/src/debug/xfsprogs/6.5.0-r0/db/hash.c /usr/src/debug/xfsprogs/6.5.0-r0/db/help.c /usr/src/debug/xfsprogs/6.5.0-r0/db/info.c /usr/src/debug/xfsprogs/6.5.0-r0/db/init.c /usr/src/debug/xfsprogs/6.5.0-r0/db/bmap.c /usr/src/debug/xfsprogs/6.5.0-r0/db/dir2.c /usr/src/debug/xfsprogs/6.5.0-r0/db/attr.h /usr/src/debug/xfsprogs/6.5.0-r0/db/quit.c /usr/src/debug/xfsprogs/6.5.0-r0/db/text.c /usr/src/debug/xfsprogs/6.5.0-r0/db/write.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/workqueue.h /usr/src/debug/xfsprogs/6.5.0-r0/db/fuzz.h /usr/src/debug/
 xfsprogs/6.5.0-r0/db/hash.h /usr/src/debug/xfsprogs/6.5.0-r0/db/help.h /usr/src/debug/xfsprogs/6.5.0-r0/db/init.h /usr/src/debug/xfsprogs/6.5.0-r0/db/inode.h /usr/src/debug/xfsprogs/6.5.0-r0/db/command.h /usr/src/debug/xfsprogs/6.5.0-r0/db/debug.c /usr/src/debug/xfsprogs/6.5.0-r0/db/addr.h /usr/src/debug/xfsprogs/6.5.0-r0/db/agfl.h /usr/src/debug/xfsprogs/6.5.0-r0/db/bmap.h /usr/src/debug/xfsprogs/6.5.0-r0/db/dir2.h /usr/src/debug/xfsprogs/6.5.0-r0/db/echo.h /usr/src/debug/xfsprogs/6.5.0-r0/db/frag.h /usr/src/debug/xfsprogs/6.5.0-r0/db/command.c /usr/src/debug/xfsprogs/6.5.0-r0/db/quit.h /usr/src/debug/xfsprogs/6.5.0-r0/db/debug.h /usr/src/debug/xfsprogs/6.5.0-r0/db/text.h /usr/src/debug/xfsprogs/6.5.0-r0/io/truncate.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/avl64.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/crc32table.h /usr/src/debug/xfsprogs/6.5.0-r0/db/faddr.c /usr/src/debug/xfsprogs/6.5.0-r0/io/fsync.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/avl64.h /usr/src/debug/xfsprogs/6.5.
 0-r0/db/faddr.h /usr/src/debug/xfsprogs/6.5.0-r0/io/sendfile.c /usr/src/debug/xfsprogs/6.5.0-r0/io/inject.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/convert.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/convert.h /usr/src/debug/xfsprogs/6.5.0-r0/io/freeze.c /usr/src/debug/xfsprogs/6.5.0-r0/io/getrusage.c /usr/src/debug/xfsprogs/6.5.0-r0/db/dquot.c /usr/src/debug/xfsprogs/6.5.0-r0/db/flist.c /usr/src/debug/xfsprogs/6.5.0-r0/db/input.c /usr/src/debug/xfsprogs/6.5.0-r0/db/print.c /usr/src/debug/xfsprogs/6.5.0-r0/db/dquot.h /usr/src/debug/xfsprogs/6.5.0-r0/db/flist.h /usr/src/debug/xfsprogs/6.5.0-r0/db/input.h /usr/src/debug/xfsprogs/6.5.0-r0/db/print.h /usr/src/debug/xfsprogs/6.5.0-r0/io/utimes.c /usr/src/debug/xfsprogs/6.5.0-r0/db/obfuscate.c /usr/src/debug/xfsprogs/6.5.0-r0/db/obfuscate.h /usr/src/debug/xfsprogs/6.5.0-r0/db/type.h /usr/src/debug/xfsprogs/6.5.0-r0/db/fsmap.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/randbytes.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/platform.h /usr/src/
 debug/xfsprogs/6.5.0-r0/db/fsmap.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/randbytes.h /usr/src/debug/xfsprogs/6.5.0-r0/db/convert.c /usr/src/debug/xfsprogs/6.5.0-r0/db/field.c /usr/src/debug/xfsprogs/6.5.0-r0/db/symlink.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/bulkstat.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/bulkstat.h /usr/src/debug/xfsprogs/6.5.0-r0/db/field.h /usr/src/debug/xfsprogs/6.5.0-r0/db/iunlink.c /usr/src/debug/xfsprogs/6.5.0-r0/db/symlink.c /usr/src/debug/xfsprogs/6.5.0-r0/io/scrub.c /usr/src/debug/xfsprogs/6.5.0-r0/db/attrset.h /usr/src/debug/xfsprogs/6.5.0-r0/io/fiemap.c /usr/src/debug/xfsprogs/6.5.0-r0/io/prealloc.c /usr/src/debug/xfsprogs/6.5.0-r0/db/malloc.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/crc32cselftest.h /usr/src/debug/xfsprogs/6.5.0-r0/db/attrset.c /usr/src/debug/xfsprogs/6.5.0-r0/db/malloc.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/util.c /usr/src/debug/xfsprogs/6.5.0-r0/io/label.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/util.h /usr/src/debug/xf
 sprogs/6.5.0-r0/db/sb.c /usr/src/debug/xfsprogs/6.5.0-r0/db/sb.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/crc32.c /usr/src/debug/xfsprogs/6.5.0-r0/io/fadvise.c /usr/src/debug/xfsprogs/6.5.0-r0/io/madvise.c /usr/src/debug/xfsprogs/6.5.0-r0/db/strvec.c /usr/src/debug/xfsprogs/6.5.0-r0/db/fprint.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/crc32c.h /usr/src/debug/xfsprogs/6.5.0-r0/db/fprint.h /usr/src/debug/xfsprogs/6.5.0-r0/db/strvec.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/list_sort.c /usr/src/debug/xfsprogs/6.5.0-r0/db/agf.c /usr/src/debug/xfsprogs/6.5.0-r0/db/agi.c /usr/src/debug/xfsprogs/6.5.0-r0/db/bit.c /usr/src/debug/xfsprogs/6.5.0-r0/db/crc.c /usr/src/debug/xfsprogs/6.5.0-r0/db/sig.c /usr/src/debug/xfsprogs/6.5.0-r0/db/agf.h /usr/src/debug/xfsprogs/6.5.0-r0/db/agi.h /usr/src/debug/xfsprogs/6.5.0-r0/db/bit.h /usr/src/debug/xfsprogs/6.5.0-r0/db/crc.h /usr/src/debug/xfsprogs/6.5.0-r0/db/sig.h /usr/src/debug/xfsprogs/6.5.0-r0/db/namei.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/scr
 ub.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/scrub.h /usr/src/debug/xfsprogs/6.5.0-r0/db/block.c /usr/src/debug/xfsprogs/6.5.0-r0/db/check.c /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/radix-tree.c /usr/src/debug/xfsprogs/6.5.0-r0/io/open.c /usr/src/debug/xfsprogs/6.5.0-r0/io/seek.c /usr/src/debug/xfsprogs/6.5.0-r0/io/stat.c /usr/src/debug/xfsprogs/6.5.0-r0/io/sync.c /usr/src/debug/xfsprogs/6.5.0-r0/io/attr.c /usr/src/debug/xfsprogs/6.5.0-r0/io/bmap.c /usr/src/debug/xfsprogs/6.5.0-r0/io/file.c /usr/src/debug/xfsprogs/6.5.0-r0/db/block.h /usr/src/debug/xfsprogs/6.5.0-r0/db/check.h /usr/src/debug/xfsprogs/6.5.0-r0/io/imap.c /usr/src/debug/xfsprogs/6.5.0-r0/io/init.h /usr/src/debug/xfsprogs/6.5.0-r0/libfrog/radix-tree.h /usr/src/debug/xfsprogs/6.5.0-r0/db/metadump.c /usr/src/debug/xfsprogs/6.5.0-r0/db/freesp.h /usr/src/debug/xfsprogs/6.5.0-r0/io/fsuuid.c /usr/src/debug/xfsprogs/6.5.0-r0/db/freesp.c /usr/src/debug/xfsprogs/6.5.0-r0/db/metadump.h"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-src: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-src: PKGSIZE changed from 4500024 to 4591346 (+2%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs-src: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs-staticdev: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs-staticdev: PKGV changed from 6.1.1 [default] to 6.5.0 [default]
packages/core2-64-poky-linux/xfsprogs/xfsprogs: FILELIST: added "/usr/share/xfsprogs/mkfs/lts_6.6.conf"
packages/core2-64-poky-linux/xfsprogs/xfsprogs: PV changed from "6.1.1" to "6.5.0"
packages/core2-64-poky-linux/xfsprogs/xfsprogs: PKGSIZE changed from 3096185 to 3146445 (+2%)
packages/core2-64-poky-linux/xfsprogs/xfsprogs: PKGV changed from 6.1.1 [default] to 6.5.0 [default]

--===============8302202563831552789==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfsprogs-upgrade-6.1.1-6.5.0.patch"

RnJvbSBjMTJjOWFkY2IyMzg5YTAzNjA2YTY5NWIxZTdmNTIzMjZmYWJmNmE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzozNTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
c3Byb2dzOiB1cGdyYWRlIDYuMS4xIC0+IDYuNS4wCgotLS0KIC4uLi94ZnNwcm9ncy97eGZzcHJv
Z3NfNi4xLjEuYmIgPT4geGZzcHJvZ3NfNi41LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtZmls
ZXN5c3RlbXMvcmVjaXBlcy11dGlscy94ZnNwcm9ncy97eGZzcHJvZ3NfNi4xLjEuYmIgPT4geGZz
cHJvZ3NfNi41LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1maWxlc3lzdGVtcy9yZWNp
cGVzLXV0aWxzL3hmc3Byb2dzL3hmc3Byb2dzXzYuMS4xLmJiIGIvbWV0YS1maWxlc3lzdGVtcy9y
ZWNpcGVzLXV0aWxzL3hmc3Byb2dzL3hmc3Byb2dzXzYuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy11dGlscy94ZnNwcm9ncy94
ZnNwcm9nc182LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxz
L3hmc3Byb2dzL3hmc3Byb2dzXzYuNS4wLmJiCmluZGV4IDYyNjdmZDlhMS4uZmQyNzk3OTgyIDEw
MDY0NAotLS0gYS9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtdXRpbHMveGZzcHJvZ3MveGZzcHJv
Z3NfNi4xLjEuYmIKKysrIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3hmc3Byb2dz
L3hmc3Byb2dzXzYuNS4wLmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9wdWIvbGludXgvdXRpbHMvZnMveGZzL3hmc3Byb2dzLyR7QlB9LnRhci54
eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LWNvbmZpZ3VyZS1Vc2UtQUNfU1lTX0xBUkdFUkZJ
TEUtYXV0b2NvbmYtbWFjcm8ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNS1SZXBsYWNl
LW9mZjY0X3Qtc3RhdDY0LXdpdGgtb2ZmX3Qtc3RhdC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIwNWU4YTEzNzg3MGRiMWQ2MTgyZGY3MmRkYTk4YWI3YTcxMDBk
ZWIzNzY5NDdlODU0YjlkNTljOTE0YzJjN2JiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhkYjgx
NzEyYjMyNzU2Yjk3ZDg5ZGQ5YTY4MWFjNWUzMjViYmI3NWU1ODUzODJjZDQ4NjNmYWI3ZjlkMDIx
YzYiCiBpbmhlcml0IGF1dG90b29scy1icm9rZW5zZXAgcGtnY29uZmlnCiAKIFBBQ0tBR0VTID0r
ICIke1BOfS1mc2NrICR7UE59LW1rZnMgJHtQTn0tcmVwYWlyIGxpYmhhbmRsZSIKLS0gCjIuMzku
MgoK

--===============8302202563831552789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/xfsprogs (sysroot):
  /usr/share/xfsprogs/mkfs/lts_6.6.conf was added
packages/core2-64-poky-linux/xfsprogs/xfsprogs: FILELIST: added "/usr/share/xfsprogs/mkfs/lts_6.6.conf"

--===============8302202563831552789==--

