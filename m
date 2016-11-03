Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B53A271AC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:20:47 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so4146005pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0dO3E3GwPVXYN7I2QOA+JGxM16DPHx8MpT2/iSkJkOY=;
	b=gvKbbEZUgecLkrpZdaJBlLiAZYzswz+HDngp7T3HXNoyCqcr1GxUfmpWblcWVLKw68
	+GJCcG/0N2NTBoSf3U0KZR6wu7vzgkoKd/cQENM9EZVeNACPg8c2C4NhvtArIfzDtZWA
	frsgTnmIhrRtJHttj9t71XZ7hEZ56OSFGtxRQp3uWxPAtL1Aoftvm3gQdGPAVstGRgzQ
	XE7CJ5aG41xloicebcgKQ543Yddz10xqLKNwYRTqXvv27DHeHGd2yFDsJWDdOKXs1Luy
	+Yu/ItNqpJqC99EQvAcUa+VJicUXNZb1i7ULm1L4whfMLfDzX8xRO1lNeTJ4fuiU9/Sz
	lURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0dO3E3GwPVXYN7I2QOA+JGxM16DPHx8MpT2/iSkJkOY=;
	b=lYrlmNEATVPjMfvvraV5uhdOqexB/lNvjl4M2jDpIk7o/w6mCQF630E09aPPqnTIUB
	3o6hv4GRx5YKESmQVpx/uWMiIQAdzHKSygl3E3UxWM1ob3cnAgr7oiV4MTvsLoVf7Lwr
	MuFXwxDnO844zfdMF5yr0+nJ5QKPX8AAa13/iPUdzx4fZDNA0rBkY71KQFqF1uFfm6sy
	Uj23HlB4kgQGHAScfLYUs6g2xIWxhD+LNNpY4Q5L1c/Shpk9mcMO+9CbSypWWQAXr6kL
	xGMeUzZtg49LfeqTTvTdNEXDFo+GXIpZmF7UY9JKOitwUAS82bu720E4ac+CkGuaRtzk
	K8nA==
X-Gm-Message-State: ABUngvdarqD6g4h93vGqtaqplBXaDlCF58bOWbhI8HVziZ7XfTwk/agd+F1xPjVmX0h1ng==
X-Received: by 10.98.95.193 with SMTP id t184mr14518927pfb.85.1478161249477;
	Thu, 03 Nov 2016 01:20:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y2sm10386225pfk.54.2016.11.03.01.20.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:20:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 01:20:37 -0700
Message-Id: <20161103082038.6331-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103082038.6331-1-raj.khem@gmail.com>
References: <20161103082038.6331-1-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 6/7] libcec: Update to 3.1.0+
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
X-List-Received-Date: Thu, 03 Nov 2016 08:20:47 -0000

Depends on p8platform therefore add recipe for
p8platform

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb         | 16 ++++++++++------
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform_git.bb

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 0f2a64e..ee49efb 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -2,18 +2,22 @@ SUMMARY = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e61fd86f9c947b430126181da2c6c715"
 
-DEPENDS = "udev lockdev"
+DEPENDS = "p8platform udev lockdev"
 
-PV = "2.1.4"
+PV = "3.1.0+gitr${SRCPV}"
 
-SRCREV = "81e38211724bc6e8bd7a60f484433053ed682635"
-SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release"
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


