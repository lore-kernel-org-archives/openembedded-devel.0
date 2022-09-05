Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9019C6FA83
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:16:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.23424.1662376576483248622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 04:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VDToffEO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662376574; i=@fujitsu.com;
	bh=Tp5T5G5nmyUawXf2KqgbNCz94NA500h6oCgmLlF8U+k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VDToffEOnDz/bgoWZefFyDYO7bA/x/hFqQ2impIrqAlvg5vHPWVJ62aNc1dTyRbUz
	 4z5iqGK3lrqDgmeJp5pxmtHkvI+idXrE9DBBFlWIeFifRkRz/Ev8uvDxGwl5DvzSbD
	 eLHU1Ly9DQGbMoq9ZAOMbHm1KTCS7xFSSwTF/oYQazVEsOQWe2p5VAsFCizf+LW5hS
	 s0szbVBW+6qILEqGMxMD34K3O5v2xs7xrjux716N0q48llgDdztO5EsKLqzBUPArjd
	 +4iWF+61bNavGJb3MVLzDvkq4anWD4Bj1JwPXctQUkHMeKCRy/oIKCjBAgCs/l917/
	 MJG+pGHprk7TA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWbfulmi
  ywdc7nBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bhnStZCj6YV0xY9oStgXG1bhcjF4eQwENG
  iddv/jJCOFeYJD78f8sG4exmlHi2cTlTFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICjhLv7u0Cs1mA4sunrgPr5RVwkLjy7Q1Yr4SAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitkooy0zNKchMzc3QNDQx
  0DQ1NdY2Ndc1N9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAsMypVjRawfj
  qxU/9Q4xSnIwKYnyfj0tmizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrfmClBOsCg1PbUiLTMHG
  CMwaQkOHiURXrXrQGne4oLE3OLMdIjUKUZXjqmz/+1n5lgOJmd+bTvAzLFpXxeQ7NwPJIVY8v
  LzUqXEed9fA2oWAGnOKM2DGw2L70uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkzrgJN4cn
  MK4G74BXQcUxAx9n1CYMcV5KIkJJqYEpi+6Ujf6f750J2Bt29iee3uCYslG+IvGd04lxhnJPY
  86m6Qvk9YY9O6yV7GJwQ1J96JJx9scrvsl8ty2IWR3s0FFpenqq6gnvjETGrbuX9fwL6tyw1P
  u4ivJ7hjkL9jgOvtWvMK5dv4FEOyOmX2Hz9Q+9av7D3was/fbuRF1g665pdsU2wkyLv+UXZP+
  P41FXtkqukpoXN4evRSDky4fLPTbpP9R5xb37s9/BORO66ugtbnkstXsm7gN+OZfUvj2+uVxb
  X2mudmPPDr+HuktmSLCGXchcGlosf+bLaYZeTJy/Tl74rm9ZOF1Txfh2cwOM12XH5VXG1oIo0
  fQOfFv2WhsVv22UmyNzYntD1WomlOCPRUIu5qDgRAFq4F4pqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1662376574!373521!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8505 invoked from network); 5 Sep 2022 11:16:14 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 11:16:14 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D9DE1151
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 12:16:13 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id CCE57154
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 12:16:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 12:16:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libblockdev: upgrade 2.26 -> 2.27
Date: Mon, 5 Sep 2022 19:15:54 +0800
Message-ID: <1662376554-790-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 11:16:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98664

0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch
removed since it's included in 2.27

