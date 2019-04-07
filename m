Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB197D5E7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 00:32:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id cv12so5122015plb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0agoDuUBWwDyqWpD4mb8SKZ2iXAr2nLdrjm7qKEiBSo=;
	b=YjZI7Z/R2zOMVbRrtXFYUSZZ5Dv3+iSYCvgN6QIS9+VFC3uYstvEwL2rd+dNlhUMJM
	vhJVvB8TVjkbKBypW1zAI+oFSad5EbsYbRMxZm9/Z8iXoALVnFzrBi1vQDYzhUJoVBG4
	l55j15kedwiPRPC708DYUr+gbU6pG51uAqpnNA7sS49iyN6RwIIodltRXq9nyIJ0/A+w
	7vpm6fwbzSWfXiSswTXospRccWxbE3Xq2UvOqSyD+go5awckGhRjiUozKaLfkM8QD0Wg
	OepWQqMpS7rb8P6GAH8ocNonplTZHAj5PnyjVHVN23PhYAAcBFspl6NDc3jTDGO6wfsr
	15aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0agoDuUBWwDyqWpD4mb8SKZ2iXAr2nLdrjm7qKEiBSo=;
	b=F8GaE7rdARalPpSK+vMeVljV6uDdYeeHCLZ9c8Soen7AixT7eB4UJl2u4y48NkUexO
	sq1OVVy+hx5oprABKy1bDxeauqxAofRStYOrTuXysZb94rp9UBJeH9IklOhUKnKwLMe+
	5RgvnxSUGsWUpIIZG5abjQloj58anOYftH4A5xEquopNwruC80ZNIuHoET6J/q4T3bFT
	oQx8UPEmWsO/li4LM2PIjoNYeseqAIZ0Xtp5xmyFN4RF9RmiTBouLVrsqdyFZuIhAb2m
	h38qLxdEvuatVmCsvHFmlmtU/KyQTju3ZcpIzY0Lf15tApNg4tG6awmAuv/B2TYMQUYk
	PSMA==
X-Gm-Message-State: APjAAAVy+2YdB2NUZGNgwV5DriL4IiBCmPx68LBe7wyfFfMHuK2eNY+y
	PVSaiRGLCdweH2i7z2ZcrAP+Qy/r4Tc=
X-Google-Smtp-Source: APXvYqzhK0+ZyCPGQt/uqdOqIPFdAfykLemHlaZEmyzCqdxWgrzGtfJuhwGx7F2ar7RinB1LGwYx8w==
X-Received: by 2002:a17:902:ea0d:: with SMTP id
	cu13mr21498381plb.92.1554597168383; 
	Sat, 06 Apr 2019 17:32:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id f2sm9713543pgc.30.2019.04.06.17.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 17:32:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 17:32:40 -0700
Message-Id: <20190407003240.34517-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lcdproc: Fix parallel build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Apr 2019 00:32:48 -0000
Content-Transfer-Encoding: 8bit

This happens with larger parallelism e.g. -j 44
also reported here
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=214766

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-fix-port-internal-make-dependenci.patch | 33 +++++++++++++++++++
 .../recipes-extended/lcdproc/lcdproc_git.bb   |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
new file mode 100644
index 0000000000..8505ea34c8
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
@@ -0,0 +1,33 @@
+From 67d808b8739817c122bed8ba1a8308d01cb5ad0b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Apr 2019 17:28:28 -0700
+Subject: [PATCH] Fix parallel build (fix port-internal make dependencies) on
+ many cores
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ server/drivers/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/server/drivers/Makefile.am b/server/drivers/Makefile.am
+index 0c23a9b..6777047 100644
+--- a/server/drivers/Makefile.am
++++ b/server/drivers/Makefile.am
+@@ -47,11 +47,11 @@ CwLnx_LDADD =        libLCD.a libbignum.a
+ futaba_LDADD =       @LIBUSB_LIBS@ @LIBUSB_1_0_LIBS@ libLCD.a
+ g15_LDADD =          @LIBG15@
+ glcd_LDADD =         libLCD.a @GLCD_DRIVERS@ @FT2_LIBS@ @LIBPNG_LIBS@ @LIBSERDISP@ @LIBUSB_LIBS@ @LIBX11_LIBS@
+-glcd_DEPENDENCIES =  @GLCD_DRIVERS@ glcd-glcd-render.o
++glcd_DEPENDENCIES =  @GLCD_DRIVERS@ glcd-glcd-render.o libLCD.a
+ glcdlib_LDADD =      @LIBGLCD@
+ glk_LDADD =          libbignum.a
+ hd44780_LDADD =      libLCD.a @HD44780_DRIVERS@ @HD44780_I2C@ @LIBUSB_LIBS@ @LIBFTDI_LIBS@ @LIBUGPIO@ libbignum.a
+-hd44780_DEPENDENCIES = @HD44780_DRIVERS@ @HD44780_I2C@
++hd44780_DEPENDENCIES = @HD44780_DRIVERS@ @HD44780_I2C@ libLCD.a libbignum.a
+ i2500vfd_LDADD =     @LIBFTDI_LIBS@
+ imon_LDADD =         libLCD.a libbignum.a
+ imonlcd_LDADD =      libLCD.a
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
index 1354997891..7ddc55f5e7 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
 
 BASEPV = "0.5.9"
 PV = "${BASEPV}+git${SRCPV}"
-SRCREV = "a4b5a7e058fdd0d914a61138748b589c0128b45b"
+SRCREV = "e08546c13a4157ed98cd4a8e9086e7acd66f93c0"
 SRC_URI = "git://github.com/lcdproc/lcdproc \
+           file://0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.21.0


