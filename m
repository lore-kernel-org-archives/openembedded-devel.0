Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F53CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7005.1782378115146519404
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QIdhWLxq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378115; x=1813914115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QsRLOGnXLBe940X24y/DQDiaewwzGdXGSNlAB90uW0E=;
  b=QIdhWLxqcpriK5CoTMnKfRzz0w1bpQrY376KjyiI9v9mLGHOfazypKSs
   wnVUvrW9YYPmfWCdpXN2CMJguSg6QJnZ7CBkn3dG34++kHjQr3th6/Q4a
   NL/JC3tltOkQh/OAOaQ099lYTiGLm1gXDSdJdYFD2n74ZQqh3cFsw7FFV
   wVkQky6RM4Txhnoj8yO4Yq7uQnp5C9jqR6bet4KIlNokUtfGavGaOUlUr
   xBZY3Nz796bp1phnFI2S8X/pBx9o9WPfU5X4c3KIOhSmY2CwmX4PYCKb/
   R60EMNYpNPYGIW4OppFpyqAjnuv1wKKcO86Bzjnq+U8QUyVt/GkOr67qN
   A==;
X-CSE-ConnectionGUID: CB8JUDsMThqJNFNf31SM4w==
X-CSE-MsgGUID: wzJEmcfOTuKqiraWU4nD4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245302353"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245302353"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:53 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6AA421C1C704
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2175F186CC4B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2BE8E1017325;
	Thu, 25 Jun 2026 09:01:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/47] pugixml: upgrade 1.15 -> 1.16
Date: Thu, 25 Jun 2026 17:00:54 +0800
Message-ID: <20260625090127.1563-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127746

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright year updated to 1.16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pugixml/{pugixml_1.15.bb => pugixml_1.16.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.15.bb => pugixml_1.16.bb} (87%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.15.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.16.bb
similarity index 87%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.15.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.16.bb
index 457fa59435..919a462dce 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.15.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.16.bb
@@ -7,10 +7,10 @@ data-driven tree queries."
 HOMEPAGE = "https://pugixml.org/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=5dbb98bbc2e5051c26ce32508b4f703e"
+LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=cb8b47bf66620c2c9f2ec14f062f4490"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "655ade57fa703fb421c2eb9a0113b5064bddb145d415dd1f88c79353d90d511a"
+SRC_URI[sha256sum] = "4cee1ca4aad395170f4c7a07824f3bdd41f28316c6e1e1090a1425b278ec0b4b"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


