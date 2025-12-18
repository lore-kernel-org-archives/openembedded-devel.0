Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B297D6ACC7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37706.1766048658838900301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F+4UTiZM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048658; x=1797584658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=US0rme3YnnCODsAgyUE+Axx25TNPtE67+5+g5SUBPY8=;
  b=F+4UTiZMT8AGGjMUrrSmZZpzYXwq8KaGA6cthjWAtozpEOxVI3YXD5eh
   ltgyhIhfGHfRxDFdK0wob0TPPGcZMW+ioBrGFw2YT1g4fbvZOqkv1Zau7
   SJf/kGQUy1PXQ2LV4U1MFwUa1YWFcJ+9hh1n7BpIU/lk/rPk2hM6Zq6Po
   TLzlUvRapeq18LVe85hT/ayjLP1/FZQT5IN5Gu160YOvYp2wQjvkrumD+
   IyMtTb+Oxod7hYjIz1Rs5A8RNnZpzU//0jULElA8HIjyqSv7Rs3LX1mIC
   DcKg7Iquc8QcNpP2lJBcUtk/Zw4ZczfLZ+Lch1va1wkpaSRQtlM52OMVV
   g==;
X-CSE-ConnectionGUID: Piv4BD7iSmiBMzO5u/GDqA==
X-CSE-MsgGUID: kl2I0V/JT+2vdBeUL2HeNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223709722"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223709722"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:17 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 331B0820C28
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E2230C06BD8
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 68EF0101A427;
	Thu, 18 Dec 2025 09:04:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/20] python3-nanobind: upgrade 2.9.2 -> 2.10.2
Date: Thu, 18 Dec 2025 17:03:40 +0800
Message-ID: <20251218090346.735-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122748

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.9.2.bb => python3-nanobind_2.10.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.9.2.bb => python3-nanobind_2.10.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.10.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.10.2.bb
index cfbe9cea66..12b7ff5133 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.10.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "e7608472de99d375759814cab3e2c94aba3f9ec80e62cfef8ced495ca5c27d6e"
+SRC_URI[sha256sum] = "08509910ce6d1fadeed69cb0880d4d4fcb77739c6af9bd8fb4419391a3ca4c6b"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.43.0


