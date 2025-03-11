Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0659C35FFC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.4164.1741683327713565964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s7ej5gwW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683333; x=1773219333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jihNfXOqcBRpGe4ujQTX3UoxFMK2Bx/4isvnerv+dPM=;
  b=s7ej5gwW/XQ/nSsc1zq4vDPfLlQ0vh4fjq3aeT1rJUzI+wUP66i3bYDj
   7IGMDmAQ7wmXoAigNZhoROD2xK/nFiIzeW9MSEqc2vLpsYnALqfLFo8wp
   o7qh9yVmy3hPf7SLW1+LzUFLA8Ksk9r8pNigKvTva8em90fEZoNywEtS1
   uBWdPevVays3mczMMlnbhu7rf4Y4Yn1NwJTZ2ljIQdm4O7b4fHddbb8D6
   yAoPT1DV/2YO5K7TAyhgCB45firtAgr6byR2Anoo2pwU+04+BQpLPr3L2
   QEUE+UAgJLQXCnhh5U7ETdXFVXGtvhvAFoQ5VPDp7uhe7VMFweV7ijAvJ
   A==;
X-CSE-ConnectionGUID: eO+OHVrVRBib4QVwzEzRng==
X-CSE-MsgGUID: M/RxRcooRViyWA5HTGMBEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180034248"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180034248"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB31B96741
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BB0EC8BF5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 05E001A0071;
	Tue, 11 Mar 2025 16:55:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/36] python3-gspread: upgrade 6.1.4 -> 6.2.0
Date: Tue, 11 Mar 2025 16:54:54 +0800
Message-Id: <1741683310-8681-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115871

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add property expiry in gspread client
- Bump typing-extensions from 4.11.0 to 4.12.0
- Fix code block formatting typo in README
- ignore jinja CVE
- Type part of test suite utils
- Remove passing exception as args to super in APIError
- Bump mypy from 1.10.0 to 1.10.1
- Update advanced.rst
- Bump bandit from 1.7.8 to 1.7.9
- Bump flake8 from 7.0.0 to 7.1.0
- Bump typing-extensions from 4.12.0 to 4.12.2
- Bump mypy from 1.10.1 to 1.11.1
- Bump black from 24.4.2 to 24.8.0
- Bump flake8 from 7.1.0 to 7.1.1
- Fix docstring about BackOffHTTPClient
- Fix comment to reflect correct google-auth package version requirement
- Doc/community addons orm package
- fix: fix type annotation for default_blank
- Bump mypy from 1.11.1 to 1.11.2
- better handler API error parsing.
- Add test on receiving an invalid JSON in the APIError exception handler.
- [feature] Add 'expand_table' feature
- Bump bandit from 1.7.9 to 1.7.10
- Created a batch_merge function
- Added a range option to Worksheet.get_notes
- Documentation update for gspread.worksheet.Worksheet.get_all_records
- add example for batch_merge
- explicitly list exported package symbols

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.1.4.bb => python3-gspread_6.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.1.4.bb => python3-gspread_6.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.4.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.4.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.0.bb
index 9e74bd8de8..aa70c04760 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.4.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "b8eec27de7cadb338bb1b9f14a9be168372dee8965c0da32121816b5050ac1de"
+SRC_URI[sha256sum] = "bc3d02d1c39e0b40bfc8035b4fec407aa71a17f343fc81cc7e3f75bfa6555de6"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.43.0


