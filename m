Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E459A65C85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 06:22:34 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so36005750ieb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NBePYJDuVQtqR+SZmdWoOAz0RqYlCXjuLCTLdKyKGnw=;
	b=aOvxcrqUe6gnnMLrAv1qf/sc38oCbS1not2ocf8RPlfuG8EKh/1zYU84B6zROktq8/
	PV00SfWUnS52emmebK9jsRNpeudruyfHtJ4JNstYgXBF6y2tIlI5iyvr3yOoFqaNeSY9
	S/zNC8HJyTK34gSz6PSGW8W8wtknoI9toPakhihQ7fezhmsHDZ2RqQaHmm/qa3Yz8CEc
	bEFgbN5n24NSMvBsu7d0j3p7JD2KW2tIW9Ov3K92HjjjPXv9r+XYwZOq9RqSbgti3KC/
	llS7GOr/N2q4/4bBylvtEgp5o/ULpYLcEI+YqOYDA3XjmG/e2wBMI5SE2xf/ywbjkCmQ
	anug==
X-Received: by 10.50.129.3 with SMTP id ns3mr1257810igb.1.1424240555830;
	Tue, 17 Feb 2015 22:22:35 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id j6sm11503590igv.4.2015.02.17.22.22.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Feb 2015 22:22:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 22:22:12 -0800
Message-Id: <1424240532-13118-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtwebkit: fix textrel QA warnings when building qtwebkit for x86
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Feb 2015 06:22:35 -0000

  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]

Patch from upstream webkit:

  https://bugs.webkit.org/show_bug.cgi?id=70610

Minor refresh required to apply cleanly to the older webkit sources used
by qtwebkit. Specifically, the patch needed to be modified to account
for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc                        |  7 ++-
 .../qtwebkit/0002-qtwebkit-fix-textrel-x86.patch   | 68 ++++++++++++++++++++++
 2 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index bdc676b..d9eaabb 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -8,6 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
 
 DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveldb"
 
+SRC_URI += "\
+    file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
+    file://0002-qtwebkit-fix-textrel-x86.patch \
+"
+
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors"
 PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
@@ -39,8 +44,6 @@ EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
 # remove default ${PN}-examples-dbg ${PN}-examples set in qt5.inc, because it conflicts with ${PN} from separate webkit-examples recipe
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
 
-SRC_URI += "file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch"
-
 # make sure rb files are used from sysroot, not from host
 # ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
 # we need to replace it too (a bit longer version without importing re)
diff --git a/recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch b/recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch
new file mode 100644
index 0000000..e5f1538
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch
@@ -0,0 +1,68 @@
+Fix textrel QA warnings when building qtwebkit for x86:
+
+  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
+
+Patch from upstream webkit:
+
+  https://bugs.webkit.org/show_bug.cgi?id=70610
+
+Minor refresh required to apply cleanly to the older webkit sources used
+by qtwebkit. Specifically, the patch needed to be modified to account
+for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
+part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
+
+Upstream status [webkit] : backport
+Upstream status [qtwebkit] : unclear
+
+
+From: Magnus Granberg <zorry@gentoo.org>
+Subject: Remove TEXTREL tag in x86
+Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
+Index: webkitgtk/Source/WTF/wtf/InlineASM.h
+===================================================================
+--- webkitgtk.orig/Source/WTF/wtf/InlineASM.h
++++ webkitgtk/Source/WTF/wtf/InlineASM.h
+@@ -46,6 +46,8 @@
+ #define GLOBAL_REFERENCE(name) #name "@plt"
+ #elif CPU(X86) && COMPILER(MINGW)
+ #define GLOBAL_REFERENCE(name) "@" #name "@4"
++#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
++#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
+ #else
+ #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
+ #endif
+Index: webkitgtk/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+===================================================================
+--- webkitgtk.orig/Source/JavaScriptCore/jit/ThunkGenerators.cpp
++++ webkitgtk/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+@@ -524,6 +524,30 @@ double jsRound(double d)
+     } \
+     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
+ 
++#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
++#define defineUnaryDoubleOpWrapper(function) \
++    asm( \
++        ".text\n" \
++        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
++        HIDE_SYMBOL(function##Thunk) "\n" \
++        SYMBOL_STRING(function##Thunk) ":" "\n" \
++        "pushl %ebx\n" \
++        "subl $20, %esp\n" \
++        "movsd %xmm0, (%esp) \n" \
++        "call __x86.get_pc_thunk.bx\n" \
++        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
++        "call " GLOBAL_REFERENCE(function) "\n" \
++        "fstpl (%esp) \n" \
++        "movsd (%esp), %xmm0 \n" \
++        "addl $20, %esp\n" \
++        "popl %ebx\n" \
++        "ret\n" \
++    );\
++    extern "C" { \
++        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
++    } \
++    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
++
+ #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
+ #define defineUnaryDoubleOpWrapper(function) \
+     asm( \
-- 
1.9.1


