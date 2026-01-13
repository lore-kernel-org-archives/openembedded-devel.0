Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1796D25031
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55837.1768299868716396502
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QLga0IJP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299868; x=1799835868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bjsF1gOsN2U8pF2TeLp2YpLlx/lADXxgxeRcBkU6POg=;
  b=QLga0IJPE1dods/bQC+e1SERjsZpse2NOh8TlrZuUFCaizWtdhXtF+Bx
   ylIS+Dfjkf+WT2jRZ9TmtEQr/zJeIjdYc2dw4y4kh50TQ46rRcjmEulZx
   KRNs39MHQhiEwCFH3mSdZZj6dcgvbBcu5HhJkP6mqIeTdn4NHwrPu6/T8
   p41UWzpza87/k5faFXPdOI6WJzcVFD5Iw4rDHSLS1TY30jU2B6XuE1SFF
   ndvF9X6kxK1+gcsliYmYiEXMmAJ5iHweO3VosIV+NRnRnZ4RNo1xDtU7k
   NkH+Q1TFF7C4G//uAx/f4lOcz17byltBsEaYxjx6zUB1RRrPYii5N4rvQ
   A==;
X-CSE-ConnectionGUID: 4TVPYL3FTTScaukbS/XMhw==
X-CSE-MsgGUID: b3DqhBBnQr+oK1UWo5XsEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213580562"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213580562"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1DE9D1000349
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C552C100135E
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 197041019048;
	Tue, 13 Jan 2026 10:24:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/22] python3-alembic: upgrade 1.17.2 -> 1.18.0
Date: Tue, 13 Jan 2026 18:23:21 +0800
Message-ID: <20260113102334.605-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123415

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.17.2.bb => python3-alembic_1.18.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.17.2.bb => python3-alembic_1.18.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.18.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.18.0.bb
index 81bfdc64be..39038958f4 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.18.0.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "bbe9751705c5e0f14877f02d46c53d10885e377e3d90eda810a016f9baa19e8e"
+SRC_URI[sha256sum] = "0c4c03c927dc54d4c56821bdcc988652f4f63bf7b9017fd9d78d63f09fd22b48"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


