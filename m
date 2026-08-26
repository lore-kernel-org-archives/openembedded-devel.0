Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57C1C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:10 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7504.1787730845473658512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jXGI9+37;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1311; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4B1780AYO0OebQwGWajIqf8rXO4iSDRUKOawbRFrXtA=;
  b=jXGI9+37V/rVo+S7/0wAXiX3ODdmNGgx2X0p2hDwaSsBZKc0dtxDucDf
   XzH5DggoW/bOdq5/SAGpcIg0XPmzYsQVJnvx1edau5HRQ7gNaVy1Do73R
   u2MbddVf9yTWJlFeJj13vR7vEudGEjZLRyMTuhWHrUanZQcGUQ/3X+BYG
   60a9vifvy1KMy7Qadcj4er2bDdReKn8E2bcdN2Pqa+IM7Ql6xKe/1emhG
   3P66M5YTSF79GP1N9CL5MrW9GzS2Ail2cJIZYRJ0n+X4ITlO1a8Rw70cs
   PVQq7vRi4e2XCIYkcIZW8RSvYvxM0tSg7bbjTqN5W0HzosF8a0f/CHruE
   g==;
X-CSE-ConnectionGUID: sg6zwAkwQwGToe00+lHpBg==
X-CSE-MsgGUID: xz+5y8IJQleVcNuqy5QThw==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/4wQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBGAEtMFxEgwIBgnQDvwOCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gihXInGxuBcoR+gmECgTR5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJATxRGYI/k3yPWYIhoQ8KKIN2j?=
 =?us-ascii?q?CKVOhozhVulES6YWos3mSOEaYFoPEaBE3AVgyIJShkPkiPMOScyAj0HAgcPA?=
 =?us-ascii?q?pNxAQE?=
IronPort-Data: A9a23:gcK3xawoTpmPMoHoSNl6t+dkxyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 WBNWWnVbv/fYGKke9kkYNi09UNV7MXdzIJkTgJl/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFo5Y58H0+VoOH5hy
 fsVcGhOajCbre3jldpXSsE07igiBMDvOIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiYC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi3aIKEIobVHa25mG6It
 CGb7jTYICgeOeKU7yec4y+Vuu/QyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGr+78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:MCJi5a77PfccmzrpIQPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:OYOd9WCNgUR0k6L6EzJoqlwLM8M6S2Ly8HDdexf7DUZxYrLAHA==
X-Talos-MUID: 9a23:8zBePgvPqzZrGo/gQM2nlCMhadY4woaXDE0zmrMbotjZDBBwJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820090270"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 94C5B18000411;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 3B440CC12A7; Wed, 26 Aug 2026 00:53:48 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][PATCH] php: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:48 -0700
Message-Id: <20260826075348.64095-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129488

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE. php:php
is the active NVD dictionary CPE and configuration identity. php_group:php
preserves historical NVD configurations and current authoritative PHP
Security CNA affected data for the same php-src source; it is not an NVD
dictionary CPE.

This changes the generated identities to two exact CPEs, but the frozen
sbom-cve-check database leaves the 731-entry CVE report unchanged, with no
current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-devtools/php/php_8.5.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.9.bb b/meta-oe/recipes-devtools/php/php_8.5.9.bb
index bc249fd0d3..710d5b0506 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.9.bb
@@ -34,6 +34,8 @@ S = "${UNPACKDIR}/php-${PV}"
 
 SRC_URI[sha256sum] = "703c082ad9d2946ac647f3596812300d2c62b360d2f31a999021692a9b39476c"
 
+CVE_PRODUCT = "php:php php_group:php"
+
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
 CVE_STATUS_PHP = " \
-- 
2.35.6

