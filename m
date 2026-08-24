Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65DBC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:02 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14020.1787568659124832599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VRiQW/uG;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1331; q=dns/txt;
  s=iport01; t=1787568659; x=1788778259;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c0YfAL6MlvXqUvmsZxPurC0bECg+bKHbznviUaJQ8Os=;
  b=VRiQW/uGF5VI03DTMOswmiWVxq8/K10p4bjogWsmCx2u0WQBZ/wONigK
   gd+wxsiPTOuyLcATnFH7+2fvzF216t2IiWfmazFCz1/FAWEIwa7a26DJ8
   Uyjmo8epo08gtwcSxEpriNlynCcFFNtgV23R7WB/QbYCYbXpT2sRzednu
   uFXRcG2gfl4l8hEDxlaxLurjRS2E+v5Sa88FPzKtem0MhFsxOWQPDQk1z
   U3KgYNgOvnOl3gFfSoxFE7XC9dT0UAhoP0WcjlRv8ITn/veO3WqnZd366
   3Dq/JGH+e/X5Un9OzdwPI8mH1NRqMnlO9xZyrvXlm8HclcpEGH8Gs08Gd
   g==;
X-CSE-ConnectionGUID: sTuZ7GNrSgeYFVIB8E8k2A==
X-CSE-MsgGUID: 4nYPqd0jRbiEXMEgwG9VfA==
X-IPAS-Result: =?us-ascii?q?A0BCAgC0IIxq/40QJK1RCYJZgld0XkNJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFxEgwIBgnQDw2OCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQKDXmFeASCInoShESPFkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylkARIXgQmCBwKCWoIFA?=
 =?us-ascii?q?gFJQw4HRyILGA1IESw3FBkEPm4Hjl4fgkcBPFGWVJF6oQ8KKIN2jCKVOhozq?=
 =?us-ascii?q?mwumFqkWoRpgWg8gVlwFYMiCUoZD44uFdAZJzICPQcCBw8CkXOBfgEB?=
IronPort-Data: A9a23:9by9Sq2wFNnUwlGmkvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2cBy
 2BOCjzUPKnZamb0LtoiOoSx8RgAsZWBmNZgHAZv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGF30rD9I33PxMDmx/2
 8I5AmAgPhPZrrfjqF67YrEEasULJc3vOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME2ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOGzbYaMIYHVLSlTthqel
 1rf8zz7OBsbGey65DWa3SOSiMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:PiDsna0s7aORJCnicokcsgqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3Af6W/1GsEaoHVlkmoMImxKlaO6Is+TmDvk1j2OXS?=
 =?us-ascii?q?3BFdHdpy/GXLA+/lNxp8=3D?=
X-Talos-MUID: 9a23:lM80GAv07+UaIuhFvc2n2DdTDN5ku6aUAkEgobArtNarZBJ+EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="816541357"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 379EE18000193;
	Mon, 24 Aug 2026 10:50:58 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id C59E9CC12A6; Mon, 24 Aug 2026 03:50:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-flask: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:57 -0700
Message-Id: <20260824105057.64883-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129462

From: Devansh Patel <devanshp@cisco.com>

The current "flask" mapping emits the wildcard-vendor *:flask CPE
instead of the exact NVD identity for the packaged pallets/flask
source.

Use "palletsprojects:flask", which is both an NVD dictionary CPE and
an NVD configuration identity. CNA affected data uses "pallets:flask"
and "The Pallets Project:Flask", which remain covered by scanner
aliases. With sbom-cve-check 1.3.3 and the pinned 2026-08-12 data, the
generated identity changes but the current CVE report does not.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
index 559f781e7e..1e3890e7f5 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb"
 
-CVE_PRODUCT = "flask"
+CVE_PRODUCT = "palletsprojects:flask"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.35.6

