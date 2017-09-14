Return-Path: <brgl@bgdev.pl>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 739F978369
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:13:43 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id q132so6338380lfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=LQR+QB9fYoVSKiZUJu4vTQbHKqekMks2+eE4bXBF3+A=;
	b=xRPFEZf1rb0CkzdXZDRHOY4x4T+TQI5pxeRAuQnLqm8QpIM2YdM4ZOslzB+jBL8+bX
	rnW+esH4D7LFh8TUcobKdzPWGLJs6RXPMyB4KGJNgVrC/RXHwBnn+clwL4kGDPUNHweX
	gGkJBv8dRWGlXI1NhzidmSfvcNyG3c1SYwyY7GXqDgjtMwJ8TemXguquTG5nOUMSMgVY
	kfIqquSSlspqSh66FbLepn6LGottp/Nt4tyUr7tle9iLeEp7+/+kAsK64rtYd+p9rRZX
	xjCI9R/NHTvgFTRLV6oDbNaZfOY4MzvNpKsMFTV0Uc0lhkTlWU9HAMV3M83LRTHT5AS6
	KUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LQR+QB9fYoVSKiZUJu4vTQbHKqekMks2+eE4bXBF3+A=;
	b=CRzM/oRGUPTtJTP8VgfFXdxgKTlblz7LSfiyyL0MPwgv1Q5wdcBz1Vb6Jqy8Sez/cJ
	jId2Dwm2yfm7zVAg5TSoj5dOayArNDKaiKI/dgw/zaD0lSEPZG+rTMADlO70ZpEqW532
	KTBfrYHVHlvCFY/MEz31ajbWSVD1K5dKPYzSdofIA/jP5O4a01DDwyzg7dgVn3eZE0xU
	Nc6mXKOp6q4PbVL/O55nUXvukcnZOTLCMTEZTU5NkyKP9OrUqXocquB2ZMx+VXQERTZ6
	XkvN75puPDENDJ3+J1+l9MDe1n+QxYgz0XsIPPOrz+fdnOzitLnq8epCR8dpM2NigG4q
	N1yw==
X-Gm-Message-State: AHPjjUiYq7ezfbAf1qA+tvZEP3h6PAs/9JQPMshj5LULGZ+tYoPzZ6N/
	R9p0kZ8ryY5+TqwJWwlqcQ==
X-Google-Smtp-Source: AOwi7QDvaD3rNBTo+7AHP28I9qikE6Az6YyR/c2GoLImjz3LfrzP1ulixtwJrLNMCfH3qXUD2Gezig==
X-Received: by 10.25.129.196 with SMTP id c187mr5821793lfd.107.1505376824552; 
	Thu, 14 Sep 2017 01:13:44 -0700 (PDT)
Received: from bgdev-debian.nomovok.info (auth.nomovok.info. [83.150.126.21])
	by smtp.gmail.com with ESMTPSA id
	e195sm2894068lfg.47.2017.09.14.01.13.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 01:13:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 10:13:41 +0200
Message-Id: <20170914081341.25163-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.13.2
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
Subject: [meta-oe][PATCH v3] ceres-solver: add new recipe
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
X-List-Received-Date: Thu, 14 Sep 2017 08:13:44 -0000

From: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>

Ceres Solver is an open source C++ library for modeling and solving
large, complicated optimization problems.

It's often used in 3D computer vision applications.

Signed-off-by: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
---
v1 -> v2:
- now fetching the source from git, not github archives
- only add a specific directory (cmake files) to FILES_${PN}-dev
- don't create the ${PN} package as the project is not building
  a shared library

v2 -> v3:
- instead of not creating the ceres-solver package, just allow it to
  be empty

 .../ceres-solver/ceres-solver_1.13.bb                | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
new file mode 100644
index 0000000..e883c70
--- /dev/null
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
+AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
+HOMEPAGE = "http://ceres-solver.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
+
+SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
+SRCREV = "19333b0f55c8462381038e70d42af43b52941128"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libeigen glog"
+
+inherit cmake
+
+# Only a static library and headers are created
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.7.4


