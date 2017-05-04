Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 81B5077C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 16:28:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u65so4446505wmu.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AMju/IK5S69htCVGjUA8DZ5Cd0bv3Ph5oWyxkRjz8iE=;
	b=Wav6mEtTIy/+A46XguDfam35zH7X1TIRbcwecTs0YnxJNfaUq8SEYw/H36K0BSJVUN
	BHBc65a0fnwuaIYVdL/bl3CMcVt5JahhB/hGzAzESJNsRIjn4NqHnxs9JJ1lY7wnNCgJ
	AmC0A2jhKbihgXHcxWYKRxM7DeuEu2UvvkJiMmQ6Nl19XIXizip0RXagRPNm7mIEzdeu
	EiVjIrJm2BRyowUgKvfYphLGRqied2mT9/F87l/4PvYdSHHs41qD9RwO2O8DwMzEE2VT
	hpXO876izuWYlskE7HS+s36PIn/5jm5UfRZGLnemx0BO78Gvj/gVcHmlVmr2pKTr+UzU
	TazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AMju/IK5S69htCVGjUA8DZ5Cd0bv3Ph5oWyxkRjz8iE=;
	b=YX7oYrwKD+E1A/bx+ohIzJCqcRMgGSSnZgsdzwqgVXxN/AjrjqrNwLOcerdmuUm3AE
	99ziu1MFrU6xAws4HDmYo/ltpx7wz+m/oJ9Hv+/yVfO6byiUj0J0y/H9a5MD37Xl5G3/
	GMEOPpsDbwi++iR7xP+LFcM4T5TkWoesHNxutpOW6/HjWKtFR2+9byqM0FsmTpkXXxko
	LVhiS+U5kekiUtU8DfGQR7RxoI9vN2O1FLSgcdVeBAJyKPUrQqnnJ//sLoqb2UfsSobN
	KQ1ddTQttaAbkDdyEwTrkhVDOKU6VzI2Uu/c9alQSMjY3gxott3yObGfYYW0Qx1oNfbH
	JaMw==
X-Gm-Message-State: AN3rC/5acA7z/aUMz8sRzFy/1xILhZmXf3n64Lgwjxw59p9g0Tjs6tJs
	NiMPcR7bMhbrykleLLQ=
X-Received: by 10.28.94.194 with SMTP id s185mr2444982wmb.103.1493915308945;
	Thu, 04 May 2017 09:28:28 -0700 (PDT)
Received: from localhost.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id f64sm1349742wmg.2.2017.05.04.09.28.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 May 2017 09:28:28 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 May 2017 17:28:07 +0100
Message-Id: <20170504162807.8852-1-eu@felipetonello.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH v2] juce: Updated JUCE to 5.0.1
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
X-List-Received-Date: Thu, 04 May 2017 16:28:28 -0000

JUCE 5 doesn't require juce_events to have x11 dependency anymore. Also
there were many improvements on Projucer.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-multimedia/classes/juce.bbclass                 |  3 +--
 meta-multimedia/recipes-multimedia/juce/projucer.inc | 12 ++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-multimedia/classes/juce.bbclass b/meta-multimedia/classes/juce.bbclass
index 715282fd15c1..3927235ef13f 100644
--- a/meta-multimedia/classes/juce.bbclass
+++ b/meta-multimedia/classes/juce.bbclass
@@ -1,8 +1,8 @@
 inherit pkgconfig
 
+# List of JUCE modules that requires external dependencies
 JUCE_MODULES ??= " \
   juce_core \
-  juce_events \
   ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'juce_audio_devices', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'juce_graphics juce_gui_basics', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'juce_opengl', '', d)} \
@@ -11,7 +11,6 @@ JUCE_X11_DEPS = "libx11 libxext libxinerama libxrandr libxcursor"
 
 PACKAGECONFIG_prepend= "${JUCE_MODULES} "
 PACKAGECONFIG[juce_core] = ",,curl,"
-PACKAGECONFIG[juce_events] = ",,libx11,"
 PACKAGECONFIG[juce_audio_devices] = ",,alsa-lib,"
 PACKAGECONFIG[juce_graphics] = ",,${JUCE_X11_DEPS} freetype,"
 PACKAGECONFIG[juce_gui_basics] = ",,${JUCE_X11_DEPS},"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index 6f696e26f928..63ed9e90e08a 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -3,19 +3,19 @@ DESCRIPTION = "Projucer is used to build and generate support files and build in
 JUCE supported platforms, including Linux and Embedded Linux."
 SECTION = "utils"
 HOMEPAGE = "http://juce.com/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README.txt;md5=9ab765ccda8890efc753f287911a1958"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://README.md;md5=65c50b4ff3522b99436da100536ccd1c"
 
 inherit pkgconfig
 
 DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl"
 
-SRCREV = "a8a7fa28e2e9cb19db6a27fcccb567a8ccfe6109"
-BRANCH = "develop"
-SRC_URI = "git://github.com/julianstorer/JUCE.git;protocol=https;branch=${BRANCH}"
+SRCREV = "4f41f28b47d01b939559123d145b4e5860528bb7"
+BRANCH = "master"
+SRC_URI = "git://github.com/WeAreROLI/JUCE.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-PV = "4.2.3+git${SRCPV}"
+PV = "5.0.1"
 
 JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
 JUCE_PROJUCER_MAKEFILE_PATH = "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
-- 
2.12.2


