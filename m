Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F73CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web01.960.1761696946068310950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kxRhQDeF;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696946; x=1793232946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2h5KokMQs/MVqgbWhjOMaSbbWc3wTB1/Jbd50T1XNAE=;
  b=kxRhQDeFX38Rx5gCjIpt9jlMDdQXE5/TtYjF/uftdqw08eNQgFKw72SD
   DHa9JVQfyrQmoOkdUgDRi1FjnvpQ49rqXipmLQivefs4/T+9gULVPRDPx
   B7ZOnco4hvAEI6Fb6VWYm9EBvXYfZhdk9ILrod7CNWV3ugLi4i6XtrP+O
   DBjBMCQlMMgYOi1wQvBgP1t+Rr59BiiM9HvDjDn3/uxNeE/m9XTmh7D3v
   cI47C0D8WT3JBBQD1SKe1JcVNi8Bn/p7QQZk0WHXnEsDtCkU3W6k8arnj
   dM2290RsFajlC/jXvRYfyYkKk9oFyN/Fak7kl/dwkLMNOw2/dG5rS4/SK
   g==;
X-CSE-ConnectionGUID: VcKyGwnPRByyTdsJ+LM+QA==
X-CSE-MsgGUID: 7BCEtemDQSuf71WDoknGJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196354357"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196354357"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9F2D61C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:44 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 56DEBC00D60
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id ADEC582C0FE;
	Wed, 29 Oct 2025 00:15:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/32] python3-grpcio-channelz: upgrade 1.75.1 -> 1.76.0
Date: Wed, 29 Oct 2025 08:14:48 +0800
Message-ID: <20251029001505.528-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121121

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.75.1.bb => python3-grpcio-channelz_1.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.75.1.bb => python3-grpcio-channelz_1.76.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb
index 173f22aded..921a9a251a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "e0caa06d4de3eb62d3fdc54e5c9dc9003aa3ee21e9c50f5d3538aea854d276f2"
+SRC_URI[sha256sum] = "2ab15ef7b2252a9ba31df500bbe295ce5310a8b01ea6f6d67a17172d914a41a8"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


