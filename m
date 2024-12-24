Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5662E77194
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.30367.1735032448125228616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UKA+BUei;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032453; x=1766568453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rHxETg0ozVSF+LKeW5HYNAWue2AzYLn2UMYuWDW2fwY=;
  b=UKA+BUeib0m8qKYKQdLuVkPUsvBiBsLXoa83pUqgjuZZXIA6sY+r0VaI
   9iIUibwxwqbjMk0tQtT59JaYpnnPfR43Qa4Hs1mLgiPvjaj31s4NaQ1ml
   4vIvBT7xtyEBq2M5bs7hslhFNilnSjRX1fkLddh6E863O+fpnO6ZCu1hj
   eM5NUbiZiuiuppRyY2/wHyOuN5cXrC+MZd/TVv+ZMSHC/f6fVvwHby9wO
   HYzJr/HxiMTPKUK94ZeZ/VxD5VtkpcAnUmmb/w88n1MN+lrlbQy7SX2Ly
   564dwarXONA2TZ2iXQYYYBYa66UU+mE7Mn/32YiTTjKdFkjZCkam7g6R1
   Q==;
X-CSE-ConnectionGUID: b5UDtVewTcOCD8UymcNbOA==
X-CSE-MsgGUID: scEJ54A+RrWQxwCBYWxb0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184807094"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184807094"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C978D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06612BDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 945C16B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D1DE1A006C;
	Tue, 24 Dec 2024 17:27:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 67/67] uftrace: upgrade 0.16 -> 0.17
Date: Tue, 24 Dec 2024 17:27:01 +0800
Message-Id: <1735032421-13513-67-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--4.800200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrRealVAhocE+KS8s/FMqmOCu5
	iQ9EM64EaChPmcTuJJdCHS2+rsdYypV5QOheuUnNgvmNrsT46HK+qdcicyOescDQ1JFg0kXmxl1
	U2hwetI8+LcAaEgDgTktOa+Yevc9i7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5APn4
	RjXbQDetAYmKqwwYweOIzB8VNpCtCXBXaJoB9JZxRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07foJl
	cuVXWZJtn0T0TxOAWBH+oAgbN63Mzapp3BPc86nBxNGlusJAQSBpNEqUuVTPBtIeGeXxIEqaL5j
	GFMEJe2V9GGzTjDtMglkVV1vPFRQ8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114537

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* New features
  Support watchpoint for global variables
  Show man pages for the given command
  Add utc_offset in the header info

* Bug fixes
  Show arguments in libraries from dlopen
  Save debug info for libraries from dlopen
  Protect FD of communication channel from being closed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.16.bb => uftrace_0.17.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.16.bb => uftrace_0.17.bb} (95%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.16.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
similarity index 95%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.16.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
index 320b5a88a6..8fecadb22f 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.16.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
@@ -10,7 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "68aed9b0a20d3d1b5e1dc15e0f8aabba7e34735b"
+SRCREV = "b0d936107edcefb519abbc9c363ca40daaac23b3"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
            file://0001-include-libgen.h-for-basename.patch"
 S = "${WORKDIR}/git"
-- 
2.43.0


