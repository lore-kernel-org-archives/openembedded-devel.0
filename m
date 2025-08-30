Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BA4CA1000
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.15657.1756579398185527554
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kvIEYLM6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-327f95f750eso1327845a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579397; x=1757184197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AnFcXQ1ZzzzouuI/+HPAK7xq4Fb5Q60Y4lM8YUlPiY=;
        b=kvIEYLM6mOoOCAwkH1MazxyXeycnEOXieab3DmlnQ32xI+OyMbKzexN+rRVKvsjtoW
         vsR8ZePlw/3lkhL8BaJ+Vh6KTvFKqUBYeSK4JFQ78qvHLFg5ftFAGkbM1zboZ396hiyQ
         kF2VR6NebvfVU2kuU/+Mk60yskMT2tj6PQMd6qGA5/cmYJOWVP7qMVmr7MEny32RX6BI
         oFa2eraDFAZimWuItEZHZwyGhHKjo8z2dJ0Qs56mUxdq5fQOnRKB/qh5wAv9at4+qx5V
         i1DZJObT1HHj34YrC+Zy1LkmZRotKhggLrjPnNWvz0bk4lDf/uvbwtshy/X3cXmpi/En
         0Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579397; x=1757184197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AnFcXQ1ZzzzouuI/+HPAK7xq4Fb5Q60Y4lM8YUlPiY=;
        b=OIzbRufts4HALY4RLGiCuifuoWIdr4I/g51qQ6GBzLQN7Hgi9asUr6ir8QpCoxhifA
         hw8yJ0sli8zPgROr8yXC7Go1kKt9XjaTLb/+Da5mR+bJuqhRniBYLijaOKVryfW0ZdY7
         ZTY/Y7V1WKE7UIJOVhPrlsWb+XQhpbteBqE37vBJEFukkTSJZU1tfKNfhdPtjjwnIArE
         PRhEnSBYhXZFkN+Lm6p5lh91jaZK0ybkgbbxz83Ztz+t9igLW6dkuYFwVW0f2etnaXrR
         U/+DrAPJJnb3G8JCxvh33xYy4TXDaGMWeSwofpopwYRglN/3QLDnWKQn0z9Sbi6SpeOO
         w0SA==
X-Gm-Message-State: AOJu0YwH9Mu5WbcJCN8STxlO7ePTReoBFg4wzAM42sKz6Z9YfyKp40bd
	dFlGn7WAWj92BCRoPrUa0kA+8fJ4LX7V6n+hfr7KJyHSQv+od+qhIvcv7VhIEv8K
X-Gm-Gg: ASbGncvTUV3EjR+v7q7SmGjM0ZH9t4yrNz4THlycCqn9+stYRS4jzmEQv82JwM+z/bn
	RC0xanUNVPqjgHI9BThR/HM5QGp3i6ubIennV3wiWG+IQBg7sn1DQeefzBuSn7lox4jAGKQTRqI
	KUJddQR6CygiVKHlS4vqSa37wB4fAlvum474tYykhvyVnXohl5bVGVdq/A6wkifmUHP5/LTST1P
	i3flFKugiYhoffTdgSCifVSyaG+kQ50tUWOdrbY96xqq1huzX1b0nFTOWiJi/33jvGRgd1wVSAR
	HbyvNv1mnwDw8QVv9eQNY6HH7qaQ16JgkrWFcCNvCwfZxb13HH5YLNNnAqgIAUGUKhWoHyKdF56
	iBQmIITx5LCpRItWKmTnSfGWMfNuGChF1Z8Vry1drXmPx9+zkq8YRfeSds4RTIYNQgFlWtChMZM
	XhGRFSqOejycXQRBauED83hRgcLCLHe5e5vZeA2wWklrpVb6jzy3s=
X-Google-Smtp-Source: AGHT+IHYu+QKj6yTO/pqs0edcJdaLb+0NMxywga2Eb2Alu5N4JfF0LOKdYAFUwtf8JRtDJPjkPJvOw==
X-Received: by 2002:a17:90b:1b12:b0:327:f050:cc82 with SMTP id 98e67ed59e1d1-32815452f4amr3946949a91.15.1756579397256;
        Sat, 30 Aug 2025 11:43:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/8] ot-br-posix: Fix build with clang-21
Date: Sat, 30 Aug 2025 11:43:05 -0700
Message-ID: <20250830184311.1018374-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119145

Update to latest tip of trunk
Fix mbedTLS issue seen with clang-21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...itialize-mbedtls_x509_time-at-declar.patch | 32 +++++++++++++++++++
 .../openthread/ot-br-posix_git.bb             |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch
new file mode 100644
index 0000000000..3949caa94f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch
@@ -0,0 +1,32 @@
+From c214f7884155607861d43dbfceaeb1c2d9f20740 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Aug 2025 17:08:23 -0700
+Subject: [PATCH] x509_crt: Zero-initialize mbedtls_x509_time at declaration
+
+'mbedtls_x509_time now' is a local struct variable. passing an uninitialized local as a const *
+argument is UB-risk, since the callee is not
+allowed to write into it.
+
+Clang-21 got stricter about const pointer arguments finds it and flags it.
+
+zero-initializing ensures all fields are defined.
+
+Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/10377]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/mbedtls/repo/library/x509_crt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/mbedtls/repo/library/x509_crt.c b/third_party/mbedtls/repo/library/x509_crt.c
+index 2fd56fbd7..d09060fd7 100644
+--- a/third_party/mbedtls/repo/library/x509_crt.c
++++ b/third_party/mbedtls/repo/library/x509_crt.c
+@@ -2523,7 +2523,7 @@ static int x509_crt_verify_chain(
+     int signature_is_good;
+     unsigned self_cnt;
+     mbedtls_x509_crt *cur_trust_ca = NULL;
+-    mbedtls_x509_time now;
++    mbedtls_x509_time now = {0};
+ 
+ #if defined(MBEDTLS_HAVE_TIME_DATE)
+     if (mbedtls_x509_time_gmtime(mbedtls_time(NULL), &now) != 0) {
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index d0b4f81a4c..ff8b103a9f 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
 DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
-SRCREV = "7142b740479e50f6f2c2a91a369b9c36e024fe0d"
+SRCREV = "0700948634b85947e893a65e3d510ed870a5755b"
 PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
+           file://0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch;patchdir=third_party/openthread/repo \
            "
 
 SYSTEMD_SERVICE:${PN} = "otbr-agent.service"

