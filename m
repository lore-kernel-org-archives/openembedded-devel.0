Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQKir-0008FB-9Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 15:10:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 19D87314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 15:08:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id VZPjESbrGjR1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 15:08:42 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 59699314B860
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 15:08:41 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 14:08:41 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 14:08:40 +0000
Message-Id: <1291817320-5270-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291817320-5270-1-git-send-email-obi@opendreambox.org>
References: <1291817320-5270-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] ffmpeg: add recipe for 0.6.1 (LGPLv2.1+)
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
X-List-Received-Date: Wed, 08 Dec 2010 14:10:23 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/ffmpeg/ffmpeg_0.6.1.bb |   39 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ffmpeg/ffmpeg_0.6.1.bb

diff --git a/recipes/ffmpeg/ffmpeg_0.6.1.bb b/recipes/ffmpeg/ffmpeg_0.6.1.bb
new file mode 100644
index 0000000..fb941a5
--- /dev/null
+++ b/recipes/ffmpeg/ffmpeg_0.6.1.bb
@@ -0,0 +1,39 @@
+require ffmpeg.inc
+
+LICENSE = "LGPLv2.1+"
+DEPENDS += "schroedinger libgsm"
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://ffmpeg.org/releases/ffmpeg-${PV}.tar.bz2"
+SRC_URI[md5sum] = "4f5d732d25eedfb072251b5314ba2093"
+SRC_URI[sha256sum] = "e348aa6d0bb199f231aa3a48e8f457f037c763219bccc8b395e007ccd87ebd5f"
+
+EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF_mipsel = "--arch=mips"
+
+EXTRA_OECONF = " \
+        --arch=${TARGET_ARCH} \
+        --cross-prefix=${TARGET_PREFIX} \
+        --disable-stripping \
+        --enable-cross-compile \
+        --enable-libgsm \
+        --enable-libmp3lame \
+        --enable-libschroedinger \
+        --enable-libtheora  \
+        --enable-libvorbis \
+        --enable-pthreads \
+        --enable-shared \
+        --enable-swscale \
+        --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+        --extra-ldflags="${TARGET_LDFLAGS}" \
+        --prefix=${prefix}/ \
+        --target-os=linux \
+        ${EXTRA_FFCONF} \
+"
+
+do_configure() {
+        ./configure ${EXTRA_OECONF}
+}
+
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-- 
1.7.2.3



