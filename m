Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1657374C0D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:30 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q1-v6so5422042pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kmb/rvdBqtsBQ/5vNte6OEAfJ0nUw1kOJgg9KjELcow=;
	b=lFRsoa8i7Hnl4N0hxO1C7vY02fmCdbnG0w93l7bQU6nn/gEDnoo/bBT19yqkP/amJE
	qfwV7iBg80KeFUtsca7BxzBntAvqGBU9hAxi72+qwFX9l45iSMXMUXkho+jeJRsIHBRa
	28CfhdSbs+D6k1L3JNBf4OmZHWjS82IfcKfNo5PyXQ4f0AGMV38qNi+5OvNCJyJi7gIF
	oOsKBnDMJ9DkHp9vbuXVirKVxOjkelPEny5v7iN+vqlQ8QMZ/hjRNNccWXXGobHjfd7y
	FIm4SoJ6cl0FXu0ebeWXRPytxEJyY+IX/TPp49ry1jDtQmrR8/r6H2uBJHhLspZQyzCp
	58yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kmb/rvdBqtsBQ/5vNte6OEAfJ0nUw1kOJgg9KjELcow=;
	b=ebYS0GFCJdjwa09R6lnMbE2OIJLxXtW+YzU40tm6BvYWQ7WuySP3K+YSZZK5x2z63+
	F2z/HvACOsYyOeYl8C/gv1VEyLXbj1SQ3xKuQOMMpeIJK3W/++LfKzZVpmQEorZcZxxv
	Qmu2NHINeGwbzBioCs0g4xOX1PId3+vC/h1wsTqvNFTWaO0ubrIvTtvimB5H4MoczroI
	kHBX1VwwrpZcm7AXaO36iEG+hFXmXKXeWhuMUp59xIv94MgTtAw2M/2VJr4WyNW7arI0
	UskxLG66FMteCY4sxhxKV15RydHJmDhR16kg6kMMVQx21rKZXGkoLtFP4QlPvnfio1IU
	K0GQ==
X-Gm-Message-State: APt69E1ogycI6TUUpW8WdRZBLSdPM4FqwdMDwgDmapyGF6VoTjNRfkve
	yxazruPlq5jyoWjDbamjyTSosw==
X-Google-Smtp-Source: ADUXVKJ8kiDRhThCo9EGFtp+Tay+4PmujfuWSsD6XfrFNG3Gf+iHrLhxmagDZs+S3YQUFGYWHKhZNA==
X-Received: by 2002:a63:6e82:: with SMTP id
	j124-v6mr8354608pgc.349.1529867971778; 
	Sun, 24 Jun 2018 12:19:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:28 -0700
Message-Id: <20180624191845.31082-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/20] upm: Upgrade to latest and fix build with musl
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-sys-types.h-for-uint-definition.patch | 33 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       | 11 +++----
 2 files changed, 38 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch b/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch
new file mode 100644
index 0000000000..a0a47411d7
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch
@@ -0,0 +1,33 @@
+From 48a580bd402cf6a3ee9e42013653219bfeb3caf6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 18:39:16 -0700
+Subject: [PATCH] include sys/types.h for uint definition
+
+uint is defined in sys/types.h, therefore this
+header needs to be included, it gets exposed with
+musl where this header is not getting included indirectly
+as it is happening when building on glibc
+
+Fixes build errors on musl e.g.
+upm/src/kx122/kx122.hpp:456:31: error: 'uint' has not been declared
+|        void setBufferThreshold(uint samples);
+|                                ^~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/intel-iot-devkit/upm/pull/656]
+ src/kx122/kx122.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/kx122/kx122.h b/src/kx122/kx122.h
+index 1622ed50..56e5215e 100644
+--- a/src/kx122/kx122.h
++++ b/src/kx122/kx122.h
+@@ -31,6 +31,7 @@ extern "C"{
+ #include <assert.h>
+ #include <unistd.h>
+ #include <math.h>
++#include <sys/types.h>
+ 
+ #include <mraa/i2c.h>
+ #include <mraa/spi.h>
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 478aa0db1d..babe5f4893 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 
 DEPENDS = "libjpeg-turbo mraa"
 
-SRCREV = "37642f3b0194f6ddd63f1e6b5d49b8cb689d5c81"
+SRCREV = "dc45cd78595c7c24c8a8574c63bb48b5bb99c5aa"
 PV = "1.6.0-git${SRCPV}"
 
-SRC_URI = " \
-    git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
-    file://0001-Replace-strncpy-with-memcpy.patch \
-"
+SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
+           file://0001-Replace-strncpy-with-memcpy.patch \
+           file://0001-include-sys-types.h-for-uint-definition.patch \
+           "
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +22,6 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit distutils3-base cmake
 
-
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
 # will result in only the python bindings being built/packaged.
-- 
2.18.0


