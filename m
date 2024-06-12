Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F1FC2BA18
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2490.1718161123300457061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qo91XlOw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161133; x=1749697133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OruzIH6CYJAFUdAJk5PWM6irH3lDo1ebjz39x2DvsuU=;
  b=Qo91XlOwe7ATGDdj4jfwR+7bZ1Q48j2Axz9fpQXgBIZUuR/XuqWA8IuI
   5jav1oQgw1NOjKTTwxlWl+EKCFn2IZJVR++ZGirE6QKuDU1E2BHzZg9q8
   41FpMEOrYgCDFRhsI+RqOCMN/T/m+n7e7aXQu8ZYLPBX0pFFoFrHyCsqK
   /GKav0H6pSr0ACZINltWAlpIzSJKuROh2106FpuznqPaJkOGrzEMGAp2O
   tint7B28qRGV4AI+gmqTz+wQ8Y9qDqE2PmKuNyKuOQTVjG3vT8CPPrKo+
   AgQhOdy3k/dS3v2TJ6FEoK4LflnzdR9I4IPw3eodBATQNCmO87vEUnwk/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162860655"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162860655"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7857D801D
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 37BC0D8B01
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6CDFE290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 205331A000D;
	Wed, 12 Jun 2024 10:58:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/43] python3-tomlkit: upgrade 0.12.3 -> 0.12.5
Date: Wed, 12 Jun 2024 10:58:07 +0800
Message-Id: <1718161096-29710-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-5.132200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/imKcLRvsB1ZZh
	jmb07zEX+XUoQHdzSE31HmCA5r+5uw3mZXbns8PVA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwR2fm+pO72Usu8j2/Qpcz48RY1tl9vG/AY7Cl8sx4HBG011pGlZnMxFmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibec3QM3secWbIjIcFZM90mZSRE4a74hsy72X4nbB//kAYCVuLs+AAL5npE
	WMzuh5OgvW+CPz6F3abD+UjLBY1oimGy+tJnj+W3JiI6F6TE/I=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110871

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Remove the extra minus sign added to the float value after calculation.
- Fix unexpected newline added after accessing the out-of-order table.
- Support | and |= operator for tables, and support + and += operator for arrays.
- Fix an index error when setting dotted keys in a table.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.12.3.bb => python3-tomlkit_0.12.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.12.3.bb => python3-tomlkit_0.12.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.12.5.bb
index d4162a110..f5612a18d 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "75baf5012d06501f07bee5bf8e801b9f343e7aac5a92581f20f80ce632e6b5a4"
+SRC_URI[sha256sum] = "eef34fba39834d4d6b73c9ba7f3e4d1c417a4e56f89a7e96e090dd0d24b8fb3c"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


