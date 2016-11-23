Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B540F71AAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:20 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so667836pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lC3fBh4+R9arl4vPocYJLIxTW/JCalbEHrVdh1713FA=;
	b=QYsmVQ8iAhBs2ZvRSavabfUnVq3JZBz7MjviVdmzf9xGcLcLLKKyZAh2MH3LnGq5Ro
	EnYjxB9JGlCh9WP2CRofqilJ/eTqK17gawFo8tbQgkLATLsTIEWEeuvYBasUEftIUneo
	q6F3R5lxQtOs4Hc9BEe2Bm1GWAMxe7jTpDgiUd2WsVJq/UvxuD7R8BTMnJrBowUns4xr
	1QFDVcwVC39ldHlqQpzEIze8bZyoplFX17Seu8tZTAC25aW0OlnClprjafiC0ptdoE3m
	34RPsiHWrjzJVEPRzaKJ6VASVBgJtgRbvA75ICwlnNJvqJ5ZFxUZuABF2BHPZGdvHTiH
	/yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lC3fBh4+R9arl4vPocYJLIxTW/JCalbEHrVdh1713FA=;
	b=WW5icnDkutU/OcCRnAgigCH3PXZc4IQFeRzraI8iblsd6ew3Mwhl7PtnK51gzcVM+0
	EO10PQyLAHDjloS2Kfk7KurS2qMNrhJNUAWCWKI3qrXrUDh6qBxxzd3zTaxuCXrzxxUJ
	hU1LcZqlCMADZcGkj9gJOZDC4xd32UaC/hi3raM6AXH9pDQW/h5NQogObpoISrkz2o9n
	elnXzMI/VzzErstn+flZRDszWX+HWU0vFP3+HiQmMDgkRhPjit7vqzIsaD8xMuUf2Tt6
	fYing6KpTAmApb2ARNafOAtkHhjNdIf/8qZWZoX5aRBlN816X4aMWUxG8s98qQKFF9Zn
	Qjuw==
X-Gm-Message-State: AKaTC02iYUPZ63vBdDx1bLdoKIJDrZ6Vxuou/UOjdU+V3lscTk66A/j1jxrRFSURgbiF5Q==
X-Received: by 10.84.218.6 with SMTP id q6mr4563290pli.139.1479892941969;
	Wed, 23 Nov 2016 01:22:21 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:27 -0800
Message-Id: <20161123092209.23699-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 07/49] libcec: Update to 3.1.0+
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:20 -0000

Depends on p8platform therefore add recipe for
p8platform

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb         | 18 ++++++++++++------
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform_git.bb

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 0f2a64e..32ab4b9 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -2,18 +2,24 @@ SUMMARY = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e61fd86f9c947b430126181da2c6c715"
 
-DEPENDS = "udev lockdev"
+DEPENDS = "p8platform udev lockdev"
 
-PV = "2.1.4"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 
-SRCREV = "81e38211724bc6e8bd7a60f484433053ed682635"
-SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release"
+PV = "3.1.0+gitr${SRCPV}"
+
+SRCREV = "6d68d21243aa92862592435e8396b4280ea46c3f"
+SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit cmake pkgconfig
+
+# Disable python wrapper, it doesn't have crosscompiles
+EXTRA_OECMAKE = "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir} \
+                 -DSKIP_PYTHON_WRAPPER=1"
 
 # cec-client and xbmc need the .so present to work :(
 FILES_${PN} += "${libdir}/*.so"
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
new file mode 100644
index 0000000..f6347c2
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Platform support library used by libCEC and binary add-ons for Kodi"
+HOMEPAGE = "http://libcec.pulse-eight.com/"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
+
+PV = "2.1.0"
+
+SRC_URI = "git://github.com/Pulse-Eight/platform.git"
+SRCREV = "d7bceb64541cb046421cbcd4c98d91e9bf24822f"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
+
+FILES_${PN}-dev += "${libdir}/p8-platform"
-- 
2.10.2


