Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932C7EFD238
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41960.1772012325326454299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nGMJXvcQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012323; x=1803548323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DNZLD4QauY18A1LcwSDYE6hjk7fJG8WMdhTUyzZ5XH4=;
  b=nGMJXvcQrQ8XMlrdHABCe6m/13dveSIV6BGYb6+nQrAn8qJhHaGYynk8
   OJKcOlkw5odBwly+DNhR05+3/JkmNfpMKVXW4IDMkVhjjlCzxOrbYxXsj
   EgQGCaSHuS1k1OjW/zm1jL2WivDTRPH+zs6BcA2NsYXDZ3qO4GHK6t+iC
   LKHXsw+AmeRs4oK1Ds94rHL9YkI6nsTQMCQSLlEAw+IB0vVUDuDUkT1oy
   N1KES4kHPYzEcXxLcwu4so5wFSKTMABbk22mU3+MDaB8MmSRzWi3ZXxdx
   A5r27S1kyLPEGdHz16zKSMzwV8cyWifBLrIXcpe+TpqnFdIYJmWrKbVgw
   w==;
X-CSE-ConnectionGUID: +PQt160JT7ixPgmwisvCOQ==
X-CSE-MsgGUID: 3YrrEwGES3uL+LJslbSAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209984610"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209984610"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 9C4631C000A8
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4E745180199B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 811C7101BB70;
	Wed, 25 Feb 2026 09:38:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/33] python3-asyncinotify: upgrade 4.3.2 -> 4.4.0
Date: Wed, 25 Feb 2026 17:37:25 +0800
Message-ID: <20260225093727.1284-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124643

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for FreeBSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.3.2.bb => python3-asyncinotify_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.3.2.bb => python3-asyncinotify_4.4.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.3.2.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.4.0.bb
index 810a142fac..115e88cedf 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "3321deedc443c8402229a423623d3ae2fc17c433b9b9bfe170828ee0c7ea3871"
+SRC_URI[sha256sum] = "438bdc0715f4f959e6e0af70e76cea198b4e28e5933c7cbf1e9987b50394afb3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


