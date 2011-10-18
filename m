Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGAT2-00069x-8E
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:16:33 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so923474bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QP5ryQXG5d2yZYmoOWhfU5SEdXjaVwkV6R12NVcWrKI=;
	b=NlNirtQUjBflvvznV5onaXGWYmYUbME0L1bHNosNYUov79HRgXc8PMgt/PudaINBWk
	T0TzeK8Ucr8DuJ47S6kNPMGxrRxMktDIhiP0wiEgUO1tEAjeJIXebuNiUpHI6LbtTAga
	SkEm7nseC097lfMwqCIRjdW/MWkOVmsX+v40A=
Received: by 10.204.140.73 with SMTP id h9mr1922593bku.30.1318947044560;
	Tue, 18 Oct 2011 07:10:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm2313775bkv.3.2011.10.18.07.10.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 07:10:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 16:10:26 +0200
Message-Id: <2f837d52d3956e83389842b0e06b1f02ff5c8a77.1318946821.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318946821.git.Martin.Jansa@gmail.com>
References: <cover.1318946821.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 2/3] webkit-efl: upgrade to 1.6.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 14:16:33 -0000

* revert.r78057.patch is not needed, because context menus were removed from eve in r59455
* we still need to force ARM mode, only the segfault is different:
| /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-efl-1.6.1+svnr97672-r0/src/Source/JavaScriptCore/heap/HandleTypes.h: In static member function 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T = JSC::Structure, JSC::HandleTypes<T>::ExternalType = JSC::Structure*, JSC::HandleSlot = JSC::JSValue*]':
| /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-efl-1.6.1+svnr97672-r0/src/Source/JavaScriptCore/heap/Handle.h:126:79:   instantiated from 'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T = JSC::Structure, JSC::Handle<T>::ExternalType = JSC::Structure*]'
| /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-efl-1.6.1+svnr97672-r0/src/Source/JavaScriptCore/runtime/ScopeChain.h:39:75:   instantiated from here
| /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-efl-1.6.1+svnr97672-r0/src/Source/JavaScriptCore/heap/HandleTypes.h:38:130: warning: cast from 'JSC::JSCell*' to 'JSC::HandleTypes<JSC::Structure>::ExternalType {aka JSC::Structure*}' increases required alignment of target type [-Wcast-align]
| {standard input}: Assembler messages:
| {standard input}:1116: Error: invalid immediate: 983040 is out of range
| {standard input}:1116: Error: value of 983040 too large for field of 2 bytes at 28
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.2/as: BFD (GNU Binutils) 2.21.1 assertion fail /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/binutils-cross-2.21.1a-r0/binutils-2.21.1/bfd/elf.c:2819
| arm-oe-linux-gnueabi-g++: internal compiler error: Segmentation fault (program as)
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[2]: *** [JavaScriptCore/CMakeFiles/javascriptcore_efl.dir/jit/JIT.cpp.o] Error 4
| make[2]: *** Waiting for unfinished jobs....
| {standard input}: Assembler messages:
| {standard input}:2059: Error: invalid immediate: 983040 is out of range
| {standard input}:2059: Error: value of 983040 too large for field of 2 bytes at 28
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.2/as: BFD (GNU Binutils) 2.21.1 assertion fail /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/binutils-cross-2.21.1a-r0/binutils-2.21.1/bfd/elf.c:2819
| arm-oe-linux-gnueabi-g++: internal compiler error: Segmentation fault (program as)
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[2]: *** [JavaScriptCore/CMakeFiles/javascriptcore_efl.dir/jit/JITOpcodes32_64.cpp.o] Error 4
| make[2]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-efl-1.6.1+svnr97672-r0/src/Source'
| make[1]: *** [JavaScriptCore/CMakeFiles/javascriptcore_efl.dir/all] Error 2
| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-efl-1.6.1+svnr97672-r0/src/Source'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../webkit/webkit-efl/revert.r78057.patch          |   19 -------------------
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   11 ++---------
 2 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch b/meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
deleted file mode 100644
index 966a977..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-see https://bugs.webkit.org/show_bug.cgi?id=50762
-fixed by:
-http://trac.webkit.org/changeset/78047/trunk/Source/WebCore/CMakeLists.txt
-fix reverted by:
-http://trac.webkit.org/changeset/78057/trunk/Source/WebCore/CMakeLists.txt
-
-so revert revert as we care about webkit-efl and don't care about WinCE
-
-Index: Source/WebCore/CMakeLists.txt
-===================================================================
---- Source/WebCore/CMakeLists.txt	(revision 78042)
-+++ Source/WebCore/CMakeLists.txt	(revision 78047)
-@@ -1157,6 +1157,4 @@
- 
-     platform/Arena.cpp
--    platform/ContextMenu.cpp
--    platform/ContextMenuItem.cpp
-     platform/ContentType.cpp
-     platform/CrossThreadCopier.cpp
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index bffded7..9f02a59 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -9,27 +9,20 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
            libxml2 pango eina ecore evas edje"
 
-SRCREV = "79192"
-PV = "1.3.11+svnr${SRCPV}"
+SRCREV = "97724"
+PV = "1.6.1+svnr${SRCPV}"
 
 SRCREV_FORMAT = "source"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;proto=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
-  file://revert.r78057.patch \
  "
 
 S = "${WORKDIR}/src/Source"
 
 inherit cmake lib_package pkgconfig perlnative
 
-# Wants to jump too far for THUMB on armv4t
-# in WebCore::DocTypeStringsHash::doctype_hash_function(char const*, unsigned int)':
-# DocTypeStrings.cpp:(.text._ZN7WebCore18DocTypeStringsHash21doctype_hash_functionEPKcj[WebCore::DocTypeStringsHash::doctype_hash_function(char const*, unsigned int)]+0x12): relocation truncated to fit: R_ARM_THM_CALL against symbol `__gnu_thumb1_case_uhi' defined in .text section in x86_64-linux/usr/armv4t/lib/gcc/arm-oe-linux-gnueabi/4.5.2/libgcc.a(_thumb1_case_uhi.o)
-# the same in WebCore::CSSValueKeywordsHash::value_hash_function(char const*, unsigned int)':
-#             WebCore::CSSPropertyNamesHash::propery_hash_function(char const*, unsigned int)':
-#             WebCore::ColorDataHash::colordata_hash_function(char const*, unsigned int)':
 ARM_INSTRUCTION_SET = "arm"
 
 EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=ON"
-- 
1.7.7



