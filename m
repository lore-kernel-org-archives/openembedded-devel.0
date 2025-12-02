Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEEDD116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 02:48:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9329.1764643729684180432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 18:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sWJMD8/t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764643729; x=1796179729;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AwsI5ByTks8nj+oIZ6+wsVcWupfRsx0S5OKKPJS3Xz4=;
  b=sWJMD8/tuRNQARiBm58aFWDYchDDyPF5TlymqJe0IHJCm3uoQ+h94cEz
   vaWosFMOMoSztGn6uRLm3+zq2cjBnGpNZR97G+EGHvwIMCAJvcuF7zn5/
   GWQAEfOmMFn6sfgjwcBqK9Qk06y4E9+LwbwTKrX8Vdhrb8wldb56CoG33
   fMn8R+ju7fDhkEB5MTQ/woUtSEcryBoujL4o8OP5jodt2Hp5ajVwY1pN1
   culARjjlfz7jHQ4cd5p6UOQzKw3fLA/CjkLxwsOpJuOa/DKfjFIOLxm1w
   AXtY1PA5Bbcht1Xyv8iZYR5dHPTWTnqr7EjZef/+dza8fBgIaqhdNWMFp
   g==;
X-CSE-ConnectionGUID: RHnorUX3RoifYH/d6xP3XQ==
X-CSE-MsgGUID: Pid7NCpYR1OOzXIvflNTbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="224973635"
X-IronPort-AV: E=Sophos;i="6.20,241,1758553200"; 
   d="scan'208";a="224973635"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 11:48:47 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CC2601002B94
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 02:48:47 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8546418002FA
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 02:48:47 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6D5A4100058A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 02:48:45 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-incremental: 24.7.2 -> 24.11.0
Date: Tue,  2 Dec 2025 10:48:41 +0800
Message-ID: <20251202024841.11893-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 02:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122228

Changelog: https://github.com/twisted/incremental/blob/trunk/NEWS.rst

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...3-incremental_24.7.2.bb => python3-incremental_24.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-incremental_24.7.2.bb => python3-incremental_24.11.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb b/meta-python/recipes-devtools/python/python3-incremental_24.11.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
rename to meta-python/recipes-devtools/python/python3-incremental_24.11.0.bb
index dc8ecb3302..296dd2d0b5 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_24.11.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/twisted/incremental"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
 
-SRC_URI[sha256sum] = "fb4f1d47ee60efe87d4f6f0ebb5f70b9760db2b2574c59c8e8912be4ebd464c9"
+SRC_URI[sha256sum] = "87d3480dbb083c1d736222511a8cf380012a8176c2456d01ef483242abbbcf8c"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta python_hatchling
 
 PACKAGE_BEFORE_PN = "\
     ${PN}-scripts \
-- 
2.43.0

