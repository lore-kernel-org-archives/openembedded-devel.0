Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PRqTU-00046O-F5
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 19:16:47 +0100
Received: by bwz12 with SMTP id 12so5796837bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 10:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=EcdgDEa7KmvMb5YwskVFo9O3fxJ8GcwlltsZ+gMh2fw=;
	b=WOvtLA/2Yeq48RHIM9ZJ1ugRkjC8FJQBh6fJNDPaMvsnJ8bBliEVJmIrtRW95nDA5N
	5e1x3ABYSjgyfri3SnFLCwwiaYg4qdmk/2S4P5fttbrFERw1jq1i6tBHiryIl6FFIQhd
	Cd+x6Dw/3ztKlcR6gar28Au8wTiHVsnVTQAp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vSfYDovo+o4sBWA3pJztQ02zW63RvelVN+mkElO9yrk0YD/gaM617MMvSZ21hucTdS
	P/2PksN7eWV8d8fQJjeGpMeYg5mQZaMugO5oiSdC0URTGI0Pza4iZkIpH74nmmQYINM7
	GjfR9OKthDsY5C/WEWT2EqwWj5qZNUcEVHFqM=
Received: by 10.204.59.140 with SMTP id l12mr2876511bkh.2.1292177709008;
	Sun, 12 Dec 2010 10:15:09 -0800 (PST)
Received: from localhost.localdomain ([46.128.240.207])
	by mx.google.com with ESMTPS id v25sm2636396bkt.18.2010.12.12.10.15.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 12 Dec 2010 10:15:07 -0800 (PST)
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Dec 2010 19:15:01 +0100
Message-Id: <1292177701-21014-1-git-send-email-lazy.gopher@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] icee: New program ZeroC IceE
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
X-List-Received-Date: Sun, 12 Dec 2010 18:16:47 -0000

* added version of 1.3.0 of libicee
* added slice2cppe with both native and target version
* fixed multipe issues with makefiles
* implemented package split mostly as in debian

Signed-off-by: Maksym Parkachov <lazy.gopher@gmail.com>
---
 recipes/zeroc/icee.inc                            |   17 ++
 recipes/zeroc/libicee-1.3.0/include-time.patch    |   45 +++++
 recipes/zeroc/libicee-1.3.0/makefiles.patch       |  136 ++++++++++++++
 recipes/zeroc/libicee_1.3.0.bb                    |   26 +++
 recipes/zeroc/slice2cppe-1.3.0/architecture.patch |   14 ++
 recipes/zeroc/slice2cppe-1.3.0/makefiles.patch    |  204 +++++++++++++++++++++
 recipes/zeroc/slice2cppe_1.3.0.bb                 |   16 ++
 7 files changed, 458 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zeroc/icee.inc
 create mode 100644 recipes/zeroc/libicee-1.3.0/include-time.patch
 create mode 100644 recipes/zeroc/libicee-1.3.0/makefiles.patch
 create mode 100644 recipes/zeroc/libicee_1.3.0.bb
 create mode 100644 recipes/zeroc/slice2cppe-1.3.0/architecture.patch
 create mode 100644 recipes/zeroc/slice2cppe-1.3.0/makefiles.patch
 create mode 100644 recipes/zeroc/slice2cppe_1.3.0.bb

