Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84252CAC583
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7934.1756890228119352621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q20Fr5a1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890234; x=1788426234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ib032lyBZ820lg/zLqDidvEkZq3seETGNJTO6wRzfwE=;
  b=q20Fr5a1ecLR7OoX5A+1UB6wPa04redGfj3seE/DMba8wUeXz+FO7h2N
   0DTgL2tersrHw+WyOvdcz7d4MZeBTW0sVfiP/WZHFTGcXYczNS4X4vz6U
   V0JHclzZIF+LwkNfwu8OnA1/b8tlfqdRTR2kbQ85ZoqLwBjMjF7RqYehi
   RLXm/76ALnYcyFXbf+CF1FCP5guEVlW5r5DYKDlC/0fTXR0oero74uAEG
   wl6p40IiTftO18ABOaE4ekhOnEsPEFVfTi+1bD074pbRRcithBldGjyBq
   tzqTp5aljEQipBLoWAUOf2g2umwzET1/b08hm9gFYCUoPQWuclbLM0I/d
   Q==;
X-CSE-ConnectionGUID: R0FaBLgzRFCyWPvyFR0q0w==
X-CSE-MsgGUID: jU5Elf6kSlGXDvvSzlAh1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199446305"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199446305"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5E675C00361
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 18AC4C78AFD
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:54 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 10418180226C
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2AE051A0073;
	Wed,  3 Sep 2025 17:03:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/56] python3-parso: upgrade 0.8.4 -> 0.8.5
Date: Wed,  3 Sep 2025 17:03:00 +0800
Message-ID: <20250903090317.2002-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119236

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parso_0.8.4.bb => python3-parso_0.8.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.4.bb => python3-parso_0.8.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.4.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.4.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
index 176bf6f277..e609a4ad73 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "eb3a7b58240fb99099a345571deecc0f9540ea5f4dd2fe14c2a99d6b281ab92d"
+SRC_URI[sha256sum] = "034d7354a9a018bdce352f48b2a8a450f05e9d6ee85db84764e9b6bd96dafe5a"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


