Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6B899783AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 13:31:47 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 49so9042738wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9wjQxQk/rEVc+a6kAUW295SyCsx1zkm6GmItvLIhipc=;
	b=ZvM9n34PYoy0hui1lsG/dInZKvo8pg3EE4QXQ7ySuYLavnrDn2Ul0qLBUDCFN35tDf
	yQHWZlkHpdTiBg5qOQKGdbVn0XdgPJXle35DDwgOxaD8glRxEMDjcvtrkpQUVuw2+0ir
	xTnVuVwM7IqMiFgoqmt5JYzPz0VKRyQF3eSGlhCl6Z3Ou2WSEFKlte+T/v+Z9Eeb1OzW
	Yef70GUekQ6d2P1cGvyL3kY5gkQq+ELTdVvCO1Vlc4Bx1XVxP+wQNicHsYlgmuA0rg+V
	aXA7viPr9by0k4lFgnznqC9esZcDtYBEbHQLvgI1/DwB4qvUjT6SFpGSnU7T8QsLB2Xp
	4/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9wjQxQk/rEVc+a6kAUW295SyCsx1zkm6GmItvLIhipc=;
	b=WLK2INpkMWfLQftrEczY8fRgXl42F/Dsdf05CfE7NmORn91UyX3VcB3FRumY1eZ6Rh
	wGQDSPfSghOnIjQ/+Myo3RJ+HTp56Olfuq2lCPHiF/CZbBUjTgydr8iKWUlwR7GBNP95
	hsCiPldF2LShdL0iFWlk5KydljIWBNnZTqCKOhcniU1caE8WnFPLXHE7dvI1aH6blWFQ
	WOgjNWGjODiWgpbAyYSK415Txmo8fapXMF5+0wJbDdKDhKgZsJnQlL2jcs6W4c2TPKZ0
	URxXWDpukUQn31pHxMZiD0fmYXaz1QpngRvpIxgKXO2ssF/N7Fjg4XKWKXtuH+5bmVjl
	2R6A==
X-Gm-Message-State: AHYfb5hYveJvrUsgIN6uTKy6QWUiOUzRap7RWpTf+vX3ZBTJfr6cg9V7
	5/lpXKxC+qmvNvtZ
X-Received: by 10.223.188.16 with SMTP id s16mr8039854wrg.4.1503149507845;
	Sat, 19 Aug 2017 06:31:47 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r70sm4799095wmb.35.2017.08.19.06.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 06:31:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 15:33:26 +0200
Message-Id: <20170819133326.9663-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-qt5][PATCH] qtbase: disable gold to work around binutils bug
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
X-List-Received-Date: Sat, 19 Aug 2017 13:31:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 8cd23a0..ada8004 100644
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
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS_remove_x86 = "-fuse-ld=gold"
+
 # separate some parts of PACKAGECONFIG which are often changed
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-- 
2.14.0


