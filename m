Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645D6CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:36 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12745.1762847725999345469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NlqV02nm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847726; x=1794383726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HmUxvpUf7cjxH6oL8+2+a5GJBnRiEKkEYx/L0e8+B/0=;
  b=NlqV02nmQ8ZEaQBbEEhCED7xp5vP5Dp3gjUpjnjhZ759sEqHZgxLIkTD
   3CDhBjsae1l4s6leYHbyr+cKC/GPzKKxQ6EbWLUUgkyp39PrX9jQoYtjb
   JmB0tb5iWgWWz+uydfRTQn5LEdJZdj5F9kWqwkVHwSQtsaBOxeNiYabvf
   8bQ7GqVlPpgKxzsqenlTRC2TKW/KltDr87FhdTAnYsuL1XewUadwW8unI
   RpY4RbOBh9tc5N3O2itT31UNEzsfCT3NHBH/vpxmYbFok6lQxyDx5YKNG
   0WqzsdmtuwUGMnZIUCAnGfqsxaIVmjoKjkS6pEQctKLT7A+x7SA6jUHeZ
   g==;
X-CSE-ConnectionGUID: V4P+MzA9R5KGnbmf2N0/lA==
X-CSE-MsgGUID: pLt+daioS46kfDXb6jvPPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218846163"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218846163"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1337D1561
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:24 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C0E4B18019A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 53A6D1800D76;
	Tue, 11 Nov 2025 07:55:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/23] bats: upgrade 1.12.0 -> 1.13.0
Date: Tue, 11 Nov 2025 15:54:55 +0800
Message-ID: <20251111075517.1650-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121480

From: Wang Mingyu <wangmy@fujitsu.com>

Added
========
- use the syntax parser directive to declare the Dockerfile syntax version
- Negative test filtering via --negative-filter - tests matching the filter are excluded
- fail-fast flag --abort to stop test suite execution on first failure

Fixed:
========
- unset output, stderr, lines, stderr_lines at the start of run to avoid crosstalk
- between successive invocations
- junit:
  XML escape fully removes ANSI sequences, e.g. color codes, cursor movements
  fix retried tests being listed multiple times
  fix crash when setup_suite fails
- remove deprecated windows runner
- renamed docker-compose.yml to compose.yaml
- bats_test_function: don't require --tags to be sorted
- fix BATS_TEST_TIMEOUT
- not stopping processes under run
- prolonging skipped tests

Documentation:
===============
- moved 3rd-party libraries list into wiki

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/bats/{bats_1.12.0.bb => bats_1.13.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.12.0.bb => bats_1.13.0.bb} (91%)

diff --git a/meta-oe/recipes-test/bats/bats_1.12.0.bb b/meta-oe/recipes-test/bats/bats_1.13.0.bb
similarity index 91%
rename from meta-oe/recipes-test/bats/bats_1.12.0.bb
rename to meta-oe/recipes-test/bats/bats_1.13.0.bb
index 14a234c866..3545295a3c 100644
--- a/meta-oe/recipes-test/bats/bats_1.12.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.13.0.bb
@@ -6,11 +6,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
 SRC_URI = "\
-  git://github.com/bats-core/bats-core.git;branch=master;protocol=https \
+  git://github.com/bats-core/bats-core.git;branch=master;protocol=https;tag=v${PV} \
   "
 
-# v1.12.0
-SRCREV = "713504bc0224a19b3d7c7958c18dc07f64f54b44"
+# v1.13.0
+SRCREV = "3bca150ec86275d6d9d5a4fd7d48ab8b6c6f3d87"
 
 
 # Numerous scripts assume ${baselib} == lib, which is not true.
-- 
2.43.0


