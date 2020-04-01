Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.710.1585771952377427725
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 13:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P3yPwOGu;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id d202so1200101wmd.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2020 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FF2VoIP94SasdKCc/HUAiVKwAxgMtv+pxL93rUU8wrk=;
        b=P3yPwOGukGf9naRJ4/fmTu3exlMvuVlQdZ6BRdbYJp1hSOvCoBRXepYjAdVCsdcWKV
         MPWTHlyA5j6GI5OAXzcYfTb6vwYD4FCq1uHT6klG1VfC5hPg8eCWg4kPCYpgnCgiMj1y
         JehUGjHmfJbWWQ93j++/8w4VPe96WsSc6pBOTCHHvOky7o6X0Pf080fJEF2n+emrVaOR
         H8NrJA8+3QfacMJoxaD6sUbluW1qyphhqZ+Yi7eCbIM+F2ibQawAJXJ86maZ5CXDy295
         KgkMc7PAFFktht6+BKNSxkGdUExcIa1f/ggGGL6bU5cm5eZL1FX2733vjQNMYPVrJfvT
         7F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FF2VoIP94SasdKCc/HUAiVKwAxgMtv+pxL93rUU8wrk=;
        b=hiSQlGIvNeJz2xV4GKOyyIZCVP2qMdR3gSi81aDJ1UtVhRM5U75jJQ/4L8Cb8IGNI3
         Hngs72vGwJtjlTXDESyjSrTfmz5gqk8r1t43Oo/82gz+9HkWLeeblGdTqcHW80dsAKKg
         z7BAimybY4PovGJDZgQCAp1gIV3xFyy5yfhqd51Sbn5VwioPc1sJFXIPwnqzGp4r8fd/
         vjp/TRV0gz5gosRTBgxWVWUOlppwg33HNAzFnsVNiPZNe6oDrvss8TTztfmZXnZmOzkB
         988m8psgeCuNOssNAPq2WLDErs6SqW7K1aep8+KEs9gH6n/4MKIFj0s6VouNWln5Gisx
         UrOA==
X-Gm-Message-State: AGi0Pual3KLHTy42jlsfCCJNl8fJo9s40QXC8Hd/GgfIctnJLeOLyxw2
	uqTNt5CQ36z2jXOGEjyN9SEW68dNiO4=
X-Google-Smtp-Source: APiQypLMEohnjIWFTIu6NZKYlFKGSCkk7X8b7Hei9PiRkhJ4sgqWYZUhS0boxbTbHpAEjO26VcJeUA==
X-Received: by 2002:a05:600c:220f:: with SMTP id z15mr74191wml.185.1585771950502;
        Wed, 01 Apr 2020 13:12:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030902931B45A4944A4AD2.dip0.t-ipconnect.de. [2003:f0:7f03:902:931b:45a4:944a:4ad2])
        by smtp.gmail.com with ESMTPSA id j11sm3939512wmi.33.2020.04.01.13.12.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:12:29 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] wxwidgets: initial add 3.1.3
Date: Wed,  1 Apr 2020 22:12:17 +0200
Message-Id: <20200401201217.11809-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200401201217.11809-1-schnitzeltony@gmail.com>
References: <20200401201217.11809-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* need it for 0.a.d and audacity
* did extensive testing with PACKAGECONFIG combinations (exception: mspack -
  libmspack is in meta-security)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v1 -> v2: Fix musl build

 meta-oe/licenses/wxWidgets                    | 54 ++++++++++++
 .../wxwidgets/wxwidgets_git.bb                | 82 +++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 meta-oe/licenses/wxWidgets
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb

