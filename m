Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD4510A3D81
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46433.1774526283721514317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pcvuFe/u;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526295; x=1806062295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nYcPj59luDJFzK8dM2+GoVVm4mnJc+PLbyYdY/G4O+c=;
  b=pcvuFe/uHfgDh2uKXwVyOc4ghAcyIyQFNNdGLZ+0z/8hn/XXZs0Qs7Nd
   81LrnG3pP1CK10CzDKLfV7SaDutVkj13DgScT8aZUyByAcOQHQKxnzMDe
   v2Flko4AklgNfyk6cVtyHvEkLlu8sx/ZJMxXZbr2W1mp5LSLGlqIiipZb
   qm1fivhkLHB2Qun+ehFqQLNOG28ZbRJJLXYGUyd846Mefb8T5jw8c2yrG
   VSW1zT+g52yAiGHIKefjLzdmsG+VOWq9ifoc6Zl+RU/2EABexLcHKzgGQ
   hgoj8/PF6wTcpzHnuMvwlxBY5p5kp/11JbHbrSFbIoVSrcVK1FZ3Z6C9+
   Q==;
X-CSE-ConnectionGUID: 7BrlWDCZSc6WfCZ9y4R0dA==
X-CSE-MsgGUID: qfOhlbR3SHq7o8Rd3mPAlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420931"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420931"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0BB081C1C702
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:15 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BA5C3181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6065C1807149;
	Thu, 26 Mar 2026 11:58:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 59/63] sip: upgrade 6.15.1 -> 6.15.2
Date: Thu, 26 Mar 2026 19:56:29 +0800
Message-ID: <20260326115634.1199-59-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125714

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.15.1.bb => sip_6.15.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.15.1.bb => sip_6.15.2.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.15.1.bb b/meta-oe/recipes-devtools/sip/sip_6.15.2.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.15.1.bb
rename to meta-oe/recipes-devtools/sip/sip_6.15.2.bb
index b00d5d5e7a..e6774cc52a 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.15.1.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.15.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "dc2e58c1798a74e1b31c28e837339822fe8fa55288ae30e8986eb28100ebca5a"
+SRC_URI[sha256sum] = "01f8946062e94622f2de5954b9aa44ca27795ac1577a940a121ddd4d1da02568"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


