Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94DFC78F63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:11:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7DGBwUh018925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 09:11:58 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 09:11:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 00:22:20 +0800
Message-ID: <b2fbe0dec029ea45e924db69c452dad1936abd37.1534177115.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534177115.git.hongxu.jia@windriver.com>
References: <cover.1534177115.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/5] python3-blivet: add `-Z y' and `-y' to lvm.pvcreate
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
X-List-Received-Date: Mon, 13 Aug 2018 16:11:57 -0000
Content-Type: text/plain

While reinstall a crypt fs, it occasionally failed
[snip]
|gi.overrides.BlockDev.LVMError: Process reported exit code 5:
WARNING: atari signature detected on /dev/mapper/luks-0e5f891c
-7701-48bc-a41e-8d626b6ef953 at offset 466. Wipe it? [y/n]:
[snip]

Add `-Z y' and `-y' to lvm.pvcreate

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0013-add-Z-y-and-y-to-lvm.pvcreate.patch       | 41 ++++++++++++++++++++++
 .../python-blivet/python3-blivet_3.0.1.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch
new file mode 100644
index 0000000..33b5f51
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch
@@ -0,0 +1,41 @@
+From bddbfa499df16b108f2d892ee48d65617523c33d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 9 Aug 2018 11:00:39 +0800
+Subject: [PATCH] add `-Z y' and `-y' to lvm.pvcreate
+
+While reinstall a crypt fs, it occasionally failed
+[snip]
+|gi.overrides.BlockDev.LVMError: Process reported exit code 5:
+WARNING: atari signature detected on /dev/mapper/luks-0e5f891c
+-7701-48bc-a41e-8d626b6ef953 at offset 466. Wipe it? [y/n]:
+[snip]
+
+Add `-Z y' and `-y' to lvm.pvcreate
+
+Upstream-Status: Submitted [https://github.com/storaged-project/blivet/pull/714]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/formats/lvmpv.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/blivet/formats/lvmpv.py b/blivet/formats/lvmpv.py
+index 260cc0b..4bbb46f 100644
+--- a/blivet/formats/lvmpv.py
++++ b/blivet/formats/lvmpv.py
+@@ -120,9 +120,9 @@ class LVMPhysicalVolume(DeviceFormat):
+         log_method_call(self, device=self.device,
+                         type=self.type, status=self.status)
+ 
+-        # Consider use of -Z|--zero
+-        # -f|--force or -y|--yes may be required
+-        blockdev.lvm.pvcreate(self.device, data_alignment=self.data_alignment)
++        ea_zero = blockdev.ExtraArg.new("-Z", "y")
++        ea_yes = blockdev.ExtraArg.new("-y", "")
++        blockdev.lvm.pvcreate(self.device, data_alignment=self.data_alignment, extra=[ea_zero, ea_yes])
+ 
+     def _destroy(self, **kwargs):
+         log_method_call(self, device=self.device,
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
index 5fcbd88..75f02f1 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
            file://0012-remove-dmraid-dependency-check.patch \
+           file://0013-add-Z-y-and-y-to-lvm.pvcreate.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "blivet-(?P<pver>\d+(\.\d+)+)$"
-- 
2.7.4


