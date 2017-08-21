Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5673F78288
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:01:16 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k10so6878362wre.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6eNhqE97M4BYK2Ttjp7n3KpqGgCvjZukQzvBtKnbZv8=;
	b=brpLWwCsatMHV6RSRhqlQaUPbExqZioTzEuuooIq7WZPDrHw0wayzL0MQ8ARJizBt1
	KC3ZduMwoflHa8ovoUO/Go97vgfwY5DuE6pLR4DNJXBeEgjKGktUhrDaXiY3mH/idlWc
	AJBdqlm+xv0i5DxGxLsV9ozix+4dHdqXBZcJfYs8ZNc9tn5OEhemRElNcQhoo3yDsjGw
	1l8O/as6V2f2DdEuCamQLpZdxWksPccGZYbMLmyPEgCyNi2KoSFPYpH+Fbybj15F9h31
	UcsWIb1XqP4QkrUb6yzmH8/o/Eegdl9NSLt9wWZbCMGSfZD+bu/seHBNW2utiEj3TrCE
	7Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6eNhqE97M4BYK2Ttjp7n3KpqGgCvjZukQzvBtKnbZv8=;
	b=PBHUJn3D86cW8N710wvqTQG7UH/qUGCkcFIr8J478PYNuNylVhKo9/752UKXAc47ET
	AWHJuIepfaqNaH+fLCyOkzJuZR1LpsfY8Gn3Y+nUl8UEaj3/QTYhWsHpHcTiK/f3O/Cq
	8EVxkDKUrLFTCLbTQk7Pe+4EIt6Sncn/b0bWVO2e4kW+vpdo65hgCbg+OP6ajMVhfwoP
	skPhISW1/3a6ex6MRKfErbIZrgOXGAJgz/4QwNUadDIZFkVLdPuC1VIegBaPoPXU++9l
	jFUibbzFHqhwBP2qcua0eyLbzb2xrAF1SMs24kOu6ru3zdRBSNyHcq7dU9BTb/3pICNq
	rpVQ==
X-Gm-Message-State: AHYfb5jJFZiVKRfzbjN9MMMZqXyHfz6mfVlLSbJsgmacbMada5d25/7e
	nM8/mKAHVtIBTUyl
X-Received: by 10.28.19.68 with SMTP id 65mr6510054wmt.122.1503349277684;
	Mon, 21 Aug 2017 14:01:17 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a6sm238004wrh.51.2017.08.21.14.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 14:01:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 23:02:53 +0200
Message-Id: <20170821210259.20276-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-qt5][PATCHv2 1/7] qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qtwayland: disable gold to work around binutils bug
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
X-List-Received-Date: Mon, 21 Aug 2017 21:01:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb             | 25 ++++++++++++++++++++++++-
 recipes-qt/qt5/qtgraphicaleffects_git.bb |  4 ++++
 recipes-qt/qt5/qtlocation_git.bb         |  4 ++++
 recipes-qt/qt5/qtmultimedia_git.bb       |  4 ++++
 recipes-qt/qt5/qtscript_git.bb           |  4 ++++
 recipes-qt/qt5/qtwayland_git.bb          |  4 ++++
 6 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 8cd23a0..550968c 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -41,6 +41,28 @@ SRC_URI += "\
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
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
 # separate some parts of PACKAGECONFIG which are often changed
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
@@ -129,8 +151,9 @@ PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
 PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
 
+QT_CONFIG_FLAGS_GOLD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
 QT_CONFIG_FLAGS += " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)} \
+    ${QT_CONFIG_FLAGS_GOLD} \
     -shared \
     -silent \
     -no-pch \
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index f4b43e7..eadd4bc 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -20,3 +20,7 @@ DEPENDS += "qtdeclarative"
 RDEPENDS_${PN}-dev = ""
 
 SRCREV = "1583bb5569cfc50141d879107a46146d5ccccf28"
+
+# The same issue as in qtbase:
+# http://errors.yoctoproject.org/Errors/Build/44912/
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index f25d57e..ab96029 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -21,3 +21,7 @@ PACKAGECONFIG[gypsy] = "-feature-gypsy,-no-feature-gypsy,gconf gypsy"
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
 SRCREV = "41cc347040226d2c5c16b9df001d03f2724b87e5"
+
+# The same issue as in qtbase:
+# http://errors.yoctoproject.org/Errors/Details/152640/
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 7d3c3cc..aa79e3f 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -34,3 +34,7 @@ SRC_URI += "\
 "
 
 SRCREV = "544a8a4251ff9694780e563ddb6e4af1325e0115"
+
+# The same issue as in qtbase:
+# http://errors.yoctoproject.org/Errors/Build/44914/
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 3f8b64a..2875988 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -26,3 +26,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 DEPENDS += "qtbase"
 
 SRCREV = "c35df2ec0ee05351912e768d298a7c627dbdd1ef"
+
+# The same issue as in qtbase:
+# http://errors.yoctoproject.org/Errors/Build/44915/
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index bcddb32..ffe2208 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -50,3 +50,7 @@ SRC_URI += " \
 "
 
 BBCLASSEXTEND =+ "native nativesdk"
+
+# The same issue as in qtbase:
+# http://errors.yoctoproject.org/Errors/Details/152641/
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.14.1


