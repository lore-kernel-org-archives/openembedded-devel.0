Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4FAC4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:11 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3423.1784112007481183342
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LDtezk9Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112008; x=1815648008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LcBkagtUwDuGAQaLYt9g4zP2G2SmcfVJRxypx25R0Q4=;
  b=LDtezk9Y+/tzZ2obgELd4d3h+beV5VoxZcPHqPAAFVBDjjIMj9tPyxB5
   1RA9dENGPRcNIKeLBemzL4nAoibNi+x4XINOiC0fakxQgVD5SJHO06Ctu
   NDJLPFkQsvGJ6eBPymzYE55tFlvts+93PbHJm79QjzLvlHXi40UADw6HF
   hLII7jZ4H9XFllyQDjhT+1jABn2qKhx4XV0hklxFTyatjAYcQKuZPw5i/
   k94ikVu+EBCTTyxe1o5C/AlHsc/PL9NOeiSvwaTePUioHyeZk+/Mg95Da
   nOvgr+lh8yc5qFkBDChu/GUnHP40j2/J7GNNRnvDz239l/mYvC0wQptt4
   w==;
X-CSE-ConnectionGUID: /PmHqzF3Rmm4gD9C7ekO9Q==
X-CSE-MsgGUID: mv264gXtTO+cjDrkqJ7vvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247513110"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247513110"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D078E100014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7DFE71C00167
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 83EA71802731;
	Wed, 15 Jul 2026 10:40:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/44] python3-discovery: upgrade 1.4.3 -> 1.4.4
Date: Wed, 15 Jul 2026 18:38:49 +0800
Message-ID: <20260715103914.2120-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128192

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix(spec): discover debug (Py_DEBUG) interpreters like python3.13-dbg

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-discovery_1.4.3.bb => python3-discovery_1.4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.4.3.bb => python3-discovery_1.4.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.4.3.bb b/meta-python/recipes-devtools/python/python3-discovery_1.4.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.4.4.bb
index 05920f16a5..d026dbb25c 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "ad57d7045a862460d4a235986c33f13ed707d3aeb9153fa47eb7dfd0d4673289"
+SRC_URI[sha256sum] = "5cad33982d412c1f3ffb8f9ca4ea292c9680bca3942451d30b69c37fce53a4a3"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