diff --git a/meta-oe/licenses/wxWidgets b/meta-oe/licenses/wxWidgets
new file mode 100644
index 000000000..0f6b9d6a8
--- /dev/null
+++ b/meta-oe/licenses/wxWidgets
@@ -0,0 +1,54 @@
+                wxWindows Library Licence, Version 3.1
+                ======================================
+
+  Copyright (c) 1998-2005 Julian Smart, Robert Roebling et al
+
+  Everyone is permitted to copy and distribute verbatim copies
+  of this licence document, but changing it is not allowed.
+
+                       WXWINDOWS LIBRARY LICENCE
+     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  This library is free software; you can redistribute it and/or modify it
+  under the terms of the GNU Library General Public Licence as published by
+  the Free Software Foundation; either version 2 of the Licence, or (at
+  your option) any later version.
+
+  This library is distributed in the hope that it will be useful, but
+  WITHOUT ANY WARRANTY; without even the implied warranty of
+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Library
+  General Public Licence for more details.
+
+  You should have received a copy of the GNU Library General Public Licence
+  along with this software, usually in a file named COPYING.LIB.  If not,
+  write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
+  Boston, MA 02110-1301 USA.
+
+  EXCEPTION NOTICE
+
+  1. As a special exception, the copyright holders of this library give
+  permission for additional uses of the text contained in this release of
+  the library as licenced under the wxWindows Library Licence, applying
+  either version 3.1 of the Licence, or (at your option) any later version of
+  the Licence as published by the copyright holders of version
+  3.1 of the Licence document.
+
+  2. The exception is that you may use, copy, link, modify and distribute
+  under your own terms, binary object code versions of works based
+  on the Library.
+
+  3. If you copy code from files distributed under the terms of the GNU
+  General Public Licence or the GNU Library General Public Licence into a
+  copy of this library, as this licence permits, the exception does not
+  apply to the code that you add in this way.  To avoid misleading anyone as
+  to the status of such modified files, you must delete this exception
+  notice from such code and/or adjust the licensing conditions notice
+  accordingly.
+
+  4. If you write modifications of your own for this library, it is your
+  choice whether to permit this exception to apply to your modifications.
+  If you do not wish that, you must delete the exception notice from such
+  code and/or adjust the licensing conditions notice accordingly.
+
+
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
new file mode 100644
index 000000000..06337b79c
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -0,0 +1,82 @@
+SUMMARY = "Cross-Plattform GUI Library"
+DESCRIPTIOM = "wxWidgets is a free and open source cross-platform C++ framework for writing advanced GUI applications using native controls."
+HOMEPAGE = "https://www.wxwidgets.org/"
+BUGTRACKER = "https://trac.wxwidgets.org/"
+
+# wxWidgets licence is a modified version of LGPL explicitly allowing not
+# distributing the sources of an application using the library even in the
+# case of static linking.
+LICENSE = "wxWidgets"
+LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
+inherit features_check lib_package
+
+# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"
+
+DEPENDS += " \
+    jpeg \
+    libpng \
+    tiff \
+"
+
+SRC_URI = "git://github.com/wxWidgets/wxWidgets.git"
+PV = "3.1.3"
+SRCREV= "8a40d23b27ed1c80b5a2ca9f7e8461df4fbc1a31"
+S = "${WORKDIR}/git"
+
+# These can be either 'builtin' or 'sys' and builtin means cloned soures are
+# build. So these cannot be PACKAGECONFIGs and let's use libs where we can (see
+# DEPENDS)
+EXTRA_OECMAKE += " \
+    -DwxUSE_LIBJPEG=sys \
+    -DwxUSE_LIBPNG=sys \
+    -DwxUSE_LIBTIFF=sys \
+    -DwxUSE_REGEX=builtin \
+"
+EXTRA_OECMAKE_append_libc-musl = " \
+    -DHAVE_LOCALE_T=OFF \
+"
+
+PACKAGECONFIG ?= "gtk"
+
+# Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
+PACKAGECONFIG[no_gui] = "-DwxUSE_GUI=OFF,,,,,qt gtk"
+PACKAGECONFIG[gtk] = "-DwxBUILD_TOOLKIT=gtk3 -DwxUSE_GUI=ON,,gtk+3,,,no_gui qt"
+PACKAGECONFIG[qt] = "-DwxBUILD_TOOLKIT=qt  -DwxUSE_GUI=ON,,qtbase,,,no_gui gtk"
+python () {
+    pkgconfig = d.getVar('PACKAGECONFIG')
+    if (not 'no_gui' in pkgconfig) and (not 'gtk' in pkgconfig) and (not 'qt' in pkgconfig):
+        bb.error("PACKAGECONFIG must select a toolkit. Add one of no_gui / gtk / qt!")
+}
+
+# Notes on other PACKAGECONFIGs:
+# * 'no_gui' overrides some configs below so they are marked as conflicting
+#   with 'no_gui' to avoid surprises
+# * qt+gstreamer is broken due to incorrect references on glib-2.0 -> mark
+#   as conflicting
+# * wxUSE_LIBGNOMEVFS is for gtk2 (see init.cmake) which we don't support
+#   -> no gvfs PACKAGECONFIG
+# * libmspack is in meta-security
+PACKAGECONFIG[gstreamer] = "-DwxUSE_MEDIACTRL=ON,-DwxUSE_MEDIACTRL=OFF,gstreamer1.0-plugins-base,,,no_gui qt"
+PACKAGECONFIG[libsecret] = "-DwxUSE_SECRETSTORE=ON,-DwxUSE_SECRETSTORE=OFF,libsecret,,,no_gui"
+PACKAGECONFIG[lzma] = "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
+PACKAGECONFIG[mspack] = "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
+PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
+PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
+
+do_install_append() {
+    # do not ship bindir if empty
+    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+}
+
+# lib names are not canonical
+FILES_SOLIBSDEV = ""
+
+FILES_${PN} += " \
+    ${libdir}/libwx_*.so \
+    ${libdir}/wx/ \
+"
+
+FILES_${PN}-dev += "${libdir}/wx/include/"
-- 
2.21.1

