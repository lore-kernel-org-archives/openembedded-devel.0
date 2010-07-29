Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eblima@gmail.com>) id 1OeXOC-0004j9-LM
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:59:32 +0200
Received: by gyd8 with SMTP id 8so241712gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ajm7smCTJ5PLRZpUte1rSxgCJjxvlr+pFbm29tv/E6s=;
	b=QEqE8uOh9waf0pcGkVBmwqr3oTHr0fsZgBFW8Y2YuxwGJjDmInx73GWHMldHA9xtEf
	ENkg/O1ZEV8jDFe3FX99PNy6eibmr4gxb0wyJKvo9tAsNiixnGv+/ua01sBSnAVUhlYA
	LSavDLvh/YgJnXuX0pvqme2pWd40phiQWPfBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UQlb6LVyEtVBeJCS7AMLQodHY5g5fy412ilW32GqnlQZHKsNMvU149+fM+Z1znS5NG
	FA0a5IYbWZmTaWsTkLcVtbWTJrYm1Fsi9gzdPmhTbZR+SH2Xs2krRqh6r1qwZyVLMBri
	jg7qSaXPX23Ed/69ZV4wRC61rEyyh5HuAjG4M=
Received: by 10.150.113.15 with SMTP id l15mr1501690ybc.290.1280426348383; 
	Thu, 29 Jul 2010 10:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.176.77 with HTTP; Thu, 29 Jul 2010 10:58:48 -0700 (PDT)
In-Reply-To: <20100727010733.3AE504677C@linux.fjfi.cvut.cz>
References: <20100727010733.3AE504677C@linux.fjfi.cvut.cz>
From: "Eduardo Lima (Etrunko)" <eblima@gmail.com>
Date: Thu, 29 Jul 2010 14:58:48 -0300
Message-ID: <AANLkTika1u_edyHhi2GepQxxcAnMqnJVDjBfMLNFsH53@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: eblima@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] webkit-efl: update to recent webkit-efl (r64079), package launcher too
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
X-List-Received-Date: Thu, 29 Jul 2010 17:59:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2010 at 9:38 PM, David Kozub <zub@linux.fjfi.cvut.cz> wrote=
:
> The launcher was tested on om-gta02.
>
> This update breaks openmoko-3rdparty/ventura_svn.bb, as the API has chang=
ed.
>
> Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
> ---
> =C2=A0recipes/webkit/webkit-efl/CMakeLists.txt =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0121 ++++++++++++++++++++
> =C2=A0recipes/webkit/webkit-efl/cmakeconfig.h.cmake =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 40 +++++++
> =C2=A0.../webkit-efl/fix-build-with-newer-ecore.patch =C2=A0 =C2=A0| =C2=
=A0 10 --
> =C2=A0.../webkit-efl/fix-build-with-newer-evas.patch =C2=A0 =C2=A0 | =C2=
=A0 26 ----
> =C2=A0.../webkit/webkit-efl/install-efl-launcher.patch =C2=A0 | =C2=A0 10=
 ++
