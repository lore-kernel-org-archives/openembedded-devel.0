Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1Lm6R4-0005EX-Nn
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 14:12:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id CF6B83A00A;
	Tue, 24 Mar 2009 14:11:26 +0100 (CET)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8nvWpKjWBwI; Tue, 24 Mar 2009 14:11:26 +0100 (CET)
Received: from lin01.mn-solutions.de (pD95F9CCF.dip0.t-ipconnect.de
	[217.95.156.207])
	by mx51.mymxserver.com (Postfix) with ESMTP id 6E4F63A003;
	Tue, 24 Mar 2009 14:11:23 +0100 (CET)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id DA4641E0124; Tue, 24 Mar 2009 14:11:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	UPPERCASE_25_50 autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 67F111E012D;
	Tue, 24 Mar 2009 14:11:11 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Mar 2009 14:11:02 +0100
User-Agent: KMail/1.9.7
References: <49BFA406.6030802@bolloretelecom.eu>
	<1d6c95c90903201026g709b2adfja5f5a6f8384cc798@mail.gmail.com>
	<49C8CA6D.6010703@bolloretelecom.eu>
In-Reply-To: <49C8CA6D.6010703@bolloretelecom.eu>
MIME-Version: 1.0
Message-Id: <200903241411.02914.hs4233@mail.mn-solutions.de>
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Tue, 24 Mar 2009 13:12:55 -0000
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_mvNyJh8hgvwClgG"

--Boundary-00=_mvNyJh8hgvwClgG
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Absolutely, I have always wondered why this was done
> separately in OE. Another advantage of doing this is that you
> will always have the right "qmake" to go with your
> headers/libs.

I made my own qtopia-core 4.5 bb file, and this one is doing
qmake/moc/whatever in one go.

I didn't write this recipe with general usage in mind, but maybe
you can pick things up from it. I played a bunch of tricks to get
Qt as small as possible, as my device has only 8 MB Flash. The
resulting libQtCore.so.4.5.0 is now only 1102644 bytes.

I want avr32-linux-uclibc-g++, not avr32-linux-g++

--- q.orig/mkspecs/qws/linux-avr32-g++/qmake.conf
+++ q/mkspecs/qws/linux-avr32-g++/qmake.conf
@@ -7,14 +7,14 @@
 include(../../common/qws.conf)
 
 # modifications to g++.conf
-QMAKE_CC                = avr32-linux-gcc
-QMAKE_CXX               = avr32-linux-g++
-QMAKE_LINK              = avr32-linux-g++
-QMAKE_LINK_SHLIB        = avr32-linux-g++
+QMAKE_CC                = ccache avr32-linux-uclibc-gcc
+QMAKE_CXX               = ccache avr32-linux-uclibc-g++
+QMAKE_LINK              = avr32-linux-uclibc-g++
+QMAKE_LINK_SHLIB        = avr32-linux-uclibc-g++
 
 # modifications to linux.conf
-QMAKE_AR                = avr32-linux-ar cqs
-QMAKE_OBJCOPY           = avr32-linux-objcopy
-QMAKE_STRIP             = avr32-linux-strip
+QMAKE_AR                = avr32-linux-uclibc-ar cqs
+QMAKE_OBJCOPY           = avr32-linux-uclibc-objcopy
+QMAKE_STRIP             = avr32-linux-uclibc-strip
 
 load(qt_config)
The buildsystem also always compiles and linkes 3rdparty/harfbuzz/src, if
you need it or not:

--- q.orig/src/corelib/tools/tools.pri
+++ q/src/corelib/tools/tools.pri
@@ -87,18 +85,4 @@
 #  win32:LIBS += libz.lib
 }
 
-DEFINES += HB_EXPORT=Q_CORE_EXPORT
-INCLUDEPATH += ../3rdparty/harfbuzz/src
-HEADERS += ../3rdparty/harfbuzz/src/harfbuzz.h
-SOURCES += ../3rdparty/harfbuzz/src/harfbuzz-buffer.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-gdef.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-gsub.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-gpos.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-impl.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-open.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-stream.c \
-           ../3rdparty/harfbuzz/src/harfbuzz-shaper-all.cpp \
-           tools/qharfbuzz.cpp
-HEADERS += tools/qharfbuzz_p.h
-
 !macx-icc:unix:LIBS += -lm
