Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1608.1627971225000682771
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 23:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1736DiUN010348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 23:13:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 2 Aug 2021 23:13:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 2 Aug 2021 23:13:43 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-blivetgui: 2.1.10 -> 2.2.1
Date: Tue, 3 Aug 2021 14:13:39 +0800
Message-ID: <20210803061339.2196-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803061339.2196-1-kai.kang@windriver.com>
References: <20210803061339.2196-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade python3-blivetgui from 2.1.10 to 2.2.1.

* drop backported patch
  0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ype-of-BlivetUtils.get_disks-1658893.patch | 32 -------------------
 ...i_2.1.10.bb => python3-blivetgui_2.2.1.bb} |  6 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.10.bb => python3-blivetgui_2.2.1.bb} (73%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch
deleted file mode 100644
index cf8056685..000000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4d0f9f961704bc1dd83fdf6808fb6ab91dc6a768 Mon Sep 17 00:00:00 2001
-From: Vojtech Trefny <vtrefny@redhat.com>
-Date: Thu, 13 Dec 2018 13:39:03 +0100
-Subject: [PATCH] Fix return type of BlivetUtils.get_disks (#1658893)
-
-This must be a list, not a generator, because we are iterating
-over it multiple times in some cases.
-
-Upstream-Status: Backport[git://github.com/rhinstaller/blivet-gui]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- blivetgui/blivet_utils.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/blivetgui/blivet_utils.py b/blivetgui/blivet_utils.py
-index e2bd802..ddb04fc 100644
---- a/blivetgui/blivet_utils.py
-+++ b/blivetgui/blivet_utils.py
-@@ -204,7 +204,7 @@ class BlivetUtils(object):
- 
-         """
- 
--        return (device for device in self.storage.disks if device.type != "mdarray")
-+        return [device for device in self.storage.disks if device.type != "mdarray"]
- 
-     def get_group_devices(self):
-         """ Return list of LVM2 Volume Group devices
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
similarity index 73%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
index 92402bee5..5493610a1 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "67ec0b7a0e065ba24ab87963409bfb21b2aac6dd"
-SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
-           file://0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch \
-"
+SRCREV = "adb6bd69fb3cfa709265db66ddcee04c0b5e070f"
+SRC_URI = "git://github.com/storaged-project/blivet-gui.git"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 systemd"
-- 
2.17.1

