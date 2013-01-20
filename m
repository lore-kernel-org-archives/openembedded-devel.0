Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNH-00078I-QL
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:44 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so2028271eaa.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=IIAXSM9fh623ebGfEfenIZechUGWwMFcGeejpdWa8/M=;
	b=pEHRF+bnrCdmzebO9g3Cu1U+jp6T5JrlVbu3QmuoI2eUDnEjg3bediMSEWyn/RItfs
	sySobVObC67fzaWa5DLcMMFL6uRPUNO1tZYpFPPgPieJu0Nnao4VKQmvXK9LYTeuNqSB
	m6pv3sRLnR4L6BFY61006NLVNJbIElO/+7N07kWiqjck+zUQXeE7cRXTJmH7ekkdAM9X
	MUl/3GjBon7RgHyjrp7gISpEG6ROgb84g5RDoAby9zupNxj67FYHSy3gNG2UCxVUU3fz
	5/cM0dUxDig0dpGUr5x94snX+pNQUJOMKueEFvfcpex5UNwUmycdr9+esdFCwhE1uXmy
	bP3A==
X-Received: by 10.14.203.3 with SMTP id e3mr13251013eeo.9.1358681536832;
	Sun, 20 Jan 2013 03:32:16 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:03 +0100
Message-Id: <1358681528-19761-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn/eqRsDTDx0yKQ+GqF0q2dWPdSSc8EZLviKbKrnlpk85zoqA1ezAxORc3/T16yP2KPH8og
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 2/7] x264: add git version
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
X-List-Received-Date: Sun, 20 Jan 2013 11:47:45 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/x264/x264_git.bb | 38 +++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb

diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
new file mode 100644
index 0000000..8199a83
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



