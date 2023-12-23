Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29571C3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 16:55:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.10204.1703350538847503439
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 08:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rspe6p/Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso12039755e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703350536; x=1703955336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQpwrAdFhn5Y6qsI9vnX2OaFdpYZI3wxzRDKfOWhaiY=;
        b=Rspe6p/Y8F2Zd1B45hYPT13U/i0tCa+PVaLaRLJdwNSruVUUMdYLY6RQuM6rhGGF9c
         xyX5WlHIdDvHYDC5q7y3xjK2LruKZ4F+Kq58mBTUMDkUydx9qv3jG9udCCtsNdpVYEWW
         PNIhiWbp06PF03y/TGyvbOsIo+8LbDmXStrqAerJLVyazi8pvP3zncAyQBg1ho9XSbEr
         AJ/flzv1DpLpxXuaPw2RsLXjyBCOO4+IFKTv3di0wNzzdwey5FMNyK1tWfU/8G6RR3an
         a8LXUxkyl3+9OsOlrr7m3qX6HK3LmL4ldHQNyC8lyKXPLstr5iXqNaJ6ljRATsbojxGL
         XmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703350536; x=1703955336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQpwrAdFhn5Y6qsI9vnX2OaFdpYZI3wxzRDKfOWhaiY=;
        b=OyLvDNNBlezlaTExlcRrdIyuyc1ZMOWb4mXyHirbJ/UOHgwC3SUobrsb/0KjkOerv3
         2oHk7+skHq8M/F6gUHOxtehQslik16fD1rSc7aYce/5eawtSK+qzGEIxoREx1VKlQbDc
         vdoUsIjfa1RTqVR9Qv4LB4WL0VRBFCl98B5q3gF/ZofWSYzqEFigjtTY25q47Q3Mc7TC
         iP64Yn3HpRbJYiadO6vx6Yl3cINcNMj0o58vU2IE+io2c++8N4JBlbFo1pKb9PzdPxRV
         yazxvS5NEU+pp++SS/i1gJm0ywBVgMryfOmJGU8slXHq2Tz6ZOKS9dHAckDbZ5A1+QMd
         rBzQ==
X-Gm-Message-State: AOJu0YzRFtnFOk2aCOtk3iZuPG2vBCbqZKu+7yDEPZbybryLc9jNtFpm
	sHrbEkqmhv97xoCh3wmCX6VK3A70aZc=
X-Google-Smtp-Source: AGHT+IGzdyLwX6Pt+xwNFCN3TJ9GdQ0VON5YqPVdDK4zCMZ+c3LHkgiESk+ftrsJMF/tGjPVKqeuow==
X-Received: by 2002:a05:600c:21c3:b0:40c:83f:9460 with SMTP id x3-20020a05600c21c300b0040c083f9460mr1786525wmj.116.1703350536161;
        Sat, 23 Dec 2023 08:55:36 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d9e2:102b:56b1:9620])
        by smtp.gmail.com with ESMTPSA id x18-20020adff0d2000000b003365aa39d30sm6778035wro.11.2023.12.23.08.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 08:55:35 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2] bearssl: Upgrade to latest
Date: Sat, 23 Dec 2023 16:55:33 +0000
Message-Id: <20231223165534.2632-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107773

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

Changes in v2:
- Drop patches which change build flags in favour of command line
  overrides
- Add support for static build

 ....mk-remove-fixed-command-definitions.patch | 57 -------------------
 ...LDFLAGS-when-building-shared-objects.patch | 32 -----------
 .../bearssl/bearssl_0.6.bb                    | 26 +++++----
 3 files changed, 16 insertions(+), 99 deletions(-)
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
index 777ba2270bc1..e5d039e67852 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -24,24 +24,30 @@ LICENSE = "MIT"
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
 B = "${S}"
 
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


