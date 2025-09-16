Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D03ACAC5B8
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.15424.1758015725877264872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Of5aCpU8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015727; x=1789551727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nQpX5p64ROltJAJkHSdMZAk7Gy78AK9YLL3XkHLdWng=;
  b=Of5aCpU8DA8Hp4k0naMYmYKSIluDZRTAlSU5bdVkpaul+nd0RtgInTkE
   kVuX7D4JZuul2UxocQZ3v79p1B/+IosLMjdyzORMqO2oMvEscsXt6El9e
   5a+xn8eqDv7NPJFGLtJ9gfc0e6LbcvJ2Yi821joSq4BTrLrpHXKmLuASH
   7vcCtzrPDBFoMZmQMAsbtZmhJRJ2zquIDb2TcvlcDpNvTfkYLiltC76bL
   oDGhXMJw5iRVdJMgF2+SRcwLwhgvPPQAlgbIgULaaaeJ+tZvn5Hfnd54o
   6ilAQiGX67YtdCkO+Tbc8/tqkgQ6P2fRVHWKrFBTUKHUFPWoRJG5mAKo+
   Q==;
X-CSE-ConnectionGUID: i7wVioEjT+eICBUYCWRNhQ==
X-CSE-MsgGUID: 0ikPs29tSeKT57VLiUygtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212320885"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212320885"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C916C1C0008D
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 823D81C00115
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 2CA7720017EE;
	Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A39BC1A0078;
	Tue, 16 Sep 2025 17:41:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/42] lvm2: upgrade 2.03.34 -> 2.03.35
Date: Tue, 16 Sep 2025 17:41:24 +0800
Message-ID: <20250916094152.1479-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119439

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2e623df45d..c4c5974460 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "f6abf8abe2bf8493806ed549e92fcc8d41ed8dfb"
-PV = "2.03.34"
+SRCREV = "38c1124a478fa3889c649338b6e8ccdc0370e201"
+PV = "2.03.35"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


