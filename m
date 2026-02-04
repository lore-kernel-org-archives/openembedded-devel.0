Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD3CE83F1A
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:55:17 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18547.1770205402408588043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 03:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kQ2sN/sn;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3612; q=dns/txt;
  s=iport01; t=1770205402; x=1771415002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dr//l7SZKNk83+tusx4bn1J9cf34IzuqX5ysU/KScTY=;
  b=kQ2sN/snnMAQXeSt7zUb/DmWnIETtP6U8bZ8dMZQVsebDD2NfdESeBiF
   zpD/mqWEya0XT2RG+ZibROxWKzce48PdxRwUxM7xUiVell/QPBGT/OYMx
   khLaNHh7DpgyhCB2Ek6x4ZJT91NV3xynemdiJI2SUpjdsaBeAiUZNFR9s
   f0G6XpGwfOwkr9wGyqOi6OZYqQh4+x+/y5WnDEItV5dN0/IHDUVMbIJcS
   zwnVTT+xLyiSF7yt9qcNIl9nkPIOF0OIQ402OwY2ts1uQA3CVQzFAADCi
   FumfqZT1TJ4+d1juWhYVO/OHJWdJ5AmCalR1RVe9OJj+/au5DgYTVuk36
   g==;
X-CSE-ConnectionGUID: vPSKCewpSle5SssuFl9INA==
X-CSE-MsgGUID: ZNr9fTnXTw+Z4n8DZh8FKQ==
X-IPAS-Result: =?us-ascii?q?A0CVAwDnL4Np/5H/Ja1aglmCSA9xXkNJlksDgROdB4F/D?=
 =?us-ascii?q?wEBAQ89FAQBAYUHAo0VAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCcwMRsHSBe?=
 =?us-ascii?q?TOBAYMoAT8CQ0/bJgELFAGBOIU7iBdYGAGEeCcbG4FygRWCcnaBBYFcAQGIJ?=
 =?us-ascii?q?ASCIoEOgWheHBCRPUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBChsHB?=
 =?us-ascii?q?YFXh1EPiRF4c3lJAwsYDUgRLDcUGwQ+bgePD0SCMQGBDgEqAYIsHAEBkwcJk?=
 =?us-ascii?q?kaBNZ9ZCiiDdIwelToaM6prC5h7jgmWUIRogWg8gUcLB3AVgyIJSRkPjjiDa?=
 =?us-ascii?q?YF/glm7FCUyAjoCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:uVErd6vXjAnrwkMl/E6L42OPJ+fnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWjTO/fZZDP1LtxzYYrj8k0GuJaBx4BhSQFtpH1mH3gTgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jb9Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5N5MIkpD6
 uQjLD1QVQuYmsyykZOdY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3XejFfrl2cv6cf6GnIxws327/oWDbQUoLXFZ4Mzh/F/
 woq+UzLJAtLOuCZ+QaasUDwgL/jryOrdqErQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:Njv6Vq+/sfV3R38ThwRuk+DfI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdg7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AIYS6ZGiEp5t9xLKzf7dE+ZiUGDJubEXm71zdPFe?=
 =?us-ascii?q?DDWs0c6aOVHGUqYJCup87?=
X-Talos-MUID: 9a23:IjvUjAUaWfyonaPq/A3KnmBsCMFY37vtOhwLwbk0u5mqFhUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,272,1763424000"; 
   d="scan'208";a="658318151"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Feb 2026 11:43:21 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 39E4F180001E5;
	Wed,  4 Feb 2026 11:43:21 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id DB281CC12A6; Wed,  4 Feb 2026 03:43:18 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-oe] [scarthgap] [PATCH 2/2] php 8.2.29: Fix CVE-2025-14180
Date: Wed,  4 Feb 2026 03:43:01 -0800
Message-ID: <20260204114302.440004-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260204114302.440004-1-adongare@cisco.com>
References: <20260204114302.440004-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 13:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124126

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/php/php-src.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14180
Type: Security Fix
CVE: CVE-2025-14180
Score: 7.5
Patch: https://github.com/php/php-src/commit/5797b94652c3

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../php/php/CVE-2025-14180.patch              | 69 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_8.2.29.bb    |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
new file mode 100644
index 0000000000..110ba99b15
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
@@ -0,0 +1,69 @@
+From 86f18141dd016a7927083cc122c71f1a8877b414 Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sat, 11 Oct 2025 19:37:26 +0200
+Subject: [PATCH] Fix GHSA-8xr5-qppj-gvwj: PDO quoting result null deref
+
+CVE: CVE-2025-14180
+Upstream-Status: Backport [https://github.com/php/php-src/commit/5797b94652c3]
+
+(cherry picked from commit 5797b94652c366521bff55f8e1a26ed6188f31b8)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ ext/pdo/pdo_sql_parser.re                    |  6 +++++
+ ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt | 28 ++++++++++++++++++++
+ 2 files changed, 34 insertions(+)
+ create mode 100644 ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt
+
+diff --git a/ext/pdo/pdo_sql_parser.re b/ext/pdo/pdo_sql_parser.re
+index 6bb0837fb31..7f4721d12a6 100644
+--- a/ext/pdo/pdo_sql_parser.re
++++ b/ext/pdo/pdo_sql_parser.re
+@@ -287,6 +287,12 @@ safe:
+							}
+
+							plc->quoted = stmt->dbh->methods->quoter(stmt->dbh, buf, param_type);
++							if (plc->quoted == NULL) {
++								/* bork */
++								ret = -1;
++								strncpy(stmt->error_code, stmt->dbh->error_code, 6);
++								goto clean_up;
++							}
+						}
+					}
+
+diff --git a/ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt b/ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt
+new file mode 100644
+index 00000000000..736354cab13
+--- /dev/null
++++ b/ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt
+@@ -0,0 +1,28 @@
++--TEST--
++#GHSA-8xr5-qppj-gvwj: NULL Pointer Derefernce for failed user input quoting
++--EXTENSIONS--
++pdo
++pdo_pgsql
++--SKIPIF--
++<?php
++require_once dirname(__FILE__) . '/../../../ext/pdo/tests/pdo_test.inc';
++require_once dirname(__FILE__) . '/config.inc';
++PDOTest::skip();
++?>
++--FILE--
++<?php
++require_once dirname(__FILE__) . '/../../../ext/pdo/tests/pdo_test.inc';
++require_once dirname(__FILE__) . '/config.inc';
++$db = PDOTest::test_factory(dirname(__FILE__) . '/common.phpt');
++$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
++$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
++
++$sql = "SELECT * FROM users where username = :username";
++$stmt = $db->prepare($sql);
++
++$p1 = "alice\x99";
++var_dump($stmt->execute(['username' => $p1]));
++
++?>
++--EXPECT--
++bool(false)
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/php/php_8.2.29.bb b/meta-oe/recipes-devtools/php/php_8.2.29.bb
index aa2244ce96..08e7e80c84 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.29.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
            file://CVE-2025-14177.patch \
            file://CVE-2025-14178.patch \
+           file://CVE-2025-14180.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.44.1


