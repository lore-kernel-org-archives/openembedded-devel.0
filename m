Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id CB6687D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 17:20:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id g207so432087wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lx9RIvndEkkpnXVOpsUZWTlbCQPyzaKoNh0qIfxSivQ=;
	b=oF/kNVzWaRBDe1Rl8Dc1kkAZz2j7DbjooO5pgO13SkFLJURVCLJ3/sKn6vZnSYZe9k
	SOYU1anX7s8DURziWv8U8GZiAvqjUZaYGoWwqfTYaEEpdyZi199eyqYh4Zisz4LA2ZU1
	KVcHCV5Llqgjz2Eqo11YXTpdYTZYT5kR0fkr78j0oMHFI21/+zUQY6gix0ix07zGOuIO
	PJFm0TkyStOuwVpnQWJEm6cDIrApRIxrMH3+DL8g9+PM+hR+hPbqkd37ryqnX6pKp7Dh
	mEfLJDZvo4XcfIs9VEPdwEOCavSUt8sPMEN0y+QPyDBDscmZVin94qtyaaNlC0PtINCS
	sNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lx9RIvndEkkpnXVOpsUZWTlbCQPyzaKoNh0qIfxSivQ=;
	b=SaAI8df58Ut81Bvklimom0vHDwi4cTHve1k3IGGpmp1NvVk/2C0ReHXrAdpuTUwMRn
	WmBgbwgEpFDqkSzQUQk/+9lyW9e5ipoy2S7+MZu+KCLDNmJ9puLC/T0ZCV6cey0vE02o
	xtnBCKNtZOl8+LAXVnC1o9IuRhF344moyuIzYVaIqN46rqMJe2YksyTe6V0klk/R4+OU
	ok2R8r7OfGCHN5uK4HH1WYGxM02rWewHJSUpJO6MPJ39uDTOuxO+ZTg6TyZWBqG9eHGb
	77jkBOT2ErQOTxmC4ZBcf+4O8Ao+eRgcYx7pdwQfz/4gRBJm21eVesv+v/Mc5hQM1tp3
	3Log==
X-Gm-Message-State: APjAAAVkJcQDfs1dB+SfXWKFrC9MaYkF/EFdJtQ5iIT2hPIXdCEuDusU
	uQ8v6mTjt2RezAB2mkHaxwLwOpaqtrc=
X-Google-Smtp-Source: APXvYqyFajB0zUPxedRSk1GoZS4hMxTTNaVMPcVRkBvF3fEdPkjd7E2q31P10obkNW5qzKNhcj9oIg==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr440910wma.171.1568136017466; 
	Tue, 10 Sep 2019 10:20:17 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	x5sm26524699wrg.69.2019.09.10.10.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Sep 2019 10:20:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 17:20:17 +0000
Message-Id: <20190910172017.3123830-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ceres-solver: fix the paths in .cmake files
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
X-List-Received-Date: Tue, 10 Sep 2019 17:20:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index a62e5ef230..140c801c7d 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -13,6 +13,14 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+# We don't want path to eigen3 in ceres-solver RSS to be
+# used by components which use CeresConfig.cmake from their
+# own RSS
+# ceres-solver/1.14-r0/packages-split/ceres-solver-dev/usr/lib/cmake/Ceres/CeresConfig.cmake:  set(Eigen3_DIR ceres-solver/1.14-r0/recipe-sysroot/usr/share/eigen3/cmake)
+# ceres-solver/1.14-r0/packages-split/ceres-solver-dev/usr/lib/cmake/Ceres/CeresConfig.cmake:  list(APPEND EIGEN_INCLUDE_DIR_HINTS ceres-solver/1.14-r0/recipe-sysroot/usr/include/eigen3)
+# ceres-solver/1.14-r0/packages-split/ceres-solver-dev/usr/lib/cmake/Ceres/CeresConfig.cmake:    set(glog_DIR ceres-solver/1.14-r0/recipe-sysroot/usr/lib/cmake/glog)
+SSTATE_SCAN_FILES += "*.cmake"
+
 # Only a static library and headers are created
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
-- 
2.17.1


