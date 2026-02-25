Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09501EFD219
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42033.1772012256497426779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J3XOywyZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012256; x=1803548256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v0xfak35PI3tG/eMNQKAxqulbEKaHQIaGJvCrDr8ig0=;
  b=J3XOywyZzUYtAxs1yMH+VHrXzRhtapiNmJ/OQ7DVAobU3kUQKWFTwcNg
   NjHG2HVUzW0VtGRPlcWR69+OJ3Rj1QRtpohbtxI5qpjW1gbolZd2QC42b
   I1OFKSkyMd6NBkWGWxhXQ10RQGansjX5FXD325rdifeinLF1EyVCUxGYV
   NYYgJbZGLM4HeVCS2sp21CpkNXpGa+WmNB9+w8oRyFx/B8KEQHJTE8KH9
   YakV5VYTF4/cbcMGQ/xMFHkLzU1N0BpK0cyIHl9hSzhmf6jyHgPFdtLCt
   2e/nrFwHxPQRXS8h8Dt6dIYcikxxUUNXa7j2FX4jPDNfI46efOieagoOm
   A==;
X-CSE-ConnectionGUID: u0WsRURnTlaEqJX2n7wb6g==
X-CSE-MsgGUID: boV3x10QQSGtIALJN7hPnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="231670362"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="231670362"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id C64FB100036A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 77F4F1C00121
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A7FCD101BB42;
	Wed, 25 Feb 2026 09:37:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/33] abseil-cpp: upgrade 20260107.0 -> 20260107.1
Date: Wed, 25 Feb 2026 17:36:55 +0800
Message-ID: <20260225093727.1284-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124613

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{abseil-cpp_20260107.0.bb => abseil-cpp_20260107.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20260107.0.bb => abseil-cpp_20260107.1.bb} (95%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
similarity index 95%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
index d4475ee73a..4f75ed605c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "4c124408da902be896a2f368042729655709db5e3004ec99f57e3e14439bc1b2"
+SRC_URI[sha256sum] = "4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195"
 
 UPSTREAM_CHECK_URI = "https://github.com/abseil/abseil-cpp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


