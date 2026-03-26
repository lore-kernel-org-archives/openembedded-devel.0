Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A803110A3D78
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45664.1774526275855612832
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FBsPL2a/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526278; x=1806062278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zwIo9UIDsdwfccptKNK97oWWmWjwDCzXHRXKL/d4gRs=;
  b=FBsPL2a/cPBfFUcP+T18bUQ7gWHbgfeNQtKH3l2IqFSyfvNlUPy4g9Ob
   04OykcISo56clhTGAtYxCJ+SKuo5DU3C1mKGwlWSYDHzKwzF9uJGKsSOh
   zmyqlXbg60xzMopoRfyuuj+XP/5aSTB4nSigFyegbK4jg3hIRAl5PbCPN
   WtcGG4wD25Q71wsCL2p+PACxODXr4sxcid5WelLFknRiAdKZLDPhMs5D4
   giVNr99h5GJSdPQfmEvXgvzkOWVAxsRzJipRuiTth5Pi7Nxbwf12XKxBk
   kFG4Z5+1iEW63o/x9xFhm5xaf0rK5axluiBsZ7857BZWBYP0XADzaTJlO
   g==;
X-CSE-ConnectionGUID: DsxPRI7VQbmqjZDAWiM9EQ==
X-CSE-MsgGUID: ck7rYrJMQCuZMFvoz/jnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647325"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647325"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7D77A820C24
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 37B29181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D6CDF1807148;
	Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/63] python3-pytest-env: upgrade 1.5.0 -> 1.6.0
Date: Thu, 26 Mar 2026 19:56:18 +0800
Message-ID: <20260326115634.1199-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125703

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add permissions to workflows
- Add SECURITY.md to .github/
- Add missing .github config files
- Standardize .github files to .yaml suffix
- Fix verbose source attribution when falling back to INI en
- feat(env): preserve existing env values

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pytest-env_1.5.0.bb => python3-pytest-env_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-env_1.5.0.bb => python3-pytest-env_1.6.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.6.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pytest-env_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-env_1.6.0.bb
index c9fbde1961..860a534aaa 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b70ef84b3d8d608b13b0287ed49df651"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "db8994b9ce170f135a37acc09ac753a6fc697d15e691b576ed8d8ca261c40246"
+SRC_URI[sha256sum] = "ac02d6fba16af54d61e311dd70a3c61024a4e966881ea844affc3c8f0bf207d3"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


