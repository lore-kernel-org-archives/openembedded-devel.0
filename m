Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0053DC3271E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13623.1719816261747094529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z3cADAd0;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816261; x=1751352261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uuSv3G8CSDn7JkTGI+Gv0xgzYxHpnfpOJXm/Bejhkpw=;
  b=Z3cADAd0IsLdOHWQ2BRq216YnTlrhjGPQKPj63DmS1jwFJuA3uVHtS6o
   CeKWMzQH2EPxOeUWTT8oKKWA5yNH0fQZKqbxICkymNPdInzMTt8DqvUim
   aCIBJ3gIs+sI1ERWQEMEgxi7sP4wpoJMMD3QcRjvNxZtesdQEis+zxkck
   5dbWVAFO6gYdCfrcF3JSYSoLacSMPJiHShkytyITy9PANWl+oVESMF/Z4
   Zkg0EnAXyCzvIjr3kVnpzDCGEebDLL+8X5qqYEz41Q/LuBqY2TAVMju7v
   JDg11Wm5/h5yei2F05XSbx2bxzR1vBZigE+wyUMd9dhtxxtqDc9iQ6SEs
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144534124"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144534124"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 241AED7ADC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 673E6D747B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05C706B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA2151A000A;
	Mon,  1 Jul 2024 14:44:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/25] python3-gast: upgrade 0.5.4 -> 0.6.0
Date: Mon,  1 Jul 2024 14:43:49 +0800
Message-Id: <1719816242-11839-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-2.209400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrXKb6k/oWKMKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLh/urOI254HInsvjH1RI07Tkagp+lXLa/Tiz
	57ZESA9vOyOHploQrucZJcCbwQ7F6MH15JBpuUh1Oy+MQcJl0ZSs2zww+v7qj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111181

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Harmonize gast.dump behavior across versions, following py3.13 behavior

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gast_0.5.4.bb => python3-gast_0.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.5.4.bb => python3-gast_0.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.5.4.bb b/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
index 9c750ea3b..af46c3feb 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "9c270fe5f4b130969b54174de7db4e764b09b4f7f67ccfc32480e29f78348d97"
+SRC_URI[sha256sum] = "88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"
 
 inherit pypi setuptools3
 
-- 
2.34.1


