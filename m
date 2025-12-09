Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FECD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4223.1765274235421010096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EsI7Hf2Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274234; x=1796810234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Ijk2/ChGZFQRz43Qs6E4CF7nDK6aJ++9GegwQcTq5I=;
  b=EsI7Hf2Q7ZtiTM9STyf+6VBhMK/viRJRNbzR8HZH1u2eJ0AfziPA3pj1
   NjwzcmVcgV7wv3tMmXkNBPzqQBBtr6Eg/QpDoKAC4FbeaxsgEQuLqpN8v
   ss9cbGXVbso7JoiB5qBjWlGbDX9hb/9esF5tvmQyqnSU0DdXFV3P/60bB
   hAZ/mGE6T1QA2rj8FbArWJOWNLVGvnL8Ffk8fTTdc21rQYbOz1dNpeQ3z
   hwPLiS+aGH+ocrWJHPtWiTQbj8RylPSzwNX15WGDap86XdkjugYkMWv2b
   wi8kcwnMBo4WBEKb/3tP6w+L4BMrN3NeuoCN3fNNyNwZCuQL+Z5z+6GR1
   g==;
X-CSE-ConnectionGUID: 0u+StQsdQo6KcPJLnoPGDA==
X-CSE-MsgGUID: G5SUvDeDTsWcocwjAKbMGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="210560104"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="210560104"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:13 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 05F7C1000355
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:14 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B0701C006C6
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 45B3020002AF;
	Tue,  9 Dec 2025 09:57:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 35/38] syslog-ng: upgrade 4.8.2 -> 4.10.2
Date: Tue,  9 Dec 2025 17:55:49 +0800
Message-ID: <20251209095552.690-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122439

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../syslog-ng/{syslog-ng_4.8.2.bb => syslog-ng_4.10.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.8.2.bb => syslog-ng_4.10.2.bb} (98%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.10.2.bb
similarity index 98%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.10.2.bb
index 3d8570122b..c3b201c4a7 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.10.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "7d1ebe70746009dc06bd2fa5c412a1985579a9c887292f766cc775d169d60e68"
+SRC_URI[sha256sum] = "841503de6c2486e66fd08f0c62ac2568fc8ed1021297f855e8acd58ad7caff76"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/syslog-ng-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


