Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC2177959
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 09:13:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v659DJFX018133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 5 Jul 2017 02:13:19 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 02:13:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 05:13:17 -0400
Message-ID: <1499245997-146367-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] multipath-tools: 0.6.4 -> 0.7.1
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
X-List-Received-Date: Wed, 05 Jul 2017 09:13:20 -0000
Content-Type: text/plain

1. In fedora/redhat, it is renamed to device-mapper-multipath,
use PROVIDE and RPROVIDE to support.

2. Split ${PN}-libs

3. Add multipath.conf.example

4. Backport patches from fedora:
git://pkgs.fedoraproject.org/rpms/device-mapper-multipath
- 0001 ~ 0011

5. Rebase local patches:
- makefile_inc.patch -> 0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
- always-use-libdevmapper.patch -> 0013-Always-use-devmapper.patch
- always-use-libdevmapper-kpartx.patch -> 0014-Always-use-devmapper-for-kpartx.patch

6. Drop obsolete patches:
- 0001-multipathd.service-Error-fix.patch
- shared-libs-avoid-linking-.so-as-executable.patch
- checkers-disable-libcheckrbd.so.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ltipath-attempt-at-common-multipath.rules.patch | 107 ++++
 .../files/0001-multipathd.service-Error-fix.patch  |  36 --
 .../0002-RH-fixup-udev-rules-for-redhat.patch      | 110 ++++
 ...-the-property-blacklist-exception-builtin.patch |  70 +++
 ...0004-RH-don-t-start-without-a-config-file.patch | 108 ++++
 .../files/0005-RH-add-mpathconf.patch              | 648 +++++++++++++++++++++
 ...ds-from-kernel-cmdline-mpath.wwids-with-A.patch | 166 ++++++
 ...gger-change-uevent-on-new-device-creation.patch | 138 +++++
 ...ipath-change-how-RADOS-checker-is-enabled.patch |  56 ++
 ...th-set-verbosity-to-default-during-config.patch |  40 ++
 ...kip-device-configs-without-vendor-product.patch |  37 ++
 .../0011-multipathd-fix-show-maps-json-crash.patch |  38 ++
 ...ools-modify-Makefile.inc-for-cross-compil.patch |  58 ++
 .../files/0013-Always-use-devmapper.patch          |  53 ++
 .../0014-Always-use-devmapper-for-kpartx.patch     |  37 ++
 .../files/always-use-libdevmapper-kpartx.patch     |  36 --
 .../files/always-use-libdevmapper.patch            |  57 --
 .../files/checkers-disable-libcheckrbd.so.patch    |  31 -
 .../multipath-tools/files/makefile_inc.patch       |  59 --
 .../multipath-tools/files/multipath.conf.example   |  90 +++
 ...ared-libs-avoid-linking-.so-as-executable.patch |  55 --
 .../multipath-tools/multipath-tools_0.7.1.bb       | 112 ++++
 .../multipath-tools/multipath-tools_git.bb         |  71 ---
 23 files changed, 1868 insertions(+), 345 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/multipath.conf.example
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
 delete mode 100644 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch
