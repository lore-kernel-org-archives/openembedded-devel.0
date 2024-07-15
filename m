Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F1DC3DA6C
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.33831.1721034181417654502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UoAibJEq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3pp5o2DF5iIUFqs2lTrQiAFTSTZggqrfW0/tR0FcFqQ=;
  b=UoAibJEqMrOPqvZ+Wy5Fmr5P8VuwK7LKFNV7Wbxt5wYAFH/rJIY+YMVV
   G8L3plrTErxTYTE/EVW3rnJSD3DV4h8JJwD4qpwT0JbXdVVIBrm6qNq42
   n4048wdz4OvYMjVtAclJevbX3GaCq0vnEYklEUk7zaiws/vIz34ggtnGZ
   hGMzKcKLyeR/H0isloEJCjH6eK1H3zN2PnKi6pj78ta9xT/WVOa6ArdTa
   7Ia+Qb2N9raF5wEENLwd5irhWOIKq07bnSKitbo2SdAQrZAVIdngyIXtM
   psCs9QtlCycMZzpZneaYhUZb9UvFGM7490zkhE2JBy6agPAmiXfAXkf+2
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166909669"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166909669"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CB5DD800D
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 690EBBF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0048720071A3C
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A38941A000A;
	Mon, 15 Jul 2024 17:02:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/38] python3-humanize: upgrade 4.9.0 -> 4.10.0
Date: Mon, 15 Jul 2024 17:02:12 +0800
Message-Id: <1721034151-540-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--0.594400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMVx/3ZYby79s1Ir4NZzFmriR
	FJnWDxklb7GCZiffUGjKGdtWbNuOjfWZtOj0tJYAA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf3PhwfmFb3pg7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtcIrHNn3GQrp1xSFYOrVq/N7mC71mRIrSFNsyLTlad/7F34XBb0BbvTCJo
	fZliQlyXz74YbvzacfbE04wBR/UTY/mTTOy4rDxHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111343

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Remove shebang from filesize.py
- Fix test failures on systems with 32-bit time_t
- Fix handling of negative time deltas
- Fix naturaldelta sub second precision
- Reword the French translation of very small amount of time
- Fix Arabic localization
- metric: Fix precision format

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.9.0.bb => python3-humanize_4.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.9.0.bb => python3-humanize_4.10.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.10.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.10.0.bb
index da1eea4cf..a8668e148 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.10.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "582a265c931c683a7e9b8ed9559089dea7edcf6cc95be39a3cbc2c5d5ac2bcfa"
+SRC_URI[sha256sum] = "06b6eb0293e4b85e8d385397c5868926820db32b9b654b932f57fa41c23c9978"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


