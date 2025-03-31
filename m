Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91723C369A0
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.47543.1743412320538902754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XtwN71f+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412321; x=1774948321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=N7Jz2TvkwWSwMTgDV17e50LYreM+0/sfvH0jXoVA/CM=;
  b=XtwN71f+KFo5/4vPjuQjfIQFO72PwF/hkafigSx9jq1GuzzPvUBog4nW
   FFrQCSl1CXU+nsSTMTJtrZhekyCPsWZ36Alkb/KGuS8QqkzxLP+IXTQh2
   3OkNV75TWJKFQlC1PHwwCX0eIKhJznRR9pmRlSYq52Y8XyYu8OCfWpCfY
   nGp/b9CII98SN8bcKpR2KVDll1Ab0spFN0sbMS7WdCEWnG2GY69Wnp/11
   qmqJgGmSaC6g2Yhssb8EVG0dMu005b7eOcLjSUduwvPZA4XCrtRK1XubQ
   +TmcHmPvjMNJ97mTjrWhe/Qf3sHKm9mB9YTnVP8ywmIFvU7hXwVTLXD0j
   w==;
X-CSE-ConnectionGUID: FpiLQi/CRmC+c2DvyrsCxg==
X-CSE-MsgGUID: 5Z8rnziVTXqtXnlO+4wzbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="183356917"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="183356917"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DF741A80F4
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A27DDF310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5E1961A00A1;
	Mon, 31 Mar 2025 17:11:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/26] python3-apiflask: upgrade 2.3.2 -> 2.4.0
Date: Mon, 31 Mar 2025 17:11:27 +0800
Message-Id: <1743412308-21887-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116402

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apiflask_2.3.2.bb => python3-apiflask_2.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.3.2.bb => python3-apiflask_2.4.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.3.2.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.4.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_2.4.0.bb
index 489d6be69a..96eb1f2f9d 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4b18ccdcc335a9ae8cd85701662d92c879339bf439b45fa7c85fca76c9588619"
+SRC_URI[sha256sum] = "b7894741cdea90013276873cdf635d5150e1deb3fe20d02d429866af960f275f"
 
 RDEPENDS:${PN} += "\
     python3-apispec \
-- 
2.43.0


