Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D6AC44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4713.1783503926080871184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ih5WSJmx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503928; x=1815039928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4BE5CzeczKHzfnhQ4tBEA5Ipqc0R3xQJ2Vfw8DY6CPA=;
  b=ih5WSJmxPvhgxuJigZAdmepyx0fmIWeuArGP1zvnzpOB5AG2llBCyMrb
   54ygVRxmiodMCXEsEJNmvg4kdegF8FQNeohRgrmlclWkMMmnNQRdodUlZ
   EkRcLkNemccPXkmw6mOVqQV5FCwOG89DWwl0VYEOF8scsLSj5xp9817cS
   CfHh9z1gSfvBsLjVBrNPRfvUt8Mf7MDGY3WLoGyPNahwScoU5qBK9OLO8
   rY/Qsmpv3AFPqlry9KTFXwDdRrWutLNeqAhFnjoiOE8VoqbSgxxPa9SiU
   L25L/Zl84HJC0nufaWdGMfAkTzeZG/+xnfT5C9uSzAthUWO7DTx0MHjue
   A==;
X-CSE-ConnectionGUID: 2FtZVKCsRkapkqRRvVh1Pg==
X-CSE-MsgGUID: vXh+85H0S2+9AhEV64qrlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="244842940"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="244842940"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:26 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5B5B61C000F7
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:24 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 07F9C1C2DF56
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 25D7B1800C26;
	Wed,  8 Jul 2026 09:45:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 06/37] libio-compress-perl: upgrade 2.221 -> 2.223
Date: Wed,  8 Jul 2026 17:44:16 +0800
Message-ID: <20260708094508.2060-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128077

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix typo in Makefile.PL
* Compress::Raw::Zlib version 2.222 required--this is only version 2.221
  Update to version 2.223
* Tag `:constants` no longer exports all constants Fixes #78, #64
* Bump actions/checkout from 6 to 7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.221.bb => libio-compress-perl_2.223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.221.bb => libio-compress-perl_2.223.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.221.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.221.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
index 3a35cf53c7..523cacd5af 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.221.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b617
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "af42c9c9104adf7d772d255c0d9a404a3462ea45e7bc42d06da0a0b51de3d0ae"
+SRC_URI[sha256sum] = "c75095afb0e056db01daced032c7cfbbce350a14c613b9c8dba0c6fd4a47d7c3"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0