QMAKE_INCDIR_X11/QMAKE_LIBDIR_X11 point to paths outside staging

--- q.orig/mkspecs/common/linux.conf
+++ q/mkspecs/common/linux.conf
@@ -7,8 +7,8 @@
 
 QMAKE_INCDIR          =
 QMAKE_LIBDIR          =
-QMAKE_INCDIR_X11      = /usr/X11R6/include
-QMAKE_LIBDIR_X11      = /usr/X11R6/lib
+QMAKE_INCDIR_X11      =
+QMAKE_LIBDIR_X11      =
 QMAKE_INCDIR_QT       = $$[QT_INSTALL_HEADERS]
 QMAKE_LIBDIR_QT       = $$[QT_INSTALL_LIBS]
 QMAKE_INCDIR_OPENGL   = /usr/X11R6/include
Forces CFG_IPV6 and CFG_IPV6IFNAME in ./configure to "no".

--- q.orig/configure
+++ q/configure
@@ -565,7 +565,7 @@
 CFG_SSE=auto
 CFG_SSE2=auto
 CFG_REDUCE_RELOCATIONS=no
-CFG_IPV6=auto
+CFG_IPV6=no
 CFG_NAS=no
 CFG_QWS_DEPTHS=all
 CFG_USER_BUILD_KEY=
@@ -580,7 +580,7 @@
 CFG_CLOCK_MONOTONIC=auto
 CFG_MREMAP=auto
 CFG_GETADDRINFO=auto
-CFG_IPV6IFNAME=auto
+CFG_IPV6IFNAME=no
 CFG_GETIFADDRS=auto
 CFG_INOTIFY=auto
 CFG_RPATH=yes
I don't use unicode and won't need QTextBoundaryFinder at all

--- q.orig/src/corelib/tools/tools.pri
+++ q/src/corelib/tools/tools.pri
@@ -32,7 +32,6 @@
 	tools/qstring.h \
 	tools/qstringlist.h \
 	tools/qstringmatcher.h \
-	tools/qtextboundaryfinder.h \
 	tools/qtimeline.h \
 	tools/qunicodetables_p.h \
 	tools/qvarlengtharray.h \
@@ -60,7 +59,6 @@
         tools/qsize.cpp \
 	tools/qstring.cpp \
 	tools/qstringlist.cpp \
-	tools/qtextboundaryfinder.cpp \
 	tools/qtimeline.cpp \
 	tools/qvector.cpp \
         tools/qvsnprintf.cpp
Use ccache when compiling qmake & moc:

--- q.orig/mkspecs/common/g++.conf
+++ q/mkspecs/common/g++.conf
@@ -2,7 +2,7 @@
 # qmake configuration for common gcc
 #
 
-QMAKE_CC		= gcc
+QMAKE_CC		= ccache gcc
 QMAKE_CFLAGS		+= -pipe
 QMAKE_CFLAGS_DEPS	+= -M
 QMAKE_CFLAGS_WARN_ON	+= -Wall -W
@@ -16,7 +16,7 @@
 QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
 QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
 
-QMAKE_CXX		= g++
+QMAKE_CXX		= ccache g++
 QMAKE_CXXFLAGS		+= $$QMAKE_CFLAGS
 QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
 QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
Fixes that c Qt 4.5.0 with #define QT_NO_DEBUG_STREAM fails.

Reported upstream:
http://www.qtsoftware.com/developer/task-tracker/index_html?method=entry&id=247017

--- q.orig/src/corelib/kernel/qabstractitemmodel.cpp
+++ q/src/corelib/kernel/qabstractitemmodel.cpp
@@ -525,7 +525,8 @@
         if (data->index.isValid()) {
             persistent.insertMultiAtEnd(data->index, data);
         } else {
-            qWarning() << "QAbstractItemModel::endInsertRows:  Invalid index (" << old.row() + count << "," << old.column() << ") in model" << q_func();
+            qWarning("QAbstractItemModel::rowsInserted:  Invalid index (%d, %d) in model %p",
+		old.row() + count, old.column(), q_func());
         }
     }
 }
