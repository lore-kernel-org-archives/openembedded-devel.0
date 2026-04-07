Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D1DEDB7EB
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 10:13:53 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78045.1775556827652715179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bXgEeN+f;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775556828; x=1807092828;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Df1ReSdhVUODkeYr24TSY2AfDrvN/YSOCBlsm4Hn52k=;
  b=bXgEeN+fdDqsssFJFUlaLbr5SNRQJqHf6EkONhmcM7MgVBh2Xynvr/dX
   3y2iT98ihaQxsV+st6QJF0AM0Nq9Ttvw1228MAn7/KE5TuAbQKSQyQvyK
   egB6rRMDanRNZXaQOC7ybmQi9kRDDTjlcL5ZVD+KHQrvTkRhnDXfCZa14
   wH+ht59AB/NcxfSWGenwZ1SxE/rLENtkL4raH5D1dRoLKxIM9A2zz8o3j
   TZFVpcKM6pHs5iB2amZ7JFgZNHXo849z0+7Dv2rJbEMm3LCfew7PhzF3A
   aV04xjbXboDUmo89f/S12DA/KoFEiOOwhynEuDrmZT27fIXoW3bz3DK5X
   Q==;
X-CSE-ConnectionGUID: SUqvdnFYQh2Ruy9Ify84ig==
X-CSE-MsgGUID: phHYvwXnQTGU8tGSvKXOqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="215137096"
X-IronPort-AV: E=Sophos;i="6.23,165,1770562800"; 
   d="scan'208";a="215137096"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:13:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0DD991C1C708
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:13:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BDB6E1801FF2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:13:45 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A40E010024B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:13:43 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-cucumber-tag-expressions: upgrade 6.2.0 -> 9.1.0
Date: Tue,  7 Apr 2026 18:13:17 +0800
Message-ID: <20260407101317.21262-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 10:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126086

1. Changelog
  https://github.com/cucumber/tag-expressions/blob/main/CHANGELOG.md

2. LIC_FILES_CHKSUM changed as line of License info changed in PKG-INFO file.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ns_6.2.0.bb => python3-cucumber-tag-expressions_9.1.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cucumber-tag-expressions_6.2.0.bb => python3-cucumber-tag-expressions_9.1.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
index 6ddc489f8a..add7031f1e 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Cucumber tag expression parser"
 DESCRIPTION = "Provides a tag-expression parser and evaluation logic for cucumber/behave"
 HOMEPAGE = "https://github.com/cucumber/tag-expressions"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=134f1026f0de92fd30e71976590a2868"
 
-SRC_URI[sha256sum] = "b60aa2cdbf9ac43e28d9b0e4fd49edf9f09d5d941257d2912f5228f9d166c023"
+SRC_URI[sha256sum] = "d960383d5885300ebcbcb14e41657946fde2a59d5c0f485eb291bc6a0e228acc"
 
 inherit pypi python_setuptools_build_meta
 
@@ -12,4 +12,5 @@ PYPI_PACKAGE = "cucumber_tag_expressions"
 
 DEPENDS += "\
     python3-setuptools-scm-native \
+    python3-uv-build-native \
 "
-- 
2.43.0


