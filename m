Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19369E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.16534.1736240520906447651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=evwhVaaw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240521; x=1767776521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KIMJd0adsTjGd3uENMh+6x7e8G7WIgu2XLnGgH26EE8=;
  b=evwhVaaw/lsMHI+yplfts3l3AS5zlk39psLsHEaXCOs05ptGF1FkuJbB
   re9qe3Zoat2mCdZw0uTmEUpzLmbdKTpGiK2GLnZBYUjoMZipg1qfZ6ANN
   TZEvROPGbJUaciEbczCGOAC2/GzCSGTKzeqUQ8o51sXL9l1xuApIn14Tg
   CUc5eO+g1HJeoOjvT/wK30QAoPMDAAGO1iMBxUi6U9Dl+jjjJZOrCrqm5
   2PtWTl0AiTOIuA2TDji9WUtSTwZ0iu2V3rWVVH5WSP+L9kKDUxAI3gI3U
   ffs9l87svs49OEN5LCeEVFT4Ddr9XKFpVRcBaQVQ7gtqzxzfFzhHt4MYf
   g==;
X-CSE-ConnectionGUID: FyXY0/k1RaCWZSNe35ACKg==
X-CSE-MsgGUID: JyAgWxGaSFSk3EDe7hRh1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="165274060"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="165274060"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E307D6AC1
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FF97D5052
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 013E841185
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CC4C21A0071;
	Tue,  7 Jan 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/18] python3-trustme: upgrade 1.2.0 -> 1.2.1
Date: Tue,  7 Jan 2025 17:01:43 +0800
Message-Id: <1736240504-5315-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--4.961300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrzoS4pqkGrkOBAXl9LkPp6Ql+
	HyAcPie7Cs57sNpjyhgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iqbs
	+nJ/tFJFCEZY1TJxup+8j2/Qpcz485gZGm/RVVHG5x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJQ0vCghJO2X45d5PwoODCcEuDA+CqFAHMyxIznrhqpYyBD7
	dVOyjiATRcPao0cYWVegwDCZfAHMH7vUMi7BHX50J9ciZanC8pLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114692

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update from deprecated pyOpenSSL APIs to non-deprecated cryptography APIs.

License-Update:
 format of LICENSE changed from "ASCII text" to "ASCII text, with CRLF line terminators"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-trustme_1.2.0.bb => python3-trustme_1.2.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trustme_1.2.0.bb => python3-trustme_1.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb
index 69db7e6189..519c6b8922 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "A utility provides a fake certificate authority (CA)"
 HOMEPAGE = "https://pypi.org/project/trustme"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb59582a4d7ecbb79dfeefa0f69932e1"
 
-SRC_URI[sha256sum] = "ed2264fb46c35459e6de9e454ed4bab73be44b6a2a26ad417f9b6854aebb644a"
+SRC_URI[sha256sum] = "6528ba2bbc7f2db41f33825c8dd13e3e3eb9d334ba0f909713c8c3139f4ae47f"
 
 inherit pypi python_hatchling python_setuptools_build_meta ptest
 
-- 
2.43.0


