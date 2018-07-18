Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 656E1784B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I7Vaqt001617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:22 +0800
Message-ID: <1531899089-395618-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] multipath-tools: upgrade 0.7.1 -> 0.7.7
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:35 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

1. Backport patches from fedora:
   git://pkgs.fedoraproject.org/rpms/device-mapper-multipath
    - 0001 ~ 0028

2. drop obsolute patch and rebase still needed patch
   rebased patch: 0029~0031

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...0001-kpartx-include-limits.h-for-PATH_MAX.patch |   29 -
 ...ltipath-attempt-at-common-multipath.rules.patch |  107 --
 ...ools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch |   42 +
 .../0002-RH-fixup-udev-rules-for-redhat.patch      |  110 --
 ...ools-remove-c-from-__cpluscplus-misspelle.patch |   33 +
 ...ools-remove-emacs-autoconfig-of-kpartx-gp.patch |   43 +
 ...ools-replace-FSF-address-with-a-www-point.patch |  191 ++++
 ...ools-Remove-trailing-leading-whitespaces-.patch |  156 +++
 ...path-tools-fix-compilation-with-musl-libc.patch |   58 ++
 ...gger-change-uevent-on-new-device-creation.patch |  138 ---
 ...ools-add-x-to-doc-preclean.pl-and-split-m.patch |   27 +
 ...ipath-change-how-RADOS-checker-is-enabled.patch |   56 -
 ...ools-refresh-kernel-doc-from-kernel-sourc.patch |  784 ++++++++++++++
 ...th-set-verbosity-to-default-during-config.patch |   40 -
 ...ools-configure-hitachi-ams2000-and-hus100.patch |   56 +
 ...ath-don-t-reject-maps-with-undefined-prio.patch |   42 +
 ...kip-device-configs-without-vendor-product.patch |   37 -
 .../0011-multipathd-fix-show-maps-json-crash.patch |   38 -
 ...ltipathd-handle-errors-in-uxlsnr-as-fatal.patch |   57 +
 ...h-fix-error-parsing-find_multipaths-stric.patch |   36 +
 ...ools-modify-Makefile.inc-for-cross-compil.patch |   58 --
 ...h-print-correct-default-for-delay_-_check.patch |   40 +
 ...onf.5-clarify-property-whitelist-handling.patch |   31 +
 .../0015-mpathpersist-add-all_tg_pt-option.patch   |  317 ++++++
 .../files/0016-libmultipath-remove-rbd-code.patch  | 1093 ++++++++++++++++++++
 .../0017-mpathpersist-fix-aptpl-support.patch      |  543 ++++++++++
 ...ath-don-t-check-timestamps-without-a-path.patch |   34 +
 ...-libmultipath-fix-detect-alua-corner-case.patch |   35 +
 .../0020-multipath-fix-setting-conf-version.patch  |   39 +
 .../0021-RH-fixup-udev-rules-for-redhat.patch      |   82 ++
 ...the-property-blacklist-exception-builtin.patch} |   31 +-
 ...023-RH-don-t-start-without-a-config-file.patch} |   40 +-
 .../0024-RH-use-rpm-optflags-if-present.patch      |   52 +
 ...mpathconf.patch => 0025-RH-add-mpathconf.patch} |   20 +-
 ...s-from-kernel-cmdline-mpath.wwids-with-A.patch} |   55 +-
 ...-warn-on-invalid-regex-instead-of-failing.patch |  121 +++
 ...reset-default-find_mutipaths-value-to-off.patch |   29 +
 ...ools-modify-Makefile.inc-for-cross-compil.patch |   49 +
 ...apper.patch => 0030-Always-use-devmapper.patch} |   16 +-
 ... => 0031-Always-use-devmapper-for-kpartx.patch} |   15 +-
 ...ath-tools_0.7.1.bb => multipath-tools_0.7.7.bb} |   49 +-
 41 files changed, 4123 insertions(+), 706 deletions(-)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0002-multipath-tools-remove-c-from-__cpluscplus-misspelle.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0003-multipath-tools-remove-emacs-autoconfig-of-kpartx-gp.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0004-multipath-tools-replace-FSF-address-with-a-www-point.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0005-multipath-tools-Remove-trailing-leading-whitespaces-.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0006-multipath-tools-fix-compilation-with-musl-libc.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0007-multipath-tools-add-x-to-doc-preclean.pl-and-split-m.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0008-multipath-tools-refresh-kernel-doc-from-kernel-sourc.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-configure-hitachi-ams2000-and-hus100.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0010-libmultipath-don-t-reject-maps-with-undefined-prio.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0011-multipathd-handle-errors-in-uxlsnr-as-fatal.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0012-libmultipath-fix-error-parsing-find_multipaths-stric.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0013-libmultipath-print-correct-default-for-delay_-_check.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0014-multipath.conf.5-clarify-property-whitelist-handling.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0015-mpathpersist-add-all_tg_pt-option.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0016-libmultipath-remove-rbd-code.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0017-mpathpersist-fix-aptpl-support.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0018-multipath-don-t-check-timestamps-without-a-path.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0019-libmultipath-fix-detect-alua-corner-case.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0020-multipath-fix-setting-conf-version.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0003-RH-Remove-the-property-blacklist-exception-builtin.patch => 0022-RH-Remove-the-property-blacklist-exception-builtin.patch} (59%)
 rename meta-oe/recipes-support/multipath-tools/files/{0004-RH-don-t-start-without-a-config-file.patch => 0023-RH-don-t-start-without-a-config-file.patch} (77%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0005-RH-add-mpathconf.patch => 0025-RH-add-mpathconf.patch} (97%)
 rename meta-oe/recipes-support/multipath-tools/files/{0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch => 0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch} (76%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0013-Always-use-devmapper.patch => 0030-Always-use-devmapper.patch} (81%)
 rename meta-oe/recipes-support/multipath-tools/files/{0014-Always-use-devmapper-for-kpartx.patch => 0031-Always-use-devmapper-for-kpartx.patch} (73%)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.7.1.bb => multipath-tools_0.7.7.bb} (60%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index 46dd8e2..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 330028a5a904a0da3788141030e614569dc5aaa7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 23:28:12 -0700
-Subject: [PATCH] kpartx: include limits.h for PATH_MAX
-
-lopart.c:76:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'INT8_MAX'?
-  char path[PATH_MAX];
-            ^~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kpartx/lopart.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kpartx/lopart.c b/kpartx/lopart.c
-index 7005445..5efe5dc 100644
---- a/kpartx/lopart.c
-+++ b/kpartx/lopart.c
-@@ -22,6 +22,7 @@
- #include <errno.h>
- #include <stdlib.h>
- #include <unistd.h>
-+#include <limits.h>
- #include <sys/ioctl.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch
deleted file mode 100644
index acb4269..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 5ab50e0cb888e553a2635bbbf81eea3cdeffee60 Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Wed, 12 Apr 2017 09:07:51 -0500
-Subject: [PATCH 01/14] multipath: attempt at common multipath.rules
-
-This is a proposal to try and bring the Redhat and SuSE multipath.rules
-closer. There are a couple of changes that I'd like some input on.
-
-The big change is moving the kpartx call into the multipath rules.  Half
-of the current kpartx.rules file is about creating symlinks for multiple
-types of dm devices. The other half auto-creates kpartx devices on top
-of multipath devices. Since it is only creating kpartx devices on top of
-multipath devices, I've moved the these rules into multipath.rules, or
-rather, I've replaced them with the redhat rules in multipath.rules. The
-biggest difference is the kpartx isn't run on every reload.  It works
-with the 11-dm-mpath.rules code to not run kpartx on multipathd
-generated reloads or when there aren't any working paths. It does
-remember if it didn't get to run kpartx when it was supposed to (because
-there were no valid paths or the device was suspended) and will make
-sure to run it on the next possible uevent.
-
-The other change is the redhat multipath rules remove the partition
-device nodes for devices claimed by multipath. The udev rule will only
-do this one time (both to keep from running partx on every event, and so
-that if users manually reread the partition table, we don't keep
-removing them when clearly they are wanted). Redhat does this because we
-had multiple customer issues where they were using the scsi partitions
-instead of the kpartx devices. Obviously, with setting the partition
-devices to not ready and clearing their fs_type, this isn't essential,
-but it has helped make customers do the right thing.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- kpartx/kpartx.rules       |  8 --------
- multipath/multipath.rules | 27 ++++++++++++++++++++++++---
- 2 files changed, 24 insertions(+), 11 deletions(-)
-
-diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
-index a958791..906e320 100644
---- a/kpartx/kpartx.rules
-+++ b/kpartx/kpartx.rules
-@@ -34,12 +34,4 @@ ENV{ID_FS_LABEL_ENC}=="?*", IMPORT{db}="ID_FS_LABEL_ENC"
- ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", \
- 	SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
- 
--# Create dm tables for partitions
--ENV{DM_ACTION}=="PATH_FAILED|PATH_REINSTATED", GOTO="kpartx_end"
--ENV{DM_NR_VALID_PATHS}=="0", GOTO="kpartx_end"
--ENV{ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
--ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="kpartx_end"
--ENV{DM_STATE}!="SUSPENDED", ENV{DM_UUID}=="mpath-*", \
--	RUN+="/sbin/kpartx -un -p -part /dev/$name"
--
- LABEL="kpartx_end"
-diff --git a/multipath/multipath.rules b/multipath/multipath.rules
-index 86defc0..616a04c 100644
---- a/multipath/multipath.rules
-+++ b/multipath/multipath.rules
-@@ -1,13 +1,13 @@
- # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipath
- SUBSYSTEM!="block", GOTO="end_mpath"
- ACTION!="add|change", GOTO="end_mpath"
--KERNEL!="sd*|dasd*", GOTO="end_mpath"
--
-+KERNEL!="sd*|dasd*|rbd*|dm-*", GOTO="end_mpath"
- IMPORT{cmdline}="nompath"
- ENV{nompath}=="?*", GOTO="end_mpath"
- IMPORT{cmdline}="multipath"
- ENV{multipath}=="off", GOTO="end_mpath"
- 
-+KERNEL=="dm-*", GOTO="check_kpartx"
- ENV{DEVTYPE}!="partition", GOTO="test_dev"
- IMPORT{parent}="DM_MULTIPATH_DEVICE_PATH"
- ENV{DM_MULTIPATH_DEVICE_PATH}=="1", ENV{ID_FS_TYPE}="none", \
-@@ -21,7 +21,28 @@ TEST!="$env{MPATH_SBIN_PATH}/multipath", ENV{MPATH_SBIN_PATH}="/usr/sbin"
- 
- ENV{DM_MULTIPATH_DEVICE_PATH}!="1", \
- 	PROGRAM=="$env{MPATH_SBIN_PATH}/multipath -u %k", \
--	ENV{DM_MULTIPATH_DEVICE_PATH}="1", ENV{ID_FS_TYPE}="none", \
-+	ENV{DM_MULTIPATH_DEVICE_PATH}="1", ENV{ID_FS_TYPE}="mpath_member", \
- 	ENV{SYSTEMD_READY}="0"
- 
-+ENV{DM_MULTIPATH_DEVICE_PATH}!="1", GOTO="end_mpath"
-+
-+IMPORT{db}="DM_MULTIPATH_WIPE_PARTS"
-+ENV{DM_MULTIPATH_WIPE_PARTS}!="1", ENV{DM_MULTIPATH_WIPE_PARTS}="1", \
-+	RUN+="/sbin/partx -d --nr 1-1024 $env{DEVNAME}"
-+GOTO="end_mpath"
-+
-+LABEL="check_kpartx"
-+
-+IMPORT{db}="DM_MULTIPATH_NEED_KPARTX"
-+ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
-+ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="end_mpath"
-+ACTION!="change", GOTO="end_mpath"
-+ENV{DM_UUID}!="mpath-?*", GOTO="end_mpath"
-+ENV{DM_ACTIVATION}=="1", ENV{DM_MULTIPATH_NEED_KPARTX}="1"
-+ENV{DM_SUSPENDED}=="1", GOTO="end_mpath"
-+ENV{DM_ACTION}=="PATH_FAILED", GOTO="end_mpath"
-+ENV{DM_ACTIVATION}!="1", ENV{DM_MULTIPATH_NEED_KPARTX}!="1", GOTO="end_mpath"
-+RUN+="/sbin/kpartx -un -p -part /dev/$name"
-+ENV{DM_MULTIPATH_NEED_KPARTX}=""
-+
- LABEL="end_mpath"
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch
new file mode 100644
index 0000000..1d983e9
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Wed, 11 Apr 2018 15:14:13 +0200
+Subject: [PATCH] multipath-tools: add RDAC SUN/ArrayStorage to hwtable
+
+Already in scsi_dh: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/scsi_dh.c#n70
+
+Cc: NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/hwtable.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
+index 88b4700..827e899 100644
+--- a/libmultipath/hwtable.c
++++ b/libmultipath/hwtable.c
+@@ -890,6 +890,18 @@ static struct hwentry default_hw[] = {
+ 		.no_path_retry = 30,
+ 	},
+ 	{
++		.vendor        = "SUN",
++		.product       = "ArrayStorage",
++		.bl_product    = "Universal Xport",
++		.pgpolicy      = GROUP_BY_PRIO,
++		.checker_name  = RDAC,
++		.features      = "2 pg_init_retries 50",
++		.hwhandler     = "1 rdac",
++		.prio_name     = PRIO_RDAC,
++		.pgfailback    = -FAILBACK_IMMEDIATE,
++		.no_path_retry = 30,
++	},
++	{
+ 		/* ZFS Storage Appliances */
+ 		.vendor        = "SUN",
+ 		.product       = "(Sun Storage|ZFS Storage|COMSTAR)",
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch
deleted file mode 100644
index e63d2eb..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 158255383c02d3fb81c82fb9ec6fd36fb234f68e Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Thu, 13 Apr 2017 07:22:23 -0500
-Subject: [PATCH 02/14] RH: fixup udev rules for redhat
-
-The multipath rules need to run after scsi_id is run. This means moving
-them after 60-persistent-storage.rules for redhat. Also, we don't
-currently set up all the symlinks that SuSE does. If we want them, they
-should be done in the device-mapper package, since they are for all
-device-mapper devices. Redhat also uses a different naming scheme for
-partitions than SuSE.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- Makefile.inc              |  2 +-
- kpartx/Makefile           | 14 +++++++-------
- multipath/Makefile        |  4 ++--
- multipath/multipath.rules |  3 ++-
- 4 files changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 1815f9a..2591fa9 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -47,7 +47,7 @@ endif
- 
- prefix		=
- exec_prefix	= $(prefix)
--bindir		= $(exec_prefix)/sbin
-+bindir		= $(exec_prefix)/usr/sbin
- libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
- udevrulesdir	= $(libudevdir)/rules.d
- multipathdir	= $(TOPDIR)/libmultipath
-diff --git a/kpartx/Makefile b/kpartx/Makefile
-index 7b75032..bfa6fe8 100644
---- a/kpartx/Makefile
-+++ b/kpartx/Makefile
-@@ -26,19 +26,19 @@ $(EXEC): $(OBJS)
- install: $(EXEC) $(EXEC).8
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
- 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)
--	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)
--	$(INSTALL_PROGRAM) -m 755 kpartx_id $(DESTDIR)$(libudevdir)
--	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)/rules.d
--	$(INSTALL_PROGRAM) -m 644 kpartx.rules $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
-+#	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)
-+#	$(INSTALL_PROGRAM) -m 755 kpartx_id $(DESTDIR)$(libudevdir)
-+#	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)/rules.d
-+#	$(INSTALL_PROGRAM) -m 644 kpartx.rules $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
- 
- uninstall:
- 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
- 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
--	$(RM) $(DESTDIR)$(libudevdir)/kpartx_id
--	$(RM) $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
--	$(RM) $(DESTDIR)$(libudevdir)/rules.d/67-kpartx-compat.rules
-+#	$(RM) $(DESTDIR)$(libudevdir)/kpartx_id
-+#	$(RM) $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
-+#	$(RM) $(DESTDIR)$(libudevdir)/rules.d/67-kpartx-compat.rules
- 
- clean:
- 	$(RM) core *.o $(EXEC) *.gz
-diff --git a/multipath/Makefile b/multipath/Makefile
-index c85314e..1e9ee4b 100644
---- a/multipath/Makefile
-+++ b/multipath/Makefile
-@@ -24,7 +24,7 @@ install:
- 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
- 	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
--	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
-+	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
-@@ -33,7 +33,7 @@ install:
- uninstall:
- 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
- 	$(RM) $(DESTDIR)$(udevrulesdir)/11-dm-mpath.rules
--	$(RM) $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
-+	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
- 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
- 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
- 
-diff --git a/multipath/multipath.rules b/multipath/multipath.rules
-index 616a04c..4d78b98 100644
---- a/multipath/multipath.rules
-+++ b/multipath/multipath.rules
-@@ -33,6 +33,7 @@ GOTO="end_mpath"
- 
- LABEL="check_kpartx"
- 
-+ENV{DM_UUID}=="mpath-?*|part[0-9]*-mpath-?*", OPTIONS+="link_priority=10"
- IMPORT{db}="DM_MULTIPATH_NEED_KPARTX"
- ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
- ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="end_mpath"
-@@ -42,7 +43,7 @@ ENV{DM_ACTIVATION}=="1", ENV{DM_MULTIPATH_NEED_KPARTX}="1"
- ENV{DM_SUSPENDED}=="1", GOTO="end_mpath"
- ENV{DM_ACTION}=="PATH_FAILED", GOTO="end_mpath"
- ENV{DM_ACTIVATION}!="1", ENV{DM_MULTIPATH_NEED_KPARTX}!="1", GOTO="end_mpath"
--RUN+="/sbin/kpartx -un -p -part /dev/$name"
-+RUN+="/sbin/kpartx -un /dev/$name"
- ENV{DM_MULTIPATH_NEED_KPARTX}=""
- 
- LABEL="end_mpath"
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0002-multipath-tools-remove-c-from-__cpluscplus-misspelle.patch b/meta-oe/recipes-support/multipath-tools/files/0002-multipath-tools-remove-c-from-__cpluscplus-misspelle.patch
new file mode 100644
index 0000000..73f000a
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0002-multipath-tools-remove-c-from-__cpluscplus-misspelle.patch
@@ -0,0 +1,33 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Tue, 24 Apr 2018 15:03:40 +0200
+Subject: [PATCH] multipath-tools: remove "c" from __cpluscplus, misspelled
+
+found by cppcheck(http://cppcheck.sf.net/):
+[libmpathcmd/mpath_cmd.h:24]: (error) Invalid number of character '{' when these macros are defined: '__cpluscplus'.
+
+Cc: Benjamin Marzinski <bmarzins@redhat.com>
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmpathcmd/mpath_cmd.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmpathcmd/mpath_cmd.h b/libmpathcmd/mpath_cmd.h
+index aaa8da9..df9d938 100644
+--- a/libmpathcmd/mpath_cmd.h
++++ b/libmpathcmd/mpath_cmd.h
+@@ -20,7 +20,7 @@
+ #ifndef LIB_MPATH_CMD_H
+ #define LIB_MPATH_CMD_H
+ 
+-#ifdef __cpluscplus
++#ifdef __cplusplus
+ extern "C" {
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0003-multipath-tools-remove-emacs-autoconfig-of-kpartx-gp.patch b/meta-oe/recipes-support/multipath-tools/files/0003-multipath-tools-remove-emacs-autoconfig-of-kpartx-gp.patch
new file mode 100644
index 0000000..7358e1a
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0003-multipath-tools-remove-emacs-autoconfig-of-kpartx-gp.patch
@@ -0,0 +1,43 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Thu, 12 Apr 2018 18:17:13 +0200
+Subject: [PATCH] multipath-tools: remove emacs autoconfig of kpartx/gpt.h
+
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ kpartx/gpt.h | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/kpartx/gpt.h b/kpartx/gpt.h
+index 66ce8f1..7bb54b7 100644
+--- a/kpartx/gpt.h
++++ b/kpartx/gpt.h
+@@ -109,22 +109,3 @@ int read_gpt_pt (int fd, struct slice all, struct slice *sp, int ns);
+ 
+ 
+ #endif
+-
+-/*
+- * Overrides for Emacs so that we follow Linus's tabbing style.
+- * Emacs will notice this stuff at the end of the file and automatically
+- * adjust the settings for this buffer only.  This must remain at the end
+- * of the file.
+- * ---------------------------------------------------------------------------
+- * Local variables:
+- * c-indent-level: 4
+- * c-brace-imaginary-offset: 0
+- * c-brace-offset: -4
+- * c-argdecl-indent: 4
+- * c-label-offset: -4
+- * c-continued-statement-offset: 4
+- * c-continued-brace-offset: 0
+- * indent-tabs-mode: nil
+- * tab-width: 8
+- * End:
+- */
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-multipath-tools-replace-FSF-address-with-a-www-point.patch b/meta-oe/recipes-support/multipath-tools/files/0004-multipath-tools-replace-FSF-address-with-a-www-point.patch
new file mode 100644
index 0000000..13f18b5
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-multipath-tools-replace-FSF-address-with-a-www-point.patch
@@ -0,0 +1,191 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Fri, 11 May 2018 15:42:43 +0200
+Subject: [PATCH] multipath-tools: replace FSF address with a www pointer
+
+Less prone to future modifications, new FSF licences
+point exactly to this url: <http://www.gnu.org/licenses/>.
+And sending a smail to FSF is outdated.
+
+First clean up was done in 5619a39c433ac3d10a88079593cec1aa6472cbeb
+
+Cc: Martin Wilck <mwilck@suse.com>
+Cc: Benjamin Marzinski <bmarzins@redhat.com>
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/dm-generic.c   | 4 +---
+ libmultipath/dm-generic.h   | 4 +---
+ libmultipath/foreign.c      | 4 +---
+ libmultipath/foreign.h      | 4 +---
+ libmultipath/foreign/nvme.c | 4 +---
+ libmultipath/generic.c      | 4 +---
+ libmultipath/generic.h      | 4 +---
+ tests/dmevents.c            | 2 +-
+ tests/parser.c              | 2 +-
+ tests/uevent.c              | 2 +-
+ tests/util.c                | 2 +-
+ 11 files changed, 11 insertions(+), 25 deletions(-)
+
+diff --git a/libmultipath/dm-generic.c b/libmultipath/dm-generic.c
+index bdc9ca0..d752991 100644
+--- a/libmultipath/dm-generic.c
++++ b/libmultipath/dm-generic.c
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  */
+ 
+ #include <stdint.h>
+diff --git a/libmultipath/dm-generic.h b/libmultipath/dm-generic.h
+index 5d59724..986429f 100644
+--- a/libmultipath/dm-generic.h
++++ b/libmultipath/dm-generic.h
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  */
+ #ifndef _DM_GENERIC_H
+ #define _DM_GENERIC_H
+diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
+index 7217184..80b399b 100644
+--- a/libmultipath/foreign.c
++++ b/libmultipath/foreign.c
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+ 
+ #include <sys/sysmacros.h>
+diff --git a/libmultipath/foreign.h b/libmultipath/foreign.h
+index 973f368..697f12f 100644
+--- a/libmultipath/foreign.h
++++ b/libmultipath/foreign.h
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+ #ifndef _FOREIGN_H
+ #define _FOREIGN_H
+diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
+index 235f75d..280b6bd 100644
+--- a/libmultipath/foreign/nvme.c
++++ b/libmultipath/foreign/nvme.c
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+ 
+ #include <sys/sysmacros.h>
+diff --git a/libmultipath/generic.c b/libmultipath/generic.c
+index 6f7a2cd..0d1e632 100644
+--- a/libmultipath/generic.c
++++ b/libmultipath/generic.c
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  */
+ 
+ 
+diff --git a/libmultipath/generic.h b/libmultipath/generic.h
+index 7f7fe66..6346ffe 100644
+--- a/libmultipath/generic.h
++++ b/libmultipath/generic.h
+@@ -12,9 +12,7 @@
+   GNU General Public License for more details.
+ 
+   You should have received a copy of the GNU General Public License
+-  along with this program; if not, write to the Free Software
+-  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
+-  USA.
++  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  */
+ #ifndef _GENERIC_H
+ #define _GENERIC_H
+diff --git a/tests/dmevents.c b/tests/dmevents.c
+index bba51dc..3399c81 100644
+--- a/tests/dmevents.c
++++ b/tests/dmevents.c
+@@ -12,7 +12,7 @@
+  * GNU General Public License for more details.
+  *
+  * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write to the Free Software
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  *
+  */
+ 
+diff --git a/tests/parser.c b/tests/parser.c
+index a7e7598..29859da 100644
+--- a/tests/parser.c
++++ b/tests/parser.c
+@@ -12,7 +12,7 @@
+  * GNU General Public License for more details.
+  *
+  * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write to the Free Software
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  *
+  */
+ 
+diff --git a/tests/uevent.c b/tests/uevent.c
+index acfcb14..b0d0bfd 100644
+--- a/tests/uevent.c
++++ b/tests/uevent.c
+@@ -12,7 +12,7 @@
+  * GNU General Public License for more details.
+  *
+  * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write to the Free Software
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  *
+  */
+ 
+diff --git a/tests/util.c b/tests/util.c
+index 113b134..839effd 100644
+--- a/tests/util.c
++++ b/tests/util.c
+@@ -12,7 +12,7 @@
+  * GNU General Public License for more details.
+  *
+  * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write to the Free Software
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  *
+  */
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0005-multipath-tools-Remove-trailing-leading-whitespaces-.patch b/meta-oe/recipes-support/multipath-tools/files/0005-multipath-tools-Remove-trailing-leading-whitespaces-.patch
new file mode 100644
index 0000000..953e739
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0005-multipath-tools-Remove-trailing-leading-whitespaces-.patch
@@ -0,0 +1,156 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Fri, 11 May 2018 15:43:11 +0200
+Subject: [PATCH] multipath-tools: Remove trailing/leading whitespaces and
+ reformat code
+
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: device-mapper development <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ Makefile.inc           | 23 +++++++++++------------
+ kpartx/mac.h           |  2 +-
+ kpartx/test-kpartx     |  2 +-
+ libmpathcmd/Makefile   |  2 +-
+ libmultipath/hwtable.c | 14 +++++++-------
+ libmultipath/print.h   |  2 +-
+ multipathd/main.h      |  6 +++---
+ 7 files changed, 25 insertions(+), 26 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 57a1835..af2f5ba 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -103,21 +103,20 @@ LDFLAGS		= -Wl,-z,relro -Wl,-z,now
+ BIN_LDFLAGS	= -pie
+ 
+ # Check whether a function with name $1 has been declared in header file $2.
+-check_func =								       \
+-    $(shell								       \
++check_func = $(shell \
+ 	if grep -Eq "^[^[:blank:]]+[[:blank:]]+$1[[:blank:]]*(.*)*" "$2"; then \
+-	   found=1;							       \
+-	   status="yes";						       \
+-	else								       \
+-	   found=0;							       \
+-	   status="no";							       \
+-	fi;								       \
+-	echo 1>&2 "Checking for $1 in $2 ... $$status";			       \
+-	echo "$$found"							       \
+-    )
++		found=1; \
++		status="yes"; \
++	else \
++		found=0; \
++		status="no"; \
++	fi; \
++	echo 1>&2 "Checking for $1 in $2 ... $$status"; \
++	echo "$$found" \
++	)
+ 
+ # Checker whether a file with name $1 exists
+-check_file = $(shell	\
++check_file = $(shell \
+ 	if [ -f "$1" ]; then \
+ 		found=1; \
+ 		status="yes"; \
+diff --git a/kpartx/mac.h b/kpartx/mac.h
+index a44cf38..55c3ec9 100644
+--- a/kpartx/mac.h
++++ b/kpartx/mac.h
+@@ -24,7 +24,7 @@ struct mac_driver_desc {
+ 	uint16_t  signature;      /* expected to be MAC_DRIVER_MAGIC */
+ 	uint16_t  block_size;
+ 	uint32_t  block_count;
+-    /* ... more stuff */
++	/* ... more stuff */
+ };
+ 
+ #endif
+diff --git a/kpartx/test-kpartx b/kpartx/test-kpartx
+index 9cee20f..d2001dc 100755
+--- a/kpartx/test-kpartx
++++ b/kpartx/test-kpartx
+@@ -131,7 +131,7 @@ step "create DM devices (spans)"
+ # They also serve as DM devices to test partition removal on those.
+ 
+ TABLE="\
+-0 $((SIZE/SECTSIZ-OFFS)) linear $DEV1 $OFFS 
++0 $((SIZE/SECTSIZ-OFFS)) linear $DEV1 $OFFS
+ $((SIZE/SECTSIZ-OFFS)) $((SIZE/SECTSIZ-OFFS)) linear $DEV2 $OFFS"
+ 
+ SPAN1=kpt
+diff --git a/libmpathcmd/Makefile b/libmpathcmd/Makefile
+index 53c0899..0f6b816 100644
+--- a/libmpathcmd/Makefile
++++ b/libmpathcmd/Makefile
+@@ -27,7 +27,7 @@ uninstall:
+ 	$(RM) $(DESTDIR)$(includedir)/mpath_cmd.h
+ 
+ clean: dep_clean
+-	$(RM) core *.a *.o *.so *.so.* *.gz 
++	$(RM) core *.a *.o *.so *.so.* *.gz
+ 
+ include $(wildcard $(OBJS:.o=.d))
+ 
+diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
+index 827e899..2ca6888 100644
+--- a/libmultipath/hwtable.c
++++ b/libmultipath/hwtable.c
+@@ -78,13 +78,13 @@
+ #endif
+ 
+ static struct hwentry default_hw[] = {
+-       /*
+-	* Generic NVMe
+-	*
+-	* Due to the parsing logic in find_hwe(), generic entries
+-	* have to be put on top of this list, and more specific ones
+-	* below.
+-	*/
++	/*
++	 * Generic NVMe devices
++	 *
++	 * Due to the parsing logic in find_hwe(), generic entries
++	 * have to be put on top of this list, and more specific ones
++	 * below.
++	 */
+ 	{
+ 		.vendor        = "NVME",
+ 		.product       = ".*",
+diff --git a/libmultipath/print.h b/libmultipath/print.h
+index 7ba6438..9b5a23a 100644
+--- a/libmultipath/print.h
++++ b/libmultipath/print.h
+@@ -113,7 +113,7 @@ int _snprint_multipath (const struct gen_multipath *, char *, int,
+ 			const char *, int);
+ #define snprint_multipath(buf, len, fmt, mp, v)				\
+ 	_snprint_multipath(dm_multipath_to_gen(mp), buf, len, fmt,  v)
+-int _snprint_multipath_topology (const struct gen_multipath *, char *, int, 
++int _snprint_multipath_topology (const struct gen_multipath *, char *, int,
+ 				 int verbosity);
+ #define snprint_multipath_topology(buf, len, mpp, v) \
+ 	_snprint_multipath_topology (dm_multipath_to_gen(mpp), buf, len, v)
+diff --git a/multipathd/main.h b/multipathd/main.h
+index af39558..8fd426b 100644
+--- a/multipathd/main.h
++++ b/multipathd/main.h
+@@ -29,11 +29,11 @@ int ev_remove_map (char *, char *, int, struct vectors *);
+ int set_config_state(enum daemon_status);
+ void * mpath_alloc_prin_response(int prin_sa);
+ int prin_do_scsi_ioctl(char *, int rq_servact, struct prin_resp * resp,
+-       int noisy);
++		       int noisy);
+ void dumpHex(const char * , int len, int no_ascii);
+ int prout_do_scsi_ioctl(char * , int rq_servact, int rq_scope,
+-       unsigned int rq_type, struct prout_param_descriptor *param,
+-       int noisy);
++			unsigned int rq_type,
++			struct prout_param_descriptor *param, int noisy);
+ int mpath_pr_event_handle(struct path *pp);
+ void * mpath_pr_event_handler_fn (void * );
+ int update_map_pr(struct multipath *mpp);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0006-multipath-tools-fix-compilation-with-musl-libc.patch b/meta-oe/recipes-support/multipath-tools/files/0006-multipath-tools-fix-compilation-with-musl-libc.patch
new file mode 100644
index 0000000..c6fd5b4
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0006-multipath-tools-fix-compilation-with-musl-libc.patch
@@ -0,0 +1,58 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Fri, 11 May 2018 18:39:44 +0200
+Subject: [PATCH] multipath-tools: fix compilation with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In file included from alias.c:15:
+file.h:9:47: error: unknown type name ‘mode_t’; did you mean ‘time_t’?
+ int ensure_directories_exist(const char *str, mode_t dir_mode);
+                                               ^~~~~~
+                                               time_t
+
+sysfs.c: In function ‘sysfs_is_multipathed’:
+sysfs.c:304:15: error: ‘PATH_MAX’ undeclared (first use in this function); did you mean ‘PATH_UP’?
+  char pathbuf[PATH_MAX];
+               ^~~~~~~~
+               PATH_UP
+
+Cc: Martin Wilck <mwilck@suse.com>
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/file.h  | 2 ++
+ libmultipath/sysfs.c | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/libmultipath/file.h b/libmultipath/file.h
+index 29520c7..3c75c90 100644
+--- a/libmultipath/file.h
++++ b/libmultipath/file.h
+@@ -5,6 +5,8 @@
+ #ifndef _FILE_H
+ #define _FILE_H
+ 
++#include <sys/stat.h>
++
+ #define FILE_TIMEOUT 30
+ int ensure_directories_exist(const char *str, mode_t dir_mode);
+ int open_file(const char *file, int *can_write, const char *header);
+diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
+index ee72e6a..16e0a73 100644
+--- a/libmultipath/sysfs.c
++++ b/libmultipath/sysfs.c
+@@ -28,6 +28,7 @@
+ #include <dirent.h>
+ #include <libudev.h>
+ #include <fnmatch.h>
++#include <limits.h>
+ 
+ #include "checkers.h"
+ #include "vector.h"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch b/meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch
deleted file mode 100644
index 025a351..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 0d2c9afbd89d79fd700f9c99aa20e5f7c7382027 Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Mon, 24 Apr 2017 09:39:57 -0500
-Subject: [PATCH 07/14] RH: trigger change uevent on new device creation
-
-When multipath first sees a path device with user_friendly names
-enabled, it can't know if the device should be multipathed. This means
-that it will not claim the device in udev.  If the device is eventually
-multipathed, multipath should trigger a change uevent to update the udev
-database to claim the device.
-
-This also reverts commit 64e27ec066a001012f44550f095c93443e91d845.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- libmultipath/configure.c | 26 ++++++++++++++++++++++++--
- libmultipath/configure.h |  1 +
- libmultipath/wwids.c     |  4 ++--
- multipath/main.c         |  2 +-
- multipathd/main.c        |  7 ++-----
- 5 files changed, 30 insertions(+), 10 deletions(-)
-
-diff --git a/libmultipath/configure.c b/libmultipath/configure.c
-index bd090d9..843dd09 100644
---- a/libmultipath/configure.c
-+++ b/libmultipath/configure.c
-@@ -422,6 +422,28 @@ trigger_udev_change(const struct multipath *mpp)
- 	udev_device_unref(udd);
- }
- 
-+void
-+trigger_paths_udev_change(const struct multipath *mpp)
-+{
-+	struct pathgroup * pgp;
-+	struct path * pp;
-+	int i, j;
-+
-+	if (!mpp || !mpp->pg)
-+		return;
-+
-+	vector_foreach_slot (mpp->pg, pgp, i) {
-+		if (!pgp->paths)
-+			continue;
-+		vector_foreach_slot(pgp->paths, pp, j) {
-+			if (!pp->udev)
-+				continue;
-+			sysfs_attr_set_value(pp->udev, "uevent", "change",
-+					     strlen("change"));
-+		}
-+	}
-+}
-+
- static int
- is_mpp_known_to_udev(const struct multipath *mpp)
- {
-@@ -802,8 +824,8 @@ int domap(struct multipath *mpp, char *params, int is_daemon)
- 		 * succeeded
- 		 */
- 		mpp->force_udev_reload = 0;
--		if (mpp->action == ACT_CREATE)
--			remember_wwid(mpp->wwid);
-+		if (mpp->action == ACT_CREATE && remember_wwid(mpp->wwid) == 1)
-+			trigger_paths_udev_change(mpp);
- 		if (!is_daemon) {
- 			/* multipath client mode */
- 			dm_switchgroup(mpp->alias, mpp->bestpg);
-diff --git a/libmultipath/configure.h b/libmultipath/configure.h
-index fd7f581..253e29b 100644
---- a/libmultipath/configure.h
-+++ b/libmultipath/configure.h
-@@ -36,3 +36,4 @@ int get_refwwid (enum mpath_cmds cmd, char * dev, enum devtypes dev_type,
- 		 vector pathvec, char **wwid);
- int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh, int is_daemon);
- int sysfs_get_host_adapter_name(struct path *pp, char *adapter_name);
-+void trigger_paths_udev_change(const struct multipath *mpp);
-diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index 88bb72b..249c6c1 100644
---- a/libmultipath/wwids.c
-+++ b/libmultipath/wwids.c
-@@ -319,7 +319,7 @@ remember_wwid(char *wwid)
- 		condlog(3, "wrote wwid %s to wwids file", wwid);
- 	else
- 		condlog(4, "wwid %s already in wwids file", wwid);
--	return 0;
-+	return ret;
- }
- 
- int remember_cmdline_wwid(void)
-@@ -353,7 +353,7 @@ int remember_cmdline_wwid(void)
- 			next++;
- 		}
- 		if (strlen(ptr)) {
--			if (remember_wwid(ptr) != 0)
-+			if (remember_wwid(ptr) < 0)
- 				ret = -1;
- 		}
- 		else {
-diff --git a/multipath/main.c b/multipath/main.c
-index 72585b0..2eda6a3 100644
---- a/multipath/main.c
-+++ b/multipath/main.c
-@@ -336,7 +336,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
- 		}
- 		if (cmd == CMD_ADD_WWID) {
- 			r = remember_wwid(refwwid);
--			if (r == 0)
-+			if (r >= 0)
- 				printf("wwid '%s' added\n", refwwid);
- 			else
- 				printf("failed adding '%s' to wwids file\n",
-diff --git a/multipathd/main.c b/multipathd/main.c
-index 81c76ca..874bcce 100644
---- a/multipathd/main.c
-+++ b/multipathd/main.c
-@@ -2093,7 +2093,8 @@ configure (struct vectors * vecs, int start_waiters)
- 
- 	sync_maps_state(mpvec);
- 	vector_foreach_slot(mpvec, mpp, i){
--		remember_wwid(mpp->wwid);
-+		if (remember_wwid(mpp->wwid) == 1)
-+			trigger_paths_udev_change(mpp);
- 		update_map_pr(mpp);
- 	}
- 
-@@ -2175,10 +2176,6 @@ reconfigure (struct vectors * vecs)
- 		conf->verbosity = verbosity;
- 	if (bindings_read_only)
- 		conf->bindings_read_only = bindings_read_only;
--	if (conf->find_multipaths) {
--		condlog(2, "find_multipaths is set: -n is implied");
--		ignore_new_devs = 1;
--	}
- 	if (ignore_new_devs)
- 		conf->ignore_new_devs = ignore_new_devs;
- 	uxsock_timeout = conf->uxsock_timeout;
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0007-multipath-tools-add-x-to-doc-preclean.pl-and-split-m.patch b/meta-oe/recipes-support/multipath-tools/files/0007-multipath-tools-add-x-to-doc-preclean.pl-and-split-m.patch
new file mode 100644
index 0000000..9e608e1
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0007-multipath-tools-add-x-to-doc-preclean.pl-and-split-m.patch
@@ -0,0 +1,27 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Sun, 13 May 2018 00:39:41 +0200
+Subject: [PATCH] multipath-tools: add +x to doc-preclean.pl and split-man.pl
+
+It is not strictly necessary, but it helps identify bin files.
+
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libdmmp/docs/doc-preclean.pl | 0
+ libdmmp/docs/split-man.pl    | 0
+ 2 files changed, 0 insertions(+), 0 deletions(-)
+ mode change 100644 => 100755 libdmmp/docs/doc-preclean.pl
+ mode change 100644 => 100755 libdmmp/docs/split-man.pl
+
+diff --git a/libdmmp/docs/doc-preclean.pl b/libdmmp/docs/doc-preclean.pl
+old mode 100644
+new mode 100755
+diff --git a/libdmmp/docs/split-man.pl b/libdmmp/docs/split-man.pl
+old mode 100644
+new mode 100755
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch b/meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch
deleted file mode 100644
index f678809..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0be174dbedd861d7694b0c7799fe26be31eb32b0 Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Fri, 26 May 2017 17:52:57 -0500
-Subject: [PATCH 08/14] libmultipath: change how RADOS checker is enabled
-
-Instead of making the user call "make", "make install" and "make clean"
-with ENABLE_RADOS set correctly, have the makefile check if
-/usr/include/rados/librados.h exists, just like it checks if specific
-functions exist in a file.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- Makefile.inc                   | 13 +++++++++++++
- libmultipath/checkers/Makefile |  3 ++-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 2591fa9..e084fd1 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -109,5 +109,18 @@ check_func =								       \
- 	echo "$$found"							       \
-     )
- 
-+# Checker whether a file with name $1 exists
-+check_file = $(shell	\
-+	if [ -f "$1" ]; then \
-+		found=1; \
-+		status="yes"; \
-+	else \
-+		found=0; \
-+		status="no"; \
-+	fi; \
-+	echo 1>&2 "Checking if $1 exists ... $$status"; \
-+	echo "$$found" \
-+	)
-+
- %.o:	%.c
- 	$(CC) $(CFLAGS) -c -o $@ $<
-diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
-index 732ca9d..bce6b8b 100644
---- a/libmultipath/checkers/Makefile
-+++ b/libmultipath/checkers/Makefile
-@@ -14,7 +14,8 @@ LIBS= \
- 	libcheckemc_clariion.so \
- 	libcheckhp_sw.so \
- 	libcheckrdac.so
--ifneq ($(ENABLE_RADOS),0)
-+
-+ifneq ($(call check_file,/usr/include/rados/librados.h),0)
- LIBS += libcheckrbd.so
- endif
- 
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0008-multipath-tools-refresh-kernel-doc-from-kernel-sourc.patch b/meta-oe/recipes-support/multipath-tools/files/0008-multipath-tools-refresh-kernel-doc-from-kernel-sourc.patch
new file mode 100644
index 0000000..3752158
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0008-multipath-tools-refresh-kernel-doc-from-kernel-sourc.patch
@@ -0,0 +1,784 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Sun, 13 May 2018 00:39:42 +0200
+Subject: [PATCH] multipath-tools: refresh kernel-doc from kernel sources
+
+Cc: Gris Ge <fge@redhat.com>
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: device-mapper development <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libdmmp/docs/kernel-doc | 671 ++++++++++++++++++++++++++----------------------
+ 1 file changed, 368 insertions(+), 303 deletions(-)
+
+diff --git a/libdmmp/docs/kernel-doc b/libdmmp/docs/kernel-doc
+index fee8952..0057d8e 100755
+--- a/libdmmp/docs/kernel-doc
++++ b/libdmmp/docs/kernel-doc
+@@ -1,4 +1,5 @@
+ #!/usr/bin/env perl
++# SPDX-License-Identifier: GPL-2.0
+ 
+ use warnings;
+ use strict;
+@@ -328,13 +329,15 @@ my $lineprefix="";
+ use constant {
+     STATE_NORMAL        => 0, # normal code
+     STATE_NAME          => 1, # looking for function name
+-    STATE_FIELD         => 2, # scanning field start
+-    STATE_PROTO         => 3, # scanning prototype
+-    STATE_DOCBLOCK      => 4, # documentation block
+-    STATE_INLINE        => 5, # gathering documentation outside main block
++    STATE_BODY_MAYBE    => 2, # body - or maybe more description
++    STATE_BODY          => 3, # the body of the comment
++    STATE_PROTO         => 4, # scanning prototype
++    STATE_DOCBLOCK      => 5, # documentation block
++    STATE_INLINE        => 6, # gathering documentation outside main block
+ };
+ my $state;
+ my $in_doc_sect;
++my $leading_space;
+ 
+ # Inline documentation state
+ use constant {
+@@ -363,7 +366,7 @@ my $doc_sect = $doc_com .
+ my $doc_content = $doc_com_body . '(.*)';
+ my $doc_block = $doc_com . 'DOC:\s*(.*)?';
+ my $doc_inline_start = '^\s*/\*\*\s*$';
+-my $doc_inline_sect = '\s*\*\s*(@[\w\s]+):(.*)';
++my $doc_inline_sect = '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
+ my $doc_inline_end = '^\s*\*/\s*$';
+ my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
+ my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
+@@ -553,10 +556,9 @@ sub output_highlight {
+ 	}
+ 	if ($line eq ""){
+ 	    if (! $output_preformatted) {
+-		print $lineprefix, local_unescape($blankline);
++		print $lineprefix, $blankline;
+ 	    }
+ 	} else {
+-	    $line =~ s/\\\\\\/\&/g;
+ 	    if ($output_mode eq "man" && substr($line, 0, 1) eq ".") {
+ 		print "\\&$line";
+ 	    } else {
+@@ -747,17 +749,73 @@ sub output_blockhead_rst(%) {
+     }
+ }
+ 
+-sub output_highlight_rst {
+-    my $contents = join "\n",@_;
+-    my $line;
+-
+-    # undo the evil effects of xml_escape() earlier
+-    $contents = xml_unescape($contents);
+-
++#
++# Apply the RST highlights to a sub-block of text.
++#   
++sub highlight_block($) {
++    # The dohighlight kludge requires the text be called $contents
++    my $contents = shift;
+     eval $dohighlight;
+     die $@ if $@;
++    return $contents;
++}
+ 
+-    foreach $line (split "\n", $contents) {
++#
++# Regexes used only here.
++#
++my $sphinx_literal = '^[^.].*::$';
++my $sphinx_cblock = '^\.\.\ +code-block::';
++
++sub output_highlight_rst {
++    my $input = join "\n",@_;
++    my $output = "";
++    my $line;
++    my $in_literal = 0;
++    my $litprefix;
++    my $block = "";
++
++    foreach $line (split "\n",$input) {
++	#
++	# If we're in a literal block, see if we should drop out
++	# of it.  Otherwise pass the line straight through unmunged.
++	#
++	if ($in_literal) {
++	    if (! ($line =~ /^\s*$/)) {
++		#
++		# If this is the first non-blank line in a literal
++		# block we need to figure out what the proper indent is.
++		#
++		if ($litprefix eq "") {
++		    $line =~ /^(\s*)/;
++		    $litprefix = '^' . $1;
++		    $output .= $line . "\n";
++		} elsif (! ($line =~ /$litprefix/)) {
++		    $in_literal = 0;
++		} else {
++		    $output .= $line . "\n";
++		}
++	    } else {
++		$output .= $line . "\n";
++	    }
++	}
++	#
++	# Not in a literal block (or just dropped out)
++	#
++	if (! $in_literal) {
++	    $block .= $line . "\n";
++	    if (($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
++		$in_literal = 1;
++		$litprefix = "";
++		$output .= highlight_block($block);
++		$block = ""
++	    }
++	}
++    }
++
++    if ($block) {
++	$output .= highlight_block($block);
++    }
++    foreach $line (split "\n", $output) {
+ 	print $lineprefix . $line . "\n";
+     }
+ }
+@@ -1062,7 +1120,7 @@ sub dump_struct($$) {
+ 					# Handle bitmaps
+ 					$arg =~ s/:\s*\d+\s*//g;
+ 					# Handle arrays
+-					$arg =~ s/\[\S+\]//g;
++					$arg =~ s/\[.*\]//g;
+ 					# The type may have multiple words,
+ 					# and multiple IDs can be defined, like:
+ 					#	const struct foo, *bar, foobar
+@@ -1422,8 +1480,6 @@ sub push_parameter($$$$) {
+ 		}
+ 	}
+ 
+-	$param = xml_escape($param);
+-
+ 	# strip spaces from $param so that it is one continuous string
+ 	# on @parameterlist;
+ 	# this fixes a problem where check_sections() cannot find
+@@ -1522,6 +1578,7 @@ sub dump_function($$) {
+     $prototype =~ s/__meminit +//;
+     $prototype =~ s/__must_check +//;
+     $prototype =~ s/__weak +//;
++    $prototype =~ s/__sched +//;
+     my $define = $prototype =~ s/^#\s*define\s+//; #ak added
+     $prototype =~ s/__attribute__\s*\(\(
+             (?:
+@@ -1748,47 +1805,6 @@ sub process_proto_type($$) {
+     }
+ }
+ 
+-# xml_escape: replace <, >, and & in the text stream;
+-#
+-# however, formatting controls that are generated internally/locally in the
+-# kernel-doc script are not escaped here; instead, they begin life like
+-# $blankline_html (4 of '\' followed by a mnemonic + ':'), then these strings
+-# are converted to their mnemonic-expected output, without the 4 * '\' & ':',
+-# just before actual output; (this is done by local_unescape())
+-sub xml_escape($) {
+-	my $text = shift;
+-	if ($output_mode eq "man") {
+-		return $text;
+-	}
+-	$text =~ s/\&/\\\\\\amp;/g;
+-	$text =~ s/\</\\\\\\lt;/g;
+-	$text =~ s/\>/\\\\\\gt;/g;
+-	return $text;
+-}
+-
+-# xml_unescape: reverse the effects of xml_escape
+-sub xml_unescape($) {
+-	my $text = shift;
+-	if ($output_mode eq "man") {
+-		return $text;
+-	}
+-	$text =~ s/\\\\\\amp;/\&/g;
+-	$text =~ s/\\\\\\lt;/</g;
+-	$text =~ s/\\\\\\gt;/>/g;
+-	return $text;
+-}
+-
+-# convert local escape strings to html
+-# local escape strings look like:  '\\\\menmonic:' (that's 4 backslashes)
+-sub local_unescape($) {
+-	my $text = shift;
+-	if ($output_mode eq "man") {
+-		return $text;
+-	}
+-	$text =~ s/\\\\\\\\lt:/</g;
+-	$text =~ s/\\\\\\\\gt:/>/g;
+-	return $text;
+-}
+ 
+ sub map_filename($) {
+     my $file;
+@@ -1826,15 +1842,291 @@ sub process_export_file($) {
+     close(IN);
+ }
+ 
+-sub process_file($) {
+-    my $file;
++#
++# Parsers for the various processing states.
++#
++# STATE_NORMAL: looking for the /** to begin everything.
++#
++sub process_normal() {
++    if (/$doc_start/o) {
++	$state = STATE_NAME;	# next line is always the function name
++	$in_doc_sect = 0;
++	$declaration_start_line = $. + 1;
++    }
++}
++
++#
++# STATE_NAME: Looking for the "name - description" line
++#
++sub process_name($$) {
++    my $file = shift;
+     my $identifier;
+-    my $func;
+     my $descr;
+-    my $in_purpose = 0;
++
++    if (/$doc_block/o) {
++	$state = STATE_DOCBLOCK;
++	$contents = "";
++	$new_start_line = $. + 1;
++
++	if ( $1 eq "" ) {
++	    $section = $section_intro;
++	} else {
++	    $section = $1;
++	}
++    }
++    elsif (/$doc_decl/o) {
++	$identifier = $1;
++	if (/\s*([\w\s]+?)(\(\))?\s*-/) {
++	    $identifier = $1;
++	}
++
++	$state = STATE_BODY;
++	# if there's no @param blocks need to set up default section
++	# here
++	$contents = "";
++	$section = $section_default;
++	$new_start_line = $. + 1;
++	if (/-(.*)/) {
++	    # strip leading/trailing/multiple spaces
++	    $descr= $1;
++	    $descr =~ s/^\s*//;
++	    $descr =~ s/\s*$//;
++	    $descr =~ s/\s+/ /g;
++	    $declaration_purpose = $descr;
++	    $state = STATE_BODY_MAYBE;
++	} else {
++	    $declaration_purpose = "";
++	}
++
++	if (($declaration_purpose eq "") && $verbose) {
++	    print STDERR "${file}:$.: warning: missing initial short description on line:\n";
++	    print STDERR $_;
++	    ++$warnings;
++	}
++
++	if ($identifier =~ m/^struct/) {
++	    $decl_type = 'struct';
++	} elsif ($identifier =~ m/^union/) {
++	    $decl_type = 'union';
++	} elsif ($identifier =~ m/^enum/) {
++	    $decl_type = 'enum';
++	} elsif ($identifier =~ m/^typedef/) {
++	    $decl_type = 'typedef';
++	} else {
++	    $decl_type = 'function';
++	}
++
++	if ($verbose) {
++	    print STDERR "${file}:$.: info: Scanning doc for $identifier\n";
++	}
++    } else {
++	print STDERR "${file}:$.: warning: Cannot understand $_ on line $.",
++	    " - I thought it was a doc line\n";
++	++$warnings;
++	$state = STATE_NORMAL;
++    }
++}
++
++
++#
++# STATE_BODY and STATE_BODY_MAYBE: the bulk of a kerneldoc comment.
++#
++sub process_body($$) {
++    my $file = shift;
++
++    if (/$doc_sect/i) { # case insensitive for supported section names
++	$newsection = $1;
++	$newcontents = $2;
++
++	# map the supported section names to the canonical names
++	if ($newsection =~ m/^description$/i) {
++	    $newsection = $section_default;
++	} elsif ($newsection =~ m/^context$/i) {
++	    $newsection = $section_context;
++	} elsif ($newsection =~ m/^returns?$/i) {
++	    $newsection = $section_return;
++	} elsif ($newsection =~ m/^\@return$/) {
++	    # special: @return is a section, not a param description
++	    $newsection = $section_return;
++	}
++
++	if (($contents ne "") && ($contents ne "\n")) {
++	    if (!$in_doc_sect && $verbose) {
++		print STDERR "${file}:$.: warning: contents before sections\n";
++		++$warnings;
++	    }
++	    dump_section($file, $section, $contents);
++	    $section = $section_default;
++	}
++
++	$in_doc_sect = 1;
++	$state = STATE_BODY;
++	$contents = $newcontents;
++	$new_start_line = $.;
++	while (substr($contents, 0, 1) eq " ") {
++	    $contents = substr($contents, 1);
++	}
++	if ($contents ne "") {
++	    $contents .= "\n";
++	}
++	$section = $newsection;
++	$leading_space = undef;
++    } elsif (/$doc_end/) {
++	if (($contents ne "") && ($contents ne "\n")) {
++	    dump_section($file, $section, $contents);
++	    $section = $section_default;
++	    $contents = "";
++	}
++	# look for doc_com + <text> + doc_end:
++	if ($_ =~ m'\s*\*\s*[a-zA-Z_0-9:\.]+\*/') {
++	    print STDERR "${file}:$.: warning: suspicious ending line: $_";
++	    ++$warnings;
++	}
++
++	$prototype = "";
++	$state = STATE_PROTO;
++	$brcount = 0;
++    } elsif (/$doc_content/) {
++	# miguel-style comment kludge, look for blank lines after
++	# @parameter line to signify start of description
++	if ($1 eq "") {
++	    if ($section =~ m/^@/ || $section eq $section_context) {
++		dump_section($file, $section, $contents);
++		$section = $section_default;
++		$contents = "";
++		$new_start_line = $.;
++	    } else {
++		$contents .= "\n";
++	    }
++	    $state = STATE_BODY;
++	} elsif ($state == STATE_BODY_MAYBE) {
++	    # Continued declaration purpose
++	    chomp($declaration_purpose);
++	    $declaration_purpose .= " " . $1;
++	    $declaration_purpose =~ s/\s+/ /g;
++	} else {
++	    my $cont = $1;
++	    if ($section =~ m/^@/ || $section eq $section_context) {
++		if (!defined $leading_space) {
++		    if ($cont =~ m/^(\s+)/) {
++			$leading_space = $1;
++		    } else {
++			$leading_space = "";
++		    }
++		}
++		$cont =~ s/^$leading_space//;
++	    }
++	    $contents .= $cont . "\n";
++	}
++    } else {
++	# i dont know - bad line?  ignore.
++	print STDERR "${file}:$.: warning: bad line: $_";
++	++$warnings;
++    }
++}
++
++
++#
++# STATE_PROTO: reading a function/whatever prototype.
++#
++sub process_proto($$) {
++    my $file = shift;
++
++    if (/$doc_inline_oneline/) {
++	$section = $1;
++	$contents = $2;
++	if ($contents ne "") {
++	    $contents .= "\n";
++	    dump_section($file, $section, $contents);
++	    $section = $section_default;
++	    $contents = "";
++	}
++    } elsif (/$doc_inline_start/) {
++	$state = STATE_INLINE;
++	$inline_doc_state = STATE_INLINE_NAME;
++    } elsif ($decl_type eq 'function') {
++	process_proto_function($_, $file);
++    } else {
++	process_proto_type($_, $file);
++    }
++}
++
++#
++# STATE_DOCBLOCK: within a DOC: block.
++#
++sub process_docblock($$) {
++    my $file = shift;
++
++    if (/$doc_end/) {
++	dump_doc_section($file, $section, $contents);
++	$section = $section_default;
++	$contents = "";
++	$function = "";
++	%parameterdescs = ();
++	%parametertypes = ();
++	@parameterlist = ();
++	%sections = ();
++	@sectionlist = ();
++	$prototype = "";
++	$state = STATE_NORMAL;
++    } elsif (/$doc_content/) {
++	if ( $1 eq "" )	{
++	    $contents .= $blankline;
++	} else {
++	    $contents .= $1 . "\n";
++	}
++    }
++}
++
++#
++# STATE_INLINE: docbook comments within a prototype.
++#
++sub process_inline($$) {
++    my $file = shift;
++
++    # First line (state 1) needs to be a @parameter
++    if ($inline_doc_state == STATE_INLINE_NAME && /$doc_inline_sect/o) {
++	$section = $1;
++	$contents = $2;
++	$new_start_line = $.;
++	if ($contents ne "") {
++	    while (substr($contents, 0, 1) eq " ") {
++		$contents = substr($contents, 1);
++	    }
++	    $contents .= "\n";
++	}
++	$inline_doc_state = STATE_INLINE_TEXT;
++	# Documentation block end */
++    } elsif (/$doc_inline_end/) {
++	if (($contents ne "") && ($contents ne "\n")) {
++	    dump_section($file, $section, $contents);
++	    $section = $section_default;
++	    $contents = "";
++	}
++	$state = STATE_PROTO;
++	$inline_doc_state = STATE_INLINE_NA;
++	# Regular text
++    } elsif (/$doc_content/) {
++	if ($inline_doc_state == STATE_INLINE_TEXT) {
++	    $contents .= $1 . "\n";
++	    # nuke leading blank lines
++	    if ($contents =~ /^\s*$/) {
++		$contents = "";
++	    }
++	} elsif ($inline_doc_state == STATE_INLINE_NAME) {
++	    $inline_doc_state = STATE_INLINE_ERROR;
++	    print STDERR "${file}:$.: warning: ";
++	    print STDERR "Incorrect use of kernel-doc format: $_";
++	    ++$warnings;
++	}
++    }
++}
++
++
++sub process_file($) {
++    my $file;
+     my $initial_section_counter = $section_counter;
+     my ($orig_file) = @_;
+-    my $leading_space;
+ 
+     $file = map_filename($orig_file);
+ 
+@@ -1853,250 +2145,23 @@ sub process_file($) {
+ 	}
+ 	# Replace tabs by spaces
+         while ($_ =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {};
++	# Hand this line to the appropriate state handler
+ 	if ($state == STATE_NORMAL) {
+-	    if (/$doc_start/o) {
+-		$state = STATE_NAME;	# next line is always the function name
+-		$in_doc_sect = 0;
+-		$declaration_start_line = $. + 1;
+-	    }
+-	} elsif ($state == STATE_NAME) {# this line is the function name (always)
+-	    if (/$doc_block/o) {
+-		$state = STATE_DOCBLOCK;
+-		$contents = "";
+-                $new_start_line = $. + 1;
+-
+-		if ( $1 eq "" ) {
+-			$section = $section_intro;
+-		} else {
+-			$section = $1;
+-		}
+-	    }
+-	    elsif (/$doc_decl/o) {
+-		$identifier = $1;
+-		if (/\s*([\w\s]+?)\s*-/) {
+-		    $identifier = $1;
+-		}
+-
+-		$state = STATE_FIELD;
+-		# if there's no @param blocks need to set up default section
+-		# here
+-		$contents = "";
+-		$section = $section_default;
+-		$new_start_line = $. + 1;
+-		if (/-(.*)/) {
+-		    # strip leading/trailing/multiple spaces
+-		    $descr= $1;
+-		    $descr =~ s/^\s*//;
+-		    $descr =~ s/\s*$//;
+-		    $descr =~ s/\s+/ /g;
+-		    $declaration_purpose = xml_escape($descr);
+-		    $in_purpose = 1;
+-		} else {
+-		    $declaration_purpose = "";
+-		}
+-
+-		if (($declaration_purpose eq "") && $verbose) {
+-			print STDERR "${file}:$.: warning: missing initial short description on line:\n";
+-			print STDERR $_;
+-			++$warnings;
+-		}
+-
+-		if ($identifier =~ m/^struct/) {
+-		    $decl_type = 'struct';
+-		} elsif ($identifier =~ m/^union/) {
+-		    $decl_type = 'union';
+-		} elsif ($identifier =~ m/^enum/) {
+-		    $decl_type = 'enum';
+-		} elsif ($identifier =~ m/^typedef/) {
+-		    $decl_type = 'typedef';
+-		} else {
+-		    $decl_type = 'function';
+-		}
+-
+-		if ($verbose) {
+-		    print STDERR "${file}:$.: info: Scanning doc for $identifier\n";
+-		}
+-	    } else {
+-		print STDERR "${file}:$.: warning: Cannot understand $_ on line $.",
+-		" - I thought it was a doc line\n";
+-		++$warnings;
+-		$state = STATE_NORMAL;
+-	    }
+-	} elsif ($state == STATE_FIELD) {	# look for head: lines, and include content
+-	    if (/$doc_sect/i) { # case insensitive for supported section names
+-		$newsection = $1;
+-		$newcontents = $2;
+-
+-		# map the supported section names to the canonical names
+-		if ($newsection =~ m/^description$/i) {
+-		    $newsection = $section_default;
+-		} elsif ($newsection =~ m/^context$/i) {
+-		    $newsection = $section_context;
+-		} elsif ($newsection =~ m/^returns?$/i) {
+-		    $newsection = $section_return;
+-		} elsif ($newsection =~ m/^\@return$/) {
+-		    # special: @return is a section, not a param description
+-		    $newsection = $section_return;
+-		}
+-
+-		if (($contents ne "") && ($contents ne "\n")) {
+-		    if (!$in_doc_sect && $verbose) {
+-			print STDERR "${file}:$.: warning: contents before sections\n";
+-			++$warnings;
+-		    }
+-		    dump_section($file, $section, xml_escape($contents));
+-		    $section = $section_default;
+-		}
+-
+-		$in_doc_sect = 1;
+-		$in_purpose = 0;
+-		$contents = $newcontents;
+-                $new_start_line = $.;
+-		while (substr($contents, 0, 1) eq " ") {
+-		    $contents = substr($contents, 1);
+-		}
+-		if ($contents ne "") {
+-		    $contents .= "\n";
+-		}
+-		$section = $newsection;
+-		$leading_space = undef;
+-	    } elsif (/$doc_end/) {
+-		if (($contents ne "") && ($contents ne "\n")) {
+-		    dump_section($file, $section, xml_escape($contents));
+-		    $section = $section_default;
+-		    $contents = "";
+-		}
+-		# look for doc_com + <text> + doc_end:
+-		if ($_ =~ m'\s*\*\s*[a-zA-Z_0-9:\.]+\*/') {
+-		    print STDERR "${file}:$.: warning: suspicious ending line: $_";
+-		    ++$warnings;
+-		}
+-
+-		$prototype = "";
+-		$state = STATE_PROTO;
+-		$brcount = 0;
+-#		print STDERR "end of doc comment, looking for prototype\n";
+-	    } elsif (/$doc_content/) {
+-		# miguel-style comment kludge, look for blank lines after
+-		# @parameter line to signify start of description
+-		if ($1 eq "") {
+-		    if ($section =~ m/^@/ || $section eq $section_context) {
+-			dump_section($file, $section, xml_escape($contents));
+-			$section = $section_default;
+-			$contents = "";
+-                        $new_start_line = $.;
+-		    } else {
+-			$contents .= "\n";
+-		    }
+-		    $in_purpose = 0;
+-		} elsif ($in_purpose == 1) {
+-		    # Continued declaration purpose
+-		    chomp($declaration_purpose);
+-		    $declaration_purpose .= " " . xml_escape($1);
+-		    $declaration_purpose =~ s/\s+/ /g;
+-		} else {
+-		    my $cont = $1;
+-		    if ($section =~ m/^@/ || $section eq $section_context) {
+-			if (!defined $leading_space) {
+-			    if ($cont =~ m/^(\s+)/) {
+-				$leading_space = $1;
+-			    } else {
+-				$leading_space = "";
+-			    }
+-			}
+-
+-			$cont =~ s/^$leading_space//;
+-		    }
+-		    $contents .= $cont . "\n";
+-		}
+-	    } else {
+-		# i dont know - bad line?  ignore.
+-		print STDERR "${file}:$.: warning: bad line: $_";
+-		++$warnings;
+-	    }
++	    process_normal();
++	} elsif ($state == STATE_NAME) {
++	    process_name($file, $_);
++	} elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE) {
++	    process_body($file, $_);
+ 	} elsif ($state == STATE_INLINE) { # scanning for inline parameters
+-	    # First line (state 1) needs to be a @parameter
+-	    if ($inline_doc_state == STATE_INLINE_NAME && /$doc_inline_sect/o) {
+-		$section = $1;
+-		$contents = $2;
+-                $new_start_line = $.;
+-		if ($contents ne "") {
+-		    while (substr($contents, 0, 1) eq " ") {
+-			$contents = substr($contents, 1);
+-		    }
+-		    $contents .= "\n";
+-		}
+-		$inline_doc_state = STATE_INLINE_TEXT;
+-	    # Documentation block end */
+-	    } elsif (/$doc_inline_end/) {
+-		if (($contents ne "") && ($contents ne "\n")) {
+-		    dump_section($file, $section, xml_escape($contents));
+-		    $section = $section_default;
+-		    $contents = "";
+-		}
+-		$state = STATE_PROTO;
+-		$inline_doc_state = STATE_INLINE_NA;
+-	    # Regular text
+-	    } elsif (/$doc_content/) {
+-		if ($inline_doc_state == STATE_INLINE_TEXT) {
+-		    $contents .= $1 . "\n";
+-		    # nuke leading blank lines
+-		    if ($contents =~ /^\s*$/) {
+-			$contents = "";
+-		    }
+-		} elsif ($inline_doc_state == STATE_INLINE_NAME) {
+-		    $inline_doc_state = STATE_INLINE_ERROR;
+-		    print STDERR "${file}:$.: warning: ";
+-		    print STDERR "Incorrect use of kernel-doc format: $_";
+-		    ++$warnings;
+-		}
+-	    }
+-	} elsif ($state == STATE_PROTO) {	# scanning for function '{' (end of prototype)
+-	    if (/$doc_inline_oneline/) {
+-		$section = $1;
+-		$contents = $2;
+-		if ($contents ne "") {
+-		    $contents .= "\n";
+-		    dump_section($file, $section, xml_escape($contents));
+-		    $section = $section_default;
+-		    $contents = "";
+-		}
+-	    } elsif (/$doc_inline_start/) {
+-		$state = STATE_INLINE;
+-		$inline_doc_state = STATE_INLINE_NAME;
+-	    } elsif ($decl_type eq 'function') {
+-		process_proto_function($_, $file);
+-	    } else {
+-		process_proto_type($_, $file);
+-	    }
++	    process_inline($file, $_);
++	} elsif ($state == STATE_PROTO) {
++	    process_proto($file, $_);
+ 	} elsif ($state == STATE_DOCBLOCK) {
+-		if (/$doc_end/)
+-		{
+-			dump_doc_section($file, $section, xml_escape($contents));
+-			$section = $section_default;
+-			$contents = "";
+-			$function = "";
+-			%parameterdescs = ();
+-			%parametertypes = ();
+-			@parameterlist = ();
+-			%sections = ();
+-			@sectionlist = ();
+-			$prototype = "";
+-			$state = STATE_NORMAL;
+-		}
+-		elsif (/$doc_content/)
+-		{
+-			if ( $1 eq "" )
+-			{
+-				$contents .= $blankline;
+-			}
+-			else
+-			{
+-				$contents .= $1 . "\n";
+-			}
+-		}
++	    process_docblock($file, $_);
+ 	}
+     }
++
++    # Make sure we got something interesting.
+     if ($initial_section_counter == $section_counter) {
+ 	if ($output_mode ne "none") {
+ 	    print STDERR "${file}:1: warning: no structured comments found\n";
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch
deleted file mode 100644
index 17d2d91..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 526e539628e051128abf46a60ec22e18c9b5d84f Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Wed, 31 May 2017 15:03:02 -0500
-Subject: [PATCH 09/14] multipath: set verbosity to default during config
-
-condlog was setting the verbosity to 0 if there was no configuration.
-This keeps multipath from printing warning messages about config file
-problems that are found while loading the configuration. Instead, it
-should use the default config level until it loads the configuration
-to find the current value.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- libmultipath/debug.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libmultipath/debug.c b/libmultipath/debug.c
-index fbe171a..f89b264 100644
---- a/libmultipath/debug.c
-+++ b/libmultipath/debug.c
-@@ -11,6 +11,7 @@
- #include "../third-party/valgrind/drd.h"
- #include "vector.h"
- #include "config.h"
-+#include "defaults.h"
- 
- void dlog (int sink, int prio, const char * fmt, ...)
- {
-@@ -21,7 +22,7 @@ void dlog (int sink, int prio, const char * fmt, ...)
- 	va_start(ap, fmt);
- 	conf = get_multipath_config();
- 	ANNOTATE_IGNORE_READS_BEGIN();
--	thres = (conf) ? conf->verbosity : 0;
-+	thres = (conf) ? conf->verbosity : DEFAULT_VERBOSITY;
- 	ANNOTATE_IGNORE_READS_END();
- 	put_multipath_config(conf);
- 
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-configure-hitachi-ams2000-and-hus100.patch b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-configure-hitachi-ams2000-and-hus100.patch
new file mode 100644
index 0000000..2cae075
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-configure-hitachi-ams2000-and-hus100.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Mon, 14 May 2018 17:30:17 +0200
+Subject: [PATCH] multipath-tools: configure hitachi ams2000 and hus100 as full
+ active arrays
+
+AMS2000 and HUS100 families are active/active arrays.
+
+Based on https://support.hitachivantara.com/download/epcra/df818913.pdf
+and internal hitachi docs.
+
+Cc: Matthias Rudolph <Matthias.Rudolph@hitachivantara.com>
+Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
+Cc: DM-DEV ML <dm-devel@redhat.com>
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/hwtable.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
+index 2ca6888..148f0ba 100644
+--- a/libmultipath/hwtable.c
++++ b/libmultipath/hwtable.c
+@@ -398,13 +398,13 @@ static struct hwentry default_hw[] = {
+ 	 * Mail : matthias.rudolph@hds.com
+ 	 */
+ 	{
+-		/* USP-V, HUS VM, VSP, VSP G1X00 and VSP GX00 families */
++		/* USP-V, HUS VM, VSP, VSP G1X00 and VSP GX00 families / HP XP */
+ 		.vendor        = "(HITACHI|HP)",
+ 		.product       = "^OPEN-",
+ 		.pgpolicy      = MULTIBUS,
+ 	},
+ 	{
+-		/* AMS 2000 and HUS 100 families */
++		/* AMS other than AMS 2000 */
+ 		.vendor        = "HITACHI",
+ 		.product       = "^DF",
+ 		.no_path_retry = NO_PATH_RETRY_QUEUE,
+@@ -412,6 +412,12 @@ static struct hwentry default_hw[] = {
+ 		.pgfailback    = -FAILBACK_IMMEDIATE,
+ 		.prio_name     = PRIO_HDS,
+ 	},
++	{
++		/* AMS 2000 and HUS 100 families */
++		.vendor        = "HITACHI",
++		.product       = "^DF600F",
++		.pgpolicy      = MULTIBUS,
++	},
+ 	/*
+ 	 * IBM
+ 	 *
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0010-libmultipath-don-t-reject-maps-with-undefined-prio.patch b/meta-oe/recipes-support/multipath-tools/files/0010-libmultipath-don-t-reject-maps-with-undefined-prio.patch
new file mode 100644
index 0000000..2dda2ed
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0010-libmultipath-don-t-reject-maps-with-undefined-prio.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Martin Wilck <mwilck@suse.com>
+Date: Wed, 21 Mar 2018 10:34:18 +0100
+Subject: [PATCH] libmultipath: don't reject maps with undefined prio
+
+libmultipath's prio routines can deal with pp->priority == PRIO_UNDEF
+just fine. PRIO_UNDEF is just a very low priority. So there's
+no reason to reject setting up a multipath map because paths have
+undefined priority.
+
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/configure.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/libmultipath/configure.c b/libmultipath/configure.c
+index 5796683..5c54f9b 100644
+--- a/libmultipath/configure.c
++++ b/libmultipath/configure.c
+@@ -1063,9 +1063,6 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
+ 			continue;
+ 		}
+ 
+-		if (pp1->priority == PRIO_UNDEF)
+-			mpp->action = ACT_REJECT;
+-
+ 		if (!mpp->paths) {
+ 			condlog(0, "%s: skip coalesce (no paths)", mpp->alias);
+ 			remove_map(mpp, vecs, 0);
+@@ -1091,8 +1088,6 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
+ 					mpp->size);
+ 				mpp->action = ACT_REJECT;
+ 			}
+-			if (pp2->priority == PRIO_UNDEF)
+-				mpp->action = ACT_REJECT;
+ 		}
+ 		verify_paths(mpp, vecs);
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch b/meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch
deleted file mode 100644
index 396b6d3..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f88d60a93e98d86ae294f2317a122c4efde276f0 Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Wed, 31 May 2017 17:58:59 -0500
-Subject: [PATCH 10/14] mpath: skip device configs without vendor/product
-
-Right now if multipath.conf includes a device configuration without a
-vendor or product string, it will automatically be applied to all
-devices, skipping all other configs entirely.  This is clearly wrong.
-This patch makes sure that user added configs include vendor and
-product strings
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- libmultipath/config.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/libmultipath/config.c b/libmultipath/config.c
-index c485748..bdde113 100644
---- a/libmultipath/config.c
-+++ b/libmultipath/config.c
-@@ -452,6 +452,13 @@ restart:
- 			break;
- 		j = n;
- 		vector_foreach_slot_after(hw, hwe2, j) {
-+			/* drop invalid device configs */
-+			if (!hwe2->vendor || !hwe2->product) {
-+				condlog(0, "device config missing vendor or product parameter");
-+				vector_del_slot(hw, j--);
-+				free_hwe(hwe2);
-+				continue;
-+			}
- 			if (hwe_regmatch(hwe1, hwe2))
- 				continue;
- 			/* dup */
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch b/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch
deleted file mode 100644
index 12d6d38..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bc3ceda747104afdc24386df5dc45ca86f6c2936 Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Thu, 1 Jun 2017 17:52:28 -0500
-Subject: [PATCH 11/14] multipathd: fix "show maps json" crash
-
-If there are no multipath devices, show_maps_json sets the maximum size
-of the reply buffer to 0. Having a size of 0 causes the calls to calloc
-and realloc to behave in ways that the code isn't designed to handle,
-leading to a double-free crash. Instead, show_maps_json should just
-use the INITIAL_REPLY_LEN if there are no multipath devices.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
----
- multipathd/cli_handlers.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
-index 04c7386..7b0d00c 100644
---- a/multipathd/cli_handlers.c
-+++ b/multipathd/cli_handlers.c
-@@ -162,10 +162,12 @@ show_maps_json (char ** r, int * len, struct vectors * vecs)
- 	struct multipath * mpp;
- 	char * c;
- 	char * reply;
--	unsigned int maxlen = INITIAL_REPLY_LEN *
--			PRINT_JSON_MULTIPLIER * VECTOR_SIZE(vecs->mpvec);
-+	unsigned int maxlen = INITIAL_REPLY_LEN;
- 	int again = 1;
- 
-+	if (VECTOR_SIZE(vecs->mpvec) > 0)
-+		maxlen *= PRINT_JSON_MULTIPLIER * VECTOR_SIZE(vecs->mpvec);
-+
- 	vector_foreach_slot(vecs->mpvec, mpp, i) {
- 		if (update_multipath(vecs, mpp->alias, 0)) {
- 			return 1;
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-handle-errors-in-uxlsnr-as-fatal.patch b/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-handle-errors-in-uxlsnr-as-fatal.patch
new file mode 100644
index 0000000..96a814f
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-handle-errors-in-uxlsnr-as-fatal.patch
@@ -0,0 +1,57 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Martin Wilck <mwilck@suse.com>
+Date: Wed, 21 Mar 2018 10:34:19 +0100
+Subject: [PATCH] multipathd: handle errors in uxlsnr as fatal
+
+The ppoll() calls of the uxlsnr thread are vital for proper functioning of
+multipathd. If the uxlsnr thread can't open the socket or fails to call ppoll()
+for other reasons, quit the daemon. If we don't do that, multipathd may
+hang in a state where it can't be terminated any more, because the uxlsnr
+thread is responsible for handling all signals. This happens e.g. if
+systemd's multipathd.socket is running in and multipathd is started from
+outside systemd.
+
+24f2844 "multipathd: fix signal blocking logic" has made this problem more
+severe. Before that patch, the signals weren't actually blocked in any thread.
+That's not to say 24f2844 was wrong. I still think it's correct, we just
+need this one on top.
+
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ multipathd/uxlsnr.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
+index cdafd82..6f66666 100644
+--- a/multipathd/uxlsnr.c
++++ b/multipathd/uxlsnr.c
+@@ -178,7 +178,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, void * trigger_data)
+ 
+ 	if (ux_sock == -1) {
+ 		condlog(1, "could not create uxsock: %d", errno);
+-		return NULL;
++		exit_daemon();
+ 	}
+ 
+ 	pthread_cleanup_push(uxsock_cleanup, (void *)ux_sock);
+@@ -187,7 +187,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, void * trigger_data)
+ 	polls = (struct pollfd *)MALLOC((MIN_POLLS + 1) * sizeof(struct pollfd));
+ 	if (!polls) {
+ 		condlog(0, "uxsock: failed to allocate poll fds");
+-		return NULL;
++		exit_daemon();
+ 	}
+ 	sigfillset(&mask);
+ 	sigdelset(&mask, SIGINT);
+@@ -249,6 +249,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, void * trigger_data)
+ 
+ 			/* something went badly wrong! */
+ 			condlog(0, "uxsock: poll failed with %d", errno);
++			exit_daemon();
+ 			break;
+ 		}
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0012-libmultipath-fix-error-parsing-find_multipaths-stric.patch b/meta-oe/recipes-support/multipath-tools/files/0012-libmultipath-fix-error-parsing-find_multipaths-stric.patch
new file mode 100644
index 0000000..8ce2431
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0012-libmultipath-fix-error-parsing-find_multipaths-stric.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Martin Wilck <mwilck@suse.com>
+Date: Tue, 15 May 2018 14:32:44 +0200
+Subject: [PATCH] libmultipath: fix error parsing "find_multipaths strict"
+
+If "find_multipaths strict" is set in multipath.conf, the error message
+"illegal value for find_multipaths: strict" is printed. This causes no
+functional problem, as "strict" happens to be the default, fallback
+value. It should be fixed nonetheless. FIND_MULTIPATHS_STRICT, having
+the highest numeric value, must be last in the enum.
+
+Fixes: c36f2f42 "libmultipath: change find_multipaths option to multi-value"
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/structs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmultipath/structs.h b/libmultipath/structs.h
+index eb6a178..e424b15 100644
+--- a/libmultipath/structs.h
++++ b/libmultipath/structs.h
+@@ -122,9 +122,9 @@ enum find_multipaths_states {
+ 	FIND_MULTIPATHS_UNDEF = YNU_UNDEF,
+ 	FIND_MULTIPATHS_OFF = YNU_NO,
+ 	FIND_MULTIPATHS_ON = _FIND_MULTIPATHS_F,
+-	FIND_MULTIPATHS_STRICT = _FIND_MULTIPATHS_F|_FIND_MULTIPATHS_N,
+ 	FIND_MULTIPATHS_GREEDY = _FIND_MULTIPATHS_I,
+ 	FIND_MULTIPATHS_SMART = _FIND_MULTIPATHS_F|_FIND_MULTIPATHS_I,
++	FIND_MULTIPATHS_STRICT = _FIND_MULTIPATHS_F|_FIND_MULTIPATHS_N,
+ 	__FIND_MULTIPATHS_LAST,
+ };
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch b/meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
deleted file mode 100644
index 5ccd4ae..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6864ba28dec61609662ce5dc8bc7ed1925abb546 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 5 Jul 2017 02:56:13 -0400
-Subject: [PATCH 12/14] multipath-tools: modify Makefile.inc for
- cross-compilation
-
-Do not look for systemd info on the host, and allow us to pass in CFLAGS
-using the OPTFLAGS variable.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Update for version 0.5.0-144-g770e6d0
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Update for version 0.7.1
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.inc | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index e084fd1..c7f45fa 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -35,12 +35,6 @@ ifndef RUN
- 	endif
- endif
- 
--ifndef SYSTEMD
--	ifeq ($(shell systemctl --version > /dev/null 2>&1 && echo 1), 1)
--		SYSTEMD = $(shell systemctl --version 2> /dev/null |  sed -n 's/systemd \([0-9]*\)/\1/p')
--	endif
--endif
--
- ifndef SYSTEMDPATH
- 	SYSTEMDPATH=usr/lib
- endif
-@@ -82,11 +76,13 @@ TEST_CC_OPTION = $(shell \
- 
- STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
- 
-+ifndef OPTFLAGS
- OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
- 		  -Werror=implicit-function-declaration -Werror=format-security \
- 		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
- 		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
- 		  --param=ssp-buffer-size=4
-+endif
- 
- CFLAGS		= $(OPTFLAGS) -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\"
- BIN_CFLAGS	= -fPIE -DPIE
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0013-libmultipath-print-correct-default-for-delay_-_check.patch b/meta-oe/recipes-support/multipath-tools/files/0013-libmultipath-print-correct-default-for-delay_-_check.patch
new file mode 100644
index 0000000..c767804
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0013-libmultipath-print-correct-default-for-delay_-_check.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Mon, 7 May 2018 17:16:05 -0500
+Subject: [PATCH] libmultipath: print correct default for delay_*_checks
+
+These options default to "no", so they should display that when the
+config is printed.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/dict.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libmultipath/dict.c b/libmultipath/dict.c
+index 4040611..3e7c5d6 100644
+--- a/libmultipath/dict.c
++++ b/libmultipath/dict.c
+@@ -1115,7 +1115,8 @@ print_off_int_undef(char * buff, int len, long v)
+ }
+ 
+ declare_def_handler(delay_watch_checks, set_off_int_undef)
+-declare_def_snprint(delay_watch_checks, print_off_int_undef)
++declare_def_snprint_defint(delay_watch_checks, print_off_int_undef,
++			   DEFAULT_DELAY_CHECKS)
+ declare_ovr_handler(delay_watch_checks, set_off_int_undef)
+ declare_ovr_snprint(delay_watch_checks, print_off_int_undef)
+ declare_hw_handler(delay_watch_checks, set_off_int_undef)
+@@ -1123,7 +1124,8 @@ declare_hw_snprint(delay_watch_checks, print_off_int_undef)
+ declare_mp_handler(delay_watch_checks, set_off_int_undef)
+ declare_mp_snprint(delay_watch_checks, print_off_int_undef)
+ declare_def_handler(delay_wait_checks, set_off_int_undef)
+-declare_def_snprint(delay_wait_checks, print_off_int_undef)
++declare_def_snprint_defint(delay_wait_checks, print_off_int_undef,
++			   DEFAULT_DELAY_CHECKS)
+ declare_ovr_handler(delay_wait_checks, set_off_int_undef)
+ declare_ovr_snprint(delay_wait_checks, print_off_int_undef)
+ declare_hw_handler(delay_wait_checks, set_off_int_undef)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-multipath.conf.5-clarify-property-whitelist-handling.patch b/meta-oe/recipes-support/multipath-tools/files/0014-multipath.conf.5-clarify-property-whitelist-handling.patch
new file mode 100644
index 0000000..0ab4e06
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0014-multipath.conf.5-clarify-property-whitelist-handling.patch
@@ -0,0 +1,31 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 9 May 2018 14:32:59 -0500
+Subject: [PATCH] multipath.conf.5: clarify property whitelist handling
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ multipath/multipath.conf.5 | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
+index f689795..96d1b66 100644
+--- a/multipath/multipath.conf.5
++++ b/multipath/multipath.conf.5
+@@ -1181,10 +1181,9 @@ and
+ keywords. For a full description of these keywords please see the \fIdevices\fR
+ section description.
+ .LP
+-The \fIproperty\fR blacklist and whitelist handling is different from the usual
+-handling in the sense that the whitelist \fIhas\fR to be set, otherwise the
+-device will be blacklisted. In these cases the message \fIblacklisted, udev
+-property missing\fR will be displayed.
++The \fIproperty\fR whitelist handling is different from the usual
++handling in the sense that the device \fIhas\fR to have a udev property that
++matches the whitelist, otherwise the device will be blacklisted. In these cases the message \fIblacklisted, udev property missing\fR will be displayed.
+ .
+ .
+ .\" ----------------------------------------------------------------------------
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0015-mpathpersist-add-all_tg_pt-option.patch b/meta-oe/recipes-support/multipath-tools/files/0015-mpathpersist-add-all_tg_pt-option.patch
new file mode 100644
index 0000000..be2681d
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0015-mpathpersist-add-all_tg_pt-option.patch
@@ -0,0 +1,317 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 31 May 2018 17:47:11 -0500
+Subject: [PATCH] mpathpersist: add all_tg_pt option
+
+Some arrays, such as the EMC VNX, don't follow the scsi persistent
+reservations spec in making key registrations per I_T NEXUS. Instead,
+the registration is shared by all target ports connected to a given
+host.  This causes mpathpersist to fail whenever it tries to register a
+key, since it will receive a registration conflict on some of the paths.
+
+To deal with this, mpathpersist needs to track the hosts that it has
+done a registration on, and only register once per host. The new
+"all_tg_pt" multipath.conf option is used to set which arrays need this
+feature.  I currently don't know if all EMC VNX arrays handle persistent
+reservations like this, or if it is configurable. A future patch will
+update the VNX built-in config, if this is indeed their default (or
+only) setting.
+
+Multipathd doesn't need to worry about this. It is often the case that
+when a path device comes back, it will still have the keys registered to
+it. Because of this, multipathd uses register-and-ignore, which means
+that it won't cause an error if the registration has already happened
+down a different target port.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmpathpersist/mpath_persist.c | 28 ++++++++++++++++++++++------
+ libmultipath/config.c           |  2 ++
+ libmultipath/config.h           |  2 ++
+ libmultipath/defaults.h         |  1 +
+ libmultipath/dict.c             | 10 ++++++++++
+ libmultipath/propsel.c          | 15 +++++++++++++++
+ libmultipath/propsel.h          |  1 +
+ libmultipath/structs.h          |  7 +++++++
+ multipath/multipath.conf.5      | 11 +++++++++++
+ 9 files changed, 71 insertions(+), 6 deletions(-)
+
+diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
+index 907a17c..ca91c55 100644
+--- a/libmpathpersist/mpath_persist.c
++++ b/libmpathpersist/mpath_persist.c
+@@ -335,6 +335,7 @@ int mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
+ 
+ 	conf = get_multipath_config();
+ 	select_reservation_key(conf, mpp);
++	select_all_tg_pt(conf, mpp);
+ 	put_multipath_config(conf);
+ 
+ 	memcpy(&prkey, paramp->sa_key, 8);
+@@ -456,7 +457,7 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
+ 	unsigned int rq_type, struct prout_param_descriptor * paramp, int noisy)
+ {
+ 
+-	int i, j;
++	int i, j, k;
+ 	struct pathgroup *pgp = NULL;
+ 	struct path *pp = NULL;
+ 	int rollback = 0;
+@@ -481,11 +482,13 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
+ 	}
+ 
+ 	struct threadinfo thread[active_pathcount];
++	int hosts[active_pathcount];
+ 
+ 	memset(thread, 0, sizeof(thread));
+ 
+ 	/* init thread parameter */
+ 	for (i =0; i< active_pathcount; i++){
++		hosts[i] = -1;
+ 		thread[i].param.rq_servact = rq_servact;
+ 		thread[i].param.rq_scope = rq_scope;
+ 		thread[i].param.rq_type = rq_type;
+@@ -514,6 +517,17 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
+ 				condlog (1, "%s: %s path not up. Skip.", mpp->wwid, pp->dev);
+ 				continue;
+ 			}
++			if (mpp->all_tg_pt == ALL_TG_PT_ON &&
++			    pp->sg_id.host_no != -1) {
++				for (k = 0; k < count; k++) {
++					if (pp->sg_id.host_no == hosts[k]) {
++						condlog(3, "%s: %s host %d matches skip.", pp->wwid, pp->dev, pp->sg_id.host_no);
++						break;
++					}
++				}
++				if (k < count)
++					continue;
++			}
+ 			strncpy(thread[count].param.dev, pp->dev,
+ 				FILE_NAME_SIZE - 1);
+ 
+@@ -531,10 +545,12 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
+ 				condlog (0, "%s: failed to create thread %d", mpp->wwid, rc);
+ 				thread[count].param.status = MPATH_PR_THREAD_ERROR;
+ 			}
++			else
++				hosts[count] = pp->sg_id.host_no;
+ 			count = count + 1;
+ 		}
+ 	}
+-	for( i=0; i < active_pathcount ; i++){
++	for( i=0; i < count ; i++){
+ 		if (thread[i].param.status != MPATH_PR_THREAD_ERROR) {
+ 			rc = pthread_join(thread[i].id, NULL);
+ 			if (rc){
+@@ -557,7 +573,7 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
+ 	}
+ 	if (rollback && ((rq_servact == MPATH_PROUT_REG_SA) && sa_key != 0 )){
+ 		condlog (3, "%s: ERROR: initiating pr out rollback", mpp->wwid);
+-		for( i=0 ; i < active_pathcount ; i++){
++		for( i=0 ; i < count ; i++){
+ 			if(thread[i].param.status == MPATH_PR_SUCCESS) {
+ 				memcpy(&thread[i].param.paramp->key, &thread[i].param.paramp->sa_key, 8);
+ 				memset(&thread[i].param.paramp->sa_key, 0, 8);
+@@ -571,7 +587,7 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
+ 			} else
+ 				thread[i].param.status = MPATH_PR_SKIP;
+ 		}
+-		for(i=0; i < active_pathcount ; i++){
++		for(i=0; i < count ; i++){
+ 			if (thread[i].param.status != MPATH_PR_SKIP &&
+ 			    thread[i].param.status != MPATH_PR_THREAD_ERROR) {
+ 				rc = pthread_join(thread[i].id, NULL);
+@@ -720,7 +736,7 @@ int mpath_prout_rel(struct multipath *mpp,int rq_servact, int rq_scope,
+ 		}
+ 	}
+ 	pthread_attr_destroy (&attr);
+-	for (i = 0; i < active_pathcount; i++){
++	for (i = 0; i < count; i++){
+ 		if (thread[i].param.status != MPATH_PR_THREAD_ERROR) {
+ 			rc = pthread_join (thread[i].id, NULL);
+ 			if (rc){
+@@ -729,7 +745,7 @@ int mpath_prout_rel(struct multipath *mpp,int rq_servact, int rq_scope,
+ 		}
+ 	}
+ 
+-	for (i = 0; i < active_pathcount; i++){
++	for (i = 0; i < count; i++){
+ 		/*  check thread status here and return the status */
+ 
+ 		if (thread[i].param.status == MPATH_PR_RESERV_CONFLICT)
+diff --git a/libmultipath/config.c b/libmultipath/config.c
+index 085a3e1..5872927 100644
+--- a/libmultipath/config.c
++++ b/libmultipath/config.c
+@@ -352,6 +352,7 @@ merge_hwe (struct hwentry * dst, struct hwentry * src)
+ 	merge_num(skip_kpartx);
+ 	merge_num(max_sectors_kb);
+ 	merge_num(ghost_delay);
++	merge_num(all_tg_pt);
+ 
+ 	snprintf(id, sizeof(id), "%s/%s", dst->vendor, dst->product);
+ 	reconcile_features_with_options(id, &dst->features,
+@@ -622,6 +623,7 @@ load_config (char * file)
+ 	conf->disable_changed_wwids = DEFAULT_DISABLE_CHANGED_WWIDS;
+ 	conf->remove_retries = 0;
+ 	conf->ghost_delay = DEFAULT_GHOST_DELAY;
++	conf->all_tg_pt = DEFAULT_ALL_TG_PT;
+ 
+ 	/*
+ 	 * preload default hwtable
+diff --git a/libmultipath/config.h b/libmultipath/config.h
+index 6e69a37..1bf708a 100644
+--- a/libmultipath/config.h
++++ b/libmultipath/config.h
+@@ -82,6 +82,7 @@ struct hwentry {
+ 	int skip_kpartx;
+ 	int max_sectors_kb;
+ 	int ghost_delay;
++	int all_tg_pt;
+ 	char * bl_product;
+ };
+ 
+@@ -194,6 +195,7 @@ struct config {
+ 	char * partition_delim;
+ 	char * config_dir;
+ 	int prkey_source;
++	int all_tg_pt;
+ 	struct be64 reservation_key;
+ 
+ 	vector keywords;
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
+index d7b87b4..f076b4b 100644
+--- a/libmultipath/defaults.h
++++ b/libmultipath/defaults.h
+@@ -43,6 +43,7 @@
+ #define DEFAULT_GHOST_DELAY GHOST_DELAY_OFF
+ #define DEFAULT_FIND_MULTIPATHS_TIMEOUT -10
+ #define DEFAULT_UNKNOWN_FIND_MULTIPATHS_TIMEOUT 1
++#define DEFAULT_ALL_TG_PT ALL_TG_PT_OFF
+ 
+ #define DEFAULT_CHECKINT	5
+ #define MAX_CHECKINT(a)		(a << 2)
+diff --git a/libmultipath/dict.c b/libmultipath/dict.c
+index 3e7c5d6..2557b8a 100644
+--- a/libmultipath/dict.c
++++ b/libmultipath/dict.c
+@@ -1178,6 +1178,13 @@ declare_hw_snprint(ghost_delay, print_off_int_undef)
+ declare_mp_handler(ghost_delay, set_off_int_undef)
+ declare_mp_snprint(ghost_delay, print_off_int_undef)
+ 
++declare_def_handler(all_tg_pt, set_yes_no_undef)
++declare_def_snprint_defint(all_tg_pt, print_yes_no_undef, DEFAULT_ALL_TG_PT)
++declare_ovr_handler(all_tg_pt, set_yes_no_undef)
++declare_ovr_snprint(all_tg_pt, print_yes_no_undef)
++declare_hw_handler(all_tg_pt, set_yes_no_undef)
++declare_hw_snprint(all_tg_pt, print_yes_no_undef)
++
+ 
+ static int
+ def_uxsock_timeout_handler(struct config *conf, vector strvec)
+@@ -1509,6 +1516,7 @@ init_keywords(vector keywords)
+ 	install_keyword("prkeys_file", &def_prkeys_file_handler, &snprint_def_prkeys_file);
+ 	install_keyword("log_checker_err", &def_log_checker_err_handler, &snprint_def_log_checker_err);
+ 	install_keyword("reservation_key", &def_reservation_key_handler, &snprint_def_reservation_key);
++	install_keyword("all_tg_pt", &def_all_tg_pt_handler, &snprint_def_all_tg_pt);
+ 	install_keyword("retain_attached_hw_handler", &def_retain_hwhandler_handler, &snprint_def_retain_hwhandler);
+ 	install_keyword("detect_prio", &def_detect_prio_handler, &snprint_def_detect_prio);
+ 	install_keyword("detect_checker", &def_detect_checker_handler, &snprint_def_detect_checker);
+@@ -1618,6 +1626,7 @@ init_keywords(vector keywords)
+ 	install_keyword("skip_kpartx", &hw_skip_kpartx_handler, &snprint_hw_skip_kpartx);
+ 	install_keyword("max_sectors_kb", &hw_max_sectors_kb_handler, &snprint_hw_max_sectors_kb);
+ 	install_keyword("ghost_delay", &hw_ghost_delay_handler, &snprint_hw_ghost_delay);
++	install_keyword("all_tg_pt", &hw_all_tg_pt_handler, &snprint_hw_all_tg_pt);
+ 	install_sublevel_end();
+ 
+ 	install_keyword_root("overrides", &overrides_handler);
+@@ -1654,6 +1663,7 @@ init_keywords(vector keywords)
+ 	install_keyword("skip_kpartx", &ovr_skip_kpartx_handler, &snprint_ovr_skip_kpartx);
+ 	install_keyword("max_sectors_kb", &ovr_max_sectors_kb_handler, &snprint_ovr_max_sectors_kb);
+ 	install_keyword("ghost_delay", &ovr_ghost_delay_handler, &snprint_ovr_ghost_delay);
++	install_keyword("all_tg_pt", &ovr_all_tg_pt_handler, &snprint_ovr_all_tg_pt);
+ 
+ 	install_keyword_root("multipaths", &multipaths_handler);
+ 	install_keyword_multi("multipath", &multipath_handler, NULL);
+diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
+index 627d366..9ca1355 100644
+--- a/libmultipath/propsel.c
++++ b/libmultipath/propsel.c
+@@ -978,3 +978,18 @@ out:
+ 		pp->dev, pp->find_multipaths_timeout, origin);
+ 	return 0;
+ }
++
++int select_all_tg_pt (struct config *conf, struct multipath * mp)
++{
++	const char *origin;
++
++	mp_set_ovr(all_tg_pt);
++	mp_set_hwe(all_tg_pt);
++	mp_set_conf(all_tg_pt);
++	mp_set_default(all_tg_pt, DEFAULT_ALL_TG_PT);
++out:
++	condlog(3, "%s: all_tg_pt = %s %s", mp->alias,
++		(mp->all_tg_pt == ALL_TG_PT_ON)? "yes" : "no",
++		origin);
++	return 0;
++}
+diff --git a/libmultipath/propsel.h b/libmultipath/propsel.h
+index a022bee..ae99b92 100644
+--- a/libmultipath/propsel.h
++++ b/libmultipath/propsel.h
+@@ -34,3 +34,4 @@ int select_ghost_delay(struct config *conf, struct multipath * mp);
+ void reconcile_features_with_options(const char *id, char **features,
+ 				     int* no_path_retry,
+ 				     int *retain_hwhandler);
++int select_all_tg_pt (struct config *conf, struct multipath * mp);
+diff --git a/libmultipath/structs.h b/libmultipath/structs.h
+index e424b15..0194b1e 100644
+--- a/libmultipath/structs.h
++++ b/libmultipath/structs.h
+@@ -217,6 +217,12 @@ enum prkey_sources {
+ 	PRKEY_SOURCE_FILE,
+ };
+ 
++enum all_tg_pt_states {
++	ALL_TG_PT_UNDEF = YNU_UNDEF,
++	ALL_TG_PT_OFF = YNU_NO,
++	ALL_TG_PT_ON = YNU_YES,
++};
++
+ struct sg_id {
+ 	int host_no;
+ 	int channel;
+@@ -362,6 +368,7 @@ struct multipath {
+ 	int prkey_source;
+ 	struct be64 reservation_key;
+ 	unsigned char prflag;
++	int all_tg_pt;
+ 	struct gen_multipath generic_mp;
+ };
+ 
+diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
+index 96d1b66..0c1f174 100644
+--- a/multipath/multipath.conf.5
++++ b/multipath/multipath.conf.5
+@@ -743,6 +743,17 @@ The default is: \fB<unset>\fR
+ .
+ .
+ .TP
++.B all_tg_pt
++This must be set to \fByes\fR to successfully use mpathpersist on arrays that
++automatically set and clear registration keys on all target ports from a
++host, instead of per target port per host.
++.RS
++.TP
++The default is: \fBno\fR
++.RE
++.
++.
++.TP
+ .B retain_attached_hw_handler
+ (Obsolete for kernels >= 4.3) If set to
+ .I yes
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0016-libmultipath-remove-rbd-code.patch b/meta-oe/recipes-support/multipath-tools/files/0016-libmultipath-remove-rbd-code.patch
new file mode 100644
index 0000000..8d19547
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0016-libmultipath-remove-rbd-code.patch
@@ -0,0 +1,1093 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Fri, 1 Jun 2018 16:30:44 -0500
+Subject: [PATCH] libmultipath: remove rbd code
+
+The Ceph tean has asked to drop support for multipathed rbd, since it
+was running into data corruption issues. There was never an upstream
+Ceph release based on it, and because of the corruption, there should be
+no users of this code. This patch simply reverts all the rbd code from
+multipath.
+
+Cc: Michael Christie <mchristi@redhat.com>
+Cc: Jason Dillaman <dillaman@redhat.com>
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/checkers.c              |  22 --
+ libmultipath/checkers.h              |   6 -
+ libmultipath/checkers/Makefile       |   7 -
+ libmultipath/checkers/cciss_tur.c    |   5 -
+ libmultipath/checkers/directio.c     |   5 -
+ libmultipath/checkers/emc_clariion.c |   5 -
+ libmultipath/checkers/hp_sw.c        |   5 -
+ libmultipath/checkers/rbd.c          | 653 -----------------------------------
+ libmultipath/checkers/rdac.c         |   5 -
+ libmultipath/checkers/readsector0.c  |   5 -
+ libmultipath/checkers/tur.c          |   5 -
+ libmultipath/discovery.c             |  70 ----
+ libmultipath/hwtable.c               |  12 -
+ multipath/multipath.conf.5           |   3 -
+ multipathd/main.c                    |  11 -
+ 15 files changed, 819 deletions(-)
+ delete mode 100644 libmultipath/checkers/rbd.c
+
+diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
+index 08cdfc3..0bacc86 100644
+--- a/libmultipath/checkers.c
++++ b/libmultipath/checkers.c
+@@ -141,13 +141,6 @@ struct checker * add_checker (char *multipath_dir, char * name)
+ 	if (!c->free)
+ 		goto out;
+ 
+-	c->repair = (void (*)(struct checker *)) dlsym(c->handle,
+-						       "libcheck_repair");
+-	errstr = dlerror();
+-	if (errstr != NULL)
+-		condlog(0, "A dynamic linking error occurred: (%s)", errstr);
+-	if (!c->repair)
+-		goto out;
+ done:
+ 	c->fd = -1;
+ 	c->sync = 1;
+@@ -222,20 +215,6 @@ void checker_put (struct checker * dst)
+ 	free_checker(src);
+ }
+ 
+-void checker_repair (struct checker * c)
+-{
+-	if (!checker_selected(c))
+-		return;
+-
+-	c->message[0] = '\0';
+-	if (c->disable) {
+-		MSG(c, "checker disabled");
+-		return;
+-	}
+-	if (c->repair)
+-		c->repair(c);
+-}
+-
+ int checker_check (struct checker * c, int path_state)
+ {
+ 	int r;
+@@ -310,7 +289,6 @@ void checker_get (char *multipath_dir, struct checker * dst, char * name)
+ 	dst->sync = src->sync;
+ 	strncpy(dst->name, src->name, CHECKER_NAME_LEN);
+ 	strncpy(dst->message, src->message, CHECKER_MSG_LEN);
+-	dst->repair = src->repair;
+ 	dst->check = src->check;
+ 	dst->init = src->init;
+ 	dst->free = src->free;
+diff --git a/libmultipath/checkers.h b/libmultipath/checkers.h
+index 52154ca..7b18a1a 100644
+--- a/libmultipath/checkers.h
++++ b/libmultipath/checkers.h
+@@ -86,7 +86,6 @@ enum path_check_state {
+ #define READSECTOR0  "readsector0"
+ #define CCISS_TUR    "cciss_tur"
+ #define NONE         "none"
+-#define RBD          "rbd"
+ 
+ #define ASYNC_TIMEOUT_SEC	30
+ 
+@@ -113,9 +112,6 @@ struct checker {
+ 						multipath-wide. Use MALLOC if
+ 						you want to stuff data in. */
+ 	int (*check)(struct checker *);
+-	void (*repair)(struct checker *);    /* called if check returns
+-						PATH_DOWN to bring path into
+-						usable state */
+ 	int (*init)(struct checker *);       /* to allocate the context */
+ 	void (*free)(struct checker *);      /* to free the context */
+ };
+@@ -136,7 +132,6 @@ void checker_set_async (struct checker *);
+ void checker_set_fd (struct checker *, int);
+ void checker_enable (struct checker *);
+ void checker_disable (struct checker *);
+-void checker_repair (struct checker *);
+ int checker_check (struct checker *, int);
+ int checker_selected (struct checker *);
+ char * checker_name (struct checker *);
+@@ -148,6 +143,5 @@ void checker_get (char *, struct checker *, char *);
+ int libcheck_check(struct checker *);
+ int libcheck_init(struct checker *);
+ void libcheck_free(struct checker *);
+-void libcheck_repair(struct checker *);
+ 
+ #endif /* _CHECKERS_H */
+diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
+index 87c15bd..02caea6 100644
+--- a/libmultipath/checkers/Makefile
++++ b/libmultipath/checkers/Makefile
+@@ -15,15 +15,8 @@ LIBS= \
+ 	libcheckhp_sw.so \
+ 	libcheckrdac.so
+ 
+-ifneq ($(call check_file,/usr/include/rados/librados.h),0)
+-LIBS += libcheckrbd.so
+-endif
+-
+ all: $(LIBS)
+ 
+-libcheckrbd.so: rbd.o
+-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ -lrados -ludev
+-
+ libcheckdirectio.so: libsg.o directio.o
+ 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ -laio
+ 
+diff --git a/libmultipath/checkers/cciss_tur.c b/libmultipath/checkers/cciss_tur.c
+index 436470c..1cab201 100644
+--- a/libmultipath/checkers/cciss_tur.c
++++ b/libmultipath/checkers/cciss_tur.c
+@@ -59,11 +59,6 @@ void libcheck_free (struct checker * c)
+ 	return;
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ int libcheck_check(struct checker * c)
+ {
+ 	int rc;
+diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
+index ce60e4c..a80848d 100644
+--- a/libmultipath/checkers/directio.c
++++ b/libmultipath/checkers/directio.c
+@@ -118,11 +118,6 @@ void libcheck_free (struct checker * c)
+ 	free(ct);
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ static int
+ check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
+ {
+diff --git a/libmultipath/checkers/emc_clariion.c b/libmultipath/checkers/emc_clariion.c
+index 9c1ffed..9115b1b 100644
+--- a/libmultipath/checkers/emc_clariion.c
++++ b/libmultipath/checkers/emc_clariion.c
+@@ -90,11 +90,6 @@ void libcheck_free (struct checker * c)
+ 	free(c->context);
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ int libcheck_check (struct checker * c)
+ {
+ 	unsigned char sense_buffer[128] = { 0, };
+diff --git a/libmultipath/checkers/hp_sw.c b/libmultipath/checkers/hp_sw.c
+index cee9aab..0ad34a6 100644
+--- a/libmultipath/checkers/hp_sw.c
++++ b/libmultipath/checkers/hp_sw.c
+@@ -45,11 +45,6 @@ void libcheck_free (struct checker * c)
+ 	return;
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ static int
+ do_inq(int sg_fd, int cmddt, int evpd, unsigned int pg_op,
+        void *resp, int mx_resp_len, int noisy, unsigned int timeout)
+diff --git a/libmultipath/checkers/rbd.c b/libmultipath/checkers/rbd.c
+deleted file mode 100644
+index 4ff54f4..0000000
+--- a/libmultipath/checkers/rbd.c
++++ /dev/null
+@@ -1,653 +0,0 @@
+-/*
+- * Copyright (c) 2016 Red Hat
+- * Copyright (c) 2004 Christophe Varoqui
+- *
+- * Code based off of tur.c and ceph's krbd.cc
+- */
+-#define _GNU_SOURCE
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <unistd.h>
+-#include <fcntl.h>
+-#include <errno.h>
+-#include <pthread.h>
+-#include <libudev.h>
+-#include <ifaddrs.h>
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <sys/ioctl.h>
+-#include <sys/time.h>
+-#include <sys/wait.h>
+-#include <urcu.h>
+-
+-#include "rados/librados.h"
+-
+-#include "structs.h"
+-#include "checkers.h"
+-
+-#include "../libmultipath/debug.h"
+-#include "../libmultipath/util.h"
+-#include "../libmultipath/time-util.h"
+-#include "../libmultipath/util.h"
+-
+-struct rbd_checker_context;
+-typedef int (thread_fn)(struct rbd_checker_context *ct, char *msg);
+-
+-#define RBD_MSG(msg, fmt, args...) snprintf(msg, CHECKER_MSG_LEN, fmt, ##args);
+-
+-#define RBD_FEATURE_EXCLUSIVE_LOCK	(1 << 2)
+-
+-struct rbd_checker_context {
+-	int rbd_bus_id;
+-	char *client_addr;
+-	char *config_info;
+-	char *snap;
+-	char *pool;
+-	char *image;
+-	char *username;
+-	int remapped;
+-	int blacklisted;
+-	unsigned lock_on_read:1;
+-
+-	rados_t cluster;
+-
+-	int state;
+-	int running;
+-	time_t time;
+-	thread_fn *fn;
+-	pthread_t thread;
+-	pthread_mutex_t lock;
+-	pthread_cond_t active;
+-	pthread_spinlock_t hldr_lock;
+-	int holders;
+-	char message[CHECKER_MSG_LEN];
+-};
+-
+-int libcheck_init(struct checker * c)
+-{
+-	struct rbd_checker_context *ct;
+-	struct udev_device *block_dev;
+-	struct udev_device *bus_dev;
+-	struct udev *udev;
+-	struct stat sb;
+-	const char *block_name, *addr, *config_info, *features_str;
+-	const char *image, *pool, *snap, *username;
+-	uint64_t features = 0;
+-	char sysfs_path[PATH_SIZE];
+-	int ret;
+-
+-	ct = malloc(sizeof(struct rbd_checker_context));
+-	if (!ct)
+-		return 1;
+-	memset(ct, 0, sizeof(struct rbd_checker_context));
+-	ct->holders = 1;
+-	pthread_cond_init_mono(&ct->active);
+-	pthread_mutex_init(&ct->lock, NULL);
+-	pthread_spin_init(&ct->hldr_lock, PTHREAD_PROCESS_PRIVATE);
+-	c->context = ct;
+-
+-	/*
+-	 * The rbd block layer sysfs device is not linked to the rbd bus
+-	 * device that we interact with, so figure that out now.
+-	 */
+-	if (fstat(c->fd, &sb) != 0)
+-		goto free_ct;
+-
+-	udev = udev_new();
+-	if (!udev)
+-		goto free_ct;
+-
+-	block_dev = udev_device_new_from_devnum(udev, 'b', sb.st_rdev);
+-	if (!block_dev)
+-		goto free_udev;
+-
+-	block_name  = udev_device_get_sysname(block_dev);
+-	ret = sscanf(block_name, "rbd%d", &ct->rbd_bus_id);
+-
+-	udev_device_unref(block_dev);
+-	if (ret != 1)
+-		goto free_udev;
+-
+-	snprintf(sysfs_path, sizeof(sysfs_path), "/sys/bus/rbd/devices/%d",
+-		 ct->rbd_bus_id);
+-	bus_dev = udev_device_new_from_syspath(udev, sysfs_path);
+-	if (!bus_dev)
+-		goto free_udev;
+-
+-	addr = udev_device_get_sysattr_value(bus_dev, "client_addr");
+-	if (!addr) {
+-		condlog(0, "rbd%d: Could not find client_addr in rbd sysfs. "
+-			"Try updating kernel", ct->rbd_bus_id);
+-		goto free_dev;
+-	}
+-
+-	ct->client_addr = strdup(addr);
+-	if (!ct->client_addr)
+-		goto free_dev;
+-
+-	features_str = udev_device_get_sysattr_value(bus_dev, "features");
+-	if (!features_str)
+-		goto free_addr;
+-	features = strtoll(features_str, NULL, 16);
+-	if (!(features & RBD_FEATURE_EXCLUSIVE_LOCK)) {
+-		condlog(3, "rbd%d: Exclusive lock not set.", ct->rbd_bus_id);
+-		goto free_addr;
+-	}
+-
+-	config_info = udev_device_get_sysattr_value(bus_dev, "config_info");
+-	if (!config_info)
+-		goto free_addr;
+-
+-	if (!strstr(config_info, "noshare")) {
+-		condlog(3, "rbd%d: Only nonshared clients supported.",
+-			ct->rbd_bus_id);
+-		goto free_addr;
+-	}
+-
+-	if (strstr(config_info, "lock_on_read"))
+-		ct->lock_on_read = 1;
+-
+-	ct->config_info = strdup(config_info);
+-	if (!ct->config_info)
+-		goto free_addr;
+-
+-	username = strstr(config_info, "name=");
+-	if (username) {
+-		char *end;
+-		int len;
+-
+-		username += 5;
+-		end = strchr(username, ',');
+-		if (!end)
+-			goto free_info;
+-		len = end - username;
+-
+-		ct->username = malloc(len + 1);
+-		if (!ct->username)
+-			goto free_info;
+-		strncpy(ct->username, username, len);
+-		ct->username[len] = '\0';
+-	}
+-
+-	image = udev_device_get_sysattr_value(bus_dev, "name");
+-	if (!image)
+-		goto free_username;
+-
+-	ct->image = strdup(image);
+-	if (!ct->image)
+-		goto free_username;
+-
+-	pool = udev_device_get_sysattr_value(bus_dev, "pool");
+-	if (!pool)
+-		goto free_image;
+-
+-	ct->pool = strdup(pool);
+-	if (!ct->pool)
+-		goto free_image;
+-
+-	snap = udev_device_get_sysattr_value(bus_dev, "current_snap");
+-	if (!snap)
+-		goto free_pool;
+-
+-	if (strcmp("-", snap)) {
+-		ct->snap = strdup(snap);
+-		if (!ct->snap)
+-			goto free_pool;
+-	}
+-
+-	if (rados_create(&ct->cluster, NULL) < 0) {
+-		condlog(0, "rbd%d: Could not create rados cluster",
+-			ct->rbd_bus_id);
+-		goto free_snap;
+-	}
+-
+-	if (rados_conf_read_file(ct->cluster, NULL) < 0) {
+-		condlog(0, "rbd%d: Could not read rados conf", ct->rbd_bus_id);
+-		goto shutdown_rados;
+-	}
+-
+-	ret = rados_connect(ct->cluster);
+-	if (ret < 0) {
+-		condlog(0, "rbd%d: Could not connect to rados cluster",
+-			ct->rbd_bus_id);
+-		goto shutdown_rados;
+-	}
+-
+-	udev_device_unref(bus_dev);
+-	udev_unref(udev);
+-
+-	condlog(3, "rbd%d checker init %s %s/%s@%s %s", ct->rbd_bus_id,
+-		ct->client_addr, ct->pool, ct->image, ct->snap ? ct->snap : "-",
+-		ct->username ? ct->username : "none");
+-	return 0;
+-
+-shutdown_rados:
+-	rados_shutdown(ct->cluster);
+-free_snap:
+-	if (ct->snap)
+-		free(ct->snap);
+-free_pool:
+-	free(ct->pool);
+-free_image:
+-	free(ct->image);
+-free_username:
+-	if (ct->username)
+-		free(ct->username);
+-free_info:
+-	free(ct->config_info);
+-free_addr:
+-	free(ct->client_addr);
+-free_dev:
+-	udev_device_unref(bus_dev);
+-free_udev:
+-	udev_unref(udev);
+-free_ct:
+-	free(ct);
+-	return 1;
+-}
+-
+-static void cleanup_context(struct rbd_checker_context *ct)
+-{
+-	pthread_mutex_destroy(&ct->lock);
+-	pthread_cond_destroy(&ct->active);
+-	pthread_spin_destroy(&ct->hldr_lock);
+-
+-	rados_shutdown(ct->cluster);
+-
+-	if (ct->username)
+-		free(ct->username);
+-	if (ct->snap)
+-		free(ct->snap);
+-	free(ct->pool);
+-	free(ct->image);
+-	free(ct->config_info);
+-	free(ct->client_addr);
+-	free(ct);
+-}
+-
+-void libcheck_free(struct checker * c)
+-{
+-	if (c->context) {
+-		struct rbd_checker_context *ct = c->context;
+-		int holders;
+-		pthread_t thread;
+-
+-		pthread_spin_lock(&ct->hldr_lock);
+-		ct->holders--;
+-		holders = ct->holders;
+-		thread = ct->thread;
+-		pthread_spin_unlock(&ct->hldr_lock);
+-		if (holders)
+-			pthread_cancel(thread);
+-		else
+-			cleanup_context(ct);
+-		c->context = NULL;
+-	}
+-}
+-
+-static int rbd_is_blacklisted(struct rbd_checker_context *ct, char *msg)
+-{
+-	char *addr_tok, *start, *save;
+-	const char *cmd[2];
+-	char *blklist, *stat;
+-	size_t blklist_len, stat_len;
+-	int ret;
+-	char *end;
+-
+-	cmd[0] = "{\"prefix\": \"osd blacklist ls\"}";
+-	cmd[1] = NULL;
+-
+-	ret = rados_mon_command(ct->cluster, (const char **)cmd, 1, "", 0,
+-				&blklist, &blklist_len, &stat, &stat_len);
+-	if (ret < 0) {
+-		RBD_MSG(msg, "checker failed: mon command failed %d", ret);
+-		return ret;
+-	}
+-
+-	if (!blklist || !blklist_len)
+-		goto free_bufs;
+-
+-	/*
+-	 * parse list of addrs with the format
+-	 * ipv4:port/nonce date time\n
+-	 * or
+-	 * [ipv6]:port/nonce date time\n
+-	 */
+-	ret = 0;
+-	for (start = blklist; ; start = NULL) {
+-		addr_tok = strtok_r(start, "\n", &save);
+-		if (!addr_tok || !strlen(addr_tok))
+-			break;
+-
+-		end = strchr(addr_tok, ' ');
+-		if (!end) {
+-			RBD_MSG(msg, "checker failed: invalid blacklist %s",
+-				 addr_tok);
+-			break;
+-		}
+-		*end = '\0';
+-
+-		if (!strcmp(addr_tok, ct->client_addr)) {
+-			ct->blacklisted = 1;
+-			RBD_MSG(msg, "%s is blacklisted", ct->client_addr);
+-			ret = 1;
+-			break;
+-		}
+-	}
+-
+-free_bufs:
+-	rados_buffer_free(blklist);
+-	rados_buffer_free(stat);
+-	return ret;
+-}
+-
+-static int rbd_check(struct rbd_checker_context *ct, char *msg)
+-{
+-	if (ct->blacklisted || rbd_is_blacklisted(ct, msg) == 1)
+-		return PATH_DOWN;
+-
+-	RBD_MSG(msg, "checker reports path is up");
+-	/*
+-	 * Path may have issues, but the ceph cluster is at least
+-	 * accepting IO, so we can attempt to do IO.
+-	 *
+-	 * TODO: in future versions, we can run other tests to
+-	 * verify OSDs and networks.
+-	 */
+-	return PATH_UP;
+-}
+-
+-static int sysfs_write_rbd_bus(const char *which, const char *buf,
+-			       size_t buf_len)
+-{
+-	char sysfs_path[PATH_SIZE];
+-	int fd;
+-	int r;
+-
+-	/* we require newer kernels so single_major should always be there */
+-	snprintf(sysfs_path, sizeof(sysfs_path),
+-		 "/sys/bus/rbd/%s_single_major", which);
+-	fd = open(sysfs_path, O_WRONLY);
+-	if (fd < 0)
+-		return -errno;
+-
+-	r = safe_write(fd, buf, buf_len);
+-	close(fd);
+-	return r;
+-}
+-
+-static int rbd_remap(struct rbd_checker_context *ct)
+-{
+-	char *argv[11];
+-	pid_t pid;
+-	int ret = 0, i = 0;
+-	int status;
+-
+-	pid = fork();
+-	switch (pid) {
+-	case 0:
+-		argv[i++] = "rbd";
+-		argv[i++] = "map";
+-		if (ct->lock_on_read)
+-			argv[i++] = "-o noshare,lock_on_read";
+-		else
+-			argv[i++] = "-o noshare";
+-		if (ct->username) {
+-			argv[i++] = "--id";
+-			argv[i++] = ct->username;
+-		}
+-		argv[i++] = "--pool";
+-		argv[i++] = ct->pool;
+-		if (ct->snap) {
+-			argv[i++] = "--snap";
+-			argv[i++] = ct->snap;
+-		}
+-		argv[i++] = ct->image;
+-		argv[i] = NULL;
+-
+-		ret = execvp(argv[0], argv);
+-		condlog(0, "rbd%d: Error executing rbd: %s", ct->rbd_bus_id,
+-			strerror(errno));
+-		exit(-1);
+-	case -1:
+-		condlog(0, "rbd%d: fork failed: %s", ct->rbd_bus_id,
+-			strerror(errno));
+-		return -1;
+-	default:
+-		ret = -1;
+-		wait(&status);
+-		if (WIFEXITED(status)) {
+-			status = WEXITSTATUS(status);
+-			if (status == 0)
+-				ret = 0;
+-			else
+-				condlog(0, "rbd%d: failed with %d",
+-					ct->rbd_bus_id, status);
+-		}
+-	}
+-
+-	return ret;
+-}
+-
+-static int sysfs_write_rbd_remove(const char *buf, int buf_len)
+-{
+-	return sysfs_write_rbd_bus("remove", buf, buf_len);
+-}
+-
+-static int rbd_rm_blacklist(struct rbd_checker_context *ct)
+-{
+-	const char *cmd[2];
+-	char *stat, *cmd_str;
+-	size_t stat_len;
+-	int ret;
+-
+-	ret = asprintf(&cmd_str, "{\"prefix\": \"osd blacklist\", \"blacklistop\": \"rm\", \"addr\": \"%s\"}",
+-		       ct->client_addr);
+-	if (ret == -1)
+-		return -ENOMEM;
+-
+-	cmd[0] = cmd_str;
+-	cmd[1] = NULL;
+-
+-	ret = rados_mon_command(ct->cluster, (const char **)cmd, 1, "", 0,
+-				NULL, NULL, &stat, &stat_len);
+-	if (ret < 0) {
+-		condlog(1, "rbd%d: repair failed to remove blacklist for %s %d",
+-			ct->rbd_bus_id, ct->client_addr, ret);
+-		goto free_cmd;
+-	}
+-
+-	condlog(1, "rbd%d: repair rm blacklist for %s",
+-	       ct->rbd_bus_id, ct->client_addr);
+-	free(stat);
+-free_cmd:
+-	free(cmd_str);
+-	return ret;
+-}
+-
+-static int rbd_repair(struct rbd_checker_context *ct, char *msg)
+-{
+-	char del[17];
+-	int ret;
+-
+-	if (!ct->blacklisted)
+-		return PATH_UP;
+-
+-	if (!ct->remapped) {
+-		ret = rbd_remap(ct);
+-		if (ret) {
+-			RBD_MSG(msg, "repair failed to remap. Err %d", ret);
+-			return PATH_DOWN;
+-		}
+-	}
+-	ct->remapped = 1;
+-
+-	snprintf(del, sizeof(del), "%d force", ct->rbd_bus_id);
+-	ret = sysfs_write_rbd_remove(del, strlen(del) + 1);
+-	if (ret) {
+-		RBD_MSG(msg, "repair failed to clean up. Err %d", ret);
+-		return PATH_DOWN;
+-	}
+-
+-	ret = rbd_rm_blacklist(ct);
+-	if (ret) {
+-		RBD_MSG(msg, "repair could not remove blacklist entry. Err %d",
+-			ret);
+-		return PATH_DOWN;
+-	}
+-
+-	ct->remapped = 0;
+-	ct->blacklisted = 0;
+-
+-	RBD_MSG(msg, "has been repaired");
+-	return PATH_UP;
+-}
+-
+-#define rbd_thread_cleanup_push(ct) pthread_cleanup_push(cleanup_func, ct)
+-#define rbd_thread_cleanup_pop(ct) pthread_cleanup_pop(1)
+-
+-static void cleanup_func(void *data)
+-{
+-	int holders;
+-	struct rbd_checker_context *ct = data;
+-	pthread_spin_lock(&ct->hldr_lock);
+-	ct->holders--;
+-	holders = ct->holders;
+-	ct->thread = 0;
+-	pthread_spin_unlock(&ct->hldr_lock);
+-	if (!holders)
+-		cleanup_context(ct);
+-	rcu_unregister_thread();
+-}
+-
+-static void *rbd_thread(void *ctx)
+-{
+-	struct rbd_checker_context *ct = ctx;
+-	int state;
+-
+-	/* This thread can be canceled, so setup clean up */
+-	rbd_thread_cleanup_push(ct)
+-	rcu_register_thread();
+-	condlog(3, "rbd%d: thread starting up", ct->rbd_bus_id);
+-
+-	ct->message[0] = '\0';
+-
+-	/* checker start up */
+-	pthread_mutex_lock(&ct->lock);
+-	ct->state = PATH_PENDING;
+-	pthread_mutex_unlock(&ct->lock);
+-
+-	state = ct->fn(ct, ct->message);
+-
+-	/* checker done */
+-	pthread_mutex_lock(&ct->lock);
+-	ct->state = state;
+-	pthread_cond_signal(&ct->active);
+-	pthread_mutex_unlock(&ct->lock);
+-
+-	condlog(3, "rbd%d: thead finished, state %s", ct->rbd_bus_id,
+-		checker_state_name(state));
+-	rbd_thread_cleanup_pop(ct);
+-	return ((void *)0);
+-}
+-
+-static void rbd_timeout(struct timespec *tsp)
+-{
+-	clock_gettime(CLOCK_MONOTONIC, tsp);
+-	tsp->tv_nsec += 1000 * 1000; /* 1 millisecond */
+-	normalize_timespec(tsp);
+-}
+-
+-static int rbd_exec_fn(struct checker *c, thread_fn *fn)
+-{
+-	struct rbd_checker_context *ct = c->context;
+-	struct timespec tsp;
+-	pthread_attr_t attr;
+-	int rbd_status, r;
+-
+-	if (c->sync)
+-		return fn(ct, c->message);
+-	/*
+-	 * Async mode
+-	 */
+-	r = pthread_mutex_lock(&ct->lock);
+-	if (r != 0) {
+-		condlog(2, "rbd%d: mutex lock failed with %d", ct->rbd_bus_id,
+-			r);
+-		MSG(c, "rbd%d: thread failed to initialize", ct->rbd_bus_id);
+-		return PATH_WILD;
+-	}
+-
+-	if (ct->running) {
+-		/* Check if checker is still running */
+-		if (ct->thread) {
+-			condlog(3, "rbd%d: thread not finished",
+-				ct->rbd_bus_id);
+-			rbd_status = PATH_PENDING;
+-		} else {
+-			/* checker done */
+-			ct->running = 0;
+-			rbd_status = ct->state;
+-			strncpy(c->message, ct->message, CHECKER_MSG_LEN);
+-			c->message[CHECKER_MSG_LEN - 1] = '\0';
+-		}
+-		pthread_mutex_unlock(&ct->lock);
+-	} else {
+-		/* Start new checker */
+-		ct->state = PATH_UNCHECKED;
+-		ct->fn = fn;
+-		pthread_spin_lock(&ct->hldr_lock);
+-		ct->holders++;
+-		pthread_spin_unlock(&ct->hldr_lock);
+-		setup_thread_attr(&attr, 32 * 1024, 1);
+-		r = pthread_create(&ct->thread, &attr, rbd_thread, ct);
+-		if (r) {
+-			pthread_mutex_unlock(&ct->lock);
+-			ct->thread = 0;
+-			ct->holders--;
+-			condlog(3, "rbd%d failed to start rbd thread, using sync mode",
+-				ct->rbd_bus_id);
+-			return fn(ct, c->message);
+-		}
+-		pthread_attr_destroy(&attr);
+-		rbd_timeout(&tsp);
+-		r = pthread_cond_timedwait(&ct->active, &ct->lock, &tsp);
+-		rbd_status = ct->state;
+-		strncpy(c->message, ct->message,CHECKER_MSG_LEN);
+-		c->message[CHECKER_MSG_LEN -1] = '\0';
+-		pthread_mutex_unlock(&ct->lock);
+-
+-		if (ct->thread &&
+-		    (rbd_status == PATH_PENDING || rbd_status == PATH_UNCHECKED)) {
+-			condlog(3, "rbd%d: thread still running",
+-				ct->rbd_bus_id);
+-			ct->running = 1;
+-			rbd_status = PATH_PENDING;
+-		}
+-	}
+-
+-	return rbd_status;
+-}
+-
+-void libcheck_repair(struct checker * c)
+-{
+-	struct rbd_checker_context *ct = c->context;
+-
+-	if (!ct || !ct->blacklisted)
+-		return;
+-	rbd_exec_fn(c, rbd_repair);
+-}
+-
+-int libcheck_check(struct checker * c)
+-{
+-	struct rbd_checker_context *ct = c->context;
+-
+-	if (!ct)
+-		return PATH_UNCHECKED;
+-
+-	if (ct->blacklisted)
+-		return PATH_DOWN;
+-
+-	return rbd_exec_fn(c, rbd_check);
+-}
+diff --git a/libmultipath/checkers/rdac.c b/libmultipath/checkers/rdac.c
+index a643a4a..5104e4e 100644
+--- a/libmultipath/checkers/rdac.c
++++ b/libmultipath/checkers/rdac.c
+@@ -139,11 +139,6 @@ void libcheck_free (struct checker * c)
+ 	return;
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ static int
+ do_inq(int sg_fd, unsigned int pg_op, void *resp, int mx_resp_len,
+        unsigned int timeout)
+diff --git a/libmultipath/checkers/readsector0.c b/libmultipath/checkers/readsector0.c
+index 8fccb46..1c2a868 100644
+--- a/libmultipath/checkers/readsector0.c
++++ b/libmultipath/checkers/readsector0.c
+@@ -23,11 +23,6 @@ void libcheck_free (struct checker * c)
+ 	return;
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ int libcheck_check (struct checker * c)
+ {
+ 	unsigned char buf[4096];
+diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
+index eb3348d..bf8486d 100644
+--- a/libmultipath/checkers/tur.c
++++ b/libmultipath/checkers/tur.c
+@@ -112,11 +112,6 @@ void libcheck_free (struct checker * c)
+ 	return;
+ }
+ 
+-void libcheck_repair (struct checker * c)
+-{
+-	return;
+-}
+-
+ #define TUR_MSG(fmt, args...)					\
+ 	do {							\
+ 		char msg[CHECKER_MSG_LEN];			\
+diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
+index 1ef1dfa..18ad0e2 100644
+--- a/libmultipath/discovery.c
++++ b/libmultipath/discovery.c
+@@ -1246,21 +1246,6 @@ nvme_sysfs_pathinfo (struct path * pp, vector hwtable)
+ }
+ 
+ static int
+-rbd_sysfs_pathinfo (struct path * pp, vector hwtable)
+-{
+-	sprintf(pp->vendor_id, "Ceph");
+-	sprintf(pp->product_id, "RBD");
+-
+-	condlog(3, "%s: vendor = %s product = %s", pp->dev, pp->vendor_id,
+-		pp->product_id);
+-	/*
+-	 * set the hwe configlet pointer
+-	 */
+-	pp->hwe = find_hwe(hwtable, pp->vendor_id, pp->product_id, NULL);
+-	return 0;
+-}
+-
+-static int
+ ccw_sysfs_pathinfo (struct path * pp, vector hwtable)
+ {
+ 	struct udev_device *parent;
+@@ -1486,8 +1471,6 @@ sysfs_pathinfo(struct path * pp, vector hwtable)
+ 		pp->bus = SYSFS_BUS_CCW;
+ 	if (!strncmp(pp->dev,"sd", 2))
+ 		pp->bus = SYSFS_BUS_SCSI;
+-	if (!strncmp(pp->dev,"rbd", 3))
+-		pp->bus = SYSFS_BUS_RBD;
+ 	if (!strncmp(pp->dev,"nvme", 4))
+ 		pp->bus = SYSFS_BUS_NVME;
+ 
+@@ -1502,9 +1485,6 @@ sysfs_pathinfo(struct path * pp, vector hwtable)
+ 	} else if (pp->bus == SYSFS_BUS_CCISS) {
+ 		if (cciss_sysfs_pathinfo(pp, hwtable))
+ 			return 1;
+-	} else if (pp->bus == SYSFS_BUS_RBD) {
+-		if (rbd_sysfs_pathinfo(pp, hwtable))
+-			return 1;
+ 	} else if (pp->bus == SYSFS_BUS_NVME) {
+ 		if (nvme_sysfs_pathinfo(pp, hwtable))
+ 			return 1;
+@@ -1753,53 +1733,6 @@ get_udev_uid(struct path * pp, char *uid_attribute, struct udev_device *udev)
+ }
+ 
+ static int
+-get_rbd_uid(struct path * pp)
+-{
+-	struct udev_device *rbd_bus_dev;
+-	int ret, rbd_bus_id;
+-	const char *pool, *image, *snap;
+-	char sysfs_path[PATH_SIZE];
+-	uint64_t snap_id, max_snap_id = -3;
+-
+-	ret = sscanf(pp->dev, "rbd%d", &rbd_bus_id);
+-	if (ret != 1)
+-		return -EINVAL;
+-
+-	snprintf(sysfs_path, sizeof(sysfs_path), "/sys/bus/rbd/devices/%d",
+-		 rbd_bus_id);
+-	rbd_bus_dev = udev_device_new_from_syspath(udev, sysfs_path);
+-	if (!rbd_bus_dev)
+-		return -ENODEV;
+-
+-	ret = -EINVAL;
+-	pool = udev_device_get_sysattr_value(rbd_bus_dev, "pool_id");
+-	if (!pool)
+-		goto free_dev;
+-
+-	image = udev_device_get_sysattr_value(rbd_bus_dev, "image_id");
+-	if (!image)
+-		goto free_dev;
+-
+-	snap = udev_device_get_sysattr_value(rbd_bus_dev, "snap_id");
+-	if (!snap)
+-		goto free_dev;
+-	snap_id = strtoull(snap, NULL, 19);
+-	if (snap_id >= max_snap_id)
+-		ret = snprintf(pp->wwid, WWID_SIZE, "%s-%s", pool, image);
+-	else
+-		ret = snprintf(pp->wwid, WWID_SIZE, "%s-%s-%s", pool,
+-			       image, snap);
+-	if (ret >= WWID_SIZE) {
+-		condlog(0, "%s: wwid overflow", pp->dev);
+-		ret = -EOVERFLOW;
+-	}
+-
+-free_dev:
+-	udev_device_unref(rbd_bus_dev);
+-	return ret;
+-}
+-
+-static int
+ get_vpd_uid(struct path * pp)
+ {
+ 	struct udev_device *parent = pp->udev;
+@@ -1876,9 +1809,6 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev)
+ 		} else
+ 			len = strlen(pp->wwid);
+ 		origin = "callout";
+-	} else if (pp->bus == SYSFS_BUS_RBD) {
+-		len = get_rbd_uid(pp);
+-		origin = "sysfs";
+ 	} else {
+ 
+ 		if (udev && pp->uid_attribute) {
+diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
+index 148f0ba..d529bae 100644
+--- a/libmultipath/hwtable.c
++++ b/libmultipath/hwtable.c
+@@ -1000,18 +1000,6 @@ static struct hwentry default_hw[] = {
+ 		.prio_name     = PRIO_ALUA,
+ 	},
+ 	/*
+-	 * Red Hat
+-	 *
+-	 * Maintainer: Mike Christie
+-	 * Mail: mchristi@redhat.com
+-	 */
+-	{
+-		.vendor        = "Ceph",
+-		.product       = "RBD",
+-		.checker_name  = RBD,
+-		.deferred_remove = DEFERRED_REMOVE_ON,
+-	},
+-	/*
+ 	 * Kove
+ 	 */
+ 	{
+diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
+index 0c1f174..31f4585 100644
+--- a/multipath/multipath.conf.5
++++ b/multipath/multipath.conf.5
+@@ -482,9 +482,6 @@ Check the path state for HP/COMPAQ Smart Array(CCISS) controllers.
+ .I none
+ Do not check the device, fallback to use the values retrieved from sysfs
+ .TP
+-.I rbd
+-Check if the path is in the Ceph blacklist and remap the path if it is.
+-.TP
+ The default is: \fBtur\fR
+ .RE
+ .
+diff --git a/multipathd/main.c b/multipathd/main.c
+index 0db88ee..d40c416 100644
+--- a/multipathd/main.c
++++ b/multipathd/main.c
+@@ -1783,15 +1783,6 @@ int update_path_groups(struct multipath *mpp, struct vectors *vecs, int refresh)
+ 	return 0;
+ }
+ 
+-void repair_path(struct path * pp)
+-{
+-	if (pp->state != PATH_DOWN)
+-		return;
+-
+-	checker_repair(&pp->checker);
+-	LOG_MSG(1, checker_message(&pp->checker));
+-}
+-
+ /*
+  * Returns '1' if the path has been checked, '-1' if it was blacklisted
+  * and '0' otherwise
+@@ -1972,7 +1963,6 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
+ 			pp->mpp->failback_tick = 0;
+ 
+ 			pp->mpp->stat_path_failures++;
+-			repair_path(pp);
+ 			return 1;
+ 		}
+ 
+@@ -2071,7 +2061,6 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
+ 	}
+ 
+ 	pp->state = newstate;
+-	repair_path(pp);
+ 
+ 	if (pp->mpp->wait_for_udev)
+ 		return 1;
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0017-mpathpersist-fix-aptpl-support.patch b/meta-oe/recipes-support/multipath-tools/files/0017-mpathpersist-fix-aptpl-support.patch
new file mode 100644
index 0000000..b98d310
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0017-mpathpersist-fix-aptpl-support.patch
@@ -0,0 +1,543 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Mon, 4 Jun 2018 22:04:44 -0500
+Subject: [PATCH] mpathpersist: fix aptpl support
+
+The "Active Persist Through Power Loss" flag must be set whenever a key
+is registered. However, there is no way for multipathd to know if this
+was set by mpathpersist. The result is that if a path goes down and
+comes back up (or if it wasn't up when mpathpersist was first run)
+multipathd will clear the aptpl flag when it reregisters the key on it.
+
+To fix this, multipath.conf now accepts an optional ":aptpl" appended
+on the reservation_key value. If this is added to the reservation_key
+multipathd will set the aptpl flag when it reregisters the key. If
+reservation_key is set to "file", this will automatically be tracked
+in the /etc/multipath/prkeys file.
+
+To track this flag in the prkeys file, without changing the format
+I've made "0x<key>" stand for non-aptpl keys, and "0X<key>" stand
+for aptpl keys. Since previously, all keys used a lower-case x, this
+will default to the current behavior for existing keys. Obviously, the
+next time mpathpersist is run, this will be changed if --param-aptpl
+is used.  Since there are no more flags that are in sg_persist that
+multipathd needs to care about in mpathpersist, there shouldn't need
+to be any more flags added to the prkeys file.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmpathpersist/mpath_persist.c  |  3 ++-
+ libmpathpersist/mpath_updatepr.c | 11 +++++++----
+ libmpathpersist/mpathpr.h        |  3 ++-
+ libmultipath/Makefile            |  2 +-
+ libmultipath/config.h            |  2 ++
+ libmultipath/dict.c              | 23 +++++++++++++++++++----
+ libmultipath/dict.h              |  3 ++-
+ libmultipath/prkey.c             | 27 ++++++++++++++++++++++++---
+ libmultipath/prkey.h             |  6 ++++--
+ libmultipath/propsel.c           |  6 ++++--
+ libmultipath/structs.h           |  1 +
+ libmultipath/util.c              | 16 ++++++++++++++++
+ libmultipath/util.h              |  1 +
+ multipath/multipath.conf.5       |  7 +++++--
+ multipathd/cli_handlers.c        | 15 ++++++++++-----
+ multipathd/main.c                |  1 +
+ 16 files changed, 101 insertions(+), 26 deletions(-)
+
+diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
+index ca91c55..6e9e67f 100644
+--- a/libmpathpersist/mpath_persist.c
++++ b/libmpathpersist/mpath_persist.c
+@@ -344,7 +344,8 @@ int mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
+ 	      rq_servact == MPATH_PROUT_REG_SA) ||
+ 	     rq_servact == MPATH_PROUT_REG_IGN_SA)) {
+ 		memcpy(&mpp->reservation_key, paramp->sa_key, 8);
+-		if (update_prkey(alias, get_be64(mpp->reservation_key))) {
++		if (update_prkey_flags(alias, get_be64(mpp->reservation_key),
++				       paramp->sa_flags)) {
+ 			condlog(0, "%s: failed to set prkey for multipathd.",
+ 				alias);
+ 			ret = MPATH_PR_DMMP_ERROR;
+diff --git a/libmpathpersist/mpath_updatepr.c b/libmpathpersist/mpath_updatepr.c
+index 8063e90..0aca28e 100644
+--- a/libmpathpersist/mpath_updatepr.c
++++ b/libmpathpersist/mpath_updatepr.c
+@@ -1,7 +1,5 @@
+ #include <stdio.h>
+ #include <unistd.h>
+-#include <errno.h>
+-
+ #include <stdlib.h>
+ #include <stdarg.h>
+ #include <fcntl.h>
+@@ -11,6 +9,8 @@
+ #include <sys/un.h>
+ #include <poll.h>
+ #include <errno.h>
++#include <libudev.h>
++#include <mpath_persist.h>
+ #include "debug.h"
+ #include "mpath_cmd.h"
+ #include "uxsock.h"
+@@ -59,11 +59,14 @@ int update_prflag(char *mapname, int set) {
+ 	return do_update_pr(mapname, (set)? "setprstatus" : "unsetprstatus");
+ }
+ 
+-int update_prkey(char *mapname, uint64_t prkey) {
++int update_prkey_flags(char *mapname, uint64_t prkey, uint8_t sa_flags) {
+ 	char str[256];
++	char *flagstr = "";
+ 
++	if (sa_flags & MPATH_F_APTPL_MASK)
++		flagstr = ":aptpl";
+ 	if (prkey)
+-		sprintf(str, "setprkey key %" PRIx64, prkey);
++		sprintf(str, "setprkey key %" PRIx64 "%s", prkey, flagstr);
+ 	else
+ 		sprintf(str, "unsetprkey");
+ 	return do_update_pr(mapname, str);
+diff --git a/libmpathpersist/mpathpr.h b/libmpathpersist/mpathpr.h
+index 72feb60..5ea8cd6 100644
+--- a/libmpathpersist/mpathpr.h
++++ b/libmpathpersist/mpathpr.h
+@@ -46,7 +46,8 @@ int send_prout_activepath(char * dev, int rq_servact, int rq_scope,
+ 	unsigned int rq_type,   struct prout_param_descriptor * paramp, int noisy);
+ 
+ int update_prflag(char *mapname, int set);
+-int update_prkey(char *mapname, uint64_t prkey);
++int update_prkey_flags(char *mapname, uint64_t prkey, uint8_t sa_flags);
++#define update_prkey(mapname, prkey) update_prkey_flags(mapname, prkey, 0)
+ void * mpath_alloc_prin_response(int prin_sa);
+ int update_map_pr(struct multipath *mpp);
+ 
+diff --git a/libmultipath/Makefile b/libmultipath/Makefile
+index f51786d..33f5269 100644
+--- a/libmultipath/Makefile
++++ b/libmultipath/Makefile
+@@ -7,7 +7,7 @@ SONAME = 0
+ DEVLIB = libmultipath.so
+ LIBS = $(DEVLIB).$(SONAME)
+ 
+-CFLAGS += $(LIB_CFLAGS) -I$(mpathcmddir)
++CFLAGS += $(LIB_CFLAGS) -I$(mpathcmddir) -I$(mpathpersistdir)
+ 
+ LIBDEPS += -lpthread -ldl -ldevmapper -ludev -L$(mpathcmddir) -lmpathcmd -lurcu -laio
+ 
+diff --git a/libmultipath/config.h b/libmultipath/config.h
+index 1bf708a..fcbe3fc 100644
+--- a/libmultipath/config.h
++++ b/libmultipath/config.h
+@@ -98,6 +98,7 @@ struct mpentry {
+ 	char * prio_args;
+ 	int prkey_source;
+ 	struct be64 reservation_key;
++	uint8_t sa_flags;
+ 	int pgpolicy;
+ 	int pgfailback;
+ 	int rr_weight;
+@@ -197,6 +198,7 @@ struct config {
+ 	int prkey_source;
+ 	int all_tg_pt;
+ 	struct be64 reservation_key;
++	uint8_t sa_flags;
+ 
+ 	vector keywords;
+ 	vector mptable;
+diff --git a/libmultipath/dict.c b/libmultipath/dict.c
+index 2557b8a..7ad0f5a 100644
+--- a/libmultipath/dict.c
++++ b/libmultipath/dict.c
+@@ -22,6 +22,8 @@
+ #include "util.h"
+ #include <errno.h>
+ #include <inttypes.h>
++#include <libudev.h>
++#include <mpath_persist.h>
+ #include "mpath_cmd.h"
+ #include "dict.h"
+ 
+@@ -1012,10 +1014,12 @@ snprint_def_log_checker_err (struct config *conf, char * buff, int len,
+ }
+ 
+ static int
+-set_reservation_key(vector strvec, struct be64 *be64_ptr, int *source_ptr)
++set_reservation_key(vector strvec, struct be64 *be64_ptr, uint8_t *flags_ptr,
++		    int *source_ptr)
+ {
+ 	char *buff;
+ 	uint64_t prkey;
++	uint8_t sa_flags;
+ 
+ 	buff = set_value(strvec);
+ 	if (!buff)
+@@ -1023,35 +1027,43 @@ set_reservation_key(vector strvec, struct be64 *be64_ptr, int *source_ptr)
+ 
+ 	if (strcmp(buff, "file") == 0) {
+ 		*source_ptr = PRKEY_SOURCE_FILE;
++		*flags_ptr = 0;
+ 		put_be64(*be64_ptr, 0);
+ 		FREE(buff);
+ 		return 0;
+ 	}
+ 
+-	if (parse_prkey(buff, &prkey) != 0) {
++	if (parse_prkey_flags(buff, &prkey, &sa_flags) != 0) {
+ 		FREE(buff);
+ 		return 1;
+ 	}
+ 	*source_ptr = PRKEY_SOURCE_CONF;
++	*flags_ptr = sa_flags;
+ 	put_be64(*be64_ptr, prkey);
+ 	FREE(buff);
+ 	return 0;
+ }
+ 
+ int
+-print_reservation_key(char * buff, int len, struct be64 key, int source)
++print_reservation_key(char * buff, int len, struct be64 key, uint8_t flags,
++		      int source)
+ {
++	char *flagstr = "";
+ 	if (source == PRKEY_SOURCE_NONE)
+ 		return 0;
+ 	if (source == PRKEY_SOURCE_FILE)
+ 		return snprintf(buff, len, "file");
+-	return snprintf(buff, len, "0x%" PRIx64, get_be64(key));
++	if (flags & MPATH_F_APTPL_MASK)
++		flagstr = ":aptpl";
++	return snprintf(buff, len, "0x%" PRIx64 "%s", get_be64(key),
++			flagstr);
+ }
+ 
+ static int
+ def_reservation_key_handler(struct config *conf, vector strvec)
+ {
+ 	return set_reservation_key(strvec, &conf->reservation_key,
++				   &conf->sa_flags,
+ 				   &conf->prkey_source);
+ }
+ 
+@@ -1060,6 +1072,7 @@ snprint_def_reservation_key (struct config *conf, char * buff, int len,
+ 			     const void * data)
+ {
+ 	return print_reservation_key(buff, len, conf->reservation_key,
++				     conf->sa_flags,
+ 				     conf->prkey_source);
+ }
+ 
+@@ -1070,6 +1083,7 @@ mp_reservation_key_handler(struct config *conf, vector strvec)
+ 	if (!mpe)
+ 		return 1;
+ 	return set_reservation_key(strvec, &mpe->reservation_key,
++				   &mpe->sa_flags,
+ 				   &mpe->prkey_source);
+ }
+ 
+@@ -1079,6 +1093,7 @@ snprint_mp_reservation_key (struct config *conf, char * buff, int len,
+ {
+ 	const struct mpentry * mpe = (const struct mpentry *)data;
+ 	return print_reservation_key(buff, len, mpe->reservation_key,
++				     mpe->sa_flags,
+ 				     mpe->prkey_source);
+ }
+ 
+diff --git a/libmultipath/dict.h b/libmultipath/dict.h
+index 7564892..a40ac66 100644
+--- a/libmultipath/dict.h
++++ b/libmultipath/dict.h
+@@ -15,6 +15,7 @@ int print_pgpolicy(char *buff, int len, long v);
+ int print_no_path_retry(char *buff, int len, long v);
+ int print_fast_io_fail(char *buff, int len, long v);
+ int print_dev_loss(char *buff, int len, unsigned long v);
+-int print_reservation_key(char * buff, int len, struct be64 key, int source);
++int print_reservation_key(char * buff, int len, struct be64 key, uint8_t
++			  flags, int source);
+ int print_off_int_undef(char *buff, int len, long v);
+ #endif /* _DICT_H */
+diff --git a/libmultipath/prkey.c b/libmultipath/prkey.c
+index 89b90ed..d645f81 100644
+--- a/libmultipath/prkey.c
++++ b/libmultipath/prkey.c
+@@ -11,6 +11,8 @@
+ #include <string.h>
+ #include <inttypes.h>
+ #include <errno.h>
++#include <libudev.h>
++#include <mpath_persist.h>
+ 
+ #define PRKEY_READ 0
+ #define PRKEY_WRITE 1
+@@ -108,7 +110,8 @@ static int do_prkey(int fd, char *wwid, char *keystr, int cmd)
+ 	return 0;
+ }
+ 
+-int get_prkey(struct config *conf, struct multipath *mpp, uint64_t *prkey)
++int get_prkey(struct config *conf, struct multipath *mpp, uint64_t *prkey,
++	      uint8_t *sa_flags)
+ {
+ 	int fd;
+ 	int unused;
+@@ -124,6 +127,9 @@ int get_prkey(struct config *conf, struct multipath *mpp, uint64_t *prkey)
+ 	ret = do_prkey(fd, mpp->wwid, keystr, PRKEY_READ);
+ 	if (ret)
+ 		goto out_file;
++	*sa_flags = 0;
++	if (strchr(keystr, 'X'))
++		*sa_flags = MPATH_F_APTPL_MASK;
+ 	ret = !!parse_prkey(keystr, prkey);
+ out_file:
+ 	close(fd);
+@@ -131,7 +137,8 @@ out:
+ 	return ret;
+ }
+ 
+-int set_prkey(struct config *conf, struct multipath *mpp, uint64_t prkey)
++int set_prkey(struct config *conf, struct multipath *mpp, uint64_t prkey,
++	      uint8_t sa_flags)
+ {
+ 	int fd;
+ 	int can_write = 1;
+@@ -141,6 +148,12 @@ int set_prkey(struct config *conf, struct multipath *mpp, uint64_t prkey)
+ 	if (!strlen(mpp->wwid))
+ 		goto out;
+ 
++	if (sa_flags & ~MPATH_F_APTPL_MASK) {
++		condlog(0, "unsupported pr flags, 0x%x",
++			sa_flags & ~MPATH_F_APTPL_MASK);
++		sa_flags &= MPATH_F_APTPL_MASK;
++	}
++
+ 	fd = open_file(conf->prkeys_file, &can_write, PRKEYS_FILE_HEADER);
+ 	if (fd < 0)
+ 		goto out;
+@@ -149,7 +162,15 @@ int set_prkey(struct config *conf, struct multipath *mpp, uint64_t prkey)
+ 		goto out_file;
+ 	}
+ 	if (prkey) {
+-		snprintf(keystr, PRKEY_SIZE, "0x%016" PRIx64, prkey);
++		/* using the capitalization of the 'x' is a hack, but
++		 * it's unlikely that mpath_persist will support more options
++		 * since sg_persist doesn't, and this lets us keep the
++		 * same file format as before instead of needing to change
++		 * the format of the prkeys file */
++		if (sa_flags)
++			snprintf(keystr, PRKEY_SIZE, "0X%016" PRIx64, prkey);
++		else
++			snprintf(keystr, PRKEY_SIZE, "0x%016" PRIx64, prkey);
+ 		keystr[PRKEY_SIZE - 1] = '\0';
+ 		ret = do_prkey(fd, mpp->wwid, keystr, PRKEY_WRITE);
+ 	}
+diff --git a/libmultipath/prkey.h b/libmultipath/prkey.h
+index 4028e70..6739191 100644
+--- a/libmultipath/prkey.h
++++ b/libmultipath/prkey.h
+@@ -13,7 +13,9 @@
+ "# prkey wwid\n" \
+ "#\n"
+ 
+-int set_prkey(struct config *conf, struct multipath *mpp, uint64_t prkey);
+-int get_prkey(struct config *conf, struct multipath *mpp, uint64_t *prkey);
++int set_prkey(struct config *conf, struct multipath *mpp, uint64_t prkey,
++	      uint8_t sa_flags);
++int get_prkey(struct config *conf, struct multipath *mpp, uint64_t *prkey,
++	      uint8_t *sa_flags);
+ 
+ #endif /* _PRKEY_H */
+diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
+index 9ca1355..62a6893 100644
+--- a/libmultipath/propsel.c
++++ b/libmultipath/propsel.c
+@@ -106,6 +106,7 @@ do {									\
+ 	if (src && src->prkey_source != PRKEY_SOURCE_NONE) {		\
+ 		mp->prkey_source = src->prkey_source;			\
+ 		mp->reservation_key = src->reservation_key;		\
++		mp->sa_flags = src->sa_flags;				\
+ 		origin = msg;						\
+ 		goto out;						\
+ 	}								\
+@@ -703,18 +704,19 @@ int select_reservation_key(struct config *conf, struct multipath *mp)
+ 	do_prkey_set(mp->mpe, multipaths_origin);
+ 	do_prkey_set(conf, conf_origin);
+ 	put_be64(mp->reservation_key, 0);
++	mp->sa_flags = 0;
+ 	mp->prkey_source = PRKEY_SOURCE_NONE;
+ 	return 0;
+ out:
+ 	if (mp->prkey_source == PRKEY_SOURCE_FILE) {
+ 		from_file = " (from prkeys file)";
+-		if (get_prkey(conf, mp, &prkey) != 0)
++		if (get_prkey(conf, mp, &prkey, &mp->sa_flags) != 0)
+ 			put_be64(mp->reservation_key, 0);
+ 		else
+ 			put_be64(mp->reservation_key, prkey);
+ 	}
+ 	print_reservation_key(buff, PRKEY_SIZE, mp->reservation_key,
+-			      mp->prkey_source);
++			      mp->sa_flags, mp->prkey_source);
+ 	condlog(3, "%s: reservation_key = %s %s%s", mp->alias, buff, origin,
+ 		from_file);
+ 	return 0;
+diff --git a/libmultipath/structs.h b/libmultipath/structs.h
+index 0194b1e..987479f 100644
+--- a/libmultipath/structs.h
++++ b/libmultipath/structs.h
+@@ -367,6 +367,7 @@ struct multipath {
+ 	/* persistent management data*/
+ 	int prkey_source;
+ 	struct be64 reservation_key;
++	uint8_t sa_flags;
+ 	unsigned char prflag;
+ 	int all_tg_pt;
+ 	struct gen_multipath generic_mp;
+diff --git a/libmultipath/util.c b/libmultipath/util.c
+index 7251ad0..8d8fcc8 100644
+--- a/libmultipath/util.c
++++ b/libmultipath/util.c
+@@ -10,6 +10,8 @@
+ #include <dirent.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <libudev.h>
++#include <mpath_persist.h>
+ 
+ #include "util.h"
+ #include "debug.h"
+@@ -435,6 +437,20 @@ int parse_prkey(char *ptr, uint64_t *prkey)
+ 	return 0;
+ }
+ 
++int parse_prkey_flags(char *ptr, uint64_t *prkey, uint8_t *flags)
++{
++	char *flagstr;
++
++	flagstr = strchr(ptr, ':');
++	*flags = 0;
++	if (flagstr) {
++		*flagstr++ = '\0';
++		if (strlen(flagstr) == 5 && strcmp(flagstr, "aptpl") == 0)
++			*flags = MPATH_F_APTPL_MASK;
++	}
++	return parse_prkey(ptr, prkey);
++}
++
+ int safe_write(int fd, const void *buf, size_t count)
+ {
+ 	while (count > 0) {
+diff --git a/libmultipath/util.h b/libmultipath/util.h
+index a3ab894..56cec76 100644
+--- a/libmultipath/util.h
++++ b/libmultipath/util.h
+@@ -19,6 +19,7 @@ void setup_thread_attr(pthread_attr_t *attr, size_t stacksize, int detached);
+ int systemd_service_enabled(const char *dev);
+ int get_linux_version_code(void);
+ int parse_prkey(char *ptr, uint64_t *prkey);
++int parse_prkey_flags(char *ptr, uint64_t *prkey, uint8_t *flags);
+ int safe_write(int fd, const void *buf, size_t count);
+ 
+ #define KERNEL_VERSION(maj, min, ptc) ((((maj) * 256) + (min)) * 256 + (ptc))
+diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
+index 31f4585..30d8598 100644
+--- a/multipath/multipath.conf.5
++++ b/multipath/multipath.conf.5
+@@ -726,14 +726,17 @@ This is the service action reservation key used by mpathpersist. It must be
+ set for all multipath devices using persistent reservations, and it must be
+ the same as the RESERVATION KEY field of the PERSISTENT RESERVE OUT parameter
+ list which contains an 8-byte value provided by the application client to the
+-device server to identify the I_T nexus.
++device server to identify the I_T nexus. If the \fI--param-aptpl\fR option is
++used when registering the key with mpathpersist, \fB:aptpl\fR must be appended
++to the end of the reservation key.
+ .RS
+ .PP
+ Alternatively, this can be set to \fBfile\fR, which will store the RESERVATION
+ KEY registered by mpathpersist in the \fIprkeys_file\fR. multipathd will then
+ use this key to register additional paths as they appear.  When the
+ registration is removed, the RESERVATION KEY is removed from the
+-\fIprkeys_file\fR.
++\fIprkeys_file\fR. The prkeys file will automatically keep track of whether
++the key was registered with \fI--param-aptpl\fR.
+ .TP
+ The default is: \fB<unset>\fR
+ .RE
+diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
+index ba50fb8..6452796 100644
+--- a/multipathd/cli_handlers.c
++++ b/multipathd/cli_handlers.c
+@@ -21,6 +21,7 @@
+ #include "sysfs.h"
+ #include <errno.h>
+ #include <libudev.h>
++#include <mpath_persist.h>
+ #include "util.h"
+ #include "prkey.h"
+ #include "propsel.h"
+@@ -1463,6 +1464,7 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
+ 	struct multipath * mpp;
+ 	struct vectors * vecs = (struct vectors *)data;
+ 	char *mapname = get_keyparam(v, MAP);
++	char *flagstr = "";
+ 
+ 	mapname = convert_dev(mapname, 0);
+ 	condlog(3, "%s: get persistent reservation key (operator)", mapname);
+@@ -1478,8 +1480,10 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
+ 		*len = strlen(*reply) + 1;
+ 		return 0;
+ 	}
+-	snprintf(*reply, 20, "0x%" PRIx64 "\n",
+-		 get_be64(mpp->reservation_key));
++	if (mpp->sa_flags & MPATH_F_APTPL_MASK)
++		flagstr = ":aptpl";
++	snprintf(*reply, 20, "0x%" PRIx64 "%s\n",
++		 get_be64(mpp->reservation_key), flagstr);
+ 	(*reply)[19] = '\0';
+ 	*len = strlen(*reply) + 1;
+ 	return 0;
+@@ -1503,7 +1507,7 @@ cli_unsetprkey(void * v, char ** reply, int * len, void * data)
+ 
+ 	conf = get_multipath_config();
+ 	pthread_cleanup_push(put_multipath_config, conf);
+-	ret = set_prkey(conf, mpp, 0);
++	ret = set_prkey(conf, mpp, 0, 0);
+ 	pthread_cleanup_pop(1);
+ 
+ 	return ret;
+@@ -1517,6 +1521,7 @@ cli_setprkey(void * v, char ** reply, int * len, void * data)
+ 	char *mapname = get_keyparam(v, MAP);
+ 	char *keyparam = get_keyparam(v, KEY);
+ 	uint64_t prkey;
++	uint8_t flags;
+ 	int ret;
+ 	struct config *conf;
+ 
+@@ -1527,14 +1532,14 @@ cli_setprkey(void * v, char ** reply, int * len, void * data)
+ 	if (!mpp)
+ 		return 1;
+ 
+-	if (parse_prkey(keyparam, &prkey) != 0) {
++	if (parse_prkey_flags(keyparam, &prkey, &flags) != 0) {
+ 		condlog(0, "%s: invalid prkey : '%s'", mapname, keyparam);
+ 		return 1;
+ 	}
+ 
+ 	conf = get_multipath_config();
+ 	pthread_cleanup_push(put_multipath_config, conf);
+-	ret = set_prkey(conf, mpp, prkey);
++	ret = set_prkey(conf, mpp, prkey, flags);
+ 	pthread_cleanup_pop(1);
+ 
+ 	return ret;
+diff --git a/multipathd/main.c b/multipathd/main.c
+index d40c416..6b1e782 100644
+--- a/multipathd/main.c
++++ b/multipathd/main.c
+@@ -3089,6 +3089,7 @@ void *  mpath_pr_event_handler_fn (void * pathp )
+ 
+ 	param= malloc(sizeof(struct prout_param_descriptor));
+ 	memset(param, 0 , sizeof(struct prout_param_descriptor));
++	param->sa_flags = mpp->sa_flags;
+ 	memcpy(param->sa_key, &mpp->reservation_key, 8);
+ 	param->num_transportid = 0;
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0018-multipath-don-t-check-timestamps-without-a-path.patch b/meta-oe/recipes-support/multipath-tools/files/0018-multipath-don-t-check-timestamps-without-a-path.patch
new file mode 100644
index 0000000..5a3fd83
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0018-multipath-don-t-check-timestamps-without-a-path.patch
@@ -0,0 +1,34 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Tue, 5 Jun 2018 15:31:55 -0500
+Subject: [PATCH] multipath: don't check timestamps without a path
+
+If a path was blacklisted, pathvec could exist but have no path in it.
+print_cmd_valid wasn't checking this before calling
+find_multipaths_check_timeout(). This was causing it to dereference a
+NULL pointer in these cases.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ multipath/main.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/multipath/main.c b/multipath/main.c
+index c69e996..3f0a6aa 100644
+--- a/multipath/main.c
++++ b/multipath/main.c
+@@ -482,10 +482,8 @@ static int print_cmd_valid(int k, const vector pathvec,
+ 			pp, pp->find_multipaths_timeout, &until);
+ 		if (wait != FIND_MULTIPATHS_WAITING)
+ 			k = 1;
+-	} else if (pathvec != NULL) {
+-		pp = VECTOR_SLOT(pathvec, 0);
++	} else if (pathvec != NULL && (pp = VECTOR_SLOT(pathvec, 0)))
+ 		wait = find_multipaths_check_timeout(pp, 0, &until);
+-	}
+ 	if (wait == FIND_MULTIPATHS_WAITING)
+ 		printf("FIND_MULTIPATHS_WAIT_UNTIL=\"%ld.%06ld\"\n",
+ 			       until.tv_sec, until.tv_nsec/1000);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0019-libmultipath-fix-detect-alua-corner-case.patch b/meta-oe/recipes-support/multipath-tools/files/0019-libmultipath-fix-detect-alua-corner-case.patch
new file mode 100644
index 0000000..23908fa
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0019-libmultipath-fix-detect-alua-corner-case.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Fri, 8 Jun 2018 17:12:37 -0500
+Subject: [PATCH] libmultipath: fix detect alua corner case
+
+If retain_attach_hw_handler = no, then the paths tpgs state will never
+be checked, and the multipath device will always select the alua
+handler, if no other handler is selected. the paths tpgs state
+should be checked, regardless of the retain_hwhandler value.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/propsel.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
+index 62a6893..f626c74 100644
+--- a/libmultipath/propsel.c
++++ b/libmultipath/propsel.c
+@@ -403,9 +403,11 @@ int select_hwhandler(struct config *conf, struct multipath *mp)
+ 	bool all_tpgs = true;
+ 
+ 	dh_state = &handler[2];
++
++	vector_foreach_slot(mp->paths, pp, i)
++		all_tpgs = all_tpgs && (pp->tpgs > 0);
+ 	if (mp->retain_hwhandler != RETAIN_HWHANDLER_OFF) {
+ 		vector_foreach_slot(mp->paths, pp, i) {
+-			all_tpgs = all_tpgs && (pp->tpgs > 0);
+ 			if (get_dh_state(pp, dh_state, sizeof(handler) - 2) > 0
+ 			    && strcmp(dh_state, "detached")) {
+ 				memcpy(handler, "1 ", 2);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0020-multipath-fix-setting-conf-version.patch b/meta-oe/recipes-support/multipath-tools/files/0020-multipath-fix-setting-conf-version.patch
new file mode 100644
index 0000000..624f45e
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0020-multipath-fix-setting-conf-version.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Fri, 8 Jun 2018 17:23:07 -0500
+Subject: [PATCH] multipath: fix setting conf->version
+
+Commit d3b71498 stopped multipath from setting conf->version. Instead,
+it was always being set to 0.0.0. Multipathd was still setting this
+correctly.
+
+Fixes: d3b71498 "multipath: fix rcu thread cancellation hang"
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/devmapper.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
+index f2befad..8136d15 100644
+--- a/libmultipath/devmapper.c
++++ b/libmultipath/devmapper.c
+@@ -245,13 +245,13 @@ void libmp_dm_init(void)
+ 	int verbosity;
+ 	unsigned int version[3];
+ 
++	if (dm_prereq(version))
++		exit(1);
+ 	conf = get_multipath_config();
+ 	verbosity = conf->verbosity;
+-	memcpy(version, conf->version, sizeof(version));
++	memcpy(conf->version, version, sizeof(version));
+ 	put_multipath_config(conf);
+ 	dm_init(verbosity);
+-	if (dm_prereq(version))
+-		exit(1);
+ 	dm_udev_set_sync_support(libmp_dm_udev_sync);
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
new file mode 100644
index 0000000..4ef3e70
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
@@ -0,0 +1,82 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 13 Apr 2017 07:22:23 -0500
+Subject: [PATCH] RH: fixup udev rules for redhat
+
+The multipath rules need to run after scsi_id is run. This means moving
+them after 60-persistent-storage.rules for redhat. Redhat also uses a
+different naming scheme for partitions than SuSE. Also, there are some
+false warnings that gcc throws because of the changed options. Fix these
+too.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ Makefile.inc        | 2 +-
+ kpartx/kpartx.rules | 2 +-
+ multipath/Makefile  | 4 ++--
+ multipath/main.c    | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index af2f5ba..0b271ea 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -51,7 +51,7 @@ endif
+ prefix		=
+ exec_prefix	= $(prefix)
+ usr_prefix	= $(prefix)
+-bindir		= $(exec_prefix)/sbin
++bindir		= $(exec_prefix)/usr/sbin
+ libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
+ udevrulesdir	= $(libudevdir)/rules.d
+ multipathdir	= $(TOPDIR)/libmultipath
+diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
+index 8f99049..8a3a171 100644
+--- a/kpartx/kpartx.rules
++++ b/kpartx/kpartx.rules
+@@ -32,6 +32,6 @@ LABEL="mpath_kpartx_end"
+ GOTO="kpartx_end"
+ 
+ LABEL="run_kpartx"
+-RUN+="/sbin/kpartx -un -p -part /dev/$name"
++RUN+="/sbin/kpartx -un /dev/$name"
+ 
+ LABEL="kpartx_end"
+diff --git a/multipath/Makefile b/multipath/Makefile
+index 0828a8f..b9bbb3c 100644
+--- a/multipath/Makefile
++++ b/multipath/Makefile
+@@ -24,7 +24,7 @@ install:
+ 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+ 	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
+-	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
++	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
+@@ -33,7 +33,7 @@ install:
+ uninstall:
+ 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
+ 	$(RM) $(DESTDIR)$(udevrulesdir)/11-dm-mpath.rules
+-	$(RM) $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
++	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
+ 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
+ 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
+ 
+diff --git a/multipath/main.c b/multipath/main.c
+index 3f0a6aa..6fdde03 100644
+--- a/multipath/main.c
++++ b/multipath/main.c
+@@ -389,7 +389,7 @@ static int find_multipaths_check_timeout(const struct path *pp, long tmo,
+ 	struct timespec now, ftimes[2], tdiff;
+ 	struct stat st;
+ 	long fd;
+-	int r, err, retries = 0;
++	int r, err = 0, retries = 0;
+ 
+ 	clock_gettime(CLOCK_REALTIME, &now);
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
similarity index 59%
rename from meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch
rename to meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
index 684e959..451c524 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -1,7 +1,7 @@
-From 69a67c2ed09ae51b53de402966a9f7a4cc737715 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Wed, 2 Jul 2014 12:49:53 -0500
-Subject: [PATCH 03/14] RH: Remove the property blacklist exception builtin
+Subject: [PATCH] RH: Remove the property blacklist exception builtin
 
 Multipath set the default property blacklist exceptions to
 (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
@@ -14,8 +14,8 @@ it.
 Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 ---
  libmultipath/blacklist.c   | 15 ++++++---------
- multipath/multipath.conf.5 |  4 ----
- 2 files changed, 6 insertions(+), 13 deletions(-)
+ multipath/multipath.conf.5 | 14 ++++++++------
+ 2 files changed, 14 insertions(+), 15 deletions(-)
 
 diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
 index ee396e2..19d4697 100644
@@ -51,10 +51,10 @@ index ee396e2..19d4697 100644
  
  void
 diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
-index f04ff19..fbbbb27 100644
+index 30d8598..c45da9f 100644
 --- a/multipath/multipath.conf.5
 +++ b/multipath/multipath.conf.5
-@@ -1014,10 +1014,6 @@ The \fIWorld Wide Identification\fR of a device.
+@@ -1179,10 +1179,6 @@ The \fIWorld Wide Identification\fR of a device.
  .TP
  .B property
  Regular expression of the udev property to be whitelisted.
@@ -65,6 +65,23 @@ index f04ff19..fbbbb27 100644
  .TP
  .B device
  Subsection for the device description. This subsection recognizes the
+@@ -1193,8 +1189,14 @@ keywords. For a full description of these keywords please see the \fIdevices\fR
+ section description.
+ .LP
+ The \fIproperty\fR whitelist handling is different from the usual
+-handling in the sense that the device \fIhas\fR to have a udev property that
+-matches the whitelist, otherwise the device will be blacklisted. In these cases the message \fIblacklisted, udev property missing\fR will be displayed.
++handling in the sense that if the propery whitelist is set, the device
++\fIhas\fR to have a udev property that matches the whitelist, otherwise the
++device will be blacklisted. In these cases the message \fIblacklisted, udev
++property missing\fR will be displayed. For example settting the
++property blacklist_exception to \fB(SCSI_IDENT_|ID_WWN)\fR will blacklist
++all devices that have no udev property whose name regex matches either
++\fBSCSI_IDENT_\fR or \fBID_WWN\fR. This works to exclude most
++non-multipathable devices.
+ .
+ .
+ .\" ----------------------------------------------------------------------------
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
similarity index 77%
rename from meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch
rename to meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
index 87a6d3f..886f1c8 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
@@ -1,7 +1,7 @@
-From b2b504fc1959c7a3f0a843c3c204e8e193b675b7 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Wed, 15 Oct 2014 10:39:30 -0500
-Subject: [PATCH 04/14] RH: don't start without a config file
+Subject: [PATCH] RH: don't start without a config file
 
 If /etc/multipath.conf doesn't exist, don't start multipathd and blacklist
 all devices when running multipath.  A completely blank configuration file
@@ -12,33 +12,31 @@ simple way to disable multipath.  Simply removing or renaming
 
 Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 ---
- libmultipath/config.c         | 17 +++++++++++++++++
+ libmultipath/config.c         | 15 +++++++++++++++
  libmultipath/config.h         |  1 +
  multipath/multipath.rules     |  1 +
  multipathd/multipathd.8       |  2 ++
  multipathd/multipathd.service |  1 +
- 5 files changed, 22 insertions(+)
+ 5 files changed, 20 insertions(+)
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index bb6619b..aae69b8 100644
+index 5872927..0607403 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
-@@ -25,6 +25,7 @@
- #include "prio.h"
+@@ -26,6 +26,7 @@
  #include "devmapper.h"
  #include "mpath_cmd.h"
+ #include "propsel.h"
 +#include "version.h"
  
  static int
  hwe_strmatch (struct hwentry *hwe1, struct hwentry *hwe2)
-@@ -667,6 +668,22 @@ load_config (char * file)
+@@ -658,6 +659,20 @@ load_config (char * file)
  			factorize_hwtable(conf->hwtable, builtin_hwtable_size);
  		}
  
 +	} else {
 +		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
-+		condlog(0, "A default multipath.conf file is located at");
-+		condlog(0, "/usr/share/doc/device-mapper-multipath-%d.%d.%d/multipath.conf", MULTIPATH_VERSION(VERSION_CODE));
 +		if (conf->blist_devnode == NULL) {
 +			conf->blist_devnode = vector_alloc();
 +			if (!conf->blist_devnode) {
@@ -55,10 +53,10 @@ index bb6619b..aae69b8 100644
  
  	conf->processed_main_config = 1;
 diff --git a/libmultipath/config.h b/libmultipath/config.h
-index ffc69b5..614331c 100644
+index fcbe3fc..3a42435 100644
 --- a/libmultipath/config.h
 +++ b/libmultipath/config.h
-@@ -7,6 +7,7 @@
+@@ -9,6 +9,7 @@
  
  #define ORIGIN_DEFAULT 0
  #define ORIGIN_CONFIG  1
@@ -67,36 +65,36 @@ index ffc69b5..614331c 100644
  /*
   * In kernel, fast_io_fail == 0 means immediate failure on rport delete.
 diff --git a/multipath/multipath.rules b/multipath/multipath.rules
-index 4d78b98..5753766 100644
+index d658073..b3f54d7 100644
 --- a/multipath/multipath.rules
 +++ b/multipath/multipath.rules
-@@ -6,6 +6,7 @@ IMPORT{cmdline}="nompath"
+@@ -9,6 +9,7 @@ IMPORT{cmdline}="nompath"
  ENV{nompath}=="?*", GOTO="end_mpath"
  IMPORT{cmdline}="multipath"
  ENV{multipath}=="off", GOTO="end_mpath"
 +TEST!="/etc/multipath.conf", GOTO="end_mpath"
  
- KERNEL=="dm-*", GOTO="check_kpartx"
  ENV{DEVTYPE}!="partition", GOTO="test_dev"
+ IMPORT{parent}="DM_MULTIPATH_DEVICE_PATH"
 diff --git a/multipathd/multipathd.8 b/multipathd/multipathd.8
-index 4c765af..c1499a5 100644
+index e78ac9e..09cdead 100644
 --- a/multipathd/multipathd.8
 +++ b/multipathd/multipathd.8
-@@ -39,6 +39,8 @@ map regains its maximum performance and redundancy.
+@@ -38,6 +38,8 @@ map regains its maximum performance and redundancy.
  This daemon executes the external \fBmultipath\fR tool when events occur.
  In turn, the multipath tool signals the multipathd daemon when it is done with
  devmap reconfiguration, so that it can refresh its failed path list.
 +
-+In this Linux distribution, multipathd does not run unless a /etc/multipath.conffile exists
++In this Linux distribution, multipathd does not run unless a /etc/multipath.conf file exists.
  .
  .
  .\" ----------------------------------------------------------------------------
 diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index fd66cf6..fafd088 100644
+index ba24983..17434ce 100644
 --- a/multipathd/multipathd.service
 +++ b/multipathd/multipathd.service
 @@ -4,6 +4,7 @@ Wants=systemd-udev-trigger.service systemd-udev-settle.service
- Before=iscsi.service iscsid.service lvm2-lvmetad.service lvm2-activation-early.service
+ Before=iscsi.service iscsid.service lvm2-activation-early.service
  Before=local-fs-pre.target blk-availability.service
  After=multipathd.socket systemd-udev-trigger.service systemd-udev-settle.service
 +ConditionPathExists=/etc/multipath.conf
@@ -104,5 +102,5 @@ index fd66cf6..fafd088 100644
  Conflicts=shutdown.target
  ConditionKernelCommandLine=!nompath
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
new file mode 100644
index 0000000..9330bf0
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
@@ -0,0 +1,52 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 19 Apr 2017 06:10:01 -0500
+Subject: [PATCH] RH: use rpm optflags if present
+
+Use the passed in optflags when compiling as an RPM, and keep the
+default flags as close as possible to the current fedora flags, while
+still being generic.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ Makefile.inc | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 0b271ea..5ff69a3 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -85,14 +85,22 @@ TEST_CC_OPTION = $(shell \
+ 		echo "$(2)"; \
+ 	fi)
+ 
+-STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
+-
+-OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
+-		  -Werror=implicit-function-declaration -Werror=format-security \
+-		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
+-		  -Werror=cast-qual -Werror=discarded-qualifiers \
+-		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
+-		  --param=ssp-buffer-size=4
++ifndef RPM_OPT_FLAGS
++	STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
++	OPTFLAGS	= -O2 -g -pipe -Wall -Werror=format-security \
++			  -Wp,-D_FORTIFY_SOURCE=2 -fexceptions \
++			  $(STACKPROT) --param=ssp-buffer-size=4 \
++			  -grecord-gcc-switches
++	ifeq ($(shell test -f /usr/lib/rpm/redhat/redhat-hardened-cc1 && echo 1),1)
++		OPTFLAGS += -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1
++	endif
++else
++	OPTFLAGS = $(RPM_OPT_FLAGS)
++endif
++OPTFLAGS	+= -Wextra -Wstrict-prototypes -Wformat=2 -Werror=implicit-int \
++		   -Werror=implicit-function-declaration -Wno-sign-compare \
++		   -Wno-unused-parameter -Werror=cast-qual \
++		   -Werror=discarded-qualifiers
+ 
+ CFLAGS		:= $(OPTFLAGS) -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
+ 		   -MMD -MP $(CFLAGS)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
similarity index 97%
rename from meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
rename to meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
index acef410..5cad22b 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
@@ -1,7 +1,7 @@
-From de44504fe7f7802cd474efd92ac15b5a8857db1f Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Thu, 16 Oct 2014 15:49:01 -0500
-Subject: [PATCH 05/14] RH: add mpathconf
+Subject: [PATCH] RH: add mpathconf
 
 mpathconf is a program (largely based on lvmcomf) to help users
 configure /etc/multipath.conf and enable or disable multipathing.  It
@@ -21,22 +21,22 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
  create mode 100644 multipath/mpathconf.8
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index aae69b8..c485748 100644
+index 0607403..5c98e48 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
-@@ -672,6 +672,7 @@ load_config (char * file)
+@@ -661,6 +661,7 @@ load_config (char * file)
+ 
+ 	} else {
  		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
- 		condlog(0, "A default multipath.conf file is located at");
- 		condlog(0, "/usr/share/doc/device-mapper-multipath-%d.%d.%d/multipath.conf", MULTIPATH_VERSION(VERSION_CODE));
 +		condlog(0, "You can run /sbin/mpathconf to create or modify /etc/multipath.conf");
  		if (conf->blist_devnode == NULL) {
  			conf->blist_devnode = vector_alloc();
  			if (!conf->blist_devnode) {
 diff --git a/multipath/Makefile b/multipath/Makefile
-index 1e9ee4b..3d4d459 100644
+index b9bbb3c..e720c7f 100644
 --- a/multipath/Makefile
 +++ b/multipath/Makefile
-@@ -18,10 +18,12 @@ $(EXEC): $(OBJS)
+@@ -18,10 +18,12 @@ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
  	$(CC) $(CFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBDEPS)
  	$(GZIP) $(EXEC).8 > $(EXEC).8.gz
  	$(GZIP) $(EXEC).conf.5 > $(EXEC).conf.5.gz
@@ -64,7 +64,7 @@ index 1e9ee4b..3d4d459 100644
  	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
 +	$(RM) $(DESTDIR)$(man8dir)/mpathconf.8.gz
  
- clean:
+ clean: dep_clean
  	$(RM) core *.o $(EXEC) *.gz
 diff --git a/multipath/mpathconf b/multipath/mpathconf
 new file mode 100644
@@ -644,5 +644,5 @@ index 0000000..4cd3267
 +.SH AUTHOR
 +Benjamin Marzinski <bmarzins@redhat.com>
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
similarity index 76%
rename from meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
rename to meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index dc291b8..ddf022f 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,7 +1,7 @@
-From 15179c830521d8f37f9254ebc6bbf150a409f956 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Fri, 17 Oct 2014 11:20:34 -0500
-Subject: [PATCH 06/14] RH: add wwids from kernel cmdline mpath.wwids with -A
+Subject: [PATCH] RH: add wwids from kernel cmdline mpath.wwids with -A
 
 This patch adds another option to multipath, "-A", which reads
 /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
@@ -22,13 +22,13 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
  5 files changed, 58 insertions(+), 3 deletions(-)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index bc70a27..88bb72b 100644
+index 53e7951..39e08cd 100644
 --- a/libmultipath/wwids.c
 +++ b/libmultipath/wwids.c
-@@ -321,3 +321,47 @@ remember_wwid(char *wwid)
- 		condlog(4, "wwid %s already in wwids file", wwid);
- 	return 0;
- }
+@@ -443,3 +443,47 @@ int op ## _wwid(const char *wwid) \
+ declare_failed_wwid_op(is_failed, false)
+ declare_failed_wwid_op(mark_failed, true)
+ declare_failed_wwid_op(unmark_failed, true)
 +
 +int remember_cmdline_wwid(void)
 +{
@@ -74,21 +74,22 @@ index bc70a27..88bb72b 100644
 +	return ret;
 +}
 diff --git a/libmultipath/wwids.h b/libmultipath/wwids.h
-index 9527012..b665232 100644
+index 0c6ee54..e32a0b0 100644
 --- a/libmultipath/wwids.h
 +++ b/libmultipath/wwids.h
-@@ -17,5 +17,6 @@ int remember_wwid(char *wwid);
+@@ -17,6 +17,7 @@ int remember_wwid(char *wwid);
  int check_wwids_file(char *wwid, int write_wwid);
  int remove_wwid(char *wwid);
  int replace_wwids(vector mp);
 +int remember_cmdline_wwid(void);
  
- #endif /* _WWIDS_H */
+ enum {
+ 	WWID_IS_NOT_FAILED = 0,
 diff --git a/multipath/main.c b/multipath/main.c
-index 4174d43..72585b0 100644
+index 6fdde03..7bac232 100644
 --- a/multipath/main.c
 +++ b/multipath/main.c
-@@ -102,7 +102,7 @@ usage (char * progname)
+@@ -109,7 +109,7 @@ usage (char * progname)
  {
  	fprintf (stderr, VERSION_STRING);
  	fprintf (stderr, "Usage:\n");
@@ -97,25 +98,25 @@ index 4174d43..72585b0 100644
  	fprintf (stderr, "  %s -l|-ll|-f [-v lvl] [-b fil] [-R num] [dev]\n", progname);
  	fprintf (stderr, "  %s -F [-v lvl] [-R num]\n", progname);
  	fprintf (stderr, "  %s -t\n", progname);
-@@ -116,6 +116,8 @@ usage (char * progname)
+@@ -123,6 +123,8 @@ usage (char * progname)
  		"  -f      flush a multipath device map\n"
  		"  -F      flush all multipath device maps\n"
  		"  -a      add a device wwid to the wwids file\n"
 +		"  -A      add devices from kernel command line mpath.wwids\n"
 +		"          parameters to wwids file\n"
  		"  -c      check if a device should be a path in a multipath device\n"
+ 		"  -C      check if a multipath device has usable paths\n"
  		"  -q      allow queue_if_no_path when multipathd is not running\n"
- 		"  -d      dry run, do not create or update devmaps\n"
-@@ -522,7 +524,7 @@ main (int argc, char *argv[])
+@@ -907,7 +909,7 @@ main (int argc, char *argv[])
  		exit(1);
  	multipath_conf = conf;
  	conf->retrigger_tries = 0;
--	while ((arg = getopt(argc, argv, ":adchl::FfM:v:p:b:BrR:itquwW")) != EOF ) {
-+	while ((arg = getopt(argc, argv, ":aAdchl::FfM:v:p:b:BrR:itquwW")) != EOF ) {
+-	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itquUwW")) != EOF ) {
++	while ((arg = getopt(argc, argv, ":aAdcChl::FfM:v:p:b:BrR:itquUwW")) != EOF ) {
  		switch(arg) {
  		case 1: printf("optarg : %s\n",optarg);
  			break;
-@@ -586,6 +588,10 @@ main (int argc, char *argv[])
+@@ -974,6 +976,10 @@ main (int argc, char *argv[])
  		case 't':
  			r = dump_config(conf);
  			goto out_free_config;
@@ -127,19 +128,19 @@ index 4174d43..72585b0 100644
  			usage(argv[0]);
  			exit(0);
 diff --git a/multipath/multipath.8 b/multipath/multipath.8
-index b9436e5..b9ad6b1 100644
+index 914a8cb..8c6a4c1 100644
 --- a/multipath/multipath.8
 +++ b/multipath/multipath.8
 @@ -25,7 +25,7 @@ multipath \- Device mapper target autoconfig.
  .RB [\| \-b\ \c
  .IR bindings_file \|]
  .RB [\| \-d \|]
--.RB [\| \-h | \-l | \-ll | \-f | \-t | \-F | \-B | \-c | \-q | \|-r | \|-i | \-a | \|-u | \-w | \-W \|]
-+.RB [\| \-h | \-l | \-ll | \-f | \-t | \-F | \-B | \-c | \-q | \|-r | \|-i | \-a | \-A | \-u | \-w | \-W \|]
+-.RB [\| \-h | \-l | \-ll | \-f | \-t | \-F | \-B | \-c | \-C | \-q | \-r | \-i | \-a | \-u | \-U | \-w | \-W \|]
++.RB [\| \-h | \-l | \-ll | \-f | \-t | \-F | \-B | \-c | \-C | \-q | \-r | \-i | \-a | \-A | \-u | \-U | \-w | \-W \|]
  .RB [\| \-p\ \c
  .IR failover | multibus | group_by_serial | group_by_prio | group_by_node_name \|]
  .RB [\| \-R\ \c
-@@ -122,6 +122,9 @@ Add the WWID for the specified device to the WWIDs file.
+@@ -135,6 +135,9 @@ Add the WWID for the specified device to the WWIDs file.
  Check if the device specified in the program environment should be
  a path in a multipath device.
  .
@@ -147,10 +148,10 @@ index b9436e5..b9ad6b1 100644
 +add wwids from any kernel command line mpath.wwid parameters to the wwids file
 +.
  .TP
- .B \-w
- Remove the WWID for the specified device from the WWIDs file.
+ .B \-U
+ Check if the device specified in the program environment is a multipath device
 diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index fafd088..a623a3f 100644
+index 17434ce..0fbcc46 100644
 --- a/multipathd/multipathd.service
 +++ b/multipathd/multipathd.service
 @@ -15,6 +15,7 @@ Type=notify
@@ -160,7 +161,7 @@ index fafd088..a623a3f 100644
 +ExecStartPre=-/sbin/multipath -A
  ExecStart=/sbin/multipathd -d -s
  ExecReload=/sbin/multipathd reconfigure
- 
+ TasksMax=infinity
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
new file mode 100644
index 0000000..a23e167
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -0,0 +1,121 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Mon, 6 Nov 2017 21:39:28 -0600
+Subject: [PATCH] RH: warn on invalid regex instead of failing
+
+multipath.conf used to allow "*" as a match everything regular expression,
+instead of requiring ".*". Instead of erroring when the old style
+regular expressions are used, it should print a warning and convert
+them.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/dict.c   | 27 +++++++++++++++++++++------
+ libmultipath/parser.c | 13 +++++++++++++
+ libmultipath/parser.h |  1 +
+ 3 files changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/libmultipath/dict.c b/libmultipath/dict.c
+index 7ad0f5a..ab808d6 100644
+--- a/libmultipath/dict.c
++++ b/libmultipath/dict.c
+@@ -55,6 +55,21 @@ set_str(vector strvec, void *ptr)
+ }
+ 
+ static int
++set_regex(vector strvec, void *ptr)
++{
++	char **str_ptr = (char **)ptr;
++
++	if (*str_ptr)
++		FREE(*str_ptr);
++	*str_ptr = set_regex_value(strvec);
++
++	if (!*str_ptr)
++		return 1;
++
++	return 0;
++}
++
++static int
+ set_yes_no(vector strvec, void *ptr)
+ {
+ 	char * buff;
+@@ -1271,7 +1286,7 @@ ble_ ## option ## _handler (struct config *conf, vector strvec)		\
+ 	if (!conf->option)						\
+ 		return 1;						\
+ 									\
+-	buff = set_value(strvec);					\
++	buff = set_regex_value(strvec);					\
+ 	if (!buff)							\
+ 		return 1;						\
+ 									\
+@@ -1287,7 +1302,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec) \
+ 	if (!conf->option)						\
+ 		return 1;						\
+ 									\
+-	buff = set_value(strvec);					\
++	buff = set_regex_value(strvec);					\
+ 	if (!buff)							\
+ 		return 1;						\
+ 									\
+@@ -1388,16 +1403,16 @@ device_handler(struct config *conf, vector strvec)
+ 	return 0;
+ }
+ 
+-declare_hw_handler(vendor, set_str)
++declare_hw_handler(vendor, set_regex)
+ declare_hw_snprint(vendor, print_str)
+ 
+-declare_hw_handler(product, set_str)
++declare_hw_handler(product, set_regex)
+ declare_hw_snprint(product, print_str)
+ 
+-declare_hw_handler(revision, set_str)
++declare_hw_handler(revision, set_regex)
+ declare_hw_snprint(revision, print_str)
+ 
+-declare_hw_handler(bl_product, set_str)
++declare_hw_handler(bl_product, set_regex)
+ declare_hw_snprint(bl_product, print_str)
+ 
+ declare_hw_handler(hwhandler, set_str)
+diff --git a/libmultipath/parser.c b/libmultipath/parser.c
+index b8b7e0d..34b4ad2 100644
+--- a/libmultipath/parser.c
++++ b/libmultipath/parser.c
+@@ -380,6 +380,19 @@ set_value(vector strvec)
+ 	return alloc;
+ }
+ 
++void *
++set_regex_value(vector strvec)
++{
++	char *buff = set_value(strvec);
++
++	if (buff && strcmp("*", buff) == 0) {
++		condlog(0, "Invalid regular expression \"*\" in multipath.conf. Using \".*\"");
++		FREE(buff);
++		return strdup(".*");
++	}
++	return buff;
++}
++
+ /* non-recursive configuration stream handler */
+ static int kw_level = 0;
+ 
+diff --git a/libmultipath/parser.h b/libmultipath/parser.h
+index 62906e9..b791705 100644
+--- a/libmultipath/parser.h
++++ b/libmultipath/parser.h
+@@ -77,6 +77,7 @@ extern void dump_keywords(vector keydump, int level);
+ extern void free_keywords(vector keywords);
+ extern vector alloc_strvec(char *string);
+ extern void *set_value(vector strvec);
++extern void *set_regex_value(vector strvec);
+ extern int process_file(struct config *conf, char *conf_file);
+ extern struct keyword * find_keyword(vector keywords, vector v, char * name);
+ int snprint_keyword(char *buff, int len, char *fmt, struct keyword *kw,
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch b/meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch
new file mode 100644
index 0000000..05e6864
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch
@@ -0,0 +1,29 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 7 Jun 2018 17:43:52 -0500
+Subject: [PATCH] RH: reset default find_mutipaths value to off
+
+Upstream has changed to default find_multipaths to "strict". For now
+Redhat will retain the previous default of "off".
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/defaults.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
+index f076b4b..70ba98a 100644
+--- a/libmultipath/defaults.h
++++ b/libmultipath/defaults.h
+@@ -17,7 +17,7 @@
+ #define DEFAULT_NO_PATH_RETRY	NO_PATH_RETRY_UNDEF
+ #define DEFAULT_VERBOSITY	2
+ #define DEFAULT_REASSIGN_MAPS	0
+-#define DEFAULT_FIND_MULTIPATHS	FIND_MULTIPATHS_STRICT
++#define DEFAULT_FIND_MULTIPATHS	FIND_MULTIPATHS_OFF
+ #define DEFAULT_FAST_IO_FAIL	5
+ #define DEFAULT_DEV_LOSS_TMO	600
+ #define DEFAULT_RETAIN_HWHANDLER RETAIN_HWHANDLER_ON
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
new file mode 100644
index 0000000..45cd32a
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
@@ -0,0 +1,49 @@
+From 8bdd4481d822b6625d8bf719431ca74ed1b5e021 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 16 Jul 2018 15:56:37 +0800
+Subject: [PATCH] multipath-tools: modify Makefile.inc for cross-compilation
+
+Do not look for systemd info on the host, and allow us to pass in CFLAGS
+using the OPTFLAGS variable.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+Update for version 0.5.0-144-g770e6d0
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Update for version 0.7.1
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+update for version 0.7.7
+
+remove change about CFLAGS part, since patch 0024 already have similar function.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.inc | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 57a1835..0c403c7 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -38,12 +38,6 @@ ifndef RUN
+ 	endif
+ endif
+ 
+-ifndef SYSTEMD
+-	ifeq ($(shell systemctl --version > /dev/null 2>&1 && echo 1), 1)
+-		SYSTEMD = $(shell systemctl --version 2> /dev/null |  sed -n 's/systemd \([0-9]*\)/\1/p')
+-	endif
+-endif
+-
+ ifndef SYSTEMDPATH
+ 	SYSTEMDPATH=usr/lib
+ endif
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
similarity index 81%
rename from meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch
rename to meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
index 52240f6..1281180 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
@@ -1,7 +1,7 @@
-From 1498338970a093fccbda3e33f5588a289ef2c66a Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 5 Jul 2017 02:59:46 -0400
-Subject: [PATCH 13/14] Always use devmapper
+From d929a1ea5e42ecbe30c990644ed4ada2817c6439 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 16 Jul 2018 16:00:14 +0800
+Subject: [PATCH]  Always use devmapper
 
 Do not try to compute several _API_ make variables
 from host information when cross-compiling.
@@ -14,12 +14,16 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Rebase to 0.7.1
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 0.7.7
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/Makefile | 19 ++++---------------
  1 file changed, 4 insertions(+), 15 deletions(-)
 
 diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index b3244fc..9006b3f 100644
+index f51786d..3ad9c48 100644
 --- a/libmultipath/Makefile
 +++ b/libmultipath/Makefile
 @@ -20,21 +20,10 @@ ifdef SYSTEMD
@@ -49,5 +53,5 @@ index b3244fc..9006b3f 100644
  OBJS = memory.o parser.o vector.o devmapper.o callout.o \
  	hwtable.o blacklist.o util.o dmparser.o config.o \
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
similarity index 73%
rename from meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch
rename to meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
index f951213..88a758d 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
@@ -1,7 +1,7 @@
-From 7f5869cd32a7b3f717d9544b35562d9d01ca6510 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 5 Jul 2017 03:03:16 -0400
-Subject: [PATCH 14/14] Always use devmapper for kpartx
+From 145f2b829e5362cda975bebafd7fe4d00ff56d1c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 16 Jul 2018 16:02:07 +0800
+Subject: [PATCH] Always use devmapper for kpartx
 
 Do not try to compute the LIBDM_API_COOKIE make variable
 from host information when cross-compiling.
@@ -13,12 +13,15 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 Rebase to 0.7.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 0.7.7
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  kpartx/Makefile | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/kpartx/Makefile b/kpartx/Makefile
-index bfa6fe8..be87124 100644
+index 7eb467e..c143321 100644
 --- a/kpartx/Makefile
 +++ b/kpartx/Makefile
 @@ -8,9 +8,7 @@ LDFLAGS += $(BIN_LDFLAGS)
@@ -33,5 +36,5 @@ index bfa6fe8..be87124 100644
  OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
  	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb
similarity index 60%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb
index 6ec5dff..213ce15 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb
@@ -31,25 +31,42 @@ LICENSE = "GPLv2"
 SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://multipathd.oe \
            file://multipath.conf.example \
-           file://0001-multipath-attempt-at-common-multipath.rules.patch \
-           file://0002-RH-fixup-udev-rules-for-redhat.patch \
-           file://0003-RH-Remove-the-property-blacklist-exception-builtin.patch \
-           file://0004-RH-don-t-start-without-a-config-file.patch \
-           file://0005-RH-add-mpathconf.patch \
-           file://0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch \
-           file://0007-RH-trigger-change-uevent-on-new-device-creation.patch \
-           file://0008-libmultipath-change-how-RADOS-checker-is-enabled.patch \
-           file://0009-multipath-set-verbosity-to-default-during-config.patch \
-           file://0010-mpath-skip-device-configs-without-vendor-product.patch \
-           file://0011-multipathd-fix-show-maps-json-crash.patch \
-           file://0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
-           file://0013-Always-use-devmapper.patch \
-           file://0014-Always-use-devmapper-for-kpartx.patch \
-           file://0001-kpartx-include-limits.h-for-PATH_MAX.patch \
+           file://0001-multipath-tools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch \
+           file://0002-multipath-tools-remove-c-from-__cpluscplus-misspelle.patch \
+           file://0003-multipath-tools-remove-emacs-autoconfig-of-kpartx-gp.patch \
+           file://0004-multipath-tools-replace-FSF-address-with-a-www-point.patch \
+           file://0005-multipath-tools-Remove-trailing-leading-whitespaces-.patch \
+           file://0006-multipath-tools-fix-compilation-with-musl-libc.patch \
+           file://0007-multipath-tools-add-x-to-doc-preclean.pl-and-split-m.patch \
+           file://0008-multipath-tools-refresh-kernel-doc-from-kernel-sourc.patch \
+           file://0009-multipath-tools-configure-hitachi-ams2000-and-hus100.patch \
+           file://0010-libmultipath-don-t-reject-maps-with-undefined-prio.patch \
+           file://0011-multipathd-handle-errors-in-uxlsnr-as-fatal.patch \
+           file://0012-libmultipath-fix-error-parsing-find_multipaths-stric.patch \
+           file://0013-libmultipath-print-correct-default-for-delay_-_check.patch \
+           file://0014-multipath.conf.5-clarify-property-whitelist-handling.patch \
+           file://0015-mpathpersist-add-all_tg_pt-option.patch \
+           file://0016-libmultipath-remove-rbd-code.patch \
+           file://0017-mpathpersist-fix-aptpl-support.patch \
+           file://0018-multipath-don-t-check-timestamps-without-a-path.patch \
+           file://0019-libmultipath-fix-detect-alua-corner-case.patch \
+           file://0020-multipath-fix-setting-conf-version.patch \
+           file://0021-RH-fixup-udev-rules-for-redhat.patch \
+           file://0022-RH-Remove-the-property-blacklist-exception-builtin.patch \
+           file://0023-RH-don-t-start-without-a-config-file.patch \
+           file://0024-RH-use-rpm-optflags-if-present.patch \
+           file://0025-RH-add-mpathconf.patch \
+           file://0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch \
+           file://0027-RH-warn-on-invalid-regex-instead-of-failing.patch \
+           file://0028-RH-reset-default-find_mutipaths-value-to-off.patch \
+           file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
+           file://0030-Always-use-devmapper.patch \
+           file://0031-Always-use-devmapper-for-kpartx.patch \
            "
+          
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "f21166a812a2cfb50ecf9550d32947c83103f83a"
+SRCREV = "386d288b5595fc2c01dffe698b6eb306c6674908"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