Changelog:
=========
 fs: Return BD_FS_ERROR_UNKNOWN_FS on mounting unknown filesystem
 overrides: Fix translating exceptions in ErrorProxy
 tests: Do not check that swap flag is not supported on DOS table
 tests: Lower expected free space on newly created Ext filesystems
 tests: Remove test for NTFS read-only mounting
 vdo_stats: Default to 100 % savings for invalid savings values
 lvm: Fix reading statistics for VDO pools with VDO 8
 tests: Fix creating loop device for CryptoTestLuksSectorSize
 tests: Use losetup to create 4k sector size loop device for testing
 s390: Remove double fclose in bd_s390_dasd_online (#2045784)
 lvm-dbus: Add support for changing compression and deduplication
 tests: Skip test_lvcreate_type on CentOS/RHEL 9
 tests: Fix expected extended partition flags with new parted
 lvm: Do not set global config to and empty string
 lvm: Do not include duplicate entries in bd_lvm_lvs output
 lvm: Use correct integer type in for comparison
 crypto: Remove useless comparison in progress report in luks_format
 boilerplate_generator: Remove unused variable assignment
 kbd: Add missing progress reporting to bd_kbd_bcache_create
 kbd: Fix leaking error in bd_kbd_bcache_detach
 kbd: Fix potential NULL pointer dereference in bd_kbd_bcache_create
 crypto: Remove unused and leaking error in write_escrow_data_file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...de-duplicate-entries-in-bd_lvm_lvs-o.patch | 100 ------------------
 ...ibblockdev_2.26.bb => libblockdev_2.27.bb} |   3 +-
 2 files changed, 1 insertion(+), 102 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.26.bb => libblockdev_2.27.bb} (94%)

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch b/meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch
deleted file mode 100644
index e608358bf7..0000000000
--- a/meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From d10fb2c0ee60c97f4dfeab4506a347c26cb389df Mon Sep 17 00:00:00 2001
-From: Vojtech Trefny <vtrefny@redhat.com>
-Date: Tue, 7 Dec 2021 15:50:45 +0800
-Subject: [PATCH] lvm: Do not include duplicate entries in bd_lvm_lvs output
-
-We use "-o segtypes" for the "lvs" command which means multisegment
-LVs will be twice in the output.
-
-Signed-off-by: Vojtech Trefny <vtrefny@redhat.com>
-
-Upstream-Status: Backport [https://github.com/storaged-project/libblockdev/pull/671]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/plugins/lvm.c | 17 +++++++++++++++--
- tests/lvm_test.py | 41 +++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 56 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/lvm.c b/src/plugins/lvm.c
-index 2be1dbd..acd5b84 100644
---- a/src/plugins/lvm.c
-+++ b/src/plugins/lvm.c
-@@ -1810,8 +1810,21 @@ BDLVMLVdata** bd_lvm_lvs (const gchar *vg_name, GError **error) {
-         if (table && (num_items == 15)) {
-             /* valid line, try to parse and record it */
-             lvdata = get_lv_data_from_table (table, TRUE);
--            if (lvdata)
--                g_ptr_array_add (lvs, lvdata);
-+            if (lvdata) {
-+                /* ignore duplicate entries in lvs output, these are caused by multi segments LVs */
-+                for (gsize i = 0; i < lvs->len; i++) {
-+                    if (g_strcmp0 (((BDLVMLVdata *) g_ptr_array_index (lvs, i))->lv_name, lvdata->lv_name) == 0) {
-+                        g_debug("Duplicate LV entry for '%s' found in lvs output",
-+                                  lvdata->lv_name);
-+                        bd_lvm_lvdata_free (lvdata);
-+                        lvdata = NULL;
-+                        break;
-+                    }
-+                }
-+
-+                if (lvdata)
-+                    g_ptr_array_add (lvs, lvdata);
-+            }
-         } else
-             if (table)
-                 g_hash_table_destroy (table);
-diff --git a/tests/lvm_test.py b/tests/lvm_test.py
-index eb94c91..ab0de21 100644
---- a/tests/lvm_test.py
-+++ b/tests/lvm_test.py
-@@ -915,6 +915,47 @@ class LvmTestLVs(LvmPVVGLVTestCase):
-         lvs = BlockDev.lvm_lvs("testVG")
-         self.assertEqual(len(lvs), 1)
- 
-+class LvmTestLVsMultiSegment(LvmPVVGLVTestCase):
-+    def _clean_up(self):
-+        try:
-+            BlockDev.lvm_lvremove("testVG", "testLV2", True, None)
-+        except:
-+            pass
-+
-+        LvmPVVGLVTestCase._clean_up(self)
-+
-+    def test_lvs(self):
-+        """Verify that it's possible to gather info about LVs"""
-+
-+        succ = BlockDev.lvm_pvcreate(self.loop_dev, 0, 0, None)
-+        self.assertTrue(succ)
-+
-+        succ = BlockDev.lvm_vgcreate("testVG", [self.loop_dev], 0, None)
-+        self.assertTrue(succ)
-+
-+        succ = BlockDev.lvm_lvcreate("testVG", "testLV", 10 * 1024**2)
-+        self.assertTrue(succ)
-+
-+        lvs = BlockDev.lvm_lvs("testVG")
-+        self.assertEqual(len(lvs), 1)
-+        self.assertListEqual([lv.lv_name for lv in lvs], ["testLV"])
-+
-+        # add second LV
-+        succ = BlockDev.lvm_lvcreate("testVG", "testLV2", 10 * 1024**2)
-+        self.assertTrue(succ)
-+
-+        lvs = BlockDev.lvm_lvs("testVG")
-+        self.assertEqual(len(lvs), 2)
-+        self.assertListEqual([lv.lv_name for lv in lvs], ["testLV", "testLV2"])
-+
-+        # by resizing the first LV we will create two segments
-+        succ = BlockDev.lvm_lvresize("testVG", "testLV", 20 * 1024**2, None)
-+        self.assertTrue(succ)
-+
-+        lvs = BlockDev.lvm_lvs("testVG")
-+        self.assertEqual(len(lvs), 2)
-+        self.assertListEqual([lv.lv_name for lv in lvs], ["testLV", "testLV2"])
-+
- class LvmPVVGthpoolTestCase(LvmPVVGTestCase):
-     def _clean_up(self):
-         try:
--- 
-2.27.0
-
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.27.bb
similarity index 94%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.27.bb
index 3e6df5689a..eff775c930 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.27.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 inherit autotools gobject-introspection pkgconfig
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https \
-           file://0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch \
 "
-SRCREV = "47ff12242c89e36a33259d18b7068b26c3bb1c64"
+SRCREV = "2a651c1366bc3a56982d97ebeec03744b5f9dcd0"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
-- 
2.25.1


