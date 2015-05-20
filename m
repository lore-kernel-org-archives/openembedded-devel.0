Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D7FBF6AC15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 06:04:41 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so31491926ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 23:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6X/ZMBoHSD+YSUjvO44cCnfahT0AOIWhatffDm7jGbc=;
	b=e81jBLcYfVYcxh1rxlMFr3u5X02YpJAVNUJnxdh56EWwWyMtNTejtMlpytzMFMlsEb
	CkZwiTq1AnIphIXi1okDOVbslHXm6QARvPQcGRVnmrYNWaiKnG1kU0fB28x9fL1+X39N
	Pl70B1dRHgCH7xM6DBrfzahSQpn29xJhUc6/QSLyRdyhxlbqmMqYvyo4oB8wzde5crQs
	vSZv2hCps9mWojQFbu0cnUi+5BNi0Mod3ia+oqxbHvltuSPDxEuC2Y5nRqQTQlPs2+Ev
	0KQgAODADCdQetGc9UJ+5dGFXx7oriAj+5hBhIWHw2ZmsH52Gz/qBQllMn3AzEQZgaZy
	EzpA==
X-Received: by 10.50.73.169 with SMTP id m9mr26037591igv.37.1432101882581;
	Tue, 19 May 2015 23:04:42 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id qh1sm930772igb.17.2015.05.19.23.04.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 May 2015 23:04:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2015 23:04:33 -0700
Message-Id: <1432101873-25954-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] lirc: Make X support to be a packageconfig
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
X-List-Received-Date: Wed, 20 May 2015 06:04:42 -0000

When we dont have x11 in distro features it fails to build
since libx11 dependency is not satisfied

Change-Id: I6774a83f965551a41afe12b1304e44e73fc789c0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.1.4


