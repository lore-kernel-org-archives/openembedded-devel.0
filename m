Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 18E38606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:24:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so7240500wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=CLbYTosC7kXj68MPNN1MJUk2B+3Z7YKzX1vgT5x3wX0=;
	b=bNPYGOE2Lwhm5oaqN/YGTxztzTdbG1aWPs93a5mNrzOpzxkaMv0If/mQABHKK+EyV1
	goEIZnJnYfLt5LN7TfmT25zoi4eqXk/3YXo0ejRiYS/Tsn9eShn3nGZS+FtGX32gz/YN
	cqHKEubmOEyW2/66Td58J3ieYO8RP+A/aLNOAOPZATjrEw48vvg3J7l6X37FonRJSAFN
	ryj78t0CJKvCJU5N9ipmVJn28IrfoE7qtZEXqPYxj8KLYLD1eMQt/azQW2GZYt4mYiny
	3qm/w9TaSNXZvxMeV4zcPEklWkHFcojjrdbtl41v4RTjCB5B7xLf8KiqNRph2MxUCXXJ
	+BZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CLbYTosC7kXj68MPNN1MJUk2B+3Z7YKzX1vgT5x3wX0=;
	b=EyooTNQslm2gNS2Jw3u5p6F00LRH9dH8qV7VTFS4SkpRduyaV+yetjikikbgAeQlm2
	caH9nMU5bx3e/PrT7RHqL0dXi23+vZI4u7rCz9p1h47fJLeZxtglsDJzgc0xK6BkfOHA
	0E0gl7XOUaRXvD2vjsY95VqapfPCMe4mL1df6ZjcnAUH+Hq7/RJMIlG6K6YfWVN8l7aX
	alMuQdr88ZKdG4KsCe/KyD8yjzcgYG9wvju+rHbVpiD5Nrz0tQYFdfGLQV1CjFEyG6t5
	+1UnRcuY/+L9zM8+8gNIXm6Fqhn/lNTIgBHiHLPusZLAZwGECt4gcaU+mhPCyPY0d7Ot
	ar1Q==
X-Gm-Message-State: ALyK8tJtUEMxj8gySd1R8PJViOoomN+EWUz/O1K91qIacs6iQfxVEOC5rKwi23ypSVGhCg==
X-Received: by 10.194.29.65 with SMTP id i1mr1837141wjh.178.1469024641890;
	Wed, 20 Jul 2016 07:24:01 -0700 (PDT)
Received: from localhost.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	a203sm32476414wma.0.2016.07.20.07.24.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 07:24:01 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 15:24:00 +0100
Message-Id: <20160720142400.7218-1-eu@felipetonello.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] juce: Improved juce class and recipes
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
X-List-Received-Date: Wed, 20 Jul 2016 14:24:02 -0000

This allows recipes that inherits juce class to have more modular
dependencies and change it if necessary.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-multimedia/classes/juce.bbclass               | 23 ++++++++++++++++------
 .../juce/nativesdk-projucer_git.bb                 |  1 +
 .../recipes-multimedia/juce/projucer-native_git.bb |  1 +
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/classes/juce.bbclass b/meta-multimedia/classes/juce.bbclass
index ac97ca348c3f..715282fd15c1 100644
--- a/meta-multimedia/classes/juce.bbclass
+++ b/meta-multimedia/classes/juce.bbclass
@@ -1,12 +1,23 @@
 inherit pkgconfig
 
-JUCE_X11_DEPS = "libx11 libxext libxinerama libxinerama libxrandr libxcursor freetype"
-JUCE_DEPS = " \
-  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${JUCE_X11_DEPS}', '', d)} \
-  alsa-lib \
-  curl \
+JUCE_MODULES ??= " \
+  juce_core \
+  juce_events \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'juce_audio_devices', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'juce_graphics juce_gui_basics', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'juce_opengl', '', d)} \
 "
-DEPENDS_prepend = "projucer-native ${JUCE_DEPS} "
+JUCE_X11_DEPS = "libx11 libxext libxinerama libxrandr libxcursor"
+
+PACKAGECONFIG_prepend= "${JUCE_MODULES} "
+PACKAGECONFIG[juce_core] = ",,curl,"
+PACKAGECONFIG[juce_events] = ",,libx11,"
+PACKAGECONFIG[juce_audio_devices] = ",,alsa-lib,"
+PACKAGECONFIG[juce_graphics] = ",,${JUCE_X11_DEPS} freetype,"
+PACKAGECONFIG[juce_gui_basics] = ",,${JUCE_X11_DEPS},"
+PACKAGECONFIG[juce_opengl] = ",,virtual/libgl,"
+
+DEPENDS_prepend = "projucer-native "
 
 export OE_JUCE_PROJUCER = "${STAGING_BINDIR_NATIVE}/Projucer"
 
diff --git a/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb b/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
index 93b23b1b5a81..7836bae691a3 100644
--- a/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
+++ b/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
@@ -1,2 +1,3 @@
 inherit nativesdk
 include projucer.inc
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb b/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
index b919a7dcb353..fb54fb9e9888 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
+++ b/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
@@ -1,2 +1,3 @@
 inherit native
 include projucer.inc
+BBCLASSEXTEND = "native"
-- 
2.9.0


