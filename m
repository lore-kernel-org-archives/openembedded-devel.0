Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKb2L-0002Iv-Rx
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 22:31:49 +0200
Received: by mail-gg0-f175.google.com with SMTP id p1so820311ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 13:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uHJt6Tyg91dl/sSJZmSIoylOvyBCjr9kfdDY7eLaAtQ=;
	b=wSRbudExbbUaglodI8bH1uoXjZGQKew5g9V4HBH/4cekICsEiNckvBctUHT6Z07LQc
	DMESHlTnbVQQKarEzEjQqJU/ZzocgWA98uQePlw0l/P2g+FCyZtla7BGCNfLQydh78r5
	S4LMqz0yRdFNnwIU2Z/RazECHzFdJTqadDUV3X96I7LQ+9Rao6yoSeQFwC4meSq4sfBT
	hS0gBuHmYIRuXDH17G5uFDicGCVUmAhxQkwZ/Q04T9jgqsJTfF5QKBB9FQS3XsZEqOkQ
	B6nbXLJ4+eLKjfzgL13wTLJ6s54xCjotm8WxVSZU6whk4zkpcEfa5dqPiMs9PAw6EG7S
	9QJQ==
Received: by 10.236.132.65 with SMTP id n41mr359734yhi.94.1349554725627;
	Sat, 06 Oct 2012 13:18:45 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h15sm13150353ank.2.2012.10.06.13.18.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 13:18:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2012 17:18:28 -0300
Message-Id: <1349554710-6693-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
References: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/5] libpostproc: Add git version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Oct 2012 20:31:50 -0000

This has been split from libav code during development of 0.9 series.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libpostproc/libpostproc_git.bb                 |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb

diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
new file mode 100644
index 0000000..3620ff0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "FFmpeg derived postprocessing library"
+HOMEPAGE = "http://git.videolan.org/?p=libpostproc.git;a=summary"
+SECTION = "libs"
+DEPENDS = "libav"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PV = "0.0.0+git${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRCREV = "3b7053f46dbfe4662063345245cb00b6acbbe969"
+SRC_URI = "git://git.videolan.org/libpostproc.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools lib_package pkgconfig
+
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+
+EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF ?= ""
+
+EXTRA_OECONF = " \
+        --enable-shared \
+        --enable-pthreads \
+        --enable-gpl \
+        --enable-postproc \
+        \
+        --cross-prefix=${TARGET_PREFIX} \
+        --prefix=${prefix} \
+        \
+        --arch=${TARGET_ARCH} \
+        --target-os="linux" \
+        --enable-cross-compile \
+        --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+        --extra-ldflags="${TARGET_LDFLAGS}" \
+        --sysroot="${STAGING_DIR_TARGET}" \
+        ${EXTRA_FFCONF} \
+"
+
+#| yasm not found, use --disable-yasm for a crippled build
+EXTRA_OECONF_append_x86-64 = " --disable-yasm"
+EXTRA_OECONF_append_x86 = " --disable-yasm"
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
+}
-- 
1.7.2.5



