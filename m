Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF7BC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 08:02:23 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.64216.1638864142417722222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 00:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B782I6l016359
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 7 Dec 2021 00:02:18 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1B782D2r021875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Dec 2021 00:02:18 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Dec 2021 00:02:12 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Dec 2021 00:02:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libblockdev: Do not include duplicate entries in
 bd_lvm_lvs output
Date: Tue, 7 Dec 2021 16:02:11 +0800
Message-ID: <20211207080211.2818509-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 08:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94225

We use "-o segtypes" for the "lvs" command which means multisegment
LVs will be twice in the output. [1]
...
$ lvs --noheadings --nosuffix --nameprefixes --unquoted --units=b -a -o
vg_name,lv_name,lv_uuid,lv_size,lv_attr,segtype,origin,pool_lv,data_lv,metadata_lv,role,move_pv,data_percent,metadata_percent,copy_percent,lv_tags

OUTPUT:
|LVM2_VG_NAME=rootvg LVM2_LV_NAME=RCSMW-ARM_CXP2020233_2_R20A154
LVM2_LV_UUID=TgjM5V-jhXX-tPTf-gPMa-c3w6-QEjo-7qkmVg
LVM2_LV_SIZE=71303168 LVM2_LV_ATTR=wi-ao--- LVM2_SEGTYPE=linear
LVM2_ORIGIN= LVM2_POOL_LV= LVM2_DATA_LV= LVM2_METADATA_LV=
LVM2_LV_ROLE=public LVM2_MOVE_PV= LVM2_DATA_PERCENT=
LVM2_METADATA_PERCENT= LVM2_COPY_PERCENT= LVM2_LV_TAGS=

|LVM2_VG_NAME=rootvg LVM2_LV_NAME=RCSMW-ARM_CXP2020233_2_R20A154
LVM2_LV_UUID=TgjM5V-jhXX-tPTf-gPMa-c3w6-QEjo-7qkmVg
LVM2_LV_SIZE=71303168 LVM2_LV_ATTR=wi-ao--- LVM2_SEGTYPE=linear
LVM2_ORIGIN= LVM2_POOL_LV= LVM2_DATA_LV= LVM2_METADATA_LV=
LVM2_LV_ROLE=public LVM2_MOVE_PV= LVM2_DATA_PERCENT=
LVM2_METADATA_PERCENT= LVM2_COPY_PERCENT= LVM2_LV_TAGS=
...

See [2]

[1] https://github.com/storaged-project/libblockdev/pull/671
[2] https://github.com/storaged-project/libblockdev/issues/667

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...de-duplicate-entries-in-bd_lvm_lvs-o.patch | 100 ++++++++++++++++++
 .../libblockdev/libblockdev_2.26.bb           |   4 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch b/meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch
new file mode 100644
index 000000000..03208a9bb
--- /dev/null
+++ b/meta-oe/recipes-extended/libblockdev/files/0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch
@@ -0,0 +1,100 @@
+From d10fb2c0ee60c97f4dfeab4506a347c26cb389df Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Tue, 7 Dec 2021 15:50:45 +0800
+Subject: [PATCH] lvm: Do not include duplicate entries in bd_lvm_lvs output
+
+We use "-o segtypes" for the "lvs" command which means multisegment
+LVs will be twice in the output.
+
+Signed-off-by: Vojtech Trefny <vtrefny@redhat.com>
+
+Upstream-Status: Backport [https://github.com/storaged-project/libblockdev/pull/671]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/plugins/lvm.c | 17 +++++++++++++++--
+ tests/lvm_test.py | 41 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 56 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/lvm.c b/src/plugins/lvm.c
+index 2be1dbd..acd5b84 100644
+--- a/src/plugins/lvm.c
++++ b/src/plugins/lvm.c
+@@ -1810,8 +1810,21 @@ BDLVMLVdata** bd_lvm_lvs (const gchar *vg_name, GError **error) {
+         if (table && (num_items == 15)) {
+             /* valid line, try to parse and record it */
+             lvdata = get_lv_data_from_table (table, TRUE);
+-            if (lvdata)
+-                g_ptr_array_add (lvs, lvdata);
++            if (lvdata) {
++                /* ignore duplicate entries in lvs output, these are caused by multi segments LVs */
++                for (gsize i = 0; i < lvs->len; i++) {
++                    if (g_strcmp0 (((BDLVMLVdata *) g_ptr_array_index (lvs, i))->lv_name, lvdata->lv_name) == 0) {
++                        g_warning("Duplicate LV entry for '%s' found in lvs output",
++                                  lvdata->lv_name);
++                        bd_lvm_lvdata_free (lvdata);
++                        lvdata = NULL;
++                        break;
++                    }
++                }
++
++                if (lvdata)
++                    g_ptr_array_add (lvs, lvdata);
++            }
+         } else
+             if (table)
+                 g_hash_table_destroy (table);
+diff --git a/tests/lvm_test.py b/tests/lvm_test.py
+index eb94c91..ab0de21 100644
+--- a/tests/lvm_test.py
++++ b/tests/lvm_test.py
+@@ -915,6 +915,47 @@ class LvmTestLVs(LvmPVVGLVTestCase):
+         lvs = BlockDev.lvm_lvs("testVG")
+         self.assertEqual(len(lvs), 1)
+ 
++class LvmTestLVsMultiSegment(LvmPVVGLVTestCase):
++    def _clean_up(self):
++        try:
++            BlockDev.lvm_lvremove("testVG", "testLV2", True, None)
++        except:
++            pass
++
++        LvmPVVGLVTestCase._clean_up(self)
++
++    def test_lvs(self):
++        """Verify that it's possible to gather info about LVs"""
++
++        succ = BlockDev.lvm_pvcreate(self.loop_dev, 0, 0, None)
++        self.assertTrue(succ)
++
++        succ = BlockDev.lvm_vgcreate("testVG", [self.loop_dev], 0, None)
++        self.assertTrue(succ)
++
++        succ = BlockDev.lvm_lvcreate("testVG", "testLV", 10 * 1024**2)
++        self.assertTrue(succ)
++
++        lvs = BlockDev.lvm_lvs("testVG")
++        self.assertEqual(len(lvs), 1)
++        self.assertListEqual([lv.lv_name for lv in lvs], ["testLV"])
++
++        # add second LV
++        succ = BlockDev.lvm_lvcreate("testVG", "testLV2", 10 * 1024**2)
++        self.assertTrue(succ)
++
++        lvs = BlockDev.lvm_lvs("testVG")
++        self.assertEqual(len(lvs), 2)
++        self.assertListEqual([lv.lv_name for lv in lvs], ["testLV", "testLV2"])
++
++        # by resizing the first LV we will create two segments
++        succ = BlockDev.lvm_lvresize("testVG", "testLV", 20 * 1024**2, None)
++        self.assertTrue(succ)
++
++        lvs = BlockDev.lvm_lvs("testVG")
++        self.assertEqual(len(lvs), 2)
++        self.assertListEqual([lv.lv_name for lv in lvs], ["testLV", "testLV2"])
++
+ class LvmPVVGthpoolTestCase(LvmPVVGTestCase):
+     def _clean_up(self):
+         try:
+-- 
+2.27.0
+
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
index c884b1133..b9c3bbb40 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools gobject-introspection pkgconfig
 
-SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https"
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https \
+           file://0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch \
+"
 SRCREV = "47ff12242c89e36a33259d18b7068b26c3bb1c64"
 S = "${WORKDIR}/git"
 
-- 
2.27.0


