Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66D8E83F15
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:55:07 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18576.1770205407380982775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 03:43:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=USdwUBaz;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3536; q=dns/txt;
  s=iport01; t=1770205407; x=1771415007;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZiuuE6VZAaP/CuRnhu4c4MPt8IQvacKKebr+S7+4lzQ=;
  b=USdwUBazKDxNLOLzabIX8G0PwmrDV7mmJLLmvvxZfWTvc5S2thoa0oLi
   ykQuMfdRuMwGpkTM8phuxcZWOC3uaHQIrSc6l8AmH6JyMwYGNAHh7/xfI
   8MVwcY+yXhv7WNrHVqc5n8KQ8oOYrgnxqvNSVwJ8MsoDpMtxT0V/9uGgU
   zx6f97dFQhOReMV4nMJtMAB9di8Be2kI8o4OkD0G6YB6Wlkp+Y5xUM9YI
   dzPYyD1hZkR0lZSRrw2ISJaA8iM4650G8zH2bFLxPUg0MFN6ZD0RaClWz
   k9T4dLwVHxuO6Cps7yGS0QDjmU0KLW5nXiXgUuH4jl/D8Zv7rMw5RAH1f
   Q==;
X-CSE-ConnectionGUID: F2B6gyRvT1aNWgFQyf7mXA==
X-CSE-MsgGUID: /nDXTc8IS4uuTdQIFSUOUQ==
X-IPAS-Result: =?us-ascii?q?A0CQAwBZMINp/47/Ja1aglmCSA9xXkNJlkuBFp0HgX8PA?=
 =?us-ascii?q?QEBDz0UBAEBhQeNFwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECASoLARgBLSwDAQJaIyGDAgGCcwMRsHqBeTOBAYMoA?=
 =?us-ascii?q?T8CQ0/bJgELFAGBOIU7iBdYGAGEeCcbG4FygRWCcnaBBYFcAQGBJxuGYgSCI?=
 =?us-ascii?q?oEOgWheHBCRPUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBChsHBYFXh?=
 =?us-ascii?q?1EPiRF4c3lJAwsYDUgRLDcUGwQ+bgePD0SCMQEGdRMBKgF/BoEnHpMHkk+hD?=
 =?us-ascii?q?goog3SMHpU6GjOqawuYe44JllCEaIFoPIFHCwdwFYMiCUkZD44tCwuDXoF/g?=
 =?us-ascii?q?lm7FCUyAjoCBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:GjO/kaDvvuebJhVW/3niw5YqxClBgxIJ4kV8jS/XYbTApDpz1TQHy
 GYWDD/QOPvZajb1Ktkjb4u0pBwEuJLdx98yOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAX9h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7a9EUk4nB5Mko+9RPm5gz
 O0WdzU9R0XW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FIsgeaxaYCFJ7RmQ+0SmGqom
 mmW3l+lHwwmOOW+5wG41U+V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:xmRynK9ZxtmK7XQxLopuk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:KGejim6pd/h00YvN19ss2hQ+RM80SGPhlX72HECWMHdnF7ilYArF
X-Talos-MUID: =?us-ascii?q?9a23=3A4GIRAw52cFbGSozZJIT/6wZZxowv5YieNEtdsK5?=
 =?us-ascii?q?aptS4ORVRFQygqwmOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,272,1763424000"; 
   d="scan'208";a="659641285"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Feb 2026 11:43:17 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 8352F18000379;
	Wed,  4 Feb 2026 11:43:17 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 2A962CC12A6; Wed,  4 Feb 2026 03:43:16 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-oe] [scarthgap] [PATCH 1/2] php 8.2.29: Fix CVE-2025-14178
Date: Wed,  4 Feb 2026 03:43:00 -0800
Message-ID: <20260204114302.440004-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 13:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124125

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/php/php-src.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14178
Type: Security Fix
CVE: CVE-2025-14178
Score: 8.2
Patch: https://github.com/php/php-src/commit/c4268c15e361

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../php/php/CVE-2025-14178.patch              | 65 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_8.2.29.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
new file mode 100644
index 0000000000..46fa8679e8
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
@@ -0,0 +1,65 @@
+From a46c3692d37f8c539b3b00ea4ab7ebc2d7db5507 Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+ndossche@users.noreply.github.com>
+Date: Sun, 9 Nov 2025 13:23:11 +0100
+Subject: [PATCH] Fix GHSA-h96m-rvf9-jgm2
+
+CVE: CVE-2025-14178
+Upstream-Status: Backport [https://github.com/php/php-src/commit/c4268c15e361]
+
+(cherry picked from commit c4268c15e361ccd79289a3909f332ab2153f72e7)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ ext/standard/array.c                             |  7 ++++++-
+ .../tests/array/GHSA-h96m-rvf9-jgm2.phpt         | 16 ++++++++++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+ create mode 100644 ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt
+
+diff --git a/ext/standard/array.c b/ext/standard/array.c
+index a1a92934084..30b9a425b20 100644
+--- a/ext/standard/array.c
++++ b/ext/standard/array.c
+@@ -3903,7 +3903,7 @@ static zend_always_inline void php_array_merge_wrapper(INTERNAL_FUNCTION_PARAMET
+	int argc, i;
+	zval *src_entry;
+	HashTable *src, *dest;
+-	uint32_t count = 0;
++	uint64_t count = 0;
+
+	ZEND_PARSE_PARAMETERS_START(0, -1)
+		Z_PARAM_VARIADIC('+', args, argc)
+@@ -3923,6 +3923,11 @@ static zend_always_inline void php_array_merge_wrapper(INTERNAL_FUNCTION_PARAMET
+		count += zend_hash_num_elements(Z_ARRVAL_P(arg));
+	}
+
++	if (UNEXPECTED(count >= HT_MAX_SIZE)) {
++		zend_throw_error(NULL, "The total number of elements must be lower than %u", HT_MAX_SIZE);
++		RETURN_THROWS();
++	}
++
+	if (argc == 2) {
+		zval *ret = NULL;
+
+diff --git a/ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt b/ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt
+new file mode 100644
+index 00000000000..2e3e85357e1
+--- /dev/null
++++ b/ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt
+@@ -0,0 +1,16 @@
++--TEST--
++GHSA-h96m-rvf9-jgm2
++--FILE--
++<?php
++
++$power = 20; // Chosen to be well within a memory_limit
++$arr = range(0, 2**$power);
++try {
++    array_merge(...array_fill(0, 2**(32-$power), $arr));
++} catch (Error $e) {
++    echo $e->getMessage(), "\n";
++}
++
++?>
++--EXPECTF--
++The total number of elements must be lower than %d
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/php/php_8.2.29.bb b/meta-oe/recipes-devtools/php/php_8.2.29.bb
index 015d83c291..aa2244ce96 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.29.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0010-iconv-fix-detection.patch \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
            file://CVE-2025-14177.patch \
+           file://CVE-2025-14178.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.44.1


