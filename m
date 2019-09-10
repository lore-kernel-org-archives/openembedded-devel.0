Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A6E237F317
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 17:22:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t16so21500174wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jdrtCem/eIXfl/XIsnBw5WbMAb7VehR8ybXrbKIzz3U=;
	b=fs+/HEic591w/YX8fasQZg2B/GeYPJB13R+BSO0G10tsO4mJgHwR9XlR7dWZCgkpK/
	vu39p3KKpmOtyNbcydpQ4T+87kgHsVvbVIFT76lsQMj7AaGvl12bzVwc1EH1qv5zbPwr
	sJZ5fvIteF9o7Ol/mA75iijGJ0jEkWf9Ey9RCCfoZAMVeaGIApiq8ixbY3Z/q0g2If4Y
	OhOIEkHO8LQ9w3NfukIJfFNyp3Wd/spWa9VLKNXPVOmWX7xFTT1+UuR8LLRzPfNvwyNM
	EPKnAB3t4LSuJWiEJn+bzvFQYUmF47XfjMWkM16OuSjW3qK+ZMhvDxq/0WbtG9x3h2Yw
	rpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jdrtCem/eIXfl/XIsnBw5WbMAb7VehR8ybXrbKIzz3U=;
	b=qd1gXr+7/4MI0S9yu7+gLv+v2lhqO9nIZ+hVS6+gSMsQtGacRBKfBS8bF6QzfTBwxq
	jOKKDYtNpopHJsvm60lGVvtRWU7vh+Bbb+TiRWCD01oEU6koWu5p6C6ePRIwQchfp+KK
	x0JY9pLg+0hZ7m9fk9eC7G0mW0qjXhi+o1Tbb1f/otSJrep4ABR7qK/1Fsb7uydrqXGj
	PHZlgexZ5OhXog0u3SWKNYx2AK96EMG9j9tatoBqP86dnx2wYTgsRrOOyE1yJHhOA6/k
	B8696ZgmqcydAFFk1Eu9QbT9ZKz4l4X+nyeojBeD53plN3f+HWw+rmNFCfFd2HK2im21
	F8sg==
X-Gm-Message-State: APjAAAWPY3HyKoNQihDjLV/NS0Di/xYmlt0sELZUwbSuwsqhNWLq/Zau
	hmLqFCxuRsAzw47ueZWOLF9LCGw0Hf0=
X-Google-Smtp-Source: APXvYqy1T195coD7Eyu3m9PNrQINFeP51m01fTEM6EDV55sWLcVw5lXm4aQ7n2gC9/V+9uK9hKf4AQ==
X-Received: by 2002:adf:f406:: with SMTP id g6mr14459788wro.325.1568136148287; 
	Tue, 10 Sep 2019 10:22:28 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z142sm552646wmc.24.2019.09.10.10.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Sep 2019 10:22:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 17:22:27 +0000
Message-Id: <20190910172227.3126167-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ceres-solver: add PACKAGECONFIG for suitesparse and lapack
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
X-List-Received-Date: Tue, 10 Sep 2019 17:22:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index 140c801c7d..ac463038aa 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -21,6 +21,13 @@ inherit cmake
 # ceres-solver/1.14-r0/packages-split/ceres-solver-dev/usr/lib/cmake/Ceres/CeresConfig.cmake:    set(glog_DIR ceres-solver/1.14-r0/recipe-sysroot/usr/lib/cmake/glog)
 SSTATE_SCAN_FILES += "*.cmake"
 
+PACKAGECONFIG ??= ""
+
+# suitesparse* recipes will be in meta-ros layer
+PACKAGECONFIG[suitesparse] = "-DSUITESPARSE=ON,-DSUITESPARSE=OFF,suitesparse-config suitesparse-amd suitesparse-camd suitesparse-colamd suitesparse-ccolamd suitesparse-cholmod suitesparse-metis suitesparse-spqr"
+PACKAGECONFIG[cxsparse] = "-DCXSPARSE=ON,-DCXSPARSE=OFF,suitesparse-cxsparse"
+PACKAGECONFIG[lapack] = "-DLAPACK=ON,-DLAPACK=OFF,lapack"
+
 # Only a static library and headers are created
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
-- 
2.17.1


