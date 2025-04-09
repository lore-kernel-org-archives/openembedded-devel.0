Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35831C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:07:22 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4032.1744189637183963429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HVLJxCy9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744189638; x=1775725638;
  h=from:to:cc:subject:date:message-id;
  bh=aFLFIpeL6cgicnaUmpz+etnB4/yy3NGtqGhf+8RLvzg=;
  b=HVLJxCy9/Nu1zDcuPTy/TQcvpgnmJgOwrHSe8vTQJt1Gs+7JU7I5LEAK
   EyFMYwHMZg6akOSxwGEfQhvFiiO+eR8titg5qeDCb42ka7nAxhXQl2uxd
   uO/tDt9lGos0y4ssj7HsXwsw6P2CcY8sqlfhVMr145zgpnL+eY1/vuFSr
   QdZo3TVtBO8rsUxyRvuTB+YpPQmK5RHlOPHv7Z6Kttm7N7W3afQia5ktm
   z5QA/KIUDHXm8VS1Y/tf0GPPhRBSb3n+9GB8nbH4JbE06+YKlafTRGLSL
   Zwd+NrEy5ZRFHDUJJnCdQrSPrkTEiQPgNZ4abaPRjqLgQLVEzYwE0+uJj
   A==;
X-CSE-ConnectionGUID: Em2MqV1/SZKWPVy+DoWQhQ==
X-CSE-MsgGUID: u1VFrxrRSHmKfHPhWcpn9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="198695938"
X-IronPort-AV: E=Sophos;i="6.15,200,1739804400"; 
   d="scan'208";a="198695938"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 18:07:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6214C2262
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Apr 2025 18:07:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 68BDBD8B32
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Apr 2025 18:07:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2F771A0078;
	Wed,  9 Apr 2025 17:07:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] libspdm: upgrade 3.6.0 -> 3.7.0
Date: Wed,  9 Apr 2025 17:07:04 +0800
Message-Id: <1744189624-6858-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116728

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspdm/{libspdm_3.6.0.bb => libspdm_3.7.0.bb}             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.6.0.bb => libspdm_3.7.0.bb} (95%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
similarity index 95%
rename from meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
index 4c0483ebac..a3012e10bd 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/DMTF/libspdm.git;branch=main;protocol=https"
-SRCREV = "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
+SRCREV = "1be116c7b7713fa9003e1bd53b53a34758549eb9"
 
 S = "${WORKDIR}/git"
 
@@ -23,6 +23,7 @@ LIBSPDM_CFLAGS = "\
 	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0 \
 	-DLIBSPDM_HAL_PASS_SPDM_CONTEXT=1 \
+        -DLIBSPDM_ENABLE_CAPABILITY_ENDPOINT_INFO_CAP=0 \
 	"
 
 LIBSPDM_CFLAGS:append:toolchain-gcc = " -fPIE"
-- 
2.43.0


