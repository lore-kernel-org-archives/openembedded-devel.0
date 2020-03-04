Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 55382611CF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 17:19:19 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b1so1287014pgm.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bqHpwLokJBf4PxDAMOuH4rz8jaj5fWPT6WYW9PjSQn0=;
	b=da9r91cmOtE2N12R+mmgu9kcxMe2vTYvAFlHSxluljZUMWw++U51nthA64XbxF8ulr
	+j9ecP1BjGtEs3qwwcY77TkM79wzvkMIqolzW+UB4dYNooa3DJg1hvpyELu2ZzivCxMU
	ARaopJH2sQ7gC2xavO5bhOWfq0U/RT7y4mPCnIN8Shgst6ML8No6klbLGKTH7c8Ol4vd
	8PkfqK6vNYFPEGtsbOqEcmOt/cMEzDSpnrc81ClArDvy9A8qBF1wcg31hXPInAVrLuYB
	EeBfcgxOTCt4SKTCC6jFOz/BYZpC8bU8lSP7rV0TUdWLDeUhgvKDATh+rLRoVXXpyGZ4
	s5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bqHpwLokJBf4PxDAMOuH4rz8jaj5fWPT6WYW9PjSQn0=;
	b=q6PIqhzDcnRgoPTCOs1QvUIimmt2ATH8ZvpSTX+V3E2AAkcjd/jRD05T2rE/Hr73QZ
	P9dVUyiLmCOqEJYh0LIvQAgyXLEQnr++RHGj0lLK2CvMv/AQUK+4wacD3pD9eKnqRrmO
	rRTs7Y2a2q2GUYQvUEwmQRqz5mUjJRuznw15/0rWNRscX03Oi+03DRN9XUOseCp4YC7A
	YWmRC7x2h9fqRtPwkfY3nLM0XCVgalfs5sc7ZctTpmJzU9+6KsWQtLiMYzFHqucNJcPu
	DM3awQA7wOjYlbXbEtPe2dkzDK3TAJ28iM6J1cLna5PVaMmodrdNKYrhPd4btJ1921au
	Arhw==
X-Gm-Message-State: ANhLgQ3Yf03ChMuX/N3HQoEGImLzXlNWYKdMpGDr87HkVqwwsFo9bMsb
	jpJNIr1GTJ12oVTfEbS7P19JBqKHoow=
X-Google-Smtp-Source: ADFU+vvoZrHUY7hYd6+EpdumYRVpul3K1v6uKZuCzb6OC1T6+HJQoqvjJhp82YkEU9ra8XOeLctgiw==
X-Received: by 2002:aa7:8755:: with SMTP id g21mr4040001pfo.36.1583342359684; 
	Wed, 04 Mar 2020 09:19:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8ce3])
	by smtp.gmail.com with ESMTPSA id
	g10sm29343645pfo.166.2020.03.04.09.19.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 09:19:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:19:26 -0800
Message-Id: <20200304171927.2068660-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304171927.2068660-1-raj.khem@gmail.com>
References: <20200304171927.2068660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/5] openh264: Upgrade to 2.0.0
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
X-List-Received-Date: Wed, 04 Mar 2020 17:19:19 -0000
Content-Transfer-Encoding: 8bit

- Fix host-user-contaminated QA issues
- make clean is broken so mark it so
- Enable PIC in asm which fixes textrels issue
- Fix build on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-poke-at-host-gcc-for-target-options.patch | 25 +++++++
 ...Use-cp-options-to-preserve-file-mode.patch | 32 +++++++++
 .../0001-codec-Disable-asm-for-mips.patch     | 70 +++++++++++++++++++
 .../{openh264_1.7.0.bb => openh264_2.0.0.bb}  | 17 +++--
 4 files changed, 139 insertions(+), 5 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch
 rename meta-multimedia/recipes-multimedia/openh264/{openh264_1.7.0.bb => openh264_2.0.0.bb} (68%)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch
new file mode 100644
index 0000000000..5f590596d9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch
@@ -0,0 +1,25 @@
+From af9bd9201c755e0b01251021f4e7642d3fec9c1c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Mar 2020 08:38:46 -0800
+Subject: [PATCH] Makefile: Do not poke at host gcc for target options
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/arch.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/build/arch.mk b/build/arch.mk
+index 8ac3e70a..b80cee8c 100644
+--- a/build/arch.mk
++++ b/build/arch.mk
+@@ -35,7 +35,6 @@ ifneq ($(filter mips mips64, $(ARCH)),)
+ ifeq ($(USE_ASM), Yes)
+ ASM_ARCH = mips
+ ASMFLAGS += -I$(SRC_PATH)codec/common/mips/
+-LOONGSON3A = $(shell g++ -dM -E - < /dev/null | grep '_MIPS_TUNE ' | cut -f 3 -d " ")
+ ifeq ($(LOONGSON3A), "loongson3a")
+ CFLAGS += -DHAVE_MMI
+ endif
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
new file mode 100644
index 0000000000..92f32948b2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
@@ -0,0 +1,32 @@
+From 1c3bda45c55d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Mar 2020 22:28:25 -0800
+Subject: [PATCH] Makefile: Use cp options to preserve file mode
+
+This fixes packaging issues e.g.
+openh264: /usr/lib/libopenh264.so is owned by uid 1000, which is the same as the user running bitbake
+
+Upstream-Status: Submitted [https://github.com/cisco/openh264/pull/3245]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 74ff029d..ac643412 100644
+--- a/Makefile
++++ b/Makefile
+@@ -306,8 +306,8 @@ install-shared: $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) install-headers $
+ 	mkdir -p $(DESTDIR)$(SHAREDLIB_DIR)
+ 	install -m 755 $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXFULLVER) $(DESTDIR)$(SHAREDLIB_DIR)
+ 	if [ "$(SHAREDLIBSUFFIXFULLVER)" != "$(SHAREDLIBSUFFIX)" ]; then \
+-	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \
+-	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \
++	  cp -R --no-dereference --preserve=mode,links $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \
++	  cp -R --no-dereference --preserve=mode,links $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \
+ 	fi
+ 	mkdir -p $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
+ 	install -m 644 $(PROJECT_NAME).pc $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch
new file mode 100644
index 0000000000..60ea69dbc0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch
@@ -0,0 +1,70 @@
+From edb62d2518d87536290d00a11c78c311e3680914 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Mar 2020 09:14:57 -0800
+Subject: [PATCH] codec: Disable asm for mips
+
+It needs loongson support which qemumips is not targettin
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ codec/common/targets.mk     | 2 +-
+ codec/decoder/targets.mk    | 2 +-
+ codec/encoder/targets.mk    | 2 +-
+ codec/processing/targets.mk | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/codec/common/targets.mk b/codec/common/targets.mk
+index 96843cd9..e76cb2cb 100644
+--- a/codec/common/targets.mk
++++ b/codec/common/targets.mk
+@@ -74,7 +74,7 @@ COMMON_ASM_MIPS_SRCS=\
+ 	$(COMMON_SRCDIR)/mips/satd_sad_mmi.c\
+ 
+ COMMON_OBJSMIPS += $(COMMON_ASM_MIPS_SRCS:.c=.$(OBJ))
+-ifeq ($(ASM_ARCH), mips)
++ifeq ($(ASM_ARCH), mips64)
+ COMMON_OBJS += $(COMMON_OBJSMIPS)
+ endif
+ OBJS += $(COMMON_OBJSMIPS)
+diff --git a/codec/decoder/targets.mk b/codec/decoder/targets.mk
+index eaf5d3c0..615d9216 100644
+--- a/codec/decoder/targets.mk
++++ b/codec/decoder/targets.mk
+@@ -60,7 +60,7 @@ DECODER_ASM_MIPS_SRCS=\
+ 	$(DECODER_SRCDIR)/core/mips/dct_mmi.c\
+ 
+ DECODER_OBJSMIPS += $(DECODER_ASM_MIPS_SRCS:.c=.$(OBJ))
+-ifeq ($(ASM_ARCH), mips)
++ifeq ($(ASM_ARCH), mips64)
+ DECODER_OBJS += $(DECODER_OBJSMIPS)
+ endif
+ OBJS += $(DECODER_OBJSMIPS)
+diff --git a/codec/encoder/targets.mk b/codec/encoder/targets.mk
+index 1f053280..fd49c1fd 100644
+--- a/codec/encoder/targets.mk
++++ b/codec/encoder/targets.mk
+@@ -88,7 +88,7 @@ ENCODER_ASM_MIPS_SRCS=\
+ 	$(ENCODER_SRCDIR)/core/mips/score_mmi.c\
+ 
+ ENCODER_OBJSMIPS += $(ENCODER_ASM_MIPS_SRCS:.c=.$(OBJ))
+-ifeq ($(ASM_ARCH), mips)
++ifeq ($(ASM_ARCH), mips64)
+ ENCODER_OBJS += $(ENCODER_OBJSMIPS)
+ endif
+ OBJS += $(ENCODER_OBJSMIPS)
+diff --git a/codec/processing/targets.mk b/codec/processing/targets.mk
+index 300de2d8..8451d66e 100644
+--- a/codec/processing/targets.mk
++++ b/codec/processing/targets.mk
+@@ -62,7 +62,7 @@ PROCESSING_ASM_MIPS_SRCS=\
+ 	$(PROCESSING_SRCDIR)/src/mips/vaa_mmi.c\
+ 
+ PROCESSING_OBJSMIPS += $(PROCESSING_ASM_MIPS_SRCS:.c=.$(OBJ))
+-ifeq ($(ASM_ARCH), mips)
++ifeq ($(ASM_ARCH), mips64)
+ PROCESSING_OBJS += $(PROCESSING_OBJSMIPS)
+ endif
+ OBJS += $(PROCESSING_OBJSMIPS)
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.0.0.bb
similarity index 68%
rename from meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
rename to meta-multimedia/recipes-multimedia/openh264/openh264_2.0.0.bb
index e2f028ac58..31b9da269f 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.0.0.bb
@@ -3,17 +3,21 @@ decoding. It is suitable for use in real time applications such as WebRTC."
 HOMEPAGE = "http://www.openh264.org/"
 SECTION = "libs/multimedia"
 
-DEPENDS_x86 += "nasm-native"
-DEPENDS_x86-64 += "nasm-native"
+DEPENDS_append_x86 = " nasm-native"
+DEPENDS_append_x86-64 = " nasm-native"
 
 LICENSE = "BSD-2-Clause"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
 S = "${WORKDIR}/git"
-SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
-BRANCH = "openh264v1.7"
-SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH};"
+SRCREV = "71374015cdf13f7aab4bc2d820f77905b3becfb8"
+BRANCH = "openh264v2.0.0"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
+           file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
+           file://0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch \
+           file://0001-codec-Disable-asm-for-mips.patch \
+           "
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
@@ -30,6 +34,7 @@ EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
 EXTRA_OEMAKE_mips = "ARCH=mips"
 EXTRA_OEMAKE_mips64 = "ARCH=mips64"
 
+EXTRA_OEMAKE_append = " ENABLEPIC=Yes"
 do_configure() {
     :
 }
@@ -41,3 +46,5 @@ do_compile() {
 do_install() {
     oe_runmake install DESTDIR=${D} PREFIX=${prefix}
 }
+
+CLEANBROKEN = "1"
-- 
2.25.1