> =C2=A0recipes/webkit/webkit-efl/set-so-version.patch =C2=A0 =C2=A0 | =C2=
=A0 11 ++
> =C2=A0recipes/webkit/webkit-efl_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 24 ----
> =C2=A0recipes/webkit/webkit-efl_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 46 ++++++++
> =C2=A08 files changed, 228 insertions(+), 60 deletions(-)
> =C2=A0create mode 100644 recipes/webkit/webkit-efl/CMakeLists.txt
> =C2=A0create mode 100644 recipes/webkit/webkit-efl/cmakeconfig.h.cmake
> =C2=A0delete mode 100644 recipes/webkit/webkit-efl/fix-build-with-newer-e=
core.patch
> =C2=A0delete mode 100644 recipes/webkit/webkit-efl/fix-build-with-newer-e=
vas.patch
> =C2=A0create mode 100644 recipes/webkit/webkit-efl/install-efl-launcher.p=
atch
> =C2=A0create mode 100644 recipes/webkit/webkit-efl/set-so-version.patch
> =C2=A0delete mode 100644 recipes/webkit/webkit-efl_git.bb
> =C2=A0create mode 100644 recipes/webkit/webkit-efl_svn.bb
>
> diff --git a/recipes/webkit/webkit-efl/CMakeLists.txt b/recipes/webkit/we=
bkit-efl/CMakeLists.txt
> new file mode 100644
> index 0000000..996b457
> --- /dev/null
> +++ b/recipes/webkit/webkit-efl/CMakeLists.txt
> @@ -0,0 +1,121 @@
> +CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
> +PROJECT(WebKit)
> +
> +IF (NOT CMAKE_BUILD_TYPE)
> + =C2=A0 =C2=A0SET(CMAKE_BUILD_TYPE Release)
> +ENDIF ()
> +SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
> +
> +SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/JavaScriptCore")
> +SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/WebCore")
> +SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/WebKit")
> +SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
> +
> +INCLUDE(WebKitMacros)
> +INCLUDE(WebKitGenerators)
> +INCLUDE(WebKitHelpers)
> +INCLUDE(WebKitFeatures)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Determine which port will be built
> +# ----------------------------------------------------------------------=
-------
> +SET(ALL_PORTS Efl)
> +OPTION(PORT "choose which WebKit port to build (one of ${ALL_PORTS})" "N=
OPORT")
> +
> +# ----------------------------------------------------------------------=
-------
> +# Find common packages (used by all ports)
> +# ----------------------------------------------------------------------=
-------
> +FIND_PACKAGE(BISON REQUIRED)
> +FIND_PACKAGE(FLEX REQUIRED)
> +FIND_PACKAGE(Perl REQUIRED)
> +FIND_PACKAGE(PythonInterp REQUIRED)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Determine the target processor
> +# ----------------------------------------------------------------------=
-------
> +IF (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
> + =C2=A0 =C2=A0SET(WTF_CPU_ARM 1)
> +ELSEIF (CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64)")
> + =C2=A0 =C2=A0SET(WTF_CPU_X86_64 1)
> +ELSEIF (CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
> + =C2=A0 =C2=A0SET(WTF_CPU_X86 1)
> +ELSE ()
> + =C2=A0 =C2=A0MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR=
}'")
> +ENDIF ()
> +
> +# ----------------------------------------------------------------------=
-------
> +# Determine the operating system
> +# ----------------------------------------------------------------------=
-------
> +IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
> + =C2=A0 =C2=A0SET(WTF_OS_UNIX 1)
> +
> + =C2=A0 =C2=A0IF (APPLE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0SET(WTF_OS_MAC_OS_X 1)
> + =C2=A0 =C2=A0ENDIF ()
> +ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
> + =C2=A0 =C2=A0SET(WTF_OS_WINDOWS 1)
> +ELSE ()
> + =C2=A0 =C2=A0MESSAGE(FATAL_ERROR "Unknown OS '${CMAKE_SYSTEM_NAME}'")
> +ENDIF ()
> +
> +# ----------------------------------------------------------------------=
-------
> +# Default target names (can be overrriden in Options${PORT}.cmake file)
> +# ----------------------------------------------------------------------=
-------
> +SET(JSC_EXECUTABLE_NAME JSC)
> +SET(WTF_LIBRARY_NAME WTF)
> +SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
> +SET(WebCore_LIBRARY_NAME WebCore)
> +SET(WebKit_LIBRARY_NAME WebKit)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Default library types
> +# ----------------------------------------------------------------------=
-------
> +OPTION(SHARED_CORE "build WTF, JavaScriptCore and WebCore as shared libr=
aries")
> +
> +IF (SHARED_CORE)
> + =C2=A0 =C2=A0SET(WTF_LIBRARY_TYPE SHARED)
> + =C2=A0 =C2=A0SET(JavaScriptCore_LIBRARY_TYPE SHARED)
> + =C2=A0 =C2=A0SET(WebCore_LIBRARY_TYPE SHARED)
> +ELSE ()
> + =C2=A0 =C2=A0SET(WTF_LIBRARY_TYPE STATIC)
> + =C2=A0 =C2=A0SET(JavaScriptCore_LIBRARY_TYPE STATIC)
> + =C2=A0 =C2=A0SET(WebCore_LIBRARY_TYPE STATIC)
> +ENDIF ()
> +
> +SET(WebKit_LIBRARY_TYPE SHARED)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Port-specific options
> +# ----------------------------------------------------------------------=
-------
> +INCLUDE(OptionsCommon)
> +INCLUDE(Options${PORT})
> +
> +# ----------------------------------------------------------------------=
-------
> +# Define packaging
> +# ----------------------------------------------------------------------=
-------
> +INCLUDE(WebKitPackaging)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Add module directories
> +# ----------------------------------------------------------------------=
-------
> +ADD_SUBDIRECTORY(JavaScriptCore)
> +ADD_SUBDIRECTORY(WebCore)
> +ADD_SUBDIRECTORY(WebKit)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Set compiler flags for all targets
> +# ----------------------------------------------------------------------=
-------
> +WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WTF_LIBRARY_NAME})
> +WEBKIT_SET_EXTRA_COMPILER_FLAGS(${JavaScriptCore_LIBRARY_NAME})
> +WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebCore_LIBRARY_NAME})
> +WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebKit_LIBRARY_NAME})
> +
> +# ----------------------------------------------------------------------=
-------
> +# Create the configuration file
> +# ----------------------------------------------------------------------=
-------
> +CONFIGURE_FILE(cmakeconfig.h.cmake ${CMAKE_BINARY_DIR}/cmakeconfig.h @ON=
LY)
> +
> +# ----------------------------------------------------------------------=
-------
> +# Prints a summary of all enabled/disabled features
> +# ----------------------------------------------------------------------=
-------
> +WEBKIT_PRINT_FEATURES()
> diff --git a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake b/recipes/webk=
it/webkit-efl/cmakeconfig.h.cmake
> new file mode 100644
> index 0000000..14f7a80
> --- /dev/null
> +++ b/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
> @@ -0,0 +1,40 @@
> +#ifndef CMAKECONFIG_H
> +#define CMAKECONFIG_H
> +
> +#define ENABLE_AS_IMAGE @ENABLE_AS_IMAGE_VALUE@
> +#define ENABLE_BLOB_SLICE @ENABLE_BLOB_SLICE_VALUE@
> +#define ENABLE_CHANNEL_MESSAGING @ENABLE_CHANNEL_MESSAGING_VALUE@
> +#define ENABLE_DATABASE @ENABLE_DATABASE_VALUE@
> +#define ENABLE_DATAGRID @ENABLE_DATAGRID_VALUE@
> +#define ENABLE_DATALIST @ENABLE_DATALIST_VALUE@
> +#define ENABLE_DOM_STORAGE @ENABLE_DOM_STORAGE_VALUE@
> +#define ENABLE_EVENTSOURCE @ENABLE_EVENTSOURCE_VALUE@
> +#define ENABLE_FAST_MOBILE_SCROLLING @ENABLE_FAST_MOBILE_SCROLLING_VALUE=
@
> +#define ENABLE_FILTERS @ENABLE_FILTERS_VALUE@
> +#define ENABLE_GEOLOCATION @ENABLE_GEOLOCATION_VALUE@
> +#define ENABLE_GLIB_SUPPORT @ENABLE_GLIB_SUPPORT_VALUE@
> +#define ENABLE_ICONDATABASE @ENABLE_ICONDATABASE_VALUE@
> +#define ENABLE_JAVASCRIPT_DEBUGGER @ENABLE_JAVASCRIPT_DEBUGGER_VALUE@
> +#define ENABLE_JIT @ENABLE_JIT_VALUE@
> +#define ENABLE_MATHML @ENABLE_MATHML_VALUE@
> +#define ENABLE_NOTIFICATIONS @ENABLE_NOTIFICATIONS_VALUE@
> +#define ENABLE_OFFLINE_WEB_APPLICATIONS @ENABLE_OFFLINE_WEB_APPLICATIONS=
_VALUE@
> +#define ENABLE_ORIENTATION_EVENTS @ENABLE_ORIENTATION_EVENTS_VALUE@
> +#define ENABLE_PROGRESS_TAG @ENABLE_PROGRESS_TAG_VALUE@
> +#define ENABLE_RUBY @ENABLE_RUBY_VALUE@
> +#define ENABLE_SANDBOX @ENABLE_SANDBOX_VALUE@
> +#define ENABLE_SHARED_WORKERS @ENABLE_SHARED_WORKERS_VALUE@
> +#define ENABLE_SVG @ENABLE_SVG_VALUE@
> +#define ENABLE_SVG_ANIMATION @ENABLE_SVG_ANIMATION_VALUE@
> +#define ENABLE_SVG_FONTS @ENABLE_SVG_FONTS_VALUE@
> +#define ENABLE_SVG_FOREIGN_OBJECT @ENABLE_SVG_FOREIGN_OBJECT_VALUE@
> +#define ENABLE_SVG_USE @ENABLE_SVG_USE_VALUE@
> +#define ENABLE_VIDEO @ENABLE_VIDEO_VALUE@
> +#define ENABLE_WEB_SOCKETS @ENABLE_WEB_SOCKETS_VALUE@
> +#define ENABLE_WML @ENABLE_WML_VALUE@
> +#define ENABLE_WORKERS @ENABLE_WORKERS_VALUE@
> +#define ENABLE_XHTMLMP @ENABLE_XHTMLMP_VALUE@
> +#define ENABLE_XPATH @ENABLE_XPATH_VALUE@
> +#define ENABLE_XSLT @ENABLE_XSLT_VALUE@
> +
> +#endif /* CMAKECONFIG_H */


