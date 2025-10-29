Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B56CCF9F3
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web01.960.1761696946068310950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tHst3AOa;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696947; x=1793232947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fp7tL1S3V63EKQ2YutKU+kuNockjFS+crGkCMKA6/aA=;
  b=tHst3AOak1M7FdR0fdwi9+0kT8LekK2buAHHAXR7TANaoj3857MdMSN0
   DzDBOuptcLzEGvUrYqJ40YLfBQRNJ23NsPlkB2i5Y3qrNRVhZqzniuuM7
   hVhoyh2V0EX3JCukxMI/LodafriHse+zk78CFGqwO+wsYgr6Icjqexn3M
   MLwnYtG0abI8wGbJ3tWJ33I6wQW/bR3vQBOf4msxHSLJ9NyGXhxv6ChYh
   2RSmqYWGOgssIQTG8uE02fNtNLfmSPgPYEmxKHH1wLiNeo8HvwMf179iK
   JDdDLxefDlZ3LTVBkm+ajx5iEn4Es8RMU47EQ1tBDcgTDSk5tyRc1P+LM
   A==;
X-CSE-ConnectionGUID: lit7aTCZSFmMqeZohVXx7w==
X-CSE-MsgGUID: 1V38g7t9SuuStjmlkxUPBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196354360"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196354360"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B19551C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:46 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 655F2C000A8
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B884F82C0FC;
	Wed, 29 Oct 2025 00:15:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/32] python3-grpcio-reflection: upgrade 1.75.1 -> 1.76.0
Date: Wed, 29 Oct 2025 08:14:49 +0800
Message-ID: <20251029001505.528-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121122

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.75.1.bb => python3-grpcio-reflection_1.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.75.1.bb => python3-grpcio-reflection_1.76.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb
index 5e64a3d617..e03fd3e818 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "2be3f20b7b93e6e691a0bc761fd7e9996a940b4c96c68f6ca4f7fbc47c3f4b64"
+SRC_URI[sha256sum] = "e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


