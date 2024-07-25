Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849B2C3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 13:45:27 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.36729.1721915118144127595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jul 2024 06:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rr49vxWH;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70ea2f25bfaso679902b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721915117; x=1722519917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1P6zyE6uBv/YsldKKpNxFt8CE6GQNiGjtE0ufmC6BbY=;
        b=Rr49vxWHvMsUYBJ1n/6hZ5CwlM97bIKKaojljqt0mI0IzuezMo5hzgZ/GP6eGl+OI8
         c6UBJbDsSEdGXM20HvdiZYbRAILC22Pwri/RDXSMxyeevHt9ZG18L5Qzc1uTRkO2Y1GZ
         zfhk1ZIJwevHmDzOKtJxyC40hUX62jPlowMuyPYpdBy38Djuf3giKf0dzHPlWHZrK1vv
         Bt5MnURMy37nuBuJzHEBXNhSVTwbNkvHCqFSxOqy4OtnHme44169YOA5Io4PsA7B2UXh
         AAh4qS2+M5xyoOO1JX12G3yD4CVtC9ejWjVgtRht14B9BkZfLPlvL0y6QAMqXkMG+T15
         RFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721915117; x=1722519917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P6zyE6uBv/YsldKKpNxFt8CE6GQNiGjtE0ufmC6BbY=;
        b=hn3UacTmw6/datjqRv3psVvgOcPasIrIBnvuT8GZ/yQIdJ7KjuEFHRM61/M6Bdxq6T
         yLmJZrLCfycuHDyWoHHMNFLG6T1OKVH9qTFz/g/n3QflscDhoC8xgtEQRDze4+9YJ/Zh
         LANwS2oExLZ/did+Ep2gwKAlFJwexsp135UJUdgzVqgwNYJepo4/5mP5zsbzq7icZEor
         OxRl/usqP+8Y9MHqDiN+lVwqdTOfURvgfSsyO0e9bZY+fZ0As5ZdDCdMTE/td+t7cTDQ
         GLawXKoItvyZpxXUifPyfAOn5Pm+iHt+JbCp6G6+496L11gu5ksuUrnB/pYCO9Ymcjk5
         TDog==
X-Gm-Message-State: AOJu0YyzDia0bTixkWAOZIJpvTXwcp9AlEBlQqZlYjJMpGXYOj5Zm1cu
	Jj2gyRTvGZc5J4sASOWewr/N0MljEF5ow5sgbfXolHxkf/BR9nweC8+Wcgbd
X-Google-Smtp-Source: AGHT+IEgNtTMBn5HK0BH5ROBCgaadJ84Dg3KZEvOIqH91Q0MJtKY4EEFHTSMm1Is+566pPuvvxB8lQ==
X-Received: by 2002:a05:6a20:8408:b0:1c2:8be2:1b48 with SMTP id adf61e73a8af0-1c47b1f08dfmr2134867637.13.1721915117229;
        Thu, 25 Jul 2024 06:45:17 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f7d6bba6sm1216097a12.9.2024.07.25.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:45:16 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <ppjadhav456@gmail.com>
Subject: [meta-networking][master][PATCH] tcpreplay: Fix CVE-2023-4256
Date: Thu, 25 Jul 2024 19:15:06 +0530
Message-Id: <20240725134506.56656-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 13:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111434

Add patch to fix tcpreplay CVE-2023-4256
dlt_jnpr_ether_cleanup: check config before cleanup
Links:
https://github.com/appneta/tcpreplay/pull/851
https://github.com/appneta/tcpreplay/issues/813#issuecomment-2245557093

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-4256.patch   | 27 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 28 insertions(+)
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
index 26de40a65..16cff2f0e 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
     file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch \
     file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
+    file://CVE-2023-4256.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.25.1


