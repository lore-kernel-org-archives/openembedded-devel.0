Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C571CC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10176.1785820778759162413
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cUoc0zPZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820778; x=1817356778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b2IzHa4k9Y6mTMLetl1z0uB9gqYQhCFuleBjPwX5dUk=;
  b=cUoc0zPZh2C3CGgxK61bWL1tpUJlC3jbc3TrlOPK0nEeoUSbcJ5ADUK6
   eaSM73MNzdnJ/9HeBISF7Q4tI7aOVBIOyGWQycYzqaXte5x5F8dPaixi4
   4+VlAfUcRGiDHbzVmWmyYiNDrXDlwYpdyroO1pGOH7WFcEw986Q1AGVgD
   oIZms9Z7NvTc4TzyAXlkKbaBJ4G2xVDpLxziH0bu8fLg8Rq/LPcTjgQDo
   KdmGM/il0WUomawXo4I3YBKRJuPkoQiRyvXzoXKnqQ42SsCQhRcEIQkBM
   vJpDgHlud56NNqa8jkQTItX8MgcSxZlAnpSvZ2frDwVT5CO+YVdgrRISk
   A==;
X-CSE-ConnectionGUID: QXBZXnihREqAg9NggKWXxA==
X-CSE-MsgGUID: LsJCzF+3RYO4MqWABoKnCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249096143"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249096143"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:37 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3A47D1000368
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E5C3C101B16D
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 085131800122;
	Tue,  4 Aug 2026 05:19:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/28] tuna: upgrade 0.20 -> 0.21
Date: Tue,  4 Aug 2026 13:17:25 +0800
Message-ID: <20260804051726.1489-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128732

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/tuna/{tuna_0.20.bb => tuna_0.21.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/tuna/{tuna_0.20.bb => tuna_0.21.bb} (91%)

diff --git a/meta-python/recipes-extended/tuna/tuna_0.20.bb b/meta-python/recipes-extended/tuna/tuna_0.21.bb
similarity index 91%
rename from meta-python/recipes-extended/tuna/tuna_0.20.bb
rename to meta-python/recipes-extended/tuna/tuna_0.21.bb
index 044adeac71..ccdb305d88 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.20.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.21.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171d
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
 
-SRCREV = "596d92cac33e64ec9b0176401395e6a4abc2266a"
+SRCREV = "cb5593a2be9c26c8865f46bf29723c1ce93890aa"
 
 
 RDEPENDS:${PN} += " \
-- 
2.43.0


