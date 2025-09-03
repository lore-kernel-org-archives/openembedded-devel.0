Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEF6CAC58A
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7935.1756890228719380268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NfLUbrek;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890234; x=1788426234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zt23CYy1gJ+RmQBE4lPD57p7pZuE3WQH1H51U58T4/4=;
  b=NfLUbrek3p3PiU7hYqrw1Yi/aE2dx3qgNPhLpqglzOwj3Jth6MHrSOO+
   Qir8Sk9DPJnAu2OSgr+LzRzXAMTd2bFdpIqidVyiOBqgOGbjT77kv9rMf
   pAUysAvjd/8ARPobVcP/G/BWloMOriBPDysvGXXeoqXr5T+/dcmrivZPy
   1fXHBgmubaOjNU2HAXEZxqIbdYaRfUgZmjb+5Rw7Ntf6r+FLQpfqKENBh
   m62vpVHDAMpokRZF+1YSrAtwn11gZqWFVqS7GmWkfVBaOAqAMlFRbvMjA
   3Q6/jbBALhK/ht4CsAjdBG8Rf0JNiQjzC+vTQ/gzoeD0v87Fc+kLW/qez
   Q==;
X-CSE-ConnectionGUID: qalgR6e6SiKuOr8ERD07vw==
X-CSE-MsgGUID: t2Na1QRbT+q+5ENuLlY6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455947"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455947"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:53 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B9C1F1002BA5
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 706B91468786
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 57F472005D22
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 55CDE1A0090;
	Wed,  3 Sep 2025 17:03:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/56] python3-inline-snapshot: upgrade 0.27.2 -> 0.28.0
Date: Wed,  3 Sep 2025 17:02:55 +0800
Message-ID: <20250903090317.2002-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119230

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.27.2.bb => python3-inline-snapshot_0.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.27.2.bb => python3-inline-snapshot_0.28.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.27.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.28.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.27.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.28.0.bb
index 87446eb064..89b3757d7b 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.28.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "5ecc7ccfdcbf8d9273d3fa9fb55b829720680ef51bb1db12795fd1b0f4a3783c"
+SRC_URI[sha256sum] = "6904bfc383240b6bea64de2f5d2992f04109b13def19395bdd13fb0ebcf5cf20"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


