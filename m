Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8791F10A1E98
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45649.1774526247615862658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hHumjZRG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526250; x=1806062250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WKgqha9hu6DA9wbu9Xs/GqKdudHz3JMCjEjLlmYhZ5A=;
  b=hHumjZRGBkRsr0SR6q9A85qu5s62ZjzCRMdeb1dCOtVJv0T1KZd/WMJ3
   S8kkf/ozWLo/UzwwM2WXwqL8rAb9jpzz0ADHEgqoc1TSAAbB88JpS5e9E
   9JeJabOzMVY4Z2b5J/+21OaylcXtZNu41//IEEX0ZTD6yz4LqAF/mOGgz
   4St5gARPJ32Y9pOBU1JMi61jEGxsLZr+dprI81O/OWiALjT7BZs0Kp+6i
   CKtoyUi0Yx/5xaLx7k6BaxQntO2n1QseLgSI9DevLi635YpFIX2SXiozN
   uw9n89L3X/Xebamzo4qIgK/RsByn2wf2FMJ43qHyPwcBH4WUPlnIFfxiL
   w==;
X-CSE-ConnectionGUID: EF53Bq9gSg6ebQPPVQ9R+g==
X-CSE-MsgGUID: KJOq8WudQSimNL1hATLVIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234669377"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234669377"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:30 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4641E42A313
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:29 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E7156101B166
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6CEB8180714B;
	Thu, 26 Mar 2026 11:57:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/63] python3-cbor2: upgrade 5.8.0 -> 5.9.0
Date: Thu, 26 Mar 2026 19:56:00 +0800
Message-ID: <20260326115634.1199-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125685

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Added the max_depth decoder parameter to limit the maximum allowed nesting
  level of containers, with a default value of 400 levels (CVE-2026-26209)
- Changed the default read_size from 4096 to 1 for backwards compatibility. The
  buffered reads introduced in 5.8.0 could cause issues when code needs to
  access the stream position after decoding. Users can opt-in to faster decoding
  by passing read_size=4096 when they don't need to access the stream directly
  after decoding. Added a direct read path for read_size=1 to avoid buffer
  management overhead.
- Fixed C encoder not respecting string referencing when encoding string-type
  datetimes (tag 0)
- Fixed a missed check for an exception in the C implementation of
  CBOREncoder.encode_shared()
- Fixed two reference/memory leaks in the C extension's long string decoder
- Fixed C decoder ignoring the str_errors setting when decoding strings, and
  improved string decoding performance by using stack allocation for small
  strings and eliminating unnecessary conditionals. Benchmarks show 9-17% faster
  deserialization.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.8.0.bb => python3-cbor2_5.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.8.0.bb => python3-cbor2_5.9.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.8.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
index c0a7061657..42d661ead3 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931"
+SRC_URI[sha256sum] = "85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


