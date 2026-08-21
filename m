Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE6CC5DF95
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:51 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6759.1787317187605475523
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=l1B5IsLI;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1150; q=dns/txt;
  s=iport01; t=1787317187; x=1788526787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2WI6hlUbOW/coQXxMBP2cVY8RUnz6XuhaWBnMt8BGVU=;
  b=l1B5IsLI/yqXX5Si0LWIctdsig47t9bkc2FsJaB2sX41EiM//h6drYmK
   yLeJlW4U/fr7x+LyKSTyqdcpemLGfr0c6qSsYhUMhmNjDW7i7TWHNJVF1
   5BjEn9nJsBuImDuIY53yUHPW6glSZkRqT062gfAVHaICQ/uQDjlVigd9b
   5+OxD4+zo6VZ+tHMUzUYdizBjXPW4s/qFlAUZJt9+SPGqZv/lPIQzA3Ir
   YTb1gGKaI055ZDmx4gRyobzivuM3dWYL8JyyJxTgJRGofAEJD+588nLk1
   1oMoTM5IxfqcNn8GGCEg6OKUGp3Uya90a9Va/OD79CNjC+mqkfjOFlP8S
   A==;
X-CSE-ConnectionGUID: /BI+t4+tSgm7kx2AFXx48g==
X-CSE-MsgGUID: IB3se0H8Sl+6zOFivBoTNA==
X-IPAS-Result: =?us-ascii?q?A0AxAwDbSohq/5EQJK1RCYJZgld0XkNJk1kBggShCA8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1uAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDEcEfgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6EF3mFeASCIoEMk1ZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgl+CBQIBSUMOB?=
 =?us-ascii?q?zoLGA1IESw3FBkEPm4HjloggkY9UYIYpjahDwoog3aMIZU6GjOqbC6YWqRah?=
 =?us-ascii?q?GmBfiaBWXAVgyIJShkPji4V0BknMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:VXdSvKz75b24SI8m7PJ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUGz
 mFNWmyOPvqIZzekeIp/bIy/9BwH65XVyNRnGwBpr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDtMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJAYcHM4EpqVrOm5Lq
 v8IchkjXgDf1+3jldpXSsE07igiBMDvOIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUidC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi0bouIIYHVHa25mG65j
 Dnd8jzZUioed4KN7hSE7FirusnmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:ANVp6auzzOO2sry2+yg9zSaO7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3A7H+1D2oGXtgQfgmHmswY70fmUYcPUz7BkDTMGEC?=
 =?us-ascii?q?9VmV5EpS7eU/MqKwxxg=3D=3D?=
X-Talos-MUID: 9a23:828qngt5RvJvIazuD82npRs5L8oww/SVDANTg7IouteuMhBWEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="816953570"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 12:59:46 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 94DD418000455;
	Fri, 21 Aug 2026 12:59:46 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 3B259CC12A6; Fri, 21 Aug 2026 05:59:46 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-simpleeval: add CVE_PRODUCT mapping
Date: Fri, 21 Aug 2026 05:59:46 -0700
Message-Id: <20260821125946.60009-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129422

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:simpleeval" mapping is wrong for the
packaged danthedeckie SimpleEval source and misses its vulnerability
record.

Use "danthedeckie:simpleeval" for the source-aligned NVD dictionary
CPE, NVD configuration identity, and CNA affected-data identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
index 5fb968edd5..a4fa42ba28 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=aed013161b2a0bfa75e69eeb4e8a89e7"
 
 SRC_URI[sha256sum] = "1e10e5f9fec597814444e20c0892ed15162fa214c8a88f434b5b077cf2fef85b"
 
+CVE_PRODUCT = "danthedeckie:simpleeval"
+
 inherit pypi python_hatchling ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

