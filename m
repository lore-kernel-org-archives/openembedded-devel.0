Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95D7D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4138.1765274209547005548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QWfI1tqJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274210; x=1796810210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ALdQggLPwQ34URc6U5KjCroyh9FVahTGjlgSh7s7M+c=;
  b=QWfI1tqJ+wxmBIpJcUnRqq5qBoWXypbfNAn+KskZyDxdckaP+lRQtPhW
   v95vgE/xR9w6fZ+kLw0x2NXYszo0DNAwI5jsvFO/dMJhaudyqj86Qcy8Z
   s7Qz3gO1rKuuHOAw+gBOymShBxvutlQerV8MHKwve+dNmdwY//qU866NV
   Fd5EBAxHs7pJ0x4T+LVR8+O5WivXARRrzhLoz9UjFfbWOS2TuyM5AdLHO
   Al3F1T0pwjl3gPaiPtNCrIB9OqGEpFxAgqZoPqN3GtWhT2tcp0E7WBCkE
   2uuhhiQ5fI/qWQpeIQw8fG4/HS6IKklT8k+4Tz1nZ761I4XJvdyWfTwsO
   w==;
X-CSE-ConnectionGUID: WOTYaPn2TLmfH39nWTymHQ==
X-CSE-MsgGUID: ojJiRfwcS9ene94EY+gzew==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221381963"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221381963"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8BE8AC006C1
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4457BC0183A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C039C20002B2;
	Tue,  9 Dec 2025 09:56:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/38] python3-marshmallow: upgrade 4.1.0 -> 4.1.1
Date: Tue,  9 Dec 2025 17:55:37 +0800
Message-ID: <20251209095552.690-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122427

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fix:
  Ensure URL validator is case-insensitive when using custom schemes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.1.0.bb => python3-marshmallow_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.0.bb => python3-marshmallow_4.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
index d1cd21d52c..2919897dc3 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "daa9862f74e2f7864980d25c29b4ea72944cde48aa17537e3bd5797a4ae62d71"
+SRC_URI[sha256sum] = "550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


