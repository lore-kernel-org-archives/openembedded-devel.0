Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BB6C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:25 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6065.1787722219776077270
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b4ymAgPx;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1178; q=dns/txt;
  s=iport01; t=1787722219; x=1788931819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HChQ0ny6KdB8AIS4jAMxWYIoe1YJvO178SDl9yqyPvk=;
  b=b4ymAgPxQIS/NPTefUJgG0hy4dYAXw7N6d9JUzxuQvGROZMI4HFthKr1
   3tN4IwGR8kV6XOEQlcp1QuoDQiSJYPAnIF/S/kWQbLOxrDdYNg80mrT4M
   WQX4miez0DgB/5DPmswUNzX6BkNvgabs6zDlG7NSMAOq9NQBeUaw4cR9N
   c7uG3oZ8nagg7fPSwQ7WGa1HXA5VxtTA5Zw3Owl8um+VqGvYfSSY+xW34
   l8hF8wgGUSPl9okfkBZK/FPv5wMphketShV61ucauH2C3MAcDBdUtdEtI
   Kqtur3302Jpbb6o8nwFRogYxo0v3Ps+c1yozrNjPDLkAbwgwIzumX1Ugl
   w==;
X-CSE-ConnectionGUID: OV8dU2YpSHCRl8T5CHg0HQ==
X-CSE-MsgGUID: Cp9jWZrLT2a2gEXTCfVtfg==
X-IPAS-Result: =?us-ascii?q?A0D3AgB8eY5q/5QQJK1QAQmCWYJXdF5DSZNZAaEOgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbgImNgcOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBcRIMCAYJ0A75WgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6EFgF5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ6CGaY1oQ8KKIN2jCKVOhozqmwum?=
 =?us-ascii?q?FqkWoRpgW4BNYFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:+6oEdamVCT40C03leudZg/Xo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJWmrXOqvfN2v0fox3Oo7g/EkO6pDUzNZqGVZo+X1kQVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsfzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaomqupKW1BWz
 twzEjRdUk2op+3u4IvuH4GAhux7RCXqFIobvnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEfUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqMK43WHZwJxS50o
 Ert5zX7PSMAEODFwGCK30KQreHxgS30Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:OuEIV6hGaAXyW6UCW6C/IaBkr3BQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3ALcI/IGuZ/OiifOYklGiTo/Fw6IsCTC3R8S3hO3S?=
 =?us-ascii?q?YIlxtGIHIYn+foINdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ADkA5iA/2JJq9+e1W3NfNRgiQf+xwsqaROloprc8?=
 =?us-ascii?q?P4capBRBbNQmBgjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819940143"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:19 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id CC24F180001F6;
	Wed, 26 Aug 2026 05:30:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 63731CC12A6; Tue, 25 Aug 2026 22:30:18 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][scarthgap][PATCH] python3-cbor2: use exact CVE_PRODUCT mapping
Date: Tue, 25 Aug 2026 22:30:18 -0700
Message-Id: <20260826053018.51457-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129481

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:cbor2" mapping does not identify the packaged
source. Use "agronholm:cbor2", its NVD dictionary CPE and NVD
configuration identity, restoring the source-aligned records.

Backport note: master replaces a product-only mapping in version 6.1.4;
Scarthgap 5.6.4 has no recipe-local override, so this is an addition.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7f59d247eea101ad62ded8e2e0bd5419dd65eb79)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index 90688ced20..00ad025bc2 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -34,4 +34,6 @@ RDEPENDS:${PN} += " \
     python3-datetime \
 "
 
+CVE_PRODUCT = "agronholm:cbor2"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

