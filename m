Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD921C46CD2
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 15:45:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.28568.1703432706018305749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Dec 2023 07:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0AW+dNH;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d51510536so4322725e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703432703; x=1704037503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXmDM5UCTnKqvno1EkcEWo50p+gvJEwZCtkfETU0LL4=;
        b=R0AW+dNHaYVmdA8/28g2FL/8ncHhIayHNqhaSgHjQULPuIZltFUhHaF6GHyYpEXsUg
         GaskN2oiuFkjMrBFGLDR6WWedhI2GEjDzECELKfnAcfefVmfLzJG1wBK8bG4rcpSg8Yo
         RuztaLpladh00KMD6VxLncC57BJO3GKibjMbURKuGWwvG7WRJum+2PgxV7aeTP06tOQU
         Aq09RXnUm6wyruCmHEuDTiQJa55AMVTJSXtCVf/hKMq2JWi9Lboz589DxNvsPjmJCuMT
         VroK25owB2b3fnjkpSQ51AYmDoMEE9nQodbrMwZODy1P2JK708ZamFfq6kl4KaXvf/Qy
         1B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432703; x=1704037503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXmDM5UCTnKqvno1EkcEWo50p+gvJEwZCtkfETU0LL4=;
        b=HnCG6VBVeH1e+kLdQQTfK2um7lAjt3QRubxBk9Nlj68HUuXxn+x7v7Wkm+RbXfeZam
         Etkjzs8taxsbnuNweSfAf64YfYEpJEeIsGkO1pyqooSjAHnnXogeDTXNcL7Tyn687Yf/
         jpKDYJRWc4VQ0KjRBoMVv0OsGbj48AQYus78kIsL/znOBMuE+UTqYfYzxs2d1izGMmwT
         +0xznW6MSNzxAeu4PDr5XAgWyk+p/GwnLZNg6fKYOuMZ0KaNSz4v5Dp3HfwyZxqm97Cr
         216+VJlQ9FmJQh+N7QLnf7PS/NaCgvcrNz1otUtl7pTRua4wxG+of9d8UBo9vVyHhXR7
         aUmw==
X-Gm-Message-State: AOJu0Yy2FY1pazncCKbiUUyiY7TLmRJxMBrOGf0zuPcaClAWZzSWUTEz
	VH5dbkcCG6UT6/bjvp+er0cN19Ggzho=
X-Google-Smtp-Source: AGHT+IEOMbuHCIQCRcOItdjCYNHXwUptlrXrEOdDwdDXtBPHkYtAtEPkBv0NUEtdK9n94qp/SShoXg==
X-Received: by 2002:a05:600c:518a:b0:40d:4953:8e08 with SMTP id fa10-20020a05600c518a00b0040d49538e08mr1780416wmb.157.1703432703151;
        Sun, 24 Dec 2023 07:45:03 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b0040c4886f254sm21929439wmo.13.2023.12.24.07.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:45:02 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v3] bearssl: Upgrade to latest
Date: Sun, 24 Dec 2023 15:44:58 +0000
Message-Id: <20231224154459.27680-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 15:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107781

Install headers so that dependencies can use this to build against. Make
`brssl` executable, fixup library soname. Drop patches which change
build flags in favour of command line overrides. Add support for static
build.

Changes:

Thomas Pornin (4):
      Added generic API for date range validation (with callbacks).
      Fixed RSA PSS verificatiobn bug (when hash_len != salt_len).
      Added macro that indicates presence of the time callback feature. Also added C++ compatibility.
      Fixed spurious warning about old-style prototype.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- Drop setting of ${B} which matches the default

Changes in v2:
- Drop patches which change build flags in favour of command line
  overrides
- Add support for static build

 ....mk-remove-fixed-command-definitions.patch | 57 -------------------
 ...LDFLAGS-when-building-shared-objects.patch | 32 -----------
 .../bearssl/bearssl_0.6.bb                    | 27 +++++----
 3 files changed, 16 insertions(+), 100 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch
 delete mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch
