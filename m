Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CFDCA0FE7
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4677.1755766813151770939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kBRmEsYN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766813; x=1787302813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OFmnOA/8cC2t64/GKI8nlrY0nEHpIftcPQyeF2rG5ho=;
  b=kBRmEsYNiRl6c65+Vk/lWwtdjArMZxl5587o2ZGr7waLV6KR1dSbw+hW
   MdKTsy9niByuznoJP05A8WFAz1/35T3sAfqDJVX/SjbBal4LzD5RANn2x
   10Ig+OASaw/vXFVMurubm28x7QlbS9cSF6zgZaFziazl0r0qOYFb6CSOa
   2gxttRBcHPgvz8xG1ytyhSIvSowHNBmxYJGdBKvob2cvYsuYcueFtpsQ3
   igvYx5ijIJzDIM0j+8Ur6QmBoAiAmQKz2TIdMompqJnUWnFR0Q/liwrUH
   RqAg+E/4wnbx63IsJ5o5PYG9u5CpXwfzA+SkUPXbYV3XKqyXx0TYr5USx
   A==;
X-CSE-ConnectionGUID: 6EDp42MzT5acS313bfd/zA==
X-CSE-MsgGUID: +xfwkeiDSMK8pPXI8Hff8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="198643275"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="198643275"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:11 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 88AA942A337
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 47328100D11E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 22273826FF1
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 82C981A0069;
	Thu, 21 Aug 2025 17:00:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/21] python3-kiwisolver: upgrade 1.4.8 -> 1.4.9
Date: Thu, 21 Aug 2025 16:59:39 +0800
Message-ID: <20250821085954.2056-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119056

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Changelog:
============
- Include Python.h-including headers first
- WHL: pin cibuildwheel 3.1.1, enable cp314 wheels
- ci: update release workflow and test on 3.14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-kiwisolver_1.4.8.bb => python3-kiwisolver_1.4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.8.bb => python3-kiwisolver_1.4.9.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.8.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.9.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.8.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.9.bb
index d3044a65c8..f84a427446 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.9.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A fast implementation of the Cassowary constraint solver"
 HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5f7ce5ba663b186ce35b78df96a2eb0a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27a71439e89b80e41dc526a4b8bbfa2f"
 
-SRC_URI[sha256sum] = "23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e"
+SRC_URI[sha256sum] = "c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


