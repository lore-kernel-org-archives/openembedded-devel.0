Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37F9A7D048
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 02:47:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9B2lX0J024405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Oct 2019 19:47:33 -0700
Received: from 2ebd3b390030.wrs.com (128.224.153.74) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 10 Oct 2019 19:47:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 11 Oct 2019 02:46:15 +0000
Message-ID: <20191011024615.198728-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: remove unsupported OPTIONS+="event_timeout" rule
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
X-List-Received-Date: Fri, 11 Oct 2019 02:47:34 -0000
Content-Type: text/plain

The OPTIONS+="event_timeout" is Unsupported since systemd/udev version 216,
that is ~5 years ago.

Since systemd/udev version 243, there's a new message printed if unsupported
OPTIONS value is used:

  Invalid value for OPTIONS key, ignoring: 'event_timeout=180'

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1740666

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc         |  1 +
 ...supported-OPTIONS-event_timeout-rule.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 6c95bfd02..5799f59f2 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
            file://0001-configure-Fix-setting-of-CLDFLAGS-default.patch \
+           file://0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch \
            "
 SRC_URI[md5sum] = "5fc07da5461a3794a751dcfc355827d5"
 SRC_URI[sha256sum] = "550ba750239fd75b7e52c9877565cabffef506bbf6d7f6f17b9700dee56c720f"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch
new file mode 100644
index 000000000..5a6db4b88
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch
@@ -0,0 +1,39 @@
+From e48f8328f9d35f23a24e5b27237e8ebf1dbfa269 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 10 Oct 2019 22:38:00 -0400
+Subject: [PATCH] udev: remove unsupported OPTIONS+="event_timeout" rule
+
+The OPTIONS+="event_timeout" is Unsupported since systemd/udev version 216,
+that is ~5 years ago.
+
+Since systemd/udev version 243, there's a new message printed if unsupported
+OPTIONS value is used:
+
+  Invalid value for OPTIONS key, ignoring: 'event_timeout=180'
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1740666
+
+Signed-off-by: Peter Rajnoha <prajnoha@redhat.com>
+
+Upstream-Status: Backport [https://github.com/lvmteam/lvm2/commit/125f27ac37bc9b93cc96f64052b9681b3d479ee1]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ udev/11-dm-lvm.rules.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
+index 91cb991..7c58994 100644
+--- a/udev/11-dm-lvm.rules.in
++++ b/udev/11-dm-lvm.rules.in
+@@ -37,8 +37,6 @@ ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_DISABLE_OTHE
+ 
+ ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1", GOTO="lvm_end"
+ 
+-OPTIONS+="event_timeout=180"
+-
+ # Do not create symlinks for inappropriate subdevices.
+ ENV{DM_LV_NAME}=="pvmove?*|?*_vorigin", GOTO="lvm_disable"
+ ENV{DM_LV_LAYER}=="?*", GOTO="lvm_disable"
+-- 
+2.23.0
+
-- 
2.23.0


