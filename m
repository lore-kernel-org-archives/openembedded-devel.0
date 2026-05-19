Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50091CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19029.1779190790925853936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sz2836Ti;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190804; x=1810726804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KtX/+vJM82PkwA/lV3ZtxAx7TJwo/21lQTJmVduFyUA=;
  b=sz2836TiXj2I4T/Sk8ZYZZ+srob+kulyDrJHJ5ahgEnPe3k9JiQPPL1g
   J03mens+yXBJWWl45E2wRdvMkSYHlzJHtcNR2nz/+CCDW4gj4hf1Si/J4
   lltOChflBPrmg10Vsf9aOSLC0c1FYSWIc0FjqfUJvkwIw/f3NnT/IpgaV
   ElATKGotxOamuqNlBQ0QMJLBKLekxL/el4pY5WCSvbLTrn62UK5ZAmfkz
   yqTiG44BqSNCv9OxOLu9g2djt+EKXzM8szkC9UWpwNcTUNAv0EbZ3SS+I
   ANP/ThuMf8tqw7ooWXyT+wVdbeLVzGd4XndRXk0l9QD34l98IVOcKJkYT
   A==;
X-CSE-ConnectionGUID: tptPOqzUS5u+5gORjVHiyg==
X-CSE-MsgGUID: lAuUTRzQSpS80+eXJ8UOqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995188"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995188"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D4223100035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 82DA01C00147
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 05CA6405EC8;
	Tue, 19 May 2026 11:40:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/38] python3-ldap: upgrade 3.4.5 -> 3.4.6
Date: Tue, 19 May 2026 19:39:01 +0800
Message-ID: <20260519113921.655-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127080

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- attrlist parameter is now properly checked before use, avoiding memory
  errors due to type mismatches
- Fixed errors with requestName/requestValue in extop.dds
- ldif and ldap.schema modules now actively close sockets as they're
  finished with them

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ldap_3.4.5.bb => python3-ldap_3.4.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.5.bb => python3-ldap_3.4.6.bb} (91%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.6.bb
similarity index 91%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.6.bb
index 5a176b5208..3c56dea31d 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.6.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "python_ldap"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b2f6ef1c37fe2c6a5a85212efe71311ee21847766a7d45fcb711f3b270a5f79a"
+SRC_URI[sha256sum] = "83d6b65c7cbe627d81e556d0d03f3f450e3ac35ba9c1b6011f0097ac92effeb1"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
-- 
2.43.0


