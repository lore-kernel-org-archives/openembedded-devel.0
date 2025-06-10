Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288C0C71150
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77957.1749526433086061047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C1sdFClW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526433; x=1781062433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CKSwC7TQFednZIFIRHVqV5je4sNUMq50mNzlunzkeJw=;
  b=C1sdFClWDuT0ZpRJFJWqoi8rXAVK7bzn1cEFRBRa57JbEqtJ96EN4wha
   sm4Lrpw57yMtaeKb1SMv+mt479Z05q0aMzPhcYm89OoKCDdJ0jVv+yjpL
   vysm4HNTxXQ1z/UWG41JF91V0EVeqWV+OgDMuhzP75HqEWNVFGhLRTlEB
   kB4cOayLj7z50r2lI4e/yiIrJVMbagWB+Y50qwPeEVPE6tUv1v/5IYZtI
   MDkZE0mKkZAEnirXYHwOEU0jFV8Kla2jyW5X34EH1Z3wD7APidoQvA5ph
   nK98NlQ4r4XOMOURmA9UcfPBYJJlfnFRy3sIJqG2jBixO/HJB1fS+GAXH
   g==;
X-CSE-ConnectionGUID: nsjCA6p/Qva3JKWz4lpQEw==
X-CSE-MsgGUID: 4v/MdRhDTf2X31pr67cpXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181135323"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181135323"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EAC8BD8E64
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 91979BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 237F11A0071;
	Tue, 10 Jun 2025 11:33:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/64] python3-h5py: upgrade 3.13.0 -> 3.14.0
Date: Tue, 10 Jun 2025 11:33:05 +0800
Message-ID: <20250610033330.924-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117831

From: Wang Mingyu <wangmy@fujitsu.com>

0001-setup_build.py-avoid-absolute-path.patch
refreshed for 3.14.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-setup_build.py-avoid-absolute-path.patch         | 8 ++++----
 .../{python3-h5py_3.13.0.bb => python3-h5py_3.14.0.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.13.0.bb => python3-h5py_3.14.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index de2f09ec8e..e24d4f9225 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,4 +1,4 @@
-From 59d1cc34739a18a32d3250973af2357c41d8d156 Mon Sep 17 00:00:00 2001
+From 76f7c7e6efd8166342cc3c84e53d4e18dbdeda13 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path
@@ -14,10 +14,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index a041fa6..4d44215 100644
+index 9b4766e..a411462 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -20,7 +20,7 @@ from setup_configure import BuildConfig
+@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
  
  
  def localpath(*args):
@@ -25,4 +25,4 @@ index a041fa6..4d44215 100644
 +    return op.join(*args)
  
  
- MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
+ MODULES_NUMPY2 = ['_npystrings']
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.13.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.14.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-h5py_3.13.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.14.0.bb
index aa8a21c783..da280d1253 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.14.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "1870e46518720023da85d0895a1960ff2ce398c5671eac3b1a41ec696b7105c3"
+SRC_URI[sha256sum] = "2372116b2e0d5d3e5e705b7f663f7c8d96fa79a4052d250484ef91d24d6a08f4"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.43.0


