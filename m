Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCC6C4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44606.1784715820056900261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e8VkfMWc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715820; x=1816251820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rq1lFkR36TJNZbH5gw/kcL/XDnliW6XJUo1WNuYxAVk=;
  b=e8VkfMWceTc5AHgGxZdNUJdMsxz4y9AXc+q0x7LyBIvxVQTqK/VpZnah
   2l8yGAH7mIdIZ84VYFFgNvatPQZlYxttFf6UVGA+sRRN5Yqoz7+UR5Swv
   vY/DunxbQF0GImUfBmRPPBtulLrgsim5I551kRvxBu/fFxmXpXzE6LjZa
   n9gigCufjRJ/qqWeh7H4dFTeOp1jSmLT3ijPAWHT3AZGpbEmPUjC4c1GA
   1sKPGfrfvLhFrRhBZI+uqhKQAu/V4oTOwaBw25CIzsQ8YRu+oDJ1Xxe/e
   XhGJ6IfZmKk9uY6pKZo+aNOH2UJzFcOcq/67qqPzZcbM8W3y4JXbAvsKs
   g==;
X-CSE-ConnectionGUID: dSDDAk9ZS6a7mR9c6pYy0w==
X-CSE-MsgGUID: LDy3dUQuSba42i0IzYPBkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248228205"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248228205"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:38 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 39E94C00227
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:38 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E04D2C252C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 074BD405987;
	Wed, 22 Jul 2026 10:23:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 06/37] libnet-dns-perl: upgrade 1.55 -> 1.56
Date: Wed, 22 Jul 2026 18:22:49 +0800
Message-ID: <20260722102320.1019-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128376

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Documentation issue for Net::DNS::RR::RRSIG::verify()
- Denial of Service via long DNS compression chains
- Remote code injection via EDNS EXTENDED ERROR
- UNIX.pm: Unreachable code warning using Apache/mod_perl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.55.bb => libnet-dns-perl_1.56.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.55.bb => libnet-dns-perl_1.56.bb} (96%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.55.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.56.bb
similarity index 96%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.55.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.56.bb
index faa286c8ca..4e4850234e 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.55.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.56.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e2b60630c6bc3ae36fafdf64dfe099a221f6aff1dd2707a1a5a5ed240ef6f47a"
+SRC_URI[sha256sum] = "5930e39f76895b380c7ca11fc08352d15ad71c41fe84c12dfb6a322d17f66946"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


