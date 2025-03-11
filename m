Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B97DC35FF3
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4161.1741683323029923077
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rDMXSf3s;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683324; x=1773219324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jCBoFZaJ616ZAjP4NaL5yRy51jb5E9hI/FDgXqnZ3O8=;
  b=rDMXSf3s6owUnpYl1t6vs08vKgwpwFhCnrrnsqWXCBmRObXQnaWgpyDB
   6wY/jZZ1J6idRYEwoKx2S41qsbfmuVpEBberTz8LUB8rQm9jFYDX3ccKd
   dImLhjo3peUW8ZZYoCtXU9HYNHCanqP0LOAfKcP5t9Lr3PCW7/M8ix8Ti
   4a4m6BacHO8nmVTra5JAV/IzoIf0TYGXCyuYgaJzKDk/DOQZy9CKimrUy
   twvmxfYksGRwb4nenXRWWuXWX1i6mkuq4plJBAmH44WINh2FrM3fpU5Eu
   DBZoejBQm0+ATz0oZufP2YyJbr0lCnRaD2ZmHt6mBguiyY3Qq75aLQM/X
   w==;
X-CSE-ConnectionGUID: RvWXFiYPSi2YqKnykfUJHA==
X-CSE-MsgGUID: lAP/XzN4QCWvQELTSTgEpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171602359"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171602359"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:22 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 997DAD6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A612CF7E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E90761A009B;
	Tue, 11 Mar 2025 16:55:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/36] ctags: upgrade 6.1.20250223.0 -> 6.1.20250302.0
Date: Tue, 11 Mar 2025 16:54:37 +0800
Message-Id: <1741683310-8681-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115853

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250223.0.bb => ctags_6.1.20250302.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250223.0.bb => ctags_6.1.20250302.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250223.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250302.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250223.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250302.0.bb
index 697ed4d6cf..4163cfc506 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250223.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250302.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e7db33bb545bf69c83a0501e3cd2f6b558edf7c5"
+SRCREV = "f272e5cfff4950770eb0c6563c1d9281e5119204"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


