Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728FBC3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 13:49:27 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.36611.1721915360283169213
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jul 2024 06:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBbA9mh4;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7a1d48e0a5fso633456a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721915359; x=1722520159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1P6zyE6uBv/YsldKKpNxFt8CE6GQNiGjtE0ufmC6BbY=;
        b=fBbA9mh4oP0cOydYvKZ3iMU3+7J2SOED2+zgS94rq+d9xmPrPDO5JdEnBJf2W66YHZ
         06w73UTGcBNi0PsLFLQlt+vFOFAUsmuBilN6ZlKcMLmk5N7N7MT2FI8NSTtqjDNzDiBz
         r0XLZjy2XLX81EtGcOWnFJT13jOIpHQuZtnxrZcWLkJFvUZ7DzrTCBcudqF20YbcUym7
         JZTNJpBTdF+elMz1DW5b3DkYqRR+Dil2NaF2ZNUAMawHUmJrzD0/kzxDfIV9ZqJTGWxK
         Un6R6B+9lxs6IZWpz6C1rjLB/fONgPkOX6C9Xuo1S3yz5r+jpQ/xf0AaIXNT39+3mDpd
         HYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721915359; x=1722520159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P6zyE6uBv/YsldKKpNxFt8CE6GQNiGjtE0ufmC6BbY=;
        b=lKmfPmnZ9D3PpwMdKH2qQb1FNWQglu6qGiqoMlxQueStrsrido6eryKyhsS53YWPbd
         +BOLgbPvvOlWij89VQAkWkEn1x7H1ErN3kGyrUgQ4uD9uMQbluV2Ab827T3bAic0IgC0
         bK2RVgBsMMnxBhsqaYZKw6gyM19NVDdZWu1qt+T8P9MpnO6RfH3biUcTfpaEIEYQ+xZZ
         XHAqUBUg1MweHtfk0AqDpYJQ9gkxpraxps6UvI0P1cXyaFjfYP0wLJJeUNmwuz2bsE7X
         XphMKKXij2ItmUKDbzvnyUnRl67tU3p5y4OS8MR01Cs1jb+58bcwhFLakZrkjhZcXTHl
         zccw==
X-Gm-Message-State: AOJu0YxyxTnVxZ/OIXJGZVwWtPrM5tFeFAh/mJ9NA3w/auXIyye0ps2a
	EnNaObxOb51FgWu4pKkxx2eLwEBrSbkBMqZTir5bxKUO+aqHWpmzMyiDuiRm
X-Google-Smtp-Source: AGHT+IEuepMVuyPcI3rMZLUjCm7BXfDBsbMdR93RQ7UPJC47gRuLfdV0P/zF/jgFw8L0/lAcUT3s7A==
X-Received: by 2002:a05:6a20:3950:b0:1c3:b61c:57ed with SMTP id adf61e73a8af0-1c472c5e7c9mr3986639637.35.1721915359326;
        Thu, 25 Jul 2024 06:49:19 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1cc38sm14229525ad.200.2024.07.25.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:49:18 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <ppjadhav456@gmail.com>
Subject: [meta-networking][scarthgap][PATCH] tcpreplay: Fix CVE-2023-4256
Date: Thu, 25 Jul 2024 19:19:05 +0530
Message-Id: <20240725134905.57341-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 13:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111435

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


