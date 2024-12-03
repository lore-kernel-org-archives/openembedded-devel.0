Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C958E69EB3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8205.1733185017914802578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pp2oyy8i;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185026; x=1764721026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=N7gNgN8p8KSiCv/E7dSbStWve9sHrfJQxBAA2ukCKec=;
  b=pp2oyy8iCv6AL+3ABmhRacoljcbRYsG47ITk1Ffe9imxCz3zgjH5p7gA
   lGlf9lF0lxbfOho/Nl+Hokd7eQnWyZqLGWBbUbUzNlsxRc/L9mlcRoCY0
   wUZsI/+3yzMJtd0pMUOz/RM0F2TlkS1l5x3mjP/KpoztDOZ/KtTMXEYUX
   8NOCfGloFl+SGlv5k1lBquPyZjwJeS6DtqGhnUnzX3Rkg3lwGIWnarDLb
   Ooq6b3rDfnvbjUDWL11+Uoaa7yVDj5TdHFIZBJjFGs3SwSLuxUGVcI+kA
   T/k0wC5Bz2Hk5cHg2yT2L+XCbDztW9bODVjUns1AYoAAYtl7RUZYyvKsS
   g==;
X-CSE-ConnectionGUID: if59wiTcQ4qJ/k22bH8Fkg==
X-CSE-MsgGUID: sbm5Ca2kTLS6bNEXHBf9XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170725153"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170725153"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:05 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7148BE60A4
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 49DA7D8B71
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DECC820071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 801ED1A0003;
	Tue,  3 Dec 2024 08:17:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/34] python3-tqdm: upgrade 4.66.6 -> 4.67.1
Date: Tue,  3 Dec 2024 08:16:34 +0800
Message-Id: <1733184999-27041-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--6.188300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytM+b8yxBqvA0AY
	aoy7BtBrvQrSeugjqi5+8BOKv4EeDEqHC0EDIdtYA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf3PhwfmFb3pg7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtJpIECrjTTK42W7yyXjYzSCMDq17fVKAwas5kvt+KEjIhiyWwobC5SQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114171

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix gui (matplotlib syntax) (#1629)
- misc test & framework updates:
  bump pytest-asyncio (#1630)
  fix codecov rate limit
  fix pybuild
  sync dependencies
- contrib.discord: replace disco-py with requests

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-tqdm_4.66.6.bb => python3-tqdm_4.67.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.6.bb => python3-tqdm_4.67.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.6.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.66.6.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
index 3e91a63b24..24618e0b3f 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.6.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
-SRC_URI[sha256sum] = "4bdd694238bef1485ce839d67967ab50af8f9272aab687c0d7702a01da0be090"
+SRC_URI[sha256sum] = "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


