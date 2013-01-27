Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbi-0005tl-La
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:24 +0100
Received: by mail-ea0-f178.google.com with SMTP id a14so841456eaa.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=3f3Bd0SdYXOo+xFRDzQZgm268tvm6/8ybRzW2UD9hTU=;
	b=BcStq81+blbrzsCLhls2VKf5fiXHi13GUMygwDIkjEFeS1d0n9LQF5fD8JLj5T1HCN
	Qv1RI8+LVhs1E8up73FBeRTkQ+4BBm0ExN5Ry0B0rFMGPwOiCFKufZPU2espdJK0qKlV
	yZspi9Pxnq3eY/zx45egddFr+skHEITLdrqrCScub9kRu6MDL9HTLU2IN/auKvBfqzZc
	F8wmdfFKBzJLEVqBaQiZrkVYSfu71EYvAY1tNENkmuQJgcoiBwbcVJdxIc1hRX1fgYsK
	Q0glUOop1yNC+HvQD/8UT71Z1PPBQ9WWQ9X7GzYMir4Y6CVfPK26IbVXf7N0oPUZ1uZC
	gCDA==
X-Received: by 10.14.211.137 with SMTP id w9mr7041436eeo.39.1359301305510;
	Sun, 27 Jan 2013 07:41:45 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:44 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:19 +0100
Message-Id: <1359301282-5470-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkYFtDpBVcuo8QGIP7XS6+4zCALnxij20gwpHaJIOaIlMtzdbZFv1cRNAOMFuAFdjXRyMip
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 4/7] x264: add git version
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
X-List-Received-Date: Sun, 27 Jan 2013 15:57:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/x264/x264_git.bb | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb

diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
new file mode 100644
index 0000000..ba8e979
--- /dev/null
+++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
@@ -0,0 +1,43 @@
+SUMMARY = "x264 is a free software library and application for encoding video streams into the H.264/MPEG-4 AVC format"
+HOMEPAGE = "http://www.videolan.org/developers/x264.html"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "yasm-native"
+
+SRC_URI = "git://git.videolan.org/x264.git"
+SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
+
+PV = "r2230+git"
+
+S = "${WORKDIR}/git"
+
+inherit lib_package pkgconfig
+
+X264_DISABLE_ASM = ""
+X264_DISABLE_ASM_armv4 = "--disable-asm"
+X264_DISABLE_ASM_armv4t = "--disable-asm"
+X264_DISABLE_ASM_armv5te = "--disable-asm"
+
+EXTRA_OECONF = '--prefix=${prefix} \
+                --host=${HOST_SYS} \
+                --cross-prefix=${TARGET_PREFIX} \
+                --sysroot=${STAGING_DIR_TARGET} \
+                --enable-shared \
+                --enable-static \
+                --disable-lavf \
+                ${X264_DISABLE_ASM} \
+               '
+
+do_configure() {
+	./configure ${EXTRA_OECONF}
+}
+
+# Get rid of -e
+EXTRA_OEMAKE = ""
+AS = "${TARGET_PREFIX}gcc"
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+}
-- 
1.8.1



