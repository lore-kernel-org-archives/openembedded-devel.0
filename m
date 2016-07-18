Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B397860797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 19:46:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so27934wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SriaiiPYNwWQMFGT/BQeHZjDN9uIpFEu3iszbO+9LSg=;
	b=KPU5yU/yaTq3Spvk23mFm0C0CCTxbB3/AqTa+tT2LPdOBxDg/+SGUJeSU4z5EpFYTz
	VJlcvCUqOmuGw+NImyzGPlKdhLKxdl3gkmeUafA+kIw+evj3VEtSVzrpDAm617JbzMFa
	Ak6uFkCkf1RbXWQUFiD9wWvWNk73nRQ9ZNozbke7Fun8c8XKFqg5M4Numc9q+7LdNHqT
	d+vP472vim5JWeYM5q/czkVkxgbnV57YwK0oqswGyINf3MoPt9xD6iLLUY4C3Xx0vClD
	ZL8k3yBFlack/l0B2jrRSqgMDWRX/pXRL/ib96WzXGXl0hVxCTt5isG9+AI7Nk85dOT0
	hUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SriaiiPYNwWQMFGT/BQeHZjDN9uIpFEu3iszbO+9LSg=;
	b=OgidpRQRScq3cGa/Cu0uck+vf8jV57rsYB20e7yD9HwrKoLIoF84aBcbdL7K2sxPE/
	2Ep5WAGmjkQAUurxswKMdAq67A2uUORaomkDdNgJf+yyiCT4btPdNljUDFWXE6N2B/lI
	GXX/2xfGufO0tpgZyek4V+EPlFbt3/JldaDIG6/VZGH/iI0OUMIhQICh8HKnk/cQwu8+
	Xt9bridXXZ/lF/VaycUy3RN6mwVb1qUIDFVBDVR7TmQCP81exZkhbvW6wyuHRrNocoGs
	qZfYtT7eqP/lug3flv0ChMB0+tL0HS268gIY8efPyz/Qg8Qli4/vtmX9nWbw/yu6Xslw
	g7Sg==
X-Gm-Message-State: ALyK8tLdu1/xT8pvwnMwKFtq/90E8pRDuUbdt2F59IdSCzH0fVFmNH/5PUA14d+DRkCXpg==
X-Received: by 10.194.165.36 with SMTP id yv4mr3016088wjb.154.1468871193248;
	Mon, 18 Jul 2016 12:46:33 -0700 (PDT)
Received: from localhost.localdomain (82-71-26-47.dsl.in-addr.zen.co.uk.
	[82.71.26.47]) by smtp.gmail.com with ESMTPSA id
	q137sm1033296wmd.19.2016.07.18.12.46.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 12:46:31 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2016 20:46:31 +0100
Message-Id: <20160718194631.15334-1-eu@felipetonello.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] juce: Added support for JUCE framework
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
X-List-Received-Date: Mon, 18 Jul 2016 19:46:34 -0000

See below for the official README from JUCE.

For TL;DRs: JUCE is a well known and widely used C++ Framework for audio
applications. It has good support for Linux and ARM.

A typical JUCE application recipe will only contain this skeleton:

inherit juce

SRC_URI = "..."

JUCE_JUCERS = "${B}/cool-project.jucer"

do_compile() {
  CONFIG=Release oe_runmake
}

do_install() {
  install ...
}

======

OBS: This recipe requires a patch[1] on oe-core which is been tested right now.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-July/123972.html

======

From the README:

