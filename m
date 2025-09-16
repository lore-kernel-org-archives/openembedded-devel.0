Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ED6CAC5B2
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.15059.1758015726230917982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A05YUgqG;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015726; x=1789551726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KrIknkGqho081E5kHu23YIDQn9dOU3qBwF/fqF4acn8=;
  b=A05YUgqGi1lizf1V+a3VVh+wQ+DaDg3VApksGfvgAiinvkExqqdF/O1D
   01XH+z9jrGxf6T8bcJCA/T5J4EpTKhW/xIQrWDYfkawlXmgAa1wNn7bTF
   5g1tCbqe3XcQGH0zlF3ZfWLcdYQrO48d6nD9MAubQ2zIxVMA+kBQc7oYw
   xm6WS6vUulZjbzto9C3FznSYGahk1MSxecgFYIxz3uUtH3CmOkmqWuUn2
   aE1cA1hHM5efiHdXukQT69K+8ylv+aObxJEnGoIJYzPOisMaSKEwAeDED
   F/riJLEOraK1Htegh0uS5l8PbyV+faKoAk6w2zp3TIMLSa788ovzlEs5e
   A==;
X-CSE-ConnectionGUID: s9cqjF/wQNOYhkTYLDMSHA==
X-CSE-MsgGUID: nHOYS8k0S/K/cvUyamtHrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191918846"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191918846"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:05 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BD81B1446
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 737ACC00FF4
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id B741E1801556;
	Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 524281A0074;
	Tue, 16 Sep 2025 17:41:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/42] lldpd: upgrade 1.0.19 -> 1.0.20
Date: Tue, 16 Sep 2025 17:41:23 +0800
Message-ID: <20250916094152.1479-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119435

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.19.bb => lldpd_1.0.20.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.19.bb => lldpd_1.0.20.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.19.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.19.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
index f4c030f7ce..044f1e0745 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.19.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "f87df3163d5e5138da901d055b384009785d1eb50fdb17a2343910fcf30a997f"
+SRC_URI[sha256sum] = "61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.43.0


