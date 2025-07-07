Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17DBC83F16
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.55569.1751879234060672811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nopt32BU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879240; x=1783415240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qq7cQ14gH8W134vGsnqoFXhQty2amTmVpKWsSK1WYSI=;
  b=Nopt32BUP2CR76yLQ9K8hQhusDEAhmMzLlyk5xb9j4TETgp9J8DZyyCa
   3LAcrVqigcObuNoEAiS4QV2NTjUcWyqNsoq05DskAGzEn5ji/LCUuxC6w
   d3lsSJ4PeSwUuzphH6SP2tkXZFjN8uAFbvnLDqB2OKV1C160LagiZe7vW
   x3istNnn/Kzh1qRIWqQEA1XVbZEI3jI2UWpc7bVtVQu3Lc8o6JYBlweaY
   QiTsE5AU7DBpTRXPFE80yFAV1o9xlvbT2po18xcWcWFX9+gx3VzZqnnIb
   2gU7buJBtsiOhaf7qBmkN5lTZZhei8EIyc7eoOWIvFXfv+FiJyYtTH2Pa
   A==;
X-CSE-ConnectionGUID: PHXkE6woT5O5x4gtJTqoGQ==
X-CSE-MsgGUID: ZREk1qMASO6m95eVCKq6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="192895264"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="192895264"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D0C321000366
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 54A4010000FA
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C7B4BF3C5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:18 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 337561A0071;
	Mon,  7 Jul 2025 17:07:18 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/35] python3-robotframework: upgrade 7.3.1 -> 7.3.2
Date: Mon,  7 Jul 2025 17:06:50 +0800
Message-ID: <20250707090656.1216-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118275

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-robotframework_7.3.1.bb => python3-robotframework_7.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.3.1.bb => python3-robotframework_7.3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.3.2.bb
index 0f205b9274..df4b31312e 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.3.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "10be47f826a5ecff09d08e57bf17fce124d38b6e022b380ce67c526ef747194f"
+SRC_URI[sha256sum] = "3bb3e299831ecb1664f3d5082f6ff9f08ba82d61a745bef2227328ef3049e93a"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


