Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D310D0C828
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56071.1768299875010937771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kXGRzCO4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299874; x=1799835874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfHybLMTy06bKNuQFJJP+mIpBuMyik/DAuCWdY6kkL0=;
  b=kXGRzCO4cUYc5Yf2hK9dCblJQgBoWusLt2x8Gg3yYmZYxAHM4JHRmX/2
   kkbL3dLEY4y+GU2rYgW+Mkaz7UBMvS9nbAsxIMT5oWxA/H88+zH8Ack9d
   GClAMTFDS5Zu32MZIKlEtpp3LWiGVV3mdmdzE1l3/5ST3gZ6497cCYvQy
   ckyQ827Mtcz66J+4f+KFMzLwX9A/ry/cMYacO2M1A9T1V6WcepogSc/TN
   pcLfhOQq7Ngt0xG6opD53vNE83BvuxBis9HpAxiZWF2B6mpqlaEqqo6Up
   PXv0kp7VET5TcMbvUkaU1ClsSgT8BbgM9SSZHLKY7D9TXkpZisD0doggZ
   g==;
X-CSE-ConnectionGUID: UcZlVg2jT0SnxD7LqM+eEw==
X-CSE-MsgGUID: NuiqFL+HRfivX3nKAS5AUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225654369"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225654369"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:32 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 724891C1C703
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:33 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2AF911400374
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 54EBF1019045;
	Tue, 13 Jan 2026 10:24:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/22] python3-ipython: upgrade 9.8.0 -> 9.9.0
Date: Tue, 13 Jan 2026 18:23:24 +0800
Message-ID: <20260113102334.605-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123418

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.8.0.bb => python3-ipython_9.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.8.0.bb => python3-ipython_9.9.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.9.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.9.0.bb
index de0351175f..53d334e251 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "8e4ce129a627eb9dd221c41b1d2cdaed4ef7c9da8c17c63f6f578fe231141f83"
+SRC_URI[sha256sum] = "48fbed1b2de5e2c7177eefa144aba7fcb82dac514f09b57e2ac9da34ddb54220"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


