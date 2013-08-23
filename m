Return-Path: <eren@hambedded.org>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id BE66B60896
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:22:21 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id e11so250485bkh.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=ICchtR4qqYyMiLj7HI9t9ybRwqEGuPgOOlP5zeDHmCk=;
	b=OQau97UHDek8czCLaQ7i7JWHPtR4ecoSrzvKpS1nSTM2c9bbm53WPI5ubwXp1GFaB1
	KP241FoYwWQyJNpIQGIw4AiB8DAl1R0o+7O8SF1lheaLMc+1sLa34QNS+1GGhZ9BCdEt
	QMVh3Tp9KrsXxeVqn+BldY5kVBAWVqI2n3BUpoAZy/DkDIG2t4vU8c51YIykv8puH5Ey
	DUsKOnsBO91U8I4kPgTjpMhtOiAOExuEfbyZ819ajpmfi3XqajHkYn6k1nmJ9m3llaBs
	IJ9XepqmsQgFOgOT5eo6OgOX8SAQaeBoE2+YIL3QXTuqs3OAltrpxncpDbV1WvkTnvn/
	LY6g==
X-Gm-Message-State: ALoCoQmnPo6VP9XtnnSQWgSfqr8LSHYbBm2E6JVSX1z+EEz3UJA31rIMm+A2htizDY3jewj/hMTe
X-Received: by 10.204.226.75 with SMTP id iv11mr23943bkb.136.1377267741903;
	Fri, 23 Aug 2013 07:22:21 -0700 (PDT)
Received: from localhost.localdomain (farscape.ibun.edu.tr. [194.27.149.253])
	by mx.google.com with ESMTPSA id qx2sm6020bkb.16.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:22:21 -0700 (PDT)
From: =?UTF-8?q?Eren=20T=C3=BCrkay?= <eren@hambedded.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:18:03 +0300
Message-Id: <1377267483-7785-1-git-send-email-eren@hambedded.org>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mpg123: add PACKAGECONFIG for pulseaudio and alsa
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
X-List-Received-Date: Fri, 23 Aug 2013 14:22:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The default DISTRO_FEATURES include alsa and pulseaudio at the same
time. Hence, both of the options are enabled in mpg123 configuration
without adding related dependencies, which causes build error.

Make the options mutually exclusive through PACKAGECONFIG.  If both alsa
and pulseaudio are specified, pulseaudio takes precedence.

Signed-off-by: Eren Türkay <eren@hambedded.org>
---
 .../recipes-multimedia/mpg123/mpg123_1.15.3.bb     |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
index 595235c..0075427 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
@@ -6,6 +6,14 @@ HOMEPAGE = "http://mpg123.de/"
 BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
+# The options should be mutually exclusive for configuration script.
+# If both alsa and pulseaudio are specified (as in the default distro features)
+# pulseaudio takes precedence.
+PACKAGECONFIG_ALSA = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
+PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
+PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
+
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a7aa23a2b646eca38ad4eeb7a853761c"
@@ -23,7 +31,5 @@ EXTRA_OECONF = " \
     --enable-shared \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', '--with-default-audio=alsa', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', '--with-default-audio=pulse', '', d)} \
 "
 
-- 
1.7.9.5


