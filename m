Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AD31112265
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7103.1775096140965546978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QeyCe3Jk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096144; x=1806632144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1joY69MJl4XJMamkUjU9byPfw6I2fmIhsgIgltvwpH0=;
  b=QeyCe3JkJYEqTPLLsB3CNcUWKyHcl0UumJT8BrQKwJUfqJQmlbqc0q1Y
   1n7Au3HsXGMvKH8PZVKYzMvxDCOPeh+Fcwv8jmg0JMSgfnT8smxwdWuwX
   IzyDvDiallsVp5xQW+MkWQ4CanWrglrnpGxmXVQaSQtAz8AYa7Yd8x9tp
   tBj/+mVWXsJ952kW2bbXCOb5eCD2ni4Ou040aUgTpQOjzDOY62m5cEfkC
   IgVzJNaII7l4EZG+5RFSM6k8pofJ2iXMSHAJvpyPB83Ipbu0l08gmzOeU
   EnHQf0x2VTTt/9Vq07h5qZgiNTenVegRMQKj7CTfQ8ECsI+rrOoi4KloR
   w==;
X-CSE-ConnectionGUID: 0ECjlqcPQ0qPpHHfSOyOZg==
X-CSE-MsgGUID: yvbNKGbDQrGzznbQFIkM4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="239868189"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="239868189"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 17382820C1B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:43 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C585D18578C2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6F9EA100008A;
	Thu,  2 Apr 2026 02:15:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/39] python3-eth-utils: upgrade 5.3.1 -> 6.0.0
Date: Thu,  2 Apr 2026 10:13:38 +0800
Message-ID: <20260402021355.1324-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125938

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_5.3.1.bb => python3-eth-utils_6.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_5.3.1.bb => python3-eth-utils_6.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.3.1.bb b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eth-utils_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
index 481e5081c9..36d787746e 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
 
-SRC_URI[sha256sum] = "c94e2d2abd024a9a42023b4ddc1c645814ff3d6a737b33d5cfd890ebf159c2d1"
+SRC_URI[sha256sum] = "eb54b2f82dd300d3142c49a89da195e823f5e5284d43203593f87c67bad92a96"
 
 PYPI_PACKAGE = "eth_utils"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


