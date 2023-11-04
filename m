Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FCFC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:48:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.5512.1699084093576871866
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tv23Pgk0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r40BE10S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b994dc109-1982360a-4470-453c-ae84-896edb7f1387-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VUYmXegGEdpNlhIrOTKCIRlWUIMLUk7VnyFyhd1ccQM=;
	b=Tv23Pgk0y4ZFSosMDFPdGB4dFhzVDckBn+mI6qZOgOC6w3RNjIptyA8Vf2WbQ34S
	peen85DnHwmX8esJsVMDjbpzVsO0SNXEGAnAgYUkLYGKq3+UplFrySoXRvfeHpRr1JI
	nD3/sD2IORkWZrP8pLFAiTZN3sSGHPEheiygFZ54=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VUYmXegGEdpNlhIrOTKCIRlWUIMLUk7VnyFyhd1ccQM=;
	b=r40BE10SFOXWppdjnye44qD89RNaqre/8UxhnBgjAdOzT2ohFnZuJo6+Nu8aw4ou
	6/sBH4WUotrzZPZsyVK8HeXK532Z1TCl4G6Gb2vabXCfvnQWch8yjADOxEQTJnHWO4F
	r5Dn0N+ty75vckVihKfhcXUGSFwSsEgo7zuPI4Zk=
Content-Type: multipart/mixed; boundary="===============4327821350367033618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfstests: upgrading to 2023.10.29 SUCCEEDED
Message-ID: <0101018b994dc109-1982360a-4470-453c-ae84-896edb7f1387-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:48:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106361

--===============4327821350367033618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfstests* to *2023.10.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfstests-upgrade-2023.03.05-2023.10.29.patch
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
From 99e3d2744d7e476c94f5296d7874a01413a2c972 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:39:42 +0000
Subject: [PATCH] xfstests: upgrade 2023.03.05 -> 2023.10.29

---
 .../0001-Add-a-return-type-to-aio_rw.patch    | 28 ---------------
 ...for-FTW_ACTIONRETVAL-along-with-nftw.patch | 34 -------------------
 ...unts_propagation-and-remove-sys-moun.patch | 31 +++++------------
 ...s_2023.03.05.bb => xfstests_2023.10.29.bb} |  5 ++-
 4 files changed, 10 insertions(+), 88 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2023.03.05.bb => xfstests_2023.10.29.bb} (92%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch
deleted file mode 100644
index e0a04c907..000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f172ea004d34b00aa7bd5baff9422b2ab80df6e7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Aug 2022 13:32:10 -0700
-Subject: [PATCH 1/2] Add a return type to aio_rw
-
-Compilers complain about the function prototype otherwise
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltp/fsx.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ltp/fsx.c b/ltp/fsx.c
-index 12c2cc33..55b4e9b6 100644
---- a/ltp/fsx.c
-+++ b/ltp/fsx.c
-@@ -2429,6 +2429,7 @@ out_error:
- 	return -1;
- }
- #else
-+int
- aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
- {
- 	fprintf(stderr, "io_rw: need AIO support!\n");
--- 
-2.37.2
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch
deleted file mode 100644
index fd34989fd..000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2a4fed8331f996421e65db446559991a854e2ad3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 24 Mar 2023 18:23:01 -0700
-Subject: [PATCH] m4: Check for FTW_ACTIONRETVAL along with nftw
-
-FTW_ACTIONRETVAL is glibc specific extention which is used to implement
-xfsfind but it may not be available on other C library implementations on Linux
-e.g. musl. Therefore ensure that these defines are available before declaring
-nftw() to be usable
-
-Upstream-Status: Submitted [https://lore.kernel.org/fstests/20230325012858.587801-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Darrick J. Wong <djwong@kernel.org>
-Cc: Zorro Lang <zlang@redhat.com>
----
- m4/package_libcdev.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/package_libcdev.m4 b/m4/package_libcdev.m4
-index b41c087b..7f731044 100644
---- a/m4/package_libcdev.m4
-+++ b/m4/package_libcdev.m4
-@@ -132,7 +132,7 @@ AC_DEFUN([AC_HAVE_NFTW],
- #include <stddef.h>
- #include <ftw.h>
-     ]], [[
--         nftw("/", (int (*)(const char *, const struct stat *, int, struct FTW *))1, 0, 0);
-+         nftw("/", (int (*)(const char *, const struct stat *, int, struct FTW *))1, 0, FTW_ACTIONRETVAL);
-     ]])],[have_nftw=yes
-        AC_MSG_RESULT(yes)],[AC_MSG_RESULT(no)])
-     AC_SUBST(have_nftw)
--- 
-2.40.0
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
index a594b73a1..856fd270f 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
@@ -1,8 +1,8 @@
-From dd43cbc7f50266cdc6210f2b920d7f648a83bdd6 Mon Sep 17 00:00:00 2001
+From 559f685f83d12d11bf9ec6c6ce924ee4d0702a2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Aug 2022 13:33:05 -0700
-Subject: [PATCH 2/2] Drop detached_mounts_propagation and remove sys/mount.h
- from vfs/utils.c
+Subject: [PATCH] Drop detached_mounts_propagation and remove sys/mount.h from
+ vfs/utils.c
 
 with glibc 2.36+ sys/mount.h conflicts with linux/mount.h and here
 linux/mount.h is included via xfs/xfs.h header and we need sys/mount.h
