Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA23C71136
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.78435.1749526427263811306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OPUE5qZq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526434; x=1781062434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QHkN+CTskLzJkdjiimTqPEqD6xZV/E3uOLQPHnKOuQc=;
  b=OPUE5qZqRrvxaT3j59FZbaNC4vHnpQAzvdjxx+/qOhxxWf1YSXpvTPsJ
   C2vU2pE6+NdovdwqXzj1zATt8zLgJz79v9AUetZgVzeYNQ0wH28SouyHp
   4DfyRKpoNawZmb6PRtyYejh1sAoPCE/9dSmXyP/shiemVYBp4chEc7/04
   bD2XEc0smV1t04QPTeCCQfaV+oBHxrqiVoT/AdndJis96ThG8Mp87FWCe
   6bXrhexXwPuQucDpZE8m8XF60+z9Wba7+AiZ1mwPtkCWbIXociCQ4SxCK
   APhIHAyaWTwuzfzSytFjKgHJFLMA9JGSQs3swZWOnKX9xnO1k30PJmrL8
   g==;
X-CSE-ConnectionGUID: QsM3HTBVRRqITtgw/Gts+g==
X-CSE-MsgGUID: Vndio3yDT62rPfdrb/HO7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202190311"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202190311"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A08B4E8FE0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CDACBF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:49 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D28081A0071;
	Tue, 10 Jun 2025 11:33:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/64] python3-inline-snapshot: upgrade 0.23.0 -> 0.23.2
Date: Tue, 10 Jun 2025 11:33:07 +0800
Message-ID: <20250610033330.924-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117832

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fixed
- The readline module doesn't have to be installed on non-windows systems.
- command line flags work again in CI

Changed
- changed how the Snapshot[T] type is implemented.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.23.0.bb => python3-inline-snapshot_0.23.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.23.0.bb => python3-inline-snapshot_0.23.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.2.bb
index 0442f74f92..247ceed88d 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "872d027b1eae4e3e3b4028e0d46128bafbf62889a2424a2667dbe4b69cb1ffdf"
+SRC_URI[sha256sum] = "440060e090db0da98bd1dea5d9c346291a0c7388213ff9437411ed59885a956d"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


