Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D276E6C5EA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8207.1733185020432032227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IGg2/mLX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185020; x=1764721020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KSsoKK7fYKGHohzSIZ58nPvxHlsGhtr0GxsiO+o8zuk=;
  b=IGg2/mLXGMdiLz5qREryHINiP6HSEjWMRglmD8C94XGk8CCd19aOZalI
   r88TdmtpCOT96SIuA05xvPxB5oQ330Kr7NEk32ImUp3q+5qgarmyzxSLh
   mRlvse1vQsmjqqrLVvFiccB6bmCDoD5U5qkJgQZ74x/P+ze9yDqaXKP9R
   QcUtYcBbqVcEsNS/zDAErJIVQjj03rnGD4VuYjKpCvoG1g2KCFq5gOG1f
   gdn3dLYmFOlOP/y0CEpr/5+2WvMfpdoMDH11/BAYNZsyFvu3fTNBnJ0cb
   uEj1ReQmy9wWYipG2aW2T3OYNMwmBjUBprBa4ZXSXeOH4J07/BZWmDVXL
   g==;
X-CSE-ConnectionGUID: HNu4DLasSlKMEUj4YoYifQ==
X-CSE-MsgGUID: 9l8l192gQ0i7ELeQ6dLw+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406413"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406413"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C6C3D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13482D3F1D
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2F866CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42FD71A0003;
	Tue,  3 Dec 2024 08:16:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/34] python3-cantools: upgrade 39.4.11 -> 39.4.13
Date: Tue,  3 Dec 2024 08:16:21 +0800
Message-Id: <1733184999-27041-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--3.293300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mra9qiaDSLgo14YeSlHZYForWQ
	yyh6qcDkAwr1d1MD+niLnMEhPnjoxxLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRjzriyVB0jfRn7vGqDWco6ECzvDFWnVvUY3PRtJFF3aXrp/lcehTU8s4YUHcxEPtJ4q7
	hp074mBeGcyi1hLnV9Qrc6S24J5BjIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114160

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Use tox and CMake to test generated C code on Windows
- fix floating-point precision issue in arxml 'parse_number_string'
- Encode the given NamedSignalValue 'value' when explicitly given

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{python3-cantools_39.4.11.bb => python3-cantools_39.4.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.11.bb => python3-cantools_39.4.13.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.11.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.13.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.11.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.13.bb
index 08047e4d54..fa9447b918 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.11.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "0b7bd88a236bb2ddfd7da5dd713058e97b749185e9d1257413b27bd4cfe7d82a"
+SRC_URI[sha256sum] = "ad84fb561f5ab20ccd2a45b7fcb29093008f6c8981c9f636f2d94613ed37c3d1"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


