Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C759E75442
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117715.1766567683859837999
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G98fri+K;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567687; x=1798103687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bJti7MwRGGN9swoP4f2UCyVE7uCJJv+JJ82jFZQGVaM=;
  b=G98fri+K/gNWaXpSpoWhOmYYT/P1QGCG2ZvNMFbSwK6C6njiMcAiVdtc
   xc169zVTMjRNZb0QfEBAoCvNB/4RfDtu/To9kBdzJkdfFwsjcWGfDYRAl
   Aqlw9oqPwF3BYIR7Qge2k9+aXk1YoSeEuoNhXKDTbBr2fnpq0oPBPy5KJ
   PMdb3bOB3BvQLZUNTfWAQ/NOssvYWiAhZrRJMvHqtd9T/QgtscDzA6iKm
   GCArXGPQm5D8dxEWf1Vm2BoGpRBnkTT+9qWfXa4mIU1Pqvb64xD3gd8j/
   8ei6O6vOVdNbUDp+/r+iQm+/0GpFP+EgtSBN8K9efKsI+O4VezuxDmvAa
   g==;
X-CSE-ConnectionGUID: tUyEk6ZkSBqTrF1I6TpvbQ==
X-CSE-MsgGUID: 3KXx8UtFT9u4U6NudkdUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="202625900"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="202625900"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9E79D1000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 548EDC01EDC
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9EEB82000766;
	Wed, 24 Dec 2025 09:14:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/28] python3-typer: upgrade 0.20.0 -> 0.20.1
Date: Wed, 24 Dec 2025 17:13:03 +0800
Message-ID: <20251224091304.974-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122877

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.20.0.bb => python3-typer_0.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.20.0.bb => python3-typer_0.20.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.20.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.20.1.bb
index f6be56cde3..d12b681dff 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.20.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "1aaf6494031793e4876fb0bacfa6a912b551cf43c1e63c800df8b1a866720c37"
+SRC_URI[sha256sum] = "68585eb1b01203689c4199bc440d6be616f0851e9f0eb41e4a778845c5a0fd5b"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


