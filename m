Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 250647EF32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 10:46:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id s3so1789257wms.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PkewvxtuHNoh4Sdi57LKUGkVGPv6K1iY7e+kZmIOrTk=;
	b=PY1FiPhLts2f8Wv8H63j8P76nPPxYSogMszW/+RYwubvG8dfgADkdYL2L61BkSoZLR
	ibwx66EmPSF7v3lBkQ2qLzRX4su36FEFJnj1/t8B5+igQtrMyvHEmziSt/IR5iwTrvHA
	GGWk+H0lr3wCeLcD/TAVvK8qKTkyIMrnNsppIfTapOyOFSJZ+/xSfB+OgA7ePdKzCHTY
	2/qf1CCrHRENiFCY5TBcJwrBGnm+tc+b2/DKmZcehxcCJHeOWU6ac9hXL03cakNO2P8k
	kgNtyw875asRmS6tue6a0fawcl+1XOWjf3hGJh98gd2pkgmVbJh3lECVga9CjRYfMoX2
	1EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PkewvxtuHNoh4Sdi57LKUGkVGPv6K1iY7e+kZmIOrTk=;
	b=UwZyNx7mOgUuSk8/J2b25PvGzheIa7oZ8WZyfwe94GyUKPyzPBfiwGWkuNOR6owmF4
	rw/Kwgb0qN9aEGFq85ATx9As6gB6iZHVJ0hN+AbFfuJIvIqY6bIbbXAaBSx8BKxrIv5H
	yKbV08MMHRf3N2axlBDg3hCu8A9cIUex+imbTR/MKEjcsWpXz/6+e0ZXdqx9NZ11NdzI
	B64EnidTFCjTHGatX5GceIRa1iQEdBHEF7Mr9vN9PRkRMOQ7U7CBsMfyYMTXKpFwqoa9
	C6mnhzsevUOTYqKm+iJwhuUOFAPYw4CIKxCCjX4izVGQkym45LclciqXJefqA2ya/4mc
	U4DQ==
X-Gm-Message-State: APjAAAWj3NeNzZxeh0pqCMH1pjuKToFmEVz4loLBGvywuJ3Jwpa/5L5x
	jCbazyISi4CxyB0b3HUy9lvC9ykW
X-Google-Smtp-Source: APXvYqwjepWWirtp99sZIPEkuL7PKT3BQ4WMs5WRSt+h1cPMirXny1PCP98JWsLh3UZpwFadTAHKSw==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr5129526wma.34.1562755614504; 
	Wed, 10 Jul 2019 03:46:54 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j10sm2666135wrd.26.2019.07.10.03.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Jul 2019 03:46:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:46:52 +0000
Message-Id: <20190710104655.2229-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710104655.2229-1-Martin.Jansa@gmail.com>
References: <20190710104655.2229-1-Martin.Jansa@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [warrior][PATCH 2/5] ndctl: Remove the unnecessary dependency on virtual/kernel
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
X-List-Received-Date: Wed, 10 Jul 2019 10:46:54 -0000

From: Adrian Bunk <bunk@stusta.de>

This also makes it no longer specific to MACHINE_ARCH.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/layer.conf                 | 6 ------
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 5 +----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index c7dbbc1073..bc9039041d 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -51,12 +51,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->php \
 "
 
-# Depends on ndctl (through nvdimm PACKAGECONFIG) which depends on MACHINE_ARCH kernel
-# and making libblockdev MACHINE_ARCH is not an option as python3-blivet, udisks2, gvfs
-# would be MACHINE_ARCH as well
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  libblockdev->ndctl \
-"
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   terminus-font->fontconfig \
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
index 61e53029b3..2f299b1ba5 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -13,15 +13,12 @@ inherit autotools-brokensep pkgconfig bash-completion systemd
 SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
-DEPENDS = "virtual/kernel kmod udev json-c"
+DEPENDS = "kmod udev json-c"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
 
-# Depends on MACHINE_ARCH kernel
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd, systemd"
 
-- 
2.17.1


