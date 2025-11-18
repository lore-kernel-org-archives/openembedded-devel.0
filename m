Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D70CED247
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8401.1763456944021594644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kaOsVBw9;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456944; x=1794992944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GvTdQQW9pznL+pMH6DFFcBiXutLUi9NcFvo3bSMxJD8=;
  b=kaOsVBw95QX204sWigaRMZ8fsvHAeoykasMmwJ+VyvA8Odt+MzfYIAsd
   tmSmwvHA8IqCuJ1a5Og+MB2L29AZYPml/ysQKU9JOLLcB7TTnoNwWx9LP
   Yop36pQTsyBwzDwwAZvLKrGn1cg88Belb/YzvhjmdmFIKZmKeqnj7AdW6
   P8zVnunkESf00vKVMWjp98gckZ+NR+N4jbZkDNRlBY2TEEu3azkLJDVSu
   mTCfEZdrxTO+9ua4xwfvr2AzuciQC8GtUrT2WOxnEh734oyV6MJAG2QIh
   42QjKc5++K1BQ5gSlrMidanInlSwY+bJbmDDdKaDq+5RTSMeL1fBMi1rd
   A==;
X-CSE-ConnectionGUID: Y8Huhxt4R1aKlwr1BLM/cQ==
X-CSE-MsgGUID: XdlTL3/CTcydQth8SKv37w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="198586266"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="198586266"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 516651002BB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0ACB014003D3
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A53BC1400096;
	Tue, 18 Nov 2025 09:08:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/29] libcpr: upgrade 1.12.0 -> 1.13.0
Date: Tue, 18 Nov 2025 17:08:23 +0800
Message-ID: <20251118090846.1484-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121817

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Implement support for CURLOPT_CAINFO_BLOB
- Added support for CURLOPT_SSLCERT_BLOB
- Refactor: Pass std::string_view by value instead of by const reference
- Add connection pool option (V3)
- fix: Calling empty callbacks
- fix: callback function pointer type mismatch in writeFunction
- 1.12.0 CI Fixes
- fix: Cmake config file
- fix: make is_same_v check constexpr in set_option_internal
- cpr::MultiPerform fixes - #1047 and #1186
- Bump actions/setup-python from 5 to 6
- Bump actions/checkout from 3 to 5
- Allow disabling PSL
- Make curl dependency management optional
- curl_container: allow calling GetContent without CurlHolder
- Bump stefanzweifel/git-auto-commit-action from 6 to 7
- Bump actions/upload-artifact from 4 to 5
- Bump actions/setup-python from 1 to 5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcpr/{libcpr_1.12.0.bb => libcpr_1.13.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libcpr/{libcpr_1.12.0.bb => libcpr_1.13.0.bb} (89%)

diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.12.0.bb b/meta-networking/recipes-support/libcpr/libcpr_1.13.0.bb
similarity index 89%
rename from meta-networking/recipes-support/libcpr/libcpr_1.12.0.bb
rename to meta-networking/recipes-support/libcpr/libcpr_1.13.0.bb
index 58da899081..04dda31770 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.12.0.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.13.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08beaae5deae1c43c065592da8f38095"
 
 DEPENDS = "curl openssl"
 
-SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=master"
-SRCREV = "da40186618909b1a7363d4e4495aa899c6e0eb75"
+SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "516cb3e5f4e38bede088f69fcf122c6089e38f00"
 
 
 inherit cmake
-- 
2.43.0


