Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEE0CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:56:06 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12614.1762847760583406463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PlzlwQVx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847761; x=1794383761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wg0Cbu5jkZJc9cWstGZX9BA9HLr6SCPy+KRiRBIe5MI=;
  b=PlzlwQVxxYzBTBFhPcM5RCXAY2+8epLfoulkZSjGt/hOSNSL4AGBJf00
   SXXxgXidzs/I/88irfBNJAB8c84OdH355ivqP99M55caZn2lvJQeJidVP
   a8x/e9PS4pE7mllIn3JgSxdGjlzF9Mk889urrenBmMjjDJxZMKrxGnR51
   7K4mDT0fQzxMQQ1hVy+epLTVFREDO75kGqHNST9kBfm/RGjw28YnOKR08
   oJYF4V4Hfh8LdvlNoUkCV4/0s2BC5S3mNySVTnf7QwgKxvF3yOxpOq3+l
   nov+WIYonVFDeVH29XLC8eOTFAlXqdD+yTW+phRt78oMY5p6cRi3dMwW2
   w==;
X-CSE-ConnectionGUID: DAFl2ho4TCyg9EFNoylXFw==
X-CSE-MsgGUID: JVz1ZgHzT4GKiDAzvoK/Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218201563"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218201563"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 28AD81C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:59 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D878E1800EA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6CFB51800D76;
	Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/23] python3-regex: upgrade 2025.10.23 -> 2025.11.3
Date: Tue, 11 Nov 2025 15:55:13 +0800
Message-ID: <20251111075517.1650-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121498

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Support relative PARNO in recursive subpatterns

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2025.10.23.bb => python3-regex_2025.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2025.10.23.bb => python3-regex_2025.11.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2025.10.23.bb b/meta-python/recipes-devtools/python/python3-regex_2025.11.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2025.10.23.bb
rename to meta-python/recipes-devtools/python/python3-regex_2025.11.3.bb
index bf6e7776af..8e30bdaacf 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2025.10.23.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2025.11.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8cbaf8ceb88f96ae2356d01b9adf5e6306fa42fa6f7eab6b97794e37c959ac26"
+SRC_URI[sha256sum] = "1fedc720f9bb2494ce31a58a1631f9c82df6a09b49c19517ea5cc280b4541e01"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


