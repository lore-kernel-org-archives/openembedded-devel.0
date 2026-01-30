Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D3CD49C76
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:33:48 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6369.1769762023197590884
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JW+p9XoX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769762021; x=1801298021;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BVUhByTRjqHqnjWo82eTxwFkXmXgINbHfJE0ltKsoI0=;
  b=JW+p9XoXtVNs+exYYVJ3IQERoshrC/b0ZYNF5fQMJEWVs54nv2sLgQf5
   swAiN5K4V3YMLWdtW7c7/fcFnUIhFzOdZy4pmKobi0gD4t/gae+zVoncK
   i1/KiEWkflmWa4acnZEu81yUcb5jxD28m6layR880PXwPrnUQJBaPgG3c
   3DfoHs1/rhZxcKTpHyNa6imp4/dbPZpiz9KvAvfp4x+beg38QNKMhh3g6
   JHTiKpxWhBVjRzf8UGxdGzciPb93YyTlG6Gctrzr4rVT+V5du6JuUy5Ef
   eZhgyUJqdlGUH7ql20wgcRABUXSB//79lZrEjJb114R+dILjHKwYPm+KW
   Q==;
X-CSE-ConnectionGUID: ESJzNweDTuCw8jJb9OtO9g==
X-CSE-MsgGUID: PHcDKRZWRk+2maL2b8FhDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="215290622"
X-IronPort-AV: E=Sophos;i="6.21,262,1763391600"; 
   d="scan'208";a="215290622"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 17:33:36 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3634C1000340
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:38 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D9DC1C00203
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9B8181801926
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-pywbem: 1.7.3 -> 1.9.0
Date: Fri, 30 Jan 2026 16:33:31 +0800
Message-ID: <20260130083331.11298-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124004

Changelog:
  https://pywbem.readthedocs.io/en/1.9.0/changes.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-pywbem_1.7.3.bb => python3-pywbem_1.9.0.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.7.3.bb => python3-pywbem_1.9.0.bb} (89%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
similarity index 89%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
index 6857563079..c2fe5f9738 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
@@ -16,15 +16,16 @@ HOMEPAGE = "https://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "d1f0a2ebd4ffedef8d067af3855216db5190c7f6f27c8d2dcd467e09701c90b0"
+SRC_URI[sha256sum] = "65c1ff972cea2f017b06795f47c0ad7442f8434ff643a544050c10726704f6ab"
 
-inherit pypi setuptools3 update-alternatives
+inherit pypi python_setuptools_build_meta update-alternatives
 
 DEPENDS += " \
     python3-ply-native \
     python3-pyyaml-native \
     python3-six-native \
     python3-wheel-native \
+    python3-setuptools-scm-native \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.43.0


