Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC8BEDB7ED
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 10:19:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78144.1775557172824030757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nRznAN0J;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775557171; x=1807093171;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t3PCIcN5iUgK6vsl9dgOanX0AgKqaalcvYnDUei6A+Y=;
  b=nRznAN0J42BW9ldBR7jydX/CMzmEsqUpXzj688Rsi0HVqQAuU3eMISV8
   nXR39hcyZnRfd92kmlnt2qz7yuhmAlfjsRAmEKewhskKaNnL3DHBZp144
   993Dtid4WB0qTJ+NRLN6IWHv3Nd6SrlPqyulsijXqmA+MnmXetka+Bsmu
   mCgMzDRtgDAOeI2PkCDCYUzwZTvEBKDnJC65/KPVEV7Vq9Wgq7bLJrjlL
   7vtLjYj6rnz6TMVqHKc/ksDvGtgqchZN120rcxMSLX8Fa2q9Vid2J/Pws
   wsrCRGVMkwL2sBdaLIQVIM+oFtlEjkIxpBbsbJYbnIwd0IEWSxgCVp4G/
   g==;
X-CSE-ConnectionGUID: SySXg7kYRZyEKW76WPxsjg==
X-CSE-MsgGUID: 1Yr0ypTPQCKalfShtkqEOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="224800787"
X-IronPort-AV: E=Sophos;i="6.23,165,1770562800"; 
   d="scan'208";a="224800787"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:19:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0B06742A325
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:19:31 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A2E721C00105
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:19:30 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 728DD18001E5
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:19:28 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-djangorestframework: upgrade 3.16.1 -> 3.17.1
Date: Tue,  7 Apr 2026 18:19:24 +0800
Message-ID: <20260407101924.21308-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 10:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126087

Changelog:
  https://www.django-rest-framework.org/community/release-notes/#deprecation-policy

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...mework_3.16.1.bb => python3-djangorestframework_3.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.16.1.bb => python3-djangorestframework_3.17.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.17.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.16.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.17.1.bb
index bcd079f328..42edd15156 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.17.1.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "166809528b1aced0a17dc66c24492af18049f2c9420dbd0be29422029cfc3ff7"
+SRC_URI[sha256sum] = "a6def5f447fe78ff853bff1d47a3c59bf38f5434b031780b351b0c73a62db1a5"
 
 PYPI_PACKAGE = "djangorestframework"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-django \
-- 
2.43.0


