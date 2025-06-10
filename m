Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC7BC71143
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.78441.1749526436040581345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kSJHtusf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526437; x=1781062437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C7evsKAoRGBlOn2bSPNbR5jjAMn4mhS+KRlIKL2n+n8=;
  b=kSJHtusfGXAvOp81uDUXDE6YaSEAFiqSgdANm0yIj4FlyrsjSzFkhdpG
   abcUbPFG5wlNsE0L8Fo8LsVUYxXlJYh609ig5IP19MF0Mi1Lnvq+a+vtx
   MFAgMT+UCIJ88POnakDLjJgZY0A5FM1pb90RiVS0kzu7K/BTEXzmf3Fjw
   OvTsVI3c3huIhIPX8O2xadp/g9b8lQmHU5LMcIzz7KAp7gn/uaGbvGaKb
   G3oBLRrQjbVKExEgFb6a71dSi87MJQIZ3KfmPeMQJUCvO6SO7t2x6u7uA
   8O7yZUXEqot4psN3A0WFUto5ODSrKVKt3aFREHTtiDOExqOGByvICUwEO
   w==;
X-CSE-ConnectionGUID: itj7lB5mT3atvxMQ7IPijg==
X-CSE-MsgGUID: 96qGXIDsTI2QTU66Eq5rRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202261515"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202261515"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FC79D8033
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 361B2BF3C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BC9131A009A;
	Tue, 10 Jun 2025 11:33:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/64] python3-pytest-lazy-fixtures: upgrade 1.1.2 -> 1.1.4
Date: Tue, 10 Jun 2025 11:33:15 +0800
Message-ID: <20250610033330.924-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117842

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix non-deterministic test function names due to usage of sets
- Fix duplicate parametrization error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-fixtures_1.1.2.bb => python3-pytest-lazy-fixtures_1.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-lazy-fixtures_1.1.2.bb => python3-pytest-lazy-fixtures_1.1.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.4.bb
index 711f2ed0a5..83b8321df2 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.4.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
 
-SRC_URI[sha256sum] = "14ba4154dab52066c1c4d6547cc40bbf60726445cb16f1d2dcc9485cdf38964d"
+SRC_URI[sha256sum] = "c494b52d798890033d64b28687a4d52807c8b0f606d56316e139df0cbe116c57"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


