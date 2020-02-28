Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84D4A6184F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:36:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p18so2944290wre.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 05:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ne7ktBG7Vbucdyc0MvUk5QF9uSTcGYxqJiiyevCyvrU=;
	b=Va88YIlDw+otfOF19sy631Ay8sprsN129VdnVJNGVpghxB3eQZc9zAPZnbYXXjZIc4
	hE823AigNfSTGrFinj5z49KdiIqDPrlEljTeftSpgr5pN9+AWJV2ev8FRyHRPIVXgSGM
	m8myU+/EYvXZZ7EfM5Dmk3DFeR9ONGuDl6ggULtNKCvyaGDM4tQFa5Dp5Nx0AUZi8ahm
	92ivqVpYe6t7fonrmVnlnyJqoBjek+7KWFQeCFzKptBfF/r4w25H9wRU4YjYccPg3sbk
	e+6hLfzhbzwY4kjd16Lulzqki5WhxrRq758tViYSeuQW0Z0qRvGg7oxYXxaOgLWUErfH
	nYsw==
X-Gm-Message-State: APjAAAVUxaxMsHdkXbW8aemHEiJyqKTTkp9ITG9GISKx3tJqtH3XcaDN
	yFX0IBXUlbe1oGuGGNXIONlfzxPn
X-Google-Smtp-Source: APXvYqxeJ8vbMo4Vgk6/0E8TyV48JByG7IrJsjTQsqiqtJdbJYUL9qIGR9IZdVZ7dX7F4E5Trj1sVg==
X-Received: by 2002:adf:c445:: with SMTP id a5mr4903562wrg.14.1582896965569;
	Fri, 28 Feb 2020 05:36:05 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a3sm13210471wrq.63.2020.02.28.05.36.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 05:36:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 13:36:04 +0000
Message-Id: <20200228133604.39253-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] meta-oe: use COMMON_LICENSE_DIR for license file location
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
X-List-Received-Date: Fri, 28 Feb 2020 13:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

COMMON_LICENSE_DIR is the official location for license files

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb          | 2 +-
 .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb          | 4 ++--
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb      | 2 +-
 meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb                | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index 17e8c700c..39a0ccc8c 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Dhrystone CPU benchmark"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851"
 
 SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
            file://dhrystone.patch"
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index d6da51b0d..9c16da416 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "This recipe provides m4 macros from gnome-doc-utils project, so \
 that dependent recipes can build. Gnome-doc-utils itself is no longer packaged because \
 it requires libxml2 and python 2 at the same time, which can no longer be satisfied. "
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 SRC_URI = "file://gnome-doc-utils.m4"
 
 PROVIDES = "gnome-doc-utils"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index d2058ba57..fae760bbf 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Machine specific gpsd config"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
 
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb
index 39629cce0..44679c047 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Very fast, header only, C++ logging library."
 HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRCREV = "cf6f1dd01e660d5865d68bf5fa78f6376b89470a"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x;"
-- 
2.23.0.rc1


