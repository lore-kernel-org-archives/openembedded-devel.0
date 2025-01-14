Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6514BC0218F
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.40070.1736843357194436570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ARH10hrN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843357; x=1768379357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5/M6TxRb6inLHrFY2rshloCv3ZIHwd1xjM9aXPPbllc=;
  b=ARH10hrNsTBXnSUbSwg2xVTrC6036qelDOYNYSX+8z5aWsHQ3BUIj2PC
   c4x5Pe5krKVwC1spS4Mk9WzcZrvHO1UP1XsiKKnIG4zKYCv4E/j7VB0c0
   GlPl7FffbHWr803xetNVDt0J3nbHmnkOP/z3/w031MUzglE9gQGLHABlH
   KEEfxJzxY7uFVdFOGyoT8xZIzqv6f4i8pXNU16DxP6EZt3x95wjBZetvp
   ShbuKIrFCwOiSdUZCYGybi1K/8s65XkmDhCOhOA2uyOm9sstSWDCWbut3
   3vMhVUAduV9rCrBFK6QQhSPle36TxSXR4ZKwL3PB0Qw7mg5C2FQTo8Hxy
   w==;
X-CSE-ConnectionGUID: D9R5XKUrT4KkEAA5aYV9UQ==
X-CSE-MsgGUID: L1AVj3SHQR6CNM3/NT0XbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="185663978"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="185663978"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74BE9E6148
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E2CEBF4BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E42466B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 923321A000B;
	Tue, 14 Jan 2025 16:29:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/30] python3-sh: upgrade 2.1.0 -> 2.2.1
Date: Tue, 14 Jan 2025 16:28:42 +0800
Message-Id: <1736843329-4131-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62Smqysv4Ls63GaKCSbFkHf+J4VjcTzNZb6bScm0gmwQmYtKO
	lCp71wYAC2iPz4zeHJvu5fRaC3Vw5nsiJsfDeLueGeqrhVXqIhS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114869

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Bugfix where async and return_cmd does not raise exceptions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sh_2.1.0.bb => python3-sh_2.2.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.1.0.bb => python3-sh_2.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.1.0.bb b/meta-python/recipes-devtools/python/python3-sh_2.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sh_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.2.1.bb
index 948235fd78..f75932fd72 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "7e27301c574bec8ca5bf6f211851357526455ee97cd27a7c4c6cc5e2375399cb"
+SRC_URI[sha256sum] = "287021ae84183dea49787985e33797dda7fe769e4f95f2c94dff8e245ab4cb00"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.43.0


