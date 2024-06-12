Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484A4C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2493.1718161130528599590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bNhTaOzq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161132; x=1749697132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CumI+wDognCGhp76gjCNW6KFfZUPXKw+Z9ZlmkbFS3U=;
  b=bNhTaOzq5ukmVmTWtS9dZbemp2RZwpkq2ULoUPrDHOClmplRZqKC9WaW
   3N696kNUDnBJCS2wdXfVWRe/CsuSXR4CeUtgThUczA+zO4DaDSSOYqwBQ
   6B3JRg/aqEideB6Uu5JP1tp2asAZrWFP4o3jJwXio4SycCclJF0yktxti
   Ykeg+kHNWuU5n3QeF9iuEPsaIuk4TMha/yj+kGDRS7RrZ/8p3j1VjoIsp
   TmHMv9PhTcpdryuPEAcHYPUC4nZ8wqCr7QVzH2W+PhiBd//9xU8UDcrWq
   bBSNL7Td9qApxiZU7fNXh1UTjGlXDiexyNZMhYnbstnl1G2YKgP9SIanK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141617831"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141617831"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 48CA0DB3CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 90485CF7DF
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B6AF20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B61B1A000C;
	Wed, 12 Jun 2024 10:58:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/43] python3-sympy: upgrade 1.12 -> 1.12.1
Date: Wed, 12 Jun 2024 10:58:06 +0800
Message-Id: <1718161096-29710-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-3.677700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN031Nfxfj2zMQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJRdekA+hv3bnAjqLLc7PsEhoK5kowHlpfS9h
	XRJb/fYIGUbJI0X9gpIoOkQXTncFLrgXyBPIO7Oq2rz7HLUsl9gTpvArlEu+f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110870

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/sympy/sympy/wiki/release-notes-for-1.12.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.12.bb => python3-sympy_1.12.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.12.bb => python3-sympy_1.12.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.12.bb b/meta-python/recipes-devtools/python/python3-sympy_1.12.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sympy_1.12.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.12.1.bb
index 088dda3a2..2bdaf8ed2 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49420fb8"
+SRC_URI[sha256sum] = "2877b03f998cd8c08f07cd0de5b767119cd3ef40d09f41c30d722f6686b0fb88"
 
 inherit pypi setuptools3
 
-- 
2.34.1