> diff --git a/recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch b=
/recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch
> deleted file mode 100644
> index bbfba43..0000000
> --- a/recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch
> +++ /dev/null
> @@ -1,10 +0,0 @@
> ---- git.orig/WebKit/efl/EWebLauncher/main.c =C2=A0 =C2=A02010-03-26 11:0=
7:23.000000000 +0100
> -+++ git/WebKit/efl/EWebLauncher/main.c 2010-03-26 11:07:29.000000000 +01=
00
> -@@ -28,7 +28,6 @@
> - #include "Api/EWebKit.h"
> -
> - #include <Ecore.h>
> --#include <Ecore_Data.h>
> - #include <Ecore_Evas.h>
> - #include <Ecore_Getopt.h>
> - #include <Ecore_X.h>
> diff --git a/recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch b/=
recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch
> deleted file mode 100644
> index 6adf0dd..0000000
> --- a/recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> ---- git/WebCore/platform/graphics/IntPoint.h =C2=A0 2009-11-16 19:14:36.=
000000000 +0100
> -+++ webkit-efl/WebCore/platform/graphics/IntPoint.h =C2=A0 =C2=A02010-02=
-26 10:32:48.000000000 +0100
> -@@ -33,6 +33,10 @@
> - #include <QDataStream>
> - #endif
> -
> -+#if PLATFORM(EFL)
> -+#include <Evas.h>
> -+#endif
> -+
> - #if PLATFORM(CG)
> - typedef struct CGPoint CGPoint;
> - #endif
> -@@ -55,12 +59,6 @@
> - QT_END_NAMESPACE
> - #elif PLATFORM(GTK)
> - typedef struct _GdkPoint GdkPoint;
> --#elif PLATFORM(EFL)
> --typedef struct _Evas_Point Evas_Point;
> --struct _Evas_Point{
> -- =C2=A0 =C2=A0int x;
> -- =C2=A0 =C2=A0int y;
> --};
> - #endif
> -
> - #if PLATFORM(WX)

