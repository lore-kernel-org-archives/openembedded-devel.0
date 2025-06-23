Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31645C7EE3A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13873.1750662712085557795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VSvgVnde;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662714; x=1782198714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CKRmit0xHaEMiZJ1ISxdIGgp6VOONoXtalp5t3W52Eo=;
  b=VSvgVndeBFgL1WrceIkEtDzrsELgd+pdcmV2iTV6ojg8dODq6P8RNWYP
   4qKhUV2tzth/7A2m0fiR9dxv8hqmIWhADbEJcTctIF3fiLwTwhmpmXgXO
   XJE4g7Nc6MWYmNdsjxVHowfuSJ5fEXRLbdfvjwuT3g5CFyAtkOhOXeHIc
   ylxcCzG3RXRsVHGIXid9xBTfTQ8e+GctTgb64i1elWrs7Kv4RnE2PTrl/
   1JfeW3i7R1FFCmMX6aQGpF7TIZZe2xFNKMQrzBtTuSiTDcgWTJgi5UYel
   6YPvAOxUAs/8bi2ofpgBTEOmQ9CXyMOHVZrCGitFNpPOPCq0OK3T8c244
   g==;
X-CSE-ConnectionGUID: oHTNhl3bRae6SWypE2o3HQ==
X-CSE-MsgGUID: 5Ngkjcy1Qk69qci1KrlVBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203567335"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203567335"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AC23CD5053
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6993AD4FB5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE73C1A0071;
	Mon, 23 Jun 2025 15:11:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/30] python3-coverage: upgrade 7.8.2 -> 7.9.1
Date: Mon, 23 Jun 2025 15:11:19 +0800
Message-ID: <20250623071138.402-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The "no-ctracer" warning is not issued for Python pre-release versions.
  Coverage doesn't ship compiled wheels for those versions, so this was far too noisy.
- On Python 3.14+, the "sysmon" core is now the default if it's supported for
  your configuration. Plugins and dynamic contexts are still not supported with it.
- Added a [run] core configuration setting to specify the measurement core,
  which was previously only available through the COVERAGE_CORE environment variable.
- Fixed incorrect rendering of f-strings with doubled braces
- If the C tracer core can't be imported, a warning ("no-ctracer") is issued with the reason.
- The C tracer core extension module now conforms to PEP 489
- Fixed a "ValueError: min() arg is an empty sequence" error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.8.2.bb => python3-coverage_7.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.8.2.bb => python3-coverage_7.9.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.8.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.9.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.8.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.9.1.bb
index 9438d2f32c..50542889a7 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "a886d531373a1f6ff9fad2a2ba4a045b68467b779ae729ee0b3b10ac20033b27"
+SRC_URI[sha256sum] = "6cf43c78c4282708a28e466316935ec7489a9c487518a77fa68f716c67909cec"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


