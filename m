Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.12284.1612990562716523819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mn+0fMmi;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 190so3042110wmz.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3idB2FyJYtZGOaPU9ZLE/tLvjYyew9156MIbL/ltd4Q=;
        b=mn+0fMmiVgTvdWeYZ16Mx4DquWbkhxZeqL2HQUHfz7I4nJ4u0j+QiBb5G091Gaam/D
         43jx4VgK5xA5MyBkRRgpseqdMN6Xagt5ytLFLW7UeIoqfvIIwIjzaTsJGtsrr7aE1uLe
         uRtAX83PtqM3felBHgYAQcQbM2IpsdENB95kJkCvauIOUb1v+N6CYzds6eL4g96FOxF1
         pRyhPLswJ84V5sT3oeEYXgUpvme+ZfJaz4jwx1NxLzRZIfR9uWfrb3WIot/Xjx0ATvSJ
         BvyywkHEjLbqx2fZPuYWx/8RaUpDHLZqei8+XZ4LnfFKWteorrEN+yxMVdMK39uNan2C
         Bc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3idB2FyJYtZGOaPU9ZLE/tLvjYyew9156MIbL/ltd4Q=;
        b=cjgsVUkSj6Umoa5Jvpu8qdiJG8FoeUugwsDW6pjYL/LyLLxdHMFZw1R95paP/mo5Dn
         lOmOTnJtAlsz0+eFzlOTPTnGmubZPRI2sDHNrdcXLiXAOP0nPVw0350vHFRTmD0Jtzmq
         a+E+goXahLW1Jr3ViroPIsdDH7HMN1RI8K88sKMfsN2q0skVvNDWCVhPVG41wa4TkNWn
         bulr8xOFe0wZA9eRqjX+tBdjH4ib3VHmB6H3/PzPTMGD9aCEM+m72kjwcqRj3Kmyodos
         C0ZcXZRG+OFpOmdWIMO61iLMpk3g7bKNRWEStS2ISTR0wxyxb5Fh9OzFTFMgmOQk7BWu
         nOlA==
X-Gm-Message-State: AOAM533duc0BfcS/zMyGdl0CU48mdprwYuGWXa7hUCNrtdctJB97SwId
	QsDUCpfrVOIBy9JaI40BwuHsjP0LuOM=
X-Google-Smtp-Source: ABdhPJw3RK3psMeqFYthRnaw6lkCmdziZMczplYUqQYqBcGF1F2ihSZR3TX4oySwRy32Dk0FwdxP6w==
X-Received: by 2002:a1c:5f82:: with SMTP id t124mr886842wmb.55.1612990561298;
        Wed, 10 Feb 2021 12:56:01 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.56.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:56:00 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/13] gtkmm3: upgrade 3.24.2 -> 3.24.3
Date: Wed, 10 Feb 2021 21:55:38 +0100
Message-Id: <20210210205538.690009-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Moved to meson build

3.24.3 (stable):

The tarball for 3.24.3 has been created with 'meson dist'.
If you build with Autotools from the tarball, please read the relevant
part of the README file.

Gtk:
* Actionable::get_action_target_value(): Fix ref count
  (Kjell Ahlstedt)

Documentation:
* Improve the documentation of Gtk::Application::add_window()
  and Gtk::Window::set_application()
  (Kjell Ahlstedt) Issue #56 (Daniel Boles)
* Gtk::Button::set_image(): Fix the documentation
  (Daniel Boles) Issue #58, merge request !22
* Gtk::TreeView::append_column(): Add code example
  (Pavlo Solntsev) Merge request !21
* README: Add instructions for building gtkmm
  (Kjell Ahlstedt)
* Explain key values
  (Kjell Ahlstedt) Issue #6 (Mark Vender)

Demos:
* Don't use C++14 auto deduction
  (Daniel Boles)
* Update the GLArea demo (similar to updates in gtk+)
  (Kjell Ahlstedt)
