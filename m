Return-Path: <lukas.bulwahn@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1097A60685
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:04:41 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k62so4440720wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qQl3yqw92HYVCvwo/2VW70YHDrt2oo88eLR6KVZfkjQ=;
	b=eFVKiTIXV3BszxrkA0ojrkyf0Nur/43X8RdF/i1wZ3Z7EVoX/dakvkuyTXVJwpUMAz
	S1ldEVkrnjczxvd2Re6mP0RbATy0God3LjblPTIIHoitDDsnisAuaJWS/3LLUNutal2X
	xWrkyDlssI457omiAi0ygyrCk28X5zqr5RzxLR1CyJTdJ88umAy09EcEqZj1AMf8SPGa
	WYsjPehwRojasuYHdDe572HD1R10TEJ7KGHmbJsUEsx57R9UxbVMGrHFuEUFBpqS0NIW
	XExIUM2ZZDz/U4w5Gxhfbbu3xt6H5vD7H9qau29XraKIxdWavTX823LAhuyD3O6RlgUr
	EiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qQl3yqw92HYVCvwo/2VW70YHDrt2oo88eLR6KVZfkjQ=;
	b=ZFRle6NsIDf0DByRxgakNJ3PJjuaBCyAcZbstHC5FAwSJOyDrNSLSPOevzRnwMM9Bw
	JHGq2kirib2Hq5W3Wcc5t5pPGCgisj4AYnqGNroOGps3iNigTCosJ6Bz5DKel1+s2mwx
	uRaLvgUCFshfHpXrormEPvTjL1pbfsrhFp+5gRvQgRj1TZPQ+Ov2ivI63PbdfA9cr/RJ
	Om1n0ZnMUs1bJKlpZjleEVeGzcTETAAhTuoqHTj1G6bumTsRMuNxzecBg6hUVLzTNcHj
	VH2+2tXw5UUm62U88QqdTc9FkqpgTFoN06VtAC0KNP3r+BhDNQJNP2UsPktrejOH8dOl
	kwZg==
X-Gm-Message-State: AMCzsaUg6K8gXotLMAftSGKB/y7kGs3SjwUwXp9ipbAG62s/VqcyYPg8
	EYZqh7elUHOhf64iGjfPTcXpGA==
X-Google-Smtp-Source: ABhQp+Tl2p0bIR3b0zMR1X0RBadx3ppLiviLFOE8aAAZn1lye9HIJQLhTHxTb+M7LucWX9OFvlnjxA==
X-Received: by 10.223.147.135 with SMTP id 7mr2456420wrp.237.1509617082266;
	Thu, 02 Nov 2017 03:04:42 -0700 (PDT)
Received: from hsp.bmw-carit.intra ([145.253.130.2])
	by smtp.gmail.com with ESMTPSA id
	x23sm2136370wmc.31.2017.11.02.03.04.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Nov 2017 03:04:41 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:02:47 +0100
Message-Id: <1509616967-31948-1-git-send-email-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [meta-oe][PATCH] libeigen: update to 3.3.4
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
X-List-Received-Date: Thu, 02 Nov 2017 10:04:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb | 21 ---------------------
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
deleted file mode 100644
index dcca2e9..0000000
--- a/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
-AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
-HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
-
-SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2 \
-           file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch"
-SRC_URI[md5sum] = "9e3bfaaab3db18253cfd87ea697b3ab1"
-SRC_URI[sha256sum] = "722a63d672b70f39c271c5e2a4a43ba14d12015674331790414fcb167c357e55"
-
-S = "${WORKDIR}/eigen-eigen-07105f7124f9"
-
-inherit cmake
-
-FILES_${PN} = "${includedir} ${libdir}"
-FILES_${PN}-dev = "${datadir}/cmake/Modules ${datadir}/pkgconfig"
-
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
new file mode 100644
index 0000000..bc3b32e
--- /dev/null
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
+AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
+HOMEPAGE = "http://eigen.tuxfamily.org/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
+SRC_URI[md5sum] = "a7aab9f758249b86c93221ad417fbe18"
+SRC_URI[sha256sum] = "dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6"
+
+S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
+
+inherit cmake
+
+FILES_${PN} = "${includedir} ${libdir}"
+FILES_${PN}-dev = "${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+
+# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
1.9.1


