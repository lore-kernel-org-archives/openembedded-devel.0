Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpSJX-0003X7-Sr
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:20:04 +0100
Received: by eya28 with SMTP id 28so446440eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=dBpZ8c4vbPd2Yda3MvqSRhkNqUC423F3edlc3NXfGks=;
	b=vmCHui1baxl87xLt0bw9AGipjVf+TJdtU3IxV0IGDz4srisHE9b0WiYe+4ktraotKy
	6u+Ap856vWF5ICp6Rlohu7GI4TQHIKs5am6L/hyCalxrEJDkeyN04sv6t0B0CMzkTzD3
	IEr+l1JV33STvdF9t6NsHrFUuIlfuogxC+TlM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UId5d8PlJ6kNGusLS1apZWW0tSw5N1dEJAP918xTn3ZXSORy1y2KdqTrqxDrmq9lHE
	cCzjWyA8CyoMYmpY3WrLKsGUQpilSYWD7BkTNKCjGphjO7LD8JD5m9v5llGgNuAA868r
	OUh2fJmgSNbPqM129J47OvT2/vxV2yf4gY/aw=
Received: by 10.223.86.2 with SMTP id q2mr724115fal.139.1297804733083; Tue, 15
	Feb 2011 13:18:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Tue, 15 Feb 2011 13:18:33 -0800 (PST)
In-Reply-To: <1297803782-8395-4-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
	<1297803782-8395-4-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2011 13:18:33 -0800
Message-ID: <AANLkTikcymGh5LX00U5DJudFSNDZ3t1ZbH=unsSS5Hyo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] webkit-efl: upgrade to 1.3.11, upstream has Source subdirectory now, which makes SRC_URI a lot shorter
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
X-List-Received-Date: Tue, 15 Feb 2011 21:20:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 1:03 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

where will svn recipe get PR from

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/webkit/webkit-efl/CMakeLists.txt =C2=A0 =C2=A0 =C2=A0| =C2=
=A0132 -------------------------
> =C2=A0recipes/webkit/webkit-efl/bug.50752.patch =C2=A0 =C2=A0 | =C2=A0 37=
 -------
> =C2=A0recipes/webkit/webkit-efl/cmakeconfig.h.cmake | =C2=A0 41 --------
> =C2=A0recipes/webkit/webkit-efl/revert.r78057.patch | =C2=A0 19 ++++
> =C2=A0recipes/webkit/webkit-efl_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 33 ++-----
> =C2=A05 files changed, 26 insertions(+), 236 deletions(-)
> =C2=A0delete mode 100644 recipes/webkit/webkit-efl/CMakeLists.txt
> =C2=A0delete mode 100644 recipes/webkit/webkit-efl/bug.50752.patch
> =C2=A0delete mode 100644 recipes/webkit/webkit-efl/cmakeconfig.h.cmake
> =C2=A0create mode 100644 recipes/webkit/webkit-efl/revert.r78057.patch
>
> diff --git a/recipes/webkit/webkit-efl/CMakeLists.txt b/recipes/webkit/we=
bkit-efl/CMakeLists.txt
> deleted file mode 100644
> index ca8dcf9..0000000
> --- a/recipes/webkit/webkit-efl/CMakeLists.txt
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
> -PROJECT(WebKit)
> -
> -# Set a default build type if and only if user did not define one as com=
mand
> -# line options and he did not give custom CFLAGS or CXXFLAGS. Otherwise,=
 flags
