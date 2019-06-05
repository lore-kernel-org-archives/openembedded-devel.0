Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46CBF7E079
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5534qT6005567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:52 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:04:00 +0800
Message-ID: <1559703841-263740-7-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] pavucontrol: upgrade 3.0 -> 4.0
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:51 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

drop support of gtk2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-build-sys-Use-C-11-for-building.patch     | 27 ----------------------
 .../{pavucontrol_3.0.bb => pavucontrol_4.0.bb}     | 10 ++++----
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-build-sys-Use-C-11-for-building.patch
 rename meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_3.0.bb => pavucontrol_4.0.bb} (52%)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-build-sys-Use-C-11-for-building.patch b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-build-sys-Use-C-11-for-building.patch
deleted file mode 100644
index b59569f..0000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-build-sys-Use-C-11-for-building.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1f92aa5c8d910519e3a74b2e3a9199aa9026a16c Mon Sep 17 00:00:00 2001
-From: Arun Raghavan <git@arunraghavan.net>
-Date: Mon, 25 Jan 2016 08:41:42 +0530
-Subject: [PATCH 1/2] build-sys: Use C++11 for building
-
-This requirement was added by gtkmm at some point:
-
-http://www.murrayc.com/permalink/2015/07/31/gtkmm-now-uses-c11/
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 5b50e2d..8f28782 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -39,6 +39,7 @@ AC_PROG_CC
- AC_PROG_LN_S
- AC_TYPE_SIGNAL
- AC_HEADER_STDC
-+AX_CXX_COMPILE_STDCXX_11
- 
- AC_ARG_ENABLE(gtk3,
-    [AS_HELP_STRING([--disable-gtk3],
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
similarity index 52%
rename from meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
rename to meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
index 959068d..6a82744 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
@@ -2,19 +2,17 @@ DESCRIPTION = "PulseAudio Volume Control (pavucontrol) is a simple GTK based vol
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "intltool-native gtkmm libcanberra pulseaudio"
+DEPENDS = "intltool-native gtkmm3 libcanberra pulseaudio"
 
 inherit gnome distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz \
-           file://0001-build-sys-Use-C-11-for-building.patch \
-           file://0002-build-sys-Add-m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch \
           "
-SRC_URI[md5sum] = "176308d2c03f8f3a7b2bd4f4d284fe71"
-SRC_URI[sha256sum] = "b3d2ea5a25fc88dcee80c396014f72df1b4742f8cfbbc5349c39d64a0d338890"
+SRC_URI[md5sum] = "9dcc2c76292e7e5e075d51b8dcb20202"
+SRC_URI[sha256sum] = "8fc45bac9722aefa6f022999cbb76242d143c31b314e2dbb38f034f4069d14e2"
 
-EXTRA_OECONF = " --disable-gtk3 --disable-lynx "
+EXTRA_OECONF = "--disable-lynx "
 
 RDEPENDS_${PN} += "pulseaudio-server"
-- 
2.7.4


