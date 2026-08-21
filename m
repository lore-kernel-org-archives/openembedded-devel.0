Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38E2C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:51 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6755.1787317186477579452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TKqVrLTl;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1202; q=dns/txt;
  s=iport01; t=1787317186; x=1788526786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bKxO1nJc+xKM3WaeAvKCh8b/3+S6GjgB2gthQ8A1yjE=;
  b=TKqVrLTl5muvwhjW5w7LL1VDiq7z61Q9p3oyoVypGDLOtI0FXyQDT3Sd
   TpyY/UypVqucpijl3/og4d+8DKP3EYmP+7Lb970dVLcmP2WKvzmaqQKr1
   KA98ZQpMQDyEjhG8FxwhsiaFpJfxBUdW8zzdOXqU+RbLwY2S0G24MO3dP
   K8QSMqILBjuhYylhawzc607lfutHXH+BX8eqAGBtwauTYJGC9s0JnGl8y
   IagbJm/odbyOb594hdRPY1E//EreFXzzzHcOdEMu+Z9YjuKvffZ1MkL1N
   VQMqCT0QFWmKq5Gr61G1URlfjYWwfPg44HXVq9PpX6WE3jSnh39oIyFtJ
   A==;
X-CSE-ConnectionGUID: P332O5goS9iRIO/4hDscyA==
X-CSE-MsgGUID: pF+06YcJQPWyxQxz2Be5Ng==
X-IPAS-Result: =?us-ascii?q?A0AxAwBhSohq/40QJK1RCYJZgld0XkNJk1kBowwPAQEBD?=
 =?us-ascii?q?zcaBAEBhQWNbgImNwYOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4Zchl02ARgBLTBcRIMCAYJ0AxHBHoIsgQGDKAGBVNsvAQsUAQWBM4U/iCJ2h?=
 =?us-ascii?q?HwnGxuBcoR+hAoNeYV4BIIigQyBeJFeSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJfggUCAUlDD?=
 =?us-ascii?q?gc6CxgNSBEsNxQZBD5uB45aIIJGATxRllSReqEPCiiDdowhlToaM6psLphap?=
 =?us-ascii?q?FqEaYF+JoFZcBWDIglKGQ/eXCcyAj0HAgcPApFzgX4BAQ?=
IronPort-Data: A9a23:5hEvCKp+sTzPn7wKpJhIS7/Gl4JeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmDMviKMDPyKNxwO4y18UMBu5fdxtVjS1E5+yBmEH8b8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8ko35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0t4sWjtpq
 PMfE2EMVDGkwL627KmwW8A506zPLOGzVG8eknhkyTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtOYH49tL/Aan3XfzBGoVSOpbIf6GnIxws327/oWDbQUozTGZQNzhzF/
 goq+UzhLFJCau2U6wO9zWO8v//dxwn2BaQdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymEzq7SpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:CYEx6qDMOqncZWflHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AYhoqWmtdqZOd8MbYkRdtPHrA6IsdKSaH6yrfJHT?=
 =?us-ascii?q?pCFxIb/rJSXOL87JNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Am2Ceug27vTHJ0ZwuJS5O8isrszUj+4rtUB48mrc?=
 =?us-ascii?q?/g/aVJRVgKW23gWmRTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="814908250"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 12:59:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 7514C18000B48;
	Fri, 21 Aug 2026 12:59:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 127AECC12A6; Fri, 21 Aug 2026 05:59:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-m2crypto: correct CVE_PRODUCT mapping
Date: Fri, 21 Aug 2026 05:59:45 -0700
Message-Id: <20260821125945.59676-1-devanshp@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129419

From: Devansh Patel <devanshp@cisco.com>

The current product-only "m2crypto" mapping generates a wildcard-vendor
identity instead of the two vendors used for the packaged source.

Use "heikkitoivonen:m2crypto" and "m2crypto_project:m2crypto" for their
exact NVD dictionary CPE and NVD configuration identities. This changes
the generated CPE set, but sbom-cve-check 1.3.3 with the pinned NVD
snapshot has no current CVE report delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
index b9e872fe67..98db2eceb1 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
@@ -53,6 +53,6 @@ do_install:append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/__pycache__/*.cpython-*.pyc
 }
 
-CVE_PRODUCT = "m2crypto"
+CVE_PRODUCT = "heikkitoivonen:m2crypto m2crypto_project:m2crypto"
 
 BBCLASSEXTEND = "native"
-- 
2.35.6

