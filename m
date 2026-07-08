Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5E1C44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4722.1783503940191941333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CbTKhjgT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503947; x=1815039947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ub8oCgX1YgfMyJJO2HQYpfhKmtd58XxVH8Y17Ccy/8E=;
  b=CbTKhjgThpiETWeNSX0Gc8KXbtfbKBhKolGMaldo2fVN9Q1F9tWh2jxX
   Q1gZsZFwoRZl0eEEzmq6rfDJHjuJYOoI7bJpe58CCYl6UrflLtZK0zVfR
   7QyIDecSk28I06ojUoXYh0PWlV8jHcxpmYKGzPzQAhtlxt7TakHjFV6dN
   5CChbzLH61ZnjmX2cY6EdmKT1ZnKcmGr9gMHCWNv88JhvhHg7VaUy9+c4
   wJyv0cZHAsSOInPVwXptb7iziVhvzBScbkjKVa/ECSOy5JVHQARXR6Efs
   lNR4LTxc3iawa/Hv1lQyOBBgRV4oeinYKk7w56IDTcRPorxln/QOD4CwH
   w==;
X-CSE-ConnectionGUID: rI7h66g4T+SG9457a5+piA==
X-CSE-MsgGUID: Yk3//hqKSECfmnwD4ckpeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="224395701"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="224395701"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CCA58252
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 818AD100596E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9B27E1800C26;
	Wed,  8 Jul 2026 09:45:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/37] python3-faker: upgrade 40.23.0 -> 40.28.1
Date: Wed,  8 Jul 2026 17:44:29 +0800
Message-ID: <20260708094508.2060-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128090

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix: compute valid ISO 7064 Mod 11,10 check digit for de_DE vat_id
- Add es_MX automotive license plate provider
- Add sr_BA SSN provider
- Update providers job, phone_number, bank and ssn
- Update phone number test regex
- Update outdated Korean locale names
- Fix: prevent infinite recursion in _safe_random_int when both bounds collapse to the same integer
- Add mk_MK (Macedonian) locale
- CI: run PR checks against PR code instead of base branch.
- Fix: raise NotImplementedError in bank() for locales without banks data
- Fix outdated links in README credits section
- Bump actions/cache from 5 to 6
- Bump actions/checkout from 6 to 7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.23.0.bb => python3-faker_40.28.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.23.0.bb => python3-faker_40.28.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.23.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.28.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.23.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.28.1.bb
index dc9d52e706..e32ae395a8 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.28.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "f135e563f1f95f19346bb680bc2e43570bc43b7893e566023746f51f32c69dfc"
+SRC_URI[sha256sum] = "2a63fb51abab8790636d4030a094cf942404cbccc9c288d1cad70e2e3e9ecd58"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


