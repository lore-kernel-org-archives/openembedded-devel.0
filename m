Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171CCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21229.1780394934167967963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jrj2wT07;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394934; x=1811930934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tCnIaH0V1AQ9HVqPlE1phbzIUeN5W3ViofF/G0hdt3s=;
  b=jrj2wT07lS3OIihQ86YjdPILJrxC4fkENV13wFOteorIoO7B7ybGYpGy
   rL07PQM663WnrCezFcqg798WYCzUB694+e37PV8L58POZWeNLctDfUpR6
   LToL7IIeYct0HZj94iAy1akbQSvWlncgalTpjQzTJHrZuOwxFxS2TOGmt
   rI9drhpdqvK1toC5FfRJIXVbRlbeVx3F7U0gIMdFR6BmHU4SLkjKauPMp
   4PtfcmPUsnaHpdo/YQaRJI/RHYWBjZguUax+Q/1DL757woofA/7dg67K0
   Gzv+99L55wLG3nhvTm9lu2mTa4up44jYFr12cXc6huhzwKbu3ffFcGH7I
   Q==;
X-CSE-ConnectionGUID: pWYI5gecTbi6w2EVoUgH9Q==
X-CSE-MsgGUID: xRNhQhxMQXa2zNTH0VDPFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="245981324"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="245981324"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:53 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BAA623D1D
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:52 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6B836C03F79
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 857901800522;
	Tue,  2 Jun 2026 10:08:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/38] python3-service-identity: upgrade 24.2.0 -> 26.1.0
Date: Tue,  2 Jun 2026 18:07:45 +0800
Message-ID: <20260602100755.2117-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127351

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Python 3.14 and 3.15 are now officially supported. #85 #93
- service-identity now uses cryptography's Rust-based ASN.1 decoder and doesn't
  depend on pyasn1 and pyasn1-modules anymore.
- Verifying a single-label hostname (e.g. localhost) against a wildcard
  certificate pattern now raises VerificationError cleanly instead of crashing
  with an opaque ValueError

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ce-identity_24.2.0.bb => python3-service-identity_26.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-service-identity_24.2.0.bb => python3-service-identity_26.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_26.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
rename to meta-python/recipes-devtools/python/python3-service-identity_26.1.0.bb
index bbd6ab80d6..ed855c4027 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_26.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/service-identity"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76edce6a3fa1b82b0bf2b6ce174c19e2"
 
-SRC_URI[sha256sum] = "b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557cbe8e09"
+SRC_URI[sha256sum] = "6358c52882c96e66ac4a55eb3a72c7dd4a70763f8cc6fa4e70abde2656f4bf3b"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


