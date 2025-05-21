Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79367C54E92
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BLZDitDC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818004; x=1779354004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a1llpNao96xcPt3A/4aPi4qsJwkgAVOWM/w5enhOwmc=;
  b=BLZDitDCgEujkvR+2c/l9ly+PBzhbg/fRVzn57BE3LdJ/MUeJsul6Gkt
   P4ZnRNQ7GCsm7M//LUQ5soWncHt9ejmPMmqU4JMyh7pDPx7Uv8PaY0h9+
   Zd3u3ERmFB6lYmrVJ+xQEEf1Nnj6nolKcB2hmmcrtbng49HxIyeveSVVt
   Rq7jA03+HhQsyInDSklYMoO9N05v0QzoMyK9NtGFsuco/m8RDlVvQpWRr
   47Hppe3Xen1eGJDntnPsqEODuyJ2sjBLPh19zo2Ap40b8f9d3nkfs+mTD
   UC57TbJyuswieOlmZXQuJnY6A6VgcnHntPf/Fha+i62yLBdTxC3AP6Ppb
   w==;
X-CSE-ConnectionGUID: JmgdKtOpR4idYwAa1Z8LXg==
X-CSE-MsgGUID: vLQ9PRA1TDmHswig9zXejQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157675"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157675"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6641CE0ABE
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 21191D8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D60421A00A0;
	Wed, 21 May 2025 17:00:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/43] python3-typer: upgrade 0.15.2 -> 0.15.4
Date: Wed, 21 May 2025 16:59:28 +0800
Message-Id: <1747817972-28874-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117562

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.15.2.bb => python3-typer_0.15.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.15.2.bb => python3-typer_0.15.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.15.2.bb b/meta-python/recipes-devtools/python/python3-typer_0.15.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.15.2.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.15.4.bb
index 48d88502ff..26b0c042be 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.15.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "ab2fab47533a813c49fe1f16b1a370fd5819099c00b119e0633df65f22144ba5"
+SRC_URI[sha256sum] = "89507b104f9b6a0730354f27c39fae5b63ccd0c95b1ce1f1a6ba0cfd329997c3"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0


