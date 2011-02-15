Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpSkZ-0006Ir-JB
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:47:59 +0100
Received: by fxm17 with SMTP id 17so647389fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eorJ/ubEQOUFqFJzQClQ2DS9CW7v4wnE5sxN8nGOQ/A=;
	b=VGKFHq2+5sl3cBKAA3JgWyDGnXq0KDDK4fur9FKDtdm3TgESYvjQG/48lohHFtGsil
	3sshZjYkCMXsfWliEPsyKWZxfVLdZDDoY6LrUieJL5WV2Wdm9+lmOk8wGrux/vbkPJa3
	8x0wLDgSWB6jKWmBdKQOE9bCbqHDmen/wwI80=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pgfeJYVZDWIMPKE+sVBdP5/7bS0Z6FEgYjv+j1j3Meh225iOSEfEZUzVdffiGJ1QmM
	ph+LM07iaAvTIBipVPzopmDF2v4l0iwSTHB0T6gP5KxzOml8zmu3G629Eo6PvunwFl6N
	c3R2DzWsF9DgOWE+58d0PBPrFTKz1/t3yPdnU=
Received: by 10.223.72.197 with SMTP id n5mr2637802faj.8.1297806408955;
	Tue, 15 Feb 2011 13:46:48 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n2sm1937363fam.28.2011.02.15.13.46.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 13:46:47 -0800 (PST)
Date: Tue, 15 Feb 2011 22:46:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110215214641.GB3335@localhost.jama.net>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
	<1297803782-8395-4-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikcymGh5LX00U5DJudFSNDZ3t1ZbH=unsSS5Hyo@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikcymGh5LX00U5DJudFSNDZ3t1ZbH=unsSS5Hyo@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 15 Feb 2011 21:47:59 -0000
X-Groupsio-MsgNum: 29267
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 01:18:33PM -0800, Khem Raj wrote:
> On Tue, Feb 15, 2011 at 1:03 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> where will svn recipe get PR from

default r0 like every other recipe
reset after changing PV

Regards,

>=20
> Acked-by: Khem Raj <raj.khem@gmail.com>
>=20
> > ---
> > =A0recipes/webkit/webkit-efl/CMakeLists.txt =A0 =A0 =A0| =A0132 -------=
------------------
> > =A0recipes/webkit/webkit-efl/bug.50752.patch =A0 =A0 | =A0 37 -------
> > =A0recipes/webkit/webkit-efl/cmakeconfig.h.cmake | =A0 41 --------
> > =A0recipes/webkit/webkit-efl/revert.r78057.patch | =A0 19 ++++
> > =A0recipes/webkit/webkit-efl_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 33=
 ++-----
