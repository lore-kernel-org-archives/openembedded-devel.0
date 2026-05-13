Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A12CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:08:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96.1778645331340455501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fqfCdi/9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645331; x=1810181331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q8BnBz/+KzmI+yMlzimG11rL1n/Eya8o5TyaACA0ezo=;
  b=fqfCdi/9iNxnKS1MB9atmN1Ubkjyh8hJcPdbiPOnt2MHbYgchAYVwHcC
   XNOZqYVzS2moL8fsjclFQ9a/3likFVXoymTz0a5wlrVcAtERmlCKE4Dpm
   BMoU/uHR2gOXJYX2HF4ml9ouE3TGvaBPZyYRWucTrJNVKSG4eJDk1BFMa
   CepHg6/qEmW8cWwsd2uhZfS3q8n+KTLKYxYjliocUu6d714HBInQDv6uc
   zsr4sJwjdiWul/Wd8A1HQw2UJ/sdZSgnK1rVIdzLFw7bNIecVLuqpCD58
   VKTWx8hbEW0hjLz/p4YKTnoaxTsyF5yuYxENZJ/HW2SAt5sTVft2ehlCX
   w==;
X-CSE-ConnectionGUID: WpKbGD/oSG6lQOzoe9q75w==
X-CSE-MsgGUID: wI/DsQihTvG5ADdcnAf4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228213561"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228213561"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:08:35 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ED27C82072C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:04 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A6CA5896E17
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4B8F314000AF;
	Wed, 13 May 2026 04:08:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 15/56] libnet-dns-perl: upgrade 1.53 -> 1.54
Date: Wed, 13 May 2026 12:05:14 +0800
Message-ID: <20260513040555.377-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126898

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Resync with IANA DNS parameters registry.
- Resync with IANA DNSSEC algorithms registry.
- Implement DELEGI as derived subtype of DELEG RR.
- Backport DELEG parser to SVCB.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.53.bb => libnet-dns-perl_1.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.53.bb => libnet-dns-perl_1.54.bb} (96%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.53.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.54.bb
similarity index 96%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.53.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.54.bb
index cccbb16a59..fd71ff72c6 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.53.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.54.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "04acb4f177d57c147dcedc4bd70e23806af3db75a532f46f95461b2bc9a94959"
+SRC_URI[sha256sum] = "7abe0e03e8eead04bfe432d0d90ec0dd61b8ba71afad324a9c76acc6a6fbe2a4"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


