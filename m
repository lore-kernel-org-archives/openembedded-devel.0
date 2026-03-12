Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC22105A576
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18785.1773312854696414769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SV8Al9WW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312854; x=1804848854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u6jz5ml1DtIzNKcCFfRlsPdTuYGk7K3thlweMQV4qT8=;
  b=SV8Al9WWxCPaByc0zFmZVozLN2AJEKTceF09od/M3kqXRux+zj9ueNg7
   Kwtya/o0fty0aiMJXXjcYcUqNEo9U3RrYnlHeLs7ro2YAX7bA6nufaXjq
   pL0QxAPyaWb7EjcCmotYDfRxNZr50zaz1diT8o6ThU8N/MGxMgWrDDKke
   tGpC1vHEZyn3qvD2n9dcZSBiE60UfV2Q7JkkUMhVHRvsGLtBm5iQ4Vt3W
   tEn3THywF9KDHc77yHA2gV+pBujq+t7R/aFvpJ7QAjAz4DiXBsRz8/buM
   qJIeHEJ4KQ78kmUagv45aw3e1iMNqPu41618qi+R1TesFJL29RZQ3gzVj
   g==;
X-CSE-ConnectionGUID: tqJMECdlR/mQF33XmIpuqg==
X-CSE-MsgGUID: 5E7ZLcDbTCeq5y1/R0dBjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824420"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824420"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:54:13 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 333AA42A317
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:13 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D08FC1C0CAE4
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id ED5131802EDB;
	Thu, 12 Mar 2026 10:54:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/64] python3-regex: upgrade 2026.2.19 -> 2026.2.28
Date: Thu, 12 Mar 2026 18:52:06 +0800
Message-ID: <20260312105220.1856-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125150

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Replaced atomic operations with mutex on pattern object for free-threaded Python.
- PR #598: Fix race condition in storage caching with atomic operations.
- Replaced use of PyUnicode_GET_LENGTH with PyUnicode_GetLength.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.2.19.bb => python3-regex_2026.2.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.2.19.bb => python3-regex_2026.2.28.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.2.19.bb b/meta-python/recipes-devtools/python/python3-regex_2026.2.28.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.2.19.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.2.28.bb
index 2bdf0bd254..4ad0eadc98 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.2.19.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.2.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6fb8cb09b10e38f3ae17cc6dc04a1df77762bd0351b6ba9041438e7cc85ec310"
+SRC_URI[sha256sum] = "a729e47d418ea11d03469f321aaf67cdee8954cde3ff2cf8403ab87951ad10f2"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


