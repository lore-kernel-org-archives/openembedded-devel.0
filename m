Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6CBCFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4286.1764669111694648950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YgMCAkst;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669111; x=1796205111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DmRoaZfUwhxg/gR3gf10JPaapgVcTEWjOJiR7z2IDac=;
  b=YgMCAkstjmvRvLXQZNrMutyhwX8bLeUXqrYAR8DC/Q4qhhIN7YPiUy/X
   OrosW0X5Wm2OVri8JapgNNfdT+GBjHpbtAFBZZEp20NkUW8jiMPOTDNLK
   55FeE8Kgm9EcQz24IYhzWeNug1RDAx1DPU5y+d8+8ElNSc3nIdNgDlqsj
   knflNDn7shITlko4dyM98g5x2/hdS9u5nmDa8/FVFaOKwbq4gpHiPK91s
   vX4XqDat0Dlardt87IUgt4bXWL5O7nttcEgfv3KL7huJLBCR42t0tiJ1J
   kcvYCDLqCGU1yzdNKaQkrG4rsX8HJinA8k88xWbGxPcx2tbqsTRnwVEMF
   g==;
X-CSE-ConnectionGUID: dHxo6dhcQYWf62PlSk+w2A==
X-CSE-MsgGUID: BGOj3IoJS6e4hjRhZ7UiwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200027970"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200027970"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:49 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 087E533CF
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:50 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B3B3EC0128F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4EB0B101A42C;
	Tue,  2 Dec 2025 09:51:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/25] microcom: upgrade 2023.09.0 -> 2025.11.0
Date: Tue,  2 Dec 2025 17:51:12 +0800
Message-ID: <20251202095132.652-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122238

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add -e switch to select an escape sequence other than Ctrl+\
- More portable TTY settings
- Better error and signal handling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../microcom/{microcom_2023.09.0.bb => microcom_2025.11.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/microcom/{microcom_2023.09.0.bb => microcom_2025.11.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/microcom/microcom_2023.09.0.bb b/meta-oe/recipes-devtools/microcom/microcom_2025.11.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/microcom/microcom_2023.09.0.bb
rename to meta-oe/recipes-devtools/microcom/microcom_2025.11.0.bb
index 73d434cba5..7f0154794d 100644
--- a/meta-oe/recipes-devtools/microcom/microcom_2023.09.0.bb
+++ b/meta-oe/recipes-devtools/microcom/microcom_2025.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9f7c009791eaa4b9ca90dc4c9538d24"
 
 SRC_URI = "https://github.com/pengutronix/microcom/releases/download/v${PV}/microcom-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef42184bb35c9762b3e9c70748696f7478efacad8412a88aaf2d9a6a500231a1"
+SRC_URI[sha256sum] = "b1d734a249d8613db7ca1f1bb2ec4e28a35234a60212d91e0c00cc22e9c67a39"
 
 UPSTREAM_CHECK_URI = "${HOMEPAGE}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


