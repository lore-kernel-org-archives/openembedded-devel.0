Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C19C4450C
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9496.1768994997850380093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RQz+TzX4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994998; x=1800530998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y6MuF7nKYkLol+VqQqU9LP0gcAG53D2ajyw9ZSmX3Nk=;
  b=RQz+TzX48xoPw/YX0yGAHP+PqwgTVvsx6tM+Xrew+i+pDlB6Tq0jh1PD
   zZUQqvNBxMgaWhnkOgT84IofLsqQ+tlzqwKuOXT7Q7DFy7VOHm4hqyBOp
   ygOeUlJJ5KLUyFzHRxtFt9rUmzFx8yKM0Aq0rqsGIO8gymTXVkPm/vBj1
   S/qLTVKgPc5P4F99pwwvYt1P8h6VGfuY9cCGHR5rsZWwV7ZJiUIENPF6H
   XB2VC76ff7qgW2UcKLxKiG/Y/0WKVyr8ReX0jxeMyBKYDbvBuc9TO20Fv
   PYptjePmPbjsrYDjnoa+ups8OFsz7wIbcwtUWMen0f6X77qUCSwswqvCW
   g==;
X-CSE-ConnectionGUID: CNaSLp5yQAeOw8SSRjy5Cg==
X-CSE-MsgGUID: 3ioBBuGQRIqeyg7MYeM0xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="227203767"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="227203767"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 50E461C00086
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:56 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EC1A31802AE8
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 65F311404866;
	Wed, 21 Jan 2026 11:29:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/30] python3-protobuf: upgrade 6.33.2 -> 6.33.4
Date: Wed, 21 Jan 2026 19:29:02 +0800
Message-ID: <20260121112921.857-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123702

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.4.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.4.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.4.bb
index d0ef7753b0..371f6c8705 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
+SRC_URI[sha256sum] = "dc2e61bca3b10470c1912d166fe0af67bfc20eb55971dcef8dfa48ce14f0ed91"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.43.0


