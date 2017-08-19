Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63CD660616
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 14:27:04 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z91so12124054wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=47us9+mbAeNN1HITX4DuB06dbsBQgt3lapB/of/wfak=;
	b=FRppHQ/cy9z6q8Nzk/jfvpDIwjm5m+KjiUQw+xZx5CRlpbA+5n/uzMzzW1KKIm2ZMp
	U4gqoGKK1CU7jJyxnemIRZCXlaeYHsY9UxKQlM5GuedpX7fezmH2NSM5BnGtWbDfvbnD
	cq8Iaso8dV1ZvStLweA+jXTKEXpB4xEhsHJccVq3z6Gkt0XltH6yGw3hlgD7xus2Wh1v
	jw1wwze0SiXiFzlDgAT9ZWh24vhSVch2e6lNMUr8+UWmCJyBq1Q5L658I+/Cq6z/P5ul
	LeV9YAS9YIt5nwfoo0bOLy86kSYs0+n3UphROyOStn3rveV5KNYbjFggWSDSPrdvdzbz
	pi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=47us9+mbAeNN1HITX4DuB06dbsBQgt3lapB/of/wfak=;
	b=c+helGhAb95RJCHNe5yJD/PD5NLEGV7lJSg4IaVHGLXlgvA9vGbTKQXa1oGvjYOBim
	efZZ61zWvP+hXdoa/4IriXfZqFX3PtzDZxTtlm4hvJmK8aqk57gS58UXNVeVgSLYLFmW
	VE9inWN3i9BW2YHO9ThdyqEK+pILMOtKwWAcIA6c42bf+AOT/+zSv0hyxIYJtO6fJ0QB
	wGd4LQ4S9smQqzRdEO+C4ZywvcpZk2PpnpQRZyLVm2RnRhQ4XCwoFSLfJBG3FsJGcGCg
	kMdtzi9FlMYapcurr6PIhDPMyfq6VrKgp+60aTibq1XPA2G2tybO3mnbgzT/9z0cRt2H
	gy3w==
X-Gm-Message-State: AHYfb5i3XPUs4mhbx1cj/U7qg+u3wyR28ZtNLX7WKtJs/7QnRnhyINoB
	ZQ2gyXr4lxLUHHGY
X-Received: by 10.223.139.193 with SMTP id w1mr1722604wra.206.1503152824909;
	Sat, 19 Aug 2017 07:27:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o20sm6487864wro.45.2017.08.19.07.27.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 07:27:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 16:28:43 +0200
Message-Id: <20170819142843.4722-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-qt5][PATCHv2] qtbase: disable gold to work around binutils bug
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
X-List-Received-Date: Sat, 19 Aug 2017 14:27:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 8cd23a0..804a604 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -41,6 +41,27 @@ SRC_URI += "\
 # for syncqt
 RDEPENDS_${PN}-tools += "perl"
 
+# workaround for gold bug:
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=842304
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21712
+# it's triggered only in combination of gold and security_flags.inc,
+# because security_flags.inc now enable pie by default.
+# Adding -no-pie or changing -fuse-ld=gold to -fuse-ld=bfd
+# works around this issue, will use -fuse-ld=bfd as it's considered
+# binutils bug.
+# OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/tests/auto/corelib/kernel/qmetatype $ i586-oe-linux-g++  -m32 -march=i586 --sysroot=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot -Wl,-O1 -fuse-ld=gold -Wl,--enable-new-dtags -o tst_qmetatype .obj/tst_qmetatype.o   -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/lib -lQt5Test -lQt5Core -lpthread
+# .obj/tst_qmetatype.o(.qtversion+0x0): error: unexpected reloc 3 against global symbol qt_version_tag without base register in object file when generating a position-independent output file
+# collect2: error: ld returned 1 exit status
+#
+# with -no-pie:
+# OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/tests/auto/corelib/kernel/qmetatype $ i586-oe-linux-g++ -no-pie -m32 -march=i586 --sysroot=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot -Wl,-O1 -fuse-ld=gold -Wl,--enable-new-dtags -o tst_qmetatype .obj/tst_qmetatype.o   -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/lib -lQt5Test -lQt5Core -lpthread
+#
+# with -fuse-ld=gold replaced with -fuse-ld=bfd:
+# OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/tests/auto/corelib/kernel/qmetatype $ i586-oe-linux-g++  -m32 -march=i586 --sysroot=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot -Wl,-O1 -fuse-ld=bfd -Wl,--enable-new-dtags -o tst_qmetatype .obj/tst_qmetatype.o   -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/lib -lQt5Test -lQt5Core -lpthread
+#
+# http://errors.yoctoproject.org/Errors/Details/150329/
+QT_CONFIG_FLAGS_GOLD_x86 = "-no-use-gold-linker"
+
 # separate some parts of PACKAGECONFIG which are often changed
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
@@ -129,8 +150,9 @@ PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
 PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
 
+QT_CONFIG_FLAGS_GOLD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
 QT_CONFIG_FLAGS += " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)} \
+    ${QT_CONFIG_FLAGS_GOLD} \
     -shared \
     -silent \
     -no-pch \
-- 
2.14.0


