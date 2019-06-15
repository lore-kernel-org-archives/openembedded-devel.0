Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9F27E86E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id bh12so2363033plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CKH0cpG0IOEp/fLYKbbcZj5KCoIBUDL0dOrjcIlnTXM=;
	b=tcCSpZRW7V2nEx5I4BhyZPu6yZ6fQZI+AFcphHb5S9VGxZ4zAEIf+4CJFtQ8W/b7HP
	reSY/cZFFJ9wGRnV9ih3CRM6i6NA3xDrJIGcqMCsH4vW2TjYwRpd3d7fCDIJx/UO9nUA
	lZAqA73uign/hQSmD/sTisw54bbBgAP4O0zyAQkju0G/g+E9fGakWWI4WDTdIZEbW4VO
	bHwZRqWg0kOn3BLcARY0QkZIbinZcvialMn5GtQNoPlv5oSXXLGZHD17WcOLx8IKVMQt
	gqPSWmZvT7zoUyTB9VTh68NWOqkjUc4S/WUbiD9slBLSYOWWtuKi9rr9zjmD1pUTuH4E
	GRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CKH0cpG0IOEp/fLYKbbcZj5KCoIBUDL0dOrjcIlnTXM=;
	b=gpudNGdmTXxkXY5HRsG0IxiPXjzZGSybos99qlyrEwNce1AqVKNIMIQrl/KODSukl/
	u44W13HVkA4ulkhBldDyp7Vh0LDwM2tRFHyyfx6KblWfcv8mP5/LfeKMwuNecpYbKjz+
	7kvCmeDKKomcWaLaxzYzDXdin4Yq8IQuvoqtNczMUibprUj8jDeB9uVInhPfwJ2hlZ2o
	Voz4RnvcD6AHQ3jSgMF5YpIF37wkj72xXimYPegMGmb/rar7vgtHVPGE8fwEiTNbY8e9
	MK9ohvyEUt4RUJeNYc9+hjRM1othDPak25XpDHMcTcjFov41zu4fdA0a29EK3qjkMNVA
	/AzA==
X-Gm-Message-State: APjAAAX7gaPVta1bmApsnDmH4bog4tfKfQb7FdovRCJVtTeJVR9Nhqkb
	BMp9wD19a/NDu+Gu6N63rqPHpcfW
X-Google-Smtp-Source: APXvYqwqNdwnNlFKI0JcVbxDMa44dpfNX6XYW9UWSdV3bF91KdfGsmElh9hJG8dRpfy14o2l0gzSzg==
X-Received: by 2002:a17:902:324:: with SMTP id
	33mr99476704pld.284.1560621464102; 
	Sat, 15 Jun 2019 10:57:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:17 -0700
Message-Id: <e68fd1c8e982fc5470f7606cff57fe59272c9017.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 13/23] ne10, libopus: add armv7ve override as well
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:43 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fix the override in packagegroup-meta-oe.bb
* alllow building ne10 for armv7ve (e.g. Cortex-A15)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb        | 3 ++-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                 | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5fcf989..af3e848 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -220,7 +220,8 @@ RDEPENDS_packagegroup-meta-oe-shells ="\
 
 NE10 = ""
 NE10_aarch64 = "ne10"
-NE10_arm7 = "ne10"
+NE10_armv7a = "ne10"
+NE10_armv7ve = "ne10"
 
 RDEPENDS_packagegroup-meta-oe-support ="\
     anthy asio atop augeas avro-c bdwgc frame grail \
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index 50d4937..fb9bdc7 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -28,9 +28,10 @@ EXTRA_OECONF = " \
     --enable-custom-modes \
 "
 
-# ne10 is available only for armv7a and aarch64
+# ne10 is available only for armv7a, armv7ve and aarch64
 DEPENDS_append_aarch64 = " ne10"
 DEPENDS_append_armv7a = " ne10"
+DEPENDS_append_armv7ve = " ne10"
 
 python () {
     if d.getVar('TARGET_FPU') in [ 'soft' ]:
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 4e8986d..f37ccde 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -15,13 +15,15 @@ PV .= "gitr+${SRCPV}"
 
 inherit cmake
 
-# Incompatible with archs other than armv7 and aarch64
+# Incompatible with archs other than armv7, armv7ve and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_armv7ve = "(.*)"
 NE10_TARGET_ARCH = ""
 NE10_TARGET_ARCH_aarch64 = "aarch64"
 NE10_TARGET_ARCH_armv7a = "armv7"
+NE10_TARGET_ARCH_armv7ve = "armv7"
 
 EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
 
-- 
2.7.4