I've tried with updated versions of webkit svn and it works without
those patches. Can you please check if it works for you?

> diff --git a/recipes/webkit/webkit-efl/install-efl-launcher.patch b/recip=
es/webkit/webkit-efl/install-efl-launcher.patch
> new file mode 100644
> index 0000000..8f059be
> --- /dev/null
> +++ b/recipes/webkit/webkit-efl/install-efl-launcher.patch
> @@ -0,0 +1,10 @@
> +diff -ru webkit.original/WebKit/CMakeListsEfl.txt webkit/WebKit/CMakeLis=
tsEfl.txt
> +--- webkit.original/WebKit/CMakeListsEfl.txt =C2=A0 2010-07-21 09:20:50.=
000000000 +0200
> ++++ webkit/WebKit/CMakeListsEfl.txt =C2=A0 =C2=A02010-07-21 11:51:21.000=
000000 +0200
> +@@ -118,3 +118,6 @@
> +
> + INSTALL(FILES ${EWebKit_HEADERS}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 DESTINATION include/EWebKit)
> ++
> ++INSTALL(TARGETS ../Programs/EWebLauncher RUNTIME DESTINATION bin)
> ++SET_TARGET_PROPERTIES(../Programs/EWebLauncher PROPERTIES SKIP_BUILD_RP=
ATH TRUE)
> diff --git a/recipes/webkit/webkit-efl/set-so-version.patch b/recipes/web=
kit/webkit-efl/set-so-version.patch
> new file mode 100644
> index 0000000..7cf81a2
> --- /dev/null
> +++ b/recipes/webkit/webkit-efl/set-so-version.patch
> @@ -0,0 +1,11 @@
> +diff -ru webkit.original/WebKit/CMakeLists.txt webkit/WebKit/CMakeLists.=
txt
> +--- webkit.original/WebKit/CMakeLists.txt =C2=A0 =C2=A0 =C2=A02010-07-24=
 00:14:06.000000000 +0200
