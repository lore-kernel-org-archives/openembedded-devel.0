Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F30CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.15058.1758015726070597579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R/rceqQ2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015731; x=1789551731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uTMVpz1O8IuCVeyoGJnt5jhjSID3z081QWoOtxXyeFc=;
  b=R/rceqQ2augK7f+HM4Y+pI6YkkzF01PdD6qwF6KsLMlnBSeDrpVZd2LJ
   MllX8TrJ6qPN4dqrMD1dTqT1eiT+jkZM3NQ5XYBAf29GGKPaakZ5x64cm
   76XXwD+NR4Ktogv1tahAoRagZr8ioyPR5gALZ2MR8B11c+/K6eMTMe+J3
   K1+sX+gYsGK2Wa/0UDwyO/bbxgqW2IqYuzUzNAoej3r/DGK9SsikHQUP8
   s9K1FXgdRWpSz0MD1vUyPz3yUEhDIiOnSGNFHJs7sHUt/evzpm7BG17Re
   rsAEv+SaMPJ1HuhbOIEZNfebNRmVmqtmUAn8do29n1qrWph6fGKu8ubff
   Q==;
X-CSE-ConnectionGUID: XAN/VCwDSTqo8xqRaeaeKw==
X-CSE-MsgGUID: Uxp7fX+YQb2Id5f+0jTyWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191834349"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191834349"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 72CA4C000AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2C2A88D6FA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 6FB3A2005D31;
	Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8EE11A0069;
	Tue, 16 Sep 2025 17:42:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/42] python3-pymongo: upgrade 4.14.1 -> 4.15.0
Date: Tue, 16 Sep 2025 17:41:39 +0800
Message-ID: <20250916094152.1479-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119449

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.14.1.bb => python3-pymongo_4.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.14.1.bb => python3-pymongo_4.15.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.14.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.15.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.14.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.15.0.bb
index 197c31835f..608df4a24d 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.15.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d78f5b0b569f4320e2485599d89b088aa6d750aad17cc98fd81a323b544ed3d0"
+SRC_URI[sha256sum] = "430a6dc088355209e5755f77d85ddea2f1da0bb6123185952a573e7cf25a250a"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


