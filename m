Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42686C5B545
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6713.1747817996313122889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oyZRdIH6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817999; x=1779353999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4nN7uL4KNUfyoHHwJRVoFn1fpQS2GnKxy0iVWt/MgBY=;
  b=oyZRdIH6FCgFrmYLqEgjqjkSjQ0a7P6GjaZwQV5fFrLtaXDO7nGR6YBh
   /VtvYb9vZkb2vdPUutrErd64TGGuby5sJzu/Dyx0ENUEcPNOoTuGK5w3a
   9K3NVDyZW19CBxa/NFAhfOYduFkbpPOeAiAfTSZwCluw+I3sdbtmYbp62
   ATdR+jC3Ob+cDsYk1CUMrTMGbWjZXoQsDzhsVqRv62nZuk1iySDS0gEeU
   vEW+RSHNhJhp4RDGl3erIEcy2ogKVU8pyLgyGRcpkXDSYKjnK710hqB2I
   sNSdX9wlpXm5/lAEjiS2n0w/Kgv7mWap638E5uCG+zqYaeUrKKOlg1w+6
   g==;
X-CSE-ConnectionGUID: vUiF7448Qs6wUNYLLnQkSQ==
X-CSE-MsgGUID: 3or9nyhcSkmYPc/VYYljqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188581267"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188581267"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 718AED8E64
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 346C7D8BCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8A311A009A;
	Wed, 21 May 2025 16:59:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/43] python3-platformdirs: upgrade 4.3.7 -> 4.3.8
Date: Wed, 21 May 2025 16:59:10 +0800
Message-Id: <1747817972-28874-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117546

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add missing examples and fix order of examples in README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.3.7.bb => python3-platformdirs_4.3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.3.7.bb => python3-platformdirs_4.3.8.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.7.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.8.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.3.7.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.3.8.bb
index 4854427aec..38f9f1b583 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "eb437d586b6a0986388f0d6f74aa0cde27b48d0e3d66843640bfb6bdcdb6e351"
+SRC_URI[sha256sum] = "3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


