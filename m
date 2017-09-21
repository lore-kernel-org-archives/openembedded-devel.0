Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 864A077D6F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:04:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L84iEV011970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Sep 2017 01:04:44 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 21 Sep 2017 01:04:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Sep 2017 04:04:42 -0400
Message-ID: <1505981082-198803-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: fix start lvm2-monitor.service failed
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
X-List-Received-Date: Thu, 21 Sep 2017 08:04:45 -0000
Content-Type: text/plain

While systemd based, start lvm2-monitor.service failed.
...
|Sep 21 05:37:34 qemux86-64 lvm[389]:   /var/lock: stat failed: No such
file or directory
|Sep 21 05:37:34 qemux86-64 systemd[1]: lvm2-monitor.service: Main
process exited, code=exited, status=5/NOTINSTALLED
...
The failure of lvm2-monitor.service caused reboot hung when disk
partion is lvm thin provision.

While starting lvm2-monitor.service, it reqires the existence of
locking dir "/var/lock" which is a symlink to "../run/lock" in oe-core,
and "/run" is created in "/etc/fstab" which have to be be after the
start of lvm2-monitor.service.

So tweak the locking dir to "/tmp/lock" and make sure the dir existence
(after tmp.mount).

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...tart-lvm2-monitor.service-after-tmp.mount.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/files/lvm.conf        |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch

diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
new file mode 100644
index 0000000..0e68d62
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
@@ -0,0 +1,32 @@
+From 24a2c47fd01dde1710f1fa66f5c30ce7010c5956 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 21 Sep 2017 15:28:10 +0800
+Subject: [PATCH] start lvm2-monitor.service after tmp.mount
+
+The lvm2-monitor.service reqires the existence of locking_dir
+("/tmp/lock/lvm"), and unit tmp.mount is to mount /tmp.
+So start lvm2-monitor.service after tmp.mount
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
+index 22238b7..93b2bee 100644
+--- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
++++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
+@@ -2,7 +2,7 @@
+ Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling
+ Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:vgchange(8)
+ Requires=dm-event.socket lvm2-lvmetad.socket
+-After=dm-event.socket dm-event.service lvm2-lvmetad.socket lvm2-activation.service lvm2-lvmetad.service
++After=dm-event.socket dm-event.service lvm2-lvmetad.socket lvm2-activation.service lvm2-lvmetad.service tmp.mount
+ Before=local-fs-pre.target
+ DefaultDependencies=no
+ Conflicts=shutdown.target
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/lvm2/files/lvm.conf b/meta-oe/recipes-support/lvm2/files/lvm.conf
index 9e3b5fe..c2bb85d 100644
--- a/meta-oe/recipes-support/lvm2/files/lvm.conf
+++ b/meta-oe/recipes-support/lvm2/files/lvm.conf
@@ -214,7 +214,7 @@ global {
 
     # Local non-LV directory that holds file-based locks while commands are
     # in progress.  A directory like /tmp that may get wiped on reboot is OK.
-    locking_dir = "/var/lock/lvm"
+    locking_dir = "/tmp/lock/lvm"
 
     # Other entries can go here to allow you to load shared libraries
     # e.g. if support for LVM1 metadata was compiled as a shared library use
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index ab8db9c..f0859ef 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -15,6 +15,7 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0004-tweak-MODPROBE_CMD-for-cross-compile.patch \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
+           file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
            "
 S = "${WORKDIR}/LVM2.${PV}"
 
-- 
2.8.1


