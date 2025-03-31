Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43992C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.47547.1743412325210251063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ckub7Say;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412326; x=1774948326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ixcHD2V11TIZx+vTlNZf3iHKeNQ77sE4RFso9jlMBrE=;
  b=ckub7SaygJgzLF8INh0H/QEQz6jZpMKy0wJxGvzPxryZpnQn0UVOXGvV
   cCHcYCe9GhrMrE05tcPOBx8+zRhiY34djq7jCBE9MJ5Hjdk1uxgs07d1u
   GWCH90DMa8Huyi02bJT8G9xgU3x6X2pAlDHdy6gdt37o4lbB951AJ4EXR
   /ouk9z90BTkYTGch1A8oIWMmGlD1YptsePXOUkEHxs+cfG6QqJUst22wF
   EBMEuBIbnVec/ZmERf/if3uI6If0BMg4DIdwVeDg8KBPS4j2I4w2FxUVV
   KHpayMMyEQuDvfYS+rZjVx+CWHxsy4LOeIwrSYYntzhNEX9BGxq+RJFhn
   A==;
X-CSE-ConnectionGUID: lT8L605+QFOp3NlGm/BJnQ==
X-CSE-MsgGUID: T0TsrXO4R6GI98XE/afzPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950092"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950092"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:04 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 453C2D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A0D313EF2
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE2A61A0078;
	Mon, 31 Mar 2025 17:11:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/26] python3-pyflakes: upgrade 3.2.0 -> 3.3.1
Date: Mon, 31 Mar 2025 17:11:43 +0800
Message-Id: <1743412308-21887-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116420

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyflakes_3.2.0.bb => python3-pyflakes_3.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.2.0.bb => python3-pyflakes_3.3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.3.1.bb
index b7ee20ebe4..4051ec6802 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "1c61603ff154621fb2a9172037d84dca3500def8c8b630657d1701f026f8af3f"
+SRC_URI[sha256sum] = "8752eee11d4ef3a4be642d774863047864b47406cba906fabf8dd892cf98d5b3"
 
 inherit pypi setuptools3
 
-- 
2.43.0


