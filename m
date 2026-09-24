Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F18C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 02:19:26 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2635.1790216361648285765
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 19:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rVsscW4e;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: alistair23@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1107079a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 19:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790216361; x=1790821161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLWJ/kHgBLcfRNxnVZdJ7snBOBHFsuK7IXPinLphnRk=;
        b=rVsscW4e/5z8OJSt4eU2HFr7EkSKIesLxmHs32gEGaZYkk5WVbU96TiMtqwNELbzeL
         xNdhqK5IoDaIAJpJEdbQ+KAbocYgfbI1eF7j1zC0TxVLeANVfW5ECWQxIJjRnZpLoX3M
         D/nUVrtzR71ty+xNktWL0AQvS4hroJYSizJUjr0LAFEB6lWC1G3bsVSG6fQOPVSTZ2nR
         yJ9MzC59NBx9ZqCN8VoLgjDoUrAiBTMdZPB+w+S8eDcO5v1nuD36dur+XJapa97oFci+
         5r+C7dn7oA1fJKs404Q0c+EtkjbU8Wd6W8sdyGFAC+qr3msNAKHApM+wARjL1yeRhhGc
         8JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790216361; x=1790821161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLWJ/kHgBLcfRNxnVZdJ7snBOBHFsuK7IXPinLphnRk=;
        b=U7KeAHJsIRhMz5xeQ2jQw5d88gam1EIaXuMSGUjdcrOqVeQXr/wTVCIZXxhpsGAzx2
         RoFqYLUXUXHWv25AXmyTKfdQ03u8gMblz684Q8MT+YHPjXHq9yyVclnb9ozNJ1LyY25i
         RhbX9XSlZYGBnm+qIo96cqSe4WvFpwhPSJ9DAqaKVQr1Qkz5Ch6mU4LZX0lmJC1eO+h4
         kx05HR2o7BZfaxbTYXYHDOqSta6KxhnwODKkOClZzXOzK4PlSDwAQ5J7BsM4Fwqw2X/D
         Q+Ucd+vQGEO6erVhL4ZtslIBITcOXdS7HeUmmro5Io0/xCsQtwVJHxxxQAKycTCNKNxh
         t/Ig==
X-Gm-Message-State: AFuF++lHAy6ojLVUK6/5XTX37vMiOTb4RzUAuuOoZZZgyAtMu6bHEMIr
	a1Gi4A74T76UyZQNDMu7j2U1IA+cDErMIdwgu9KCSZJTs/4/PyUsCoTynHXL/g==
X-Gm-Gg: AYBFou2BoQQfAcxPCDrdLMWk+h6xwEZmmp4J3NxWapu0RcF8fqRFvkoMfwRb+0N18oF
	HNbjjIk3ATQfud5/Q1FnLUTAU7ztv6wuKC0gjdwCWZTYhgtRajbiBUd6sWnA9bL9Xj9vkTAeBH6
	L5KVDHFxfHwZdsD9dp593KDChFuecWGm1QEhOp99hD8QdzUED6v4rwPhO9YibJykX2zdAzb7mKZ
	sqNsz3wbTXzDdgzixi6Kx58ju6ucUPgyn8nYBQsu6T0RQmS9nMFhsINsoErf6olQAQGVtw8vDhE
	5mbpZOaF0MmGmY5dGexoj7fdnAeu9MvHs0oUKzB9Dqrz4GFslM1bUVFdDpnnRmqtKlAxDGcOmCe
	bdTvHjhfc3WwGZkpD0M+wLpOsJMPoqFn/YV90Jo/zDpSXMDIOJvZUYYFtqc39uQN7oFQ6HyjvMq
	cjUhLAQcnEK7NTvT4OQiOimsb35Kbe4SYG4Cg1DXCPzCy+v98gAVbmF9HXc2tYeFNn3LHAI6K9W
	9kzRRL88IId1T2s