> ++++ webkit/WebKit/CMakeLists.txt =C2=A0 =C2=A0 =C2=A0 2010-07-23 23:55:0=
1.000000000 +0200
> +@@ -59,6 +59,7 @@
> + ADD_LIBRARY(${WebKit_LIBRARY_NAME} ${WebKit_LIBRARY_TYPE} ${WebKit_SOUR=
CES})
> + TARGET_LINK_LIBRARIES(${WebKit_LIBRARY_NAME} ${WebKit_LIBRARIES})
> + ADD_TARGET_PROPERTIES(${WebKit_LIBRARY_NAME} LINK_FLAGS "${WebKit_LINK_=
FLAGS}")
> ++SET_TARGET_PROPERTIES(${WebKit_LIBRARY_NAME} PROPERTIES VERSION 0.0.0 S=
OVERSION 0)
> +
> + INSTALL(TARGETS ${WebKit_LIBRARY_NAME} DESTINATION lib)
> +

Talking to the guys in #webkit-efl they told that this set-so-version
patch is going to be integrated upstream. :)

> diff --git a/recipes/webkit/webkit-efl_git.bb b/recipes/webkit/webkit-efl=
_git.bb
> deleted file mode 100644
> index f750061..0000000
> --- a/recipes/webkit/webkit-efl_git.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION =3D " Webkit browser engine, EFL edition"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "icu flex gst-plugins-base gstreamer jpeg libpng libxml2 pan=
go \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libsoup-2.4 eina ecore evas edje cai=
ro fontconfig freetype curl \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3 libxslt gperf-native libxt"
> -
> -SRCREV =3D "3a5ee77664c898ed51a2b2d5759822f8c0a06472"
> -PV =3D "1.1.11+gitr${SRCPV}"
> -PR =3D "r8"
> -
> -SRC_URI =3D "git://gitorious.org/webkit-efl/webkit-efl.git;protocol=3Dgi=
t;branch=3Dmaster \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-build-with-newer-evas.pat=
ch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-build-with-newer-ecore.pa=
tch"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit autotools lib_package pkgconfig
> -
> -EXTRA_OECONF =3D "--disable-video --host=3D${TARGET_SYS} --with-port=3De=
fl --enable-web-workers=3Dno"
> -
> -PACKAGES =3D+ "${PN}-webinspector"
> -
> -FILES_${PN} +=3D "${datadir}/webkit-1.0/theme/default.edj"
> -FILES_${PN}-webinspector =3D "${datadir}/webkit-1.0/webinspector/"
> diff --git a/recipes/webkit/webkit-efl_svn.bb b/recipes/webkit/webkit-efl=
_svn.bb
> new file mode 100644
> index 0000000..f2c6e80
> --- /dev/null
> +++ b/recipes/webkit/webkit-efl_svn.bb
> @@ -0,0 +1,46 @@
> +DESCRIPTION =3D "Webkit browser engine, EFL edition"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "icu libxslt sqlite3 gperf-native bison-native flex-native j=
peg \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libpng libxt fontconfig cairo freety=
pe glib-2.0 libsoup-2.4 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml2 pango eina ecore evas edje"
> +
> +SRCREV =3D "64079"
> +PV =3D "1.1.11+svnr${SRCPV}"
> +PR =3D "r9"
> +
> +SRCREV_FORMAT =3D "webcore-rwebkit"
> +
> +SRC_URI =3D "\
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScript=
Core;proto=3Dhttp;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScript=
Glue;proto=3Dhttp;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebCore;pr=
oto=3Dhttp;name=3Dwebcore;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKit;pro=
to=3Dhttp;name=3Dwebkit;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitLibr=
aries;proto=3Dhttp;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitTool=
s;proto=3Dhttp;subdir=3Dsrc \
> + =C2=A0svn://svn.webkit.org/repository/webkit/trunk/;module=3Dcmake;prot=
o=3Dhttp;subdir=3Dsrc \
> + =C2=A0file://cmakeconfig.h.cmake \
> + =C2=A0file://CMakeLists.txt \
> + =C2=A0file://install-efl-launcher.patch \
> + =C2=A0file://set-so-version.patch \
> + "
> +

