Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1031FCAC5BF
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8228.1758704448207098007
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NEWCXli+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704448; x=1790240448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LXEyzavr7pJIuYAsepEd7lkAU3wT/l5vbBVgOrvLLWQ=;
  b=NEWCXli+wdungPlVN1K/Hy2BzMvCdC8Nhx65Mh/bSBqzSYPGzUgw2G6I
   1kp2G6kkvaEkEcR7F+LwogAUYO1Sr6J1jGzN9VUZydiLRWKozDlOgnTZY
   YHBULY2Hl0b2jYj1HsNqF2e360eEqYp2oAhOTx4EiIN02c/sogBdHLZus
   6wS4k4ZzAn3DdCtuzDwxcQyxa1/ss+hrFR4FP/1erPjlQsj+UnA48Rrkc
   mDToZ51OVGSBwS81tO01OUkvt+Ea3XUKdR9Ps+TAC7G43KWuhS93U40rA
   5EuDH4Sf/Whrd9ln/b5MpTOYXtB4ewk7kqDR/QlYzG4CHP0HlkJz+oGh0
   A==;
X-CSE-ConnectionGUID: hLxb1KemTi+R9tmASMF2Bg==
X-CSE-MsgGUID: y5YAj7+NRgCVGH2BXD21UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="201716852"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="201716852"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 662F21000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:46 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2B97D100027C
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 8ED7714000E3;
	Wed, 24 Sep 2025 09:00:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3E2B1A008B;
	Wed, 24 Sep 2025 17:00:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/29] python3-pystemd: upgrade 0.13.4 -> 0.14.0
Date: Wed, 24 Sep 2025 17:00:26 +0800
Message-ID: <20250924090029.1786-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119791

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pystemd_0.13.4.bb => python3-pystemd_0.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.13.4.bb => python3-pystemd_0.14.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.13.4.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.14.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.13.4.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.14.0.bb
index 4868bc51e6..58247af55a 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.14.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "f06d4e5b21881a7c9100492e60ccc2f4b64e50b4d6b7773c94013d2c6f1a00db"
+SRC_URI[sha256sum] = "56875ef5662122d251435f6efa0edfcf15e3c9c17f4a7b15d5481814cf268e6f"
 
 DEPENDS = "systemd"
 RDEPENDS:${PN} += "\
-- 
2.43.0


