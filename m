Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (unknown [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 93FEE605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:22:41 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wk7yx-0004pW-L3 for openembedded-devel@lists.openembedded.org;
	Tue, 13 May 2014 10:22:39 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 10:22:39 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 10:22:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 13 May 2014 10:22:29 +0200
Message-ID: <lksko5$2ij$1@ger.gmane.org>
References: <1399897298-15929-1-git-send-email-philip@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1399897298-15929-1-git-send-email-philip@balister.org>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] zeroc-ice : Add recipe.
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
X-List-Received-Date: Tue, 13 May 2014 08:22:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Philip Balister schreef op 12-05-14 14:21:
> Oh the pain.
> 
> Tested for ARM. Can build GNU Radio and an sdk that builds GNU Radio.

MIssing Upstream-status in patches

> 
> Signed-off-by: Philip Balister <philip@balister.org> --- 
> .../0002-Modify-Makefile-for-cross-compile.patch   | 287
> +++++++++++++++++++++ .../zeroc-ice/zeroc-ice_3.5.1.bb
> |  75 ++++++ 2 files changed, 362 insertions(+) create mode 100644
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
>
> 
create mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> 
> diff --git
> a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
> b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
>
> 
new file mode 100644
> index 0000000..93fb5bf --- /dev/null +++
> b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
>
> 
@@ -0,0 +1,287 @@
> +From bc622ce74fa03a935278d21736a5a251466e1798 Mon Sep 17 00:00:00 2001 
> +From: Tom Rondeau <tom@trondeau.com> +Date: Wed, 16 Apr 2014 14:34:51
> -0400 +Subject: [PATCH] Modify Makefiles for cross compile + +--- +
> config/Make.common.rules           |   20 +++++++------ + cpp/Makefile
> |    9 +++--- + cpp/config/Make.rules              |   32
> ++++++++++++-------- + cpp/config/Make.rules.Linux        |   18
> ++--------- + cpp/src/IceStorm/FreezeDB/Makefile |    2 +- +
> py/config/Make.rules               |   58
> +++++++++++++++++++----------------- + 6 files changed, 70 insertions(+),
> 69 deletions(-) + +diff --git a/config/Make.common.rules
> b/config/Make.common.rules +index d7b1d59..a3fb17e 100644 +---
> a/config/Make.common.rules ++++ b/config/Make.common.rules +@@ -65,9
> +65,9 @@ ifeq ($(UNAME),Linux) +       # +       # Some Linux
> distributions like Debian/Ubuntu don't use /usr/lib64. +       # +-
> ifeq ($(shell test -d /usr/lib64 && echo 0),0) +-          lp64suffix	=
> 64 +-      endif ++      #ifeq ($(shell test -d /usr/lib64 && echo 0),0) 
> ++      #    lp64suffix	= 64 ++      #endif +       ifeq ($(LP64),) +
> LP64      	= yes +       endif +@@ -244,12 +244,13 @@ else +     slicedir
> = $(ice_dir)/slice + endif + +-ifeq ($(prefix), /usr) +-
> install_slicedir = /usr/share/Ice-$(VERSION)/slice +-else +-
> install_slicedir = $(prefix)/slice +-endif ++#ifeq ($(prefix), /usr) ++#
> install_slicedir = /usr/share/Ice-$(VERSION)/slice ++#else ++#
> install_slicedir = $(prefix)/slice ++#endif + ++install_slicedir =
> $(prefix)/slice + # + # Set environment variables for the Slice
> translator. + # +@@ -265,7 +266,8 @@ ifneq ($(ice_dir), /usr) +
> endif + +     ifeq ($(UNAME),Linux) +-        export LD_LIBRARY_PATH :=
> $(ice_lib_dir):$(LD_LIBRARY_PATH) ++        #export LD_LIBRARY_PATH :=
> $(ice_lib_dir):$(LD_LIBRARY_PATH) ++        export LD_LIBRARY_PATH :=
> $(ICE_HOME)/lib:$(LD_LIBRARY_PATH) +     endif + +     ifeq
> ($(UNAME),SunOS) +diff --git a/cpp/Makefile b/cpp/Makefile +index
> a68f113..1f44f57 100644 +--- a/cpp/Makefile ++++ b/cpp/Makefile +@@
> -11,11 +11,12 @@ top_srcdir	= . + + include
> $(top_srcdir)/config/Make.rules + +-SUBDIRS		= config src include test 
> ++#SUBDIRS		= config src include test ++SUBDIRS		= config src include + 
> +-ifeq ($(shell uname | grep MINGW),) +-SUBDIRS		:= $(SUBDIRS) demo 
> +-endif ++#ifeq ($(shell uname | grep MINGW),) ++#SUBDIRS		:= $(SUBDIRS)
> demo ++#endif + + INSTALL_SUBDIRS	= $(install_bindir) $(install_libdir)
> $(install_includedir) \ + 	$(install_configdir) $(install_mandir) +diff
> --git a/cpp/config/Make.rules b/cpp/config/Make.rules +index
> 37461ae..197c5e8 100644 +--- a/cpp/config/Make.rules ++++
> b/cpp/config/Make.rules +@@ -175,11 +175,12 @@ headerdir		=
> $(top_srcdir)/include + # includedir is not handled the same as bindir
> and libdir + # because it is used in the .depend files + # +-ifdef
> ice_src_dist +-    includedir		= $(top_srcdir)/include +-else +-
> includedir		= $(ice_dir)/include +-endif ++#ifdef ice_src_dist ++#
> includedir		= $(top_srcdir)/include ++#else ++#    includedir		=
> $(ice_dir)/include ++#endif ++includedir		= $(top_srcdir)/include + + # +
> # Platform specific definitions +@@ -277,14 +278,17 @@ ICECPPFLAGS		=
> -I$(slicedir) + SLICE2CPPFLAGS		= $(ICECPPFLAGS) + + ifeq ($(ice_dir),
> /usr) +-    LDFLAGS		= $(LDPLATFORMFLAGS) $(CXXFLAGS) ++    LDFLAGS		+=
> $(LDPLATFORMFLAGS) $(CXXFLAGS) + else +     CPPFLAGS	+= -I$(includedir) 
> +-    ifdef ice_src_dist +-	LDFLAGS	= $(LDPLATFORMFLAGS) $(CXXFLAGS)
> -L$(libdir) +-    else +-	LDFLAGS	= $(LDPLATFORMFLAGS) $(CXXFLAGS)
> -L$(ice_dir)/$(libsubdir)$(cpp11suffix) +-    endif ++# We must always
> build using the libraries in the source tree, the host's are obviously 
> ++# not what we want for the target ++    LDFLAGS	+= $(LDPLATFORMFLAGS)
> $(CXXFLAGS) -L$(libdir) $(call rpathlink,$(libdir)) ++#    ifdef
> ice_src_dist ++#        LDFLAGS	= $(LDPLATFORMFLAGS) $(CXXFLAGS)
> -L$(libdir) ++#    else ++#	LDFLAGS	= $(LDPLATFORMFLAGS) $(CXXFLAGS)
> -L$(ice_dir)/$(libsubdir)$(cpp11suffix) ++#    endif + endif + + ifeq
> ($(FLEX_NOLINE),yes) +@@ -313,8 +317,10 @@ endif + + ifdef ice_src_dist +
> SLICEPARSERLIB	= $(libdir)/$(call mklibfilename,Slice,$(VERSION)) +-
> SLICE2CPP		= $(bindir)/slice2cpp +-    SLICE2FREEZE	=
> $(bindir)/slice2freeze ++#    SLICE2CPP		= $(bindir)/slice2cpp ++#
> SLICE2FREEZE	= $(bindir)/slice2freeze ++    SLICE2CPP		=
> $(ICE_HOME)/bin/slice2cpp ++    SLICE2FREEZE	=
> $(ICE_HOME)/bin/slice2freeze + else +     SLICEPARSERLIB	=
> $(ice_dir)/$(libsubdir)$(cpp11suffix)/$(call
> mklibfilename,Slice,$(VERSION)) +     SLICE2CPP		=
> $(ice_dir)/$(binsubdir)$(cpp11suffix)/slice2cpp +diff --git
> a/cpp/config/Make.rules.Linux b/cpp/config/Make.rules.Linux +index
> 5d5717c..8363c6e 100644 +--- a/cpp/config/Make.rules.Linux ++++
> b/cpp/config/Make.rules.Linux +@@ -31,7 +31,7 @@ ifeq ($(CXX),c++) +
> CXX			= g++ + endif + +-ifeq ($(CXX),g++) ++#ifeq ($(CXX),g++) + +
> ifneq ($(SUSE_i586),) +         CXXARCHFLAGS	+= -march=i586 +@@ -71,14
> +71,6 @@ ifeq ($(CXX),g++) +       CXXARCHFLAGS	+= -mtune=v8 -pipe
> -Wno-deprecated -DICE_USE_MUTEX_SHARED +    endif + +-   ifeq
> ($(MACHINE),x86_64) +-      ifeq ($(LP64),yes) +-         CXXARCHFLAGS	+=
> -m64 +-      else +-         CXXARCHFLAGS	+= -m32 +-      endif +-
> endif +- +    CXXFLAGS		= $(CXXARCHFLAGS) -Wall -Werror -pthread + +
> ifneq ($(GENPIC),no) +@@ -102,15 +94,11 @@ ifeq ($(CXX),g++) + +
> rpathlink            = -Wl,-rpath-link,$(1) + +-   ifneq
> ($(embedded_runpath_prefix),) +-      LDPLATFORMFLAGS      =
> -Wl,--enable-new-dtags -Wl,-rpath,$(runpath_libdir) +-   else +-
> LDPLATFORMFLAGS      = -Wl,--enable-new-dtags +-   endif ++
> LDPLATFORMFLAGS      = -Wl,--enable-new-dtags -Wl,-rpath,../../../lib + +
> LDPLATFORMFLAGS	+= -rdynamic + +-endif ++#endif + + ifeq ($(CXX),icpc) +
> $(warning
> ===================================================================) 
> +diff --git a/cpp/src/IceStorm/FreezeDB/Makefile
> b/cpp/src/IceStorm/FreezeDB/Makefile +index 7c844b7..cf15cb1 100644 +---
> a/cpp/src/IceStorm/FreezeDB/Makefile ++++
> b/cpp/src/IceStorm/FreezeDB/Makefile +@@ -66,7 +66,7 @@
> $(libdir)/$(LIBNAME): $(libdir)/$(SONAME) + + $(MIGRATE): $(MOBJS) + 	rm
> -f $@ +-	$(CXX) $(LDFLAGS) -o $@ $(MOBJS) $(DB_RPATH_LINK)
> -lIceStormService -lIceStorm -lFreeze $(LIBS) ++	$(CXX) $(LDFLAGS) -o $@
> $(MOBJS) $(DB_RPATH_LINK) -lIceStormService -lIceStorm -lFreeze $(LIBS)
> -ldb_cxx + + # The slice2freeze rules are structured like this to avoid
> issues with + # parallel make. +diff --git a/py/config/Make.rules
> b/py/config/Make.rules +index 43ce01b..1349342 100644 +---
> a/py/config/Make.rules ++++ b/py/config/Make.rules +@@ -92,21 +92,23 @@
> ifeq ($(shell test -f $(top_srcdir)/config/Make.rules.$(UNAME) && echo
> 0),0) +     include $(top_srcdir)/config/Make.rules.$(UNAME) + else +
> include $(top_srcdir)/../cpp/config/Make.rules.$(UNAME) +-endif ++endif +
>  + libdir                  = $(top_srcdir)/python +-ifneq ($(prefix),
> /usr) +-install_pythondir       = $(prefix)/python +-install_libdir
> = $(prefix)/python +-else +-    ifeq ($(shell test -d
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist-packages && echo 0),0) +-
> install_pythondir       =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist-packages +-
> install_libdir          =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist-packages +-    else +-
> install_pythondir       =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/site-packages +-
> install_libdir          =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/site-packages +-    endif 
> +-endif ++#ifneq ($(prefix), /usr) ++#install_pythondir       =
> $(prefix)/python ++#install_libdir          = $(prefix)/python ++#else 
> ++#    ifeq ($(shell test -d
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist-packages && echo 0),0) ++#
> install_pythondir       =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist-packages ++#
> install_libdir          =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist-packages ++#    else ++#
> install_pythondir       =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/site-packages ++#
> install_libdir          =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/site-packages ++#    endif 
> ++#endif ++install_pythondir       =
> $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/site-packages ++install_libdir
> = $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/site-packages + + ifeq
> ($(UNAME),SunOS) +    ifeq ($(LP64),yes) +@@ -115,19 +117,21 @@ ifeq
> ($(UNAME),SunOS) +    endif + endif + +-ifdef ice_src_dist +-    ifeq
> ($(ice_cpp_dir), $(ice_dir)/cpp) +-        ICE_LIB_DIR =
> -L$(ice_cpp_dir)/lib +-    else +-        ICE_LIB_DIR =
> -L$(ice_cpp_dir)/$(libsubdir) +-    endif +-    ICE_LIB_DIR =
> -L$(ice_cpp_dir)/lib +-    ICE_FLAGS 	= -I$(ice_cpp_dir)/include +-endif 
> +-ifdef ice_bin_dist +-    ICE_LIB_DIR = -L$(ice_dir)/$(libsubdir) +-
> ICE_FLAGS	= -I$(ice_dir)/include +-endif ++#ifdef ice_src_dist ++#
> ifeq ($(ice_cpp_dir), $(ice_dir)/cpp) ++#        ICE_LIB_DIR =
> -L$(ice_cpp_dir)/lib ++#    else ++#        ICE_LIB_DIR =
> -L$(ice_cpp_dir)/$(libsubdir) ++#    endif ++#    ICE_LIB_DIR =
> -L$(ice_cpp_dir)/lib ++#    ICE_FLAGS 	= -I$(ice_cpp_dir)/include 
> ++#endif ++#ifdef ice_bin_dist ++#    ICE_LIB_DIR =
> -L$(ice_dir)/$(libsubdir) ++#    ICE_FLAGS	= -I$(ice_dir)/include 
> ++#endif ++ICE_LIB_DIR = -L$(top_srcdir)/../cpp/lib ++ICE_FLAGS =
> -I$(ice_cpp_dir)/include + ICE_LIBS = $(ICE_LIB_DIR) -lIce -lSlice
> -lIceUtil + + ifneq ($(embedded_runpath_prefix),) +@@ -137,7 +141,7 @@
> endif + CPPFLAGS		= + ICECPPFLAGS		= -I$(slicedir) + SLICE2PYFLAGS		=
> $(ICECPPFLAGS) +-LDFLAGS			= $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir) 
> ++LDFLAGS			+= $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir) + + ifdef
> ice_src_dist +     ifeq ($(ice_cpp_dir), $(ice_dir)/cpp) +-- +1.7.9.5 + 
> diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb new file mode
> 100644 index 0000000..445e2f1 --- /dev/null +++
> b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb @@ -0,0 +1,75
> @@ +DESCRIPTION = "The Internet Communications Engine" +LICENSE =
> "GPLv2" +LIC_FILES_CHKSUM =
> "file://ICE_LICENSE;md5=3dc3037023cc2ae6b2c5b995da529515" +DEPENDS =
> "bzip2 expat openssl python db mcpp" +DEPENDS_prepend_class-target =
> "zeroc-ice-native " + +SRC_URI =
> "http://www.zeroc.com/download/Ice/3.5/Ice-${PV}.tar.gz \ +
> file://0002-Modify-Makefile-for-cross-compile.patch \ +          " 
> +SRC_URI[md5sum] = "f00c59983cc904bca977133c0a9b3e80" +SRC_URI[sha256sum]
> = "989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b70493af392" + +S
> = "${WORKDIR}/Ice-${PV}" + +inherit python-dir pkgconfig + +export
> PYTHON_VERSION = "python2.7" + +do_configure() { +    : +} + 
> +do_compile_prepend_class-target () { +    export
> PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}" +    export
> PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}" +    export
> ICE_HOME="${STAGING_DIR_NATIVE}/usr" +} + 
> +do_compile_prepend_class-nativesdk () { +    export
> PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}" +    export
> PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}" +    export
> ICE_HOME="${STAGING_DIR_NATIVE}/usr" +} + 
> +do_compile_prepend_class-native () { +    export ICE_HOME="${S}/cpp" +} 
> + +do_compile() { +    oe_runmake -C ${S} cpp +    oe_runmake -C ${S} py 
> +} + +do_install_prepend_class-target () { +    export
> PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}" +    export
> PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}" +    export
> ICE_HOME="${STAGING_DIR_NATIVE}/usr" +} + 
> +do_install_prepend_class-nativesdk () { +    export
> PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}" +    export
> PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}" +    export
> ICE_HOME="${STAGING_DIR_NATIVE}/usr" +} + 
> +do_install_prepend_class-native () { +    export ICE_HOME="${S}/cpp" +} 
> + +do_install() { +    oe_runmake -C ${S}/cpp prefix=${D}${prefix}
> install install-common +    oe_runmake -C ${S}/py prefix=${D}${prefix}
> install +} + +PACKAGES += "${PN}-python ${PN}-python-dev
> ${PN}-python-dbg" + +FILES_${PN}-doc += "${prefix}/man/man1" +FILES_${PN}
> += "${prefix}/*LICENSE ${libdir}/ImportKey.class ${prefix}/RELEASE_NOTES
> ${prefix}/CHANGES" +FILES_${PN}-dev += "${includedir} ${prefix}/slice
> ${prefix}/config" +FILES_${PN}-python-dev =
> "${PYTHON_SITEPACKAGES_DIR}/IcePy.so" +FILES_${PN}-python =
> "${PYTHON_SITEPACKAGES_DIR}/*.py ${PYTHON_SITEPACKAGES_DIR}/IcePy.so.*
> ${PYTHON_SITEPACKAGES_DIR}/Ice*/*.py" +FILES_${PN}-python-dbg =
> "${PYTHON_SITEPACKAGES_DIR}/.debug" +FILES_${PN}-dev += "${bindir}/slice*
> ${datadir}/Ice-${PV}/slice/*" + +BBCLASSEXTEND = "native nativesdk"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTcdZFMkyGM64RGpERAjpGAKCYowY+VHsoqBftUbUIp2UWMzi6tgCfYP3O
j8t9yo1pEfXyqtoxvWp/wiU=
=WrTZ
-----END PGP SIGNATURE-----


