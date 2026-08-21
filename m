Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCCCC5DF93
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:51 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6757.1787317186676842663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kEeJ/fdw;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1286; q=dns/txt;
  s=iport01; t=1787317186; x=1788526786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=92OL+E3RC+4KTefiuXEQgtZsZLDGT+UXjUOW/gUGFDA=;
  b=kEeJ/fdwb41JYktpr7OkIW6eG/dg8phLAyJ/LrvOMyL2qo2Qt4C4ElLL
   jfFTD4o7S5nx1gcqjSaTk6jkLIXySBLy2k8flvCZbmIbdvdlJvBBQlJeu
   BFPmms0pRv+UndZrHzNu8pmOnPcA7yj+Hweb19FkC+DUESKiyWz+rzzV7
   zj8fkbF0Nir2OZMDrYO6/7/NqYQdOFFpjQoLDtntkWN4JRngh7Tg4mGgD
   2Rx/7XTdwaiKoqc19SccdJrCqKCLn7SJeDCyUXHmmWxw2k/RWUt65e0vZ
   RbER8abZfjr+PacCs9SbJbawHqKd7PuQc9heMtpZgdm1yMma1ZDIHPwLm
   Q==;
X-CSE-ConnectionGUID: O07fU3FNTsupna+tJbYJig==
X-CSE-MsgGUID: 3EClYHBwRY6WOs0nUjxqkg==
X-IPAS-Result: =?us-ascii?q?A0AzAwBhSohq/5MQJK1RCYJZgld0XkNJk1kBggRsoBwPA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbgImNwYOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPBL4IsgQGDKAGBVNsvAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hAoNeYV4BIIiehKTVkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCX4IFAgFJQ?=
 =?us-ascii?q?w4HOgsYDUgRLDcUGQQ+bgeOWiCCRgE8UZZUj1mCIYwAlQ8KKIN2jCGVOhozq?=
 =?us-ascii?q?mwumFqjZHaEaYF+JkaBE3AVgyIJShkPji4V0BknMgI9BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:hMSMT6KTPlBUouhFFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1GdRm
 mUZXW+CaareM2unLowgb4zi8EgH7JXQm9Y1HgUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uv9WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qtajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1JVB44ANY23NpsHHlI/
 L8ECjo8TBGM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzM3wsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhi+GwaYGIKoPiqcN9xWuzo
 lPm1XvDM08lE8fHzweH4muvibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:XqEldKA3pThDhC3lHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:Rv64bWyHHe6EVQLgwTaZBgUzQp8rTybz6kvLPle+ACV1areka16frfY=
X-Talos-MUID: 9a23:h7apFAVF6EEsN9Xq/GTBrzVTFO132ZXwN2cWyZM7udmdNiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="831513587"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 12:59:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id BA08E18000154;
	Fri, 21 Aug 2026 12:59:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 571B0CC12A9; Fri, 21 Aug 2026 05:59:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-pymongo: correct CVE_PRODUCT mapping
Date: Fri, 21 Aug 2026 05:59:45 -0700
Message-Id: <20260821125945.59863-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129421

From: Devansh Patel <devanshp@cisco.com>

The product-only "pymongo" value emits a wildcard-vendor identity and
omits the second authoritative name for the packaged MongoDB Python
driver.

Use "mongodb:python_driver" for its NVD dictionary CPE family and
"mongodb:pymongo" for its NVD dictionary CPE and configuration identity.
With sbom-cve-check 1.3.3 and the pinned database snapshots, the
generated product identity changes; the current CVE report is unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
index 663de17352..4255650834 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI[sha256sum] = "70ffa08ba641468cc068cf46c06b34f01a8ce3489f6411309fcb5ceabe6b2fc0"
 
-CVE_PRODUCT = "pymongo"
+CVE_PRODUCT = "mongodb:python_driver mongodb:pymongo"
 
 inherit pypi python_hatchling
 
-- 
2.35.6

