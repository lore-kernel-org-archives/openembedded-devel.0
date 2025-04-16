Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6549CC369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14430.1744794163805344746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q06zngL2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794165; x=1776330165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UdFG3lqPaWimwfgVxUIctF1u1+1gfjk48Wo1KszVfmY=;
  b=Q06zngL2qpPTntuchIwLZRScBXhTmaCT/gH7QQR2Srffy/zlJKH8/7rs
   RQoa/tHSc7ovFQzkreIjdlwdJdWi5U31gD4oYki4A2w84A1HER4NKUdnd
   3e5L2zeltfamuISrphLdSslckVXeR3AXq+P9GEYZAwevOtb9LaxfbfZ/G
   UozZdowD7gFwglOULd6AnxmIpnKyL3Pg6ruflcGzB9nRthgANZ633axzQ
   xpBUUJJaDH+WfRHX1Y3iYLzgXHvXUqV4IBKKdeNQbSUO+EYl29GUn6Bs1
   mLZ2omss9RiiNyp1DxqI+kY3TR1Td4ISsmd/hQQNIRRtkzqkh2xzmF/HX
   A==;
X-CSE-ConnectionGUID: d83hAOitRCuwjOJW56KFJQ==
X-CSE-MsgGUID: 7Wpu0UMjTlm2pxsUCnaGyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="199436268"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="199436268"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 074A9DB61A
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BCAC6BDB64
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FC861A00A0;
	Wed, 16 Apr 2025 17:02:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/31] python3-ipython: upgrade 9.0.2 -> 9.1.0
Date: Wed, 16 Apr 2025 17:02:04 +0800
Message-Id: <1744794136-908-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116900

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.0.2.bb => python3-ipython_9.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.0.2.bb => python3-ipython_9.1.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.0.2.bb b/meta-python/recipes-devtools/python/python3-ipython_9.1.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.0.2.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.1.0.bb
index f3ebb74215..f706f19ae6 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "ec7b479e3e5656bf4f58c652c120494df1820f4f28f522fb7ca09e213c2aab52"
+SRC_URI[sha256sum] = "a47e13a5e05e02f3b8e1e7a0f9db372199fe8c3763532fe7a1e0379e4e135f16"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


