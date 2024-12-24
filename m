Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE8AE77193
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30362.1735032443247103847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mkMarGaB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032448; x=1766568448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C7zkrWbsBOYFdLttIUq6yrQeJONjffOn9jq8vcAPWNo=;
  b=mkMarGaBO79DBU/m+uF9i+3h0WOr3oBo2T3FihUqU4/ugXJmcnhzX1hG
   N3XUOkm+PCKJJVAKiTONxDcmtTk6Fh5wLtr66M4as0CVv73uyyodVSlDp
   7Qm509p1ymJNHM2o4VxAwxdyXzRPCjYDxOYBIjPg6MVwvs23mL1T6bAnx
   /zkzinuNoAI/NoKO1o1Ij7g+VAL6/4D6iMV2iBkO5ZqG8VIW3Mar+xJLq
   XBsiipr094wwgshXafPl0CGFR8pV58Wk/jYDlWyAkcOnDf3ovua1vvIEK
   pJMg2lGYja7Wq5ctDTaZ3kLtYyPFvk8F4iKnVHz3qxzZf1yib7AiX1wn7
   A==;
X-CSE-ConnectionGUID: JrvPzWjvSvG09CRlC/0/mg==
X-CSE-MsgGUID: UkFLgeq1TuWuxPLaHvlPAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212824"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212824"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E1433D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B62CFD5B40
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C17620071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E89431A006C;
	Tue, 24 Dec 2024 17:27:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/67] python3-pydantic-core: upgrade 2.27.1 -> 2.27.2
Date: Tue, 24 Dec 2024 17:26:39 +0800
Message-Id: <1735032421-13513-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.776800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysOabErRKSRvTsX
	0C3LJPaoWZNNSd3OzwE++SDs+91Uhx2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW74Xkcr5uQiOxAISLmT6dDEHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4b+i
	XMi+E1Qh/n85Pmfbc2TZXJFe6Tj4pcoqZCyctxQ6miw2O949bTgyyUYuZSfwhlrc0gZIvEq6pgj
	oAgSAkPw64ywMVM+5iCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114517

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix linux PGO wheel build
- Forward default_value calls to the underlying schema for DefinitionRefValidator
- Include JSON Schema input core schema in function schemas
- fix ValueError on year zero

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pydantic-core_2.27.1.bb => python3-pydantic-core_2.27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.27.1.bb => python3-pydantic-core_2.27.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
index 75c6b46e48..52571ff2cb 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
@@ -12,7 +12,7 @@ require ${BPN}-crates.inc
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "62a763352879b84aa31058fc931884055fd75089cccbd9d58bb6afd01141b235"
+SRC_URI[sha256sum] = "eb026e5a4c1fee05726072337ff51d1efb6f59090b7da90d30ea58625b1ffb39"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.43.0


