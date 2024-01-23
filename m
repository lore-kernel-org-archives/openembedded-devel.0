Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E67BC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 02:05:55 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.1909.1705975550419349010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 18:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bibgynUp;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2108c7829caso1269355fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 18:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705975549; x=1706580349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkPgPyXy+IBr6xJPLEZ4exYkBdnAi94+yu7fFkH1DZ0=;
        b=bibgynUpHq1pIPlI6ORNk9aToMocDhQcgmVJEFU1O6qqAu+M6yyW+gjdpBejEBKc9F
         nxnWnMvnU7lggX+JCTsk+3s41m2sJDCraUwrrziKtIhaxFfRiwjeCc/Ugp6wBTDDCz+2
         jXIPDBoHdyXNgVDy5JdZwKTGMKwIxXkMcI3yYodGepZe5p3/FPGZfedbQRIEpNeomMGG
         1fx3LIUoQA8rnZNFV5wF6lYQ+fgHCuLOohN8IrcZGuHbFMotY7Kudhww2BddtPW4aFzW
         xszAauho8/gobMUyuWpz7HWTlJjOiJEnqdg3LsUqquheVURw6lke/wfFAuSQrp5L1a9w
         M6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705975549; x=1706580349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkPgPyXy+IBr6xJPLEZ4exYkBdnAi94+yu7fFkH1DZ0=;
        b=NZD+CI1GU5Emxn+i45Ks2xLccCXCBusbeGBoaC+OMTnE35uaquxZO1Pd2/V9tRwedm
         5H/rpg7BSGc/LuyIdARspW3eOPXersPOYp2bWEnRXVih62AHGYPZKCqPoLWHFRH1MQNL
         wpppWitZm3snDDCmhinKENuHfawh7JOGg9DD3h0mKl/st4GaJVlaJ6sH5vED0Mix7Js2
         2NemqBkCKPRBJ1O9g5HQj1BlbS7HKIobCZXgNdyK0Ix+nIdSKlAhycKJAwDqp8A8tOsG
         q0F3Ung80xoFTCsKGQwUoYP947gZtYHgQF5naMafMNzL2GKBy3a/ShMtA815d+IUYdsU
         wHBg==
X-Gm-Message-State: AOJu0Yw9kc+1RYCPWKc5eNzpMwkXVX9os9tYuGsWRgIAEXG9ZYbmhJNh
	ZsYw1qIkWr/rfmnSM/TlSjLdd08BDxAvlv8wOUYJ/eR2Vp9U4hG4usqiXZocSlA=
X-Google-Smtp-Source: AGHT+IGsXcw4DpHrXlcmMnX9428ioyFXQECX1W7ROQEZnlfYOa+AdTQc0QKnLArmAid0tsimyB9Nhw==
X-Received: by 2002:a05:6870:ac21:b0:20e:1f0c:4354 with SMTP id kw33-20020a056870ac2100b0020e1f0c4354mr822402oab.12.1705975549333;
        Mon, 22 Jan 2024 18:05:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d592])
        by smtp.gmail.com with ESMTPSA id o8-20020a056a00214800b006d9a38fe569sm10200374pfk.89.2024.01.22.18.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 18:05:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] uftrace: Upgrade to 0.15
Date: Mon, 22 Jan 2024 18:05:46 -0800
Message-ID: <20240123020547.2626329-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 02:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108429

Added RISCV64 support

Release Notes [1]

[1] https://github.com/namhyung/uftrace/releases/tag/v0.15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb    | 2 +-
 .../uftrace/{uftrace_0.14.bb => uftrace_0.15.bb}              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.14.bb => uftrace_0.15.bb} (91%)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1a588eb29c..740835b217 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -326,7 +326,7 @@ RDEPENDS:packagegroup-meta-oe-devtools:remove:mips64el = "luajit nodejs"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc = "android-tools breakpad lshw luajit uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64 = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64le = "android-tools breakpad lshw luajit ply uftrace"
-RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:libc-musl:riscv32 = "php"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:aarch64 = "concurrencykit"
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.14.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.15.bb
similarity index 91%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.14.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.15.bb
index 415cfe1b0f..e322557c30 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.14.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.15.bb
@@ -10,7 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "04d73dc31cafef4161321e3c2443a5490ef93018"
+SRCREV = "139e3f7afb1ab8efc42983569b1e9ae697565b0f"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
@@ -36,7 +36,7 @@ do_configure() {
 FILES_SOLIBSDEV = ""
 FILES:${PN} += "${libdir}/*.so"
 
-COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm)"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|riscv64)"
 
 # uftrace supports armv6 and above
 COMPATIBLE_HOST:armv4 = 'null'
-- 
2.43.0