@@ -574,7 +575,8 @@
         if (data->index.isValid()) {
             persistent.insertMultiAtEnd(data->index, data);
         } else {
-            qWarning() << "QAbstractItemModel::endRemoveRows:  Invalid index (" << old.row() + count << "," << old.column() << ") in model" << q_func();
+            qWarning("QAbstractItemModel::rowsRemoved:  Invalid index (%d, %d) in model %p",
+		old.row() + count, old.column(), q_func());
         }
     }
     QVector<QPersistentModelIndexData *> persistent_invalidated = persistent.invalidated.pop();
@@ -619,7 +621,8 @@
         if (data->index.isValid()) {
             persistent.insertMultiAtEnd(data->index, data);
         } else {
-            qWarning() << "QAbstractItemModel::endInsertColumns:  Invalid index (" << old.row() + count << "," <<old.column() << ") in model" << q_func();
+            qWarning("QAbstractItemModel::columnsInserted:  Invalid index (%d, %d) in model %p",
+		old.row() + count, old.column(), q_func());
         }
      }
 }
@@ -669,7 +672,8 @@
         if (data->index.isValid()) {
             persistent.insertMultiAtEnd(data->index, data);
         } else {
-            qWarning() << "QAbstractItemModel::endRemoveRows:  Invalid index (" << old.row() + count << "," << old.column() << ") in model" << q_func();
+            qWarning("QAbstractItemModel::columnsRemoved:  Invalid index (%d, %d) in model %p",
+		old.row() + count, old.column(), q_func());
         }
     }
     QVector<QPersistentModelIndexData *> persistent_invalidated = persistent.invalidated.pop();
Even with QT_NO_CODECS and friends does src/corelib/codecs and
plugins/codecs get compiled and linked in.

--- q.orig/src/plugins/plugins.pro
+++ q/src/plugins/plugins.pro
@@ -2,7 +2,7 @@
 
 SUBDIRS	*= accessible imageformats sqldrivers iconengines script
 unix {
-        contains(QT_CONFIG,iconv)|contains(QT_CONFIG,gnu-libiconv):SUBDIRS *= codecs
+        #contains(QT_CONFIG,iconv)|contains(QT_CONFIG,gnu-libiconv):SUBDIRS *= codecs
 } else {
         SUBDIRS *= codecs
 }
--- q.orig/src/corelib/codecs/codecs.pri
+++ q/src/corelib/codecs/codecs.pri
@@ -18,7 +18,7 @@
 	codecs/qutfcodec.cpp \
 	codecs/qtextcodecplugin.cpp
 
