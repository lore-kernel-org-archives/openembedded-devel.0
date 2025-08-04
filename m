Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F9CCA0EC4
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13467.1754296436870096092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CrO/jecG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296438; x=1785832438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=chyi5LKj+Mhm/VitJERaslKAuHjDXAorg2omj1WqJBM=;
  b=CrO/jecGzq5AQNC9RurARXwn/+M6O9QGnXkmCONpTQPy5cZvLr7mqo6E
   1OicFPpn0rQ654IaIROJB1u+IIs96tdNxLb5/HRvLe+LqZc8bo7NbxJVw
   en5qT5eszO76vXG/S2xUP2KFCN+yM/rw75HY/hVOkyCpJlvhyvM3X4iBL
   dT2yfoanXYtvFZ7bpgHlUbDErpwMmlZqaCf0d3HuR6n6JfkdY8RkdTMvT
   55JqUy8LpNnLRTpB4td+wgs1q1ZM4/Qh7jSPEkf08+FboD0YcLyhEzc/9
   IHUVaIhL+J2zO6MOkfsEItcfdc8gJ+++T8P3+Rvz8JAepQt4ZOyusvqlv
   w==;
X-CSE-ConnectionGUID: nMlkH20sRiyHnIhLYwJlMQ==
X-CSE-MsgGUID: ROWr65Y3R4uSo+cJWDFQhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="187235753"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="187235753"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:58 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3EDAC42A30A
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:58 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A35B1C0129B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 997771A0073;
	Mon,  4 Aug 2025 16:33:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/18] python3-matplotlib: upgrade 3.10.3 -> 3.10.5
Date: Mon,  4 Aug 2025 16:33:33 +0800
Message-ID: <20250804083340.1649-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118843

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-matplotlib_3.10.3.bb => python3-matplotlib_3.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.10.3.bb => python3-matplotlib_3.10.5.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.5.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.10.5.bb
index 97a2910fa2..6c4d496c02 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.5.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
             file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
             "
-SRC_URI[sha256sum] = "2f82d2c5bb7ae93aaaa4cd42aca65d76ce6376f83304fa3a630b569aca274df0"
+SRC_URI[sha256sum] = "352ed6ccfb7998a00881692f38b4ca083c691d3e275b4145423704c34c909076"
 
 inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
 
-- 
2.43.0


