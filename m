Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7043BE67817
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:18:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86730.1766431087491975890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FL/nvY9b;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so2026637f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766431086; x=1767035886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydI4/q+tZkF95bka68hrg5rMO5QpeIIj+si08l/wke8=;
        b=FL/nvY9byd/wuDliStveOhrCvAtNH1DL7jqNQwYrwHBaZHj13KOaVFImNIKnG+K4lK
         Vf9Mxcf7yjyFU2QA1SZ2k3EBqzPldBPmDobh6tcrIdhklgDQT0wsnp7qkKa0UII32XHK
         XaVqVORWlbStbpJUtMFCXolOZ35JKHLkmDRu13ytKAuEuJrGV1+SFmZ4i8K3OOUyQiMP
         vZI/V0L7VLi1OdkOFLFoMk+sFgHYge89GAb9mUf0MfwbsSb2q6YvQAdu9wtRyut/AlkJ
         qBEvEkNGrubkjOPdHcqhXKCR8S0xaZKR+FJZkQC7YZSvfEhQdU4Mc217JPPUB8cBfcc8
         4b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766431086; x=1767035886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydI4/q+tZkF95bka68hrg5rMO5QpeIIj+si08l/wke8=;
        b=hAzWZ31rFI5dIk2qx3251rwpdPgFrwNedau98OThVadUB5FugU8b1pwyPcr/ms6zBx
         AOvVIiwPhntgBgzuKMYZNfnmCKKf/hFWDaH/Otsiw86CjheIKsI/uB/c0zjYp1nzdTTr
         i97T5WvLVO3sOP5utIiC3KGGZeRpQYDarDGtWtYilfjljug1qRTI9jemkBdLjnaXkHFm
         mq/JHDaVQSsuvGwJwg6jabzrM6gqn+YpvyUyw9WcI/fAr+DO4qVrK/jhReHbdfseO32l
         VtNawnHZMIddMOlgEP6P8uqFQAhOYSzWSCL+6F4r6SH4T/2VAGYb3i781LDI1ISxCYi5
         UQxw==
X-Gm-Message-State: AOJu0Yy0yGJjZvOHck5/Ao8KloUch87yHwBDa25WlgL3m6AlZHIg5mgJ
	71d0cZHX8yoZVsXQg0XhnEXwgkIN29gTrU5skttnmik4kffuvP+ugI5THGC5uA==
X-Gm-Gg: AY/fxX6/7R8v7QxhRUSrBn0L0THpDXCd6BdC2VWITk9KEM0U/M6GiuWdl+X2x8zoatX
	sjFx/vzlEXRwo3tgjQau8Pf1XglU82xnwhlxe3IoFGZKfZ0sIH5PN0UGB2OnZum07BxU2B1CkOb
	irqNBaMVrls4i+ML/e5SEM1OORpjKn7/Okr5PcmZNtzwBzxw5kjRcS39RxWA6fbeLJvVPcKePZi
	UNs+it+BjcZIShxp/R2CkyLlT7nTLSBDiBJomk57zn/d6ZEn/BuK6KKv75nP4hFZtgiKpKiUKIi
	vZIXF5AGeoywtDRWTnXb60uvDRNegCMju7VsMASIHSdLaUm1jxZsVvS6x8nVgSyfio33+1FruPo
	lwDcfnO7rJAiHIyQgon3Scs7Ra3EH5NlYywmW8dQaQgyDUBe6rim84Bf4SUNJcM30xyKbOSrMTs
	wZO29Y7Tgo
X-Google-Smtp-Source: AGHT+IEpv8/xU9rg3oqsHcRLsjXlqtx31fCnCpSkdlSVSfFgPlG2p6AFAUho/ydRvvQuTf4AV9xT7A==
X-Received: by 2002:a05:6000:1866:b0:430:f3ab:569c with SMTP id ffacd0b85a97d-4324e50a6e3mr16251306f8f.53.1766431085366;
        Mon, 22 Dec 2025 11:18:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23802925f8f.37.2025.12.22.11.18.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:18:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] dovecot: upgrade 2.4.1-4 -> 2.4.2
