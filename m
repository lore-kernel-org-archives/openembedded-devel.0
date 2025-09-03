Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5818CCA101C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8064.1756890236702565008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wp8BOQa6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890236; x=1788426236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GYuVJtHyrmQXQ0mnv2e6JjBVcgrWnNfGsXlaaTzXeBI=;
  b=Wp8BOQa6OWQ6gL2qErFW8pDIc3jz0teZw/zIpl6VVe4c+3x85YV8YOgF
   X3VC8HfsFNLi1rVFNsree2vtnAwKeJofaq2wJ2sdTGFqZjvtZC4p0Nr06
   0qoF9RNpuPuPbtkcN+N64UAv7R04gkCsmerqMZrHvVLfqlB66kuW7MwAT
   8uNfOMyVvJnTqUNcNpIVdbOKjc8RSpCWOv/B7gozhGEpuzsN7DffhxOtO
   CiefzBfaohROwExNQ+1QSThcuILaUh1FozwwA9HhuQFXaA151eYsuMbUm
   AZG7YCYXhhW2hBb4X+znudLEHJJP9NjPzrR1OBtubeTWt+wSuJDljWUt1
   A==;
X-CSE-ConnectionGUID: MHkcgiq+TCuBUnktXyeVGw==
X-CSE-MsgGUID: IziCslO6QUuMnI8eGWx/JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190352795"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190352795"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:54 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0FCF7C00405
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BFBD5182FD5A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:54 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id B9218180226F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5B411A0078;
	Wed,  3 Sep 2025 17:03:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/56] python3-prompt-toolkit: upgrade 3.0.51 -> 3.0.52
Date: Wed,  3 Sep 2025 17:03:02 +0800
Message-ID: <20250903090317.2002-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119239

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.51.bb => python3-prompt-toolkit_3.0.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.51.bb => python3-prompt-toolkit_3.0.52.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.51.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.52.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.51.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.52.bb
index 77b05f7f90..ca4c7eeb06 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.51.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.52.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "931a162e3b27fc90c86f1b48bb1fb2c528c2761475e57c9c06de13311c7b54ed"
+SRC_URI[sha256sum] = "28cde192929c8e7321de85de1ddbe736f1375148b02f2e17edd840042b1be855"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


