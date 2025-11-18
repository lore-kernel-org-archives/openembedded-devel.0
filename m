Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA5ECED247
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8428.1763456954211998662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LE+ojTjz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456954; x=1794992954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=83ZBhgoGoDKi71Ojgw0RtnGzR4Uun2dNLHoSzYKzDTs=;
  b=LE+ojTjzOwiA8AGB7+KjWePyLyyVoK8A2xgPZcZK1RnFZCL38wS4exC9
   XQ6DsHk8WYLuEMJ9JxoK3V+wY0BvNn8O+FODyPjJ+lx0aDUkPKRetqo68
   R588BopUu4tDffWZFKc86ICTvwZ3yk4aIG0PBpZXeP0u7rUmhjp7kdoBD
   73dYxGlcoQOM7BU9OKHhvbrdHj3Xu+SBaPWFYQpfWybCZ6Y2iGRVuFD+r
   ucbO740yldAeqc4F++AxjXWW6KvZVEqfOC4ywWLzhMkFivgp1x+dnJ9Nw
   ZM/7Q6ncTxwi7WB82eZjCuhZh1LiYyLJcFg468TjyC+gLtP12sSirQSlM
   w==;
X-CSE-ConnectionGUID: WE/Nzdf3Qi2Vsf+xXRPx5A==
X-CSE-MsgGUID: 7QvYce2aQtWDRmMsLejmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="207050188"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="207050188"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:12 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C480142A334
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 756471801983
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id DD03D140024E;
	Tue, 18 Nov 2025 09:09:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/29] pv: upgrade 1.10.0 -> 1.10.1
Date: Tue, 18 Nov 2025 17:08:29 +0800
Message-ID: <20251118090846.1484-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121823

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/pv/{pv_1.10.0.bb => pv_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.10.0.bb => pv_1.10.1.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.10.0.bb b/meta-oe/recipes-support/pv/pv_1.10.1.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.10.0.bb
rename to meta-oe/recipes-support/pv/pv_1.10.1.bb
index 347cca32f3..c3cf5e87e8 100644
--- a/meta-oe/recipes-support/pv/pv_1.10.0.bb
+++ b/meta-oe/recipes-support/pv/pv_1.10.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "998e717419c02ee735aea0b8d57f9cbe1112f40f4b947a39ba2611a415b64da0"
+SRC_URI[sha256sum] = "20d38794b00fa9384a1ddf9e395a8357a0782cd95c8b74cf1df8df6388950eec"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


