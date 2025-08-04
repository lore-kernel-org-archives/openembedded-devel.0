Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BE2CA0EC5
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13467.1754296436870096092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sTYx+jw9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296436; x=1785832436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U2zJEIuwh/hXekJ4WVk00WUhSzjEKi5qBInVQInk3cY=;
  b=sTYx+jw9RKV/KYqQiHLRrM0c6lq5GrghuGIuU6lSg03DIENtGpZiwG9Q
   K9ZfCKhD8s9y3qpBGBp4AdJIuPjGlgR34MHhMSsh4qoez52DfusiFv46a
   5msdb3OKdMs9+oRhoyu+raQcxmhjpcO4rMF2gd9N4dDpHAidbAqQ2SHWv
   /wA1z12Bijeep8/X2+wj2F+Je5d9sJvM8gt/RfzfTxup5fWoWiXrB2Vck
   OEqFYXI2qNrBwJvYSIJ74dU4YOdGTLNJR/WbeHkJWnZONh60U2aDfj5OT
   ePMRC0Q/c6/GIehxzl0Xduk2j6Mztl/cYVpTq1KMrfTRxcueDwYqX8liL
   w==;
X-CSE-ConnectionGUID: Ks7g6AzPQt+StUwvoA+LsQ==
X-CSE-MsgGUID: F9N7UDu5Tq+GnVPLW1bbPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="187235741"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="187235741"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:54 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2F7431002B97
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:55 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9A9E9844BF1
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC2941A0078;
	Mon,  4 Aug 2025 16:33:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/18] pv: upgrade 1.9.31 -> 1.9.34
Date: Mon,  4 Aug 2025 16:33:29 +0800
Message-ID: <20250804083340.1649-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118840

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/pv/{pv_1.9.31.bb => pv_1.9.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.9.31.bb => pv_1.9.34.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.9.31.bb b/meta-oe/recipes-support/pv/pv_1.9.34.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.9.31.bb
rename to meta-oe/recipes-support/pv/pv_1.9.34.bb
index 578012fcfd..b6e2c42812 100644
--- a/meta-oe/recipes-support/pv/pv_1.9.31.bb
+++ b/meta-oe/recipes-support/pv/pv_1.9.34.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "a35e92ec4ac0e8f380e8e840088167ae01014bfa008a3a9d6506b848079daedf"
+SRC_URI[sha256sum] = "c0626bed6cbef5006b53d3281e8e3ae4b2838729462b21eccf28140eefef6bb1"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


