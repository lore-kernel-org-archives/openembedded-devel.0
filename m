Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA5C3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 12:03:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.34586.1721909021635750077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jul 2024 05:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ErM3nxAQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fed72d23a7so5874145ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721909021; x=1722513821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yj4vhh3bUunzwAz/o2Sp/masqMMm7RGbewVOcsjbqyA=;
        b=ErM3nxAQAGq9yL8w7KvNcszaQsNxtDdbLap2+C+0d6CLU5aADICRmiCCAJAzc2q4NN
         IE8D3K+9fSdK30zDVEb2pR1xYP3ymL6JbMKL7bsVlWtnGQaIMrp7R+oUzHJk6CbIf8EO
         jVqCBc2WR/ScuYtI96wYYkQ6gPdzR5CWs9c77/Kkwe2QUIwZyzi2FQ5U7av0YmMKPHQz
         M/SUY6caklUtt7eLmmnCUHEoxj2MrKlvNHCfyXj/eIodtQxAGhBh0HwTxOfP/x1eepdu
         Q4VcZ65I930uXFKC3qDfOrLFO5KTNTYrCqKl3A06uUcL7l1l0wdeqbrjK+r7YoowIatJ
         o03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721909021; x=1722513821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj4vhh3bUunzwAz/o2Sp/masqMMm7RGbewVOcsjbqyA=;
        b=GbwjPAnVtxp9tOy0GW5Ah6LMB2tOm2UQQhuM3PNMcYgg8kjYoZZtEQIEOvpZtNdGyO
         iwn04W9Cm5qFZA6hHk3/rfP9ZBVFjDugiYBki0vhibTENAOkNAo368R3dpAN3CFoHZDF
         JfOIuS/iv6KRFr1sNYqT8fU+Y3WQQyxSRilQnA/9kY+AeCxPoZRmHlJCvygFUffBOeE/
         vSXG51eCMgCU0CJYmXRN9Qe/LMPyc1byGDXi/wrD/1nFJXhPBmYW9yLD2Jw7cTM/bCyK
         qivGH0iQMwxHoi8GJqKM3LHS2fKOUVT5Pvdv+WQMaSw9cMLsvVSe5CuMY7XtcqkhvDjk
         YZfA==
X-Gm-Message-State: AOJu0YxAl0qJ5VusC2/wyYjpKv/FGfTY4K6jITMKoU0EkupOoamWhE6q
	zYWTXFLFcj51uzqvNWWCagwY/xdEpEYjdM4dcID0eKrLTg8E4jc7l6LEHVpa
X-Google-Smtp-Source: AGHT+IF9n4vlJ5fnfD2/g69nJIFb7dTWJtoG+/H2CRVqnnst1QvScB6+puoIjANbO4drpos5ra6tsQ==
X-Received: by 2002:a17:903:2290:b0:1fd:aac9:a72e with SMTP id d9443c01a7336-1fed92f348emr21438165ad.43.1721909020645;
        Thu, 25 Jul 2024 05:03:40 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f884997bsm929548a12.43.2024.07.25.05.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 05:03:40 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-networking][kirkstone][PATCH] tcpreplay: Fix CVE-2023-4256
Date: Thu, 25 Jul 2024 17:32:52 +0530
Message-Id: <20240725120252.53189-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 12:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111433

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add patch to fix tcpreplay CVE-2023-4256
dlt_jnpr_ether_cleanup: check config before cleanup
Links:
https://github.com/appneta/tcpreplay/pull/851
https://github.com/appneta/tcpreplay/issues/813#issuecomment-2245557093

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-4256.patch   | 27 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
new file mode 100644
index 000000000..2e4eee025
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
@@ -0,0 +1,27 @@
+From 62bc10d4f1d2c9e2833ef2898fb0170e9300a9dd Mon Sep 17 00:00:00 2001
+From: Marsman1996 <lqliuyuwei@outlook.com>
+Date: Tue, 2 Apr 2024 17:29:21 +0800
+Subject: [PATCH] dlt_jnpr_ether_cleanup: check config before cleanup
+
+CVE: CVE-2023-4256
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/pull/851]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+index c53ec297..9642a2c2 100644
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+@@ -164,8 +164,9 @@ dlt_jnpr_ether_cleanup(tcpeditdlt_t *ctx)
+         jnpr_ether_config_t *config;
+ 
+         config = (jnpr_ether_config_t *)ctx->encoder->config;
+-        if (config->subctx != NULL)
++        if (config != NULL && config->subctx != NULL) {
+             tcpedit_dlt_cleanup(config->subctx);
++        }
+         safe_free(plugin->config);
+         plugin->config = NULL;
+         plugin->config_size = 0;
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 1e2495efd..32c978c1e 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -7,7 +7,9 @@ SECTION = "net"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
-SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
+SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
+           file://CVE-2023-4256.patch \
+"
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
 
-- 
2.25.1


