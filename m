Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D99EA3C2A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:32:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128810.1775730759257866994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N+dC6fqs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730759; x=1807266759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DfaUdcQ/m8X5vyG0kKadFxyms8eREWxEhQB2omOoH+4=;
  b=N+dC6fqsz003izAZG2YIRrHP/m2bNQLYTTbMB5+YB9Zjs6tEPi6HDgsm
   ORBpkIk0jaBPgjS9Do01JzoIyiP+4UhPwFVnmlnQvXUjoLTeHpKS3f4EI
   GSkcjnvQ/JArCbiej2cdBQEU88aldRUkS94pYc6QO4OIlRzsHxKsTYWKp
   i3jbigmcGPeuCYfKEV9emUmZhkZV68RP5EeD/ZFz8riHlkILFthGMw1so
   dCgO+yoPyAharyBaw6yNPJ2n+kStmcyPqXouXbsb9NpVUgqOg/+wmPb5o
   opgZ3p4G8qyJ2MHPxhyXVIqE/3VAq+IcwKYBSg7ANHN82k4gWXTVgWyEj
   A==;
X-CSE-ConnectionGUID: Hx1xMqhXStGXl5NxTHZDBA==
X-CSE-MsgGUID: SkCe/G4jQ7yMcSpzd4aTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236386434"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236386434"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:37 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 48C65C00410
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:37 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F331E14003B1
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 7F79F4041C9;
	Thu,  9 Apr 2026 10:32:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/37] cryptsetup: upgrade 2.8.4 -> 2.8.6
Date: Thu,  9 Apr 2026 18:31:49 +0800
Message-ID: <20260409103223.1574-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126152

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.8.4.bb => cryptsetup_2.8.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.4.bb => cryptsetup_2.8.6.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
index 34755fc3ad..c74b7a1f35 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "443e46f8964c9acc780f455afbb8e23aa0e8ed7ec504cfc59e04f406fa1e8a83"
+SRC_URI[sha256sum] = "8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a"
 
 inherit autotools gettext pkgconfig
 
-- 
2.43.0