> +S =3D "${WORKDIR}/src"
> +
> +inherit cmake lib_package pkgconfig
> +
> +EXTRA_OECMAKE =3D "-DPORT=3DEfl"
> +
> +do_unpack_append() {
> + =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func('do_move_files', d)
> +}
> +
> +do_move_files() {
> + =C2=A0 =C2=A0 =C2=A0 mv "${WORKDIR}/cmakeconfig.h.cmake" "${S}"
> + =C2=A0 =C2=A0 =C2=A0 mv "${WORKDIR}/CMakeLists.txt" "${S}"
> +}
> +

Instead of custom do_unpack_append I simply put a OECMAKE_SOURCEPATH =3D
"../", which makes the recipe cleaner, IMHO. But that's just the
opinion of a newbie in the OE lands. :)

Best regards, Etrunko.

> +PACKAGES =3D+ "${PN}launcher-dbg ${PN}launcher"
> +
> +FILES_${PN} +=3D "${datadir}/webkit-1.0/theme/default.edj"
> +FILES_${PN}launcher =3D "${bindir}/EWebLauncher"
> +FILES_${PN}launcher-dbg =3D "${bindir}/.debug/EWebLauncher"
> --
> 1.7.1
>


>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Eduardo de Barros Lima
eblima@gmail.com


