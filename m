Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D343CD12A9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.39469.1711983091346785953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SbkAimSB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983096; x=1743519096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NTtN/05qmGJR6WXO266DHEppEnY2hLaBN5gba8tpyCg=;
  b=SbkAimSBFJbtpWnajsAKoRzIZQ8tDcLWgdCQ2/oVIc/At+Fo6J49ayRG
   ULwNmM88RMsXeJIsGyOhye/pr1zl5mO+duuDwpAvJSSvYtCC7Xkp8wR/6
   b0rWr5JEbXz5tTpg69wlpRd2cq0SeSd4ApPhGX2TlSudveqWrkPxSt7Ma
   r3+77G+i44jZKlze6gGL7r0pg+7H4HHC7je8VoZlsr/ZDJH11GtuJwB29
   Zazs2eCyV4GoU5LfXQjr278zOxFgaY9tb1v1agniVXest73S8+bggly9/
   hIu1RxPbE5qLxLnXNN6gYZOXv+KFrvZHKfSIvQOpean+I6hR3oXGAY6PT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154246616"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154246616"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 975235AF62
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B9BBD620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F7A721BEA8
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA0AF1A000A;
	Mon,  1 Apr 2024 22:51:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/47 v2] python3-blivet: upgrade 3.9.1 -> 3.9.2
Date: Mon,  1 Apr 2024 22:50:44 +0800
Message-Id: <1711983079-16849-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--5.293200-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yTo39wOA02LhDAt+n9Je6in9wRnyxuPjhKB8
	tGwEqygajDVMw6TJvuG0nehEkJKGwsgqWOFh1Y7muLt50vtxBA7YUDvAr2Y/1wrkj7klVufuD9p
	HWLuwZbZSxTaXxnjZ4kpQdH2+JITlD7lLiXNUhrNFrcjXqV+YAAFkGmUzEj/O31GU/N5W5BDW9n
	uzdghUMvu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AGbJMFqqIm9ypTkI0HK8zpTQXT
	kSM3COGy7U1qS9q0fRJ9iwir5XT1V3dgtIvSGPpEVuC0eNRYvJC4sa7AidY08EguqiGeZ5Jo8WM
	kQWv6iXBcIE78YqRWvcUt5lc1lLgOMB0shqXhHqr3Z430F7JthsNjXKif3o8UZEfXO6WHg7cbjW
	W8IfY2IcaXWP2QLSS
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109729

From: Wang Mingyu <wangmy@fujitsu.com>

0006-tweak-btrfs-packages.patch
0011-invoking-dd-with-infinite-timeout.patch
refreshed for 3.9.2

Changelog:
==========
-tests: Add a simple unit test for listing btrfs subvolumes
-Fix getting default subvolume ID for mounted btrfs volumes
-Do not try to get btrfs subvolumes without libblockdev
-Do not raise not implemented exception when checking if btrfs is empty
-Try to start stratisd before checking its availability
-Fix creating Stratis filesystem without size specified
-Fix printing the partition type UUID
-Adjust check for btrfs filesystem being empty
-Fix util.detect_virt on Amazon
-misc: Vagrantfile update
-misc: Run pip with --break-system-packages
-misc: Add missing libmount build dependencies
-availability: Check for mpath friendly names availability
-Allow running blivet without libmount Python bindings
-Fstab cleanup fix
-Fix getting subvolumes for mounted btrfs volumes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-blivet/0006-tweak-btrfs-packages.patch   | 12 ++++++------
 .../0011-invoking-dd-with-infinite-timeout.patch     |  8 ++++----
 ...thon3-blivet_3.9.1.bb => python3-blivet_3.9.2.bb} |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.9.1.bb => python3-blivet_3.9.2.bb} (93%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
index b98dafeab..6c53f03db 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
@@ -1,7 +1,7 @@
-From 359bc9f60a4bcf6be64a72c3825af65269f6c6c9 Mon Sep 17 00:00:00 2001
+From b55b1023f8f1ad3121928eb9d0ee9902f5474752 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:33:15 +0800
-Subject: [PATCH 06/11] tweak btrfs packages
+Subject: [PATCH] tweak btrfs packages
 
 In oe-cre/yocto, we name btrfs package with btrfs-tools,
 rather than btrfs-progs.
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/blivet/devices/btrfs.py b/blivet/devices/btrfs.py
-index 259bcf8..8e4eb2b 100644
+index c446e7e..37c183e 100644
 --- a/blivet/devices/btrfs.py
 +++ b/blivet/devices/btrfs.py
-@@ -57,7 +57,7 @@ class BTRFSDevice(StorageDevice):
+@@ -58,7 +58,7 @@ class BTRFSDevice(StorageDevice):
  
      """ Base class for BTRFS volume and sub-volume devices. """
      _type = "btrfs"
@@ -28,10 +28,10 @@ index 259bcf8..8e4eb2b 100644
  
      def __init__(self, *args, **kwargs):
 diff --git a/blivet/formats/fs.py b/blivet/formats/fs.py
-index 932307a..865b863 100644
+index 1e102b6..f16941e 100644
 --- a/blivet/formats/fs.py
 +++ b/blivet/formats/fs.py
-@@ -1049,7 +1049,7 @@ class BTRFS(FS):
+@@ -1050,7 +1050,7 @@ class BTRFS(FS):
      _formattable = True
      _linux_native = True
      _supported = True
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
index 48ffaf2cb..ea4cffa9b 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From 3d398173f02bb641473299abb1166fdcc3643666 Mon Sep 17 00:00:00 2001
+From 5ee527fab06f9d33b162a6cd0c068d7b3ac2ecb0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 6 Mar 2018 17:28:56 +0800
-Subject: [PATCH 11/11] invoking dd with infinite timeout
+Subject: [PATCH] invoking dd with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
-index b60b9b4..fa8858b 100644
+index 2d67be8..a4cf9a0 100644
 --- a/blivet/devices/partition.py
 +++ b/blivet/devices/partition.py
-@@ -667,7 +667,7 @@ class PartitionDevice(StorageDevice):
+@@ -677,7 +677,7 @@ class PartitionDevice(StorageDevice):
          cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
                 "seek=%d" % start, "count=%d" % count]
          try:
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
similarity index 93%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.9.1.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
index e9c27548e..f0ce98148 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
@@ -16,7 +16,7 @@ SRC_URI += "\
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "fda09ac9ddbbacbb0c00e867006cf36b213b8f5707accdfaaebfd27378f362d8"
+SRC_URI[sha256sum] = "9d97e37ebba01db28a1e6155cbd71c54fb55e9c2be5921982dc85bed316d8cfe"
 
 inherit pypi features_check systemd setuptools3_legacy
 
-- 
2.34.1


