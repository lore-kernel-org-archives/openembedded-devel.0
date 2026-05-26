Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA52CD5BD2
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 10:22:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33890.1779790941060545023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2026 03:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g80CqPQ8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779790941; x=1811326941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rH9NbQCAlFtn0JhVcOqkCKZzJ3b+u/rwb81itG4i/j0=;
  b=g80CqPQ8dJlLFxryz/iSWDrlMeuvirtJHD1pCdO8ch1VX4TuTaqMNSyJ
   HN0AQ6JpM5FoEfy7uP5yxf/iWvH1U56SIgfpoAHcO+fn5o2AFmfzchhAF
   UZqc3AjXkklzo42D0G/pJG+tiMH5KR34srQnTOpbx8r4J9b4Aon38TuBD
   wrG9etPq2LvHtsZzPJzmL3I/rU4Bq4XgToXKTz2d6nEuTYjkFEYSHp6ed
   GHhK1PuV6TA41BN4xgoI/a4aw8FBRM+bE562JN/W2OZTSysX4y3ExlJln
   SUnpFgFW7Hjw7fJBYzq/qZu2GqQSnidaHwODOhZmVLnKIqzF76Px5qCX8
   g==;
X-CSE-ConnectionGUID: dtDnDGFxT7mE47XnPqvdpg==
X-CSE-MsgGUID: 2FHDT5pBSu2FQNP7mDYAHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="241306115"
X-IronPort-AV: E=Sophos;i="6.24,169,1774278000"; 
   d="scan'208";a="241306115"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:22:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 45B0C1002BAE
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 10:22:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EAF5E832849
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 10:22:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D8BC1101E506;
	Tue, 26 May 2026 10:22:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-simplejson: Use pep517-backend Fixes
Date: Tue, 26 May 2026 18:22:13 +0800
Message-ID: <20260526102213.1914-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 10:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127204

From: Wang Mingyu <wangmy@fujitsu.com>

QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
index 0579513a96..3f7ecf7696 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
 SRC_URI[sha256sum] = "c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd5ba79f"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-io \
-- 
2.43.0


