Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.48767.1591047942633526375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g8v7YVtR;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id x13so1329909wrv.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iyWtrYyEWGyqiJu/OqBDMxoTBsqcNQPbMSFdkGnSO6g=;
        b=g8v7YVtRuHltkT0zaMu0gTMa8wrVJAuMsbblJSzwZTM4iMwyINJRr4uiwEIapLvXpH
         HGPA9ot1uilwKKu85zFcH2ZboQd2RbsUiGlY6JWXCmSWnKrAhnV187D44HiSmrDnlYIR
         8TewMYdAQboZyTHh3L89dw3mr8H5QHZ0s/n6d34OuBMijToIAyCc66lFhltGkTxBlbVF
         sw3KqgtjaT6AUskyzVk2A/LHFmwDmQWtfV00+q6D554SCTwOQqCjvjHL3Zgws/ks6hz0
         P/cZ7IkfgGU2t9ANbAwbIzTziqw23/uR4m6bMULA+qlPvQiL1CyTtl/mD6nFcGOYGtrz
         IkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyWtrYyEWGyqiJu/OqBDMxoTBsqcNQPbMSFdkGnSO6g=;
        b=IbtSTWiU059CumF21QA+d7hsvXhEQTdvzny4iHxKuuXqa/PSUXRAC9pHQX7NTZ0SUp
         r4kqibXFUO0Su8wHmjEuIKUsUgP1O+4xU2LeN2eB1Fx2wUXVhuPyQfaD/4PxHxDboRH+
         BVsmrdWFOyxPikV7u8pOgicxnHm4JPOw4zZ/JIMi5z2WgrEa2UEvoIcQWVrIv94mv/1W
         7sXD+IOLEzB9Hh45KpSdJBnqhMKg29gJwYWupZo2CYe4xSxUs5tl+5bbaoTThJ4RDco9
         BrMXPYcd7nyBJ5CBYw7iNk3g5r4iFhwD4pekZS09QWJlJrq2Fd+7+9W2NoB7GHTmRQZR
         NQAw==
X-Gm-Message-State: AOAM531yvC1MT2wxWKdHqsQTSQg8K7nNqmgz47QiYQRBJA0xItGvGVQ0
	jjCb0cnJBd+XLutGy3K2lOUCancnbtw=
X-Google-Smtp-Source: ABdhPJzvX2yHXJ2lvV7AojRcEqb7665KNw+8IGC6v06KRgbZ0E7kHCadaDJGdEh1LzUA0YjSErhAtw==
X-Received: by 2002:a5d:6986:: with SMTP id g6mr24320032wru.27.1591047940911;
        Mon, 01 Jun 2020 14:45:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/38] gedit: upgradde 3.34.1 -> 3.36.2
Date: Mon,  1 Jun 2020 23:44:51 +0200
Message-Id: <20200601214516.26624-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Took a look into meson.build to reduce dependencies

News in 3.36.2, 2020-04-25
--------------------------
* Misc bug fixes.
* Translation updates.

News in 3.36.1, 2020-03-20
--------------------------
* File chooser dialog: use text files filter by default.
* Fix compilation on macOS.
* Fix External Tools plugin.
* Fix Snippets plugin.
* Other bug fixes.
* Translation updates.

News in 3.36.0, 2020-03-06
--------------------------
* Fix a bug in the quickopen plugin.
* Updates to the user manual.
* Translation updates.

News in 3.35.90, 2020-01-31
---------------------------
* Remove text centering when in fullscreen mode and when a right margin was
  set. For the explanation see: commit 8710e89d847b0bfc65d7833255090e304cf7c890
* Make the scrollbars always visible around the main text area. For the
  explanation see: commit 5e0909c19f267b4023131881fac89c58a2a17453
* Remove the overview map. For the explanation see:
  commit 26899e0ba7c1390c098b61fc7a901d700c4e745c
* File chooser dialog: re-add the feature to be able to customize the list of
  character encodings.
* Open a file from the headerbar: re-implement the previous user interface: two
  buttons, "Open" to open the dialog window, and an arrow to open the recent
  menu. For the explanation see: commit 27f54a9aed82109a512743b5e819b18004c19de7
* GSettings schema: enable more features by default (auto-indent,
  display-line-numbers, highlight-current-line and bracket-matching) and set
  default style scheme to 'tango'.
* Bug fixes.
* Code refactorings.
* Lots of small improvements to the build system.
* The libsoup dependency is required only on Windows for the checkupdate plugin.
* Translation updates.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gedit/{gedit_3.34.1.bb => gedit_3.36.2.bb}     | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_3.34.1.bb => gedit_3.36.2.bb} (63%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
similarity index 63%
rename from meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
index 850ba4df9..75f1737c6 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
@@ -6,30 +6,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
-    yelp-tools-native \
-    libxml2-native \
     gdk-pixbuf-native \
-    iso-codes \
     gtk+3 \
     gsettings-desktop-schemas \
-    gtksourceview4 \
     libpeas \
     libsoup-2.4 \
     gspell \
     gtksourceview4 \
+    tepl \
 "
 
 inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "4bca1d0a13db186cd84619b4bff42238"
-SRC_URI[archive.sha256sum] = "ebf9ef4e19831699d26bb93ce029edfed65416d7c11147835fc370d73428d5c6"
-
-GTKDOC_MESON_OPTION = "documentation"
+SRC_URI[archive.md5sum] = "438217bbbcf92a17c4f259b4a5426b03"
+SRC_URI[archive.sha256sum] = "6887554643c5b1b3862ac364d97b7b50224bff95e6758aeaa08f4a482b554197"
 
-PACKAGECONFIG ??= "gvfs"
-PACKAGECONFIG[gvfs] = "-Denable-gvfs-metadata=yes,-Denable-gvfs-metadata=no,,gvfs"
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 PACKAGES += "${PN}-python"
 
-- 
2.21.3

