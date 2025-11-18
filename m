Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C69DCEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8441.1763456983488076607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qS78hYPa;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456983; x=1794992983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Im1TdYyKTzVEiIuybqgyHZh2Q1udY60tb/iYrq8WR10=;
  b=qS78hYPafWBfbCbUya/n2C0YrHaVixcdAiqQc3TV7dPZrBUMvv12hdlB
   KF4jHeuvVIIKtsKWfN/Cmn1woScwZhtW1LLy0uA+5MgWWXD1sYc4gZoRv
   SmoRL0Chj4PqSeNMvPraaOAQ5XN1nn9An06MVX8jTgrmY404UGwWSQTfB
   uEoFtW8qcqvQ+bzwT56Yw8eMMpX0ZuvBSb9lWCu/3ztwSlCE00VJ3SFkh
   Z1ovDTCxChY+k2/G8PFLHTYCnbSf7hcpkWkbWo44WN5yD3gS2zjbA1l2V
   6ev8Y3Jul8quTXdV7cs326rNkxC2UKH1UekGz1Mz/worUOdDTRfi2jOqq
   Q==;
X-CSE-ConnectionGUID: LU1kreuzT4CgY3uZHTHZHQ==
X-CSE-MsgGUID: raLoLhIdR7W2xLlzDl1eMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="223411722"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="223411722"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:41 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0924E1000348
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:42 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B2551100038C
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3CE22140027A;
	Tue, 18 Nov 2025 09:09:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 29/29] sshfs-fuse: upgrade 3.7.3 -> 3.7.5
Date: Tue, 18 Nov 2025 17:08:46 +0800
Message-ID: <20251118090846.1484-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121840

From: Wang Mingyu <wangmy@fujitsu.com>

03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
a1d58ae1be99571a88b8439b027abe6349b74658.patch
removed since they're included in 3.7.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1f8aa0899268ec02b2f54849352df92a3a1d.patch | 34 -------------------
 ...8ae1be99571a88b8439b027abe6349b74658.patch | 31 -----------------
 ...shfs-fuse_3.7.3.bb => sshfs-fuse_3.7.5.bb} |  7 ++--
 3 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.3.bb => sshfs-fuse_3.7.5.bb} (79%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
deleted file mode 100644
index 63cdc57b44..0000000000
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 03ee1f8aa0899268ec02b2f54849352df92a3a1d Mon Sep 17 00:00:00 2001
-From: Gabriel Staples <ercaguy@gmail.com>
-Date: Tue, 22 Dec 2020 23:33:55 -0800
-Subject: [PATCH] pytest.ini: fix test warning
-
-Warning:
-
-```
-test/util.py:99
-  sshfs/build/test/util.py:99: PytestUnknownMarkWarning: Unknown pytest.mark.uses_fuse - is this a typo?
-  You can register custom marks to avoid this warning - for details, see https://docs.pytest.org/en/stable/mark.html
-    return pytest.mark.uses_fuse()
-```
-
-References for the fix:
-
-1. https://stackoverflow.com/questions/60806473/pytestunknownmarkwarning-unknown-pytest-mark-xxx-is-this-a-typo/60813297#60813297
-1. https://docs.pytest.org/en/stable/mark.html
-
-Upstream-Status: Submitted [https://github.com/libfuse/sshfs/pull/238]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/pytest.ini | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/test/pytest.ini b/test/pytest.ini
-index 95161546..7a7efed4 100644
---- a/test/pytest.ini
-+++ b/test/pytest.ini
-@@ -1,2 +1,4 @@
- [pytest]
- addopts = --verbose --assert=rewrite --tb=native -x -r a
-+markers =
-+    uses_fuse
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch
deleted file mode 100644
index e76dbd5059..0000000000
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a1d58ae1be99571a88b8439b027abe6349b74658 Mon Sep 17 00:00:00 2001
-From: Gabriel Staples <ercaguy@gmail.com>
-Date: Tue, 22 Dec 2020 23:26:40 -0800
-Subject: [PATCH] Fix deprecated warning in conftest.py
-
-```
-test/conftest.py:66
-  sshfs/build/test/conftest.py:66: PytestDeprecationWarning: @pytest.yield_fixture is deprecated.
-  Use @pytest.fixture instead; they are the same.
-    @pytest.yield_fixture(autouse=True)
-```
-
-Upstream-Status: Submitted [https://github.com/libfuse/sshfs/pull/238]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/conftest.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/conftest.py b/test/conftest.py
-index 70cd0c62..d58d45b2 100644
---- a/test/conftest.py
-+++ b/test/conftest.py
-@@ -63,7 +63,7 @@ def register_output(self, pattern, count=1, flags=re.MULTILINE):
- # relies on tests running sequential (i.e., don't dare to use e.g. the xdist
- # plugin)
- current_capfd = None
--@pytest.yield_fixture(autouse=True)
-+@pytest.fixture(autouse=True)
- def save_cap_fixtures(request, capfd):
-     global current_capfd
-     capfd.false_positives = []
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.5.bb
similarity index 79%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.5.bb
index c3a00566ab..ba27bc6312 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.5.bb
@@ -5,11 +5,8 @@ LICENSE = "GPL-2.0-only"
 DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https \
-           file://03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch \
-           file://a1d58ae1be99571a88b8439b027abe6349b74658.patch \
-"
-SRCREV = "c91eb9a9a992f1a36c49a8e6f1146e45b5e1c8e7"
+SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https;tag=sshfs-${PV}"
+SRCREV = "9e35c39ba83f54a49a9df4bf0a629f26c60cc38c"
 
 inherit meson pkgconfig ptest
 
-- 
2.43.0


