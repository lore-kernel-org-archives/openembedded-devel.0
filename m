Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB53EDE9AE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.18336.1725959012835706305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eYQCCsjX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959013; x=1757495013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=46Gg6lxOaidy6iGflfPhAZfjh6BkE91Pn7U2MDL8o3A=;
  b=eYQCCsjXVKXl7oZVu+KjnhWR18pLqpKnwz9HVvySnCTX5Yv3KZn7MwJT
   75Ki31bi8t1g7HRlZpGEHZGhnlogPWsKPs4wLP7P2blSw2eFGLMymqzsC
   Y6hcvg5SgneEcga7SuHHJr0QkFqWdEmj/7LVdCCN3D7CNlV+C/PdulpHh
   vDQlFaSPPjLdZ5KtVxJXz4wwGjcr+K3Sgkj7YbZjjfNfZTPqW5hlo75P7
   7h/supI0P99kdC+3WgzNQPFOHid4rXXrmq4F5TrUzwjvP1pqoY/ZS/HhB
   9vVl4MEowTAFItv2PYrZommd+D8m/NWY/LBMZ+IQLdNWqasWXxzY4kjpf
   g==;
X-CSE-ConnectionGUID: oEAq+bItTlqYnZPnf11wuA==
X-CSE-MsgGUID: Cf9bIceiSfuUtMEGmUybww==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173393776"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173393776"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3982DD424E
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76404D8B7D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1362E200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB0981A01E9;
	Tue, 10 Sep 2024 17:03:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/42] python3-platformdirs: upgrade 4.2.2 -> 4.3.1
Date: Tue, 10 Sep 2024 17:02:53 +0800
Message-Id: <1725958990-5719-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--5.915800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mra9qiaDSLgo06FHRWx2FGsHb4
	3puA25sAqV/q9KFgVMgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2a/1
	DMOwpv9fi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkj80Za3RRg8JZAZp7NdQQD90H48hcl6JAljc
	vsyitAH0baUl/7TylokETreuU4Omk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112211

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Speed up Hatch installation
- Test with Python 3.13
- Test with latest PyPy
- Use include-hidden-files: true to upload coverage artifacts
- Ensure PlatformDirs is valid superclass type for mypy AND not an abstract class for other checkers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.2.2.bb => python3-platformdirs_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.2.2.bb => python3-platformdirs_4.3.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
index fed82c068..a994197ef 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "38b7b51f512eed9e84a22788b4bce1de17c0adb134d6becb09836e37d8654cd3"
+SRC_URI[sha256sum] = "63b79589009fa8159973601dd4563143396b35c5f93a58b36f9049ff046949b1"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


