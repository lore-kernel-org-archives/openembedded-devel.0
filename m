Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BADCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:20:17 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46628.1758529211977136035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LsKwTx1M;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758529212; x=1790065212;
  h=from:to:subject:date:message-id;
  bh=ig4HkK8QoZBnjbdd7dTfUurf0C7ebyXrC3506Nf2tzU=;
  b=LsKwTx1M8NF/sajdGjB1Ds2Iqx6+KtmhW5W3ywfCu/9AH7LpwKynMcwn
   1G0gR4UBS9IecmK6vt6NlC2zaYu5i78jbUypz63qgiCAa0fOYc5Oczb/b
   oWaM1acXMoNsKP1vAdIySlKjUmRlHmNx88bQYHG/W9CM2xulTDLVrPiUl
   8ITnwNIJ+mTgo4hmbapHWkTe5biEl0+UyFFKZ7Tek0P6wGCcp+F+YtIbu
   hQEFyDEet0Vza/zXO3ZbqIG47+peX/c7LEGJr23IRNFL4QcGNgSR2Cd+d
   8nRRbuGJEwvEgHj0VI87VvL1enpbg+YqEQ4Y911koHJE/mBPo+d5rvQoz
   Q==;
X-CSE-ConnectionGUID: NBR5US5tQP2CZGELbsKjMg==
X-CSE-MsgGUID: dZWyhPf2R0+M74tnTAzVMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="202088922"
X-IronPort-AV: E=Sophos;i="6.18,284,1751209200"; 
   d="scan'208";a="202088922"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 17:20:10 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4F4BE42A314
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:20:10 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0A8B31000241
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:20:10 +0000 (UTC)
Received: from zhengrq-VirtualBox.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3A2C5180053C
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:20:07 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][walnascar][PATCH] freeradius: Fix service start error
Date: Mon, 22 Sep 2025 16:19:08 +0800
Message-Id: <20250922081908.27044-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119640

Following error occurred while starting this service.
 Error: tls: (TLS) Failed reading certificate file "/etc/raddb/certs/server.pem"
 Error: tls: (TLS) error:03000072:digital envelope routines::decode error
 Error: tls: (TLS) error:0A00018F:SSL routines::ee key too small
 Error: rlm_eap_tls: Failed initializing SSL context
 Error: rlm_eap (EAP): Failed to initialise rlm_eap_tls
 Error: /etc/raddb/mods-enabled/eap[14]: Instantiation failed for module "eap"

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../files/0018-Fix-Service-start-error.patch  | 33 +++++++++++++++++++
 .../freeradius/freeradius_3.2.7.bb            |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch
new file mode 100644
index 0000000000..c5bcfe718e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch
@@ -0,0 +1,33 @@
+From e97ffc1f820beff12bb8084e6337168a1cd27540 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Sat, 20 Sep 2025 06:50:17 +0000
+Subject: [PATCH] Fix Service start error
+
+change "fips=no" to "-fips"
+based on discussions with the OpenSSL developers in
+https://github.com/FreeRADIUS/freeradius-server/issues/5631
+
+Upstream-Status: Backport
+https://github.com/FreeRADIUS/freeradius-server/commit/59e262f1134fef8d53d15ae963885a08c9ea8315
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ src/main/tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index 2a348eb9bb..02a4c24f70 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -3644,7 +3644,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
+ 	CONF_modules_load_file(NULL, NULL, 0);
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+-	EVP_set_default_properties(NULL, "fips=no");
++	EVP_set_default_properties(NULL, "-fips");
+ #endif
+ 
+ 	/*
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
index fea4d858ed..181d9e5d18 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
     file://0015-bootstrap-check-commands-of-openssl-exist.patch \
     file://0016-version.c-don-t-print-build-flags.patch \
     file://0017-Add-acinclude.m4-to-include-required-macros.patch \
+    file://0018-Fix-Service-start-error.patch \
 "
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
-- 
2.43.0


