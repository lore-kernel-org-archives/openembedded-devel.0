Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED564CD5BAC
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 09:29:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13261.1779442168037308862
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T880oIeF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779442168; x=1810978168;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Go63m8IIOGeQl/C0eTETNmXSh1d0NuyHrkzc4ITOMy8=;
  b=T880oIeFMDOIGAJX2AAtMnpxLzqLc/7QUQ2+L4xjBSOpi2DErEjx5ZTJ
   ZWyASflv5XaiO1WJCneieVeOK8XtIoU3nMX/pvkpINIxIffDwK0JJ7oX8
   Ft/WE7K4/94WrvVyEdQ10ikxPfVtub8wnxWobCe32rQgLZSkTcOSQuMwO
   MEE6fUOIyvnO6capXVqJB4RCQejEGvBfBlUznBVxmJmq6GjURQhQ2wdt3
   xfeAlIkKbGP36E5brXrtHMix+IpXbKbIVOOC1cbNmBHA46xqFlXMshp0D
   y+mNgmeVf2SejxKOS0o81QGdcuR2RmPn/YIKrkMFdpLRVhDdjj5I888Qo
   Q==;
X-CSE-ConnectionGUID: +toK1cjJTlekRJ9ONZiRzA==
X-CSE-MsgGUID: sfZUmLuVRh6Yu69t0eWwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="229456054"
X-IronPort-AV: E=Sophos;i="6.24,162,1774278000"; 
   d="scan'208";a="229456054"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 18:29:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1043A2BB5
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:29:26 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BE5A3C0EEF8
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:29:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4E72D82172F;
	Fri, 22 May 2026 09:29:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-ldap: upgrade 3.4.5 -> 3.4.7
Date: Fri, 22 May 2026 17:29:20 +0800
Message-ID: <20260522092920.508-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127148

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
 .../python/{python3-ldap_3.4.5.bb => python3-ldap_3.4.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.5.bb => python3-ldap_3.4.7.bb} (91%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
similarity index 91%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
index 5a176b5208..cd7c675f27 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "python_ldap"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b2f6ef1c37fe2c6a5a85212efe71311ee21847766a7d45fcb711f3b270a5f79a"
+SRC_URI[sha256sum] = "bacd9fb680d20263d8570ade1cf234d90d281149a8beb4f079dd8f33f7613dc8"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
-- 
2.43.0


