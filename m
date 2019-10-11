Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1D67F564
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 06:01:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9B61Vub022219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Oct 2019 23:01:31 -0700 (PDT)
Received: from 2ebd3b390030.wrs.com (128.224.153.74) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 10 Oct 2019 23:01:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 11 Oct 2019 06:00:14 +0000
Message-ID: <20191011060014.34852-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011024615.198728-1-hongxu.jia@windriver.com>
References: <20191011024615.198728-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] lvm2: remove unsupported OPTIONS+="event_timeout" rule
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
X-List-Received-Date: Fri, 11 Oct 2019 06:01:33 -0000
Content-Type: text/plain

The OPTIONS+="event_timeout" is Unsupported since systemd/udev version 216,
that is ~5 years ago.

Since systemd/udev version 243, there's a new message printed if unsupported
OPTIONS value is used:

  Invalid value for OPTIONS key, ignoring: 'event_timeout=180'

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1740666

The fix works on lvm2, it is not necessary for libdevmapper
 
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...supported-OPTIONS-event_timeout-rule.patch | 39 +++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch

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
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index 9907d4f92..875709cd9 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -5,6 +5,7 @@ SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 SRC_URI += " \
             file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
             file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
+            file://0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
-- 
2.17.1


