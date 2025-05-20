Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72EBC5479B
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16488.1747731315687047643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E/mxB+iL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731321; x=1779267321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ft+/67VoAGeQF+bpNVYvmbhXOxwxUOaFngXJoBu4SSQ=;
  b=E/mxB+iLd5OVXGgQNqDn3cTwNg2QCcOllr1Kb62i37oNw1es5jM+4/eh
   uRZJ17xTW4WtNpo16AatLt1sEh5o6FyRVW64EopVMClBNq/QjbR8spo2B
   fwPxgJsLI8nTwhfQBk8gDU/ZiN4zuLUxSVWoQ7WlvhnnOd9e3Ji93Rvqi
   /+TgZSAiQRBWABST1SsjDxL63lP4FtuAQaf52Y2ANQk5G93F/hfPT7k1/
   KNM2d4ko4JCDqbGCLtjJYBmARTbE8GC4lW2XbdeWBw9pI6BxzqOlGN6W3
   iCOwqMYyNF23YrQdAYlh+69h2hbo6LdUX1zMNSA4Qj2q4u6gft9XwkI7P
   A==;
X-CSE-ConnectionGUID: JVdGnRPiTc+w6ilMYP6SvQ==
X-CSE-MsgGUID: odlfbyNVSJqIbhfywQZJUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200435249"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200435249"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C27BD69D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A89AF745
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E632B1A009A;
	Tue, 20 May 2025 16:55:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/27] ser2net: upgrade 4.6.4 -> 4.6.5
Date: Tue, 20 May 2025 16:54:54 +0800
Message-Id: <1747731299-20448-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
index ae8a5108d8..59322dae09 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "75864434c4f002fa3570daaffeb6f794354fca6d8b5814b8386977a3b1416be9"
+SRC_URI[sha256sum] = "96dfc3fd06b1bf4d7c1f46d7e8cc1eff555de64f419d76f57bd0346e000f9781"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.43.0