JUCE (Jules' Utility Class Extensions) is an all-encompassing
C++ framework for developing cross-platform software.

It contains pretty much everything you're likely to need to create
most applications, and is particularly well-suited for building
highly-customised GUIs, and for handling graphics and sound.

Most JUCE modules are shared under the GNU Public Licence
(GPLv2, v3, and the AGPLv3). This means that the code can
be freely copied and distributed, and costs nothing to use
in other GPL applications. One module (the juce_core module)
is permissively licensed under the ISC.

For more information, visit the website:
http://www.juce.com

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-multimedia/classes/juce.bbclass               | 37 ++++++++++++++++++++++
 .../juce/nativesdk-projucer_git.bb                 |  2 ++
 .../recipes-multimedia/juce/projucer-native_git.bb |  2 ++
 .../recipes-multimedia/juce/projucer.inc           | 37 ++++++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 meta-multimedia/classes/juce.bbclass
 create mode 100644 meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
 create mode 100644 meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
 create mode 100644 meta-multimedia/recipes-multimedia/juce/projucer.inc

diff --git a/meta-multimedia/classes/juce.bbclass b/meta-multimedia/classes/juce.bbclass
new file mode 100644
index 000000000000..ac97ca348c3f
--- /dev/null
+++ b/meta-multimedia/classes/juce.bbclass
@@ -0,0 +1,37 @@
+inherit pkgconfig
+
+JUCE_X11_DEPS = "libx11 libxext libxinerama libxinerama libxrandr libxcursor freetype"
+JUCE_DEPS = " \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${JUCE_X11_DEPS}', '', d)} \
+  alsa-lib \
+  curl \
+"
+DEPENDS_prepend = "projucer-native ${JUCE_DEPS} "
+
+export OE_JUCE_PROJUCER = "${STAGING_BINDIR_NATIVE}/Projucer"
+
+juce_do_configure() {
+  if [ -z "${JUCE_JUCERS}" ]; then
+    JUCERS=`find . -type f -iname "*.jucer"` && IFS=$'\n'
+  else
+    JUCERS="${JUCE_JUCERS}"
+  fi
+
+  if [ -z "$JUCERS" ]; then
+    die "JUCE_JUCERS not set and no profiles found in $PWD"
+  fi
+
+  # XXX: Hack for Projucer, since it requires a X Display even when running in
+  # console mode. This will be fixed in future. Most cases DISPLAY=:0 will just work,
+  # the only case why we have JUCE_DISPLAY variable, is in case of a build system,
+  # such as jenkins, that can have multiple virtual X server running for each build.
+  test -z "${JUCE_DISPLAY}" && export DISPLAY=:0 || export DISPLAY=${JUCE_DISPLAY}
+
+  for i in $JUCERS; do
+    ${OE_JUCE_PROJUCER} --resave $i
+  done
+}
+
+EXPORT_FUNCTIONS do_configure
+
+addtask configure after do_unpack do_patch before do_compile
diff --git a/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb b/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
new file mode 100644
index 000000000000..93b23b1b5a81
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
@@ -0,0 +1,2 @@
+inherit nativesdk
+include projucer.inc
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb b/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
new file mode 100644
index 000000000000..b919a7dcb353
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
@@ -0,0 +1,2 @@
+inherit native
+include projucer.inc
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
new file mode 100644
index 000000000000..6f696e26f928
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -0,0 +1,37 @@
+SUMMARY = "JUCE's Projucer"
+DESCRIPTION = "Projucer is used to build and generate support files and build infrastructure for all \
+JUCE supported platforms, including Linux and Embedded Linux."
+SECTION = "utils"
+HOMEPAGE = "http://juce.com/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README.txt;md5=9ab765ccda8890efc753f287911a1958"
+
+inherit pkgconfig
+
+DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl"
+
+SRCREV = "a8a7fa28e2e9cb19db6a27fcccb567a8ccfe6109"
+BRANCH = "develop"
+SRC_URI = "git://github.com/julianstorer/JUCE.git;protocol=https;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+PV = "4.2.3+git${SRCPV}"
+
+JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
+JUCE_PROJUCER_MAKEFILE_PATH = "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
+JUCE_PROJUCER = "${JUCE_PROJUCER_MAKEFILE_PATH}/build/Projucer"
+
+do_configure() {
+  cd ${JUCE_PROJUCER_MAKEFILE_PATH}
+  CONFIG=Release oe_runmake clean
+}
+
+do_compile() {
+  cd ${JUCE_PROJUCER_MAKEFILE_PATH}
+  CONFIG=Release oe_runmake
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0755 ${JUCE_PROJUCER} ${D}${bindir}
+}
-- 
2.9.0


