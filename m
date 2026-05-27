Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046E1CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16953.1779875354236228986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eBP8sg4Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875355; x=1811411355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SyFZL0HcPxBzn2wptUMVKXROf+Bx/HYkDZ3Z0VGgKJE=;
  b=eBP8sg4Z0rljr1vPJbze/eN7Y0umR/LHwlDnPWPHHPZ4ISYv2x+tvtuk
   oal0BUhZcbeBMJz4SmgWJwnyMyrE3l6LgfBgG96hZr7Rtr9NaBJE4nz0L
   mm/2Gy8HSqU4Bf7fsz2R7k5QjQcqFuX+VaEX3771QHjGMCNItbhsZhgrl
   PqE4PLXV4zCOPdk9n3ay7070P5zmk6jfnEUk7CVFUaaZpxPOG+9j8La8j
   nVAC+DtYbM5lxvclv9HXIOCAmbvm/MV+3JG4e7AHZ5xAhpfx3P4KYhHk0
   Y+q03Iid71AW7WkHw1js8GCgNlCX4Hxa+YYa58VRKWMqJbVMnDiiP4ywE
   Q==;
X-CSE-ConnectionGUID: rq77W8+IT6y9Q15uA4hELA==
X-CSE-MsgGUID: Z46zGYwVQt2rwhyd15XmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050112"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050112"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:14 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B80C042A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 70783C0E44B
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 867DD82A2DA;
	Wed, 27 May 2026 09:49:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/56] python3-pyais: upgrade 3.0.0 -> 3.0.1
Date: Wed, 27 May 2026 17:47:42 +0800
Message-ID: <20260527094805.2039-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127240

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_3.0.0.bb => python3-pyais_3.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_3.0.0.bb => python3-pyais_3.0.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pyais_3.0.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.0.1.bb
index a8b8777821..54aa0ef354 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "a88659ae381487e547fde3c18ab45cfe572b1094"
+SRCREV = "645ca8026a7e703a2161c8106b238f82eb8629a5"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