@@ -12,16 +12,16 @@ testcase
 Upstream-Status: Inappropriate [Libc specific Workaround]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- src/Makefile    | 2 +-
- src/vfs/utils.c | 1 -
- 2 files changed, 1 insertion(+), 2 deletions(-)
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 665edcf9..7debcbbd 100644
+index 2815f919..448fccc9 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -31,7 +31,7 @@ LINUX_TARGETS = xfsctl bstat t_mtab getdevicesize preallo_rw_pattern_reader \
+@@ -32,7 +32,7 @@ LINUX_TARGETS = xfsctl bstat t_mtab getdevicesize preallo_rw_pattern_reader \
  	dio-invalidate-cache stat_test t_encrypted_d_revalidate \
  	attr_replace_test swapon mkswap t_attr_corruption t_open_tmpfiles \
  	fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail \
@@ -30,18 +30,3 @@ index 665edcf9..7debcbbd 100644
  	uuid_ioctl
  
  EXTRA_EXECS = dmerror fill2attr fill2fs fill2fs_check scaleread.sh \
-diff --git a/src/vfs/utils.c b/src/vfs/utils.c
-index 1388edda..aacd6c0a 100644
---- a/src/vfs/utils.c
-+++ b/src/vfs/utils.c
-@@ -10,7 +10,6 @@
- #include <stdlib.h>
- #include <sys/eventfd.h>
- #include <sys/fsuid.h>
--#include <sys/mount.h>
- #include <sys/prctl.h>
- #include <sys/socket.h>
- #include <sys/stat.h>
--- 
-2.37.2
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
similarity index 92%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
index cfb6e4fd8..79775fcb7 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
@@ -2,13 +2,12 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
 
+SRCREV = "11914614784735c504f43b5b6baabaa713375984"
 SRCREV_FORMAT = "xfstests_unionmount"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
+SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=for-next;name=xfstests \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
-           file://0001-Add-a-return-type-to-aio_rw.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
-           file://0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch \
            "
 
 SRCREV_xfstests = "f7765774a1b5cb98c2f21a892e82b3421f40e791"
-- 
2.39.2


--===============4327821350367033618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfstests: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests: SRC_URI changed from "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite file://0001-Add-a-return-type-to-aio_rw.patch file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch file://0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch" to "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=for-next;name=xfstests git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch"
packages/core2-64-poky-linux/xfstests/xfstests-dbg: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests-dbg: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests/xfstests-dev: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests-dev: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests/xfstests-doc: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests-doc: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests/xfstests-locale: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests-locale: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests/xfstests-src: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests-src: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests/xfstests-src: PKGSIZE changed from 1725213 to 1725232 (+0%)
packages/core2-64-poky-linux/xfstests/xfstests-staticdev: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests-staticdev: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]
packages/core2-64-poky-linux/xfstests/xfstests: PV changed from "2023.03.05" to "2023.10.29"
packages/core2-64-poky-linux/xfstests/xfstests: PKGV changed from 2023.03.05 [default] to 2023.10.29 [default]

