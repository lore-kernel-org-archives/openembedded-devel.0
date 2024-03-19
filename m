Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB421C54E79
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8226.1710827208223500752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DywSpP6X;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827213; x=1742363213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gvUj8PEliywk+5NhQ0FqpP+wu7DTP3B0UXJMpFAyL0E=;
  b=DywSpP6X5MaDN1aBjnxLUXnNQ24zVYp8mB+QaRFrtu6zLVcKAzI1fCcZ
   OjCEjsOGGZ9oN2F1LtYlxG5XfHtXfkTMdAtqhg9DPlM5dF4L+M9C2rw/U
   te2DojmVgPN7FnIvEh0AbrJhLcZpVdv/mJ5JAGtNJBuYdFzrkGu3pB8J5
   cnCHxffPNzIPzNNLwBfewzWLlnAMatWwsS3ZBxqx7RzXmnAXxmVDbwScI
   HaNevsKlsf7JqMfHvC/tJQ/fcT/pI1XUl/TRqxY4w2rWhJjAxOp2h9+g1
   3U1pDwMBMb3Ef98CJVWaIoC3dT41xXNsGvpUczdGdt0DIFMwe5xlx/s/w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562836"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562836"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 348FCF264A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FF3E30D9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1EB52009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9794A1A006B;
	Tue, 19 Mar 2024 13:46:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/50] python3-pytest-timeout: upgrade 2.2.0 -> 2.3.1
Date: Tue, 19 Mar 2024 13:45:29 +0800
Message-Id: <1710827139-30056-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.806800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4BI64EUz6lBagH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62Sa5N7Y63keXDRU1AD+x0L95wgwSsXhfxcCVp+nmv0VLZ2PL
	gN5bVFO77Zt35EPly78p48Fd3JN78OVxakuhJ/hHJn/+QHdbefS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109457

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-timeout_2.2.0.bb => python3-pytest-timeout_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_2.2.0.bb => python3-pytest-timeout_2.3.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
index a7daa05e6..b56c26aad 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 PYPI_PACKAGE = "pytest-timeout"
 
-SRC_URI[sha256sum] = "3b0b95dabf3cb50bac9ef5ca912fa0cfc286526af17afc806824df20c2f72c90"
+SRC_URI[sha256sum] = "12397729125c6ecbdaca01035b9e5239d4db97352320af155b3f5de1ba5165d9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