> > =A05 files changed, 26 insertions(+), 236 deletions(-)
> > =A0delete mode 100644 recipes/webkit/webkit-efl/CMakeLists.txt
> > =A0delete mode 100644 recipes/webkit/webkit-efl/bug.50752.patch
> > =A0delete mode 100644 recipes/webkit/webkit-efl/cmakeconfig.h.cmake
> > =A0create mode 100644 recipes/webkit/webkit-efl/revert.r78057.patch
> >
> > diff --git a/recipes/webkit/webkit-efl/CMakeLists.txt b/recipes/webkit/=
webkit-efl/CMakeLists.txt
> > deleted file mode 100644
> > index ca8dcf9..0000000
> > --- a/recipes/webkit/webkit-efl/CMakeLists.txt
> > +++ /dev/null
> > @@ -1,132 +0,0 @@
> > -CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
> > -PROJECT(WebKit)
> > -
> > -# Set a default build type if and only if user did not define one as c=
ommand
> > -# line options and he did not give custom CFLAGS or CXXFLAGS. Otherwis=
e, flags
> > -# from default build type would overwrite user-defined ones.
> > -IF (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_C_FLAGS AND NOT CMAKE_CXX_FLAGS)
> > - =A0 =A0SET(CMAKE_BUILD_TYPE Release)
> > -ENDIF ()
> > -SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
> > -
> > -SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/JavaScriptCore")
> > -SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/WebCore")
> > -SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/WebKit")
> > -SET(WEBKITTOOLS_DIR "${CMAKE_SOURCE_DIR}/WebKitTools")
> > -SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
> > -
> > -INCLUDE(WebKitMacros)
> > -INCLUDE(WebKitFS)
> > -INCLUDE(WebKitHelpers)
> > -INCLUDE(WebKitFeatures)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Determine which port will be built
> > -# --------------------------------------------------------------------=
---------
> > -SET(ALL_PORTS Efl)
> > -OPTION(PORT "choose which WebKit port to build (one of ${ALL_PORTS})" =
"NOPORT")
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Find common packages (used by all ports)
> > -# --------------------------------------------------------------------=
---------
> > -FIND_PACKAGE(BISON REQUIRED)
> > -FIND_PACKAGE(FLEX REQUIRED)
> > -FIND_PACKAGE(Gperf REQUIRED)
> > -FIND_PACKAGE(Perl REQUIRED)
> > -FIND_PACKAGE(PythonInterp REQUIRED)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Determine the target processor
> > -# --------------------------------------------------------------------=
---------
> > -STRING(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCES=
SOR)
> > -IF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
> > - =A0 =A0SET(WTF_CPU_ARM 1)
> > -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64)")
> > - =A0 =A0SET(WTF_CPU_X86_64 1)
> > -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
> > - =A0 =A0SET(WTF_CPU_X86 1)
> > -ELSE ()
> > - =A0 =A0MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR}'")
> > -ENDIF ()
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Determine the operating system
> > -# --------------------------------------------------------------------=
---------
> > -IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
> > - =A0 =A0SET(WTF_OS_UNIX 1)
> > -
> > - =A0 =A0IF (APPLE)
> > - =A0 =A0 =A0 =A0SET(WTF_OS_MAC_OS_X 1)
> > - =A0 =A0ENDIF ()
> > -ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
> > - =A0 =A0SET(WTF_OS_WINDOWS 1)
> > -ELSE ()
> > - =A0 =A0MESSAGE(FATAL_ERROR "Unknown OS '${CMAKE_SYSTEM_NAME}'")
> > -ENDIF ()
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Default target names (can be overrriden in Options${PORT}.cmake file)
> > -# --------------------------------------------------------------------=
---------
> > -SET(JSC_EXECUTABLE_NAME JSC)
> > -SET(WTF_LIBRARY_NAME WTF)
> > -SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
> > -SET(WebCore_LIBRARY_NAME WebCore)
> > -SET(WebKit_LIBRARY_NAME WebKit)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Default library types
> > -# --------------------------------------------------------------------=
---------
> > -OPTION(SHARED_CORE "build WTF, JavaScriptCore and WebCore as shared li=
braries")
> > -
> > -IF (SHARED_CORE)
> > - =A0 =A0SET(WTF_LIBRARY_TYPE SHARED)
> > - =A0 =A0SET(JavaScriptCore_LIBRARY_TYPE SHARED)
> > - =A0 =A0SET(WebCore_LIBRARY_TYPE SHARED)
> > -ELSE ()
> > - =A0 =A0SET(WTF_LIBRARY_TYPE STATIC)
> > - =A0 =A0SET(JavaScriptCore_LIBRARY_TYPE STATIC)
> > - =A0 =A0SET(WebCore_LIBRARY_TYPE STATIC)
> > -ENDIF ()
> > -
> > -SET(WebKit_LIBRARY_TYPE SHARED)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Port-specific options
> > -# --------------------------------------------------------------------=
---------
> > -INCLUDE(OptionsCommon)
> > -INCLUDE(Options${PORT})
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Define packaging
> > -# --------------------------------------------------------------------=
---------
> > -INCLUDE(WebKitPackaging)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Add module directories
> > -# --------------------------------------------------------------------=
---------
> > -ADD_SUBDIRECTORY(JavaScriptCore)
> > -ADD_SUBDIRECTORY(WebCore)
> > -ADD_SUBDIRECTORY(WebKit)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Add test browser if exists
> > -# --------------------------------------------------------------------=
---------
> > -INCLUDE_IF_EXISTS(${WEBKITTOOLS_DIR}/CMakeLists${PORT}.txt)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Set compiler flags for all targets
> > -# --------------------------------------------------------------------=
---------
> > -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WTF_LIBRARY_NAME})
> > -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${JavaScriptCore_LIBRARY_NAME})
> > -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebCore_LIBRARY_NAME})
> > -WEBKIT_SET_EXTRA_COMPILER_FLAGS(${WebKit_LIBRARY_NAME})
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Create the configuration file
> > -# --------------------------------------------------------------------=
---------
> > -CONFIGURE_FILE(cmakeconfig.h.cmake ${CMAKE_BINARY_DIR}/cmakeconfig.h @=
ONLY)
> > -
> > -# --------------------------------------------------------------------=
---------
> > -# Prints a summary of all enabled/disabled features
> > -# --------------------------------------------------------------------=
---------
> > -WEBKIT_PRINT_FEATURES()
> > diff --git a/recipes/webkit/webkit-efl/bug.50752.patch b/recipes/webkit=
/webkit-efl/bug.50752.patch
> > deleted file mode 100644
> > index 2d65f2e..0000000
> > --- a/recipes/webkit/webkit-efl/bug.50752.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -https://bugs.webkit.org/show_bug.cgi?id=3D46258
> > -
> > -diff --git a/WebKit/efl/ChangeLog b/WebKit/efl/ChangeLog
> > -index cfb2f1189e4071cdca7027e81b6fda178ee32490..5ce726ec72fcb530fe0d96=
e77a4e8fc4b8a8c537 100644
> > ---- a/WebKit/efl/ChangeLog
> > -+++ b/WebKit/efl/ChangeLog
> > -@@ -1,3 +1,17 @@
> > -+2010-12-09 =A0Alex Bredariol Grilo =A0<abgrilo@profusion.mobi>
> > -+
> > -+ =A0 =A0 =A0 =A0Reviewed by NOBODY (OOPS!).
> > -+
> > -+ =A0 =A0 =A0 =A0[EFL] Fix scroll operation in WebKit-EFL
> > -+ =A0 =A0 =A0 =A0https://bugs.webkit.org/show_bug.cgi?id=3D50752
> > -+
> > -+ =A0 =A0 =A0 =A0Add the _ewk_view_scroll_add call in WebKit-EFL scrol=
l function. This
> > -+ =A0 =A0 =A0 =A0call was wrongly removed in previous commit and perfo=
rms the scroll
> > -+ =A0 =A0 =A0 =A0operation on the page.
> > -+
> > -+ =A0 =A0 =A0 =A0* ewk/ewk_view.cpp:
> > -+ =A0 =A0 =A0 =A0(ewk_view_scroll):
> > -+
> > - 2010-12-03 =A0Alex Bredariol Grilo =A0<abgrilo@profusion.mobi>
> > -
> > - =A0 =A0 =A0 =A0 Reviewed by Andreas Kling.
> > -diff --git a/WebKit/efl/ewk/ewk_view.cpp b/WebKit/efl/ewk/ewk_view.cpp
> > -index 5147b6d9b7ce518deb8e1b864fe773c1931db42e..d1731e74173b53decd1861=
0657ea4eb97f903397 100644
> > ---- a/WebKit/efl/ewk/ewk_view.cpp
> > -+++ b/WebKit/efl/ewk/ewk_view.cpp
> > -@@ -4075,6 +4075,8 @@ void ewk_view_scroll(Evas_Object* o, Evas_Coord =
dx, Evas_Coord dy, Evas_Coord sx
> > - =A0 =A0 EWK_VIEW_PRIV_GET_OR_RETURN(sd, priv);
> > - =A0 =A0 EINA_SAFETY_ON_TRUE_RETURN(!dx && !dy);
> > -
> > -+ =A0 =A0_ewk_view_scroll_add(priv, dx, dy, sx, sy, sw, sh, main_frame=
);
> > -+
> > - =A0 =A0 _ewk_view_smart_changed(sd);
> > - }
> > -
> > diff --git a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake b/recipes/we=
bkit/webkit-efl/cmakeconfig.h.cmake
> > deleted file mode 100644
> > index b16b985..0000000
> > --- a/recipes/webkit/webkit-efl/cmakeconfig.h.cmake
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -#ifndef CMAKECONFIG_H
> > -#define CMAKECONFIG_H
> > -
> > -#define ENABLE_AS_IMAGE @ENABLE_AS_IMAGE_VALUE@
> > -#define ENABLE_BLOB @ENABLE_BLOB_VALUE@
> > -#define ENABLE_CHANNEL_MESSAGING @ENABLE_CHANNEL_MESSAGING_VALUE@
> > -#define ENABLE_DATABASE @ENABLE_DATABASE_VALUE@
> > -#define ENABLE_DATAGRID @ENABLE_DATAGRID_VALUE@
> > -#define ENABLE_DATALIST @ENABLE_DATALIST_VALUE@
> > -#define ENABLE_DOM_STORAGE @ENABLE_DOM_STORAGE_VALUE@
> > -#define ENABLE_EVENTSOURCE @ENABLE_EVENTSOURCE_VALUE@
> > -#define ENABLE_FAST_MOBILE_SCROLLING @ENABLE_FAST_MOBILE_SCROLLING_VAL=
UE@
> > -#define ENABLE_FILTERS @ENABLE_FILTERS_VALUE@
> > -#define ENABLE_FTPDIR @ENABLE_FTPDIR_VALUE@
> > -#define ENABLE_GEOLOCATION @ENABLE_GEOLOCATION_VALUE@
> > -#define ENABLE_GLIB_SUPPORT @ENABLE_GLIB_SUPPORT_VALUE@
> > -#define ENABLE_ICONDATABASE @ENABLE_ICONDATABASE_VALUE@
> > -#define ENABLE_INSPECTOR @ENABLE_INSPECTOR_VALUE@
> > -#define ENABLE_JAVASCRIPT_DEBUGGER @ENABLE_JAVASCRIPT_DEBUGGER_VALUE@
> > -#define ENABLE_JIT @ENABLE_JIT_VALUE@
> > -#define ENABLE_MATHML @ENABLE_MATHML_VALUE@
> > -#define ENABLE_NETSCAPE_PLUGIN_API @ENABLE_NETSCAPE_PLUGIN_API_VALUE@
> > -#define ENABLE_NOTIFICATIONS @ENABLE_NOTIFICATIONS_VALUE@
> > -#define ENABLE_OFFLINE_WEB_APPLICATIONS @ENABLE_OFFLINE_WEB_APPLICATIO=
NS_VALUE@
> > -#define ENABLE_ORIENTATION_EVENTS @ENABLE_ORIENTATION_EVENTS_VALUE@
> > -#define ENABLE_PROGRESS_TAG @ENABLE_PROGRESS_TAG_VALUE@
> > -#define ENABLE_SHARED_WORKERS @ENABLE_SHARED_WORKERS_VALUE@
> > -#define ENABLE_SVG @ENABLE_SVG_VALUE@
> > -#define ENABLE_SVG_ANIMATION @ENABLE_SVG_ANIMATION_VALUE@
> > -#define ENABLE_SVG_FONTS @ENABLE_SVG_FONTS_VALUE@
> > -#define ENABLE_SVG_FOREIGN_OBJECT @ENABLE_SVG_FOREIGN_OBJECT_VALUE@
> > -#define ENABLE_SVG_USE @ENABLE_SVG_USE_VALUE@
> > -#define ENABLE_VIDEO @ENABLE_VIDEO_VALUE@
> > -#define ENABLE_WEB_SOCKETS @ENABLE_WEB_SOCKETS_VALUE@
> > -#define ENABLE_WML @ENABLE_WML_VALUE@
> > -#define ENABLE_WORKERS @ENABLE_WORKERS_VALUE@
> > -#define ENABLE_XHTMLMP @ENABLE_XHTMLMP_VALUE@
> > -#define ENABLE_XPATH @ENABLE_XPATH_VALUE@
> > -#define ENABLE_XSLT @ENABLE_XSLT_VALUE@
> > -
> > -#endif /* CMAKECONFIG_H */
> > diff --git a/recipes/webkit/webkit-efl/revert.r78057.patch b/recipes/we=
bkit/webkit-efl/revert.r78057.patch
> > new file mode 100644
> > index 0000000..d75f834
> > --- /dev/null
> > +++ b/recipes/webkit/webkit-efl/revert.r78057.patch
> > @@ -0,0 +1,19 @@
> > +see https://bugs.webkit.org/show_bug.cgi?id=3D50762
> > +fixed by:
> > +http://trac.webkit.org/changeset/78047/trunk/Source/WebCore/CMakeLists=
=2Etxt
> > +fix reverted by:
> > +http://trac.webkit.org/changeset/78057/trunk/Source/WebCore/CMakeLists=
=2Etxt
> > +
> > +so revert revert as we care about webkit-efl and don't care about WinCE
> > +
> > +Index: Source/WebCore/CMakeLists.txt
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- Source/WebCore/CMakeLists.txt =A0 =A0 =A0(revision 78042)
> > ++++ Source/WebCore/CMakeLists.txt =A0 =A0 =A0(revision 78047)
> > +@@ -1157,6 +1157,4 @@
> > +
> > + =A0 =A0 platform/Arena.cpp
> > +- =A0 =A0platform/ContextMenu.cpp
> > +- =A0 =A0platform/ContextMenuItem.cpp
> > + =A0 =A0 platform/ContentType.cpp
> > + =A0 =A0 platform/CrossThreadCopier.cpp
> > diff --git a/recipes/webkit/webkit-efl_svn.bb b/recipes/webkit/webkit-e=
fl_svn.bb
> > index da93d78..2785fe8 100644
> > --- a/recipes/webkit/webkit-efl_svn.bb
> > +++ b/recipes/webkit/webkit-efl_svn.bb
> > @@ -4,28 +4,18 @@ DEPENDS =3D "icu libxslt sqlite3 gperf-native bison-n=
ative flex-native jpeg \
> > =A0 =A0 =A0 =A0 =A0 =A0libpng libxt fontconfig cairo freetype glib-2.0 =
libsoup-2.4 \
> > =A0 =A0 =A0 =A0 =A0 =A0libxml2 pango eina ecore evas edje"
> >
> > -# newer revisions are blocked by
> > -# https://bugs.webkit.org/show_bug.cgi?id=3D50762
> > -SRCREV =3D "73534"
> > -PV =3D "1.3.4+svnr${SRCPV}"
> > -PR =3D "r1"
> > +SRCREV =3D "78547"
> > +PV =3D "1.3.11+svnr${SRCPV}"
> >
> > -SRCREV_FORMAT =3D "webcore-rwebkit"
> > +SRCREV_FORMAT =3D "source"
> >
> > =A0SRC_URI =3D "\
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScriptC=
ore;proto=3Dhttp;subdir=3Dsrc \
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScriptG=
lue;proto=3Dhttp;subdir=3Dsrc \
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebCore;pro=
to=3Dhttp;name=3Dwebcore;subdir=3Dsrc \
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKit;prot=
o=3Dhttp;name=3Dwebkit;subdir=3Dsrc \
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitLibra=
ries;proto=3Dhttp;subdir=3Dsrc \
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitTools=
;proto=3Dhttp;subdir=3Dsrc \
> > - =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3Dcmake;proto=
=3Dhttp;subdir=3Dsrc \
> > - =A0file://bug.50752.patch \
> > - =A0file://cmakeconfig.h.cmake \
> > - =A0file://CMakeLists.txt \
> > + =A0svn://svn.webkit.org/repository/webkit/trunk;module=3DSource;name=
=3Dsource;proto=3Dhttp;subdir=3Dsrc \
> > + =A0svn://svn.webkit.org/repository/webkit/trunk/;module=3DTools;proto=
=3Dhttp;subdir=3Dsrc \
> > + =A0file://revert.r78057.patch \
> > =A0"
> >
> > -S =3D "${WORKDIR}/src"
> > +S =3D "${WORKDIR}/src/Source"
> >
> > =A0inherit cmake lib_package pkgconfig
> >
> > @@ -39,15 +29,6 @@ ARM_INSTRUCTION_SET =3D "ARM"
> >
> > =A0EXTRA_OECMAKE =3D "-DPORT=3DEfl -DSHARED_CORE=3DON"
> >
> > -do_unpack_append() {
> > - =A0 =A0 =A0 bb.build.exec_func('do_move_files', d)
> > -}
> > -
> > -do_move_files() {
> > - =A0 =A0 =A0 mv "${WORKDIR}/cmakeconfig.h.cmake" "${S}"
> > - =A0 =A0 =A0 mv "${WORKDIR}/CMakeLists.txt" "${S}"
> > -}
> > -
> > =A0LEAD_SONAME =3D "libewebkit.so"
> > =A0PACKAGES =3D+ "${PN}launcher-dbg ${PN}launcher"
> >
> > --
> > 1.7.4.1
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1a9EEACgkQN1Ujt2V2gBx36wCfZIzAj9PeDvF8zDTweHedu0df
oVwAoI9C9yDJWRSbNnaPpxYqz2fGPJ4r
=3EFq
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
