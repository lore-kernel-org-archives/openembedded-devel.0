Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC995CCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5573.1759990105519662960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nxuV59c4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990106; x=1791526106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RSdV3SNxqeafSoQgLlSGTBG1wf1G8UDHOJhQZpyQMiQ=;
  b=nxuV59c47AkAQ1nM6ezyyCuc8X7+RiOXlEGrDSeJP2EeJPfZ3g2r8Y5B
   i+FEbXUbKKrHOZLiz8S/gSKxouvvwE0fdiyYWrW/GfOC97h4hZamPm/jS
   jmPMTpQ+KL2jiYaZjC7Vx/cK4E4yHuAn88tW0MiMFSzVBZky0i+zdIFwU
   Z4SxVUMRu1jVbTURSFNzC20tpkok0WH5/Uq9wGhjJ0Uk6kiJ6b8kMI1iH
   QZjZXpB8sMv9XhZ2z/6kGZLcuOwzpnk6Zt5vjLlgReZBPOnNO3BYP595T
   8Epq3+VcE/xIss9sHBysANzN6puiRENr+tDReIVJAg7dEjGzAaas6vQS5
   A==;
X-CSE-ConnectionGUID: hJkvAmzJRrC9MxsFP16xAg==
X-CSE-MsgGUID: yqiwm77zSpOpva3w1wpQXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="214800281"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="214800281"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:24 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 11D65C0054F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C1C481401254
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7D1121001CE2;
	Thu,  9 Oct 2025 06:08:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 05/22] openvpn: upgrade 2.6.14 -> 2.6.15
Date: Thu,  9 Oct 2025 14:07:52 +0800
Message-ID: <20251009060809.445-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120402

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.14.bb => openvpn_2.6.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.14.bb => openvpn_2.6.15.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
index 8627c7812d..8a88282cd5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "9eb6a6618352f9e7b771a9d38ae1631b5edfeed6d40233e243e602ddf2195e7a"
+SRC_URI[sha256sum] = "e35513ee15995e3c71adfd8891b9f33522896c70b3baa2ed9a23c7a42c4d7bde"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.43.0


