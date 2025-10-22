Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EFECCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.4759.1761099760583395708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hx+UY/92;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099760; x=1792635760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ATx4HPWv2v81YSyaG2Bwu/1Ig92vd7mL7SsY254kXbE=;
  b=hx+UY/92rI0MHdQ9QgW6Z/ZmcuaT+4YhJKVV15g0WkxJJdEyzl9nQ/bO
   k+zg3ArQlj/rdOPZUsfYbNwXmCKRkUyP3FcU9VKQj1ZXndTiyZbfhxPKr
   gl7AQirvT5EWxFVASXwjXIf2qKh/v9Yl7svi0QdZI5sZDT0zC6D1ye0J2
   sQ5lWGdHw9qSbT8BLBo47KYAWDpSO5MFnTX1gQOP/k2fgU8VkyWfLvV8R
   kDU2939AkDTEZH4ckB5BGrg/ywOzZI88UC/4Rh9YePnTnM+1N+vmlhIUq
   rYijFvf3ZSMnKL9wtthoZEQvm/BlR9eUAdoX71qN11G9czLDhUDg1cjNe
   A==;
X-CSE-ConnectionGUID: i5Rla9J1TU6vbkQUOjzaKA==
X-CSE-MsgGUID: ckBIKuS1TlGe0FcS4k3T1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536209"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536209"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id AB440820707
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 63A0B140035D
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BD9B882C0DC;
	Wed, 22 Oct 2025 02:22:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/29] dash: upgrade 0.5.13 -> 0.5.13.1
Date: Wed, 22 Oct 2025 10:21:59 +0800
Message-ID: <20251022022227.226-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120850

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.13.bb => dash_0.5.13.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.13.bb => dash_0.5.13.1.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.13.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.1.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.13.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.1.bb
index bab2200bcc..7b4962f614 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.13.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7"
+SRC_URI[sha256sum] = "d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370"
 
 CVE_PRODUCT = "dash:dash"
 
-- 
2.43.0


