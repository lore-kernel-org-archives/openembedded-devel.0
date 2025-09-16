Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B412ECAC5AB
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.15426.1758015730002344236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PoJQRLIh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015732; x=1789551732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9SGaXT47LiiV/J3mw2AeBZXJpL8fBrrt9HOQ/b/bnY=;
  b=PoJQRLIhrsLqec/vIMffXbj4CROHouR7HSjnuEGUsaSqFvra565/etB1
   VzxXKAINf7QBZSKyeahdcioiL/aXTKOFVDhFLGPas2zBpgAKdLwRG9Jwd
   9Xd+X0PjEOFHgb+AIrVEwU7gwo9falDT+5PVMs8Kr/zZPp/MSlTe3jRf9
   Ez/qtC41td9Aw5ZZBPPQk0oeMwa0T99L2S4DoBP91IAgEeeRxI8630jN6
   t5N+BsC2LYCUKjGu19e4azppu0dgag2Dgrq8qjl142taYIFfC1l4guNgK
   nTwKqnUGCxEbKEmwjJWvJsjlRrYMxluMqxu/fLMoOuzYcw1EMuB8f0hxW
   Q==;
X-CSE-ConnectionGUID: Y6lNwzpPQ4qvvzW5v6HoSg==
X-CSE-MsgGUID: WgYTuBDZSy287BrE3z/Hrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213031810"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213031810"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:10 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 054CC1000344
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B53B9100038E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 0A72C1801556;
	Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96EB01A0087;
	Tue, 16 Sep 2025 17:42:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/42] python3-pymodbus: upgrade 3.11.1 -> 3.11.2
Date: Tue, 16 Sep 2025 17:41:38 +0800
Message-ID: <20250916094152.1479-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119451

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.11.1.bb => python3-pymodbus_3.11.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.1.bb => python3-pymodbus_3.11.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.11.2.bb
index 7641c1ac5b..4872f5b088 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "e738178d0ac5063f095d61be37422ac4105faab19fbacea9eb5a574e8e2b3122"
+SRC_URI[sha256sum] = "132712baf79cae339aac694739b14551bab69b2a078570cb1350b1db0cccdba7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


