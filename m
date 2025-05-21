Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AD8C61CE8
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F6vdORzT;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uO6wi8yL2oxkaan6NvFlOPU4V6xvLkh1l7w/Z8/cvxk=;
  b=F6vdORzTBnRFj5WRDhMDQ86MKUi3oD9DGsaENAhSn2DCOmk7H3km88Q+
   OU/pLumN8Xc4i3sZXeogz7gBenqf5DF/8ZtFKmAWg6qFrbld66Fp50vPl
   m1S99lvIr53Cc4Em9w/au68OpxeaazKSKMFqG1edO7djyvClmLVnlSHPT
   xy6CmLEZhYpT8L9QC2CTRXejG5RM1rA2iofkpw6UsQVFL9Vpnz5xvNYHP
   aZh3z9eIX5lcEJz/tzFmHXAEs4WNWDBQYfJDGzQFHdpg/q+1ADvgrsU1C
   7+km750xblgLKq7ZsluK1jiNpHEbjZ9r+5uYqqdBN0stBq6Vk9RASAIwr
   A==;
X-CSE-ConnectionGUID: xqAJaD+jSWWJ3ojyDWJ/kA==
X-CSE-MsgGUID: OuMHcOhyQ0ilXkhx99BjzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157654"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157654"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 40677D8E65
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED6BDBDCBB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F38C1A0078;
	Wed, 21 May 2025 16:59:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/43] python3-bitstruct: upgrade 8.20.0 -> 8.21.0
Date: Wed, 21 May 2025 16:58:54 +0800
Message-Id: <1747817972-28874-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117530

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstruct_8.20.0.bb => python3-bitstruct_8.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.20.0.bb => python3-bitstruct_8.21.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.20.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.21.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.20.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.21.0.bb
index f2a291e3bc..9431473548 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "f6b16a93097313f2a6c146640c93e5f988a39c33364f8c20a4286ac1c5ed5dae"
+SRC_URI[sha256sum] = "ff0be4968a45caf8688e075f55cca7a3fe9212b069ba67e5b27b0926a11948ac"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


