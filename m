Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5CDFD7F8B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92759.1772187336528821947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K8j2iaN1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187338; x=1803723338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NjbZevP4a6QizDfHzatp24hlJJPfIlT7zrWkLJalnMM=;
  b=K8j2iaN1xeC2C0Njt/NFqg/o7ue5qs0T8UaHtU8FNcwy9h8fHb7A8Urd
   Pw1AbML047XZbHyNIKe4jkORkiBq9PW/S9W/G9VHZNW0Z/PVwlNbrSKvA
   5wGyJypKEMkaHLRB+tp+CSxYB5F6Av34fgFkgjU4/z2p+QLahzaXOXv2S
   dX5y4bjjDMjphr2QzaMtoPl07R2z68MzvcfZwm8odXOFtNKkrQ1ZZCp1P
   Zlzc3wlPE6sNLW71D/rBDaDWVGI60PY1AGDPAHfgksCvdVu//UAaBRU7v
   TmotSVMyA7CHoNHx8+bt2dHqiJKXk95rEA+dMdB2FNbf9DdxoPvTPudxn
   g==;
X-CSE-ConnectionGUID: e7dTdBwXSgyNF+qdYmlUPw==
X-CSE-MsgGUID: qTDHfj3WR7m5bdJUxZ18sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231300042"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231300042"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4FB851C000B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0235D18041BC
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 222DF18005CE;
	Fri, 27 Feb 2026 10:15:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 47/52] valijson: upgrade 1.0.6 -> 1.1.0
Date: Fri, 27 Feb 2026 18:13:22 +0800
Message-ID: <20260227101327.1432-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124747

From: Wang Mingyu <wangmy@fujitsu.com>

Issues fixed in this release:
-----------------------------
Update bundle.sh to include regex.hpp
Fix copy-paste error message
Ensure nlohmann/json non-finite floats are interpreted as null when validating
Ensure tests are built in oss-fuzz build

Other changes include:
----------------------
Added support for JSON pointer paths in validation errors
Added a validation benchmark example
Added design and architecture docs
Removed compatibility shim for std::optional

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_1.0.6.bb => valijson_1.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.6.bb => valijson_1.1.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb b/meta-oe/recipes-devtools/valijson/valijson_1.1.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.1.0.bb
index 4e5f02746c..b7e45c3057 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4edda758546436462da479bb8c8514f8a95c35ad"
+SRCREV = "b12841e3fa23a8cc477179face0a5ce5f80b64ab"
 
 
 inherit cmake
-- 
2.43.0


