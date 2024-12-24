Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E795C0218C
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.30502.1735032438455142389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kCJS3aZz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RQxiweXnwdpUo2v5za8GiR9QEJMQiFG8Lpf70v8EM8s=;
  b=kCJS3aZzEzgxesQSBwNkWTAPFAf7sIOXTTQtKcUkeNZLXe8kHz42xpxC
   3lXmBhX74v7xjU3RIzelyyeJ1OnNF8lTl0WfZPYOnc+ZfiL1/z5kwR7rA
   gQENn/qab2joEwEl33Xs7XM3/PTbHR5bIYaq05Q1cCsnG6hFI7B/Lhg9k
   NQzEe8kVhWa1UCJ+nd7EuDfBdPDpbMgmHpG7YV5eFrK15x9L5DEodb/tT
   2D4nFAzOaUBtdZjIDjx4nppmaUY9ntbXAwGH5/2MreaqH3t2F3nVmRh0t
   xjKZvj9X74iptagt4MAQVVuP/InZs4AcKAD4PrYGZCquM4wBOHTD08WOn
   w==;
X-CSE-ConnectionGUID: ha5imzlAQDq+7rN3vywnVg==
X-CSE-MsgGUID: zFd2rCBoQAiMdDYNDzNY/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248057"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248057"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4567C2266
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ACC0AD8B3C
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F6AD6B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9CF101A006C;
	Tue, 24 Dec 2024 17:27:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/67] python3-fastjsonschema: upgrade 2.21.0 -> 2.21.1
Date: Tue, 24 Dec 2024 17:26:17 +0800
Message-Id: <1735032421-13513-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--1.757300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwic73tFQS6kFJhD
	mI9zl/n34CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDKIp/k2x3jvkRAISLmT6dDEHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w58Ux
	/TCYvb7dt7CeKBRFxD80tR/o0qBiXa+O6IRkzeJMBa/jVsWmMa8ZHIqlqefQ5FojukS7YyRoM9u
	QcXaS1RG1TB5hmlUEKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114493

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixed ResourceWarning where file was not properly closed
* Fixed regexp for date format

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...astjsonschema_2.21.0.bb => python3-fastjsonschema_2.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.21.0.bb => python3-fastjsonschema_2.21.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.0.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
index c763a09048..ecd92d5a74 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRC_URI[sha256sum] = "a02026bbbedc83729da3bfff215564b71902757f33f60089f1abae193daa4771"
+SRC_URI[sha256sum] = "794d4f0a58f848961ba16af7b9c85a3e88cd360df008c59aac6fc5ae9323b5d4"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


