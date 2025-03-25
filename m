Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853B0C36010
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.61527.1742893332305779152
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E6WZ1prt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893332; x=1774429332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OKN/9aHPGtQ1d+8lTYQBcxSxbdZo6tS60ASQPL/UHJQ=;
  b=E6WZ1prth5L2tdtk05NSuOjiO7F5zv3DUadRuz66w2w7L05ktG2LQj8i
   3hpgGsRtc6g7mDHIoZR6tmeYvs9SBvywmwQjhSNckWbDRGZgo6jxxniqH
   RA+s3uvdlxZS9DW1AxSOzqaqzs+wXA51ygKxY1W8k+hnywBuAIcd6Mx/M
   jfNxoVxG4iveMqv4DLqVysu6IwfDuokpxkfzi4mU1IqUTyWHZs8qPXEEt
   0l6J7BcMBU3yCuF6FNM8K3Zkxn8yhtdMusPDRbxQoEwhTBqnHcnS83Vsd
   VawO7mNOnElLoOFVYdE/tcyuLZagm4KpiCUOU2ieKb7Cof6Q4ODJfKKh0
   A==;
X-CSE-ConnectionGUID: LS1hwraKRDOhmWx8MtmpDA==
X-CSE-MsgGUID: Jrj4blq6Qa2tmvarp0k9QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="181539212"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="181539212"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E1E9DC72A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E69DDBDCB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80AEE1A0078;
	Tue, 25 Mar 2025 17:02:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/45] libcbor: upgrade 0.11.0 -> 0.12.0
Date: Tue, 25 Mar 2025 17:01:16 +0800
Message-Id: <1742893312-3809-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116233

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcbor/{libcbor_0.11.0.bb => libcbor_0.12.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.11.0.bb => libcbor_0.12.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
rename to meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
index 0e15393dd5..4c5eb8a640 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.11.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 
 SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
-SRCREV = "170bee2b82cdb7b2ed25af301f62cb6efdd40ec1"
+SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


