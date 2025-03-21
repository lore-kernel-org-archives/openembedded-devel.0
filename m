Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6D6C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:28:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17028.1742549285642158739
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVDuWq/f;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so2634925a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742549284; x=1743154084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irGZpDR2ojw1oaz51RoslrjBKVAUzTk5/x4VAgUpdFw=;
        b=aVDuWq/fh+YnYNLatY1zmyS7YqHWtulMY1GRzEJYV8p1mK+Rztoh1dN9BBFbjUBFWQ
         fx9mjOsjHCtxaHIux1PExQ12fiEMIyNqdrfPaysBr5hTsRoAK2yjFDi4CGjlLkNudJjb
         8TnYs7RHC8tw+IYy+A1FHpmHYNu59Ue37MAnvV3092Aam5yX10EBOydHOK1jFKnkZgpp
         N5MByxrw0s2UyVx73v5suPW5Z31F3r1F4cVGtC/uHWtfgUPK6v5/aXYBkMmlgsXlMS/t
         IBAdGDSSpP9V0RZKLB09iMG8nAIeq1rrfng8qjvnoWW4VafEGQvx4JpgcV+VIt1Hn5xa
         0H9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549284; x=1743154084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irGZpDR2ojw1oaz51RoslrjBKVAUzTk5/x4VAgUpdFw=;
        b=WzMtxKdOvzH3glvTbtHiERefxReAYG4Q7Q3ItEzKjVugjqpFHawVDKx52lkuvWML3l
         07Mevmy52PzHFdK36vM8HRh5r3OLeakDVeKwSdRDlJW+hjdZeJzT5ZX4TugZh8PbLWfx
         RAhxYGFFg4gVFRZzeJ8w6Kbu6IWW08uHF/I4Xjt2a1QiqMu6DONfUAKURszLFDnjf5MW
         Z0f06saeZ/btH4ef5GiXxkDUgc4OwAdvc/vqpcwwZm7pX+jUnQN5xdMSq/iRc5ZI90lI
         KLXbRwlKD6V13YquoYJaRo0nSSrQ/tN+uAXbA5RRroiY1x9nnUksEkfsd+Mn9WRsG5m2
         HI8g==
X-Gm-Message-State: AOJu0YwcelX3YLQtrK5FsCcSwjks82JHyUSoczx4aL4kT4Oy+vN+U5nJ
	giDIRu0j5yuHYAvsSSeYCcxcIuIPylaY5JpgRPy8ZYgCiPOfN7TotnVz3w==
X-Gm-Gg: ASbGncvtfWAxroyCqmm3CpelqH/pEbl0KXfPGq7uic0mQmz4L6lmPpgfylcoAV/YbOj
	7Iz10bk6kfHbMXOFooF2Zn4NkFCe4oOHQVB0vhGm1EkMp6nIqftCeWvl38VaqZdzA+T0cCIDMDx
	3+sTykBHuML/8l26b14YUcQxvFOCkQkgDms5EHLmWCalYTZeLO+EIToQBdL3YhUxIjaO+FQ+TmO
	AomVq40bMIQyBkHxF4vgpX9wq1LGffJOSN0BxTEZtigy3SKEE4LgBvok9pXEN8NQaLPoHKdaHL9
	JJBRJ1gIKJ7mbJKEu5S1wAltKdkQe1fK1jSVHd/8VXCxOnRmTLFJAtYjgeGKtCEgMpUwPDOJTC1
	VCw==
X-Google-Smtp-Source: AGHT+IHrSD42llZWRaLICvlBwWc/q8lfv4cnXU/QIl3gLTGc7tJfccntwsD1wRDCoz+otDiOITrNEw==
X-Received: by 2002:a17:907:bd0d:b0:abf:e7c1:b3bf with SMTP id a640c23a62f3a-ac3f24163f7mr280558166b.11.1742549283482;
        Fri, 21 Mar 2025 02:28:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3efb647f9sm116385266b.109.2025.03.21.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 02:28:02 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libconfig: fix build with gcc-15
Date: Fri, 21 Mar 2025 10:27:11 +0100
Message-ID: <20250321092711.449556-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 09:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116175

From: Martin Jansa <martin.jansa@gmail.com>

* backport fix from:
  https://github.com/hyperrealm/libconfig/commit/690342b9cbc8b39787a1501bd890d63ca63a003c
  to fix:
  http://errors.yoctoproject.org/Errors/Details/848457/
  grammar.y:58:33: error: too many arguments to function 'libconfig_yyget_lineno'; expected 0, have 1

* need to add bison-native dependency while grammar.y is modified
  with the above patch to fix:
  http://errors.yoctoproject.org/Errors/Details/848472/
  ../aux-build/ylwrap: line 174: yacc: command not found

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...larations-to-allow-build-with-gcc-15.patch | 38 +++++++++++++++++++
 .../libconfig/libconfig_1.7.3.bb              |  7 +++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch

diff --git a/meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch b/meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
new file mode 100644
index 0000000000..00ceadb10d
--- /dev/null
+++ b/meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 0511e285f3c886a388b8e9c6a4829752d60ab44c Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 5 Dec 2024 06:47:40 +0000
+Subject: [PATCH] Fix declarations to allow build with gcc 15
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Upstream-Status: Backport [690342b Fix declarations to allow build with gcc 15]
+---
+ lib/grammar.y | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/grammar.y b/lib/grammar.y
+index 87dac00..0e9d0bb 100644
+--- a/lib/grammar.y
++++ b/lib/grammar.y
+@@ -40,8 +40,7 @@
+ #include "wincompat.h"
+ 
+ /* These declarations are provided to suppress compiler warnings. */
+-extern int libconfig_yylex();
+-extern int libconfig_yyget_lineno();
++extern int libconfig_yyget_lineno(void *);
+ 
+ static const char *err_array_elem_type = "mismatched element type in array";
+ static const char *err_duplicate_setting = "duplicate setting name";
+@@ -80,6 +79,11 @@ void libconfig_yyerror(void *scanner, struct parse_context *ctx,
+   char *sval;
+ }
+ 
++%{
++/* These declarations are provided to suppress compiler warnings. */
++extern int libconfig_yylex(YYSTYPE *, void *);
++%}
++
+ %token <ival> TOK_BOOLEAN TOK_INTEGER TOK_HEX
+ %token <llval> TOK_INTEGER64 TOK_HEX64
+ %token <fval> TOK_FLOAT
diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index ad030b8f4a..a4df707dd7 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -7,7 +7,12 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz"
+SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz \
+    file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
+"
+
+# needed when we modify grammar.y with above patch
+DEPENDS += "bison-native"
 
 UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
 UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"

