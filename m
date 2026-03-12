Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A01105A560
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:37 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18534.1773312816184070711
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k+nAQulh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312816; x=1804848816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VPo7geiwLJaqHwsKoi1CkemqRlBKw2A7IqzY77OEGEs=;
  b=k+nAQulhvJgGADab3xZbEVzyXoFUs8gQEmQCs3DUV816R7Yirh2JH2EQ
   0q3T45PlRNclEcUv7V6B4V/ihkN8ZUVdErSs1sTgOAuEUBB8WCYYxD1xZ
   Qyqs8m7Hzr6h75jxhxk1sgV2cYluY4WReu2sQ9s03UaCVDBvQXhVFXLKz
   mgOifS6U4Fhc0smGW6yKJYhiG1ezf1K3aT0kEo4wQZLtcwcSlKPfbJalp
   fGgGpgkMlTxZ3Qc5AMX9PEePDq1B19Ns8CNV4ZCbTvoLnTPQNroJnifyV
   ZbDTIjWvEGZF5gYnXMCENsfeJO2njIAhs64rqv/sL4YP7RD1mwr7tqlw7
   A==;
X-CSE-ConnectionGUID: yuBsxL/STjSMNMw7UujiyQ==
X-CSE-MsgGUID: YEDnkfSRT9eK8Kr3+ca8yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232954183"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232954183"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A65C03FFA
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:34 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5AED71001511
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7CBD618029A4;
	Thu, 12 Mar 2026 10:53:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/64] python3-configargparse: upgrade 1.7.1 -> 1.7.3
Date: Thu, 12 Mar 2026 18:51:48 +0800
Message-ID: <20260312105220.1856-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125132

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix TOML parser to read all matching sections instead of only the first
- Fix SyntaxError leak from ast.literal_eval in INI-style config parsers
- Fix -- separator, nargs=REMAINDER, and empty value handling
- Fix critical bugs and add Python 3.11+ tomllib support
- Remove dead comment-processing code in default config parser
- Add test status badge to README
- CI, linting, and test improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-configargparse_1.7.1.bb => python3-configargparse_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.7.1.bb => python3-configargparse_1.7.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.7.3.bb
index c056109c5a..6715abab3a 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "79c2ddae836a1e5914b71d58e4b9adbd9f7779d4e6351a637b7d2d9b6c46d3d9"
+SRC_URI[sha256sum] = "76dd1a51145fb7ca82621ee08cd38ec0c6316fe27a38b9137b75667d1116399e"
 
 PYPI_PACKAGE = "configargparse"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