--===============4327821350367033618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4886 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 33 recipes from the core2-64 sysroot...done.
Removing 86 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:254dfaa9d1381ff17e6a6a42ab5d8c409ef1e4ba"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 615 Local 600 Mirrors 0 Missed 15 Current 181 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 182 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 183 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 184 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 189 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 198 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_create_spdx_setscene)
NOTE: Running setscene task 199 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 200 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 202 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 203 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 204 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 208 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 209 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 210 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinih-57-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 215 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_deb_setscene)
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 216 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 217 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 219 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 220 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb:do_packagedata_setscene)
NOTE: recipe libinih-57-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 221 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 222 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: recipe perl-5.38.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 223 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 224 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.38.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 227 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 228 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 229 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_ipk_setscene)
NOTE: recipe coreutils-9.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 230 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 233 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe overlayfs-tools-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 237 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 241 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 243 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 244 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 246 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: Running setscene task 247 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_deb_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 252 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 253 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 260 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 263 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 266 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 267 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_ipk_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 268 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 270 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 273 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 276 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 280 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 289 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 290 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe xfsprogs-6.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 291 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 300 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 313 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfsprogs/6.1.1/temp/log.do_packagedata_setscene.2939756
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 318 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_package_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 361 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 362 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 796 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 470 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 343 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_fetch)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfstests-2023.10.29-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 424 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 582 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_packagedata_setscene)
NOTE: recipe xfsprogs-6.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libinih-57-r0: task do_packagedata_setscene: Started
NOTE: recipe libinih-57-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libinih-57-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinih-57-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 675 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/inih/libinih_57.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinih-57-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1070 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_fetch)
NOTE: recipe xfstests-2023.10.29-r0: task do_unpack: Succeeded
NOTE: Running task 1071 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libinih-57-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xfstests-2023.10.29-r0: task do_patch: Started
NOTE: Running task 1087 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_unpack)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_unpack: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_populate_lic)
NOTE: recipe xfstests-2023.10.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_populate_lic: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_populate_lic unihash changed to 45280a0387246f87e9c9d561d66bc70ab1eafe12bb18698070733dc084ff5ed9
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_deploy_source_date_epoch unihash changed to dcf3d9b69026f77f8a7a8cf50395f87795c1bfc2778554e2b7c58207eb343365
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 796 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1893 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_packagedata)
NOTE: Running task 1932 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2065 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_collect_spdx_deps)
NOTE: recipe xfsprogs-6.1.1-r0: task do_packagedata: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2158 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_create_spdx)
NOTE: Running task 2159 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_package_write_ipk)
NOTE: Running task 2160 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_package_write_deb)
NOTE: Running task 2161 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb:do_package_write_rpm)
NOTE: recipe xfsprogs-6.1.1-r0: task do_create_spdx: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2162 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_configure)
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_write_deb: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_configure: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2163 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_collect_spdx_deps)
NOTE: recipe xfstests-2023.10.29-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfstests-2023.10.29-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xfstests-2023.10.29-r0: task do_configure: Succeeded
NOTE: Running task 2164 of 2175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_compile)
NOTE: recipe xfstests-2023.10.29-r0: task do_compile: Started
NOTE: recipe xfsprogs-6.1.1-r0: task do_package_write_deb: Succeeded
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-musl', 'x86_64-linux', 'bit-64', 'x86_64-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| Building include
| Building tests
| Building lib
|     [LTDEP]
| Building btrfs
| Building ceph
| Building cifs
| Building ext4
| Building f2fs
| Building generic
| Building nfs
| Building ocfs2
| Building overlay
| Building perf
| Building selftest
| Building shared
| Building udf
| Building xfs
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/ceph/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/ext4/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/cifs/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/btrfs/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/f2fs/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/nfs/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/ocfs2/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/generic/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/perf/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/overlay/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/selftest/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/shared/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/udf/group.list
|  [GROUP] /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/git/tests/xfs/group.list
|     [CC] dataascii.lo
|     [CC] databin.lo
|     [CC] datapid.lo
|     [CC] file_lock.lo
|     [CC] forker.lo
|     [CC] pattern.lo
|     [CC] open_flags.lo
|     [CC] random_range.lo
|     [CC] string_to_tokens.lo
|     [CC] str_to_bytes.lo
|     [CC] tlibio.lo
|     [CC] write_log.lo
|     [CC] random.lo
|     [LD]
| Building ltp
| Building src
| Building m4
| Building common
|     [DEP]
|     [DEP]
|     [CC]    doio
|     [CC]    fsstress
|     [CC]    fsx
|     [CC]    growfiles
|     [CC]    iogen
| fsx.c:2584:1: warning: return type defaults to 'int' [-Wimplicit-int]
|  2584 | aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
|       | ^~~~~~
|     [DEP]
|     [DEP]
|     [DEP]
|     [CC]    dirstress
|     [CC]    fill
|     [CC]    fill2
|     [CC]    getpagesize
|     [CC]    holes
|     [CC]    lstat64
|     [CC]    nametest
|     [CC]    permname
|     [CC]    randholes
|     [CC]    runas
|     [CC]    truncfile
|     [CC]    usemem
|     [CC]    mmapcat
|     [CC]    append_reader
|     [CC]    append_writer
|     [CC]    dirperf
|     [CC]    metaperf
|     [CC]    devzero
|     [CC]    feature
|     [CC]    alloc
|     [CC]    fault
|     [CC]    fstest
|     [CC]    t_access_root
|     [CC]    godown
|     [CC]    resvtest
|     [CC]    writemod
|     [CC]    writev_on_pagefault
|     [CC]    makeextents
|     [CC]    itrash
|     [CC]    rename
|     [CC]    multi_open_unlink
|     [CC]    unwritten_sync
|     [CC]    genhashnames
|     [CC]    t_holes
|     [CC]    t_mmap_writev
|     [CC]    t_truncate_cmtime
|     [CC]    dirhash_collide
|     [CC]    t_rename_overwrite
|     [CC]    holetest
|     [CC]    t_truncate_self
|     [CC]    af_unix
|     [CC]    t_mmap_stale_pmd
|     [CC]    t_mmap_cow_race
|     [CC]    t_mmap_fallocate
|     [CC]    fsync-err
|     [CC]    t_mmap_write_ro
|     [CC]    t_ext4_dax_journal_corruption
|     [CC]    t_ext4_dax_inline_corruption
|     [CC]    t_ofd_locks
|     [CC]    t_mmap_collision
|     [CC]    mmap-write-concurrent
|     [CC]    t_get_file_time
|     [CC]    t_create_short_dirs
|     [CC]    t_create_long_dirs
|     [CC]    t_enospc
|     [CC]    t_mmap_writev_overlap
|     [CC]    checkpoint_journal
|     [CC]    mmap-rw-fault
|     [CC]    allocstale
|     [CC]    t_mmap_cow_memory_failure
|     [CC]    fake-dump-rootino
|     [CC]    dio-buf-fault
|     [CC]    xfsctl
|     [CC]    bstat
|     [CC]    t_mtab
|     [CC]    getdevicesize
|     [CC]    preallo_rw_pattern_reader
|     [CC]    preallo_rw_pattern_writer
|     [CC]    ftrunc
|     [CC]    trunc
| fake-dump-rootino.c:3: warning: "_LARGEFILE64_SOURCE" redefined
|     3 | #define _LARGEFILE64_SOURCE
|       |
| <command-line>: note: this is the location of the previous definition
|     [CC]    fs_perms
|     [CC]    testx
|     [CC]    looptest
|     [CC]    locktest
|     [CC]    unwritten_mmap
|     [CC]    bulkstat_unlink_test
|     [CC]    deduperace
|     [CC]    bulkstat_unlink_test_modified
|     [CC]    t_dir_offset
|     [CC]    t_futimens
|     [CC]    t_immutable
|     [CC]    stale_handle
|     [CC]    pwrite_mmap_blocked
|     [CC]    t_dir_offset2
|     [CC]    seek_sanity_test
| locktest.c: In function 'main':
| locktest.c:1155:39: warning: passing argument 2 of 'getsockname' from incompatible pointer type [-Wincompatible-pointer-types]
|  1155 |                 if (getsockname(s_fd, &myAddr, &addr_len)) {
|       |                                       ^~~~~~~
|       |                                       |
|       |                                       struct sockaddr_in *
| In file included from locktest.c:19:
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/recipe-sysroot/usr/include/sys/socket.h:391:23: note: expected 'struct sockaddr * restrict' but argument is of type 'struct sockaddr_in *'
|   391 | int getsockname (int, struct sockaddr *__restrict, socklen_t *__restrict);
|       |                       ^
|     [CC]    seek_copy_test
|     [CC]    t_readdir_1
|     [CC]    t_readdir_2
|     [CC]    fsync-tester
|     [CC]    nsexec
|     [CC]    cloner
|     [CC]    renameat2
|     [CC]    t_getcwd
|     [CC]    e4compact
|     [CC]    test-nextquota
|     [CC]    punch-alternating
|     [CC]    attr-list-by-handle-cursor-test
|     [CC]    listxattr
|     [CC]    dio-interleaved
|     [CC]    t_dir_type
|     [CC]    dio-invalidate-cache
|     [CC]    stat_test
|     [CC]    t_encrypted_d_revalidate
|     [CC]    attr_replace_test
|     [CC]    swapon
|     [CC]    mkswap
|     [CC]    t_attr_corruption
|     [CC]    t_open_tmpfiles
|     [CC]    fscrypt-crypt-util
|     [CC]    bulkstat_null_ocount
|     [CC]    splice-test
|     [CC]    chprojid_fail
|     [CC]    ext4_resize
|     [CC]    t_readdir_3
|     [CC]    splice2pipe
|     [CC]    uuid_ioctl
|     [CC]    fiemap-tester
|     [CC]    t_stripealign
|     [CC]    open_by_handle
|     [CC]    xfsfind
|     [CC]    fssum
| Building log-writes
| t_readdir_3.c:1: warning: "_LARGEFILE64_SOURCE" redefined
|     1 | #define _LARGEFILE64_SOURCE
|       |
| <command-line>: note: this is the location of the previous definition
|     [CC]    replay-log
| Building perf
| Building vfs
|     [CC]    vfstest
|     [CC]    mount-idmapped
| fssum.c:8: warning: "_LARGEFILE64_SOURCE" redefined
|     8 | #define _LARGEFILE64_SOURCE
|       |
| <command-line>: note: this is the location of the previous definition
| xfsfind.c: In function 'visit':
| xfsfind.c:138:42: error: 'FTW_CONTINUE' undeclared (first use in this function); did you mean 'WCONTINUED'?
|   138 |         int                     retval = FTW_CONTINUE;
|       |                                          ^~~~~~~~~~~~
|       |                                          WCONTINUED
| xfsfind.c:138:42: note: each undeclared identifier is reported only once for each function it appears in
| xfsfind.c:166:32: error: 'FTW_STOP' undeclared (first use in this function)
|   166 |                         return FTW_STOP;
|       |                                ^~~~~~~~
| xfsfind.c: In function 'main':
| xfsfind.c:279:33: error: 'FTW_ACTIONRETVAL' undeclared (first use in this function)
|   279 |                                 FTW_ACTIONRETVAL | FTW_CHDIR | FTW_MOUNT |
|       |                                 ^~~~~~~~~~~~~~~~
| make[2]: *** [Makefile:111: xfsfind] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [include/buildrules:30: src] Error 2
| make: *** [Makefile:51: default] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092, line 195
NOTE: recipe xfstests-2023.10.29-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2164 tasks of which 2147 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104073854.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104073854.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_compile
Summary: There were 14 ERROR messages, returning a non-zero exit code.
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-src went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-dbg went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-fsck went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-mkfs went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-repair went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libhandle went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-staticdev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-dev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-doc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs-locale went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package xfsprogs went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.1.1-r0) [version-going-backwards]
ERROR: xfsprogs-6.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xfstests-2023.10.29-r0 do_compile: oe_runmake failed
ERROR: xfstests-2023.10.29-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/run.do_compile.2947092', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/xfstests/2023.10.29/temp/log.do_compile.2947092
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb:do_compile) failed with exit code '1'

