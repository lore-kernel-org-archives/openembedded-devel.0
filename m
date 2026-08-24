Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279A6C61CE4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:04 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13933.1787568658832839044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XjnbAlrv;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1186; q=dns/txt;
  s=iport01; t=1787568658; x=1788778258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xvezAuFye/RGCvrVx0wIXTnQAPyzpqDL22Uzr5zgUg4=;
  b=XjnbAlrvLvdUFhLJep1OvyJETML4jTZEBX1AAqPVr4iqUqP/uPchTvQS
   4KfD6P83Kh+fWTQWJHdYHBCQ7GcdiSSF4c9jXnZymA8+kkoXT/6eJnh0r
   7qsN8CYfqYQj57OSqAeXpCwieHkqgXHOZmxyhxK0RnkAghM7erxuejGxg
   AkBu++FM/v6hg/Err9au+rM3Bc2AJvfDCM7w+woiV03AfX5NmFsHmz8F3
   VMLLwJv0eZykmvl+ZGJzLt9yCgw/n9EIugd73A5JDYNDYaDUtXkyDdYWq
   b5pG+DRzM4mE6itC9R8yCucsbqnSluA2wFgDiCvdLHMMwiurmoClQa+Bv
   Q==;
X-CSE-ConnectionGUID: gndgH9k9QwOUsGH5lyGkRQ==
X-CSE-MsgGUID: GR8XkrUISbezms6eBxm0zg==
X-IPAS-Result: =?us-ascii?q?A0DDAgAvIYxq/5UQJK1RCYJZgld0XkNJk1kBggSfCoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPDGIIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDIJwkGpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspZAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0ciCxgNSBEsNxQZBD5uB45eH4JHPVGBH6cvoQ8KKIN2jCKVOhozqmwum?=
 =?us-ascii?q?FqkWoRpgWoBOYFZcBU7gmcJShkPji4V0BknMgI9BwIHDwKTcQEB?=
IronPort-Data: A9a23:O3tlUanYILXaVc9iGwMqpqHo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJD2iCP/uKNzGkfdh/O9+y9h5Xu5/TztZnHAE/rig2QVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsf7b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYIe9ulXUGIfz
 OM/FSsiTk2Hls21+ovuH4GAhux7RCXqFIobvnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEeUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqMJYHVG5oLzy50o
 ErpxTTJAQsnFeeVxCiA6SyhrP/KxTH0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:ASxm5aMj6lroscBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AqWi/x2u3fWm9ND++KFfi3JyD6IsqdHHS7CbTcna?=
 =?us-ascii?q?nLltyZ53ITU6/+5ldxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Anq9diA8my3PTNyLpTprEiBWQf+hSs5StEn0sqp8?=
 =?us-ascii?q?LqcyfayFaKzLFnjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="817576769"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id B89881800022E;
	Mon, 24 Aug 2026 10:50:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 52FD5CC12A7; Mon, 24 Aug 2026 03:50:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-ujson: add CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:57 -0700
Message-Id: <20260824105057.64609-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129459

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:ujson" mapping does not match the UltraJSON identities used by NVD and CVE List V5, so source-aligned CVEs are missed.

Use "ultrajson:ultrajson" for the CNA affected-data identity and "ultrajson_project:ultrajson" for the NVD dictionary CPE and configuration identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
index d68e1a674e..3a9b581f9a 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
 SRC_URI[sha256sum] = "d62e3d7625384c08082abad81a077af587fdef2761bb14c3822f4234b8d07d75"
 
+CVE_PRODUCT = "ultrajson:ultrajson ultrajson_project:ultrajson"
+
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
 # let OE do the strip operation
-- 
2.35.6

