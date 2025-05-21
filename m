Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A512C5B548
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fcrcn6IY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817999; x=1779353999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B46/6OUe/Mrlcg7J3ZJFnARD1RDOET94HbVGNflS4ns=;
  b=fcrcn6IYcUlalhgGiRMvaxrwvnacCO9V0eivFSqat4rYvqigbUqDdRE1
   +dXGwEe5dFG7lgZmV4b6iZf12mFI6podMmPqbR6KVD55ryFQyBlzuvEG3
   u0qaKafvTbCT6qHKK7GzfD94WOeZh1tvPrGWlVIDRadMS8o+czvUg36Po
   +vaIG3r4SII91aYMpvUaEywy0kN25NdajTZnxINDfhLKd3tCgBIrEuNaV
   uFD2BQgWvVxZ79mMO7anifpqdzOv7xPxzGT0HAFQ7umIj6kQC/KZnz24u
   hkNf8eT999UhnPJy1L5FcaKkLiCOPkXy6QG8tliinYHMzg0cyrA0LqXof
   A==;
X-CSE-ConnectionGUID: O1nA7t27Qi6FcEEB2I2bBg==
X-CSE-MsgGUID: x2G0bMYBTBm6iMqZ+nyXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152532"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152532"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CAC5D6F6F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3C72D3F24
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 631EB1A00A0;
	Wed, 21 May 2025 16:59:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/43] python3-matplotlib: upgrade 3.10.1 -> 3.10.3
Date: Wed, 21 May 2025 16:59:08 +0800
Message-Id: <1747817972-28874-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117545

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Change-types-for-width-height-to-match-definitions-i.patch
refreshed for 3.10.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ge-types-for-width-height-to-match-definitions-i.patch | 8 ++++----
 ...-matplotlib_3.10.1.bb => python3-matplotlib_3.10.3.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.10.1.bb => python3-matplotlib_3.10.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch
index bf73bf9a22..f2c85abfbe 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch
@@ -1,4 +1,4 @@
-From b19715aeafcf8440466553d01717924add1eabf4 Mon Sep 17 00:00:00 2001
+From 9e4624f256a256df595a0169908f28721fc4cdf3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Apr 2025 23:17:12 -0700
 Subject: [PATCH] Change types for width/height to match definitions in
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/_backend_agg.h b/src/_backend_agg.h
-index 0e33d38dfd..dcbd7e1496 100644
+index 8010508..29bb81a 100644
 --- a/src/_backend_agg.h
 +++ b/src/_backend_agg.h
-@@ -131,12 +131,12 @@ class RendererAgg
+@@ -132,12 +132,12 @@ class RendererAgg
  
      virtual ~RendererAgg();
  
@@ -34,7 +34,7 @@ index 0e33d38dfd..dcbd7e1496 100644
      {
          return height;
      }
-@@ -206,7 +206,7 @@ class RendererAgg
+@@ -205,7 +205,7 @@ class RendererAgg
      void restore_region(BufferRegion &reg);
      void restore_region(BufferRegion &region, int xx1, int yy1, int xx2, int yy2, int x, int y);
  
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb
index 6d678bd66a..97a2910fa2 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
             file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
             "
-SRC_URI[sha256sum] = "e8d2d0e3881b129268585bf4765ad3ee73a4591d77b9a18c214ac7e3a79fb2ba"
+SRC_URI[sha256sum] = "2f82d2c5bb7ae93aaaa4cd42aca65d76ce6376f83304fa3a630b569aca274df0"
 
 inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
 
-- 
2.43.0


