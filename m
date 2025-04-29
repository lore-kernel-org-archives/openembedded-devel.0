Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD56C3ABAA
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7616.1745900152223001330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XMeE0uft;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900154; x=1777436154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7T0pgw0jceb4jFxR6MTVENRPf1NEwCNEs+7NeUokD8I=;
  b=XMeE0uft0zx6h6owCrD4bvW3ms3aQKD2doMneb56nD+tBPgBdsSvNrQq
   jEvTNt+dHD6OF2A18mNhgKLndG1ydA4mFw3ylN6Plq3746V3wjAUlJ5aO
   MvPZMlq/z72OywULqp6wYCnLksZJCnJdOx9fihjfWVYblwSQ6gzzdEDYt
   M5b7ZFqGERT0JQbdDafYrp0Br10PQhuqC6nkCocn7r5MsU9i/RC00237e
   hHsYRsiwQkiMPHVCu1BJ82TU+L3OiimjokFc4rbqXJoaJGzHITJOFH7uH
   6OqCHcBjYnmH13YfDnw/p/9KtlP3JBd398D0Si+X7owTvBLUnuCyEsgZx
   A==;
X-CSE-ConnectionGUID: WClBH2Q2SW6nRjxYE6FRsA==
X-CSE-MsgGUID: K3Kbe4iARh2t0kMCwWWvzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="186390926"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="186390926"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7353AC2267
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31398BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E40D71A00A0;
	Tue, 29 Apr 2025 12:15:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/23] python3-ipython: upgrade 9.1.0 -> 9.2.0
Date: Tue, 29 Apr 2025 12:15:33 +0800
Message-Id: <1745900138-26424-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117223

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.1.0.bb => python3-ipython_9.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.1.0.bb => python3-ipython_9.2.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.1.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.2.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.1.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.2.0.bb
index f706f19ae6..08a6ba307d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "a47e13a5e05e02f3b8e1e7a0f9db372199fe8c3763532fe7a1e0379e4e135f16"
+SRC_URI[sha256sum] = "62a9373dbc12f28f9feaf4700d052195bf89806279fc8ca11f3f54017d04751b"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