diff --git a/recipes/zeroc/icee.inc b/recipes/zeroc/icee.inc
new file mode 100644
index 0000000..779e900
--- /dev/null
+++ b/recipes/zeroc/icee.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "ZeroC Internet Comminication Engine (ICE) embedded"
+HOMEPAGE = "http://www.zeroc.com/icee/index.html"
+LICENSE = "GPLv2"
+SECTION = "libs"
+PR = "r0"
+
+S = "${WORKDIR}/IceE-${PV}"
+
+do_removebinary () {
+	rm -rf ${S}/cpp/bin/slice2cppe
+}
+addtask removebinary before do_patch after do_unpack
+
+do_install () {
+	oe_runmake prefix=${D}${prefix} install
+}
+NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/zeroc/libicee-1.3.0/include-time.patch b/recipes/zeroc/libicee-1.3.0/include-time.patch
new file mode 100644
index 0000000..12e4a82
--- /dev/null
+++ b/recipes/zeroc/libicee-1.3.0/include-time.patch
@@ -0,0 +1,45 @@
+Index: IceE-1.3.0/cppe/src/IceE/Cond.cpp
+===================================================================
+--- IceE-1.3.0.orig/cppe/src/IceE/Cond.cpp	2010-05-13 14:59:18.512636959 +0200
++++ IceE-1.3.0/cppe/src/IceE/Cond.cpp	2010-05-13 14:59:42.528636875 +0200
+@@ -7,12 +7,12 @@
+ //
+ // **********************************************************************
+ 
+-#include <IceE/Cond.h>
+-
+ #ifndef _WIN32
+ #    include <sys/time.h>
+ #endif
+ 
++#include <IceE/Cond.h>
++
+ #ifdef _WIN32
+ 
+ IceUtilInternal::Semaphore::Semaphore(long initial)
+Index: IceE-1.3.0/cppe/src/IceE/Time.cpp
+===================================================================
+--- IceE-1.3.0.orig/cppe/src/IceE/Time.cpp	2010-05-13 14:59:18.564634684 +0200
++++ IceE-1.3.0/cppe/src/IceE/Time.cpp	2010-05-13 15:00:03.580637302 +0200
+@@ -7,10 +7,6 @@
+ //
+ // **********************************************************************
+ 
+-#include <IceE/DisableWarnings.h>
+-#include <IceE/Time.h>
+-#include <IceE/LocalException.h>
+-
+ #ifndef _WIN32_WCE
+ #   if defined(_WIN32)
+ #       include <sys/timeb.h>
+@@ -20,6 +16,10 @@
+ #   endif
+ #endif
+ 
++#include <IceE/DisableWarnings.h>
++#include <IceE/Time.h>
++#include <IceE/LocalException.h>
++
+ using namespace IceUtil;
+ 
+ #ifdef _WIN32
diff --git a/recipes/zeroc/libicee-1.3.0/makefiles.patch b/recipes/zeroc/libicee-1.3.0/makefiles.patch
new file mode 100644
index 0000000..86163bf
--- /dev/null
+++ b/recipes/zeroc/libicee-1.3.0/makefiles.patch
@@ -0,0 +1,136 @@
+Index: IceE-1.3.0/cppe/Makefile
+===================================================================
+--- IceE-1.3.0.orig/cppe/Makefile	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/cppe/Makefile	2010-05-16 13:33:43.895123175 +0200
+@@ -11,11 +11,11 @@
+ 
+ include $(top_srcdir)/config/Make.rules
+ 
+-SUBDIRS		= src include test demo
++SUBDIRS		= src include
+ 
+-INSTALL_SUBDIRS = $(install_bindir) $(install_libdir) $(install_includedir)
++INSTALL_SUBDIRS = $(install_libdir) $(install_includedir)
+ 
+-install:: install-common
++install::
+ 	@for subdir in $(INSTALL_SUBDIRS); \
+ 	do \
+ 	    if test ! -d $$subdir ; \
+@@ -25,7 +25,6 @@
+ 	        chmod a+rx $$subdir ; \
+ 	    fi ; \
+ 	done
+-	$(call installprogram,$(ice_cpp_dir)/bin/slice2cppe,$(install_bindir))
+ 
+ $(EVERYTHING)::
+ 	@if [ ! -f include/IceE/Features.h ]; \
+Index: IceE-1.3.0/cppe/config/Make.rules
+===================================================================
+--- IceE-1.3.0.orig/cppe/config/Make.rules	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/cppe/config/Make.rules	2010-05-16 16:57:47.932386411 +0200
+@@ -12,7 +12,7 @@
+ # if it does not exist.
+ #
+ 
+-prefix			= /opt/IceE-$(VERSION)
++#prefix			= /usr
+ 
+ #
+ # Define OPTIMIZE_SIZE as yes if you want to build with minimal size.
+@@ -21,8 +21,8 @@
+ # If neither is set, IceE is built with debug information.
+ #
+ 
+-#OPTIMIZE_SIZE		= yes
+-#OPTIMIZE_SPEED		= yes
++OPTIMIZE_SIZE		= yes
++OPTIMIZE_SPEED		= yes
+ 
+ #
+ # Define STATICLIBS as yes if you want to build with static libraries.
+@@ -41,7 +41,7 @@
+ # Define LP64 as yes or no if you want force a 32 or 64 bit. The default
+ # is platform-dependent
+ #
+-#LP64			:= yes
++LP64			:= no
+ 
+ # ----------------------------------------------------------------------
+ # Ice-E supports a number of optional features that are enabled via
+@@ -162,15 +162,7 @@
+     BISONFLAGS		:= -dvt
+ endif
+ 
+-ifdef ice_src_dist
+-    ifeq ($(ice_cpp_dir), $(ice_dir)/cpp)
+-        SLICE2CPPE = $(ice_cpp_dir)/bin/slice2cppe
+-    else
+-        SLICE2CPPE = $(ice_cpp_dir)/$(binsubdir)/slice2cppe
+-    endif
+-else
+-    SLICE2CPPE = $(ice_dir)/$(binsubdir)/slice2cppe
+-endif
++SLICE2CPPE = slice2cppe
+ 
+ EVERYTHING		= all depend clean install
+ 
+Index: IceE-1.3.0/cppe/config/Make.rules.Linux
+===================================================================
+--- IceE-1.3.0.orig/cppe/config/Make.rules.Linux	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/cppe/config/Make.rules.Linux	2010-05-16 13:33:43.899121986 +0200
+@@ -29,14 +29,14 @@
+    AR			= ar
+ endif
+ 
+-ifeq ($(MACHINE),x86_64)
+-   #
+-   # Default build on x86_64 is 64-bit.
+-   #
+-   ifeq ($(LP64),)
+-      LP64      = yes
+-   endif
+-endif
++#ifeq ($(MACHINE),x86_64)
++#   #
++#   # Default build on x86_64 is 64-bit.
++#   #
++#   ifeq ($(LP64),)
++#      LP64      = yes
++#   endif
++#endif
+ 
+ ifeq ($(MACHINE),sparc64)
+    #
+@@ -56,20 +56,20 @@
+    CXXARCHFLAGS	= -mtune=v8 -pipe -Wno-deprecated -DICE_USE_MUTEX_SHARED
+ endif
+ 
+-ifeq ($(MACHINE),x86_64)
+-   ifeq ($(LP64),yes)
+-      CXXARCHFLAGS	= -m64
+-   else
+-      CXXARCHFLAGS	= -m32
+-   endif
+-   lp64suffix	= 64
+-endif
++#ifeq ($(MACHINE),x86_64)
++#   ifeq ($(LP64),yes)
++#      CXXARCHFLAGS	= -m64
++#   else
++#      CXXARCHFLAGS	= -m32
++#   endif
++#   lp64suffix	= 64
++#endif
+ 
+ CXXFLAGS		= $(CXXARCHFLAGS) -ftemplate-depth-128 -Wall -D_REENTRANT
+ 
+-ifneq ($(GUMSTIX),yes)
+-CXXFLAGS		+= -I/usr/include/nptl
+-endif
++#ifneq ($(GUMSTIX),yes)
++#CXXFLAGS		+= -I/usr/include/nptl
++#endif
+ 
+ ifneq ($(STATICLIBS),yes)
+    CXXFLAGS		+= -fPIC
diff --git a/recipes/zeroc/libicee_1.3.0.bb b/recipes/zeroc/libicee_1.3.0.bb
new file mode 100644
index 0000000..e55a123
--- /dev/null
+++ b/recipes/zeroc/libicee_1.3.0.bb
@@ -0,0 +1,26 @@
+require icee.inc
+
+SRC_URI="http://www.zeroc.com/download/IceE/1.3/IceE-${PV}-linux.tar.gz \
+file://include-time.patch \
+file://makefiles.patch \
+"
+SRC_URI[md5sum] = "61768fcaf4664a758e129de8689add8e"
+SRC_URI[sha256sum] = "5dd6d608782fe5afce18a571f275535b3e1d70663a6d358f908ca178bf7cd356"
+
+DEPENDS = "slice2cppe-native"
+
+inherit lib_package
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure () {
+	oe_runmake configure
+}
+
+do_install_append() {
+	install -d ${D}/${datadir}/slice/IceE
+	install -m 0644 slice/IceE/*.ice ${D}/${datadir}/slice/IceE
+}
+
+PACKAGES =+ "icee-slice"
+FILES_icee-slice = "${datadir}/slice"
diff --git a/recipes/zeroc/slice2cppe-1.3.0/architecture.patch b/recipes/zeroc/slice2cppe-1.3.0/architecture.patch
new file mode 100644
index 0000000..9a64461
--- /dev/null
+++ b/recipes/zeroc/slice2cppe-1.3.0/architecture.patch
@@ -0,0 +1,14 @@
+Index: IceE-1.3.0/cpp/include/IceUtil/Config.h
+===================================================================
+--- IceE-1.3.0.orig/cpp/include/IceUtil/Config.h	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/cpp/include/IceUtil/Config.h	2010-12-12 17:11:14.756301002 +0100
+@@ -18,7 +18,8 @@
+ //
+ #if defined(__i386)     || defined(_M_IX86) || defined(__x86_64)  || \
+     defined(_M_X64)     || defined(_M_IA64) || defined(__alpha__) || \
+-    defined(__MIPSEL__)
++    defined (_M_ARM) || defined(__MIPSEL__) || defined (__ARMEL__) || \
++    defined (__BFIN__)
+ #   define ICE_LITTLE_ENDIAN
+ #elif defined(__sparc) || defined(__sparc__) || defined(__hppa)      || \
+       defined(__ppc__) || defined(__powerpc) || defined(_ARCH_COM) || \
diff --git a/recipes/zeroc/slice2cppe-1.3.0/makefiles.patch b/recipes/zeroc/slice2cppe-1.3.0/makefiles.patch
new file mode 100644
index 0000000..daf4f56
--- /dev/null
+++ b/recipes/zeroc/slice2cppe-1.3.0/makefiles.patch
@@ -0,0 +1,204 @@
+Index: IceE-1.3.0/cpp/Makefile
+===================================================================
+--- IceE-1.3.0.orig/cpp/Makefile	2008-12-18 09:17:41.000000000 +0100
++++ IceE-1.3.0/cpp/Makefile	2010-12-12 16:57:57.669172001 +0100
+@@ -13,9 +13,9 @@
+ 
+ SUBDIRS = src
+ 
+-INSTALL_SUBDIRS = $(install_bindir) $(install_libdir)
++INSTALL_SUBDIRS = $(install_bindir)
+ 
+-install:: install-common
++install::
+ 	@for subdir in $(INSTALL_SUBDIRS); \
+ 	do \
+ 	    if test ! -d $$subdir ; \
+Index: IceE-1.3.0/cpp/config/Make.rules
+===================================================================
+--- IceE-1.3.0.orig/cpp/config/Make.rules	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/cpp/config/Make.rules	2010-12-12 17:31:58.265369002 +0100
+@@ -54,8 +54,8 @@
+ MCPP_LIBS              = $(if $(MCPP_HOME),-L$(MCPP_HOME)/$(libsubdir)) -lmcpp
+ MCPP_RPATH_LINK        = $(if $(MCPP_HOME),$(call rpathlink,$(MCPP_HOME)/$(libsubdir)))
+ 
+-CPPFLAGS		= -I$(includedir)
+-LDFLAGS			= $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir) 
++CPPFLAGS		+= -I$(includedir)
++LDFLAGS			+= $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir)
+ 
+ ifeq ($(FLEX_NOLINE),yes)
+     FLEXFLAGS	       := -L
+Index: IceE-1.3.0/cpp/config/Make.rules.Linux
+===================================================================
+--- IceE-1.3.0.orig/cpp/config/Make.rules.Linux	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/cpp/config/Make.rules.Linux	2010-12-12 18:09:38.858531002 +0100
+@@ -25,21 +25,55 @@
+    CXX			= c++
+ endif
+ 
++# Allow ar to be properly detected
++ifeq ($(AR),)
++   AR = ar
++endif
++
+ #
+ # icecpp is built with a C compiler
+ #
+-CFLAGS = -O2
++CFLAGS += -O2
++
++#ifeq ($(MACHINE),x86_64)
++#   ifeq ($(LP64),yes)
++#      CFLAGS	+= -m64
++#   else
++#      CFLAGS	+= -m32
++#   endif
++#endif
+ 
+-ifeq ($(MACHINE),x86_64)
+-   ifeq ($(LP64),yes)
+-      CFLAGS	+= -m64
++ifeq ($(CXX),icpc)
++   $(warning ===================================================================) 
++   $(warning Intel C++ is currently not supported. The Ice team does not)
++   $(warning maintain Intel C++ specific portions of the source code or build)
++   $(warning system.  Contact sales@zeroc.com if you wish to sponsor official)
++   $(warning support.)
++   $(warning ===================================================================) 
++   CXXFLAGS		= -D_REENTRANT    
++
++   ifneq ($(GENPIC),no)
++      CXXFLAGS		+= -fPIC
++   endif
++
++   ifeq ($(OPTIMIZE),yes)
++      CXXFLAGS		+= -O2 -DNDEBUG
+    else
+-      CFLAGS	+= -m32
++      CXXFLAGS		+= -g
+    endif
+-endif
+ 
+-ifeq ($(CXX),c++)
++   #
++   # C++ run-time libraries, necessary for linking some shared libraries.
++   #
++   CXXLIBS		=
++
++   mkshlib		= $(CXX) -shared $(LDFLAGS) -o $(1) -Wl,-h,$(2) $(3) $(4) -lpthread -lrt
++
++   mklib		= $(AR) cr $(1) $(2)
++
++   rpathlink            = -Wl,-rpath-link,$(1) 
+ 
++else
+    ifeq ($(MACHINE),sparc64)
+       #
+       # We are an ultra, at least, and so have the atomic instructions
+@@ -70,15 +104,17 @@
+       CXXARCHFLAGS	= -mtune=v8 -pipe -Wno-deprecated -DICE_USE_MUTEX_SHARED
+    endif
+ 
+-   ifeq ($(MACHINE),x86_64)
+-      ifeq ($(LP64),yes)
+-         CXXARCHFLAGS	+= -m64
+-      else
+-         CXXARCHFLAGS	+= -m32
+-      endif
+-   endif
++   #ifeq ($(MACHINE),x86_64)
++   #   ifeq ($(LP64),yes)
++   #      CXXARCHFLAGS	+= -m64
++   #   else
++   #      CXXARCHFLAGS	+= -m32
++   #   endif
++   #endif
+ 
+-   CXXFLAGS		= $(CXXARCHFLAGS) -ftemplate-depth-128 -Wall -D_REENTRANT -I/usr/include/nptl
++
++   #CXXFLAGS		= $(CXXARCHFLAGS) -ftemplate-depth-128 -Wall -D_REENTRANT -I/usr/include/nptl
++   CXXFLAGS		+= $(CXXARCHFLAGS) -ftemplate-depth-128 -Wall -D_REENTRANT
+ 
+    ifneq ($(GENPIC),no)
+       CXXFLAGS		+= -fPIC
+@@ -106,57 +142,26 @@
+    #
+    # C++ run-time libraries, necessary for linking some shared libraries.
+    #
+-   CXXLIBS		=
++   #CXXLIBS		=
+ 
+    mkshlib		= $(CXX) -shared $(LDFLAGS) -o $(1) -Wl,-h,$(2) $(3) $(4) -lpthread -lrt
+ 
+-   mklib		= ar cr $(1) $(2)
++   mklib		= $(AR) cr $(1) $(2)
+ 
+    rpathlink            = -Wl,-rpath-link,$(1) 
+ 
+-   ifneq ($(embedded_runpath_prefix),)
+-      LDPLATFORMFLAGS      = -Wl,--enable-new-dtags -Wl,-rpath,$(runpath_libdir)
+-   else
+-      LDPLATFORMFLAGS      = -Wl,--enable-new-dtags
+-   endif
++   #ifneq ($(embedded_runpath_prefix),)
++   #   LDPLATFORMFLAGS      = -Wl,--enable-new-dtags -Wl,-rpath,$(runpath_libdir)
++   #else
++   #   LDPLATFORMFLAGS      = -Wl,--enable-new-dtags
++   #endif
+ 
+ endif
+ 
+-ifeq ($(CXX),icpc)
+-   $(warning ===================================================================) 
+-   $(warning Intel C++ is currently not supported. The Ice team does not)
+-   $(warning maintain Intel C++ specific portions of the source code or build)
+-   $(warning system.  Contact sales@zeroc.com if you wish to sponsor official)
+-   $(warning support.)
+-   $(warning ===================================================================) 
+-   CXXFLAGS		= -D_REENTRANT    
+-
+-   ifneq ($(GENPIC),no)
+-      CXXFLAGS		+= -fPIC
+-   endif
+-
+-   ifeq ($(OPTIMIZE),yes)
+-      CXXFLAGS		+= -O2 -DNDEBUG
+-   else
+-      CXXFLAGS		+= -g
+-   endif
+-
+-   #
+-   # C++ run-time libraries, necessary for linking some shared libraries.
+-   #
+-   CXXLIBS		=
+-
+-   mkshlib		= $(CXX) -shared $(LDFLAGS) -o $(1) -Wl,-h,$(2) $(3) $(4) -lpthread -lrt
+-
+-   mklib		= ar cr $(1) $(2)
+-
+-   rpathlink            = -Wl,-rpath-link,$(1) 
+-
+-endif
+ 
+-NPTL_LIB		= /usr/$(libsubdir)/nptl
++#NPTL_LIB		= /usr/$(libsubdir)/nptl
+ 
+-BASELIBS		= -lIceUtil -L$(NPTL_LIB) -lpthread -lrt
++BASELIBS		= -lIceUtil -lpthread -lrt
+ LIBS			= $(BZIP2_RPATH_LINK) -lIce $(BASELIBS)
+ 
+ ICEUTIL_OS_LIBS         = 
+Index: IceE-1.3.0/Makefile
+===================================================================
+--- IceE-1.3.0.orig/Makefile	2008-12-18 09:17:40.000000000 +0100
++++ IceE-1.3.0/Makefile	2010-12-12 16:57:57.669172001 +0100
+@@ -7,7 +7,7 @@
+ #
+ # **********************************************************************
+ 
+-SUBDIRS			= cppe 
++SUBDIRS			= cpp
+ 
+ all::
+ 	@for subdir in $(SUBDIRS); \
diff --git a/recipes/zeroc/slice2cppe_1.3.0.bb b/recipes/zeroc/slice2cppe_1.3.0.bb
new file mode 100644
index 0000000..0cfe49b
--- /dev/null
+++ b/recipes/zeroc/slice2cppe_1.3.0.bb
@@ -0,0 +1,16 @@
+require icee.inc
+
+SRC_URI="http://www.zeroc.com/download/IceE/1.3/IceE-${PV}-linux.tar.gz \
+file://makefiles.patch \
+file://architecture.patch \
+"
+SRC_URI[md5sum] = "61768fcaf4664a758e129de8689add8e"
+SRC_URI[sha256sum] = "5dd6d608782fe5afce18a571f275535b3e1d70663a6d358f908ca178bf7cd356"
+
+BBCLASSEXTEND = "native"
+
+DEPENDS="mcpp bzip2"
+
+do_configure () {
+	:
+}
-- 
1.7.2.3