new file mode 100644
index 0000000..acb4269
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-attempt-at-common-multipath.rules.patch
@@ -0,0 +1,107 @@
+From 5ab50e0cb888e553a2635bbbf81eea3cdeffee60 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 12 Apr 2017 09:07:51 -0500
+Subject: [PATCH 01/14] multipath: attempt at common multipath.rules
+
+This is a proposal to try and bring the Redhat and SuSE multipath.rules
+closer. There are a couple of changes that I'd like some input on.
+
+The big change is moving the kpartx call into the multipath rules.  Half
+of the current kpartx.rules file is about creating symlinks for multiple
+types of dm devices. The other half auto-creates kpartx devices on top
+of multipath devices. Since it is only creating kpartx devices on top of
+multipath devices, I've moved the these rules into multipath.rules, or
+rather, I've replaced them with the redhat rules in multipath.rules. The
+biggest difference is the kpartx isn't run on every reload.  It works
+with the 11-dm-mpath.rules code to not run kpartx on multipathd
+generated reloads or when there aren't any working paths. It does
+remember if it didn't get to run kpartx when it was supposed to (because
+there were no valid paths or the device was suspended) and will make
+sure to run it on the next possible uevent.
+
+The other change is the redhat multipath rules remove the partition
+device nodes for devices claimed by multipath. The udev rule will only
+do this one time (both to keep from running partx on every event, and so
+that if users manually reread the partition table, we don't keep
+removing them when clearly they are wanted). Redhat does this because we
+had multiple customer issues where they were using the scsi partitions
+instead of the kpartx devices. Obviously, with setting the partition
+devices to not ready and clearing their fs_type, this isn't essential,
+but it has helped make customers do the right thing.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ kpartx/kpartx.rules       |  8 --------
+ multipath/multipath.rules | 27 ++++++++++++++++++++++++---
+ 2 files changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
+index a958791..906e320 100644
+--- a/kpartx/kpartx.rules
++++ b/kpartx/kpartx.rules
+@@ -34,12 +34,4 @@ ENV{ID_FS_LABEL_ENC}=="?*", IMPORT{db}="ID_FS_LABEL_ENC"
+ ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", \
+ 	SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
+ 
+-# Create dm tables for partitions
+-ENV{DM_ACTION}=="PATH_FAILED|PATH_REINSTATED", GOTO="kpartx_end"
+-ENV{DM_NR_VALID_PATHS}=="0", GOTO="kpartx_end"
+-ENV{ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
+-ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="kpartx_end"
+-ENV{DM_STATE}!="SUSPENDED", ENV{DM_UUID}=="mpath-*", \
+-	RUN+="/sbin/kpartx -un -p -part /dev/$name"
+-
+ LABEL="kpartx_end"
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules
+index 86defc0..616a04c 100644
+--- a/multipath/multipath.rules
++++ b/multipath/multipath.rules
+@@ -1,13 +1,13 @@
+ # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipath
+ SUBSYSTEM!="block", GOTO="end_mpath"
+ ACTION!="add|change", GOTO="end_mpath"
+-KERNEL!="sd*|dasd*", GOTO="end_mpath"
+-
++KERNEL!="sd*|dasd*|rbd*|dm-*", GOTO="end_mpath"
+ IMPORT{cmdline}="nompath"
+ ENV{nompath}=="?*", GOTO="end_mpath"
+ IMPORT{cmdline}="multipath"
+ ENV{multipath}=="off", GOTO="end_mpath"
+ 
++KERNEL=="dm-*", GOTO="check_kpartx"
+ ENV{DEVTYPE}!="partition", GOTO="test_dev"
+ IMPORT{parent}="DM_MULTIPATH_DEVICE_PATH"
+ ENV{DM_MULTIPATH_DEVICE_PATH}=="1", ENV{ID_FS_TYPE}="none", \
+@@ -21,7 +21,28 @@ TEST!="$env{MPATH_SBIN_PATH}/multipath", ENV{MPATH_SBIN_PATH}="/usr/sbin"
+ 
+ ENV{DM_MULTIPATH_DEVICE_PATH}!="1", \
+ 	PROGRAM=="$env{MPATH_SBIN_PATH}/multipath -u %k", \
+-	ENV{DM_MULTIPATH_DEVICE_PATH}="1", ENV{ID_FS_TYPE}="none", \
++	ENV{DM_MULTIPATH_DEVICE_PATH}="1", ENV{ID_FS_TYPE}="mpath_member", \
+ 	ENV{SYSTEMD_READY}="0"
+ 
++ENV{DM_MULTIPATH_DEVICE_PATH}!="1", GOTO="end_mpath"
++
++IMPORT{db}="DM_MULTIPATH_WIPE_PARTS"
++ENV{DM_MULTIPATH_WIPE_PARTS}!="1", ENV{DM_MULTIPATH_WIPE_PARTS}="1", \
++	RUN+="/sbin/partx -d --nr 1-1024 $env{DEVNAME}"
++GOTO="end_mpath"
++
++LABEL="check_kpartx"
++
++IMPORT{db}="DM_MULTIPATH_NEED_KPARTX"
++ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
++ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="end_mpath"
++ACTION!="change", GOTO="end_mpath"
++ENV{DM_UUID}!="mpath-?*", GOTO="end_mpath"
++ENV{DM_ACTIVATION}=="1", ENV{DM_MULTIPATH_NEED_KPARTX}="1"
++ENV{DM_SUSPENDED}=="1", GOTO="end_mpath"
++ENV{DM_ACTION}=="PATH_FAILED", GOTO="end_mpath"
++ENV{DM_ACTIVATION}!="1", ENV{DM_MULTIPATH_NEED_KPARTX}!="1", GOTO="end_mpath"
++RUN+="/sbin/kpartx -un -p -part /dev/$name"
++ENV{DM_MULTIPATH_NEED_KPARTX}=""
++
+ LABEL="end_mpath"
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch b/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
deleted file mode 100644
index 60c3c0a..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 630483b9738349c8b3e637a00879b96834a33cdb Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Tue, 7 Jul 2015 11:34:36 +0900
-Subject: [PATCH] multipathd.service: Error fix
-
-Failed to start Device-Mapper Multipath Device Controller.
-
-Upstream-Status: pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- multipathd/multipathd.service | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index e3d6f91..a7e00b2 100644
---- a/multipathd/multipathd.service
-+++ b/multipathd/multipathd.service
-@@ -8,11 +8,12 @@ Wants=local-fs-pre.target multipathd.socket blk-availability.service
- Conflicts=shutdown.target
- 
- [Service]
--Type=notify
-+Type=forking
- NotifyAccess=main
- LimitCORE=infinity
-+PIDFile=/var/run/multipathd.pid
- ExecStartPre=/sbin/modprobe -a scsi_dh_alua scsi_dh_emc scsi_dh_rdac dm-multipath
--ExecStart=/sbin/multipathd -d -s
-+ExecStart=/sbin/multipathd
- ExecReload=/sbin/multipathd reconfigure
- 
- [Install]
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch
new file mode 100644
index 0000000..e63d2eb
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0002-RH-fixup-udev-rules-for-redhat.patch
@@ -0,0 +1,110 @@
+From 158255383c02d3fb81c82fb9ec6fd36fb234f68e Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 13 Apr 2017 07:22:23 -0500
+Subject: [PATCH 02/14] RH: fixup udev rules for redhat
+
+The multipath rules need to run after scsi_id is run. This means moving
+them after 60-persistent-storage.rules for redhat. Also, we don't
+currently set up all the symlinks that SuSE does. If we want them, they
+should be done in the device-mapper package, since they are for all
+device-mapper devices. Redhat also uses a different naming scheme for
+partitions than SuSE.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ Makefile.inc              |  2 +-
+ kpartx/Makefile           | 14 +++++++-------
+ multipath/Makefile        |  4 ++--
+ multipath/multipath.rules |  3 ++-
+ 4 files changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 1815f9a..2591fa9 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -47,7 +47,7 @@ endif
+ 
+ prefix		=
+ exec_prefix	= $(prefix)
+-bindir		= $(exec_prefix)/sbin
++bindir		= $(exec_prefix)/usr/sbin
+ libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
+ udevrulesdir	= $(libudevdir)/rules.d
+ multipathdir	= $(TOPDIR)/libmultipath
+diff --git a/kpartx/Makefile b/kpartx/Makefile
+index 7b75032..bfa6fe8 100644
+--- a/kpartx/Makefile
++++ b/kpartx/Makefile
+@@ -26,19 +26,19 @@ $(EXEC): $(OBJS)
+ install: $(EXEC) $(EXEC).8
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
+ 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)
+-	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)
+-	$(INSTALL_PROGRAM) -m 755 kpartx_id $(DESTDIR)$(libudevdir)
+-	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)/rules.d
+-	$(INSTALL_PROGRAM) -m 644 kpartx.rules $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
++#	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)
++#	$(INSTALL_PROGRAM) -m 755 kpartx_id $(DESTDIR)$(libudevdir)
++#	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libudevdir)/rules.d
++#	$(INSTALL_PROGRAM) -m 644 kpartx.rules $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+ 
+ uninstall:
+ 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
+ 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
+-	$(RM) $(DESTDIR)$(libudevdir)/kpartx_id
+-	$(RM) $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
+-	$(RM) $(DESTDIR)$(libudevdir)/rules.d/67-kpartx-compat.rules
++#	$(RM) $(DESTDIR)$(libudevdir)/kpartx_id
++#	$(RM) $(DESTDIR)$(libudevdir)/rules.d/66-kpartx.rules
++#	$(RM) $(DESTDIR)$(libudevdir)/rules.d/67-kpartx-compat.rules
+ 
+ clean:
+ 	$(RM) core *.o $(EXEC) *.gz
+diff --git a/multipath/Makefile b/multipath/Makefile
+index c85314e..1e9ee4b 100644
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
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules
+index 616a04c..4d78b98 100644
+--- a/multipath/multipath.rules
++++ b/multipath/multipath.rules
+@@ -33,6 +33,7 @@ GOTO="end_mpath"
+ 
+ LABEL="check_kpartx"
+ 
++ENV{DM_UUID}=="mpath-?*|part[0-9]*-mpath-?*", OPTIONS+="link_priority=10"
+ IMPORT{db}="DM_MULTIPATH_NEED_KPARTX"
+ ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
+ ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="end_mpath"
+@@ -42,7 +43,7 @@ ENV{DM_ACTIVATION}=="1", ENV{DM_MULTIPATH_NEED_KPARTX}="1"
+ ENV{DM_SUSPENDED}=="1", GOTO="end_mpath"
+ ENV{DM_ACTION}=="PATH_FAILED", GOTO="end_mpath"
+ ENV{DM_ACTIVATION}!="1", ENV{DM_MULTIPATH_NEED_KPARTX}!="1", GOTO="end_mpath"
+-RUN+="/sbin/kpartx -un -p -part /dev/$name"
++RUN+="/sbin/kpartx -un /dev/$name"
+ ENV{DM_MULTIPATH_NEED_KPARTX}=""
+ 
+ LABEL="end_mpath"
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch
new file mode 100644
index 0000000..684e959
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0003-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -0,0 +1,70 @@
+From 69a67c2ed09ae51b53de402966a9f7a4cc737715 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 2 Jul 2014 12:49:53 -0500
+Subject: [PATCH 03/14] RH: Remove the property blacklist exception builtin
+
+Multipath set the default property blacklist exceptions to
+(ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
+devices.  These devices may never have multiple paths, but it is nice
+to be able to set multipath up on them all the same.  This patch simply
+removes the default, and makes it so that if no property
+blacklist_exception is given, then devices aren't failed for not matching
+it.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/blacklist.c   | 15 ++++++---------
+ multipath/multipath.conf.5 |  4 ----
+ 2 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
+index ee396e2..19d4697 100644
+--- a/libmultipath/blacklist.c
++++ b/libmultipath/blacklist.c
+@@ -181,12 +181,6 @@ setup_default_blist (struct config * conf)
+ 	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
+ 		return 1;
+ 
+-	str = STRDUP("(SCSI_IDENT_|ID_WWN)");
+-	if (!str)
+-		return 1;
+-	if (store_ble(conf->elist_property, str, ORIGIN_DEFAULT))
+-		return 1;
+-
+ 	vector_foreach_slot (conf->hwtable, hwe, i) {
+ 		if (hwe->bl_product) {
+ 			if (_blacklist_device(conf->blist_device, hwe->vendor,
+@@ -390,9 +384,12 @@ filter_property(struct config * conf, struct udev_device * udev)
+ 	 * This is the inverse of the 'normal' matching;
+ 	 * the environment variable _has_ to match.
+ 	 */
+-	log_filter(devname, NULL, NULL, NULL, NULL,
+-		   MATCH_PROPERTY_BLIST_MISSING);
+-	return MATCH_PROPERTY_BLIST_MISSING;
++	if (VECTOR_SIZE(conf->elist_property)) {
++		log_filter(devname, NULL, NULL, NULL, NULL,
++			   MATCH_PROPERTY_BLIST_MISSING);
++		return MATCH_PROPERTY_BLIST_MISSING;
++	}
++	return 0;
+ }
+ 
+ void
+diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
+index f04ff19..fbbbb27 100644
+--- a/multipath/multipath.conf.5
++++ b/multipath/multipath.conf.5
+@@ -1014,10 +1014,6 @@ The \fIWorld Wide Identification\fR of a device.
+ .TP
+ .B property
+ Regular expression of the udev property to be whitelisted.
+-.RS
+-.TP
+-The default is: \fB(SCSI_IDENT_|ID_WWN)\fR
+-.RE
+ .TP
+ .B device
+ Subsection for the device description. This subsection recognizes the
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch
new file mode 100644
index 0000000..87a6d3f
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-RH-don-t-start-without-a-config-file.patch
@@ -0,0 +1,108 @@
+From b2b504fc1959c7a3f0a843c3c204e8e193b675b7 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 15 Oct 2014 10:39:30 -0500
+Subject: [PATCH 04/14] RH: don't start without a config file
+
+If /etc/multipath.conf doesn't exist, don't start multipathd and blacklist
+all devices when running multipath.  A completely blank configuration file
+is almost never what users want.  Also, people may have the multipath
+packages installed but don't want to use them.  This patch provides a
+simple way to disable multipath.  Simply removing or renaming
+/etc/multipath.conf will keep multipath from doing anything.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/config.c         | 17 +++++++++++++++++
+ libmultipath/config.h         |  1 +
+ multipath/multipath.rules     |  1 +
+ multipathd/multipathd.8       |  2 ++
+ multipathd/multipathd.service |  1 +
+ 5 files changed, 22 insertions(+)
+
+diff --git a/libmultipath/config.c b/libmultipath/config.c
+index bb6619b..aae69b8 100644
+--- a/libmultipath/config.c
++++ b/libmultipath/config.c
+@@ -25,6 +25,7 @@
+ #include "prio.h"
+ #include "devmapper.h"
+ #include "mpath_cmd.h"
++#include "version.h"
+ 
+ static int
+ hwe_strmatch (struct hwentry *hwe1, struct hwentry *hwe2)
+@@ -667,6 +668,22 @@ load_config (char * file)
+ 			factorize_hwtable(conf->hwtable, builtin_hwtable_size);
+ 		}
+ 
++	} else {
++		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
++		condlog(0, "A default multipath.conf file is located at");
++		condlog(0, "/usr/share/doc/device-mapper-multipath-%d.%d.%d/multipath.conf", MULTIPATH_VERSION(VERSION_CODE));
++		if (conf->blist_devnode == NULL) {
++			conf->blist_devnode = vector_alloc();
++			if (!conf->blist_devnode) {
++				condlog(0, "cannot allocate blacklist\n");
++				goto out;
++			}
++		}
++		if (store_ble(conf->blist_devnode, strdup(".*"),
++		              ORIGIN_NO_CONFIG)) {
++			condlog(0, "cannot store default no-config blacklist\n");
++			goto out;
++		}
+ 	}
+ 
+ 	conf->processed_main_config = 1;
+diff --git a/libmultipath/config.h b/libmultipath/config.h
+index ffc69b5..614331c 100644
+--- a/libmultipath/config.h
++++ b/libmultipath/config.h
+@@ -7,6 +7,7 @@
+ 
+ #define ORIGIN_DEFAULT 0
+ #define ORIGIN_CONFIG  1
++#define ORIGIN_NO_CONFIG 2
+ 
+ /*
+  * In kernel, fast_io_fail == 0 means immediate failure on rport delete.
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules
+index 4d78b98..5753766 100644
+--- a/multipath/multipath.rules
++++ b/multipath/multipath.rules
+@@ -6,6 +6,7 @@ IMPORT{cmdline}="nompath"
+ ENV{nompath}=="?*", GOTO="end_mpath"
+ IMPORT{cmdline}="multipath"
+ ENV{multipath}=="off", GOTO="end_mpath"
++TEST!="/etc/multipath.conf", GOTO="end_mpath"
+ 
+ KERNEL=="dm-*", GOTO="check_kpartx"
+ ENV{DEVTYPE}!="partition", GOTO="test_dev"
+diff --git a/multipathd/multipathd.8 b/multipathd/multipathd.8
+index 4c765af..c1499a5 100644
+--- a/multipathd/multipathd.8
++++ b/multipathd/multipathd.8
+@@ -39,6 +39,8 @@ map regains its maximum performance and redundancy.
+ This daemon executes the external \fBmultipath\fR tool when events occur.
+ In turn, the multipath tool signals the multipathd daemon when it is done with
+ devmap reconfiguration, so that it can refresh its failed path list.
++
++In this Linux distribution, multipathd does not run unless a /etc/multipath.conffile exists
+ .
+ .
+ .\" ----------------------------------------------------------------------------
+diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
+index fd66cf6..fafd088 100644
+--- a/multipathd/multipathd.service
++++ b/multipathd/multipathd.service
+@@ -4,6 +4,7 @@ Wants=systemd-udev-trigger.service systemd-udev-settle.service
+ Before=iscsi.service iscsid.service lvm2-lvmetad.service lvm2-activation-early.service
+ Before=local-fs-pre.target blk-availability.service
+ After=multipathd.socket systemd-udev-trigger.service systemd-udev-settle.service
++ConditionPathExists=/etc/multipath.conf
+ DefaultDependencies=no
+ Conflicts=shutdown.target
+ ConditionKernelCommandLine=!nompath
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
new file mode 100644
index 0000000..acef410
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
@@ -0,0 +1,648 @@
+From de44504fe7f7802cd474efd92ac15b5a8857db1f Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 16 Oct 2014 15:49:01 -0500
+Subject: [PATCH 05/14] RH: add mpathconf
+
+mpathconf is a program (largely based on lvmcomf) to help users
+configure /etc/multipath.conf and enable or disable multipathing.  It
+has a couple of built-in options that can be set directly from the
+command line.  But, mostly it is used to get a multipath.conf file
+with the OS defaults, and to enable and disable multipathing via
+a single command.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/config.c |   1 +
+ multipath/Makefile    |   5 +
+ multipath/mpathconf   | 464 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ multipath/mpathconf.8 | 101 +++++++++++
+ 4 files changed, 571 insertions(+)
+ create mode 100644 multipath/mpathconf
+ create mode 100644 multipath/mpathconf.8
+
+diff --git a/libmultipath/config.c b/libmultipath/config.c
+index aae69b8..c485748 100644
+--- a/libmultipath/config.c
++++ b/libmultipath/config.c
+@@ -672,6 +672,7 @@ load_config (char * file)
+ 		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
+ 		condlog(0, "A default multipath.conf file is located at");
+ 		condlog(0, "/usr/share/doc/device-mapper-multipath-%d.%d.%d/multipath.conf", MULTIPATH_VERSION(VERSION_CODE));
++		condlog(0, "You can run /sbin/mpathconf to create or modify /etc/multipath.conf");
+ 		if (conf->blist_devnode == NULL) {
+ 			conf->blist_devnode = vector_alloc();
+ 			if (!conf->blist_devnode) {
+diff --git a/multipath/Makefile b/multipath/Makefile
+index 1e9ee4b..3d4d459 100644
+--- a/multipath/Makefile
++++ b/multipath/Makefile
+@@ -18,10 +18,12 @@ $(EXEC): $(OBJS)
+ 	$(CC) $(CFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBDEPS)
+ 	$(GZIP) $(EXEC).8 > $(EXEC).8.gz
+ 	$(GZIP) $(EXEC).conf.5 > $(EXEC).conf.5.gz
++	$(GZIP) mpathconf.8 > mpathconf.8.gz
+ 
+ install:
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
+ 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
++	$(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+ 	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
+@@ -29,13 +31,16 @@ install:
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).conf.5.gz $(DESTDIR)$(man5dir)
++	$(INSTALL_PROGRAM) -m 644 mpathconf.8.gz $(DESTDIR)$(man8dir)
+ 
+ uninstall:
+ 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
+ 	$(RM) $(DESTDIR)$(udevrulesdir)/11-dm-mpath.rules
+ 	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
++	$(RM) $(DESTDIR)$(bindir)/mpathconf
+ 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
+ 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
++	$(RM) $(DESTDIR)$(man8dir)/mpathconf.8.gz
+ 
+ clean:
+ 	$(RM) core *.o $(EXEC) *.gz
+diff --git a/multipath/mpathconf b/multipath/mpathconf
+new file mode 100644
+index 0000000..e839134
+--- /dev/null
++++ b/multipath/mpathconf
+@@ -0,0 +1,464 @@
++#!/bin/bash
++#
++# Copyright (C) 2010 Red Hat, Inc. All rights reserved.
++#
++# This file is part of the device-mapper-multipath package.
++#
++# This copyrighted material is made available to anyone wishing to use,
++# modify, copy, or redistribute it subject to the terms and conditions
++# of the GNU General Public License v.2.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software Foundation,
++# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++
++#
++# Simple editting of /etc/multipath.conf
++# This program was largely ripped off from lvmconf
++#
++
++unset ENABLE FIND FRIENDLY MODULE MULTIPATHD HAVE_DISABLE HAVE_WWID_DISABLE HAVE_FIND HAVE_BLACKLIST HAVE_EXCEPTIONS HAVE_DEFAULTS HAVE_FRIENDLY HAVE_MULTIPATHD HAVE_MODULE HAVE_OUTFILE SHOW_STATUS CHANGED_CONFIG WWID_LIST
++
++DEFAULT_CONFIG="# device-mapper-multipath configuration file
++
++# For a complete list of the default configuration values, run either:
++# # multipath -t
++# or
++# # multipathd show config
++
++# For a list of configuration options with descriptions, see the
++# multipath.conf man page.
++
++defaults {
++	user_friendly_names yes
++	find_multipaths yes
++}
++
++blacklist_exceptions {
++        property \"(SCSI_IDENT_|ID_WWN)\"
++}"
++
++CONFIGFILE="/etc/multipath.conf"
++OUTPUTFILE="/etc/multipath.conf"
++MULTIPATHDIR="/etc/multipath"
++TMPFILE="/etc/multipath/.multipath.conf.tmp"
++WWIDS=0
++
++function usage
++{
++	echo "usage: $0 <command>"
++	echo ""
++	echo "Commands:"
++	echo "Enable: --enable "
++	echo "Disable: --disable"
++	echo "Only allow certain wwids (instead of enable): --allow <WWID>"
++	echo "Set user_friendly_names (Default y): --user_friendly_names <y|n>"
++	echo "Set find_multipaths (Default y): --find_multipaths <y|n>"
++	echo "Load the dm-multipath modules on enable (Default y): --with_module <y|n>"
++	echo "start/stop/reload multipathd (Default n): --with_multipathd <y|n>"
++	echo "select output file (Default /etc/multipath.conf): --outfile <FILE>"
++	echo ""
++}
++
++function add_wwid
++{
++	INDEX=0
++	while [ "$INDEX" -lt "$WWIDS" ] ; do
++		if [ "$1" = "${WWID_LIST[$INDEX]}" ] ; then
++			return
++		fi
++		((INDEX++))
++	done
++	WWID_LIST[$WWIDS]="$1"
++	((WWIDS++))
++}
++
++function get_dm_deps
++{
++	shift 3
++	while [ -n "$1" -a -n "$2" ]; do
++		MAJOR=$(echo $1 | tr -d '(,')
++		MINOR=$(echo $2 | tr -d ')')
++		UUID=`dmsetup info -c --noheadings -o uuid -j $MAJOR -m $MINOR  2> /dev/null`
++		if [ -n "$UUID" ] ; then
++			set_dm_wwid $UUID
++		fi
++		shift 2
++	done
++}
++
++function set_dm_wwid
++{
++	if [[ "$1" =~ ^part[[:digit:]]+-mpath- ]] ; then
++		add_wwid "${1##part*-mpath-}"
++	elif [[ "$1" =~ ^mpath- ]] ; then
++		add_wwid "${1##mpath-}"
++	else
++		get_dm_deps `dmsetup deps -u $1`
++	fi
++}
++
++function set_wwid
++{
++	UUID=""
++	if [[ "$1" =~ ^[[:digit:]]+:[[:digit:]]+$ ]] ; then
++		MAJOR=${1%%:*}
++		MINOR=${1##*:}
++		UUID=`dmsetup info -c --noheadings -o uuid -j $MAJOR -m $MINOR  2> /dev/null`
++	else
++		UUID=`dmsetup info -c --noheadings -o uuid $1 2> /dev/null`
++	fi
++	if [ -n "$UUID" ] ; then
++		set_dm_wwid $UUID
++	else
++		add_wwid "$1"
++	fi
++}
++
++function parse_args
++{
++	while [ -n "$1" ]; do
++		case $1 in
++			--enable)
++				ENABLE=1
++				shift
++				;;
++			--disable)
++				ENABLE=0
++				shift
++				;;
++			--allow)
++				ENABLE=2
++				if [ -n "$2" ]; then
++					set_wwid $2
++					shift 2
++				else
++					usage
++					exit 1
++				fi
++				;;
++			--user_friendly_names)
++				if [ -n "$2" ]; then
++					FRIENDLY=$2
++					shift 2
++				else
++					usage
++					exit 1
++				fi
++				;;
++			--find_multipaths)
++				if [ -n "$2" ]; then
++					FIND=$2
++					shift 2
++				else
++					usage
++					exit 1
++				fi
++				;;
++			--with_module)
++				if [ -n "$2" ]; then
++					MODULE=$2
++					shift 2
++				else
++					usage
++					exit 1
++				fi
++				;;
++			--with_multipathd)
++				if [ -n "$2" ]; then
++					MULTIPATHD=$2
++					shift 2
++				else
++					usage
++					exit 1
++				fi
++				;;
++			--outfile)
++				if [ -n "$2" ]; then
++					OUTPUTFILE=$2
++					HAVE_OUTFILE=1
++					shift 2
++				else
++					usage
++					exit 1
++				fi
++				;;
++			*)
++				usage
++				exit
++		esac
++	done
++}
++
++function validate_args
++{
++	if [ "$ENABLE" = "0" ] && [ -n "$FRIENDLY" -o -n "$FIND" -o -n "$MODULE" ]; then
++		echo "ignoring extra parameters on disable"
++		FRIENDLY=""
++		FIND=""
++		MODULE=""
++	fi
++	if [ -n "$FRIENDLY" ] && [ "$FRIENDLY" != "y" -a "$FRIENDLY" != "n" ]; then
++		echo "--user_friendly_names must be either 'y' or 'n'"
++		exit 1
++	fi
++	if [ -n "$FIND" ] && [ "$FIND" != "y" -a "$FIND" != "n" ]; then
++		echo "--find_multipaths must be either 'y' or 'n'"
++		exit 1
++	fi
++	if [ -z "$ENABLE" -a -z "$FIND" -a -z "$FRIENDLY" ]; then
++		SHOW_STATUS=1
++	fi
++	if [ -n "$MODULE" ] && [ "$MODULE" != "y" -a "$MODULE" != "n" ]; then
++		echo "--with_module must be either 'y' or 'n'"
++		exit 1
++	fi
++	if [ -n "$MULTIPATHD" ] && [ "$MULTIPATHD" != "y" -a "$MULTIPATHD" != "n" ]; then
++		echo "--with_multipathd must be either 'y' or 'n'"
++		exit 1
++	fi
++	if [ "$ENABLE" = 2 -a -z "$HAVE_OUTFILE" ]; then
++		echo "Because --allow makes changes that cannot be automatically reversed,"
++		echo "you must set --outfile when you set --allow"
++		exit 1
++	fi
++}
++
++function add_blacklist_exceptions
++{
++	INDEX=0
++	while [ "$INDEX" -lt "$WWIDS" ] ; do
++		sed -i '/^blacklist_exceptions[[:space:]]*{/ a\
++	wwid '"\"${WWID_LIST[$INDEX]}\""'
++' $TMPFILE
++		((INDEX++))
++	done
++}
++
++umask 0077
++
++parse_args "$@"
++
++validate_args
++
++if [ ! -d "$MULTIPATHDIR" ]; then
++	echo "/etc/multipath/ does not exist. failing"
++	exit 1
++fi
++
++rm $TMPFILE 2> /dev/null
++echo "$DEFAULT_CONFIG" > $TMPFILE
++if [ -f "$CONFIGFILE" ]; then
++	cp $CONFIGFILE $TMPFILE
++fi
++
++if grep -q "^blacklist[[:space:]]*{" $TMPFILE ; then
++	HAVE_BLACKLIST=1
++fi
++
++if grep -q "^blacklist_exceptions[[:space:]]*{" $TMPFILE ; then
++	HAVE_EXCEPTIONS=1
++fi
++
++if grep -q "^defaults[[:space:]]*{" $TMPFILE ; then
++	HAVE_DEFAULTS=1
++fi
++
++if [ -z "$MODULE" -o "$MODULE" = "y" ]; then
++	if lsmod | grep -q "dm_multipath" ; then
++		HAVE_MODULE=1
++	else
++		HAVE_MODULE=0
++	fi
++fi
++
++if [ "$MULTIPATHD" = "y" ]; then
++	if /bin/systemctl status multipathd.service > /dev/null 2>&1 ; then
++		HAVE_MULTIPATHD=1
++	else
++		HAVE_MULTIPATHD=0
++	fi
++fi
++
++if [ "$HAVE_BLACKLIST" = "1" ]; then
++	if sed -n '/^blacklist[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*devnode \"\.\?\*\"" ; then
++		HAVE_DISABLE=1
++	elif sed -n '/^blacklist[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*#[[:space:]]*devnode \"\.\?\*\"" ; then
++		HAVE_DISABLE=0
++	fi
++fi
++
++if [ "$HAVE_BLACKLIST" = "1" ]; then
++	if sed -n '/^blacklist[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*wwid \"\.\?\*\"" ; then
++		HAVE_WWID_DISABLE=1
++	elif sed -n '/^blacklist[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*#[[:space:]]*wwid \"\.\?\*\"" ; then
++		HAVE_WWID_DISABLE=0
++	fi
++fi
++
++if [ "$HAVE_DEFAULTS" = "1" ]; then
++	if sed -n '/^defaults[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*find_multipaths[[:space:]]*\(yes\|1\)" ; then
++		HAVE_FIND=1
++	elif sed -n '/^defaults[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*find_multipaths[[:space:]]*\(no\|0\)" ; then
++		HAVE_FIND=0
++	fi
++	if sed -n '/^defaults[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*user_friendly_names[[:space:]]*\(yes\|1\)" ; then
++		HAVE_FRIENDLY=1
++	elif sed -n '/^defaults[[:space:]]*{/,/^}/ p' $TMPFILE | grep -q "^[[:space:]]*user_friendly_names[[:space:]]*\(no\|0\)" ; then
++		HAVE_FRIENDLY=0
++	fi
++fi
++
++if [ -n "$SHOW_STATUS" ]; then
++	if [ -z "$HAVE_DISABLE" -o "$HAVE_DISABLE" = 0 ]; then
++		echo "multipath is enabled"
++	else
++		echo "multipath is disabled"
++	fi
++	if [ -z "$HAVE_FIND"  -o "$HAVE_FIND" = 0 ]; then
++		echo "find_multipaths is disabled"
++	else
++		echo "find_multipaths is enabled"
++	fi
++	if [ -z "$HAVE_FRIENDLY" -o "$HAVE_FRIENDLY" = 0 ]; then
++		echo "user_friendly_names is disabled"
++	else
++		echo "user_friendly_names is enabled"
++	fi
++	if [ -n "$HAVE_MODULE" ]; then
++		if [ "$HAVE_MODULE" = 1 ]; then
++			echo "dm_multipath module is loaded"
++		else
++			echo "dm_multipath module is not loaded"
++		fi
++	fi
++	if [ -z "$HAVE_MULTIPATHD" ]; then
++		if /bin/systemctl status multipathd.service > /dev/null 2>&1 ; then
++			HAVE_MULTIPATHD=1
++		else
++			HAVE_MULTIPATHD=0
++		fi
++	fi
++	if [ "$HAVE_MULTIPATHD" = 1 ]; then
++		echo "multipathd is running"
++	else
++		echo "multipathd is not running"
++	fi
++	exit 0
++fi
++
++if [ -z "$HAVE_BLACKLIST" ]; then
++	cat >> $TMPFILE <<- _EOF_
++
++blacklist {
++}
++_EOF_
++fi
++
++if [ -z "$HAVE_DEFAULTS" ]; then
++	cat >> $TMPFILE <<- _EOF_
++
++defaults {
++}
++_EOF_
++fi
++
++if [ "$ENABLE" = 2 ]; then
++	if [ "$HAVE_DISABLE" = 1 ]; then
++		sed -i '/^blacklist[[:space:]]*{/,/^}/ s/^[[:space:]]*devnode \"\.\?\*\"/#	devnode ".*"/' $TMPFILE
++	fi
++	if [ -z "$HAVE_WWID_DISABLE" ]; then
++		sed -i '/^blacklist[[:space:]]*{/ a\
++	wwid ".*"
++' $TMPFILE
++	elif [ "$HAVE_WWID_DISABLE" = 0 ]; then
++		sed -i '/^blacklist[[:space:]]*{/,/^}/ s/^[[:space:]]*#[[:space:]]*wwid \"\.\?\*\"/	wwid ".*"/' $TMPFILE
++	fi
++	if [ "$HAVE_EXCEPTIONS" = 1 ]; then
++		sed -i '/^blacklist_exceptions[[:space:]]*{/,/^}/ {/^[[:space:]]*wwid/ d}' $TMPFILE
++	else
++		cat >> $TMPFILE <<- _EOF_
++
++blacklist_exceptions {
++}
++_EOF_
++	fi
++	add_blacklist_exceptions
++elif [ "$ENABLE" = 1 ]; then
++	if [ "$HAVE_DISABLE" = 1 ]; then
++		sed -i '/^blacklist[[:space:]]*{/,/^}/ s/^[[:space:]]*devnode \"\.\?\*\"/#	devnode ".*"/' $TMPFILE
++	fi
++elif [ "$ENABLE" = 0 ]; then
++	if [ -z "$HAVE_DISABLE" ]; then
++		sed -i '/^blacklist[[:space:]]*{/ a\
++	devnode ".*"
++' $TMPFILE
++	elif [ "$HAVE_DISABLE" = 0 ]; then
++		sed -i '/^blacklist[[:space:]]*{/,/^}/ s/^[[:space:]]*#[[:space:]]*devnode \"\.\?\*\"/	devnode ".*"/' $TMPFILE
++	fi
++fi
++
++if [ "$FIND" = "n" ]; then
++	if [ "$HAVE_FIND" = 1 ]; then
++		sed -i '/^defaults[[:space:]]*{/,/^}/ s/^[[:space:]]*find_multipaths[[:space:]]*\(yes\|1\)/	find_multipaths no/' $TMPFILE
++		CHANGED_CONFIG=1
++	fi
++elif [ "$FIND" = "y" ]; then
++	if [ -z "$HAVE_FIND" ]; then
++		sed -i '/^defaults[[:space:]]*{/ a\
++	find_multipaths yes
++' $TMPFILE
++		CHANGED_CONFIG=1
++	elif [ "$HAVE_FIND" = 0 ]; then
++		sed -i '/^defaults[[:space:]]*{/,/^}/ s/^[[:space:]]*find_multipaths[[:space:]]*\(no\|0\)/	find_multipaths yes/' $TMPFILE
++		CHANGED_CONFIG=1
++	fi
++fi
++
++if [ "$FRIENDLY" = "n" ]; then
++	if [ "$HAVE_FRIENDLY" = 1 ]; then
++		sed -i '/^defaults[[:space:]]*{/,/^}/ s/^[[:space:]]*user_friendly_names[[:space:]]*\(yes\|1\)/	user_friendly_names no/' $TMPFILE
++		CHANGED_CONFIG=1
++	fi
++elif [ "$FRIENDLY" = "y" ]; then
++	if [ -z "$HAVE_FRIENDLY" ]; then
++		sed -i '/^defaults[[:space:]]*{/ a\
++	user_friendly_names yes
++' $TMPFILE
++		CHANGED_CONFIG=1
++	elif [ "$HAVE_FRIENDLY" = 0 ]; then
++		sed -i '/^defaults[[:space:]]*{/,/^}/ s/^[[:space:]]*user_friendly_names[[:space:]]*\(no\|0\)/	user_friendly_names yes/' $TMPFILE
++		CHANGED_CONFIG=1
++	fi
++fi
++
++if [ -f "$OUTPUTFILE" ]; then
++	cp $OUTPUTFILE $OUTPUTFILE.old
++	if [ $? != 0 ]; then
++		echo "failed to backup old config file, $OUTPUTFILE not updated"
++		exit 1
++	fi
++fi
++
++cp $TMPFILE $OUTPUTFILE
++if [ $? != 0 ]; then
++	echo "failed to copy new config file into place, check $OUTPUTFILE is still OK"
++	exit 1
++fi
++
++rm -f $TMPFILE
++
++if [ "$ENABLE" = 1 ]; then
++	if [ "$HAVE_MODULE" = 0 ]; then
++		modprobe dm_multipath
++	fi
++	if [ "$HAVE_MULTIPATHD" = 0 ]; then
++		systemctl start multipathd.service
++	fi
++elif [ "$ENABLE" = 0 ]; then
++	if [ "$HAVE_MULTIPATHD" = 1 ]; then
++		systemctl stop multipathd.service
++	fi
++elif [ -n "$CHANGED_CONFIG" -a "$HAVE_MULTIPATHD" = 1 ]; then
++	systemctl reload multipathd.service
++fi
+diff --git a/multipath/mpathconf.8 b/multipath/mpathconf.8
+new file mode 100644
+index 0000000..4cd3267
+--- /dev/null
++++ b/multipath/mpathconf.8
+@@ -0,0 +1,101 @@
++.TH MPATHCONF 8 "June 2010" "" "Linux Administrator's Manual"
++.SH NAME
++mpathconf - A tool for configuring device-mapper-multipath
++.SH SYNOPSIS
++.B mpathconf
++.RB [\| commands \|]
++.RB [\| options \|]
++.SH DESCRIPTION
++.B mpathconf
++is a utility that creates or modifies
++.B /etc/multipath.conf.
++It can enable or disable multipathing and configure some common options.
++.B mpathconf
++can also load the
++.B dm_multipath
++module, start and stop the
++.B multipathd
++daemon, and configure the
++.B multipathd
++service to start automatically or not. If
++.B mpathconf
++is called with no commands, it will display the current configuration.
++
++The default options for mpathconf are
++.B --with_module
++The
++.B --with_multipathd
++option is not set by default.  Enabling multipathing will load the
++.B dm_multipath
++module but it will not immediately start it. This is so
++that users can manually edit their config file if necessary, before starting
++.B multipathd.
++
++If
++.B /etc/multipath.conf
++already exists, mpathconf will edit it. If it does not exist, mpathconf will
++create a default file with
++.B user_friendly_names
++and
++.B find_multipaths
++set. To disable these, use the
++.B --user_friendly_names n
++and
++.B --find_multipaths n
++options
++.SH COMMANDS
++.TP
++.B --enable
++Removes any line that blacklists all device nodes from the
++.B /etc/multipath.conf
++blacklist section.
++.TP
++.B --disable
++Adds a line that blacklists all device nodes to the
++.B /etc/multipath.conf
++blacklist section. If no blacklist section exists, it will create one.
++.TP
++.B --user_friendly_name \fP { \fBy\fP | \fBn\fP }
++If set to \fBy\fP, this adds the line
++.B user_friendly_names yes
++to the
++.B /etc/multipath.conf
++defaults section. If set to \fBn\fP, this removes the line, if present. This
++command can be used along with any other command.
++.TP
++.B --find_multipaths\fP { \fBy\fP | \fBn\fP }
++If set to \fBy\fP, this adds the line
++.B find_multipaths yes
++to the
++.B /etc/multipath.conf
++defaults section. If set to \fBn\fP, this removes the line, if present. This
++command can be used aldong with any other command.
++.SH OPTIONS
++.TP
++.B --with_module\fP { \fBy\fP | \fBn\fP }
++If set to \fBy\fP, this runs
++.B modprobe dm_multipath
++to install the multipath modules. This option only works with the
++.B --enable
++command. This option is set to \fBy\fP by default.
++.TP
++.B --with_multipathd { \fBy\fP | \fBn\fP }
++If set to \fBy\fP, this runs
++.B service multipathd start
++to start the multipathd daemon on \fB--enable\fP,
++.B service multipathd stop
++to stop the multipathd daemon on \fB--disable\fP, and
++.B service multipathd reload
++to reconfigure multipathd on \fB--user_frindly_names\fP and
++\fB--find_multipaths\fP.
++This option is set to \fBn\fP by default.
++.SH FILES
++.BR /etc/multipath.conf
++.SH "SEE ALSO"
++.BR multipath.conf (5),
++.BR modprobe (8),
++.BR multipath (8),
++.BR multipathd (8),
++.BR service (8),
++.SH AUTHOR
++Benjamin Marzinski <bmarzins@redhat.com>
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
new file mode 100644
index 0000000..dc291b8
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -0,0 +1,166 @@
+From 15179c830521d8f37f9254ebc6bbf150a409f956 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Fri, 17 Oct 2014 11:20:34 -0500
+Subject: [PATCH 06/14] RH: add wwids from kernel cmdline mpath.wwids with -A
+
+This patch adds another option to multipath, "-A", which reads
+/proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
+to /etc/multipath/wwids.  While this isn't usually important during
+normal operation, since these wwids should already be added, it can be
+helpful during installation, to make sure that multipath can claim
+devices as its own, before LVM or something else makes use of them.  The
+patch also execs "/sbin/multipath -A" before running multipathd in
+multipathd.service
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/wwids.c          | 44 +++++++++++++++++++++++++++++++++++++++++++
+ libmultipath/wwids.h          |  1 +
+ multipath/main.c              | 10 ++++++++--
+ multipath/multipath.8         |  5 ++++-
+ multipathd/multipathd.service |  1 +
+ 5 files changed, 58 insertions(+), 3 deletions(-)
+
+diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
+index bc70a27..88bb72b 100644
+--- a/libmultipath/wwids.c
++++ b/libmultipath/wwids.c
+@@ -321,3 +321,47 @@ remember_wwid(char *wwid)
+ 		condlog(4, "wwid %s already in wwids file", wwid);
+ 	return 0;
+ }
++
++int remember_cmdline_wwid(void)
++{
++	FILE *f = NULL;
++	char buf[LINE_MAX], *next, *ptr;
++	int ret = 0;
++
++	f = fopen("/proc/cmdline", "re");
++	if (!f) {
++		condlog(0, "can't open /proc/cmdline : %s", strerror(errno));
++		return -1;
++	}
++
++	if (!fgets(buf, sizeof(buf), f)) {
++		if (ferror(f))
++			condlog(0, "read of /proc/cmdline failed : %s",
++				strerror(errno));
++		else
++			condlog(0, "couldn't read /proc/cmdline");
++		fclose(f);
++		return -1;
++	}
++	fclose(f);
++	next = buf;
++	while((ptr = strstr(next, "mpath.wwid="))) {
++		ptr += 11;
++		next = strpbrk(ptr, " \t\n");
++		if (next) {
++			*next = '\0';
++			next++;
++		}
++		if (strlen(ptr)) {
++			if (remember_wwid(ptr) != 0)
++				ret = -1;
++		}
++		else {
++			condlog(0, "empty mpath.wwid kernel command line option");
++			ret = -1;
++		}
++		if (!next)
++			break;
++	}
++	return ret;
++}
+diff --git a/libmultipath/wwids.h b/libmultipath/wwids.h
+index 9527012..b665232 100644
+--- a/libmultipath/wwids.h
++++ b/libmultipath/wwids.h
+@@ -17,5 +17,6 @@ int remember_wwid(char *wwid);
+ int check_wwids_file(char *wwid, int write_wwid);
+ int remove_wwid(char *wwid);
+ int replace_wwids(vector mp);
++int remember_cmdline_wwid(void);
+ 
+ #endif /* _WWIDS_H */
+diff --git a/multipath/main.c b/multipath/main.c
+index 4174d43..72585b0 100644
+--- a/multipath/main.c
++++ b/multipath/main.c
+@@ -102,7 +102,7 @@ usage (char * progname)
+ {
+ 	fprintf (stderr, VERSION_STRING);
+ 	fprintf (stderr, "Usage:\n");
+-	fprintf (stderr, "  %s [-a|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
++	fprintf (stderr, "  %s [-a|-A|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
+ 	fprintf (stderr, "  %s -l|-ll|-f [-v lvl] [-b fil] [-R num] [dev]\n", progname);
+ 	fprintf (stderr, "  %s -F [-v lvl] [-R num]\n", progname);
+ 	fprintf (stderr, "  %s -t\n", progname);
+@@ -116,6 +116,8 @@ usage (char * progname)
+ 		"  -f      flush a multipath device map\n"
+ 		"  -F      flush all multipath device maps\n"
+ 		"  -a      add a device wwid to the wwids file\n"
++		"  -A      add devices from kernel command line mpath.wwids\n"
++		"          parameters to wwids file\n"
+ 		"  -c      check if a device should be a path in a multipath device\n"
+ 		"  -q      allow queue_if_no_path when multipathd is not running\n"
+ 		"  -d      dry run, do not create or update devmaps\n"
+@@ -522,7 +524,7 @@ main (int argc, char *argv[])
+ 		exit(1);
+ 	multipath_conf = conf;
+ 	conf->retrigger_tries = 0;
+-	while ((arg = getopt(argc, argv, ":adchl::FfM:v:p:b:BrR:itquwW")) != EOF ) {
++	while ((arg = getopt(argc, argv, ":aAdchl::FfM:v:p:b:BrR:itquwW")) != EOF ) {
+ 		switch(arg) {
+ 		case 1: printf("optarg : %s\n",optarg);
+ 			break;
+@@ -586,6 +588,10 @@ main (int argc, char *argv[])
+ 		case 't':
+ 			r = dump_config(conf);
+ 			goto out_free_config;
++		case 'A':
++			if (remember_cmdline_wwid() != 0)
++				exit(1);
++			exit(0);
+ 		case 'h':
+ 			usage(argv[0]);
+ 			exit(0);
+diff --git a/multipath/multipath.8 b/multipath/multipath.8
+index b9436e5..b9ad6b1 100644
+--- a/multipath/multipath.8
++++ b/multipath/multipath.8
+@@ -25,7 +25,7 @@ multipath \- Device mapper target autoconfig.
+ .RB [\| \-b\ \c
+ .IR bindings_file \|]
+ .RB [\| \-d \|]
+-.RB [\| \-h | \-l | \-ll | \-f | \-t | \-F | \-B | \-c | \-q | \|-r | \|-i | \-a | \|-u | \-w | \-W \|]
++.RB [\| \-h | \-l | \-ll | \-f | \-t | \-F | \-B | \-c | \-q | \|-r | \|-i | \-a | \-A | \-u | \-w | \-W \|]
+ .RB [\| \-p\ \c
+ .IR failover | multibus | group_by_serial | group_by_prio | group_by_node_name \|]
+ .RB [\| \-R\ \c
+@@ -122,6 +122,9 @@ Add the WWID for the specified device to the WWIDs file.
+ Check if the device specified in the program environment should be
+ a path in a multipath device.
+ .
++.B \-A
++add wwids from any kernel command line mpath.wwid parameters to the wwids file
++.
+ .TP
+ .B \-w
+ Remove the WWID for the specified device from the WWIDs file.
+diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
+index fafd088..a623a3f 100644
+--- a/multipathd/multipathd.service
++++ b/multipathd/multipathd.service
+@@ -15,6 +15,7 @@ Type=notify
+ NotifyAccess=main
+ LimitCORE=infinity
+ ExecStartPre=-/sbin/modprobe -a scsi_dh_alua scsi_dh_emc scsi_dh_rdac dm-multipath
++ExecStartPre=-/sbin/multipath -A
+ ExecStart=/sbin/multipathd -d -s
+ ExecReload=/sbin/multipathd reconfigure
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch b/meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch
new file mode 100644
index 0000000..025a351
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0007-RH-trigger-change-uevent-on-new-device-creation.patch
@@ -0,0 +1,138 @@
+From 0d2c9afbd89d79fd700f9c99aa20e5f7c7382027 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Mon, 24 Apr 2017 09:39:57 -0500
+Subject: [PATCH 07/14] RH: trigger change uevent on new device creation
+
+When multipath first sees a path device with user_friendly names
+enabled, it can't know if the device should be multipathed. This means
+that it will not claim the device in udev.  If the device is eventually
+multipathed, multipath should trigger a change uevent to update the udev
+database to claim the device.
+
+This also reverts commit 64e27ec066a001012f44550f095c93443e91d845.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/configure.c | 26 ++++++++++++++++++++++++--
+ libmultipath/configure.h |  1 +
+ libmultipath/wwids.c     |  4 ++--
+ multipath/main.c         |  2 +-
+ multipathd/main.c        |  7 ++-----
+ 5 files changed, 30 insertions(+), 10 deletions(-)
+
+diff --git a/libmultipath/configure.c b/libmultipath/configure.c
+index bd090d9..843dd09 100644
+--- a/libmultipath/configure.c
++++ b/libmultipath/configure.c
+@@ -422,6 +422,28 @@ trigger_udev_change(const struct multipath *mpp)
+ 	udev_device_unref(udd);
+ }
+ 
++void
++trigger_paths_udev_change(const struct multipath *mpp)
++{
++	struct pathgroup * pgp;
++	struct path * pp;
++	int i, j;
++
++	if (!mpp || !mpp->pg)
++		return;
++
++	vector_foreach_slot (mpp->pg, pgp, i) {
++		if (!pgp->paths)
++			continue;
++		vector_foreach_slot(pgp->paths, pp, j) {
++			if (!pp->udev)
++				continue;
++			sysfs_attr_set_value(pp->udev, "uevent", "change",
++					     strlen("change"));
++		}
++	}
++}
++
+ static int
+ is_mpp_known_to_udev(const struct multipath *mpp)
+ {
+@@ -802,8 +824,8 @@ int domap(struct multipath *mpp, char *params, int is_daemon)
+ 		 * succeeded
+ 		 */
+ 		mpp->force_udev_reload = 0;
+-		if (mpp->action == ACT_CREATE)
+-			remember_wwid(mpp->wwid);
++		if (mpp->action == ACT_CREATE && remember_wwid(mpp->wwid) == 1)
++			trigger_paths_udev_change(mpp);
+ 		if (!is_daemon) {
+ 			/* multipath client mode */
+ 			dm_switchgroup(mpp->alias, mpp->bestpg);
+diff --git a/libmultipath/configure.h b/libmultipath/configure.h
+index fd7f581..253e29b 100644
+--- a/libmultipath/configure.h
++++ b/libmultipath/configure.h
+@@ -36,3 +36,4 @@ int get_refwwid (enum mpath_cmds cmd, char * dev, enum devtypes dev_type,
+ 		 vector pathvec, char **wwid);
+ int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh, int is_daemon);
+ int sysfs_get_host_adapter_name(struct path *pp, char *adapter_name);
++void trigger_paths_udev_change(const struct multipath *mpp);
+diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
+index 88bb72b..249c6c1 100644
+--- a/libmultipath/wwids.c
++++ b/libmultipath/wwids.c
+@@ -319,7 +319,7 @@ remember_wwid(char *wwid)
+ 		condlog(3, "wrote wwid %s to wwids file", wwid);
+ 	else
+ 		condlog(4, "wwid %s already in wwids file", wwid);
+-	return 0;
++	return ret;
+ }
+ 
+ int remember_cmdline_wwid(void)
+@@ -353,7 +353,7 @@ int remember_cmdline_wwid(void)
+ 			next++;
+ 		}
+ 		if (strlen(ptr)) {
+-			if (remember_wwid(ptr) != 0)
++			if (remember_wwid(ptr) < 0)
+ 				ret = -1;
+ 		}
+ 		else {
+diff --git a/multipath/main.c b/multipath/main.c
+index 72585b0..2eda6a3 100644
+--- a/multipath/main.c
++++ b/multipath/main.c
+@@ -336,7 +336,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
+ 		}
+ 		if (cmd == CMD_ADD_WWID) {
+ 			r = remember_wwid(refwwid);
+-			if (r == 0)
++			if (r >= 0)
+ 				printf("wwid '%s' added\n", refwwid);
+ 			else
+ 				printf("failed adding '%s' to wwids file\n",
+diff --git a/multipathd/main.c b/multipathd/main.c
+index 81c76ca..874bcce 100644
+--- a/multipathd/main.c
++++ b/multipathd/main.c
+@@ -2093,7 +2093,8 @@ configure (struct vectors * vecs, int start_waiters)
+ 
+ 	sync_maps_state(mpvec);
+ 	vector_foreach_slot(mpvec, mpp, i){
+-		remember_wwid(mpp->wwid);
++		if (remember_wwid(mpp->wwid) == 1)
++			trigger_paths_udev_change(mpp);
+ 		update_map_pr(mpp);
+ 	}
+ 
+@@ -2175,10 +2176,6 @@ reconfigure (struct vectors * vecs)
+ 		conf->verbosity = verbosity;
+ 	if (bindings_read_only)
+ 		conf->bindings_read_only = bindings_read_only;
+-	if (conf->find_multipaths) {
+-		condlog(2, "find_multipaths is set: -n is implied");
+-		ignore_new_devs = 1;
+-	}
+ 	if (ignore_new_devs)
+ 		conf->ignore_new_devs = ignore_new_devs;
+ 	uxsock_timeout = conf->uxsock_timeout;
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch b/meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch
new file mode 100644
index 0000000..f678809
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0008-libmultipath-change-how-RADOS-checker-is-enabled.patch
@@ -0,0 +1,56 @@
+From 0be174dbedd861d7694b0c7799fe26be31eb32b0 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Fri, 26 May 2017 17:52:57 -0500
+Subject: [PATCH 08/14] libmultipath: change how RADOS checker is enabled
+
+Instead of making the user call "make", "make install" and "make clean"
+with ENABLE_RADOS set correctly, have the makefile check if
+/usr/include/rados/librados.h exists, just like it checks if specific
+functions exist in a file.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ Makefile.inc                   | 13 +++++++++++++
+ libmultipath/checkers/Makefile |  3 ++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 2591fa9..e084fd1 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -109,5 +109,18 @@ check_func =								       \
+ 	echo "$$found"							       \
+     )
+ 
++# Checker whether a file with name $1 exists
++check_file = $(shell	\
++	if [ -f "$1" ]; then \
++		found=1; \
++		status="yes"; \
++	else \
++		found=0; \
++		status="no"; \
++	fi; \
++	echo 1>&2 "Checking if $1 exists ... $$status"; \
++	echo "$$found" \
++	)
++
+ %.o:	%.c
+ 	$(CC) $(CFLAGS) -c -o $@ $<
+diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
+index 732ca9d..bce6b8b 100644
+--- a/libmultipath/checkers/Makefile
++++ b/libmultipath/checkers/Makefile
+@@ -14,7 +14,8 @@ LIBS= \
+ 	libcheckemc_clariion.so \
+ 	libcheckhp_sw.so \
+ 	libcheckrdac.so
+-ifneq ($(ENABLE_RADOS),0)
++
++ifneq ($(call check_file,/usr/include/rados/librados.h),0)
+ LIBS += libcheckrbd.so
+ endif
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch
new file mode 100644
index 0000000..17d2d91
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-set-verbosity-to-default-during-config.patch
@@ -0,0 +1,40 @@
+From 526e539628e051128abf46a60ec22e18c9b5d84f Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 31 May 2017 15:03:02 -0500
+Subject: [PATCH 09/14] multipath: set verbosity to default during config
+
+condlog was setting the verbosity to 0 if there was no configuration.
+This keeps multipath from printing warning messages about config file
+problems that are found while loading the configuration. Instead, it
+should use the default config level until it loads the configuration
+to find the current value.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/debug.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libmultipath/debug.c b/libmultipath/debug.c
+index fbe171a..f89b264 100644
+--- a/libmultipath/debug.c
++++ b/libmultipath/debug.c
+@@ -11,6 +11,7 @@
+ #include "../third-party/valgrind/drd.h"
+ #include "vector.h"
+ #include "config.h"
++#include "defaults.h"
+ 
+ void dlog (int sink, int prio, const char * fmt, ...)
+ {
+@@ -21,7 +22,7 @@ void dlog (int sink, int prio, const char * fmt, ...)
+ 	va_start(ap, fmt);
+ 	conf = get_multipath_config();
+ 	ANNOTATE_IGNORE_READS_BEGIN();
+-	thres = (conf) ? conf->verbosity : 0;
++	thres = (conf) ? conf->verbosity : DEFAULT_VERBOSITY;
+ 	ANNOTATE_IGNORE_READS_END();
+ 	put_multipath_config(conf);
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch b/meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch
new file mode 100644
index 0000000..396b6d3
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0010-mpath-skip-device-configs-without-vendor-product.patch
@@ -0,0 +1,37 @@
+From f88d60a93e98d86ae294f2317a122c4efde276f0 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Wed, 31 May 2017 17:58:59 -0500
+Subject: [PATCH 10/14] mpath: skip device configs without vendor/product
+
+Right now if multipath.conf includes a device configuration without a
+vendor or product string, it will automatically be applied to all
+devices, skipping all other configs entirely.  This is clearly wrong.
+This patch makes sure that user added configs include vendor and
+product strings
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ libmultipath/config.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libmultipath/config.c b/libmultipath/config.c
+index c485748..bdde113 100644
+--- a/libmultipath/config.c
++++ b/libmultipath/config.c
+@@ -452,6 +452,13 @@ restart:
+ 			break;
+ 		j = n;
+ 		vector_foreach_slot_after(hw, hwe2, j) {
++			/* drop invalid device configs */
++			if (!hwe2->vendor || !hwe2->product) {
++				condlog(0, "device config missing vendor or product parameter");
++				vector_del_slot(hw, j--);
++				free_hwe(hwe2);
++				continue;
++			}
+ 			if (hwe_regmatch(hwe1, hwe2))
+ 				continue;
+ 			/* dup */
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch b/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch
new file mode 100644
index 0000000..12d6d38
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0011-multipathd-fix-show-maps-json-crash.patch
@@ -0,0 +1,38 @@
+From bc3ceda747104afdc24386df5dc45ca86f6c2936 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 1 Jun 2017 17:52:28 -0500
+Subject: [PATCH 11/14] multipathd: fix "show maps json" crash
+
+If there are no multipath devices, show_maps_json sets the maximum size
+of the reply buffer to 0. Having a size of 0 causes the calls to calloc
+and realloc to behave in ways that the code isn't designed to handle,
+leading to a double-free crash. Instead, show_maps_json should just
+use the INITIAL_REPLY_LEN if there are no multipath devices.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+---
+ multipathd/cli_handlers.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
+index 04c7386..7b0d00c 100644
+--- a/multipathd/cli_handlers.c
++++ b/multipathd/cli_handlers.c
+@@ -162,10 +162,12 @@ show_maps_json (char ** r, int * len, struct vectors * vecs)
+ 	struct multipath * mpp;
+ 	char * c;
+ 	char * reply;
+-	unsigned int maxlen = INITIAL_REPLY_LEN *
+-			PRINT_JSON_MULTIPLIER * VECTOR_SIZE(vecs->mpvec);
++	unsigned int maxlen = INITIAL_REPLY_LEN;
+ 	int again = 1;
+ 
++	if (VECTOR_SIZE(vecs->mpvec) > 0)
++		maxlen *= PRINT_JSON_MULTIPLIER * VECTOR_SIZE(vecs->mpvec);
++
+ 	vector_foreach_slot(vecs->mpvec, mpp, i) {
+ 		if (update_multipath(vecs, mpp->alias, 0)) {
+ 			return 1;
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch b/meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
new file mode 100644
index 0000000..5ccd4ae
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
@@ -0,0 +1,58 @@
+From 6864ba28dec61609662ce5dc8bc7ed1925abb546 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 5 Jul 2017 02:56:13 -0400
+Subject: [PATCH 12/14] multipath-tools: modify Makefile.inc for
+ cross-compilation
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
+---
+ Makefile.inc | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index e084fd1..c7f45fa 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -35,12 +35,6 @@ ifndef RUN
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
+@@ -82,11 +76,13 @@ TEST_CC_OPTION = $(shell \
+ 
+ STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
+ 
++ifndef OPTFLAGS
+ OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
+ 		  -Werror=implicit-function-declaration -Werror=format-security \
+ 		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
+ 		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
+ 		  --param=ssp-buffer-size=4
++endif
+ 
+ CFLAGS		= $(OPTFLAGS) -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\"
+ BIN_CFLAGS	= -fPIE -DPIE
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch
new file mode 100644
index 0000000..52240f6
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0013-Always-use-devmapper.patch
@@ -0,0 +1,53 @@
+From 1498338970a093fccbda3e33f5588a289ef2c66a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 5 Jul 2017 02:59:46 -0400
+Subject: [PATCH 13/14] Always use devmapper
+
+Do not try to compute several _API_ make variables
+from host information when cross-compiling.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+Rebase to 0.7.1
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libmultipath/Makefile | 19 ++++---------------
+ 1 file changed, 4 insertions(+), 15 deletions(-)
+
+diff --git a/libmultipath/Makefile b/libmultipath/Makefile
+index b3244fc..9006b3f 100644
+--- a/libmultipath/Makefile
++++ b/libmultipath/Makefile
+@@ -20,21 +20,10 @@ ifdef SYSTEMD
+ 	endif
+ endif
+ 
+-ifneq ($(call check_func,dm_task_no_flush,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
+-endif
+-
+-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_COOKIE
+-endif
+-
+-ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,/usr/include/libudev.h),0)
+-	CFLAGS += -DLIBUDEV_API_RECVBUF
+-endif
+-
+-ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_DEFERRED
+-endif
++CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
++CFLAGS += -DLIBDM_API_COOKIE
++CFLAGS += -DLIBUDEV_API_RECVBUF
++CFLAGS += -DLIBDM_API_DEFERRED
+ 
+ OBJS = memory.o parser.o vector.o devmapper.o callout.o \
+ 	hwtable.o blacklist.o util.o dmparser.o config.o \
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch
new file mode 100644
index 0000000..f951213
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0014-Always-use-devmapper-for-kpartx.patch
@@ -0,0 +1,37 @@
+From 7f5869cd32a7b3f717d9544b35562d9d01ca6510 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 5 Jul 2017 03:03:16 -0400
+Subject: [PATCH 14/14] Always use devmapper for kpartx
+
+Do not try to compute the LIBDM_API_COOKIE make variable
+from host information when cross-compiling.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+Rebase to 0.7.1
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ kpartx/Makefile | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/kpartx/Makefile b/kpartx/Makefile
+index bfa6fe8..be87124 100644
+--- a/kpartx/Makefile
++++ b/kpartx/Makefile
+@@ -8,9 +8,7 @@ LDFLAGS += $(BIN_LDFLAGS)
+ 
+ LIBDEPS += -ldevmapper
+ 
+-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_COOKIE
+-endif
++CFLAGS += -DLIBDM_API_COOKIE
+ 
+ OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
+ 	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
deleted file mode 100644
index 803e52c..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7267cf235fc052eaa1ca36e437096576edacb131 Mon Sep 17 00:00:00 2001
-From: Aws Ismail <aws.ismail@windriver.com>
-Date: Mon, 22 Sep 2014 17:22:32 -0700
-Subject: [PATCH] Always use devmapper for kpartx
-
-Do not try to compute the LIBDM_API_COOKIE make variable
-from host information when cross-compiling.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- kpartx/Makefile | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/kpartx/Makefile b/kpartx/Makefile
-index e8a59f2..e694a65 100644
---- a/kpartx/Makefile
-+++ b/kpartx/Makefile
-@@ -7,11 +7,7 @@ CFLAGS += -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
- 
- LIBDEPS += -ldevmapper
- 
--LIBDM_API_COOKIE = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_set_cookie' /usr/include/libdevmapper.h)
--
--ifneq ($(strip $(LIBDM_API_COOKIE)),0)
--	CFLAGS += -DLIBDM_API_COOKIE
--endif
-+CFLAGS += -DLIBDM_API_COOKIE
- 
- OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
- 	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
deleted file mode 100644
index 33834f6..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c4f0dba4e86bfa20252fcc8218398e7468ca9149 Mon Sep 17 00:00:00 2001
-From: Aws Ismail <aws.ismail@windriver.com>
-Date: Mon, 22 Sep 2014 17:22:32 -0700
-Subject: [PATCH] Always use devmapper
-
-Do not try to compute several _API_ make variables
-from host information when cross-compiling.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- libmultipath/Makefile | 27 ++++-----------------------
- 1 file changed, 4 insertions(+), 23 deletions(-)
-
-diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index 495cebe..9626e69 100644
---- a/libmultipath/Makefile
-+++ b/libmultipath/Makefile
-@@ -20,29 +20,10 @@ ifdef SYSTEMD
- 	endif
- endif
- 
--LIBDM_API_FLUSH = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_no_flush' /usr/include/libdevmapper.h)
--
--ifneq ($(strip $(LIBDM_API_FLUSH)),0)
--	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
--endif
--
--LIBDM_API_COOKIE = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_set_cookie' /usr/include/libdevmapper.h)
--
--ifneq ($(strip $(LIBDM_API_COOKIE)),0)
--	CFLAGS += -DLIBDM_API_COOKIE
--endif
--
--LIBUDEV_API_RECVBUF = $(shell grep -Ecs '^[a-z]*[[:space:]]+udev_monitor_set_receive_buffer_size' /usr/include/libudev.h)
--
--ifneq ($(strip $(LIBUDEV_API_RECVBUF)),0)
--	CFLAGS += -DLIBUDEV_API_RECVBUF
--endif
--
--LIBDM_API_DEFERRED = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_deferred_remove' /usr/include/libdevmapper.h)
--
--ifneq ($(strip $(LIBDM_API_DEFERRED)),0)
--	CFLAGS += -DLIBDM_API_DEFERRED
--endif
-+CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
-+CFLAGS += -DLIBDM_API_COOKIE
-+CFLAGS += -DLIBUDEV_API_RECVBUF
-+CFLAGS += -DLIBDM_API_DEFERRED
- 
- OBJS = memory.o parser.o vector.o devmapper.o callout.o \
- 	hwtable.o blacklist.o util.o dmparser.o config.o \
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch b/meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
deleted file mode 100644
index 908a516..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 148b848f45957e5e1c0466e8c79c84ba4a0bf241 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Fri, 27 Jan 2017 10:35:54 +0100
-Subject: [PATCH] checkers: disable libcheckrbd.so
-
-libcheckrbd.so depends on librados, which is not currently available
-as a recipe. These checkers seem to be optional, so for now we merely
-disable compilation of libcheckrbd.so.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- libmultipath/checkers/Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
-index 11ab76f..c848d50 100644
---- a/libmultipath/checkers/Makefile
-+++ b/libmultipath/checkers/Makefile
-@@ -14,7 +14,6 @@ LIBS= \
- 	libcheckemc_clariion.so \
- 	libcheckhp_sw.so \
- 	libcheckrdac.so \
--	libcheckrbd.so
- 
- all: $(LIBS)
- 
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
deleted file mode 100644
index 5b7b696..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9f5768eca165502b0f17d271aa6f7cf530ec60b2 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Mon, 22 Sep 2014 17:22:32 -0700
-Subject: [PATCH] multipath-tools: modify Makefile.inc for
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
----
- Makefile.inc | 17 +++++------------
- 1 file changed, 5 insertions(+), 12 deletions(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 1cc8f44..15f8b91 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -29,12 +29,6 @@ ifndef RUN
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
-@@ -61,13 +55,12 @@ RM		= rm -f
- LN		= ln -sf
- INSTALL_PROGRAM	= install
- 
--OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 \
--		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
--		  -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector \
--		  --param=ssp-buffer-size=4
-+ifndef OPTFLAGS
-+OPTFLAGS     = $(RPM_OPT_FLAGS) -Wunused -Wstrict-prototypes
-+endif
- 
--CFLAGS		= $(OPTFLAGS) -fPIC -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\"
--SHARED_FLAGS	= -shared
-+CFLAGS	     = $(OPTFLAGS) -fPIC -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\"
-+SHARED_FLAGS = -shared
- 
- %.o:	%.c
- 	$(CC) $(CFLAGS) -c -o $@ $<
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/multipath.conf.example b/meta-oe/recipes-support/multipath-tools/files/multipath.conf.example
new file mode 100644
index 0000000..6bbeadb
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/multipath.conf.example
@@ -0,0 +1,90 @@
+# This is a basic configuration file with some examples, for device mapper
+# multipath.
+# For a complete list of the default configuration values, see
+# /usr/share/doc/device-mapper-multipath-0.4.9/multipath.conf.defaults
+# For a list of configuration options with descriptions, see
+# /usr/share/doc/device-mapper-multipath-0.4.9/multipath.conf.annotated
+
+## By default, devices with vendor = "IBM" and product = "S/390.*" are
+## blacklisted. To enable mulitpathing on these devies, uncomment the
+## following lines.
+#blacklist_exceptions {
+#	device {
+#		vendor	"IBM"
+#		product	"S/390.*"
+#	}
+#}
+
+## Use user friendly names, instead of using WWIDs as names.
+defaults {
+	user_friendly_names yes
+}
+##
+## Here is an example of how to configure some standard options.
+##
+#
+#defaults {
+#	udev_dir		/dev
+#	polling_interval 	10
+#	selector		"round-robin 0"
+#	path_grouping_policy	multibus
+#	getuid_callout		"/lib/udev/scsi_id --whitelisted --device=/dev/%n"
+#	prio			alua
+#	path_checker		readsector0
+#	rr_min_io		100
+#	max_fds			8192
+#	rr_weight		priorities
+#	failback		immediate
+#	no_path_retry		fail
+#	user_friendly_names	yes
+#}
+##
+## The wwid line in the following blacklist section is shown as an example
+## of how to blacklist devices by wwid.  The 2 devnode lines are the
+## compiled in default blacklist. If you want to blacklist entire types
+## of devices, such as all scsi devices, you should use a devnode line.
+## However, if you want to blacklist specific devices, you should use
+## a wwid line.  Since there is no guarantee that a specific device will
+## not change names on reboot (from /dev/sda to /dev/sdb for example)
+## devnode lines are not recommended for blacklisting specific devices.
+##
+#blacklist {
+#       wwid 26353900f02796769
+#	devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st)[0-9]*"
+#	devnode "^hd[a-z]"
+#}
+#multipaths {
+#	multipath {
+#		wwid			3600508b4000156d700012000000b0000
+#		alias			yellow
+#		path_grouping_policy	multibus
+#		path_checker		readsector0
+#		path_selector		"round-robin 0"
+#		failback		manual
+#		rr_weight		priorities
+#		no_path_retry		5
+#	}
+#	multipath {
+#		wwid			1DEC_____321816758474
+#		alias			red
+#	}
+#}
+#devices {
+#	device {
+#		vendor			"COMPAQ  "
+#		product			"HSV110 (C)COMPAQ"
+#		path_grouping_policy	multibus
+#		getuid_callout          "/lib/udev/scsi_id --whitelisted --device=/dev/%n"
+#		path_checker		readsector0
+#		path_selector		"round-robin 0"
+#		hardware_handler	"0"
+#		failback		15
+#		rr_weight		priorities
+#		no_path_retry		queue
+#	}
+#	device {
+#		vendor			"COMPAQ  "
+#		product			"MSA1000         "
+#		path_grouping_policy	multibus
+#	}
+#}
diff --git a/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch b/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
deleted file mode 100644
index 88579e6..0000000
--- a/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 4311856200480288494df8df737f71ea316592d0 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Thu, 26 Jan 2017 15:28:34 +0100
-Subject: [PATCH] shared libs: avoid linking .so as executable
-
-When the OE build systems sets CFLAGS including -pie, gcc overrides
-the earlier -shared parameter and tries to link a binary, leading to
-errors about missing functions like main().
-
-Reordering the parameters so that -shared comes after CFLAGS
-fixes this.
-
-Upstream-Status: Inappropriate [OE specific, -pie shouldn't be in CFLAGS?!]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
-diff --git a/libmpathcmd/Makefile b/libmpathcmd/Makefile
-index 457c4ca..f68c82c 100644
---- a/libmpathcmd/Makefile
-+++ b/libmpathcmd/Makefile
-@@ -9,7 +9,7 @@ OBJS = mpath_cmd.o
- all: $(LIBS)
- 
- $(LIBS): $(OBJS)
--	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS) $(LIBDEPS)
-+	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
- 	$(LN) $@ $(DEVLIB)
- 
- install: $(LIBS)
-diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
-index 6e43427..2486302 100644
---- a/libmpathpersist/Makefile
-+++ b/libmpathpersist/Makefile
-@@ -15,7 +15,7 @@ all: $(LIBS)
- 
- $(LIBS):
- 	$(CC) -c $(CFLAGS) *.c
--	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS)
-+	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ -o $@ $(OBJS)
- 	$(LN) $(LIBS) $(DEVLIB)
- 	$(GZIP) mpath_persistent_reserve_in.3 > mpath_persistent_reserve_in.3.gz
- 	$(GZIP) mpath_persistent_reserve_out.3 > mpath_persistent_reserve_out.3.gz
-diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index 495cebe..752bcc0 100644
---- a/libmultipath/Makefile
-+++ b/libmultipath/Makefile
-@@ -55,7 +55,7 @@ OBJS = memory.o parser.o vector.o devmapper.o callout.o \
- all: $(LIBS)
- 
- $(LIBS): $(OBJS)
--	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS) $(LIBDEPS)
-+	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
- 	$(LN) $@ $(DEVLIB)
- 
- install:
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
new file mode 100644
index 0000000..9331211
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
@@ -0,0 +1,112 @@
+SUMMARY = "The upstream project used to drive the Device Mapper multipathing driver"
+
+DESCRIPTION = "It provides tools to manage multipath devices \
+by instructing the device-mapper kernel module what to do. These \
+tools include: \
+1. multipath - Scan the system for multipath devices and assemble them.\
+2. multipathd - Detects when paths fail and execs multipath to update \
+things.\
+3. mpathpersist - Persistent reservation management feature allows \
+cluster management software to manage persistent reservation through \
+mpath device. It processes management requests from callers and hides \
+the management task details. It also handles persistent reservation \
+management of data path life cycle and state changes.\
+4. kpartx - This tool, derived from util-linux's partx, reads partition \
+tables on specified device and create device maps over partitions \
+segments detected. It is called from hotplug upon device maps creation \
+and deletion"
+
+HOMEPAGE = "http://christophe.varoqui.free.fr/"
+
+DEPENDS = "libdevmapper \
+           libaio \
+           liburcu \
+           readline \
+           udev \
+           json-c \
+          "
+
+LICENSE = "GPLv2"
+
+SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
+           file://multipathd.oe \
+           file://multipath.conf.example \
+           file://0001-multipath-attempt-at-common-multipath.rules.patch \
+           file://0002-RH-fixup-udev-rules-for-redhat.patch \
+           file://0003-RH-Remove-the-property-blacklist-exception-builtin.patch \
+           file://0004-RH-don-t-start-without-a-config-file.patch \
+           file://0005-RH-add-mpathconf.patch \
+           file://0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch \
+           file://0007-RH-trigger-change-uevent-on-new-device-creation.patch \
+           file://0008-libmultipath-change-how-RADOS-checker-is-enabled.patch \
+           file://0009-multipath-set-verbosity-to-default-during-config.patch \
+           file://0010-mpath-skip-device-configs-without-vendor-product.patch \
+           file://0011-multipathd-fix-show-maps-json-crash.patch \
+           file://0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
+           file://0013-Always-use-devmapper.patch \
+           file://0014-Always-use-devmapper-for-kpartx.patch \
+           "
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+SRCREV = "f21166a812a2cfb50ecf9550d32947c83103f83a"
+
+S = "${WORKDIR}/git"
+
+inherit systemd pkgconfig
+
+SYSTEMD_SERVICE_${PN} = "multipathd.service"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+# multipath-tools includes a copy of the valgrind.h header
+# file and uses the macros to suppress some false positives. However,
+# that only works on ARM when thumb is disabled. Otherwise one gets:
+#   Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
+#   ../Makefile.inc:66: recipe for target 'debug.o' failed
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+# The exact version of SYSTEMD does not matter but should be greater than 209.
+#
+EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
+                OPTFLAGS="${CFLAGS}" \
+                bindir=${base_sbindir} \
+                LIB=${base_libdir} libdir=${base_libdir}/multipath \
+                unitdir=${systemd_system_unitdir} \
+                ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
+               '
+
+do_install() {
+    oe_runmake install
+
+    # We copy an initscript, but do not start multipathd at init time.
+    #
+    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)};then
+        install -d ${D}${sysconfdir}/init.d
+        cp ${WORKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
+    fi
+
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/multipath.conf.example \
+    ${D}${sysconfdir}/multipath.conf.example
+}
+
+FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
+
+PACKAGES =+ "${PN}-libs"
+FILES_${PN}-libs = "${base_libdir}/lib*.so.* \
+                    ${base_libdir}/multipath/lib*.so*"
+RDEPENDS_${PN} += "${PN}-libs"
+
+PROVIDES += "device-mapper-multipath"
+RPROVIDES_${PN} += "device-mapper-multipath"
+RPROVIDES_${PN}-libs += "device-mapper-multipath-libs"
+
+FILES_${PN}-dev += "${base_libdir}/pkgconfig"
+
+PACKAGES =+ "kpartx"
+FILES_kpartx = "${base_sbindir}/kpartx \
+                ${nonarch_libdir}/udev/kpartx_id \
+               "
+
+RDEPENDS_${PN} += "kpartx"
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
deleted file mode 100644
index 5f8c422..0000000
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "The upstream project used to drive the Device Mapper multipathing driver"
-
-DEPENDS = "libdevmapper libaio liburcu readline udev"
-
-LICENSE = "LGPLv2"
-
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
-           file://multipathd.oe \
-           file://makefile_inc.patch \
-           file://always-use-libdevmapper.patch \
-           file://always-use-libdevmapper-kpartx.patch \
-           file://0001-multipathd.service-Error-fix.patch \
-           file://shared-libs-avoid-linking-.so-as-executable.patch \
-           file://checkers-disable-libcheckrbd.so.patch \
-           "
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-# 0.6.4
-SRCREV = "922421cf795d53d339862bb2d99f1a85c96ad9a3"
-
-inherit systemd
-
-
-S = "${WORKDIR}/git"
-
-PV = "0.6.4+git${@'${SRCPV}'.split('+')[-1]}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-# multipath-tools includes a copy of the valgrind.h header
-# file and uses the macros to suppress some false positives. However,
-# that only works on ARM when thumb is disabled. Otherwise one gets:
-#   Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
-#   ../Makefile.inc:66: recipe for target 'debug.o' failed
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-
-# The exact version of SYSTEMD does not matter but should be greater than 209.
-#
-EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
-                OPTFLAGS="${CFLAGS}" \
-                bindir=${base_sbindir} \
-                LIB=${base_libdir} libdir=${base_libdir}/multipath \
-                unitdir=${systemd_system_unitdir} \
-                ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
-               '
-
-do_install() {
-    oe_runmake install
-
-    # We copy an initscript, but do not start multipathd at init time.
-    #
-    install -d ${D}${sysconfdir}/init.d
-    cp ${WORKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
-
-}
-
-FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
-
-# systemd and udev stuff always goes under /lib!
-#
-FILES_${PN} += "${base_libdir}/multipath \
-                ${systemd_system_unitdir} \
-		"
-
-PACKAGES =+ "kpartx"
-FILES_kpartx = "${base_sbindir}/kpartx \
-                ${nonarch_libdir}/udev/kpartx_id \
-               "
-
-RDEPENDS_${PN} += "kpartx"
-- 
2.8.1


