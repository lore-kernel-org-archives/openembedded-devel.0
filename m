Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f50.google.com (unknown [209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 202B666069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 07:14:04 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id b8so2702178lan.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6o2Ixg3t2HbGEnSlVT75bup1w65ceJ/C5XGPNovxGsc=;
	b=NEQru6paPytBpKwGSp51X4612Ptq4gLznav2KpxQ2PDjtaiXJUfHFVSTv4XEZDr2OW
	Dj7BAHnbiDlnVxhYXyDxNsF1cl29RjP4Lr5xyZRKCQMQxzmMYpqUlg7wklL8Hsn1X7vO
	dnLY74xOkSVc9OIvEAY251Le4jkyk5zEtpsw68uVPa0XtFShAfXYmBPgg3AIe5RFMNth
	hF3ssqIYAT3TWG/DMU/kM6HIARxnD0QkzSg7hHSulwrNiSPmqW1zAcJUT6GRULm+BXWb
	bICHHgfKQiIV+S9u6ktX9iuMgcHaQS4+KjRTmNpQWqKuVgA/Q9oOmiVpOiPj0aQ9YKx2
	wkcw==
X-Received: by 10.152.203.129 with SMTP id kq1mr16879634lac.6.1399965244820;
	Tue, 13 May 2014 00:14:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i10sm6793384lah.13.2014.05.13.00.14.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 00:14:03 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 May 2014 09:14:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513071431.GJ22774@jama>
References: <1399897298-15929-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1399897298-15929-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 13 May 2014 07:14:08 -0000
X-Groupsio-MsgNum: 49887
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Content-Disposition: inline

--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 08:21:38AM -0400, Philip Balister wrote:
> Oh the pain.
>=20
> Tested for ARM. Can build GNU Radio and an sdk that builds GNU Radio.

Fails to build in world builds:

| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/cpp/include=
/IceXML'
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/cpp/include'
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/cpp'
| make: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1'
| NOTE: make -j 8 -e MAKEFLAGS=3D -C /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1 py
| make: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp=
-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1'
| echo "making all in py";
| making all in py
| ( cd py && make all ) || exit 1;
| make[1]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/py'
| ../config/Make.common.rules:131: Found slice2py in both ICE_HOME/bin and =
=2E/../cpp/bin, ICE_HOME/bin/slice2py will be used!
| making all in modules
| make[2]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/py/modules'
| ../../config/Make.common.rules:131: Found slice2py in both ICE_HOME/bin a=
nd ../../cpp/bin, ICE_HOME/bin/slice2py will be used!
| making all in IcePy
| make[3]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/py/modules=
/IcePy'
| ../../../config/Make.common.rules:131: Found slice2py in both ICE_HOME/bi=
n and ../../../cpp/bin, ICE_HOME/bin/slice2py will be used!
| g++  -c -I.  -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/wor=
k/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/cpp/include -I/usr/inclu=
de/python2.7  -Wall -Werror -pthread -fPIC -g  Communicator.cpp
| In file included from ./Communicator.h:13:0,
|                  from Communicator.cpp:14:
| ./Config.h:28:20: fatal error: Python.h: No such file or directory
| compilation terminated.
| make[3]: *** [Communicator.o] Error 1
| make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/py/modules/=
IcePy'
| make[2]: *** [all] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/py/modules'
| make[1]: *** [all] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1/py'
| make: *** [py] Error 1
| make: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/work/x86_64-linux/zeroc-ice-native/3.5.1-r0/Ice-3.5.1'
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/zeroc-ice-native=
/3.5.1-r0/temp/log.do_compile.31585)
NOTE: recipe zeroc-ice-native-3.5.1-r0: task do_compile: Failed
ERROR: Task 23367 (virtual:native:/home/jenkins/oe/shr-core-branches/shr-co=
re/meta-openembedded/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1=
=2Ebb, do_compile) failed with exit code '1'


>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../0002-Modify-Makefile-for-cross-compile.patch   | 287 +++++++++++++++=
++++++
>  .../zeroc-ice/zeroc-ice_3.5.1.bb                   |  75 ++++++
>  2 files changed, 362 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.=
1/0002-Modify-Makefile-for-cross-compile.patch
>  create mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.=
1.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-=
Modify-Makefile-for-cross-compile.patch b/meta-oe/recipes-connectivity/zero=
c-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
> new file mode 100644
> index 0000000..93fb5bf
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-=
Makefile-for-cross-compile.patch
> @@ -0,0 +1,287 @@
> +From bc622ce74fa03a935278d21736a5a251466e1798 Mon Sep 17 00:00:00 2001
> +From: Tom Rondeau <tom@trondeau.com>
> +Date: Wed, 16 Apr 2014 14:34:51 -0400
> +Subject: [PATCH] Modify Makefiles for cross compile
> +
> +---
> + config/Make.common.rules           |   20 +++++++------
> + cpp/Makefile                       |    9 +++---
> + cpp/config/Make.rules              |   32 ++++++++++++--------
> + cpp/config/Make.rules.Linux        |   18 ++---------
> + cpp/src/IceStorm/FreezeDB/Makefile |    2 +-
> + py/config/Make.rules               |   58 +++++++++++++++++++----------=
-------
> + 6 files changed, 70 insertions(+), 69 deletions(-)
> +
> +diff --git a/config/Make.common.rules b/config/Make.common.rules
> +index d7b1d59..a3fb17e 100644
> +--- a/config/Make.common.rules
> ++++ b/config/Make.common.rules
> +@@ -65,9 +65,9 @@ ifeq ($(UNAME),Linux)
> +       #
> +       # Some Linux distributions like Debian/Ubuntu don't use /usr/lib6=
4.
> +       #
> +-      ifeq ($(shell test -d /usr/lib64 && echo 0),0)
> +-          lp64suffix	=3D 64
> +-      endif
> ++      #ifeq ($(shell test -d /usr/lib64 && echo 0),0)
> ++      #    lp64suffix	=3D 64
> ++      #endif
> +       ifeq ($(LP64),)
> +           LP64      	=3D yes
> +       endif
> +@@ -244,12 +244,13 @@ else
> +     slicedir =3D $(ice_dir)/slice
> + endif
> +=20
> +-ifeq ($(prefix), /usr)
> +-    install_slicedir =3D /usr/share/Ice-$(VERSION)/slice
> +-else
> +-    install_slicedir =3D $(prefix)/slice
> +-endif
> ++#ifeq ($(prefix), /usr)
> ++#    install_slicedir =3D /usr/share/Ice-$(VERSION)/slice
> ++#else
> ++#    install_slicedir =3D $(prefix)/slice
> ++#endif
> +=20
> ++install_slicedir =3D $(prefix)/slice
> + #
> + # Set environment variables for the Slice translator.
> + #
> +@@ -265,7 +266,8 @@ ifneq ($(ice_dir), /usr)
> +     endif
> +=20
> +     ifeq ($(UNAME),Linux)
> +-        export LD_LIBRARY_PATH :=3D $(ice_lib_dir):$(LD_LIBRARY_PATH)
> ++        #export LD_LIBRARY_PATH :=3D $(ice_lib_dir):$(LD_LIBRARY_PATH)
> ++        export LD_LIBRARY_PATH :=3D $(ICE_HOME)/lib:$(LD_LIBRARY_PATH)
> +     endif
> +=20
> +     ifeq ($(UNAME),SunOS)
> +diff --git a/cpp/Makefile b/cpp/Makefile
> +index a68f113..1f44f57 100644
> +--- a/cpp/Makefile
> ++++ b/cpp/Makefile
> +@@ -11,11 +11,12 @@ top_srcdir	=3D .
> +=20
> + include $(top_srcdir)/config/Make.rules
> +=20
> +-SUBDIRS		=3D config src include test
> ++#SUBDIRS		=3D config src include test
> ++SUBDIRS		=3D config src include
> +=20
> +-ifeq ($(shell uname | grep MINGW),)
> +-SUBDIRS		:=3D $(SUBDIRS) demo
> +-endif
> ++#ifeq ($(shell uname | grep MINGW),)
> ++#SUBDIRS		:=3D $(SUBDIRS) demo
> ++#endif
> +=20
> + INSTALL_SUBDIRS	=3D $(install_bindir) $(install_libdir) $(install_inclu=
dedir) \
> + 	$(install_configdir) $(install_mandir)
> +diff --git a/cpp/config/Make.rules b/cpp/config/Make.rules
> +index 37461ae..197c5e8 100644
> +--- a/cpp/config/Make.rules
> ++++ b/cpp/config/Make.rules
> +@@ -175,11 +175,12 @@ headerdir		=3D $(top_srcdir)/include
> + # includedir is not handled the same as bindir and libdir
> + # because it is used in the .depend files
> + #
> +-ifdef ice_src_dist
> +-    includedir		=3D $(top_srcdir)/include
> +-else
> +-    includedir		=3D $(ice_dir)/include
> +-endif
> ++#ifdef ice_src_dist
> ++#    includedir		=3D $(top_srcdir)/include
> ++#else
> ++#    includedir		=3D $(ice_dir)/include
> ++#endif
> ++includedir		=3D $(top_srcdir)/include
> +=20
> + #
> + # Platform specific definitions
> +@@ -277,14 +278,17 @@ ICECPPFLAGS		=3D -I$(slicedir)
> + SLICE2CPPFLAGS		=3D $(ICECPPFLAGS)
> +=20
> + ifeq ($(ice_dir), /usr)=20
> +-    LDFLAGS		=3D $(LDPLATFORMFLAGS) $(CXXFLAGS)
> ++    LDFLAGS		+=3D $(LDPLATFORMFLAGS) $(CXXFLAGS)
> + else
> +     CPPFLAGS	+=3D -I$(includedir)
> +-    ifdef ice_src_dist
> +-	LDFLAGS	=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir)
> +-    else
> +-	LDFLAGS	=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(ice_dir)/$(libsubdir)$(=
cpp11suffix)
> +-    endif
> ++# We must always build using the libraries in the source tree, the host=
's are obviously
> ++# not what we want for the target
> ++    LDFLAGS	+=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir) $(call rpat=
hlink,$(libdir))
> ++#    ifdef ice_src_dist
> ++#        LDFLAGS	=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir)
> ++#    else
> ++#	LDFLAGS	=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(ice_dir)/$(libsubdir)$=
(cpp11suffix)
> ++#    endif
> + endif
> +=20
> + ifeq ($(FLEX_NOLINE),yes)
> +@@ -313,8 +317,10 @@ endif
> +=20
> + ifdef ice_src_dist
> +     SLICEPARSERLIB	=3D $(libdir)/$(call mklibfilename,Slice,$(VERSION))
> +-    SLICE2CPP		=3D $(bindir)/slice2cpp
> +-    SLICE2FREEZE	=3D $(bindir)/slice2freeze
> ++#    SLICE2CPP		=3D $(bindir)/slice2cpp
> ++#    SLICE2FREEZE	=3D $(bindir)/slice2freeze
> ++    SLICE2CPP		=3D $(ICE_HOME)/bin/slice2cpp
> ++    SLICE2FREEZE	=3D $(ICE_HOME)/bin/slice2freeze
> + else
> +     SLICEPARSERLIB	=3D $(ice_dir)/$(libsubdir)$(cpp11suffix)/$(call mkl=
ibfilename,Slice,$(VERSION))
> +     SLICE2CPP		=3D $(ice_dir)/$(binsubdir)$(cpp11suffix)/slice2cpp
> +diff --git a/cpp/config/Make.rules.Linux b/cpp/config/Make.rules.Linux
> +index 5d5717c..8363c6e 100644
> +--- a/cpp/config/Make.rules.Linux
> ++++ b/cpp/config/Make.rules.Linux
> +@@ -31,7 +31,7 @@ ifeq ($(CXX),c++)
> +    CXX			=3D g++
> + endif
> +=20
> +-ifeq ($(CXX),g++)
> ++#ifeq ($(CXX),g++)
> +=20
> +     ifneq ($(SUSE_i586),)
> +         CXXARCHFLAGS	+=3D -march=3Di586
> +@@ -71,14 +71,6 @@ ifeq ($(CXX),g++)
> +       CXXARCHFLAGS	+=3D -mtune=3Dv8 -pipe -Wno-deprecated -DICE_USE_MUT=
EX_SHARED
> +    endif
> +=20
> +-   ifeq ($(MACHINE),x86_64)
> +-      ifeq ($(LP64),yes)
> +-         CXXARCHFLAGS	+=3D -m64
> +-      else
> +-         CXXARCHFLAGS	+=3D -m32
> +-      endif
> +-   endif
> +-
> +    CXXFLAGS		=3D $(CXXARCHFLAGS) -Wall -Werror -pthread
> +=20
> +    ifneq ($(GENPIC),no)
> +@@ -102,15 +94,11 @@ ifeq ($(CXX),g++)
> +=20
> +    rpathlink            =3D -Wl,-rpath-link,$(1)=20
> +=20
> +-   ifneq ($(embedded_runpath_prefix),)
> +-      LDPLATFORMFLAGS      =3D -Wl,--enable-new-dtags -Wl,-rpath,$(runp=
ath_libdir)
> +-   else
> +-      LDPLATFORMFLAGS      =3D -Wl,--enable-new-dtags
> +-   endif
> ++   LDPLATFORMFLAGS      =3D -Wl,--enable-new-dtags -Wl,-rpath,../../../=
lib
> +=20
> +    LDPLATFORMFLAGS	+=3D -rdynamic
> +=20
> +-endif
> ++#endif
> +=20
> + ifeq ($(CXX),icpc)
> +    $(warning =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D)=20
> +diff --git a/cpp/src/IceStorm/FreezeDB/Makefile b/cpp/src/IceStorm/Freez=
eDB/Makefile
> +index 7c844b7..cf15cb1 100644
> +--- a/cpp/src/IceStorm/FreezeDB/Makefile
> ++++ b/cpp/src/IceStorm/FreezeDB/Makefile
> +@@ -66,7 +66,7 @@ $(libdir)/$(LIBNAME): $(libdir)/$(SONAME)
> +=20
> + $(MIGRATE): $(MOBJS)
> + 	rm -f $@
> +-	$(CXX) $(LDFLAGS) -o $@ $(MOBJS) $(DB_RPATH_LINK) -lIceStormService -l=
IceStorm -lFreeze $(LIBS)
> ++	$(CXX) $(LDFLAGS) -o $@ $(MOBJS) $(DB_RPATH_LINK) -lIceStormService -l=
IceStorm -lFreeze $(LIBS) -ldb_cxx
> +=20
> + # The slice2freeze rules are structured like this to avoid issues with
> + # parallel make.
> +diff --git a/py/config/Make.rules b/py/config/Make.rules
> +index 43ce01b..1349342 100644
> +--- a/py/config/Make.rules
> ++++ b/py/config/Make.rules
> +@@ -92,21 +92,23 @@ ifeq ($(shell test -f $(top_srcdir)/config/Make.rule=
s.$(UNAME) && echo 0),0)
> +     include $(top_srcdir)/config/Make.rules.$(UNAME)
> + else
> +     include $(top_srcdir)/../cpp/config/Make.rules.$(UNAME)
> +-endif=20
> ++endif
> +=20
> + libdir                  =3D $(top_srcdir)/python
> +-ifneq ($(prefix), /usr)
> +-install_pythondir       =3D $(prefix)/python
> +-install_libdir          =3D $(prefix)/python
> +-else
> +-    ifeq ($(shell test -d $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dist=
-packages && echo 0),0)
> +-        install_pythondir       =3D $(prefix)/$(libsubdir)/$(PYTHON_VER=
SION)/dist-packages
> +-        install_libdir          =3D $(prefix)/$(libsubdir)/$(PYTHON_VER=
SION)/dist-packages
> +-    else
> +-        install_pythondir       =3D $(prefix)/$(libsubdir)/$(PYTHON_VER=
SION)/site-packages
> +-        install_libdir          =3D $(prefix)/$(libsubdir)/$(PYTHON_VER=
SION)/site-packages
> +-    endif
> +-endif
> ++#ifneq ($(prefix), /usr)
> ++#install_pythondir       =3D $(prefix)/python
> ++#install_libdir          =3D $(prefix)/python
> ++#else
> ++#    ifeq ($(shell test -d $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/dis=
t-packages && echo 0),0)
> ++#        install_pythondir       =3D $(prefix)/$(libsubdir)/$(PYTHON_VE=
RSION)/dist-packages
> ++#        install_libdir          =3D $(prefix)/$(libsubdir)/$(PYTHON_VE=
RSION)/dist-packages
> ++#    else
> ++#        install_pythondir       =3D $(prefix)/$(libsubdir)/$(PYTHON_VE=
RSION)/site-packages
> ++#        install_libdir          =3D $(prefix)/$(libsubdir)/$(PYTHON_VE=
RSION)/site-packages
> ++#    endif
> ++#endif
> ++install_pythondir       =3D $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/si=
te-packages
> ++install_libdir          =3D $(prefix)/$(libsubdir)/$(PYTHON_VERSION)/si=
te-packages
> +=20
> + ifeq ($(UNAME),SunOS)
> +    ifeq ($(LP64),yes)
> +@@ -115,19 +117,21 @@ ifeq ($(UNAME),SunOS)
> +    endif
> + endif
> +=20
> +-ifdef ice_src_dist
> +-    ifeq ($(ice_cpp_dir), $(ice_dir)/cpp)
> +-        ICE_LIB_DIR =3D -L$(ice_cpp_dir)/lib
> +-    else
> +-        ICE_LIB_DIR =3D -L$(ice_cpp_dir)/$(libsubdir)
> +-    endif
> +-    ICE_LIB_DIR =3D -L$(ice_cpp_dir)/lib
> +-    ICE_FLAGS 	=3D -I$(ice_cpp_dir)/include
> +-endif
> +-ifdef ice_bin_dist
> +-    ICE_LIB_DIR =3D -L$(ice_dir)/$(libsubdir)
> +-    ICE_FLAGS	=3D -I$(ice_dir)/include
> +-endif
> ++#ifdef ice_src_dist
> ++#    ifeq ($(ice_cpp_dir), $(ice_dir)/cpp)
> ++#        ICE_LIB_DIR =3D -L$(ice_cpp_dir)/lib
> ++#    else
> ++#        ICE_LIB_DIR =3D -L$(ice_cpp_dir)/$(libsubdir)
> ++#    endif
> ++#    ICE_LIB_DIR =3D -L$(ice_cpp_dir)/lib
> ++#    ICE_FLAGS 	=3D -I$(ice_cpp_dir)/include
> ++#endif
> ++#ifdef ice_bin_dist
> ++#    ICE_LIB_DIR =3D -L$(ice_dir)/$(libsubdir)
> ++#    ICE_FLAGS	=3D -I$(ice_dir)/include
> ++#endif
> ++ICE_LIB_DIR =3D -L$(top_srcdir)/../cpp/lib
> ++ICE_FLAGS =3D -I$(ice_cpp_dir)/include
> + ICE_LIBS =3D $(ICE_LIB_DIR) -lIce -lSlice -lIceUtil
> +=20
> + ifneq ($(embedded_runpath_prefix),)
> +@@ -137,7 +141,7 @@ endif
> + CPPFLAGS		=3D
> + ICECPPFLAGS		=3D -I$(slicedir)
> + SLICE2PYFLAGS		=3D $(ICECPPFLAGS)
> +-LDFLAGS			=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir)
> ++LDFLAGS			+=3D $(LDPLATFORMFLAGS) $(CXXFLAGS) -L$(libdir)
> +=20
> + ifdef ice_src_dist
> +     ifeq ($(ice_cpp_dir), $(ice_dir)/cpp)
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb b/=
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> new file mode 100644
> index 0000000..445e2f1
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> @@ -0,0 +1,75 @@
> +DESCRIPTION =3D "The Internet Communications Engine"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://ICE_LICENSE;md5=3D3dc3037023cc2ae6b2c5b995d=
a529515"
> +DEPENDS =3D "bzip2 expat openssl python db mcpp"
> +DEPENDS_prepend_class-target =3D "zeroc-ice-native "
> +
> +SRC_URI =3D "http://www.zeroc.com/download/Ice/3.5/Ice-${PV}.tar.gz \
> +           file://0002-Modify-Makefile-for-cross-compile.patch \
> +          "
> +SRC_URI[md5sum] =3D "f00c59983cc904bca977133c0a9b3e80"
> +SRC_URI[sha256sum] =3D "989e51194c6adadbd156da3288e37bad847b93b3b876502e=
83033b70493af392"
> +
> +S =3D "${WORKDIR}/Ice-${PV}"
> +
> +inherit python-dir pkgconfig
> +
> +export PYTHON_VERSION =3D "python2.7"
> +
> +do_configure() {
> +    :
> +}
> +
> +do_compile_prepend_class-target () {
> +    export PYTHON_INCLUDE_DIR=3D"${STAGING_INCDIR}/${PYTHON_DIR}"
> +    export PYTHON_LIB_DIR=3D"${STAGING_LIBDIR}/${PYTHON_DIR}"
> +    export ICE_HOME=3D"${STAGING_DIR_NATIVE}/usr"
> +}
> +
> +do_compile_prepend_class-nativesdk () {
> +    export PYTHON_INCLUDE_DIR=3D"${STAGING_INCDIR}/${PYTHON_DIR}"
> +    export PYTHON_LIB_DIR=3D"${STAGING_LIBDIR}/${PYTHON_DIR}"
> +    export ICE_HOME=3D"${STAGING_DIR_NATIVE}/usr"
> +}
> +
> +do_compile_prepend_class-native () {
> +    export ICE_HOME=3D"${S}/cpp"
> +}
> +
> +do_compile() {
> +    oe_runmake -C ${S} cpp
> +    oe_runmake -C ${S} py
> +}
> +
> +do_install_prepend_class-target () {
> +    export PYTHON_INCLUDE_DIR=3D"${STAGING_INCDIR}/${PYTHON_DIR}"
> +    export PYTHON_LIB_DIR=3D"${STAGING_LIBDIR}/${PYTHON_DIR}"
> +    export ICE_HOME=3D"${STAGING_DIR_NATIVE}/usr"
> +}
> +
> +do_install_prepend_class-nativesdk () {
> +    export PYTHON_INCLUDE_DIR=3D"${STAGING_INCDIR}/${PYTHON_DIR}"
> +    export PYTHON_LIB_DIR=3D"${STAGING_LIBDIR}/${PYTHON_DIR}"
> +    export ICE_HOME=3D"${STAGING_DIR_NATIVE}/usr"
> +}
> +
> +do_install_prepend_class-native () {
> +    export ICE_HOME=3D"${S}/cpp"
> +}
> +
> +do_install() {
> +    oe_runmake -C ${S}/cpp prefix=3D${D}${prefix} install install-common
> +    oe_runmake -C ${S}/py prefix=3D${D}${prefix} install
> +}
> +
> +PACKAGES +=3D "${PN}-python ${PN}-python-dev ${PN}-python-dbg"
> +
> +FILES_${PN}-doc +=3D "${prefix}/man/man1"
> +FILES_${PN} +=3D "${prefix}/*LICENSE ${libdir}/ImportKey.class ${prefix}=
/RELEASE_NOTES ${prefix}/CHANGES"
> +FILES_${PN}-dev +=3D "${includedir} ${prefix}/slice ${prefix}/config"
> +FILES_${PN}-python-dev =3D "${PYTHON_SITEPACKAGES_DIR}/IcePy.so"
> +FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*.py ${PYTHON_SITEPAC=
KAGES_DIR}/IcePy.so.* ${PYTHON_SITEPACKAGES_DIR}/Ice*/*.py"
> +FILES_${PN}-python-dbg =3D "${PYTHON_SITEPACKAGES_DIR}/.debug"
> +FILES_${PN}-dev +=3D "${bindir}/slice* ${datadir}/Ice-${PV}/slice/*"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNxxlcACgkQN1Ujt2V2gBwLOwCfYNSzpbvW8noBsrNWw+T5qW9P
5w0AnRXiW6TBqPGkLploJ1rQWnD/bQCr
=H2fE
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--
