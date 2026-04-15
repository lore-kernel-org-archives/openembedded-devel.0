Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C112FA0C40
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13244.1776237548934989141
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TuXaz7Vh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776237547; x=1807773547;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W9HGZK1Sdxikv6SKI7uPpDD3s2+DKA8MEPcSGd2GHtw=;
  b=TuXaz7VhulGyKce9F/gMfnfYRTM83s46qPedg87glkiyML6J4BLAGrZO
   QeRCKu9EJUFEvDVLdFLmfOKfNTNzxlCEBul+8tXnGJr/FaZ56gZurGl82
   hVKeT+/KB2LHtdYUr95RYuyRDWc8ZXkGw30r20NHv4IpVPNrxyYhuDfVo
   bc3UV52O5cwQAi/PEeKvF8wn0uOX6q4blFTga7ctP4LKsgM+Xeozr4nnF
   10Ao+GbKgUGT598LNjysex1xWk6epVSbgvfvmAuO3HUi4qPGiVbqnnEad
   L+LLpbAAhOlqRS0nB8Ul9rdkdlVr4uBUsLXtEB/fVjJQn3e5LViN3+n3U
   g==;
X-CSE-ConnectionGUID: /KU5mBhQT/Cs3r37Rn/ZIA==
X-CSE-MsgGUID: eznRQH11T1KUrS5dUPXEUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="236481928"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236481928"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:19:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4356E18A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:07 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E5E321C002C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:06 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id B67401800107
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:04 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-mlcommons-loadgen: upgrade 5.1.2 -> 6.0.14
Date: Wed, 15 Apr 2026 15:18:56 +0800
Message-ID: <20260415071900.6767-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
References: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126346

Update source-date-epoch.patch for 6.0.14

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../files/source-date-epoch.patch             | 43 ++++++++++---------
 ...bb => python3-mlcommons-loadgen_6.0.14.bb} |  2 +-
 2 files changed, 24 insertions(+), 21 deletions(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.1.2.bb => python3-mlcommons-loadgen_6.0.14.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch b/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch
index 32e529d483..3eac44e738 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch
@@ -1,6 +1,6 @@
-From dd7925397b84c2a327cd4594edba9f7ca5acef61 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 26 Sep 2025 14:02:23 +0800
+From 99dfd88de60dd55bd3b5e7c0516b3882a8e56698 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 15 Apr 2026 06:09:37 +0000
 Subject: [PATCH] Honor the SOURCE_DATE_EPOCH variable
 
 Implement the SOURCE_DATE_EPOCH specification[1] for reproducible
@@ -12,30 +12,33 @@ current time.
 Upstream-Status: Submitted [https://github.com/mlcommons/inference/pull/2345]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Update for 6.0.14
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  version_generator.py | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/version_generator.py b/version_generator.py
-index 2e75243..5202da9 100644
+index b88ae8e..b083eec 100644
 --- a/version_generator.py
 +++ b/version_generator.py
-@@ -110,8 +110,13 @@ def generate_loadgen_version_definitions(cc_filename, loadgen_root):
-     # Write the version into the function definition
-     ofile.write(func_def("Version", f"\"{version_contents}\""))
- 
--    date_time_now_local = datetime.datetime.now().isoformat()
--    date_time_now_utc = datetime.datetime.utcnow().isoformat()
-+    if os.environ.get('SOURCE_DATE_EPOCH', False):
-+        source_date_epoch = int(os.environ['SOURCE_DATE_EPOCH'])
-+        date_time_now_local = datetime.datetime.fromtimestamp(source_date_epoch).isoformat()
-+        date_time_now_utc = datetime.datetime.fromtimestamp(source_date_epoch, tz=datetime.timezone.utc).isoformat()
-+    else:
-+        date_time_now_local = datetime.datetime.now().isoformat()
-+        date_time_now_utc = datetime.datetime.utcnow().isoformat()
-     ofile.write(func_def("BuildDateLocal", '"' + date_time_now_local + '"'))
-     ofile.write(func_def("BuildDateUtc", '"' + date_time_now_utc + '"'))
+@@ -113,8 +113,13 @@ def generate_loadgen_version_definitions(cc_filename, loadgen_root):
+         # Write the version into the function definition
+         ofile.write(func_def("Version", f"\"{version_contents}\""))
  
+-        date_time_now_local = datetime.datetime.now().isoformat()
+-        date_time_now_utc = datetime.datetime.utcnow().isoformat()
++        if os.environ.get('SOURCE_DATE_EPOCH', False):
++            source_date_epoch = int(os.environ['SOURCE_DATE_EPOCH'])
++            date_time_now_local = datetime.datetime.fromtimestamp(source_date_epoch).isoformat()
++            date_time_now_utc = datetime.datetime.fromtimestamp(source_date_epoch, tz=datetime.timezone.utc).isoformat()
++        else:
++            date_time_now_local = datetime.datetime.now().isoformat()
++            date_time_now_utc = datetime.datetime.utcnow().isoformat()
+         ofile.write(
+             func_def(
+                 "BuildDateLocal",
 -- 
-2.34.1
+2.43.0
 
diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.2.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.14.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.2.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.14.bb
index 79687290f5..3299f25080 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.2.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.14.bb
@@ -21,7 +21,7 @@ SRC_URI += " \
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "cd686a6223c978d1056e38a417e4807bfa21c855189f7882d24c8313174bca74"
+SRC_URI[sha256sum] = "9a56e361b4614938acdb6a601cc9c57ce551809f831023401bbac6dd7eb00970"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


