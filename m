Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EB7CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16795.1779875341485552435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aZc7v7Vm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875342; x=1811411342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNJaFRJNwy13oGt6DMtcGlQhfR+B7YM3Lzek/FCFYhc=;
  b=aZc7v7VmOuagecQ6630sdS6KYqnogn50ZqsZxXqbA6bHSj7vVjWuQN+a
   MnUZQojRRE6Gf6vmUV2rZLAJAmYw/MYpZm5SjbDK9Oj41nX1f8xlNC4o1
   Vn1jsf540BRGerhp0PiHasDwttQajCLMcrDSiT5xpxjF/gmpxj+9vEuVg
   O+Rmols8Zn+5W/wqpsrivmkPd9QEFZWpw/5a8fUYy3eXSQpHU/Jyvfvh7
   vFsei2/OdfsdyTs2LsTB9SAauG0+8m7GYnzCfJv0CIslGfKoxVRpC1DVV
   dsHZ8LfLW9/QrtVBaTrHhd9o+9+1tn2xNmT/AAWq2zZKYPirznhhTHGi5
   w==;
X-CSE-ConnectionGUID: Es/9scMESkqQkkxwDLyMkQ==
X-CSE-MsgGUID: rYyppUyUQMy75v4aCunj+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969821"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969821"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:01 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E265E1002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:59 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 98B99C252E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A18B582A2CC;
	Wed, 27 May 2026 09:48:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/56] python3-faker: upgrade 40.18.0 -> 40.19.1
Date: Wed, 27 May 2026 17:47:34 +0800
Message-ID: <20260527094805.2039-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127232

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add uuid1 and uuid7 providers to misc provider
- Fix shared state mutation in en_IN pincode_in_state

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.18.0.bb => python3-faker_40.19.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.18.0.bb => python3-faker_40.19.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.18.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.19.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.18.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.19.1.bb
index 029b407070..7774e72dde 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.19.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "2207575c0e8f90e6ccd6dbef764de875c614d16d3db4eee9712d9a00087f2e70"
+SRC_URI[sha256sum] = "76fa71fd3bf320db25e5504eb356f9a76b8a95cd6098524d006f446035b6b89d"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


