Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F26CD1297
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12756.1762847753181690812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dqo/f6F/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847752; x=1794383752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MXJp5qNOPcoPxs0Dph9NN7ObjTpCTdjg2kZEDw01rF0=;
  b=dqo/f6F/lzp3afVVCPboVl3ts/TWsb7l4yZbi7jbrAJ+tmivsRPGTxvY
   ZHKe9wi9kW2uJ6zQKo00jPWB8/TTToat2FMIVFbzM0pcGy1ojRQ4L9+xO
   SUOni8JqaKggebhcNa8EKo+ECErkCGlEgkXB+TO9K5vJDrwUPnboK0LP8
   zJTRP4zsCvaihmsviuRM+Hf+JEOSvZQhzXC5Mx5Y0KMnDUVMXMrJmxhdz
   D5j/XK7ZKpK3Xh3BI3ejWU4MgAyJPv3MoXUjy/+X9EA8mWjGB7Q8kf4Fq
   FE7bVUOEvkWv9wjcOsPKTWdqb30kTl2jp4Rw0cFRBLzhRRoKvE0uRp1vn
   Q==;
X-CSE-ConnectionGUID: U0ADeV87ToGXygUVtQ83dQ==
X-CSE-MsgGUID: H2OAnDXVQSGXzfcbNW4u2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="206245418"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="206245418"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:51 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BFA347A60
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:51 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7D1E51000867
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1A46B1800D79;
	Tue, 11 Nov 2025 07:55:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/23] python3-lz4: upgrade 4.4.4 -> 4.4.5
Date: Tue, 11 Nov 2025 15:55:09 +0800
Message-ID: <20251111075517.1650-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121494

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Enable CPython free-threaded wheel builds
- Correct the import of _compression for Python 3.14
- Keep GitHub Actions up to date with GitHub's Dependabot
- Build wheels for Python 3.14
- Fix typos discovered by codespell
- Bump pypa/cibuildwheel from 3.2.0 to 3.2.1 in the github-actions group across 1 directory

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lz4_4.4.4.bb => python3-lz4_4.4.5.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.4.4.bb => python3-lz4_4.4.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.4.4.bb b/meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lz4_4.4.4.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb
index 8d336df4a9..e14d722861 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb
@@ -9,7 +9,7 @@ DEPENDS += " \
     python3-pkgconfig-native \
 "
 
-SRC_URI[sha256sum] = "070fd0627ec4393011251a094e08ed9fdcc78cb4e7ab28f507638eee4e39abda"
+SRC_URI[sha256sum] = "5f0b9e53c1e82e88c10d7c180069363980136b9d7a8306c4dca4f760d60c39f0"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


