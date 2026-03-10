Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD56EA854C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:22:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35471.1773130948281609794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 01:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HZLnV9JZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773130947; x=1804666947;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BJjL6fc8yYOzZ8AMVuNuejs66x69Tl2IxQ06tXrCU9Q=;
  b=HZLnV9JZ8z6/PE47Wlod8k0SzUv+Q6kgTwH/kMRDTciOPy2qBEOKL9ig
   Msi+hGh2nVMri+jVJzFaKAPj+Eb85QeK7BZN1xpNflL7rXRG8yo6Ybm3p
   xpdVGbPEPLDwEzoUw5IVwyrEzrEzU7JpRhVlQCndS7/SHibFe4XOjkrCz
   KYLK9mTHRkbatGB9eoxZmNtuh096QfVwhXjmJ8VEj3r6xreRztSnRbDc8
   obLifZqc4FQotzPshB2iZSQH82T+CVSSOmBsBK0tevgh/dERUlMrzUBEa
   Gg5ifcQcX1YlzPLooI8dr7JmnHVhyptr3kfwVLXFbBu0K6Rzczeax4bL4
   Q==;
X-CSE-ConnectionGUID: 6ylVuH/5Q0SX0k6DURdYzQ==
X-CSE-MsgGUID: ZLpY7PA2RPiMLzMfn+f78w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="232081609"
X-IronPort-AV: E=Sophos;i="6.23,111,1770562800"; 
   d="scan'208";a="232081609"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:22:25 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 82E3F1C17354
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:26 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3371FC0119B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:26 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0304110005AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:23 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-redis: upgrade 5.2.1 -> 5.3.1
Date: Tue, 10 Mar 2026 16:22:18 +0800
Message-ID: <20260310082221.871-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125019

Allow newer PyJWT versions for branch 5.3

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/{python3-redis_5.2.1.bb => python3-redis_5.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.2.1.bb => python3-redis_5.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb b/meta-python/recipes-devtools/python/python3-redis_5.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.3.1.bb
index ba214f5869..d9ec47c0c7 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f"
+SRC_URI[sha256sum] = "ca49577a531ea64039b5a36db3d6cd1a0c7a60c34124d46924a45b956e8cf14c"
 
 inherit pypi setuptools3
 
-- 
2.43.0