-unix {
+disabled {
 	SOURCES += codecs/qfontlaocodec.cpp
 
         contains(QT_CONFIG,iconv) {

/* Data structures */
#ifndef QT_NO_QUUID_STRING
#  define QT_NO_QUUID_STRING
#endif
#ifndef QT_NO_STL
#  define QT_NO_STL
#endif
#ifndef QT_NO_TEXTDATE
#  define QT_NO_TEXTDATE
#endif
#ifndef QT_NO_DATESTRING
#  define QT_NO_DATESTRING
#endif

/* Misc */
#ifndef QT_NO_CAST_TO_ASCII
#	define QT_NO_CAST_TO_ASCII
#endif
#ifndef QT_CHECK_RANGE
#	define QT_CHECK_RANGE
#endif
#ifndef QT_NO_MEMBER_TEMPLATES
#	define QT_NO_MEMBER_TEMPLATES
#endif
#ifndef QT_NO_GEOM_VARIANT
#	define QT_NO_GEOM_VARIANT
#endif
#ifndef QT_NO_COMPONENT
#	define QT_NO_COMPONENT
#endif

/* Dialogs */
#ifndef QT_NO_MESSAGEBOX
#  define QT_NO_MESSAGEBOX
#endif
#ifndef QT_NO_WIZARD
#  define QT_NO_WIZARD
#endif

/* File I/O */
#ifndef QT_NO_DOM
#  define QT_NO_DOM
#endif
#ifndef QT_NO_FILESYSTEMMODEL
#  define QT_NO_FILESYSTEMMODEL
#endif
#ifndef QT_NO_LIBRARY
#  define QT_NO_LIBRARY
#endif
#ifndef QT_NO_FILESYSTEMWATCHER
#	define QT_NO_FILESYSTEMWATCHER
#endif
#ifndef QT_NO_COMPRESS
# define QT_NO_COMPRESS
#endif
#ifndef QT_NO_DEBUG_STREAM
#	define QT_NO_DEBUG_STREAM
#endif

/* Fonts */
#ifndef QT_NO_FREETYPE
#  define QT_NO_FREETYPE
#endif
#ifndef QT_NO_QWS_QPF
#  define QT_NO_QWS_QPF
#endif
#ifndef QT_NO_QWS_QPF2
#  define QT_NO_QWS_QPF2
#endif

/* Images */
#ifndef QT_NO_ICON
#  define QT_NO_ICON
#endif
#ifndef QT_NO_IMAGEFORMATPLUGIN
#  define QT_NO_IMAGEFORMATPLUGIN
#endif
#ifndef QT_NO_IMAGEFORMAT_BMP
#  define QT_NO_IMAGEFORMAT_BMP
#endif
#ifndef QT_NO_IMAGEFORMAT_JPEG
#  define QT_NO_IMAGEFORMAT_JPEG
#endif
#ifndef QT_NO_IMAGEFORMAT_PNG
#  define QT_NO_IMAGEFORMAT_PNG
#endif
#ifndef QT_NO_IMAGEFORMAT_PPM
#  define QT_NO_IMAGEFORMAT_PPM
#endif
#ifndef QT_NO_IMAGEFORMAT_XBM
#  define QT_NO_IMAGEFORMAT_XBM
#endif
#ifndef QT_NO_IMAGEFORMAT_XPM
#  define QT_NO_IMAGEFORMAT_XPM
#endif
#ifndef QT_NO_IMAGE_HEURISTIC_MASK
#  define QT_NO_IMAGE_HEURISTIC_MASK
#endif
#ifndef QT_NO_IMAGE_TEXT
#  define QT_NO_IMAGE_TEXT
#endif
#ifndef QT_NO_MOVIE
#  define QT_NO_MOVIE
#endif

/* Internationalization */
#ifndef QT_NO_BIG_CODECS
#  define QT_NO_BIG_CODECS
#endif
#ifndef QT_NO_QWS_INPUTMETHODS
#  define QT_NO_QWS_INPUTMETHODS
#endif
#ifndef QT_NO_TEXTCODEC
#  define QT_NO_TEXTCODEC
#endif
#ifndef QT_NO_CODECS
#  define QT_NO_CODECS
#endif
#ifndef QT_NO_TEXTCODECPLUGIN
#  define QT_NO_TEXTCODECPLUGIN
#endif
#ifndef QT_NO_UNICODETABLES
#	define QT_NO_UNICODETABLES
#endif
#ifndef QT_NO_TRANSLATION
#  define QT_NO_TRANSLATION
#endif
#ifndef QT_NO_TRANSLATION_UTF8
#  define QT_NO_TRANSLATION_UTF8
#endif

/* Kernel */
#ifndef QT_NO_ACTION
#  define QT_NO_ACTION
#endif
#ifndef QT_NO_CSSPARSER
#  define QT_NO_CSSPARSER
#endif
#ifndef QT_NO_CURSOR
#  define QT_NO_CURSOR
#endif
#ifndef QT_NO_EFFECTS
#  define QT_NO_EFFECTS
#endif
#ifndef QT_NO_SESSIONMANAGER
#  define QT_NO_SESSIONMANAGER
#endif
#ifndef QT_NO_SHORTCUT
#  define QT_NO_SHORTCUT
#endif
#ifndef QT_NO_SOUND
#  define QT_NO_SOUND
#endif
#ifndef QT_NO_TABLETEVENT
#  define QT_NO_TABLETEVENT
#endif
#ifndef QT_NO_TEXTHTMLPARSER
#  define QT_NO_TEXTHTMLPARSER
#endif
#ifndef QT_NO_WHEELEVENT
#  define QT_NO_WHEELEVENT
#endif
#ifndef QT_NO_XMLSTREAM
#  define QT_NO_XMLSTREAM
#endif
#ifndef QT_NO_XMLSTREAMREADER
#  define QT_NO_XMLSTREAMREADER
#endif
#ifndef QT_NO_XMLSTREAMWRITER
#  define QT_NO_XMLSTREAMWRITER
#endif
#ifndef QT_NO_THREAD
#  define QT_NO_THREAD
#endif
#ifndef QT_NO_DUMPER
#	define QT_NO_DUMPER
#endif

/* Networking */
#ifndef QT_NO_COP
#  define QT_NO_COP
#endif
#ifndef QT_NO_HOSTINFO
#  define QT_NO_HOSTINFO
#endif
#ifndef QT_NO_HTTP
#  define QT_NO_HTTP
#endif
#ifndef QT_NO_NETWORKPROXY
#  define QT_NO_NETWORKPROXY
#endif
#ifndef QT_NO_SOCKS5
#  define QT_NO_SOCKS5
#endif
#ifndef QT_NO_UDPSOCKET
#  define QT_NO_UDPSOCKET
#endif
#ifndef QT_NO_URLINFO
#  define QT_NO_URLINFO
#endif
#ifndef QT_NO_FTP
#  define QT_NO_FTP
#endif

/* Painting */
#ifndef QT_NO_COLORNAMES
#  define QT_NO_COLORNAMES
#endif
#ifndef QT_NO_DIRECTPAINTER
#  define QT_NO_DIRECTPAINTER
#endif
#ifndef QT_NO_PAINTONSCREEN
#  define QT_NO_PAINTONSCREEN
#endif
#ifndef QT_NO_PAINT_DEBUG
#  define QT_NO_PAINT_DEBUG
#endif
#ifndef QT_NO_PICTURE
#  define QT_NO_PICTURE
#endif
#ifndef QT_NO_PRINTER
#  define QT_NO_PRINTER
#endif
#ifndef QT_NO_CUPS
#  define QT_NO_CUPS
#endif
#ifndef QT_NO_RASTERCALLBACKS
#  define QT_NO_RASTERCALLBACKS
#endif

/* Qt for Embedded Linux */
#ifndef QT_NO_QWSEMBEDWIDGET
#  define QT_NO_QWSEMBEDWIDGET
#endif
#ifndef QT_NO_QWS_ALPHA_CURSOR
#  define QT_NO_QWS_ALPHA_CURSOR
#endif
#ifndef QT_NO_QWS_CURSOR
#  define QT_NO_QWS_CURSOR
#endif
#ifndef QT_NO_QWS_DECORATION_DEFAULT
#  define QT_NO_QWS_DECORATION_DEFAULT
#endif
#ifndef QT_NO_QWS_DECORATION_STYLED
#  define QT_NO_QWS_DECORATION_STYLED
#endif
#ifndef QT_NO_QWS_DECORATION_WINDOWS
#  define QT_NO_QWS_DECORATION_WINDOWS
#endif
#ifndef QT_NO_QWS_MANAGER
#  define QT_NO_QWS_MANAGER
#endif
#ifndef QT_NO_QWS_KEYBOARD
#  define QT_NO_QWS_KEYBOARD
#endif
#ifndef QT_NO_QWS_MOUSE
#  define QT_NO_QWS_MOUSE
#endif
#ifndef QT_NO_QWS_MOUSE_AUTO
#  define QT_NO_QWS_MOUSE_AUTO
#endif
#ifndef QT_NO_QWS_MOUSE_MANUAL
#  define QT_NO_QWS_MOUSE_MANUAL
#endif
#ifndef QT_NO_QWS_MULTIPROCESS
#  define QT_NO_QWS_MULTIPROCESS
#endif
#ifndef QT_NO_QWS_SOUNDSERVER
#  define QT_NO_QWS_SOUNDSERVER
#endif
#ifndef QT_NO_SXE
#  define QT_NO_SXE
#endif
#ifndef QT_NO_QWS_PROPERTIES
#  define QT_NO_QWS_PROPERTIES
#endif
#ifndef QT_NO_QWS_PROXYSCREEN
#  define QT_NO_QWS_PROXYSCREEN
#endif
#ifndef QT_NO_QWS_DYNAMICSCREENTRANSFORMATION
#  define QT_NO_QWS_DYNAMICSCREENTRANSFORMATION
#endif

/* SVG */
#ifndef QT_NO_SVG
#  define QT_NO_SVG
#endif
#ifndef QT_NO_SVGGENERATOR
#  define QT_NO_SVGGENERATOR
#endif
#ifndef QT_NO_SVGRENDERER
#  define QT_NO_SVGRENDERER
#endif
#ifndef QT_NO_SVGWIDGET
#  define QT_NO_SVGWIDGET
#endif

/* Styles */
#ifndef QT_NO_STYLE_MOTIF
#  define QT_NO_STYLE_MOTIF
#endif
#ifndef QT_NO_STYLE_CDE
#  define QT_NO_STYLE_CDE
#endif
#ifndef QT_NO_STYLE_WINDOWS
#  define QT_NO_STYLE_WINDOWS
#endif
#ifndef QT_NO_STYLE_CLEANLOOKS
#  define QT_NO_STYLE_CLEANLOOKS
#endif
#ifndef QT_NO_STYLE_PLASTIQUE
#  define QT_NO_STYLE_PLASTIQUE
#endif
#ifndef QT_NO_STYLE_STYLESHEET
#  define QT_NO_STYLE_STYLESHEET
#endif
#ifndef QT_NO_STYLE_WINDOWSCE
#  define QT_NO_STYLE_WINDOWSCE
#endif
#ifndef QT_NO_STYLE_WINDOWSMOBILE
#  define QT_NO_STYLE_WINDOWSMOBILE
#endif
#ifndef QT_NO_STYLE_WINDOWSXP
#  define QT_NO_STYLE_WINDOWSXP
#endif

/* Utilities */
#ifndef QT_NO_ACCESSIBILITY
#  define QT_NO_ACCESSIBILITY
#endif
#ifndef QT_NO_DESKTOPSERVICES
#  define QT_NO_DESKTOPSERVICES
#endif
#ifndef QT_NO_SCRIPT
#  define QT_NO_SCRIPT
#endif
#ifndef QT_NO_SYSTEMTRAYICON
#  define QT_NO_SYSTEMTRAYICON
#endif
#ifndef QT_NO_UNDOCOMMAND
#  define QT_NO_UNDOCOMMAND
#endif
#ifndef QT_NO_UNDOSTACK
#  define QT_NO_UNDOSTACK
#endif

/* Widgets */
#ifndef QT_NO_GROUPBOX
#  define QT_NO_GROUPBOX
#endif
#ifndef QT_NO_BUTTONGROUP
#  define QT_NO_BUTTONGROUP
#endif
#ifndef QT_NO_LCDNUMBER
#  define QT_NO_LCDNUMBER
#endif
#ifndef QT_NO_LINEEDIT
#  define QT_NO_LINEEDIT
#endif
#ifndef QT_NO_MENU
#  define QT_NO_MENU
#endif
#ifndef QT_NO_CONTEXTMENU
#  define QT_NO_CONTEXTMENU
#endif
#ifndef QT_NO_PROGRESSBAR
#  define QT_NO_PROGRESSBAR
#endif
#ifndef QT_NO_RESIZEHANDLER
#  define QT_NO_RESIZEHANDLER
#endif
#ifndef QT_NO_RUBBERBAND
#  define QT_NO_RUBBERBAND
#endif
#ifndef QT_NO_SPLITTER
#  define QT_NO_SPLITTER
#endif
#ifndef QT_NO_SIGNALMAPPER
#  define QT_NO_SIGNALMAPPER
#endif
#ifndef QT_NO_SIZEGRIP
#  define QT_NO_SIZEGRIP
#endif
#ifndef QT_NO_SLIDER
#  define QT_NO_SLIDER
#endif
#ifndef QT_NO_DIAL
#  define QT_NO_DIAL
#endif
#ifndef QT_NO_SCROLLBAR
#  define QT_NO_SCROLLBAR
#endif
#ifndef QT_NO_SCROLLAREA
#  define QT_NO_SCROLLAREA
#endif
#ifndef QT_NO_GRAPHICSVIEW
#  define QT_NO_GRAPHICSVIEW
#endif
#ifndef QT_NO_PRINTPREVIEWWIDGET
#  define QT_NO_PRINTPREVIEWWIDGET
#endif
#ifndef QT_NO_MDIAREA
#  define QT_NO_MDIAREA
#endif
#ifndef QT_NO_TEXTEDIT
#  define QT_NO_TEXTEDIT
#endif
#ifndef QT_NO_SYNTAXHIGHLIGHTER
#  define QT_NO_SYNTAXHIGHLIGHTER
#endif
#ifndef QT_NO_TEXTBROWSER
#  define QT_NO_TEXTBROWSER
#endif
#ifndef QT_NO_SPINWIDGET
#  define QT_NO_SPINWIDGET
#endif
#ifndef QT_NO_SPLASHSCREEN
#  define QT_NO_SPLASHSCREEN
#endif
#ifndef QT_NO_STACKEDWIDGET
#  define QT_NO_STACKEDWIDGET
#endif
#ifndef QT_NO_STATUSBAR
#  define QT_NO_STATUSBAR
#endif
#ifndef QT_NO_STATUSTIP
#  define QT_NO_STATUSTIP
#endif
#ifndef QT_NO_TABLEWIDGET
#  define QT_NO_TABLEWIDGET
#endif
#ifndef QT_NO_TOOLBUTTON
#  define QT_NO_TOOLBUTTON
#endif
#ifndef QT_NO_TABBAR
#  define QT_NO_TABBAR
#endif
#ifndef QT_NO_TOOLBOX
#  define QT_NO_TOOLBOX
#endif
#ifndef QT_NO_WHATSTHIS
#  define QT_NO_WHATSTHIS
#endif
#ifndef QT_NO_TOOLTIP
#  define QT_NO_TOOLTIP
#endif
#ifndef QT_NO_TREEWIDGET
#  define QT_NO_TREEWIDGET
#endif
#ifndef QT_NO_VALIDATOR
#  define QT_NO_VALIDATOR
#endif

/* Windows */
#ifndef QT_NO_WIN_ACTIVEQT
#  define QT_NO_WIN_ACTIVEQT
#endif
SUMMARY = "Qt is a versatile cross-platform application framework -- this is just the gui-less CORE library"
SECTION = "libs"
LICENSE = "GPL"
PRIORITY = "optional"
HOMEPAGE = "http://www.qtsoftware.com"
DEPENDS = "zlib"
RPROVIDES = "libqtcore4"
PR = "r1"

SRC_URI = "ftp://ftp.qtsoftware.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2"
SRC_URI += "file://qconfig-mn.h"

# Compiling Qt 4.5.0 with #define QT_NO_DEBUG_STREAM fails no longer:
# http://www.qtsoftware.com/developer/task-tracker/index_html?method=entry&id=247017
SRC_URI += "file://fix-no-debug-stream.patch;patch=1"

# Use ccache when compiling qmake & moc:
SRC_URI += "file://host-gcc-use-ccache.patch;patch=1"

# QMAKE_INCDIR_X11/QMAKE_LIBDIR_X11 point to paths outside staging:
SRC_URI += "file://dont-set-QMAKE_INCDIR_X11.patch;patch=1"

# I want avr32-linux-uclibc-g++, not avr32-linux-g++:
SRC_URI += "file://avr32-gcc-uclibc-prefix.patch;patch=1"

# Forces CFG_IPV6 and CFG_IPV6IFNAME in ./configure to "no":
SRC_URI += "file://force-no-ipv6.patch;patch=1"

# Even with QT_NO_CODECS and friends does src/corelib/codecs and
# plugins/codecs get compiled and linked in.
SRC_URI += "file://force-no-codecs.patch;patch=1"

# I don't use unicode and won't need QTextBoundaryFinder at all
SRC_URI += "file://force-no-qtextboundaryfinder.patch;patch=1"

# The buildsystem also always compiles and linkes 3rdparty/harfbuzz/src
# into the library, if you need it or not:
SRC_URI += "file://force-no-harfbuzz.patch;patch=1"


S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"

QMAKESPEC="linux-avr32-g++"

do_configure () {
	unset QMAKESPEC
	unset QTDIR
	unset CC
	unset CXX
	unset CFLAGS
	unset CXXFLAGS
	unset LD
	unset LDFLAGS
	cp ${WORKDIR}/qconfig-mn.h ${S}/src/corelib/global
	# Add -static to make the filesystem small, but the binary big
	echo yes | ./configure \
		-fast \
		-prefix /usr \
		-bindir ${STAGING_BINDIR_NATIVE} \
		-libdir ${STAGING_LIBDIR} \
		-headerdir ${STAGING_INCDIR}/qt4 \
		-datadir /usr/share/qt4 \
		-sysconfdir /etc/qt4 \
		-plugindir /usr/lib/qt4/plugins \
		-qconfig mn \
		-no-pch \
		-no-gstreamer \
		-no-largefile \
		-no-exceptions \
		-no-accessibility \
		-no-stl \
		-no-qt3support \
		-no-xmlpatterns \
		-no-phonon \
		-no-phonon-backend \
		-no-scripttools \
		-no-svg \
		-no-webkit \
		-no-gif \
		-no-libtiff \
		-no-libpng \
		-no-libmng \
		-no-libjpeg \
		-no-openssl \
		-no-sql-ibase \
		-no-sql-mysql \
		-no-sql-odbc \
		-no-sql-psql \
		-no-sql-sqlite \
		-no-sql-sqlite2 \
		-no-decoration-styled \
		-no-decoration-windows \
		-no-decoration-default \
		-no-kbd-tty \
		-no-mouse-pc \
		-no-mouse-linuxtp \
		-no-gfx-linuxfb \
		-no-gfx-multiscreen \
		-no-rpath \
		-no-nis \
		-no-cups \
		-no-iconv \
		-no-dbus \
		-no-freetype \
		-no-glib \
		-nomake tools \
		-nomake demos \
		-nomake examples \
		-nomake docs \
		-nomake translations \
		-verbose \
		-platform linux-g++ \
		-xplatform qws/${QMAKESPEC} \
		-embedded ${HOST_ARCH} \
		-big-endian
}


do_compile () {
	unset QMAKESPEC
	unset QTDIR
	unset CC
	unset CXX
	unset CFLAGS
	unset CXXFLAGS
	unset LD
	unset LDFLAGS
	cd ${S}/src/tools/bootstrap; make -f Makefile
	cd ${S}/src/tools/moc; make -f Makefile
	cd ${S}/src/tools/rcc; make -f Makefile
	cd ${S}/src/corelib; make -f Makefile
}

do_install () {
	oe_libinstall -C lib libQtCore ${D}/${libdir}
}

do_stage () {
	# the lib and tools:
	oe_libinstall -C lib libQtCore ${STAGING_LIBDIR}
	install bin/qmake ${STAGING_BINDIR_NATIVE}
	install bin/rcc ${STAGING_BINDIR_NATIVE}
	install bin/moc ${STAGING_BINDIR_NATIVE}

	# specs for qmake:
	install -d ${STAGING_DIR}/qmake4
	cp -dfR mkspecs/qws ${STAGING_DIR}/qmake4
	cp -dfR mkspecs/linux-g++ ${STAGING_DIR}/qmake4
	cp -dfR mkspecs/common ${STAGING_DIR}/qmake4

	# all headers:
	cd ${S}/src/corelib; make -f Makefile install_flat_headers install_targ_headers
}

--Boundary-00=_mvNyJh8hgvwClgG--
