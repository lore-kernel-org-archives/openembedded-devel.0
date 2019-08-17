Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id C1A087F2ED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 20:22:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z3so3893869pln.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 13:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W1heeCkvmIIIMB/KARwUH9g2Q4W5lq9pnPZEmuCs300=;
	b=ZVbWmOh+A6hIVUn7Qk7c+YdPcPweYvlUR0DZamQlG8QfO8uznHPjo+3RIxy+WI10HN
	FcfSzbgg+KlfJHCMRQN1V7lTJHsQ2VRWmFPsCsoBKOm8BsUYrrt8h+myaP6SoLm6gJCq
	dD4fel7cq0KqXlesTLpilS4VGGenqam8/jvUZW2VLB1UK35WE8GcwZ6SatTpPVRwNgyW
	Oe/eT3ckW5T7yf32+/LDxiYFeFhpCGEzdbgG4ns+st6gOVm/bx62CGackXadwt8Wcuux
	X1fzfuEiXUL80Qak4/AoxAOQvJ5gpQnfYd9you6l3HhQv4pm5zLZ8R1yrxsCSrytTkkL
	I1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W1heeCkvmIIIMB/KARwUH9g2Q4W5lq9pnPZEmuCs300=;
	b=DdSAM/8GxYpWVtkCu069FogXEL3Uyxf8/CC7595JVzW0zp4EZWMfi965dlfI2CRGTt
	vE58SJu6DEJnTxSf3UHPZel2lm49lO/lEjdn43qBQlk9JS25e+CgknNdxEAZkMtIzYwW
	nATN3P2uIt0cFvHSKNIjE8726EtTn8hklPrUoVZ/QvPk7NbnnY7dgIKFIK7va0OjkMI5
	wQuo1nGOxvn2o8GJPZyp8TEF7OTORJnNoj9sSSkYNAKNVyb1G2sZ5wt28uQYO6voaVbl
	6c9ZcXYvMCU1BUAuHtoAPsKk83sFDdKL+kRqavqPP/o9Knv2BHF17EyQw40Tv+YuQaOf
	hTIw==
X-Gm-Message-State: APjAAAVrtAmYjeVXB7Tc4dENqlJngKQZ/d7kxFfv41xTsBee0XzBhd2e
	wwgdisXbkH5uDXxgp+09jWTQFzZDP2Q=
X-Google-Smtp-Source: APXvYqydLVAcoqnC+EQfghkngGCCUFqcCe1/7uJtFZpzcgteDY1GTq7FzNpELgxhRckKhpNuD6i+GQ==
X-Received: by 2002:a17:902:f082:: with SMTP id
	go2mr16124582plb.25.1566073348113; 
	Sat, 17 Aug 2019 13:22:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	h13sm11294096pfn.13.2019.08.17.13.22.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 13:22:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 13:22:20 -0700
Message-Id: <20190817202220.3802-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] ufs-tool: Do not force static linking
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
X-List-Received-Date: Sat, 17 Aug 2019 20:22:27 -0000
Content-Transfer-Encoding: 8bit

build forced static linking if it detect cross-compilation, static
linking with glibc does not work in all circumstances, e.g. when using
clang, glibc expects libgcc to be linked in to provide unwinding, which
may not be the case, ideally the symbols should be looked up independent
of libraries linked in but thats not the case

fixes

| /mnt/a/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/ufs-tool/1.3+gitAUTOINC+8b00e33003-r0/recipe-sysroot-native/usr/bin/arm-yoe-linux-gnueabi/arm-yoe-linux-gnueabi-ld: /mnt/a/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/ufs-tool/1.3+gitAUTOINC+8b00e33003-r0/recipe-sysroot/usr/lib//arm-yoe-linux-gnueabi/9.2.0/../../../lib/libpthread.a(unwind.o): in function `__pthread_unwind':
| /usr/src/debug/glibc/2.30-r0/git/nptl/unwind.c:121: undefined reference to `_Unwind_ForcedUnwind'
| clang-9: error: linker command failed with exit code 1 (use -v to see invocation)
| make: *** [Makefile:40: ufs-tool] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>
---
 meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb b/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
index e074b51971..208ac3c58b 100644
--- a/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
+++ b/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
@@ -12,8 +12,11 @@ SRC_URI = "git://github.com/westerndigitalcorporation/ufs-tool.git;protocol=git;
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
 
+do_configure() {
+	sed -i -e "s|-static$||g" ${S}/Makefile
+}
 do_install() {
 	install -d ${D}${bindir}/
 	install -c -m 755 ${S}/ufs-tool ${D}${bindir}/
-- 
2.22.1