* GLArea demo: Fix a crash
  (Kjell Ahlstedt) Issue #63 (Gerlof Fokkema)

Tests:
* Builder test: Test derived props declared in C++
  (Daniel Boles) Merge request !23

Build:
* Improve NMake support
  (Chun-wei Fan)
* Fix Autotools build with X11 backend disabled (--enable-x11-backend=no)
  (Kjell Ahlstedt)
* Use __declspec(dllexport) when building with Visual Studio
  (Chun-wei Fan) Merge request !25
* Add support for building gtkmm with Meson
  (Chun-wei Fan, Kjell Ahlstedt) Merge request !24, !26
* docs/reference/: Update for Doxygen >= 1.8.16
  (Kjell Ahlstedt)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtk+/files/0001-do-not-build-demos.patch  | 51 -------------------
 .../{gtkmm3_3.24.2.bb => gtkmm3_3.24.3.bb}    | 10 ++--
 2 files changed, 5 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.24.2.bb => gtkmm3_3.24.3.bb} (59%)

diff --git a/meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch b/meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch
deleted file mode 100644
index 176e97998..000000000
--- a/meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 6914eccee34376f9067b0ee9f17039fe182125e8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sat, 31 Mar 2018 22:29:16 +0200
-Subject: [PATCH] do not build demos
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-They are not installed anyway and add libepoxy dependency
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- Makefile.am  | 3 ++-
- configure.ac | 3 ---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 984b6a7..6c754a6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -28,7 +28,8 @@ doc_subdirs = docs
- else
- doc_subdirs =
- endif
--SUBDIRS = tools $(src_subdirs) gdk/gdkmm gtk/gtkmm tests demos $(doc_subdirs)
-+
-+SUBDIRS = tools $(src_subdirs) gdk/gdkmm gtk/gtkmm tests $(doc_subdirs)
- 
- gdkmm_includedir = $(includedir)/$(GDKMM_MODULE_NAME)
- gdkmm_include_HEADERS = gdk/gdkmm.h
-diff --git a/configure.ac b/configure.ac
-index e5e82dc..c1c7658 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -109,11 +109,8 @@ AS_IF([test "x$gtkmm_enable_api_atkmm" != xno],
-       [GTKMM_MODULES="atkmm-1.6 >= 2.24.2 $GTKMM_MODULES"])
- AC_SUBST([GTKMM_MODULES])
- 
--AC_SUBST([GTKMM_DEMOS_EXTRA_MODULES], ['epoxy >= 1.2'])
--
- PKG_CHECK_MODULES([GDKMM], [$GDKMM_MODULES])
- PKG_CHECK_MODULES([GTKMM], [$GTKMM_MODULES])
--PKG_CHECK_MODULES([GTKMM_DEMOS_EXTRA], [$GTKMM_DEMOS_EXTRA_MODULES])
- 
- MM_PKG_CONFIG_SUBST([GTHREAD_CFLAGS], [--cflags-only-other gthread-2.0])
- MM_PKG_CONFIG_SUBST([GTHREAD_LIBS], [--libs gthread-2.0])
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
similarity index 59%
rename from meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
index adc38d8cf..f9ca7fd4b 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
@@ -6,18 +6,18 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "atkmm pangomm glibmm gtk+3 cairomm"
+DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm"
 
 BPN = "gtkmm"
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "e311db484ca9c53f1689d35f5f58a06b"
-SRC_URI[archive.sha256sum] = "6d71091bcd1863133460d4188d04102810e9123de19706fb656b7bb915b4adc3"
-SRC_URI += "file://0001-do-not-build-demos.patch"
+SRC_URI[archive.sha256sum] = "60497c4f7f354c3bd2557485f0254f8b7b4cf4bebc9fee0be26a77744eacd435"
 
-EXTRA_OECONF = " --disable-documentation "
+EXTRA_OEMESON = "-Dbuild-demos=false"
 
 FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.26.2

