Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TmMjr-00029O-6Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 11:55:34 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so2299796eaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 02:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=u0tqTdry/lk+IIjn9yLYEnw93JrY8eZWKCzP++fYR9I=;
	b=aZUvlsuIZnhGgJlYp5xcmpopim4MGdtFaBzbJK/DTJZl04UIZEsscOJ203o/75SHnw
	cuPcizmEtrJwiBd1MeWn26iZevKNAeqKOscqx03DmvY+iK0fEDF3SdG9jsBqUC5vg2DX
	CBtCVh7rB21eM3ebGQahaKxBRTJpALmS+rjOvLcV6pqyT514GhRYbksPh2Fh2VMGzVA2
	dSsUDCp/XQnfEqyKq/bsZtnGhBDh3bLMX720C1dz03deoYIl2MExoyOcJ7WkMMNHLEj1
	On6LNUQFLDjESCTWhA2QmncWL38IpXjQhccS9tuY45nj3AVu8ieUpopQIpa9BtA6pouh
	4GFw==
X-Received: by 10.14.184.134 with SMTP id s6mr39322855eem.43.1356172844124;
	Sat, 22 Dec 2012 02:40:44 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f49sm27396371eep.12.2012.12.22.02.40.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 02:40:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Dec 2012 11:40:25 +0100
Message-Id: <1356172826-24392-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQn+jQrk6fd3WyNvhMbMiokFJ8/VunMAHM7H64XdsXozLNOU8fZ7x8FQ5Wp2ymTZOwwlvjvH
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 1/2] x264: add git version
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
X-List-Received-Date: Sat, 22 Dec 2012 10:55:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/x264/x264_git.bb |   38 +++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb

diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
new file mode 100644
index 0000000..79e4988
--- /dev/null
+++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
@@ -0,0 +1,38 @@
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
+EXTRA_OECONF = '--prefix=${prefix} \
+                --host=${HOST_SYS} \
+		--cross-prefix=${TARGET_PREFIX} \
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
1.7.7.6



