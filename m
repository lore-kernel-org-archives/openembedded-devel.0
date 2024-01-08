Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A91C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:58:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7189.1704722289068348869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145456498"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145456498"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:58:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 770EFD3EA9
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:58:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A9EDB156FB
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:58:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 338DE6CB32
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:58:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF6811A0072;
	Mon,  8 Jan 2024 21:58:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 48.0 -> 49.0
Date: Mon,  8 Jan 2024 21:57:11 +0800
Message-Id: <1704722231-31088-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-2.688900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yY6MisxJraxHkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AbTwzYj2zQumvTNWS7Snv34MZ
	EpBAfSmKSnPFcG4HocuKmKbaPnYD+rWL/xQJnm46eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8irEH
	faj14ZybTeHu17aPV+WIAwKpzBxtPYdwnxCQ1caapINsjF8L3wTbNPhpaAJJw/EAPU2P+nOQ0sc
	/P0IC1a56+Tx4MEIpfcGSK0rGfUNs4KCSgymNMI8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108163

From: Wang Mingyu <wangmy@fujitsu.com>

0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
refreshed for 49.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...llow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch | 10 ++++------
 .../rdma-core/{rdma-core_48.0.bb => rdma-core_49.0.bb} |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_48.0.bb => rdma-core_49.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
index 03ba87261..84378fd27 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
@@ -1,4 +1,4 @@
-From 92747aab189aa3cee954ab31ee019205f8984155 Mon Sep 17 00:00:00 2001
+From 166d97e6ef63dac1941135e97d0c42ce7a8950af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 May 2023 17:22:10 -0700
 Subject: [PATCH] cmake: Allow SYSTEMCTL_BIN to be overridden from environment
@@ -8,15 +8,16 @@ for systemctl
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CMakeLists.txt | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9b7462861..c4d82fb49 100644
+index 2c3deef99..ae60f50b0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -226,7 +226,10 @@ else()
+@@ -229,7 +229,10 @@ else()
    set(CYTHON_EXECUTABLE "")
  endif()
  
@@ -28,6 +29,3 @@ index 9b7462861..c4d82fb49 100644
  if (NOT SYSTEMCTL_BIN)
    set (SYSTEMCTL_BIN "/bin/systemctl")
  endif()
--- 
-2.40.1
-
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_49.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_49.0.bb
index b9e07604d..1d30c4a15 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_49.0.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch"
-SRCREV = "3e039515b959fea70356b010ed093e43cf360e99"
+SRCREV = "0bffa5d9be9b0ede538f395bf40eb25a84003a49"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


