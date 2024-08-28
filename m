Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A582C54755
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8726.1724833556868318284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qEWnV4FW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833558; x=1756369558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HXQj7nxTia5HBxIuE6J5vGvEDrXwcEY6B+nZtLxZt+0=;
  b=qEWnV4FWU+tYy8+XLEyifPp5KuW6FE5kDxU5HM6d+brgQW/GPm99JHnk
   CASWS/0rhL2RK1LzTgZtGAS3+oyc0jp/CK7YKIdgAGURK2wEMQQBNaZg+
   tr/2uJB6YCCciMxubbzq+Z1IRnaAhEmlVVQaM2rL4rNMhVEtHx/eOPClv
   Dz1ms+1bL7dQZXlH3QdzzeGSTVxSluBtusAtysfUbG9wfkriSVPBieX3W
   JspqGFtsVNsCOVMoQYB0xhPB04RJzrwRNdgzJKwRjr/rnPzj1H5Xxp1p8
   +P4pZqRgagodgAi2aQMnpnGdMdbvmYNoPkH3+dVNL4eHIDULxXdlCA3mK
   Q==;
X-CSE-ConnectionGUID: xiJB3Q+4Sd+lZbU9B0r5fw==
X-CSE-MsgGUID: JMG29DqPRimtmPpUes+ezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="173926810"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="173926810"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B7F8BD500B
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15567CF7C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9126C20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D6451A000C;
	Wed, 28 Aug 2024 16:25:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/46] python3-simplejson: upgrade 3.19.2 -> 3.19.3
Date: Wed, 28 Aug 2024 16:25:13 +0800
Message-Id: <1724833525-2162-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--0.697100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkC10TsipyQq76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOqkaMNtianZ2DAp
	NjKG1Jmki7G/YTn101qmTB7bG0U8YwHymmXkwrHg1Usuk8G4lrrPhBvsdQRPQlWK7dsOM+QxYaM
	pFvOKalgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Updated test & build matrix to include Python 3.13.
- Dropped wheel support for Python 2.7 on macOS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simplejson_3.19.2.bb => python3-simplejson_3.19.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.19.2.bb => python3-simplejson_3.19.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.19.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.19.3.bb
index cc5b1bc90..094efcd8a 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.19.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c"
+SRC_URI[sha256sum] = "8e086896c36210ab6050f2f9f095a5f1e03c83fa0e7f296d6cba425411364680"
 
 inherit pypi setuptools3
 
-- 
2.34.1


