Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BFA105A57A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18859.1773313199008465378
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t7QsgWbA;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313199; x=1804849199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3t2C6mpyKtrzMRfshom/vyH88ZA+2yhj+Pd9U+wnyF0=;
  b=t7QsgWbAl0qFNOobrGuQjASZ2zXLKK58rxEhX20Ht1kAhSmBCNy9ExHk
   5a9huFjy9HtpEmIY/rfuh5kjOfmfd4irJHlqUIWJ9Dr/VYtA4+XgerOhB
   QqjtehoUBGhAATZobks28Z3VuMBzd4zye7qJxbqQTncj6mvKxs3nbXGxo
   1IYWTQlao16PvpwPtDHuLlV8x4N24r8LpAim7P2JAlsvLczrkZbX6RfjH
   X74skGoC7BxqXk+dknaJTdSIDowsQDDVVZfczqaXjLnbKXj0ZI460Fv68
   0LjPyO9rvzqkGUHAhbnHCNsB8cezmvUPzvF/Hi514lxo80JrCj+iy7Y3N
   g==;
X-CSE-ConnectionGUID: Q1XKViPcTOuiEJwR1LGAUQ==
X-CSE-MsgGUID: 9EYj1Ox+QKmKEkZEgqgpRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211990089"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211990089"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:59:57 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 94CE8C02F6B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:57 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4A2E6861268
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 50B248288E7;
	Thu, 12 Mar 2026 10:59:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 56/64] python3-tox: upgrade 4.36.1 -> 4.49.0
Date: Thu, 12 Mar 2026 18:59:32 +0800
Message-ID: <20260312105940.1900-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125156

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.36.1.bb => python3-tox_4.49.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.36.1.bb => python3-tox_4.49.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.36.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.49.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.36.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.49.0.bb
index 98646b44a7..f07694cb79 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.49.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "085ddf2e6ebd2a5be04ae8f4a2c6422a7994a4702b3c187edc4e99f1e7ccdc2a"
+SRC_URI[sha256sum] = "2e01f09ae1226749466cbcd8c514fe988ffc8c76b5d523c7f9b745d1711a6e71"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


