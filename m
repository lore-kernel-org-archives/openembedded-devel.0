Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id B11A46084A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 01:49:14 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id ay11so312626plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 17:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hZy7MNYkHpvcWuw40C95IR3ALc2gylExqV+zuctke24=;
	b=gu1rMAx+1OlgMfNTM34r8dhVQR9UbIPJWWIlEM1doKUNiLg07zDxOw7J5qlPQbkb2g
	t4e5Rfr7wUkjHPef+7hT3GCeh9Ctptb58fukFHwZGnQpwHh0Mz1GxoQK398okEAVhRUV
	xwxvoLYGSbZHfKRHdMD706pQCAZ1QrZ1zlEpBWA1r1MT23vnOyQz52+wQetN/FxO4PPb
	P+rn++5icvH4YceG7Oub6jIs9ID/ubpft15Wn9/nClVq1fM/o/WUDsUKFKu/gqkhTrs8
	wpbs8/Tk6JHIODC20PBn5S2Nf6W6uCV32QJCwm8ZnCIuDTOpvjV+D42464s0jmTm4VBj
	Xh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hZy7MNYkHpvcWuw40C95IR3ALc2gylExqV+zuctke24=;
	b=ol8GKwQno7FIb67pzfkomstM32AsjiE1Cum3zY3qzJId0hi9y16JPdPkxqEvciug5z
	RBVd/YG1ovmYpsTICLmjXERtKU6wdSjQsVgrGj99RzFBWWlatMDd5LwzFBZgmxNj1ylN
	WOMNv5048HJnuvx2Mk1hgau+S9VKDmTAG3q7g3l5lTgT5oaJRQY+0fZPEk48csBHX77A
	MY3ojO18OK9XR8vU2x7+L+GL3vUV1Siy7a9b5LIsOKpbiHR77f+WvhEph5N3YvpPqHUK
	vLpa9621FYdBMqUCC+otWJKPHp69CFQtKnF677Vda6VGTt/UyDKGxl49VWdnB9zRWS6R
	4EfA==
X-Gm-Message-State: APjAAAXm1aXfG/2kE2HBrndGOWGHDs+rrQS0JGBRou5rNIICR89bHvEa
	UooSWcCTZx2j/pgGNkSdMRW6Py23K1I=
X-Google-Smtp-Source: APXvYqwh1DPZtMRSsIHtxiM/lfwiXfVKUPjNx6vQbZl62vbg3aJe9rdYl25KY0doLuQWNjt0AU8bvg==
X-Received: by 2002:a17:902:59da:: with SMTP id
	d26mr5871178plj.287.1581472155177; 
	Tue, 11 Feb 2020 17:49:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	x12sm5903743pfr.47.2020.02.11.17.49.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 17:49:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2020 17:49:20 -0800
Message-Id: <20200212014920.4109919-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH v2] libconfig, libfile, libtest: Do not inherit allarch
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
X-List-Received-Date: Wed, 12 Feb 2020 01:49:14 -0000
Content-Transfer-Encoding: 8bit

These perl modules use cpan class, which adds build time dependency on
perl, and since perl is arch specific this ends up with sstate signature
differences for do_configure when arch is changed, therefore these
packages needs to be made part of arch package-arch

Fixes

ERROR: libconfig-autoconf-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile: /home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 43053, PID: 16399
Hash for dependent task libconfig/libconfig-autoconf-perl_0.318.bb:do_prepare_recipe_sysroot changed from 66cd7f8d93afb36b314a0604e94f72151cb18410f395bc949156188a764ad68c to d9752dd39f67802473ebfe048ca1a688d684c7c31483e648c4e43bde9b16e3b5
Unable to find matching sigdata for /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb:do_prepare_recipe_sysroot with hashes 66cd7f8d93afb36b314a0604e94f72151cb18410f395bc949156188a764ad68c or d9752dd39f67802473ebfe048ca1a688d684c7c31483e648c4e43bde9b16e3b5

ERROR: libfile-slurper-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile: /home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 39201, PID: 16448
Hash for dependent task libfile/libfile-slurper-perl_0.012.bb:do_prepare_recipe_sysroot changed from d6fd4eb704e706ed44daf37099d47fd188f6ac8c212c779dbfa7e40cff7bf449 to 9f0c17d2bf8389c634c143cc908e81f85b4d4bdab245199c86d4ae4480856d0d
Unable to find matching sigdata for /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb:do_prepare_recipe_sysroot with hashes d6fd4eb704e706ed44daf37099d47fd188f6ac8c212c779dbfa7e40cff7bf449 or 9f0c17d2bf8389c634c143cc908e81f85b4d4bdab245199c86d4ae4480856d0d

ERROR: libtest-warnings-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile: /home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 43651, PID: 16479
Hash for dependent task libtest/libtest-warnings-perl_0.028.bb:do_prepare_recipe_sysroot changed from 77d070ada82799a51cce33ae63f70dafb2c20111e0dca15afc041efea22f1cd4 to 3d0bd29b23c66f14d4041153683eaa3d4ee0098e2b023747801748eb49da6300
Unable to find matching sigdata for /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb:do_prepare_recipe_sysroot with hashes 77d070ada82799a51cce33ae63f70dafb2c20111e0dca15afc041efea22f1cd4 or 3d0bd29b23c66f14d4041153683eaa3d4ee0098e2b023747801748eb49da6300

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jens Rehsack <sno@netbsd.org>
---
v2: Fix type which accidentally replace cpan with cpan_build

 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb     | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb    | 2 +-
 meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
index e4f8fe7e24..afd26fa1c4 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
@@ -36,6 +36,6 @@ RRECOMMENDS_${PN} += "libfile-slurper-perl"
 
 S = "${WORKDIR}/Config-AutoConf-${PV}"
 
-inherit cpan ptest-perl allarch
+inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
index b684abd4be..3678ad7621 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
@@ -31,6 +31,6 @@ RDEPENDS_${PN}-ptest += "libtest-warnings-perl \
 
 S = "${WORKDIR}/File-Slurper-${PV}"
 
-inherit cpan allarch ptest-perl
+inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
index b40a5456eb..f2dda194dc 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
@@ -24,6 +24,6 @@ SRC_URI[sha256sum] = "26fda9f8d279e943d27e43a4a3a5cea8a6592cd36e7308695f8dc66022
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-inherit cpan allarch ptest-perl
+inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


