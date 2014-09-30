Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 071E471697
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 03:49:16 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fp1so4676087pdb.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 20:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J9ElbVcYFj+5HXbnavAZVD9ivpJ48B3wZs7jYXW1yAU=;
	b=CNM0/i7QK+FE4Rlqqfku2eEyHdjxEsvkvg4Pidf1qO2v0eQ6xETOmm2UQ19CGCKVFF
	h/rLgN8M4vgQ/Jusnf2dI2HXi5BABkW4SwHNrUu/tFsGfIcgSU00sCFeo+KzTVbsnUK/
	pR2OGP3CHmDSdHbyUHIdcUQ8PlMzCGGFAT/NDWXGnFgnDDbnz6fnwQD4MQ1y6Li7wgp0
	RnUTJpKzLxG1bkJUpH6Hwba8lFxzS8iNz6Jn1D9kUwm7+poxTOW1kblMmH1ryYZkCToS
	S8HzaqbTZooYdU17NUgadZTzO317Ts5L51+Q5bNgXMcJ9K5Q4aBSAhtT0rQec6eftUOD
	+uog==
X-Received: by 10.70.124.226 with SMTP id ml2mr916102pdb.69.1412048949972;
	Mon, 29 Sep 2014 20:49:09 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225]) by mx.google.com with ESMTPSA id
	ad6sm13652887pac.30.2014.09.29.20.49.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Sep 2014 20:49:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Sep 2014 20:52:58 -0700
Message-Id: <1412049179-30493-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-oe][PATCH 1/2] libdivecomputer: Update to 0.4.2
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
X-List-Received-Date: Tue, 30 Sep 2014 03:49:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/libdivecomputer/libdivecomputer_git.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index 1154dc0..6c4f4a0 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -2,18 +2,19 @@ DESCRIPTION = "Libdivecomputer is a cross-platform and open source library for c
 HOMEPAGE = "http://www.divesoftware.org/libdc/"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 DEPENDS = "libusb1"
 
 inherit autotools pkgconfig
 
-PV = "0.0.0"
-PR = "r1"
+PV = "0.4.2+gitr${SRCPV}"
+
+SRCREV = "5f765f91430f16932d96b3777404420aa2dd4c7c"
+SRC_URI = "git://git.libdivecomputer.org/libdivecomputer.git \
+           file://fix-ar.patch \
+          "
 
-SRCREV = "b7a6be15ca58cc8f89fbc8fa1a4c840e13d51092"
-SRC_URI = "git://libdivecomputer.git.sourceforge.net/gitroot/libdivecomputer/libdivecomputer \
-file://fix-ar.patch"
 S = "${WORKDIR}/git"
 
 
-- 
2.1.1


