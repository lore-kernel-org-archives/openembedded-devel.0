Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0A38E770A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:17:36 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so243700560wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ngCNtfR9LwxAtJ5e9XVdQPgxblcE4VzFEB2oC/eweZY=;
	b=yDG70Yp7ghv5yCuBCR03M1RU76N6z6jWe7KI9VZWTXGO4+9wLr0MSS+/GJZwpIM1LM
	W9dk0qGjoD5iEsq/O+q7hIgGmr+IIjjqb3p1ARlu7+f5EVLOphFsEgZtMntN4SXD5WlG
	Fb0WBD6MVR7jSijzYtIHHTka7YeYXannKQGR0bLyVuPmd8E7/L4L1OICQxITTR08KRP4
	L7NH54BYFWTkZKwIIkS3NpLoJACbs9tXRYAgL9c+WAGZixGo7fxDNES2cyXux+JMaFEV
	tpk20uVewvu4BK3+QtAdgxZ8UmarUIwoQHzLpuTVDjbkZ5EsH/ziGLWGEhh65EKNN3uB
	EECQ==
X-Received: by 10.180.10.101 with SMTP id h5mr6103120wib.22.1444850256432;
	Wed, 14 Oct 2015 12:17:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lf10sm11795760wjb.23.2015.10.14.12.17.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 12:17:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:17:47 +0200
Message-Id: <1444850269-18516-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH][meta-oe][fido 1/3] lirc: Make X support to be a packageconfig
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
X-List-Received-Date: Wed, 14 Oct 2015 19:17:37 -0000

From: Khem Raj <raj.khem@gmail.com>

When we dont have x11 in distro features it fails to build
since libx11 dependency is not satisfied

Change-Id: I6774a83f965551a41afe12b1304e44e73fc789c0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/lirc/lirc.inc      | 2 +-
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-connectivity/lirc/lirc.inc
index 77b6c28..429bc45 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc.inc
+++ b/meta-oe/recipes-connectivity/lirc/lirc.inc
@@ -6,7 +6,7 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
 HOMEPAGE = "http://www.lirc.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 libx11"
+DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
 PRIORITY = "optional"
 
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
index c3e61c4..7d93757 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
@@ -19,9 +19,11 @@ SYSTEMD_AUTO_ENABLE_lirc = "enable"
 
 inherit autotools pkgconfig systemd pythonnative
 
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[x11] = "--with-x,--with-x=no,libx11,"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
+PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
 do_install_append() {
-- 
2.6.1


