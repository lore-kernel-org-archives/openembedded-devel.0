Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E338C71144
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.77954.1749526430938462080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nxgZeZfz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526436; x=1781062436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rHyPm0cc+hn1PFVtW7CcC3XsH1wJX2DBXeCD3T4qIyM=;
  b=nxgZeZfzfjFp/aawu+83epz9MKo9CtYgj9RDVXzYxdndFfkoTmTaN7bq
   0YZYMUK5+FDuurxNe50DeaVSBEXjKqMZDjg2gUSvnZ5kVWoFuVQkIjZcu
   19nZiE4CMVuLzaF5Wy09YVi7l/U1x5XDNLtBijXPJAtblR4SbAPho0r4D
   UL51gZXqVhLr/egxnM8CsykzJp5tnOtNuq1DWNnUPkjh40Mi8eTCAc3Ne
   XpanwEgERM23ZihXUt0Sypwy/HltAFlJG4EXRqmiAv3e/hjPUvdOhReCz
   +a+k9CZ316caqpGaStLw9TRr6p1xdHQCMVoGxD/jH17jrCGJqKmJA3Sdh
   g==;
X-CSE-ConnectionGUID: qpMjLt+fSiCJIZ3IRMq5PQ==
X-CSE-MsgGUID: gtLuJuNkRxqVu3Bge0lLcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190206654"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190206654"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B704E495E
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E7555BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 79A841A0071;
	Tue, 10 Jun 2025 11:33:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/64] python3-scikit-build-core: upgrade 0.11.3 -> 0.11.4
Date: Tue, 10 Jun 2025 11:33:17 +0800
Message-ID: <20250610033330.924-51-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117841

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Fixes:
- Typo in license-files
- Fix dynamic-metadata iteration (only affected GraalPy)
- Better abiflags implementation, uses ABIFLAGS on 3.14+, supports GraalPy
- File API commandFragments is optional
- Add python -m scikit_build_core printout and a few CLI issues
- Add some platform info to logging

Internal:
- Explicit mypy ignores
- Adjust typing to be ready for next mypy release

Documentation:
- Refactor the documentation to use single-line summaries

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...build-core_0.11.3.bb => python3-scikit-build-core_0.11.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.11.3.bb => python3-scikit-build-core_0.11.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.3.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.3.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.4.bb
index 134bb3aeac..d1b2fde166 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.4.bb
@@ -10,6 +10,6 @@ DEPENDS = "python3-hatch-vcs-native"
 inherit pypi python_hatchling
 
 SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
-SRC_URI[sha256sum] = "74baf7cbc089f8621cc0646d9c5679034d5be1b014c10912dc32a4bcd1092506"
+SRC_URI[sha256sum] = "5b194bbb04092ae327d294b23e4bbffb6181adce4259440a86c9cf6abb8eaa6c"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


