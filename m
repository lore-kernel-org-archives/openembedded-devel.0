Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF84CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.11093.1760433601992762230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gnpBxFs4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433603; x=1791969603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/pgeLfBa7Vr03E4CpgXLhXjJO5ztEFj59xWhsToiK8=;
  b=gnpBxFs4+kytDBQKoeQaLDs1wCZeSxDHOz2DOeaW8cFrn4VzjErirgCd
   vSUnT1L0jZ2JFx97b2iztnsGD8tWQPGRg595IdB975FqF8l+MuF+t061E
   XrL7o9Z20yudTz5j/gUGwRfgUD1zejVtM4/emOxZLQ2rchkN42rsPLzao
   Pr0jbUYLO4FCq+/3EwWUUhIzSdr4Hr90vigu9JvasFwLZIqddtwRNsv7o
   Bwu+RMOI/JkRLj0oSGfhBRRyqPsb8Wm8OKncP2hZadnxPlizGyht7WWga
   hqGjxEqrUQFEBXQ5Sq2imzlossH9HZfSuP7Uut0gvWSDhplW+TpTkLKyE
   w==;
X-CSE-ConnectionGUID: 2HUXsaEESeqELjOeDXipRg==
X-CSE-MsgGUID: eooUCH/vS8Stzeqe7i6hjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215229843"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215229843"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7BEAA1C0008E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1A2231000104
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 986CB101BB7B;
	Tue, 14 Oct 2025 09:19:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/44] pv: upgrade 1.9.34 -> 1.9.42
Date: Tue, 14 Oct 2025 17:18:58 +0800
Message-ID: <20251014091927.493-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120572

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/pv/{pv_1.9.34.bb => pv_1.9.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.9.34.bb => pv_1.9.42.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.9.34.bb b/meta-oe/recipes-support/pv/pv_1.9.42.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.9.34.bb
rename to meta-oe/recipes-support/pv/pv_1.9.42.bb
index b6e2c42812..f60460c025 100644
--- a/meta-oe/recipes-support/pv/pv_1.9.34.bb
+++ b/meta-oe/recipes-support/pv/pv_1.9.42.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "c0626bed6cbef5006b53d3281e8e3ae4b2838729462b21eccf28140eefef6bb1"
+SRC_URI[sha256sum] = "fbd7d1b04efee62c8241255a3fe1c5f5236f1a6e1ed85f02730b0c6448810175"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


