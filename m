Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A251ED7BA5
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15851.1776163183639976075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fGsh/3Ni;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163184; x=1807699184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sA3fLFHSiX+vmq6kF+lsBoGfqZ9HjHh81BT6rRdxs/4=;
  b=fGsh/3NiCZzR/V5oaLXLLL94xSz4ulXfZv6JzXGEaMbL4XOKo5ucUjjt
   TM4sV6YPj4eM6lMy7xGZyRGxEgbpUgjMHMdXiL5/ufwnd4S1UWWCsqt9P
   6zCMIniZYuWCmPhImkXReVfiyrh/7yYrRfEizmFdq8xUdj1jIvYBvoAvu
   WfYSlmHaSIMO64vIZQvHMS7w4QKDJJu6AymdBCV4NiBED6VGgXc6tJjk6
   GpiwQZkXShfs/SYQV1VMOxBZdX3O1CgIbfCs/Q2mtmVPM2b47k/KmH4wI
   jOosHGzn/iOmKYlAkJfl+u1wZ1ylNNptM3zWaoD8HylOuqiiTvdApVWmq
   w==;
X-CSE-ConnectionGUID: MSElQ4mSQvuCyjTNaw+onw==
X-CSE-MsgGUID: fhfZCW/CSTeXd5U//YFoOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236867021"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236867021"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:43 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 286F01C00086
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:42 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C7EDC1C0CAE6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2EC2214000E2;
	Tue, 14 Apr 2026 10:39:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/32] graphviz: upgrade 14.1.4 -> 14.1.5
Date: Tue, 14 Apr 2026 18:38:20 +0800
Message-ID: <20260414103845.1728-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126311

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.1.4.bb => graphviz_14.1.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.1.4.bb => graphviz_14.1.5.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.5.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.1.5.bb
index a5f08d0c85..388de9b452 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.5.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "043877c0857d8d46067cd2f18809d54fc876c399f0ecd438f60ea7f4d8037451"
+SRC_URI[sha256sum] = "b017378835f7ca12f1a3f1db5c338d7e7af16b284b7007ad73ccec960c1b45b3"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


