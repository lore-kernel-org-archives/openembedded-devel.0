Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05252CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4837.1761099798259613546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gP/L1iEp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099800; x=1792635800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jW8R1Ry6nWYk9Tt8Wy8BQ77BaC49idKZYD4KAamLP6g=;
  b=gP/L1iEpP4g2rMQdRLv5FKrpRGyWhN7wYStGuJ9Wehu92fZhdF6ryP1P
   XItvQr/8EDaEGbssn59PFGaLEuCqKIz449zpaZm87ZReHNSrJjIN+ZXCs
   3fELJUhoFYHoa43O4OWVignZ9saK0LvhNFztnw27CeOf0W6G8dgbHmXYP
   9GrcpFfjavB5ANunsxYuUnD1v3XMRTT1gqg0aFTuQu4DslyHa9eBlEGV5
   GE40XHEnlyeIRNsBKuVuXmhG9XNCLglJY7P2oHnP5pMcMWIvC0zWXxtlU
   ooCWBs5Sz+jMrnTc+sTLJd5ztUFif+raSCqrhOoiIfzk89IUcSAgvNrT/
   Q==;
X-CSE-ConnectionGUID: hKZAfpUUSwyknZpwHElfTQ==
X-CSE-MsgGUID: ic7JmMrERve5Nra6sk+TZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536356"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536356"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AE8CC100034C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:20 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 73D1E1C00179
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E0E0F82C0DC;
	Wed, 22 Oct 2025 02:23:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/29] python3-requests-file: upgrade 2.1.0 -> 3.0.0
Date: Wed, 22 Oct 2025 10:22:20 +0800
Message-ID: <20251022022227.226-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120871

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add data needed for Response.raise_for_status (github PR #42)
- Add type annotations
- Change URLs to migrate to codeberg.org

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-requests-file_2.1.0.bb => python3-requests-file_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-file_2.1.0.bb => python3-requests-file_3.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb b/meta-python/recipes-devtools/python/python3-requests-file_3.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-file_3.0.0.bb
index d111c3c9da..a9b10c919e 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/dashea/requests-file"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 
-SRC_URI[sha256sum] = "0f549a3f3b0699415ac04d167e9cb39bccfb730cb832b4d20be3d9867356e658"
+SRC_URI[sha256sum] = "68789589cfde7098e8933fe3e69bbd864f7f0c22f118937b424d94d0e1b7760f"
 
 PYPI_PACKAGE = "requests_file"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


