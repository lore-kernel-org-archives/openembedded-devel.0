Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3857.1794729115086483031
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BPuIt+Gk;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2983130eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729114; x=1795333914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDwY9s+PDzaxRYf1l+7xJzF+TfQ3L1y9WqpltrQeYNs=;
        b=BPuIt+Gktrlh7FcKij1Alfj+a1KKlETDqqZb0FNE7P3IXl+/e5CchfCTQxY1mxK5LF
         h2KkS61afB/zKiLzISTsqhk7HaBk4PtiUHmVOB+cGcvKemlaBVMXdtSiQul94eHzvYCH
         q98fEU18MUVoCOBiMCUSUWCowkrFhGIh5KCsdsmUw1hll2hlrO+8N83KB3KNoPsQ7OGU
         2d7NXyNm+0VY6aA5Blq63Cj0GTzCvjv3o1B42ZF1MzLcETzItyn7gpzVFJO9yhSO/g4/
         S2Yjxq7MHUmqOuk9ckrcJt0TNuZC8pDC9FvwmOLCRktv7s8UqZfqVr3EwnrAfHfNCGSF
         WZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729114; x=1795333914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDwY9s+PDzaxRYf1l+7xJzF+TfQ3L1y9WqpltrQeYNs=;
        b=ENBZhpNE6z9cMeRK15FtLv7vId2f3muPajDNRoLZd+8D+SNuTzCuQQFIdkas1sxLhs
         uFSY5VN0aEKtI00m7YFQX9jXTs1VU+3DBM2kxfmqn9Y6Rc+0u2cMmrmJP4Ls1CeFmvcy
         +FlrcowoTPnlcvVEoJqggw4YyzGZFivIW3lwvxHgMDfqS9ZPdW+xJqppzR7wQaaMpvrD
         Mhu5Eo7NiwewTjgxnPsKkwtiRbUiMjfyeyOxbfQI0xh7wHQCdfaPXn6oAUzkCGD+H89e
         826rrBXBaK+5rpbLLhZVu8wzESKH8AX7nGg1C1WZm47w+1/hYJepd/OS1qbWPdai72O8
         5hvg==
X-Gm-Message-State: APuU4Z9WacyjLoAwTaMyIkKl/2BRIzoihPxAfijmLK2OrjK6ox6SS20R
	MsEob8cuMbWGrYKQ/j7DUaISLJsygMxmayqFYIYkbiaGk3uyPufuLndL9teDkszD
X-Gm-Gg: AYBFou28hJgunCUxsT+jqqwKvPVG9qW7tMCGOPNMECDR/fR8tQz0s2FmRsehHfMH8HM
	k+dWUPu0mKPQCJJIi59AaGYaoMXsmKg0mqIIV0Ia4E4pXycigqO+C/GxPOjNd/XBHsUZtecMOj8
	sJ6E8Bby6WthVhUbN/gI5qfa4f6AH0h1Hmj+HMqH5JWpKR+3pHJMHyhrameCoSS0blx6dxWY3eV
	IVZ6msN/Ky+a3goUl7e+bJj5yc4Wb7RdtUlzX1F3J5dnQYphHZNQc3y90aWTWh2kJlVv9SF6G9G
	PsdBgSCoxB7JQ5shYxolhdEM3GswFbY38Oxc1/wnYlX4hpJWPWZ3LNYQq50nQ60ULE55S1bFbj3
	TbJWpNjVcyspHVVt7HQDGPQNYQHV6dz8T0b2zHDDLpM9HgEz48n4JtGBQaqVmUtSa6KNtKQu1eZ
	PSaPeowhpC/7Oh/RH0VAl66x/wYA07lm+ptxpqHveCzuBf95D/LPmAki1XyswO/V7yKnPPfSbQS
	FFPhbcMEA1XBqUtRnvgbLp/c8MKj03iOQ7OSCFNRBGTqVHCxCME+OCZTeXnwJEcrh5D5a1sd+V6
	M9IXMG0/6qo30jKcfG31Tv2wA72/PnYsQJPHkIO4Ac2rjD+6BZ87nzXTooR26St/5VRJBOB33fi
	ZmBuHILgNrCQp78LHUWjUg89nUyUeipKshnRYV2LJtW7LzZW3VfT+LzZN9yU3gBZM+jdLR1XN0M
	CWkWtFhIvLxhruMeXyTf6wbJKxcw6msDPV5B5nSvkQGaDEYexOhWCJiF3fC1XNlopSGKLC4DW0e
	16lu/82JHqpcbP4TsllJI7IPPjjz8oLNxsGxvPYQ8MFSm0twcHeHxn57TQuiOBCmJZiphf7cTkS
	fZ1o
X-Received: by 2002:a05:693c:8084:b0:378:1191:43ca with SMTP id 5a478bee46e88-37966e3b292mr8090227eec.18.1794729114440;
        Sat, 14 Nov 2026 23:51:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 94/96] xmlsec1: Fix poison-system-directories error with gcc
Date: Sat, 14 Nov 2026 23:49:12 -0800
Message-ID: <20261115074918.2932593-94-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132364
Content-Type: text/plain; charset="utf-8"

The oss-fuzz programs in apps/ are compiled with XMLSEC_OPENSSL_CFLAGS,
which is meant for the installed pkg-config files and contains
-I${includedir}/xmlsec1, i.e. -I/usr/include/xmlsec1. Backport the
upstream fix to use the in-tree crypto cflags instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ass-crypto-cflags-to-fuzzer-programs.patch | 64 +++++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.3.13.bb |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0010-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-programs.patch

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0010-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-programs.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0010-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-programs.patch
new file mode 100644
index 0000000000..89b280f086
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0010-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-programs.patch
@@ -0,0 +1,64 @@
+From cf60007b5b35ba81d148f20bebd8a0f1d847f5ed Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@gmail.com>
+Date: Mon, 2 Nov 2026 15:50:24 +0100
+Subject: [PATCH] (xmlsec-build) correctly pass crypto cflags to fuzzer
+ programs (#1443)
+
+Upstream-Status: Backport [https://github.com/lsh123/xmlsec/commit/cf60007b5b35ba81d148f20bebd8a0f1d847f5ed]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apps/Makefile.am | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/apps/Makefile.am b/apps/Makefile.am
+index 8b3fda22f..a3f3086ae 100644
+--- a/apps/Makefile.am
++++ b/apps/Makefile.am
+@@ -140,6 +140,7 @@ xmlsec_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+
+@@ -205,7 +206,8 @@ xmlsec_dsig_verify_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+
+@@ -240,7 +242,8 @@ xmlsec_keyinfo_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+
+@@ -275,7 +278,8 @@ xmlsec_keyload_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+
+@@ -310,7 +314,8 @@ xmlsec_enc_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb
index a06ec311b9..ed0cea811d 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz
            file://0005-nss-nspr-fix-for-multilib.patch \
            file://0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch \
            file://0009-oss-fuzz-enc-Skip-the-DES-key-when-DES-is-disabled.patch \
+           file://0010-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-programs.patch \
            file://run-ptest \
            "

