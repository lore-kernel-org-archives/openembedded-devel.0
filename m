Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683C5CD548B
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:39:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2308.1695109165900764279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132481927"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132481927"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:39:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20931C3F8B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:39:20 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 655AAD5E9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:39:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 819D32FC8066;
	Tue, 19 Sep 2023 16:39:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyfanotify: upgrade 0.2.0 -> 0.2.1
Date: Tue, 19 Sep 2023 15:38:42 +0800
Message-Id: <1695109122-7423-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--0.902600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yTo39wOA02LhpxAd6mi1Ga3ozDhGeQC9ElYM
	JR3dIrh2ocVgDNidr2Dov4MY2WSEP4grKnsJ1GRgP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7A1k+nsCg3dwhv3PZYpJKQULGByvQyLAZvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1/iuRDmUi4Q++jXYjLL0A1w7FjszGpjJtuXeDDe8WI8762qRj64Vs8FhIs
	qDPtz6+Vw0jFN+6mLZt4Kfiohe7m4uq6u5fdW4KYltngPZ0gyBTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104975

From: Wang Mingyu <wangmy@fujitsu.com>

0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
refreshed for 0.2.1

Changelog:
==========
add installing clang package for readthedocks
atexit fix
fix file system events: store fs info when marked

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-ext-define-FNM_EXTMATCH-if-not-already-defined.patch | 8 ++++----
 ...n3-pyfanotify_0.2.0.bb => python3-pyfanotify_0.2.1.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyfanotify_0.2.0.bb => python3-pyfanotify_0.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
index 933e086265..2fa3cb05d4 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
@@ -13,11 +13,11 @@ Upstream-Status: Inappropriate
  1 file changed, 3 insertions(+)
 
 diff --git a/src/ext.c b/src/ext.c
-index 2ba9a14..98ffc20 100644
+index e0bbe21..7d979d3 100644
 --- a/src/ext.c
 +++ b/src/ext.c
-@@ -18,6 +18,9 @@
- #include <sys/un.h>
+@@ -19,6 +19,9 @@
+ #include <sys/vfs.h>
  #include <unistd.h>
  
 +#ifndef FNM_EXTMATCH
@@ -27,5 +27,5 @@ index 2ba9a14..98ffc20 100644
  PyDoc_STRVAR(ext__doc__,
  "Wrapper for fanotify.\n"
 -- 
-2.32.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyfanotify_0.2.1.bb
index 7c16750040..c9fd07144c 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
 
 SRC_URI += "file://0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch"
-SRC_URI[sha256sum] = "1ec1c61fba9dea96cf8eac7f1a0cca2517613da20d156b7da2a06f9d63c77aca"
+SRC_URI[sha256sum] = "fd62dccdf3c17ca117e3279f0cbc65c639e53c9dec8a459d44ed6a35c1a18e60"
 
 inherit pypi setuptools3
 
-- 
2.34.1


