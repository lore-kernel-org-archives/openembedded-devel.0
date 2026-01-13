Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1602D0C826
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56069.1768299871157903321
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rgt+Ke+z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299871; x=1799835871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eK5jhB91uEU0XfW7SOxgQRA5BOeMiWNdYCrdH8rjz4U=;
  b=rgt+Ke+zm050oToZ6afO1G7CdKZSY4gYgIMRrU5RoWODHEAiiklUeYq6
   90AVPFF2IfN37WnPFiPXX+kqL4QNEWTBayM+cb4Pi/KfypS+q6JG1V5Q9
   g0lvrtNjUAELUV8mSvIUstsGx/OwAWaaeC2Y0vOF6TM1+/BoCHrEtT8oK
   GUX7zE3AUQC9IWmX/TQovTN7EfYCobUWu5FN7mZoQHWHEHD5Qu++wRDtw
   TfcQR8ipFSf4pyPIS2tti01IJjuYDSr40U7qTk/SFow12m0rVPW1EpALW
   mbr0V5pO3WcVQO8hTASXsr5aYgwoauadPD5kQcUi5cVwO2j7A9wRlqrI+
   A==;
X-CSE-ConnectionGUID: KVBOpqAKQOeNBhCr0VtQAQ==
X-CSE-MsgGUID: K/0deZhdQN+6o2+AEUya0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204468494"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204468494"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6DF321C00094
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 17F1C1C00151
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 236411019046;
	Tue, 13 Jan 2026 10:24:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/22] python3-filelock: upgrade 3.20.2 -> 3.20.3
Date: Tue, 13 Jan 2026 18:23:22 +0800
Message-ID: <20260113102334.605-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123416

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix TOCTOU symlink vulnerability in SoftFileLock

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.20.2.bb => python3-filelock_3.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.2.bb => python3-filelock_3.20.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
index 2a0af552b6..4499b220bd 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
@@ -6,7 +6,7 @@ LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64"
+SRC_URI[sha256sum] = "18c57ee915c7ec61cff0ecf7f0f869936c7c30191bb0cf406f1341778d0834e1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


