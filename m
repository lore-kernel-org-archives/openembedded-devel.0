Return-Path: <rapphil@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id DA85772277
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2015 23:15:25 +0000 (UTC)
Received: by yhoc41 with SMTP id c41so11355617yho.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2015 15:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yDfWw1y/v1CY1vVR2kMqXrGlIe1AQvpKiOoZbz45okc=;
	b=wCxmhS1P1XqrNiQ5m08CtnY2z4cTeypZtodg1VJ7iQF/FNEIYFX4D8T5maOQfAftsz
	ciYowITc4KrnMRTTSJ0O9X9p/QfLOS3L9F4AqhuUnB0q/PVcEF3d0vt8E+TUjy5y532+
	poC6KNfl/5gMo7SwqfvSq3Db+sbNFl4RWpHZdUL6GKsowfCQLHdrtFow5y41DgY+g6fR
	qAuwF1qcDnrWjBpkiSN2hZKnjaHgTWWoeK16HuNCtSsIfYJy21sURa4c2jyHEe90AVQ1
	nLV3QWmHAk/Z3NrIy7i2tSLCPdiKm2RGZA7qBzQAIHhYATN77iFtQ2sob2rgjSQm3thK
	4Q+Q==
X-Received: by 10.236.43.225 with SMTP id l61mr19630952yhb.15.1425165327178;
	Sat, 28 Feb 2015 15:15:27 -0800 (PST)
Received: from localhost.localdomain ([189.101.194.253])
	by mx.google.com with ESMTPSA id r31sm6420382yhr.6.2015.02.28.15.15.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Feb 2015 15:15:26 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
X-Google-Original-From: Raphael Silva <raphael.philipe@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Feb 2015 20:15:16 -0300
Message-Id: <1425165316-3988-1-git-send-email-raphael.philipe@ossystems.com.br>
X-Mailer: git-send-email 2.3.0
Cc: Raphael Silva <raphael.philipe@ossystems.com.br>
Subject: [meta-oe][PATCH v2] fio: fix do_compile error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Feb 2015 23:15:29 -0000

  * Update to v2.2.6

Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>
---
 ...eric-assembly-nop-and-barrier-code-for-ar.patch | 30 ----------------------
 .../fio/{fio_2.0.5.bb => fio_2.2.6.bb}             | 11 ++++----
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
 rename meta-oe/recipes-benchmark/fio/{fio_2.0.5.bb => fio_2.2.6.bb} (72%)

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch b/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
deleted file mode 100644
index db97244..0000000
--- a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 152b969cd4ff5b4b7e1c65eca1f9ab243b8a30c8 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Sun, 14 Apr 2013 13:53:35 -0300
-Subject: [PATCH] ARM: Use generic assembly nop and barrier code for armv6
-
-Upstream-Status: Submitted
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- arch/arch-arm.h |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
-
-diff --git a/arch/arch-arm.h b/arch/arch-arm.h
-index 658b688..7cd9502 100644
---- a/arch/arch-arm.h
-+++ b/arch/arch-arm.h
-@@ -18,7 +18,9 @@
- #define __NR_sys_vmsplice	343
- #endif
- 
--#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) || defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__)
-+#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) \
-+	|| defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__) \
-+	|| defined(__ARM_ARCH_6__)  || defined(__ARM_ARCH_6J__) || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
- #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
- #define read_barrier()	__asm__ __volatile__ ("" : : : "memory")
- #define write_barrier()	__asm__ __volatile__ ("" : : : "memory")
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
similarity index 72%
rename from meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
rename to meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index 8dcf637..016b1f2 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -12,17 +12,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-# rev for v2.0.5
-SRCREV = "02efadeb8b05144bcf2fc7796e1da2e7db211d00"
-SRC_URI = "git://git.kernel.dk/fio.git \
-           file://0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch"
+# rev for v2.2.6
+SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
+SRC_URI = "git://git.kernel.dk/fio.git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
 
 do_install() {
-    oe_runmake install DESTDIR=${D} bindir=${bindir} mandir=${mandir}
+    oe_runmake install DESTDIR=${D} prefix=${prefix} mandir=${mandir}
     install -d ${D}/${docdir}/${PN}
     cp -a ${S}/examples ${D}/${docdir}/${PN}/
 }
-- 
2.3.0


