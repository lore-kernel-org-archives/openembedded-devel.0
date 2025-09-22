Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515C6CAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 03:59:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.43100.1758513583176250591
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 20:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SCd7JrAA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758513584; x=1790049584;
  h=from:to:subject:date:message-id;
  bh=ig4HkK8QoZBnjbdd7dTfUurf0C7ebyXrC3506Nf2tzU=;
  b=SCd7JrAAToQZu1Ipf2cjf7HlGzD05C6349wQu5Vjhgq6da4Md9mXRJil
   QDkHYJTRH/PNGWyCG3xY3JReWR8c6nCTztpRIDpIL1cvVJjJcXoY+pwC8
   FI/67jRl/x3Nqqsmu91Dy8PqRKG0OsPg3eY/Bz+VChynqs/O91NXvYeC7
   DWVJ/jyFcxZtkhfEhcQberxM1pn0LRyGFHJMcAlta4JCxzTli+Pe6NaLm
   mubpS4RnKj7T5ofD7n1xogwk+PqBijsUtT9XQ9OX3GFs8jZW6hmk4kMYu
   RjCVU+u9r1fT2/75pse5lCM2Vz5P3737Gg+h52RzST9xurd6ZHUts3Und
   A==;
X-CSE-ConnectionGUID: hEyzzctWROGwNQBkR4RIsQ==
X-CSE-MsgGUID: MV7q54+NSQqM8qF/GqUvgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="213604779"
X-IronPort-AV: E=Sophos;i="6.18,284,1751209200"; 
   d="scan'208";a="213604779"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 12:59:42 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 613831C0008F
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 03:59:41 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 199F118009EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 03:59:41 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 7F1682000202
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 03:59:39 +0000 (UTC)
Received: from zhengrq-VirtualBox.g08.fujitsu.local (unknown [10.167.135.148])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 990871A0071
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 11:59:36 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe] [PATCH] freeradius: Fix service start error
Date: Mon, 22 Sep 2025 11:58:02 +0800
Message-Id: <20250922035802.3288-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 03:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119638

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


