Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE91C3DA40
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167227.1719305832472912177
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f/8+fjOQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305835; x=1750841835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tuLy53UIeWw1S7KGXRgbqemHoDE0CoI4LVpUfE9Vqcw=;
  b=f/8+fjOQUxPVnSJO8Kda11CEwJsqQPVfQXDigCaeAnQ6deQa1v1PUY//
   iKkUx+HF+P+kx/Dlq/k6zrZbSFkvIwolLLCoYRHPX6xmYSbuFPWWtiBBR
   5MctOuecjwVoPM2stJYdFH1brcducKTnfqSnsFiLnbV/t1CdL+Va7R/f4
   WESCaevWKVjb8pyKmHrBcjGyj8Wm76YLd/RjW3iauCNpePCh0zzfF5H+v
   yr8EQU4EO/r513V8cvY5NXhS8rqtzHiE/SajAPUBvQywn+/j2nQYalbZi
   4tuh28G1ZMDIrWxVuI2jpLL0Zj3KbHZLJgPYQA6aHqzS36AHd6J8kcWW0
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254703"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254703"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E2E2FC68E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 351CECFAB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6897E2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 64C491A0002;
	Tue, 25 Jun 2024 16:57:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/57] python3-djangorestframework: upgrade 3.15.1 -> 3.15.2
Date: Tue, 25 Jun 2024 16:55:59 +0800
Message-Id: <1719305790-11484-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-2.390600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysXjbCEtErbdCqh
	atYZ9xG9Mdp+X+yd+WlICsMQxCDS2LBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVTJa4OpEPE5jMQ5+LpLvN6bSHyFhj/R++jXxkwQNBdWwyMG0Hi4f8RsNuhl3qD5Drlhl
	te/QTJswnTEdc8YeXewbEbLGOmwQGOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix potential XSS vulnerability in browsable API.
- Revert "Ensure CursorPagination respects nulls in the ordering field".
- Use warnings rather than logging a warning for DecimalField.
- Remove unused code.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.15.1.bb => python3-djangorestframework_3.15.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.15.1.bb => python3-djangorestframework_3.15.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.15.2.bb
index 9515aa229..047aba137 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "f88fad74183dfc7144b2756d0d2ac716ea5b4c7c9840995ac3bfd8ec034333c1"
+SRC_URI[sha256sum] = "36fe88cd2d6c6bec23dca9804bab2ba5517a8bb9d8f47ebc68981b56840107ad"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.34.1