X-Received: by 2002:a17:90b:3845:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3a098ae7078mr853626a91.5.1790216360732;
        Wed, 23 Sep 2026 19:19:20 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f4219sm18756915ad.68.2026.09.23.19.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:19:20 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-devel@lists.openembedded.org
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-filesystems][PATCH v2] tcmu-runner: Initial commit
Date: Thu, 24 Sep 2026 12:19:10 +1000
Message-ID: <20260924021910.1612937-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 02:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130247

From: Alistair Francis <alistair.francis@wdc.com>

Initial support for verion 1.6.2 of tcmu-runner.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fixup build issues reported by CI

 ...rate-gdbus-code-with-a-relative-path.patch |  37 +++++++
 ...002-qcow-fix-cache-count-reset-loops.patch |  42 +++++++
 ...ize-list_for_each-iterator-variables.patch | 103 ++++++++++++++++++
 .../tcmu-runner/tcmu-runner_1.6.2.bb          |  37 +++++++
 4 files changed, 219 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0001-CMakeLists-generate-gdbus-code-with-a-relative-path.patch
 create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0002-qcow-fix-cache-count-reset-loops.patch
 create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0003-target-alua-initialize-list_for_each-iterator-variables.patch
 create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb

diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0001-CMakeLists-generate-gdbus-code-with-a-relative-path.patch b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0001-CMakeLists-generate-gdbus-code-with-a-relative-path.patch
new file mode 100644
index 0000000000..95b0af7734
--- /dev/null
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0001-CMakeLists-generate-gdbus-code-with-a-relative-path.patch
@@ -0,0 +1,37 @@
+From 7939a8c180c8a3e1a0df8c66fc2ef8a0b0d4d4d6 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 24 Sep 2026 11:52:25 +1000
+Subject: [PATCH] CMakeLists: Convert gdbus-codegen to use a relative path
+
+Passing an absolute path to gdbus-codegen results in an absolute path
+being hardcoded in the build directory.
+
+This leaks the build host TMPDIR/HOME into the shipped debug sources and
+trips OpenEmbedded's buildpaths QA check.
+
+Instead let's run gdbus-codegen from the ${CMAKE_SOURCE_DIR} directory with
+relative  paths.
+
+Upstream-Status: Submitted [https://github.com/open-iscsi/tcmu-runner/pull/713]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index eccfda1..a657d8b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -144,7 +144,8 @@ install(TARGETS RUNTIME DESTINATION bin)
+ 
+ add_custom_command(
+   OUTPUT ${CMAKE_SOURCE_DIR}/tcmuhandler-generated.c ${CMAKE_SOURCE_DIR}/tcmuhandler-generated.h
+-  COMMAND gdbus-codegen ${CMAKE_SOURCE_DIR}/tcmu-handler.xml --generate-c-code ${CMAKE_SOURCE_DIR}/tcmuhandler-generated --c-generate-object-manager --interface-prefix org.kernel
++  COMMAND gdbus-codegen tcmu-handler.xml --generate-c-code tcmuhandler-generated --c-generate-object-manager --interface-prefix org.kernel
++  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
+   MAIN_DEPENDENCY tcmu-handler.xml
+   )
+ 
+-- 
+2.55.0
+
diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0002-qcow-fix-cache-count-reset-loops.patch b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0002-qcow-fix-cache-count-reset-loops.patch
new file mode 100644
index 0000000000..9e5cb56b45
--- /dev/null
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0002-qcow-fix-cache-count-reset-loops.patch
@@ -0,0 +1,42 @@
+From c7072f4dd8cf7d8d19103d5c5709610ce1b932c1 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 24 Sep 2026 11:57:34 +1000
+Subject: [PATCH] qcow: Fix infinite loop
+
+The loop over l2_cache_counts increments `j`, but runs checks against
+`i`, meaning that the loop never breaks.
+
+This was caught by clang: error: variable 'i' used in loop
+condition not modified in loop body [-Werror,-Wfor-loop-analysis]
+
+Upstream-Status: Submitted [https://github.com/open-iscsi/tcmu-runner/pull/714]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ qcow.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/qcow.c b/qcow.c
+index 56f16e9..9c123a8 100644
+--- a/qcow.c
++++ b/qcow.c
+@@ -728,7 +728,7 @@ static uint64_t *l2_cache_lookup(struct qcow_state *s, uint64_t l2_offset)
+ 	for (i = 0; i < L2_CACHE_SIZE; i++) {
+ 		if (l2_offset == s->l2_cache_offsets[i]) {
+ 			if (++s->l2_cache_counts[i] == INT_MAX) {
+-				for (j = 0; i < L2_CACHE_SIZE; j++) {
++				for (j = 0; j < L2_CACHE_SIZE; j++) {
+ 					s->l2_cache_counts[j] >>= 1;
+ 				}
+ 			}
+@@ -872,7 +872,7 @@ static void *rc_cache_lookup(struct qcow_state *s, uint64_t rc_offset)
+ 	for (i = 0; i < RC_CACHE_SIZE; i++) {
+ 		if (rc_offset == s->rc_cache_offsets[i]) {
+ 			if (++s->rc_cache_counts[i] == INT_MAX) {
+-				for (j = 0; i < RC_CACHE_SIZE; j++) {
++				for (j = 0; j < RC_CACHE_SIZE; j++) {
+ 					s->rc_cache_counts[j] >>= 1;
+ 				}
+ 			}
+-- 
+2.55.0
+
diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0003-target-alua-initialize-list_for_each-iterator-variables.patch b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0003-target-alua-initialize-list_for_each-iterator-variables.patch
new file mode 100644
index 0000000000..15b370cad8
--- /dev/null
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0003-target-alua-initialize-list_for_each-iterator-variables.patch
@@ -0,0 +1,103 @@
+From bd850ae8327432ccca79ac1abfaef37b46e48feb Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 24 Sep 2026 12:02:16 +1000
+Subject: [PATCH] Initalise list_for_each() iterator variables
+
+Clang's -Wuninitialized cannot prove that the argument to
+list_for_each()/list_for_each_safe() are assigned, so it reports
+
+  error: variable 'tpg' is uninitialized when used here
+    list_for_each(&tpg_recovery_list, tpg, recovery_entry) {
+
+Let's fix this by initalising them to NULL.
+
+Upstream-Status: Submitted [https://github.com/open-iscsi/tcmu-runner/pull/714]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ alua.c   | 10 +++++-----
+ target.c |  6 +++---
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/alua.c b/alua.c
+index 656a28f..a67fd6e 100644
+--- a/alua.c
++++ b/alua.c
+@@ -64,7 +64,7 @@ static int tcmu_set_alua_int_setting(struct alua_grp *group,
+ 
+ static void tcmu_release_tgt_ports(struct alua_grp *group)
+ {
+-	struct tgt_port *port, *port_next;
++	struct tgt_port *port = NULL, *port_next;
+ 
+ 	list_for_each_safe(&group->tgt_ports, port, port_next, entry) {
+ 		list_del(&port->entry);
+@@ -262,7 +262,7 @@ free_group:
+ 
+ void tcmu_release_alua_grps(struct list_head *group_list)
+ {
+-	struct alua_grp *group, *group_next;
++	struct alua_grp *group = NULL, *group_next;
+ 
+ 	list_for_each_safe(group_list, group, group_next, entry) {
+ 		list_del(&group->entry);
+@@ -349,7 +349,7 @@ free_names:
+  */
+ struct tgt_port *tcmu_get_enabled_port(struct list_head *group_list)
+ {
+-	struct alua_grp *group;
++	struct alua_grp *group = NULL;
+ 	struct tgt_port *port;
+ 
+ 	list_for_each(group_list, group, entry) {
+@@ -400,7 +400,7 @@ static int alua_sync_state(struct tcmu_device *dev,
+ {
+ 	struct tcmur_device *rdev = tcmu_dev_get_private(dev);
+ 	struct tcmur_handler *rhandler = tcmu_get_runner_handler(dev);
+-	struct alua_grp *group;
++	struct alua_grp *group = NULL;
+ 	uint16_t ao_group_id;
+ 	uint8_t alua_state;
+ 	int ret;
+@@ -655,7 +655,7 @@ static int tcmu_explicit_transition(struct list_head *group_list,
+ 				    uint8_t alua_status)
+ {
+ 	struct tcmu_device *dev = group->dev;
+-	struct alua_grp *tmp_group;
++	struct alua_grp *tmp_group = NULL;
+ 	int ret;
+ 
+ 	tcmu_dev_dbg(dev, "transition group %u new state %u old state %u sup 0x%x\n",
+diff --git a/target.c b/target.c
+index 55ca802..b483cac 100644
+--- a/target.c
++++ b/target.c
+@@ -161,7 +161,7 @@ static bool port_is_on_tgt_port_grp(struct tgt_port *port,
+ 
+ static struct tgt_port_grp *port_is_on_recovery_list(struct tgt_port *port)
+ {
+-	struct tgt_port_grp *tpg;
++	struct tgt_port_grp *tpg = NULL;
+ 
+ 	list_for_each(&tpg_recovery_list, tpg, recovery_entry) {
+ 		if (port_is_on_tgt_port_grp(port, tpg))
+@@ -216,7 +216,7 @@ fail:
+ static void tgt_port_grp_recovery_work_fn(void *arg)
+ {
+ 	struct tgt_port_grp *tpg = arg;
+-	struct tcmur_device *rdev, *tmp_rdev;
++	struct tcmur_device *rdev = NULL, *tmp_rdev;
+ 	bool enable_tpg = false;
+ 	int ret;
+ 
+@@ -280,7 +280,7 @@ int tcmu_add_dev_to_recovery_list(struct tcmu_device *dev)
+ {
+ 	struct tcmur_device *rdev = tcmu_dev_get_private(dev);
+ 	struct list_head alua_list;
+-	struct alua_grp *group;
++	struct alua_grp *group = NULL;
+ 	struct tgt_port_grp *tpg;
+ 	struct tgt_port *port, *enabled_port = NULL;
+ 	int ret;
+-- 
+2.55.0
+
diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
new file mode 100644
index 0000000000..3643f87cd3
--- /dev/null
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A daemon that handles the userspace side of the LIO TCM-User backstore"
+LICENSE = "Apache-2.0 OR LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+	file://LICENSE.LGPLv2.1;md5=a7ef827a98fa240d37910ac4e8ce3f53 \
+	file://LICENSE.Apache2;md5=6c4db32a2fa8717faffa1d4f10136f47 \
+	"
+
+SRCREV = "7b9e5006a30df77ea3f24594b69d4279b2a405dd"
+
+SRC_URI = "git://github.com/open-iscsi/tcmu-runner.git;protocol=https;branch=main;tag=v${PV} \
+           file://0001-CMakeLists-generate-gdbus-code-with-a-relative-path.patch \
+           file://0002-qcow-fix-cache-count-reset-loops.patch \
+           file://0003-target-alua-initialize-list_for_each-iterator-variables.patch \
+           "
+
+inherit cmake pkgconfig systemd
+
+DEPENDS = "gtk4 libnl gperftools glib-2.0-native"
+
+EXTRA_OECMAKE = "-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+		 -Dwith-rbd=false \
+		 -Dwith-glfs=false \
+                "
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[systemd] = "-DSUPPORT_SYSTEMD=ON,,"
+
+SYSTEMD_SERVICE:${PN} = "tcmu-runner.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+FILES:${PN} += " \
+    ${systemd_user_unitdir}/lib \
+    ${systemd_user_unitdir}/tcmu-runner \
+    ${systemd_system_unitdir}/tcmu-runner.service \
+    ${datadir}/dbus-1 \
+"
-- 
2.55.0


