Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F232CA0FEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4678.1755766813635282172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ov8gt4xT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766813; x=1787302813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IJRFVHmjVmtLRR9PV0KN+K57w9anff0f02L9xDEMJpM=;
  b=Ov8gt4xTSr06JUN2eT8VNYeacfEUvT7bNYeQuIV/l8RouR0UEGLzeuDG
   rrFMttKTGImhhVkow3LPcUm1iN+hYkgaeIGNfNk4W7L+3O9lMEuNyK7c4
   T8he4JGvfaohw15FW465BkM6LFH+Ev37KKL/2nbVJLY1jvQNd976XbXF7
   BZyrFnNEZ+m447tyv8ka9Pk2Q9MFycmpRzyK7PBCROPg68zbHmdq3T8sH
   VgqzBi/m6YhvLjwQmGV+s+NrADgi4bgv730EWlwxXdf8OwAlkTl0lDs8j
   St5dgclcdDJRXTWfhq6I4ZYHzNhMu4C4/YyCAOefXq2SmhHawVOpzqbc9
   g==;
X-CSE-ConnectionGUID: QdJud7l3Tr6GhXMCcd+DOQ==
X-CSE-MsgGUID: q33sjdxBRH62O7pQQotNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210706580"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210706580"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 155F01002B96
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:12 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BF34C8606CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 95C1610023C2
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 036031A0087;
	Thu, 21 Aug 2025 17:00:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/21] python3-multidict: upgrade 6.6.3 -> 6.6.4
Date: Thu, 21 Aug 2025 16:59:40 +0800
Message-ID: <20250821085954.2056-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119057

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.6.3.bb => python3-multidict_6.6.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.6.3.bb => python3-multidict_6.6.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb b/meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
index 5b262ed933..dad669fd9c 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "dbd686f37c1bc14355dce9c16dbbfae82f11dc00"
+SRCREV = "e0e61c28e9f66efcdce01cde9d6772518f6e9224"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${UNPACKDIR}/python3-multidict-${PV}"
 
-- 
2.43.0


