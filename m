Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00CAC5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 02:52:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2280.1787280717055119935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 19:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A/PDb/GF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787280717; x=1818816717;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=60f6qj1PMWvA8JKgWVJ8fdNLgqnqOYd+T2/BhRtDdo0=;
  b=A/PDb/GFj2W/lpi9a9GY26LEMaE6ySLfHv2Upcg/D8yrOVspi8fTPG+7
   rL4Ee/42zV1TW3+s0dV/JosXhXMWjphJXAll3oCsGrWJkRumG9S6pP4pl
   +xn10oJRa3s8sn/5CvFDxzurkJ3Xe4c9lOV/Pv+wqozTN/kPyZON6FweJ
   k/9ALUneOVUIfXAr/dDgYTKWgsf4OGxF/oTpHJ9uzPEcOsTP9kfhAknaA
   if3iPiKujsgrIIFAxftSjxQNtwbmkUWo5vTM7GizBmZFWULohlTkLhJco
   SwMmzGLM/GjMCxPFLifSFQMOtPzEAZMH7B8sHY10ah2QJgN7FJIC8F3tH
   Q==;
X-CSE-ConnectionGUID: g5maUGgkTIeWFxb1v9Y62Q==
X-CSE-MsgGUID: pvZtsGQvTZKEn/MdUu1awg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="251600940"
X-IronPort-AV: E=Sophos;i="6.25,234,1779116400"; 
   d="scan'208";a="251600940"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:51:55 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0C2B840610D
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 02:51:55 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B524B18ABD22
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 02:51:54 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 152D9408272
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 02:51:52 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] freeradius: Fix permissions after generating certificates with make
Date: Fri, 21 Aug 2026 10:51:42 +0800
Message-ID: <20260821025142.571-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 02:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129395

To fix Permissions denied error of certificate files

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...after-generating-certificates-with-m.patch | 32 +++++++++++++++++++
 .../freeradius/freeradius_3.2.10.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0018-Fix-permissions-after-generating-certificates-with-m.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-permissions-after-generating-certificates-with-m.patch b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-permissions-after-generating-certificates-with-m.patch
new file mode 100644
index 0000000000..3a0447c75e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-permissions-after-generating-certificates-with-m.patch
@@ -0,0 +1,32 @@
+From 20473b50925ede8a00c19be50ad8d6ae77b37fd9 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+Date: Tue, 18 Aug 2026 12:43:22 +0900
+Subject: [PATCH] Fix permissions after generating certificates with make
+
+To fix Permissions denied error
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+---
+ raddb/certs/bootstrap | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/raddb/certs/bootstrap b/raddb/certs/bootstrap
+index 4641c71700..37e0469e41 100755
+--- a/raddb/certs/bootstrap
++++ b/raddb/certs/bootstrap
+@@ -29,7 +29,9 @@ make -h > /dev/null 2>&1
+ #
+ if [ "$?" = "0" ]; then
+   make all
+-  exit $?
++  ret=$?
++  chown root:radiusd ca.* client.* server.*
++  exit $ret
+ fi
+ 
+ #
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
index a2e4d4d88f..19d8e69db0 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;tag=$
     file://0015-bootstrap-check-commands-of-openssl-exist.patch \
     file://0016-version.c-don-t-print-build-flags.patch \
     file://0017-Add-acinclude.m4-to-include-required-macros.patch \
+    file://0018-Fix-permissions-after-generating-certificates-with-m.patch \
 "
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
-- 
2.43.0


