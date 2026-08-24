Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E07C61DB6
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:04 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14021.1787568662111518882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gZAppRkl;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1338; q=dns/txt;
  s=iport01; t=1787568662; x=1788778262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FZ5lZ+zcgzqpm7g+s0w1Rw1Z8DvwEmCgKW2hu1cYS1k=;
  b=gZAppRkl5SGQAllLk4jR1JzMQajA9OgQd8RxHGTSz2XAIajIl1HkIkVt
   pw+GQmIGQcjKcr8c5SScR134UgkgnpX19RaqjVv8BusRitZv5HcIg+uxT
   60RxPG3C0FrxoClzm8VqCtPc2c4wcQ+L2cjo+fNdYELEkiqzgGxrv3wRY
   g+Z1AxiU8tHa6sIZ6QDLus2dcWqYlM+mZqyhDEX3HANASfwoGzn27lmLB
   CIq4/cC3zW/zE99Jn06GPi1veBLHTY7MuHXYB2yfnnAZPXgnteOR0NAgj
   l/T6pANuczJatpOcykB6lTHMuraMFja4JRrN/m1oEC/gc1gUeqTFoWYka
   A==;
X-CSE-ConnectionGUID: 0OW42ha3SkStrRmguFKfvQ==
X-CSE-MsgGUID: Vb5rRUX/QNKaVsVwnSG8Sw==
X-IPAS-Result: =?us-ascii?q?A0DDAgCrIYxq/40QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAMRwxCCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQKDXmFeASCInoSgXiRYkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylkARIXgQmCBwKCWoIFA?=
 =?us-ascii?q?gFJQw4HRyILGA1IESw3FBkEPm4Hjl4fgkcBPFGCdJNgkXqhDwoog3aMIpU6G?=
 =?us-ascii?q?jOqbC6YWqRahGmBaQE6gVlwFYMiCUoZD95cJzICOwIHAgcOAwuRaIF+AQE?=
IronPort-Data: A9a23:Empv8KIRB1evRZ3QFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS1jBVz
 TEZC2uDbqyNNDP0eowiPt7loRhTvJPdz95jSgYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qoajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN02K35qZ40Rod10On1Uz
 /kXNR4uYA660rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNXwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhieSyYIqJJ4XiqcN9oEzFv
 Fj7zyPAJDITCseh1jy+3SKXmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ECj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:7J8Vx6M8gCPLUsBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:64bz3mxL8UecZULzjsjzBgVMPf95KH3Ul0zTGFOiM2NmVZO2R0GprfY=
X-Talos-MUID: 9a23:FNMEQwXL0nlDtkbq/AHm2StYCfcv2oKNAX4Wr4oAgObUDjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="814788451"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:59 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 68FF518000193;
	Mon, 24 Aug 2026 10:50:59 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 05512CC12A6; Mon, 24 Aug 2026 03:50:58 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-flask-user: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:58 -0700
Message-Id: <20260824105058.64968-1-devanshp@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129464

From: Devansh Patel <devanshp@cisco.com>

The current "flask-user" mapping emits the wildcard-vendor
*:flask-user CPE instead of the exact NVD identity for the packaged
lingthio/Flask-User source.

Use "flask-user_project:flask-user", which is both an NVD dictionary
CPE and an NVD configuration identity. CNA affected data uses
"n/a:Flask-User" and remains covered by scanner aliases. With
sbom-cve-check 1.3.3 and the pinned 2026-08-12 data, the generated
identity changes but CVE-2021-23401 remains reported as affected.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 68d7361519..c05c74b5c4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c
 PYPI_PACKAGE = "Flask-User"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-CVE_PRODUCT = "flask-user"
+CVE_PRODUCT = "flask-user_project:flask-user"
 
 inherit pypi setuptools3
 
-- 
2.35.6