--===============4327821350367033618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfstests-upgrade-2023.03.05-2023.10.29.patch"

RnJvbSA5OWUzZDI3NDRkN2U0NzZjOTRmNTI5NmQ3ODc0YTAxNDEzYTJjOTcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzozOTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
c3Rlc3RzOiB1cGdyYWRlIDIwMjMuMDMuMDUgLT4gMjAyMy4xMC4yOQoKLS0tCiAuLi4vMDAwMS1B
ZGQtYS1yZXR1cm4tdHlwZS10by1haW9fcncucGF0Y2ggICAgfCAyOCAtLS0tLS0tLS0tLS0tLS0K
IC4uLmZvci1GVFdfQUNUSU9OUkVUVkFMLWFsb25nLXdpdGgtbmZ0dy5wYXRjaCB8IDM0IC0tLS0t
LS0tLS0tLS0tLS0tLS0KIC4uLnVudHNfcHJvcGFnYXRpb24tYW5kLXJlbW92ZS1zeXMtbW91bi5w
YXRjaCB8IDMxICsrKysrLS0tLS0tLS0tLS0tCiAuLi5zXzIwMjMuMDMuMDUuYmIgPT4geGZzdGVz
dHNfMjAyMy4xMC4yOS5iYn0gfCAgNSArKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgODggZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1maWxlc3lzdGVt
cy9yZWNpcGVzLXV0aWxzL3hmc3Rlc3RzL3hmc3Rlc3RzLzAwMDEtQWRkLWEtcmV0dXJuLXR5cGUt
dG8tYWlvX3J3LnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1maWxlc3lzdGVtcy9yZWNp
cGVzLXV0aWxzL3hmc3Rlc3RzL3hmc3Rlc3RzLzAwMDEtbTQtQ2hlY2stZm9yLUZUV19BQ1RJT05S
RVRWQUwtYWxvbmctd2l0aC1uZnR3LnBhdGNoCiByZW5hbWUgbWV0YS1maWxlc3lzdGVtcy9yZWNp
cGVzLXV0aWxzL3hmc3Rlc3RzL3t4ZnN0ZXN0c18yMDIzLjAzLjA1LmJiID0+IHhmc3Rlc3RzXzIw
MjMuMTAuMjkuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVz
LXV0aWxzL3hmc3Rlc3RzL3hmc3Rlc3RzLzAwMDEtQWRkLWEtcmV0dXJuLXR5cGUtdG8tYWlvX3J3
LnBhdGNoIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3hmc3Rlc3RzL3hmc3Rlc3Rz
LzAwMDEtQWRkLWEtcmV0dXJuLXR5cGUtdG8tYWlvX3J3LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCBlMGEwNGM5MDcuLjAwMDAwMDAwMAotLS0gYS9tZXRhLWZpbGVzeXN0ZW1z
L3JlY2lwZXMtdXRpbHMveGZzdGVzdHMveGZzdGVzdHMvMDAwMS1BZGQtYS1yZXR1cm4tdHlwZS10
by1haW9fcncucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyOCArMCwwIEBACi1Gcm9tIGYxNzJl
YTAwNGQzNGIwMGFhN2JkNWJhZmY5NDIyYjJhYjgwZGY2ZTcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogU3VuLCAxNCBB
dWcgMjAyMiAxMzozMjoxMCAtMDcwMAotU3ViamVjdDogW1BBVENIIDEvMl0gQWRkIGEgcmV0dXJu
IHR5cGUgdG8gYWlvX3J3Ci0KLUNvbXBpbGVycyBjb21wbGFpbiBhYm91dCB0aGUgZnVuY3Rpb24g
cHJvdG90eXBlIG90aGVyd2lzZQotCi1VcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLVNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBsdHAvZnN4LmMgfCAx
ICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL2x0cC9m
c3guYyBiL2x0cC9mc3guYwotaW5kZXggMTJjMmNjMzMuLjU1YjRlOWI2IDEwMDY0NAotLS0tIGEv
bHRwL2ZzeC5jCi0rKysgYi9sdHAvZnN4LmMKLUBAIC0yNDI5LDYgKzI0MjksNyBAQCBvdXRfZXJy
b3I6Ci0gCXJldHVybiAtMTsKLSB9Ci0gI2Vsc2UKLStpbnQKLSBhaW9fcncoaW50IHJ3LCBpbnQg
ZmQsIGNoYXIgKmJ1ZiwgdW5zaWduZWQgbGVuLCB1bnNpZ25lZCBvZmZzZXQpCi0gewotIAlmcHJp
bnRmKHN0ZGVyciwgImlvX3J3OiBuZWVkIEFJTyBzdXBwb3J0IVxuIik7Ci0tLSAKLTIuMzcuMgot
CmRpZmYgLS1naXQgYS9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtdXRpbHMveGZzdGVzdHMveGZz
dGVzdHMvMDAwMS1tNC1DaGVjay1mb3ItRlRXX0FDVElPTlJFVFZBTC1hbG9uZy13aXRoLW5mdHcu
cGF0Y2ggYi9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtdXRpbHMveGZzdGVzdHMveGZzdGVzdHMv
MDAwMS1tNC1DaGVjay1mb3ItRlRXX0FDVElPTlJFVFZBTC1hbG9uZy13aXRoLW5mdHcucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGZkMzQ5ODlmZC4uMDAwMDAwMDAwCi0tLSBh
L21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy11dGlscy94ZnN0ZXN0cy94ZnN0ZXN0cy8wMDAxLW00
LUNoZWNrLWZvci1GVFdfQUNUSU9OUkVUVkFMLWFsb25nLXdpdGgtbmZ0dy5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDM0ICswLDAgQEAKLUZyb20gMmE0ZmVkODMzMWY5OTY0MjFlNjVkYjQ0NjU1
OTk5MWE4NTRlMmFkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBGcmksIDI0IE1hciAyMDIzIDE4OjIzOjAxIC0wNzAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIG00OiBDaGVjayBmb3IgRlRXX0FDVElPTlJFVFZBTCBhbG9uZyB3
aXRoIG5mdHcKLQotRlRXX0FDVElPTlJFVFZBTCBpcyBnbGliYyBzcGVjaWZpYyBleHRlbnRpb24g
d2hpY2ggaXMgdXNlZCB0byBpbXBsZW1lbnQKLXhmc2ZpbmQgYnV0IGl0IG1heSBub3QgYmUgYXZh
aWxhYmxlIG9uIG90aGVyIEMgbGlicmFyeSBpbXBsZW1lbnRhdGlvbnMgb24gTGludXgKLWUuZy4g
bXVzbC4gVGhlcmVmb3JlIGVuc3VyZSB0aGF0IHRoZXNlIGRlZmluZXMgYXJlIGF2YWlsYWJsZSBi
ZWZvcmUgZGVjbGFyaW5nCi1uZnR3KCkgdG8gYmUgdXNhYmxlCi0KLVVwc3RyZWFtLVN0YXR1czog
U3VibWl0dGVkIFtodHRwczovL2xvcmUua2VybmVsLm9yZy9mc3Rlc3RzLzIwMjMwMzI1MDEyODU4
LjU4NzgwMS0xLXJhai5raGVtQGdtYWlsLmNvbS9ULyN1XQotU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KLUNjOiBEYXJyaWNrIEouIFdvbmcgPGRqd29uZ0BrZXJu
ZWwub3JnPgotQ2M6IFpvcnJvIExhbmcgPHpsYW5nQHJlZGhhdC5jb20+Ci0tLS0KLSBtNC9wYWNr
YWdlX2xpYmNkZXYubTQgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9tNC9wYWNrYWdlX2xpYmNkZXYubTQgYi9tNC9w
YWNrYWdlX2xpYmNkZXYubTQKLWluZGV4IGI0MWMwODdiLi43ZjczMTA0NCAxMDA2NDQKLS0tLSBh
L200L3BhY2thZ2VfbGliY2Rldi5tNAotKysrIGIvbTQvcGFja2FnZV9saWJjZGV2Lm00Ci1AQCAt
MTMyLDcgKzEzMiw3IEBAIEFDX0RFRlVOKFtBQ19IQVZFX05GVFddLAotICNpbmNsdWRlIDxzdGRk
ZWYuaD4KLSAjaW5jbHVkZSA8ZnR3Lmg+Ci0gICAgIF1dLCBbWwotLSAgICAgICAgIG5mdHcoIi8i
LCAoaW50ICgqKShjb25zdCBjaGFyICosIGNvbnN0IHN0cnVjdCBzdGF0ICosIGludCwgc3RydWN0
IEZUVyAqKSkxLCAwLCAwKTsKLSsgICAgICAgICBuZnR3KCIvIiwgKGludCAoKikoY29uc3QgY2hh
ciAqLCBjb25zdCBzdHJ1Y3Qgc3RhdCAqLCBpbnQsIHN0cnVjdCBGVFcgKikpMSwgMCwgRlRXX0FD
VElPTlJFVFZBTCk7Ci0gICAgIF1dKV0sW2hhdmVfbmZ0dz15ZXMKLSAgICAgICAgQUNfTVNHX1JF
U1VMVCh5ZXMpXSxbQUNfTVNHX1JFU1VMVChubyldKQotICAgICBBQ19TVUJTVChoYXZlX25mdHcp
Ci0tLSAKLTIuNDAuMAotCmRpZmYgLS1naXQgYS9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtdXRp
bHMveGZzdGVzdHMveGZzdGVzdHMvMDAwMi1Ecm9wLWRldGFjaGVkX21vdW50c19wcm9wYWdhdGlv
bi1hbmQtcmVtb3ZlLXN5cy1tb3VuLnBhdGNoIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0
aWxzL3hmc3Rlc3RzL3hmc3Rlc3RzLzAwMDItRHJvcC1kZXRhY2hlZF9tb3VudHNfcHJvcGFnYXRp
b24tYW5kLXJlbW92ZS1zeXMtbW91bi5wYXRjaAppbmRleCBhNTk0YjczYTEuLjg1NmZkMjcwZiAx
MDA2NDQKLS0tIGEvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3hmc3Rlc3RzL3hmc3Rl
c3RzLzAwMDItRHJvcC1kZXRhY2hlZF9tb3VudHNfcHJvcGFnYXRpb24tYW5kLXJlbW92ZS1zeXMt
bW91bi5wYXRjaAorKysgYi9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtdXRpbHMveGZzdGVzdHMv
eGZzdGVzdHMvMDAwMi1Ecm9wLWRldGFjaGVkX21vdW50c19wcm9wYWdhdGlvbi1hbmQtcmVtb3Zl
LXN5cy1tb3VuLnBhdGNoCkBAIC0xLDggKzEsOCBAQAotRnJvbSBkZDQzY2JjN2Y1MDI2NmNkYzYy
MTBmMmI5MjBkN2Y2NDhhODNiZGQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1NTlm
Njg1ZjgzZDEyZDExYmY5ZWM2YzZjZTkyNGVlNGQwNzAyYTJhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTQg
QXVnIDIwMjIgMTM6MzM6MDUgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCAyLzJdIERyb3AgZGV0YWNo
ZWRfbW91bnRzX3Byb3BhZ2F0aW9uIGFuZCByZW1vdmUgc3lzL21vdW50LmgKLSBmcm9tIHZmcy91
dGlscy5jCitTdWJqZWN0OiBbUEFUQ0hdIERyb3AgZGV0YWNoZWRfbW91bnRzX3Byb3BhZ2F0aW9u
IGFuZCByZW1vdmUgc3lzL21vdW50LmggZnJvbQorIHZmcy91dGlscy5jCiAKIHdpdGggZ2xpYmMg
Mi4zNisgc3lzL21vdW50LmggY29uZmxpY3RzIHdpdGggbGludXgvbW91bnQuaCBhbmQgaGVyZQog
bGludXgvbW91bnQuaCBpcyBpbmNsdWRlZCB2aWEgeGZzL3hmcy5oIGhlYWRlciBhbmQgd2UgbmVl
ZCBzeXMvbW91bnQuaApAQCAtMTIsMTYgKzEyLDE2IEBAIHRlc3RjYXNlCiBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW0xpYmMgc3BlY2lmaWMgV29ya2Fyb3VuZF0KIAogU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCi0gc3JjL01ha2VmaWxl
ICAgIHwgMiArLQotIHNyYy92ZnMvdXRpbHMuYyB8IDEgLQotIDIgZmlsZXMgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCisgc3JjL01ha2VmaWxlIHwgMiArLQorIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL01ha2VmaWxlIGIvc3JjL01ha2VmaWxlCi1pbmRleCA2NjVlZGNmOS4uN2RlYmNiYmQgMTAw
NjQ0CitpbmRleCAyODE1ZjkxOS4uNDQ4ZmNjYzkgMTAwNjQ0CiAtLS0gYS9zcmMvTWFrZWZpbGUK
ICsrKyBiL3NyYy9NYWtlZmlsZQotQEAgLTMxLDcgKzMxLDcgQEAgTElOVVhfVEFSR0VUUyA9IHhm
c2N0bCBic3RhdCB0X210YWIgZ2V0ZGV2aWNlc2l6ZSBwcmVhbGxvX3J3X3BhdHRlcm5fcmVhZGVy
IFwKK0BAIC0zMiw3ICszMiw3IEBAIExJTlVYX1RBUkdFVFMgPSB4ZnNjdGwgYnN0YXQgdF9tdGFi
IGdldGRldmljZXNpemUgcHJlYWxsb19yd19wYXR0ZXJuX3JlYWRlciBcCiAgCWRpby1pbnZhbGlk
YXRlLWNhY2hlIHN0YXRfdGVzdCB0X2VuY3J5cHRlZF9kX3JldmFsaWRhdGUgXAogIAlhdHRyX3Jl
cGxhY2VfdGVzdCBzd2Fwb24gbWtzd2FwIHRfYXR0cl9jb3JydXB0aW9uIHRfb3Blbl90bXBmaWxl
cyBcCiAgCWZzY3J5cHQtY3J5cHQtdXRpbCBidWxrc3RhdF9udWxsX29jb3VudCBzcGxpY2UtdGVz
dCBjaHByb2ppZF9mYWlsIFwKQEAgLTMwLDE4ICszMCwzIEBAIGluZGV4IDY2NWVkY2Y5Li43ZGVi
Y2JiZCAxMDA2NDQKICAJdXVpZF9pb2N0bAogIAogIEVYVFJBX0VYRUNTID0gZG1lcnJvciBmaWxs
MmF0dHIgZmlsbDJmcyBmaWxsMmZzX2NoZWNrIHNjYWxlcmVhZC5zaCBcCi1kaWZmIC0tZ2l0IGEv
c3JjL3Zmcy91dGlscy5jIGIvc3JjL3Zmcy91dGlscy5jCi1pbmRleCAxMzg4ZWRkYS4uYWFjZDZj
MGEgMTAwNjQ0Ci0tLS0gYS9zcmMvdmZzL3V0aWxzLmMKLSsrKyBiL3NyYy92ZnMvdXRpbHMuYwot
QEAgLTEwLDcgKzEwLDYgQEAKLSAjaW5jbHVkZSA8c3RkbGliLmg+Ci0gI2luY2x1ZGUgPHN5cy9l
dmVudGZkLmg+Ci0gI2luY2x1ZGUgPHN5cy9mc3VpZC5oPgotLSNpbmNsdWRlIDxzeXMvbW91bnQu
aD4KLSAjaW5jbHVkZSA8c3lzL3ByY3RsLmg+Ci0gI2luY2x1ZGUgPHN5cy9zb2NrZXQuaD4KLSAj
aW5jbHVkZSA8c3lzL3N0YXQuaD4KLS0tIAotMi4zNy4yCi0KZGlmZiAtLWdpdCBhL21ldGEtZmls
ZXN5c3RlbXMvcmVjaXBlcy11dGlscy94ZnN0ZXN0cy94ZnN0ZXN0c18yMDIzLjAzLjA1LmJiIGIv
bWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3hmc3Rlc3RzL3hmc3Rlc3RzXzIwMjMuMTAu
MjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS1maWxlc3lzdGVtcy9y
ZWNpcGVzLXV0aWxzL3hmc3Rlc3RzL3hmc3Rlc3RzXzIwMjMuMDMuMDUuYmIKcmVuYW1lIHRvIG1l
dGEtZmlsZXN5c3RlbXMvcmVjaXBlcy11dGlscy94ZnN0ZXN0cy94ZnN0ZXN0c18yMDIzLjEwLjI5
LmJiCmluZGV4IGNmYjZlNGZkOC4uNzk3NzVmY2I3IDEwMDY0NAotLS0gYS9tZXRhLWZpbGVzeXN0
ZW1zL3JlY2lwZXMtdXRpbHMveGZzdGVzdHMveGZzdGVzdHNfMjAyMy4wMy4wNS5iYgorKysgYi9t
ZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtdXRpbHMveGZzdGVzdHMveGZzdGVzdHNfMjAyMy4xMC4y
OS5iYgpAQCAtMiwxMyArMiwxMiBAQCBTVU1NQVJZID0gIkZpbGUgc3lzdGVtIFFBIHRlc3Qgc3Vp
dGUiCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0VTL0dQTC0yLjA7bWQ1PTc0Mjc0ZThhMjE4NDIzZTQ5ZWVmZGVhODBiYzU1MDM4Igog
CitTUkNSRVYgPSAiMTE5MTQ2MTQ3ODQ3MzVjNTA0ZjQzYjViNmJhYWJhYTcxMzM3NTk4NCIKIFNS
Q1JFVl9GT1JNQVQgPSAieGZzdGVzdHNfdW5pb25tb3VudCIKIAotU1JDX1VSSSA9ICJnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2ZzL3hmcy94ZnN0ZXN0cy1kZXYuZ2l0O2JyYW5jaD1tYXN0
ZXI7bmFtZT14ZnN0ZXN0cyBcCitTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vZnMveGZzL3hmc3Rlc3RzLWRldi5naXQ7YnJhbmNoPWZvci1uZXh0O25hbWU9eGZzdGVzdHMg
XAogICAgICAgICAgICBnaXQ6Ly9naXRodWIuY29tL2FtaXI3M2lsL3VuaW9ubW91bnQtdGVzdHN1
aXRlLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO25hbWU9dW5pb25tb3VudDtkZXN0
c3VmZml4PXVuaW9ubW91bnQtdGVzdHN1aXRlIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtQWRk
LWEtcmV0dXJuLXR5cGUtdG8tYWlvX3J3LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
RHJvcC1kZXRhY2hlZF9tb3VudHNfcHJvcGFnYXRpb24tYW5kLXJlbW92ZS1zeXMtbW91bi5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW00LUNoZWNrLWZvci1GVFdfQUNUSU9OUkVUVkFM
LWFsb25nLXdpdGgtbmZ0dy5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDUkVWX3hmc3Rlc3Rz
ID0gImY3NzY1Nzc0YTFiNWNiOThjMmYyMWE4OTJlODJiMzQyMWY0MGU3OTEiCi0tIAoyLjM5LjIK
Cg==

--===============4327821350367033618==--

