Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD403C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 06:04:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.70451.1746511445938178084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 23:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MolsOUF9;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: alistair23@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736a72220edso5886303b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746511445; x=1747116245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fm5QC0XJBvt3vRLhuBMT2srjgKP4zJSi5wESkxDulKQ=;
        b=MolsOUF9iRnf21bcIyq2q+M+qKMx7nlpMciF58PZlYmYlTAj91ZpDyqLu5Az1dHWrz
         6G7Z8z7hzW3BunsaOGT2SGdru7+ZzOZ12LSeG4pXeMlViO/Yx0md3ax+DM3Ai/ZlJyxU
         SfBAlViSK+D9W/4CRuX2ujv41dWQJPBbNzyb2fyRoXKRF1TQa/ujCFPTM32/QZ/52veK
         iECDbKfH+aMDoEveqvvqncyh8fHuvqHVMMF7NA5NrxLVMCvUUHdqqhyMwXLNuB1jwL+y
         BzAWvYIFyaYMNJHLHbS3oPzNLbGyfkw2d8KaMNlsi1FQxDER3HIRr1oMEyLqlRoIDkMS
         E9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746511445; x=1747116245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fm5QC0XJBvt3vRLhuBMT2srjgKP4zJSi5wESkxDulKQ=;
        b=Dgsq2LjWGPCWrlmopUV1uYmlu75QPv7Gp48t9tuPAEBNieFhBifY+4qrpW7DA6wrRL
         9E0EAiw87Olku2BJabAkB+WxRKRmovNEMpgqWgKPk/N5aLE9SoLuuXOoaMcWMtv9GnkX
         e9UvnwdKrXlX/5rnmLARYHWaYff3ozQZvpo+uxIajnoM0QhKK2KkDPbM/tIE5TEscdmp
         sYvKRMwmINUzbDpnZQ2ZmnSeFEvvuPJbgTRMHKg5VT7SIlU01syMw7W5UbvgqxmsbWX5
         9nwOYDXbdbiWxbcM6GhTIvvmJDjc7hF4w4qvFNcraT6TIMBAezrLfKQkRpNY0qASBrRo
         Gehg==
X-Gm-Message-State: AOJu0Yz5PvhqbHb31u6Z0aWz8I8kE3moJer9/VYQjogSBAQhWbwm+uMs
	GgKDXmMP0S89omafWgjmGT3sMNTv1z+4oIZSEhgjkWtJA9E/sfqJq/FeiA==
X-Gm-Gg: ASbGnctNyYqQmMaqQwLdE5Erm9780BU+YrcgAmJB/05gBziItTqUn++muDfs4gIadAU
	0YFSQEgLPXJnYkNCaq+XZ4xbj+hIeIBdRFBe1o48zAH5GXInK4YyhIDTajbfJrdqh8MrmA/0UzE
	TNCxSKN4NEUslSkByErfOts0m7xKWDIQVVaRhiacPr1kTvMBkHrM7AW6alFPaCaXjSO05m+0oVg
	7wHyFcwj4/NsQlbR8CiFOzJzAag3lp97dV6eU+NlKj1mo+fhp7TIdajzk7jdTRqHQDE8zHvtImG
	GGbO8cRXteDzOssbisBhhglPSequPciSMqzISCTp7XZEcxNjPp7ixf2aM4Y/QqGmlep6WTAVrfS
	1zzS2XtGfwUIpJ7SJgHCiPe7YKjJYa0r6T8240ZqElZtMmA==
X-Google-Smtp-Source: AGHT+IG/+N/yjgRsjvs5lpyq4N4GcuiWn9etp6Bkg0VAD9qD/LbAViqiw2wyTlx82ri6Am8KF7Bmyg==
X-Received: by 2002:a05:6a00:e12:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-74091afceacmr2720520b3a.20.1746511444956;
        Mon, 05 May 2025 23:04:04 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7c155sm8352025b3a.14.2025.05.05.23.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 23:04:04 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] ktls-utils: Update to version 1.0
Date: Tue,  6 May 2025 16:03:51 +1000
Message-ID: <20250506060351.1270544-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 06:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117336

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...PERMS-if-it-doesn-t-exist-to-fix-mus.patch |  3 +-
 ...ac-Use-AC_CHECK_HEADER-instead-of-AC.patch | 36 +++++++++++++++++++
 ...ktls-utils_0.11.bb => ktls-utils_1.0.0.bb} |  3 +-
 3 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
 rename meta-oe/recipes-kernel/ktls-utils/{ktls-utils_0.11.bb => ktls-utils_1.0.0.bb} (87%)

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
index d27e2aa741..954b1393db 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
@@ -7,8 +7,7 @@ ALLPERMS exists in glibc, but not on musl, so we manually define
 it if it doesn't exist. This fixes building on musl systems.
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Submitted
-[https://github.com/oracle/ktls-utils/pull/88]
+Upstream-Status: Submitted [https://github.com/oracle/ktls-utils/pull/88]
 ---
  src/tlshd/config.c | 8 ++++++++
  1 file changed, 8 insertions(+)
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
new file mode 100644
index 0000000000..6aabb77ee8
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch
@@ -0,0 +1,36 @@
+From d170b04dcb8b2b28e370d8b18ffa1f593e8eec11 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 10 Apr 2025 13:15:16 +1000
+Subject: [PATCH] tlshd: configure.ac: Use AC_CHECK_HEADER instead of
+ AC_CHECK_FILE
+
+AC_CHECK_FILE doesn't work when cross-compiling [1], which breaks a lot of
+use cases (like OpenEmbedded for one). Autoconf supports AC_CHECK_HEADER
+which can be used instead and is more robust [2] so let's use that
+instead.
+
+1: https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Files.html
+2: https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Generic-Headers.html
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Submitted [https://github.com/oracle/ktls-utils/pull/90]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2c77fb1..c790d71 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,7 @@ PKG_CHECK_MODULES([LIBNL_GENL3], libnl-genl-3.0 >= 3.1)
+ AC_SUBST([LIBNL_GENL3_CFLAGS])
+ AC_SUBST([LIBNL_GENL3_LIBS])
+ 
+-AC_CHECK_FILE([/usr/include/linux/quic.h],
++AC_CHECK_HEADER([linux/quic.h],
+               [AC_CHECK_LIB([gnutls], [gnutls_handshake_set_secret_function],
+                             [AC_DEFINE([HAVE_GNUTLS_QUIC], [1], [Define to 1 if QUIC is found.])])])
+ 
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
similarity index 87%
rename from meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
rename to meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
index 650b69fcd1..ff54d72bca 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
@@ -7,10 +7,11 @@ RDEPENDS:${PN} += " gnutls"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
 
-SRCREV = "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
+SRCREV = "c787cd26330af457e1ca9cf43232db2c71c03154"
 SRC_URI = " \
 	git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https \
 	file://0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch \
+	file://0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch \
 	"
 
 S = "${WORKDIR}/git"
-- 
2.49.0


