Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979FFE77195
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.30516.1735032451597067792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qaSbuG7q;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032452; x=1766568452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=moLWX0dtTn8b5WCZx5C7PBhR/AauV5eesYkaQy4mA/A=;
  b=qaSbuG7q2A1Q3c+tYQQvrFuA646X/vc4Efdrg9lxVMqzKrL2YnX3QYFP
   wconVpmZO+zmRS62SQJ3zbHtlI4m1XkYZdB5aAwwn+we8LZg7b4dO3Zwo
   elQmsCudHvmz1SYmtRNaLkSBrehMdXe4uY5ayxwpFmp0LPEXuYOkYNd20
   i5AZbL0TYHK2IKTWfydVHS3QYZzCGhkct2NuIhzEc4gR2NDU+IzhOcwMR
   ns82WYVFWx8lEXDJw8Msr1m9sMhLNXsDDk6JRutzRIULqhqJZICnUcRoP
   EVF70Acz+TAfRDe9K3DpQEXQu/Lh2M+TDt1968i33vQhZnbPiN4dBWOM1
   A==;
X-CSE-ConnectionGUID: 1xsSHoUMTd6sfM7/dQt9LA==
X-CSE-MsgGUID: S4vkiommQXaXZtSG+hTfQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163714086"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163714086"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B73BDD4C3F
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 91D77BDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 335E820071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D16061A0071;
	Tue, 24 Dec 2024 17:27:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 57/67] python3-sqlparse: upgrade 0.5.2 -> 0.5.3
Date: Tue, 24 Dec 2024 17:26:51 +0800
Message-Id: <1735032421-13513-57-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--4.173200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrECF/8Y+iZ8MHwRKF02uDkPU
	uL2q3eCV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2cwHSQ+yXjTDhV6
	JCMeHAxTi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFLePsR3FqX6kc+gGWdqWqVdBv7
	ytkcsmXvNKOv1apdsq8mfJo6fOHEES+Ia+Xwmy+EpRJvlYrfmPlxLEjn5xSAJT6nBEf/7xFex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114532

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- introduces a more generalized handling of potential denial of service attack
  (DOS) due to recursion errors for deeply nested statements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sqlparse_0.5.2.bb => python3-sqlparse_0.5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.2.bb => python3-sqlparse_0.5.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.2.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
index a293b0bd96..588568c6a2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
@@ -8,7 +8,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "9e37b35e16d1cc652a2545f0997c1deb23ea28fa1f3eefe609eee3063c3b105f"
+SRC_URI[sha256sum] = "09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.43.0


