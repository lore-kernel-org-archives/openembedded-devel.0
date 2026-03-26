Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5A810A3D6B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46423.1774526252335136448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Td4X3bXJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526258; x=1806062258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cSqicLAgZmgF8MwDVV5kyK1GAnFFLzamHcnJJ3kVXpQ=;
  b=Td4X3bXJA//QGI3EM6z66m8FJ00l8c0l1LFdklWIuanFsoeAN6HhPJ6R
   I5WmNuhvuX1PTJdWYefLM3BIhOscUB39j+K2EY0goe9ApG/IY58BpMjHD
   ydJVsP7PNKzp3UnbVavuPK7lJoiuVAjFZoCUkt5KJyI4e0UwXSa24d2AT
   87K88Q+wr4F4vl6XHKRYu2u34kEUX1Bja/fwUVb9IdMsGTVe/GGnw2tzD
   h9Q0lLIQ7DCJTYSTaqtHGdodj3LL9+AgUBezCYGbmIGgF5QJhEbQ+N3yB
   8PKmufM/n/stALzcij2uYROP+cHGcOIg/4zd+firdXTvFaHqMgFWqRF7e
   w==;
X-CSE-ConnectionGUID: ypusqk4HQFqkKbh3CPsLTw==
X-CSE-MsgGUID: ofPv4mieSxKecx3QGSnCfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718881"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718881"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:37 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EB74EC00423
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:36 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A635814003C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 48F9E180714B;
	Thu, 26 Mar 2026 11:57:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/63] python3-icu: upgrade 2.16.1 -> 2.16.2
Date: Thu, 26 Mar 2026 19:56:05 +0800
Message-ID: <20260326115634.1199-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125690

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-icu_2.16.1.bb => python3-icu_2.16.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.16.1.bb => python3-icu_2.16.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
index 44d8b9a701..bfc37c2763 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
@@ -10,7 +10,7 @@ DEPENDS += "icu"
 PYPI_PACKAGE = "pyicu"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "cafdc2bc6cfbb4b6e511dedeff37316f902af900993b576116b8243f4ad6478c"
+SRC_URI[sha256sum] = "006d51e24b5ec76df6ec2130f3dde269c51db8b8cfebb7d45a427dde0d10aa52"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.43.0


