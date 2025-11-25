Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2142CCFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13205.1764061989115575435
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LRXOb7SL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061994; x=1795597994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlnRUEeZ+YDXyZt1cM+T3AyndKJFIk/Kx/RsQr57D4I=;
  b=LRXOb7SL6/thUh9Ez0bYdgi8h1nRRKeddMgxWHoPAXbGIijup2TC5mZb
   LsaqcRXkIHmbwJSxRfsDM2BkbApp2uAJK3SRwPXu86rcGuSpjlUno+uDY
   FgxCI2amufi/nDz8UhM6ed9zqIxUtezjoV5KDIUGDz6XrfqaBqLGZRwuh
   PKshSXud01xdvCH5kqFSXo403zdMay/skA2NF5S1BdLwvIqvYb1XqrUd8
   Ly/iaHJ35Max1TXFu3KoNbqdNgR29mcTEqsykGHa29PJNzY2G4IkEVt8b
   k71z2ZGTljHCam0m3OwbIZ8McEQIZDBoPgiwjxLi7eD4wQKjqFX0dnP9K
   A==;
X-CSE-ConnectionGUID: mSYibEnETyuJJ8XXDKwRyA==
X-CSE-MsgGUID: UAbvXdVvRg+pQjHSzlLYuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199164462"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199164462"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:13 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id CF37542A30C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:13 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 87075C02181
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2974114001E6;
	Tue, 25 Nov 2025 09:13:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/26] python3-bandit: upgrade 1.8.6 -> 1.9.2
Date: Tue, 25 Nov 2025 17:11:42 +0800
Message-ID: <20251125091156.1376-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add instructions for Maintainers to create/publish a release
- Replace deprecated datetime.datetime.utcnow()
- Fix typos
- Support of Python 3.14
- Drop support of end-of-life Python 3.9
- More Python version related fixes
- Argparse Python 3.14 enhancements
- Check whether Constant value is str

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.8.6.bb => python3-bandit_1.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.8.6.bb => python3-bandit_1.9.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.8.6.bb b/meta-python/recipes-devtools/python/python3-bandit_1.9.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.8.6.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.9.2.bb
index 211d579869..55f911bd3f 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.9.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "dbfe9c25fc6961c2078593de55fd19f2559f9e45b99f1272341f5b95dea4e56b"
+SRC_URI[sha256sum] = "32410415cd93bf9c8b91972159d5cf1e7f063a9146d70345641cd3877de348ce"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.43.0


