Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B34C25B78
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6682.1714628967326746876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qW3ky1Z6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628972; x=1746164972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZYf/IDBgirXPBaUF4g9mnncFXnF2krfuV+3IVvlgMzY=;
  b=qW3ky1Z6k+8G17OrZzaHMTvh/Z09K2BGykJbD+rj3TZmWw4Bbvo2KOnv
   Jq7kGmRg8uJdRAS+CePfNsX8SGbhGPhNNMqWs9Crgn90Lgk36y1YZbZH1
   r1PFHH0Npk3Y3l/YZNkqellY41OCiuZdqPqgMpOYrvgQAMW+PAU0hFFom
   LsPQjuv9og5/JFORbRCEkpux7vsgF5EfZeeKwXWYuVVPNDvoloWrdXaQQ
   +Em0zAOHaUXip+o091VtFMy4cS+ZTSotxKCZdhQow6GD4kCcxkljoOHWK
   ONXkVxFegCAm+5r8NdoQnkz0kc6O1Ag05OfwBJ54CuwrX59d1Kg6rDu20
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157281963"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157281963"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B590D6F00
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D65D31DFC1
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65E2B217354
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:27 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A72A1A000C;
	Thu,  2 May 2024 13:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-pymodbus: upgrade 3.6.7 -> 3.6.8
Date: Thu,  2 May 2024 10:48:15 -0400
Message-Id: <20240502144829.241208-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-0.512400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrXs5nqGvDCfM2JxgqT664EptM
	ZHvoSnLI4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5tun
	BoWdY6y73LUUP67BGAtn23J+BpfGS90hscv2G4yfaVnlHAYu5xQUdeQcXeyzMno3GueyGR+Pk/L
	6Jq122Vmtx/vzFzJ6lbjBuldNvkMkoq97WSHdFjfupJaud1uZCfRs6uIbkFVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110220

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Allow socket exception response with wrong length

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.6.7.bb => python3-pymodbus_3.6.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.6.7.bb => python3-pymodbus_3.6.8.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.7.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.8.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.6.7.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.8.bb
index 323377253..b94504f14 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "e6cefac57f8d0e887ef49a705743787d8f1f005df94bd148e3da43c2599c77f3"
+SRC_URI[sha256sum] = "abb214716b56fc62bc0d5d9d964e2249439341746287e918d175f0e3ee241407"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