Date: Mon, 22 Dec 2025 20:18:04 +0100
Message-ID: <20251222191804.1468315-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122799

Contains fix for CVE-2025-30189

Changelog: https://github.com/dovecot/core/releases/tag/2.4.2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: add backported patch that fixes compilation error about missing
    libpcre2 libraries.

 ...1-lib-regex-remove-LIBPCRE_LIBS-from.patch | 26 +++++++++++++++++
 .../dovecot/fix-musl-compilation.patch        | 28 -------------------
 .../{dovecot_2.4.1-4.bb => dovecot_2.4.2.bb}  |  4 +--
 3 files changed, 28 insertions(+), 30 deletions(-)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.1-4.bb => dovecot_2.4.2.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch
new file mode 100644
index 0000000000..b872587a88
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch
@@ -0,0 +1,26 @@
+From fd3d65c65c778cf0a2fba6487c8d0eb30b6780b7 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 31 Oct 2025 12:53:33 +0200
+Subject: [PATCH] lib-regex: Remove LIBPCRE_LIBS from test dependencies
+
+Was accidentically added in 49ae6e798310e5c4b96709db435a3714ea6468a8
+
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/fd3d65c65c778cf0a2fba6487c8d0eb30b6780b7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib-regex/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib-regex/Makefile.am b/src/lib-regex/Makefile.am
+index 60f43d9779..9d26d27fa1 100644
+--- a/src/lib-regex/Makefile.am
++++ b/src/lib-regex/Makefile.am
+@@ -34,7 +34,7 @@ test_regex_LDADD = libdregex.la \
+ 		   ../lib-test/libtest.la \
+ 		   ../lib/liblib.la \
+ 		   $(LIBPCRE_LIBS)
+-test_regex_DEPENDENCIES = libdregex.la $(LIBPCRE_LIBS)
++test_regex_DEPENDENCIES = libdregex.la
+ 
+ check-local:
+ 	for bin in $(test_programs); do \
diff --git a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch b/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
deleted file mode 100644
index a09165e588..0000000000
--- a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 951e371b6e44e2051de83c9fe73c778858fa73a1 Mon Sep 17 00:00:00 2001
-From: Fabian Groffen <grobian@gentoo.org>
-Date: Sat, 31 May 2025 10:49:28 +0200
-Subject: [PATCH] lib: cpu-count - fix compilation using musl
-
-The macros, types and symbols CPU_* and cpuset_t are not exposed in
-musl's sched.h unless _GNU_SOURCE is set.
-
-Upstream-Status: Backport [https://github.com/dovecot/core/commit/951e371b6e44e2051de83c9fe73c778858fa73a1]
-
-Signed-off-by: Fabian Groffen <grobian@gentoo.org>
----
- src/lib/cpu-count.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/lib/cpu-count.c b/src/lib/cpu-count.c
-index 3eb38fa47d8..a3e80e6c157 100644
---- a/src/lib/cpu-count.c
-+++ b/src/lib/cpu-count.c
-@@ -3,6 +3,8 @@
- 
- #ifdef HAVE_SCHED_H
- #  define __USE_GNU
-+/* _GNU_SOURCE: for musl's sched.h to expose cpuset/CPU_* */
-+#  define _GNU_SOURCE
- #  include <sched.h>
- #  ifdef HAVE_SYS_CPUSET_H
- #    include <sys/cpuset.h>
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
index 40cf991ae1..e94306dd32 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
@@ -14,9 +14,9 @@ SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://dovecot.service \
            file://dovecot.socket \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
-           file://fix-musl-compilation.patch \
+           file://0001-lib-regex-remove-LIBPCRE_LIBS-from.patch \
            "
-SRC_URI[sha256sum] = "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
+SRC_URI[sha256sum] = "2cd62e4d22b9fc1c80bd38649739950f0dbda34fbc3e62624fb6842264e93c6e"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"

