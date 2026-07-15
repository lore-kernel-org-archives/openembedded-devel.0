Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE08FC44512
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3426.1784112017018586635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PSDBk0DM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112020; x=1815648020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qijXfQnsweGbqXyAr8bHdK0DRh/C/L5grMhDFitTbzk=;
  b=PSDBk0DMYXiQkwPb86W2YDK+O3qFqp3pmALVrK3Jpj8Rn6B0gFttG4T4
   S1kT5EH5cKUJtQGh87tKdHiChFLN9qby1/yBtdJ6BreEZgjQHvXoxdgl+
   nXgQY2ZR7LPmeZZ1z+t6he5TkK+cZI5jkgSKMLCzJqAvBVLA30fmOTCJh
   CrW21aALTV9bN12rPepftdv7ZNAXvvOXZaS1eVvXbyLbErd4fTocdiJ4G
   4Jr2Nahe1y1J+uzpEEeRNsURcrfHJR7VrN/z3zH8IoBIOZDsJmnhjkxsr
   1lN9BF7QyeRvqkjvw88SfQgBKrv60+GThDGvHVFkjet/+mvrXEU8kBacL
   g==;
X-CSE-ConnectionGUID: TNp9Npm/RZ69hMmBECrxOw==
X-CSE-MsgGUID: QNK2ubntT4WkXQVHQMcX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440416"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440416"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:18 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 577C2492
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:15 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 07555102095F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 148B91800B81;
	Wed, 15 Jul 2026 10:40:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/44] python3-pymodbus: upgrade 3.13.1 -> 3.14.0
Date: Wed, 15 Jul 2026 18:38:55 +0800
Message-ID: <20260715103914.2120-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128198

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Remove self signed certificate from production.
- Correct inequality in validation error message
- Fix non-deterministic convert_from_registers
- Fix swapped SimDevice in ModbusDeviceContext
- Update CI actions and pyproject.
- Add ruff format check to ci.yml
- Remove 'useless-suppression' pylint
- Format test_client.py with ruff
- Update clean_workflows CI (node@20 problem).
- Ruff format (due to ruff upgrade).
- Fix ModbusServerContext initialization with dict devices parameter
- Support configured ASCII input delimiter
- Fix default no-response behavior for force listen only
- Use correct format character for DataType.REGISTERS 'h' -> 'H'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.13.1.bb => python3-pymodbus_3.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.13.1.bb => python3-pymodbus_3.14.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.13.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.14.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.13.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.14.0.bb
index 041898ffc8..7923b14b82 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "7a74ea0a4eb4895f518b34de32915ba4fde216576e09deaf735a279a9281af4f"
+SRC_URI[sha256sum] = "f1f486ec45b77b7565c5168c9609e244a4a6428d386f3cff56eb85a2297cd10c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


