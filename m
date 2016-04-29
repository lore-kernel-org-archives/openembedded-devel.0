Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35F78770C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 16:24:52 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id f92so44726724qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 09:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O9dACEr4PQC9CmI3LBx1pN9ApcgPOQE3rMsDXv6PfHA=;
	b=PNPhpG+XiYYmanXbQH7bKECOnHBla1W/haVVwk1tMuPeh69mmVCC+/LrpWS+yRshKR
	gUqUVSzlUkKNQmnRDW97spKzLkWUPY6vbCq0s4kEys/Z+5O92FbaQ84dIK0TNvexnEpC
	b6ImDEWomoQrPCOTyg7Jwp8/w9dcLyVpkwmTNH4LMFRvTMUiVOi5TBTmlM2N10QKrCMf
	u5HQBA4U2KPCa4GcfbJm7NSpHicnJJUeS8HwTDBdtps7uUP5ShU2cXO5sXnCKC21xUan
	2ITvI+uLNC1CtWa4sTA8ZSFEL/bOXH0EtxKokustekVuSfCCfmMJF0m1OskafX2A9FBZ
	Arkw==
X-Gm-Message-State: AOPr4FVBfSq9zUnXCsgYaA42Xd+xFR0HuT2e0YS9N9J6ygQA5rNE0vtMCuHJoeYe7Agzrg==
X-Received: by 10.140.84.136 with SMTP id l8mr19982841qgd.86.1461947092918;
	Fri, 29 Apr 2016 09:24:52 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	h75sm4648591qge.30.2016.04.29.09.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 09:24:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 12:24:41 -0400
Message-Id: <1461947081-15513-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCHv2] giflib: update to version 5.1.4
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
X-List-Received-Date: Fri, 29 Apr 2016 16:24:54 -0000

  - Remove EXTRA_OECONF to disable X11 support since direct X11 window rendering has been retired
Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb}   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb} (67%)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
similarity index 67%
rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
index e59d0e5..21fa352 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
@@ -2,14 +2,11 @@ SUMMARY = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
-PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
 
 inherit autotools
 
-EXTRA_OECONF = "--disable-x11"
-
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"
 FILES_${PN}-utils = "${bindir}"
@@ -18,5 +15,5 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}-utils = "perl"
 
-SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
-SRC_URI[sha256sum] = "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
+SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
+SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
-- 
1.9.1