deleted file mode 100644
index 00be224990d2..000000000000
--- a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 4ba61c59d3488c263d106d486b656854a57ad79f Mon Sep 17 00:00:00 2001
-From: Jens Rehsack <sno@netbsd.org>
-Date: Thu, 13 Aug 2020 15:26:30 +0200
-Subject: [PATCH 1/2] conf/Unix.mk: remove fixed command definitions
-
-For cross compiling in Yocto or with appropriate SDKs, commands like
-`$CC` are reasonably predefined.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Jens Rehsack <sno@netbsd.org>
----
- conf/Unix.mk | 10 +++-------
- 1 file changed, 3 insertions(+), 7 deletions(-)
-
-diff --git a/conf/Unix.mk b/conf/Unix.mk
-index 02f2b2b..05979fc 100644
---- a/conf/Unix.mk
-+++ b/conf/Unix.mk
-@@ -37,23 +37,19 @@ RM = rm -f
- MKDIR = mkdir -p
- 
- # C compiler and flags.
--CC = cc
--CFLAGS = -W -Wall -Os -fPIC
- CCOUT = -c -o 
- 
- # Static library building tool.
--AR = ar
- ARFLAGS = -rcs
- AROUT =
- 
- # DLL building tool.
--LDDLL = cc
-+LDDLL = $(CCLD)
- LDDLLFLAGS = -shared
- LDDLLOUT = -o 
- 
- # Static linker.
--LD = cc
--LDFLAGS = 
-+LD = $(CCLD)
- LDOUT = -o 
- 
- # C# compiler; we assume usage of Mono.
-@@ -63,7 +59,7 @@ RUNT0COMP = mono T0Comp.exe
- # Set the values to 'no' to disable building of the corresponding element
- # by default. Building can still be invoked with an explicit target call
- # (e.g. 'make dll' to force build the DLL).
--#STATICLIB = no
-+STATICLIB = no
- #DLL = no
- #TOOLS = no
- #TESTS = no
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch
deleted file mode 100644
index 3b341e035545..000000000000
--- a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9515448761739d6186e7d07da5b47e368753528c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Sep 2020 11:34:33 -0700
-Subject: [PATCH] make: Pass LDFLAGS when building shared objects
-
-OE passes flags like hash-style via LDFLAGS which alters the linker
-defaults, its important to have LDFLAGS in link step even if compiler
-driver is used to do linking
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mk/Rules.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/Rules.mk b/mk/Rules.mk
-index b480bd6..db65125 100644
---- a/mk/Rules.mk
-+++ b/mk/Rules.mk
-@@ -344,7 +344,7 @@ $(BEARSSLLIB): $(OBJDIR) $(OBJ)
- 	$(AR) $(ARFLAGS) $(AROUT)$(BEARSSLLIB) $(OBJ)
- 
- $(BEARSSLDLL): $(OBJDIR) $(OBJ)
--	$(LDDLL) $(LDDLLFLAGS) $(LDDLLOUT)$(BEARSSLDLL) $(OBJ)
-+	$(LDDLL) $(LDDLLFLAGS) $(LDFLAGS) $(LDDLLOUT)$(BEARSSLDLL) $(OBJ)
- 
- $(BRSSL): $(BEARSSLLIB) $(OBJBRSSL)
- 	$(LD) $(LDFLAGS) $(LDOUT)$(BRSSL) $(OBJBRSSL) $(BEARSSLLIB)
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 777ba2270bc1..1e70a3dec6cb 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -24,24 +24,29 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"
 
 PV .= "+git${SRCPV}"
-SRCREV = "79b1a9996c094ff593ae50bc4edc1f349f39dd6d"
+SRCREV = "79c060eea3eea1257797f15ea1608a9a9923aa6f"
 SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;branch=master \
-	   file://0001-conf-Unix.mk-remove-fixed-command-definitions.patch \
-	   file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
-           file://0001-make-Pass-LDFLAGS-when-building-shared-objects.patch \
-	   "
+           file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
+           "
 
+SONAME = "libbearssl.so.6"
 # without compile errors like 
 # <..>/ld: build/obj/ghash_pclmul.o: warning: relocation against `br_ghash_pclmul' in read-only section `.text'
 CFLAGS += "-fPIC"
 
+EXTRA_OEMAKE += 'CC="${CC}" CFLAGS="${CFLAGS}" LDDLL="${CCLD} ${LDFLAGS}" LD="${CCLD}" LDFLAGS="${LDFLAGS}" \
+                 BEARSSLDLL=build/${SONAME} \
+                 LDDLLFLAGS="-shared -Wl,-soname,${SONAME}" \
+                 ${@ "STATICLIB=no" if d.getVar('DISABLE_STATIC') != "" else "" } \
+'
+
 S = "${WORKDIR}/git"
-B = "${S}"
 
 do_install() {
-    mkdir -p ${D}/${bindir} ${D}/${libdir}
-    install -m 0644 ${B}/build/brssl ${D}/${bindir}
-    install -m 0644 ${B}/build/libbearssl.so ${D}/${libdir}/libbearssl.so.6.0.0
-    ln -s libbearssl.so.6.0.0 ${D}/${libdir}/libbearssl.so.6
-    ln -s libbearssl.so.6.0.0 ${D}/${libdir}/libbearssl.so
+	install -d ${D}/${bindir} ${D}/${libdir} ${D}/${includedir}
+	install -m 0755 ${B}/build/brssl ${D}/${bindir}
+	oe_libinstall -C ${B}/build libbearssl ${D}/${libdir}
+	for inc in ${S}/inc/*.h; do
+		install -m 0644 "${inc}" ${D}/${includedir}
+	done
 }
-- 
2.39.0


