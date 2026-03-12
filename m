Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F35D105A56D
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18783.1773312848257554060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BhH/6bt5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312846; x=1804848846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DGTNuaX8YIqZPB716VmMchyTfMGpZRMDbyHXitUikk8=;
  b=BhH/6bt5571ADlCqsGRTwWMa3Y1UbT/RwGq8evw9UirBEV2aBapGtWFl
   61ANCYAEspXP04t/rXN6RtNexm4CmdRtIwl7ZSL+IHe3JaKGvm7/0myum
   qwTY2lQ2RvTtxliA0ie+OrrtXrsktdzvj0YB/c8z1x9UcfuELhq3o5osB
   bGyoJSvmEsjBKiFBA4SbRISIerolkLscugvCf/xlQh2Wq8/rO7EozgHqX
   SwTgfsfsqga8PbYFgKlm7sDgFJ3Oin/hIwLV8xne+OgTW+rVps+Z7d3Rn
   HabsUJfnfa7fFKkRCpZAIoz1MXSGB2S7ovqrguPgPCFrzO6UcuDbK9TYM
   g==;
X-CSE-ConnectionGUID: mwruAo9RTfyKJsX3HAE9cA==
X-CSE-MsgGUID: qQ3XZ+RlQuGIjkVYZomQ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950555"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950555"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:54:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BEC4B3069
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:06 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6918E1C10085
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 868BB1801925;
	Thu, 12 Mar 2026 10:54:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/64] python3-pyephem: upgrade 4.2 -> 4.2.1
Date: Thu, 12 Mar 2026 18:52:03 +0800
Message-ID: <20260312105220.1856-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125147

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyephem_4.2.bb => python3-pyephem_4.2.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.2.bb => python3-pyephem_4.2.1.bb} (77%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.1.bb
similarity index 77%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.1.bb
index 0817bc732a..bc4267ac87 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://rhodesmill.org/pyephem/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] = "3c4fd64f453e8f40cf862420a70da95a71b6487ace75e8e0cf85d73707db6065"
+SRC_URI[sha256sum] = "920cb30369c79fde1088c2060d555ea5f8a50fdc80a9265832fd5bf195cf147f"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.43.0


