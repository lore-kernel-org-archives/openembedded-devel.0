Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4A7C87FD6
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.31496.1753869310513220449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m0qH3++o;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869310; x=1785405310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PdDScqr2sjfd1AxVSrORVAwzT8vBwUeRMSFsQTpYaTQ=;
  b=m0qH3++o9oI5sgXWz+qMZOzkk01+rVDzGfsbhRSGLktyvYSTLyjnQJaG
   RCOBOS7z9V1K1cVAtKFCva8Ni2I/sIPcP1HF+NP9/wWgCcZ9v1z9liV4w
   St/eBqCWKzzGqC4m4cyGZLBZHq4fjBlyNsa+rGdidaJTP1lHcxCpnA09r
   7s9Cid4mXHbanpUkY1LBmfNimNex9iZIJIExhwSCxgZ9RJspDlSCptZBn
   +iBdBC7vcLHiwKBOHcQw7O6OpLcWcDFJWWtpXtiYitfmtzQ4ZTXkENS+D
   dFHQi+LHYDf1AADNK6BRtJxpOO8J9W5HFrhBO2MyHdEHaX1QFDUSTjtrc
   w==;
X-CSE-ConnectionGUID: CbeBNMF/RLWUUJdoRzvCKQ==
X-CSE-MsgGUID: 3N6v7aG0TuS6qzOOXvZXgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186784567"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186784567"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F0515155F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5AAB2C01EEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 51D551A0096;
	Wed, 30 Jul 2025 17:55:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/40] python3-bitarray: upgrade 3.5.1 -> 3.5.2
Date: Wed, 30 Jul 2025 17:54:38 +0800
Message-ID: <20250730095456.695-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118787

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- change random.seed() test, see comments
- optimize util.random_p() by also using bitwise AND in final step
- add ability for heavy testing to example
- add DummyRanomPTests to example
- add in-place XOR test for comleteness
- add --disp option to example
- add verification tests to example
- remove duplicate tests
- add test - wording
- add links in comments
- add sanity check
- add note on limit in relation to 1/K
- update table in documentation to new example code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.5.1.bb => python3-bitarray_3.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.5.1.bb => python3-bitarray_3.5.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.5.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.5.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.5.2.bb
index 3cf1751f32..43ea07173c 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.5.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "b03c49d1a2eb753cc6090053f1c675ada71e1c3ea02011f1996cf4c2b6e9d6d6"
+SRC_URI[sha256sum] = "08a86f85fd0534da3b753f072c7b0d392d4c0c9418fe2a358be378152cf6b085"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


