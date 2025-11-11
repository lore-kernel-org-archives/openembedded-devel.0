Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24D8CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12758.1762847755280762015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kS4fva9l;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847756; x=1794383756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g+xgjRWAh2HK1IBEMkdyiPnY9p70e2spGmMrZYMQlGA=;
  b=kS4fva9l0qKwSGijUK2qMjqGvXuN77ch6T/YYIVAHysy96fINnWUWZ32
   0K7Yyhk8TPt/eOoHL+ReVRqZQADnjPbg4/PcuP6RsCpeQ4zXjEPYkfhPB
   Fl3WEXoLdXWG0W0zzg2+AWVXBRgJYXBQFL0eDmbxacmgLx83+SRx3/IRc
   lrMmOGX6vIZumpFhpKPHnOAlBs+6NDZWOh6b8pDbWz7oRZum6oYlV5X7+
   LBtj8MTlBhEjg5sxhf1IX6wbCFWcJVod7D8iMhZLAGn3U8Yz95IPWvlsC
   z8249wbbQR0hx5843jsMQbPzwPy+3UpNHfOdnck/dqO3d8UN1Ifk9uSQ7
   Q==;
X-CSE-ConnectionGUID: NE4BsZMgSzG6dmd9PsZFnw==
X-CSE-MsgGUID: z8H4vb6JSP6ucCiI94snkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218846224"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218846224"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B94A41002BAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:53 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 757D1C02466
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E9E9E1802180;
	Tue, 11 Nov 2025 07:55:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/23] python3-marshmallow: upgrade 4.0.1 -> 4.1.0
Date: Tue, 11 Nov 2025 15:55:10 +0800
Message-ID: <20251111075517.1650-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121495

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add __len__ implementation to missing so that it can be used with validate.Length <marshmallow.validate.Length>
- Drop support for Python 3.9
- Test against Python 3.14.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.0.1.bb => python3-marshmallow_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.0.1.bb => python3-marshmallow_4.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.0.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
index 1df1e67f10..d1cd21d52c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "e1d860bd262737cb2d34e1541b84cb52c32c72c9474e3fe6f30f137ef8b0d97f"
+SRC_URI[sha256sum] = "daa9862f74e2f7864980d25c29b4ea72944cde48aa17537e3bd5797a4ae62d71"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


