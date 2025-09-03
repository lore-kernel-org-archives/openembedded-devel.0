Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ADBCA1017
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8063.1756890233999112732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sJD9uCqe;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890236; x=1788426236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UEXv0DsPRu3mUBJXUN1Rp5Hs15UUuqqp8PKAhClbvCQ=;
  b=sJD9uCqe27nrtDcXeCMzS4kOZnOOaIl0Z3rIiEWtcC1qCTcMUWO/JOXh
   RB/JGw8vZUK1sIIJBti5uJ6xB/EV0/5P3KN6Zk7AN/6NapPWKkFqtH/Ch
   OkdevQAU3W/AbwjF9jS4J+SL5/aYPOtNyxRkEco1o5eA5UCIbKa9QWXeY
   /qvEn2wpRt6slcVdPAGLpcg4LGAf9ftbF8NlQVnbn8ao5r2VgS16yVcHq
   c+k4Ks5+DMVy4lYec2NG5iwoaLF+mnsCWFnj0Wsvwl8nFCl6Rswg09mu/
   fwNAsrRpSMFUZya48v5KYTQPKBC34wOJB0ppE2GrExUgSOy5u+7Z1T5Gs
   w==;
X-CSE-ConnectionGUID: VAxu/XhHRUi/gp7CJwQYRQ==
X-CSE-MsgGUID: aszVuDZTRm2S2O+THdTyJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190432419"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190432419"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:56 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 009A9C00354
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AD5A2182FD5A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:55 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 83845823088
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D3541A0087;
	Wed,  3 Sep 2025 17:03:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/56] python3-pyais: upgrade 2.13.0 -> 2.13.2
Date: Wed,  3 Sep 2025 17:03:03 +0800
Message-ID: <20250903090317.2002-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119238

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyais_2.13.0.bb => python3-pyais_2.13.2.bb}      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.13.0.bb => python3-pyais_2.13.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb b/meta-python/recipes-devtools/python/python3-pyais_2.13.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.13.2.bb
index 321b37162a..6f1723d3b8 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.13.2.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
-PV .= "+git"
-SRCREV = "2c50d58c4776a4ca7560bf9d70587a9acf523d1c"
-
+SRCREV = "439783a1fa678cf18acfb75ccb9e02142cc72e2e"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