> -# from default build type would overwrite user-defined ones.
> -IF (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_C_FLAGS AND NOT CMAKE_CXX_FLAGS)
> - =C2=A0 =C2=A0SET(CMAKE_BUILD_TYPE Release)
> -ENDIF ()
> -SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
> -
> -SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/JavaScriptCore")
> -SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/WebCore")
> -SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/WebKit")
> -SET(WEBKITTOOLS_DIR "${CMAKE_SOURCE_DIR}/WebKitTools")
> -SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
> -
> -INCLUDE(WebKitMacros)
> -INCLUDE(WebKitFS)
> -INCLUDE(WebKitHelpers)
> -INCLUDE(WebKitFeatures)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Determine which port will be built
> -# ----------------------------------------------------------------------=
-------
> -SET(ALL_PORTS Efl)
> -OPTION(PORT "choose which WebKit port to build (one of ${ALL_PORTS})" "N=
OPORT")
> -
> -# ----------------------------------------------------------------------=
-------
> -# Find common packages (used by all ports)
> -# ----------------------------------------------------------------------=
-------
> -FIND_PACKAGE(BISON REQUIRED)
> -FIND_PACKAGE(FLEX REQUIRED)
> -FIND_PACKAGE(Gperf REQUIRED)
> -FIND_PACKAGE(Perl REQUIRED)
> -FIND_PACKAGE(PythonInterp REQUIRED)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Determine the target processor
> -# ----------------------------------------------------------------------=
-------
> -STRING(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCESSO=
R)
> -IF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
> - =C2=A0 =C2=A0SET(WTF_CPU_ARM 1)
> -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64)")
> - =C2=A0 =C2=A0SET(WTF_CPU_X86_64 1)
> -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
> - =C2=A0 =C2=A0SET(WTF_CPU_X86 1)
> -ELSE ()
> - =C2=A0 =C2=A0MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR=
}'")
> -ENDIF ()
> -
> -# ----------------------------------------------------------------------=
-------
> -# Determine the operating system
> -# ----------------------------------------------------------------------=
-------
> -IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
> - =C2=A0 =C2=A0SET(WTF_OS_UNIX 1)
> -
> - =C2=A0 =C2=A0IF (APPLE)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0SET(WTF_OS_MAC_OS_X 1)
> - =C2=A0 =C2=A0ENDIF ()
> -ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
> - =C2=A0 =C2=A0SET(WTF_OS_WINDOWS 1)
> -ELSE ()
> - =C2=A0 =C2=A0MESSAGE(FATAL_ERROR "Unknown OS '${CMAKE_SYSTEM_NAME}'")
> -ENDIF ()
> -
> -# ----------------------------------------------------------------------=
-------
> -# Default target names (can be overrriden in Options${PORT}.cmake file)
> -# ----------------------------------------------------------------------=
-------
> -SET(JSC_EXECUTABLE_NAME JSC)
> -SET(WTF_LIBRARY_NAME WTF)
> -SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
> -SET(WebCore_LIBRARY_NAME WebCore)
> -SET(WebKit_LIBRARY_NAME WebKit)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Default library types
> -# ----------------------------------------------------------------------=
-------
> -OPTION(SHARED_CORE "build WTF, JavaScriptCore and WebCore as shared libr=
aries")
> -
> -IF (SHARED_CORE)
> - =C2=A0 =C2=A0SET(WTF_LIBRARY_TYPE SHARED)
> - =C2=A0 =C2=A0SET(JavaScriptCore_LIBRARY_TYPE SHARED)
> - =C2=A0 =C2=A0SET(WebCore_LIBRARY_TYPE SHARED)
> -ELSE ()
> - =C2=A0 =C2=A0SET(WTF_LIBRARY_TYPE STATIC)
> - =C2=A0 =C2=A0SET(JavaScriptCore_LIBRARY_TYPE STATIC)
> - =C2=A0 =C2=A0SET(WebCore_LIBRARY_TYPE STATIC)
> -ENDIF ()
> -
> -SET(WebKit_LIBRARY_TYPE SHARED)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Port-specific options
> -# ----------------------------------------------------------------------=
-------
> -INCLUDE(OptionsCommon)
> -INCLUDE(Options${PORT})
> -
> -# ----------------------------------------------------------------------=
-------
> -# Define packaging
> -# ----------------------------------------------------------------------=
-------
> -INCLUDE(WebKitPackaging)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Add module directories
> -# ----------------------------------------------------------------------=
-------
> -ADD_SUBDIRECTORY(JavaScriptCore)
> -ADD_SUBDIRECTORY(WebCore)
> -ADD_SUBDIRECTORY(WebKit)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Add test browser if exists
> -# ----------------------------------------------------------------------=
-------
> -INCLUDE_IF_EXISTS(${WEBKITTOOLS_DIR}/CMakeLists${PORT}.txt)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Set compiler flags for all targets
> -# ----------------------------------------------------------------------=
-------
> -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WTF_LIBRARY_NAME})
> -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${JavaScriptCore_LIBRARY_NAME})
> -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebCore_LIBRARY_NAME})
> -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebKit_LIBRARY_NAME})
> -
> -# ----------------------------------------------------------------------=
-------
> -# Create the configuration file
> -# ----------------------------------------------------------------------=
-------
> -CONFIGURE_FILE(cmakeconfig.h.cmake ${CMAKE_BINARY_DIR}/cmakeconfig.h @ON=
LY)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Prints a summary of all enabled/disabled features
> -# ----------------------------------------------------------------------=
-------
> -WEBKIT_PRINT_FEATURES()
> diff --git a/recipes/webkit/webkit-efl/bug.50752.patch b/recipes/webkit/w=
ebkit-efl/bug.50752.patch
> deleted file mode 100644
> index 2d65f2e..0000000
> --- a/recipes/webkit/webkit-efl/bug.50752.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -https://bugs.webkit.org/show_bug.cgi?id=3D46258
> -
> -diff --git a/WebKit/efl/ChangeLog b/WebKit/efl/ChangeLog
> -index cfb2f1189e4071cdca7027e81b6fda178ee32490..5ce726ec72fcb530fe0d96e7=
7a4e8fc4b8a8c537 100644
> ---- a/WebKit/efl/ChangeLog
> -+++ b/WebKit/efl/ChangeLog
> -@@ -1,3 +1,17 @@
> -+2010-12-09 =C2=A0Alex Bredariol Grilo =C2=A0<abgrilo@profusion.mobi>
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Reviewed by NOBODY (OOPS!).
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0[EFL] Fix scroll operation in WebKit-EFL
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0https://bugs.webkit.org/show_bug.cgi?id=3D5=
0752
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Add the _ewk_view_scroll_add call in WebKit=
-EFL scroll function. This
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0call was wrongly removed in previous commit=
 and performs the scroll
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0operation on the page.
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* ewk/ewk_view.cpp:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0(ewk_view_scroll):
> -+
> - 2010-12-03 =C2=A0Alex Bredariol Grilo =C2=A0<abgrilo@profusion.mobi>
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reviewed by Andreas Kling.
> -diff --git a/WebKit/efl/ewk/ewk_view.cpp b/WebKit/efl/ewk/ewk_view.cpp
> -index 5147b6d9b7ce518deb8e1b864fe773c1931db42e..d1731e74173b53decd186106=
57ea4eb97f903397 100644
> ---- a/WebKit/efl/ewk/ewk_view.cpp
> -+++ b/WebKit/efl/ewk/ewk_view.cpp
> -@@ -4075,6 +4075,8 @@ void ewk_view_scroll(Evas_Object* o, Evas_Coord dx=
, Evas_Coord dy, Evas_Coord sx
> - =C2=A0 =C2=A0 EWK_VIEW_PRIV_GET_OR_RETURN(sd, priv);
> - =C2=A0 =C2=A0 EINA_SAFETY_ON_TRUE_RETURN(!dx && !dy);
> -
> -+ =C2=A0 =C2=A0_ewk_view_scroll_add(priv, dx, dy, sx, sy, sw, sh, main_f=
rame);
> -+
> - =C2=A0 =C2=A0 _ewk_view_smart_changed(sd);
> - }
> -
> diff --git a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake b/recipes/webk=
it/webkit-efl/cmakeconfig.h.cmake
> deleted file mode 100644
> index b16b985..0000000
> --- a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -#ifndef CMAKECONFIG_H
> -#define CMAKECONFIG_H
> -
> -#define ENABLE_AS_IMAGE @ENABLE_AS_IMAGE_VALUE@
> -#define ENABLE_BLOB @ENABLE_BLOB_VALUE@
> -#define ENABLE_CHANNEL_MESSAGING @ENABLE_CHANNEL_MESSAGING_VALUE@
> -#define ENABLE_DATABASE @ENABLE_DATABASE_VALUE@
> -#define ENABLE_DATAGRID @ENABLE_DATAGRID_VALUE@
> -#define ENABLE_DATALIST @ENABLE_DATALIST_VALUE@
> -#define ENABLE_DOM_STORAGE @ENABLE_DOM_STORAGE_VALUE@
> -#define ENABLE_EVENTSOURCE @ENABLE_EVENTSOURCE_VALUE@
> -#define ENABLE_FAST_MOBILE_SCROLLING @ENABLE_FAST_MOBILE_SCROLLING_VALUE=
@
> -#define ENABLE_FILTERS @ENABLE_FILTERS_VALUE@
> -#define ENABLE_FTPDIR @ENABLE_FTPDIR_VALUE@
> -#define ENABLE_GEOLOCATION @ENABLE_GEOLOCATION_VALUE@
> -#define ENABLE_GLIB_SUPPORT @ENABLE_GLIB_SUPPORT_VALUE@
> -#define ENABLE_ICONDATABASE @ENABLE_ICONDATABASE_VALUE@
> -#define ENABLE_INSPECTOR @ENABLE_INSPECTOR_VALUE@
> -#define ENABLE_JAVASCRIPT_DEBUGGER @ENABLE_JAVASCRIPT_DEBUGGER_VALUE@
> -#define ENABLE_JIT @ENABLE_JIT_VALUE@
> -#define ENABLE_MATHML @ENABLE_MATHML_VALUE@
> -#define ENABLE_NETSCAPE_PLUGIN_API @ENABLE_NETSCAPE_PLUGIN_API_VALUE@
> -#define ENABLE_NOTIFICATIONS @ENABLE_NOTIFICATIONS_VALUE@
> -#define ENABLE_OFFLINE_WEB_APPLICATIONS @ENABLE_OFFLINE_WEB_APPLICATIONS=
_VALUE@
> -#define ENABLE_ORIENTATION_EVENTS @ENABLE_ORIENTATION_EVENTS_VALUE@
> -#define ENABLE_PROGRESS_TAG @ENABLE_PROGRESS_TAG_VALUE@
> -#define ENABLE_SHARED_WORKERS @ENABLE_SHARED_WORKERS_VALUE@
> -#define ENABLE_SVG @ENABLE_SVG_VALUE@
> -#define ENABLE_SVG_ANIMATION @ENABLE_SVG_ANIMATION_VALUE@
> -#define ENABLE_SVG_FONTS @ENABLE_SVG_FONTS_VALUE@
> -#define ENABLE_SVG_FOREIGN_OBJECT @ENABLE_SVG_FOREIGN_OBJECT_VALUE@
> -#define ENABLE_SVG_USE @ENABLE_SVG_USE_VALUE@
> -#define ENABLE_VIDEO @ENABLE_VIDEO_VALUE@
> -#define ENABLE_WEB_SOCKETS @ENABLE_WEB_SOCKETS_VALUE@
> -#define ENABLE_WML @ENABLE_WML_VALUE@
> -#define ENABLE_WORKERS @ENABLE_WORKERS_VALUE@
> -#define ENABLE_XHTMLMP @ENABLE_XHTMLMP_VALUE@
> -#define ENABLE_XPATH @ENABLE_XPATH_VALUE@
> -#define ENABLE_XSLT @ENABLE_XSLT_VALUE@
> -
> -#endif /* CMAKECONFIG_H */
> diff --git a/recipes/webkit/webkit-efl/revert.r78057.patch b/recipes/webk=
it/webkit-efl/revert.r78057.patch
> new file mode 100644
> index 0000000..d75f834
> --- /dev/null
> +++ b/recipes/webkit/webkit-efl/revert.r78057.patch
> @@ -0,0 +1,19 @@
> +see https://bugs.webkit.org/show_bug.cgi?id=3D50762
> +fixed by:
> +http://trac.webkit.org/changeset/78047/trunk/Source/WebCore/CMakeLists.t=
xt
> +fix reverted by:
> +http://trac.webkit.org/changeset/78057/trunk/Source/WebCore/CMakeLists.t=
xt
> +
> +so revert revert as we care about webkit-efl and don't care about WinCE
> +
> +Index: Source/WebCore/CMakeLists.txt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Source/WebCore/CMakeLists.txt =C2=A0 =C2=A0 =C2=A0(revision 78042)
> ++++ Source/WebCore/CMakeLists.txt =C2=A0 =C2=A0 =C2=A0(revision 78047)
> +@@ -1157,6 +1157,4 @@
> +
> + =C2=A0 =C2=A0 platform/Arena.cpp
> +- =C2=A0 =C2=A0platform/ContextMenu.cpp
> +- =C2=A0 =C2=A0platform/ContextMenuItem.cpp
> + =C2=A0 =C2=A0 platform/ContentType.cpp
> + =C2=A0 =C2=A0 platform/CrossThreadCopier.cpp
> diff --git a/recipes/webkit/webkit-efl_svn.bb b/recipes/webkit/webkit-efl=
_svn.bb
> index da93d78..2785fe8 100644
> --- a/recipes/webkit/webkit-efl_svn.bb
> +++ b/recipes/webkit/webkit-efl_svn.bb
> @@ -4,28 +4,18 @@ DEPENDS =3D "icu libxslt sqlite3 gperf-native bison-nat=
ive flex-native jpeg \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpng libxt fontconfig cairo fr=
eetype glib-2.0 libsoup-2.4 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2 pango eina ecore evas ed=
je"
>
> -# newer revisions are blocked by
> -# https://bugs.webkit.org/show_bug.cgi?id=3D50762
> -SRCREV =3D "73534"
> -PV =3D "1.3.4+svnr${SRCPV}"
> -PR =3D "r1"
> +SRCREV =3D "78547"
> +PV =3D "1.3.11+svnr${SRCPV}"
>
> -SRCREV_FORMAT =3D "webcore-rwebkit"
> +SRCREV_FORMAT =3D "source"
>
> =C2=A0SRC_URI =3D "\
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScript=
Core;proto=3Dhttp;subdir=3Dsrc \
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScript=
Glue;proto=3Dhttp;subdir=3Dsrc \
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebCore;pr=
oto=3Dhttp;name=3Dwebcore;subdir=3Dsrc \
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKit;pro=
to=3Dhttp;name=3Dwebkit;subdir=3Dsrc \
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitLibr=
aries;proto=3Dhttp;subdir=3Dsrc \
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitTool=
s;proto=3Dhttp;subdir=3Dsrc \
> - =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3Dcmake;prot=
o=3Dhttp;subdir=3Dsrc \
> - =C2=A0file://bug.50752.patch \
> - =C2=A0file://cmakeconfig.h.cmake \
> - =C2=A0file://CMakeLists.txt \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk;module=3DSource;name=
=3Dsource;proto=3Dhttp;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DTools;prot=
o=3Dhttp;subdir=3Dsrc \
> + =C2=A0file://revert.r78057.patch \
> =C2=A0"
>
> -S =3D "${WORKDIR}/src"
> +S =3D "${WORKDIR}/src/Source"
>
> =C2=A0inherit cmake lib_package pkgconfig
>
> @@ -39,15 +29,6 @@ ARM_INSTRUCTION_SET =3D "ARM"
>
> =C2=A0EXTRA_OECMAKE =3D "-DPORT=3DEfl -DSHARED_CORE=3DON"
>
> -do_unpack_append() {
> - =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func('do_move_files', d)
> -}
> -
> -do_move_files() {
> - =C2=A0 =C2=A0 =C2=A0 mv "${WORKDIR}/cmakeconfig.h.cmake" "${S}"
> - =C2=A0 =C2=A0 =C2=A0 mv "${WORKDIR}/CMakeLists.txt" "${S}"
> -}
> -
> =C2=A0LEAD_SONAME =3D "libewebkit.so"
> =C2=A0PACKAGES =3D+ "${PN}launcher-dbg ${PN}launcher"
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


