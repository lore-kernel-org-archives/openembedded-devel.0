Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.19839.1609637168982524651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjVU6RiY;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id v14so13899093wml.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JIXmSYdYPWMuwMJ1h1LincDiaoW7s9dwyNpNzVycONI=;
        b=tjVU6RiYyUDPmnOUnIvZboMgtO+M7Kh3Y61L2kFfVd6Q8fTSEb0yBY4kd9yw0pRvIF
         ndobeT1WvhllHWu+tnwiDbCFJlApKQFZxsG66vS4lCm49Eg1MFHMRjoHCPlOBwiHkfl/
         cFX2cd3qSHGtEP8/ma+XXlxuf8dJbtIPkNx4M/ly92b78RPi88a4A03UNI2mZAWheY9P
         dKNEs/SjZa3MY8xazkiBbiWS7w2i0xo14g6QAN65Gd3u/wcBP/DlPyuCEN1L0CL/LHU3
         Gpk8tOKGOJFJEXsEzz9wCSpKXa9afjsFILEk6/E2+dSoZG6r01Z/xjG1zsSORmY5iocg
         YIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JIXmSYdYPWMuwMJ1h1LincDiaoW7s9dwyNpNzVycONI=;
        b=FQtfvTlaY0Z881W3ibgGiYfsnZlQypHId0zdqCaF0EjkOUA4ke4ZjySky8rx7rBtrS
         yqK55yJ/+eP+Du3MLjhDJERHiwo6lz/MkOHhNoXwZ3B6zqiJnLZeB3ZQu38r0z3aydsw
         4LMq/YZ8v0oLUq1o/H2P69LnJTf7e0McgtiLcarqj5EJKOqaForzxgjNP5uIYWhq/PBI
         QZSr6yx/9vqdzP3b0BUtfdCUviBZqe6eBjHpilLSYxq97gkNua+zdhQohgoLfBFc2EZX
         L93RsJprq/mnQScoo2aXCNduCf5P+g2mEj/HVi1I7tjARW8nE66F2kJfUZ5LuVDZLYcb
         pk7A==
X-Gm-Message-State: AOAM533R2ss9Qe+laWIjJS5UyALxcGG63Uoy2bg9H6AVox4DmcUQFEyv
	M4GtksPQWODpDTdb4myr7eGMVFEfu07MdQ==
X-Google-Smtp-Source: ABdhPJzb8Z6d7hRHXNvIR8x18DQkhloiU1doIp8JVY9L+kRd4RC9hNw3PBrfFDCzYESIEF+VmwLYsQ==
X-Received: by 2002:a05:600c:d8:: with SMTP id u24mr21017504wmm.103.1609637167353;
        Sat, 02 Jan 2021 17:26:07 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:06 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/16] xfce4-panel-profiles: upgrade 1.0.10 -> 1.0.12
Date: Sun,  3 Jan 2021 02:25:41 +0100
Message-Id: <20210103012556.557336-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.0.12
========================
New Features:
- New build option `--docdir` for documentation install path
- New build option `--mandir` for manpage install path

General:
- Manpage `xfce4-panel-profiles.1` is no longer gzipped (#5)

Bugs Fixed:
- Release install error: incorrect README filename (#24)

Release notes for 1.0.11
========================
* New Features
      - Add support for saving xfce4-whiskermenu's configuration file
      - Prefer CSD in XfceTitledDialog
      - Use XfceTitledDialog from libxfce4ui
      - Use Xfce's about dialog via libxfce4ui
      - Add new icons and use reverse DNS for icons and files
      - Open xfce4-panel on close button (bug #16505)
    * General
      - Add new README.md over old README
      - Try the new and old libxfce4ui gir file name
      - Add basic GitLab pipeline
      - Make tarball creation reproducible
    * Bugs Fixed
      - Update openSUSE profile and fix build
      - Removed check for if the menu is installed. This would probably
        get in the way.
      - Use current branch in 'make distcheck'
      - Use configured appname instead of argv[0]
      - Fix typos in comments.
    * Updated translations: Albanian, Armenian (Armenia), Belarusian,
      Chinese (China), Chinese (Hong Kong), Chinese (Taiwan), Czech,
      Eastern Armenian, Estonian, Hebrew, Hungarian, Indonesian,
      Interlingue, Persian (Iran), Portuguese, Slovak, Spanish,
      Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-panel-profiles/not-create-link-to-locale.patch    | 6 +++---
 ...el-profiles_1.0.10.bb => xfce4-panel-profiles_1.0.12.bb} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.10.bb => xfce4-panel-profiles_1.0.12.bb} (77%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
index 80cdfb903..b5421f6f7 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
@@ -12,11 +12,11 @@ diff --git a/Makefile.in.in b/Makefile.in.in
 index c0ce866..c2f26fe 100644
 --- a/Makefile.in.in
 +++ b/Makefile.in.in
-@@ -61,7 +61,6 @@ install: all xfce4-panel-profiles.1.gz
+@@ -70,7 +70,6 @@ install: all xfce4-panel-profiles.1
  	install data/metainfo/*.xml $(DESTDIR)/$(PREFIX)/share/metainfo
  
  	cp -rf locale $(DESTDIR)/$(PREFIX)/share
 -	ln -sf $(PREFIX)/share/locale $(DESTDIR)/$(PREFIX)/share/$(APPNAME)/locale
  
- 	install -d $(DESTDIR)/$(PREFIX)/share/man/man1
- 	install xfce4-panel-profiles.1.gz $(DESTDIR)/$(PREFIX)/share/man/man1
+ 	install -d $(DESTDIR)/$(MANDIR)/man1
+ 	install xfce4-panel-profiles.1 $(DESTDIR)/$(MANDIR)/man1
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
similarity index 77%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
index 7226b1a03..4d61eb75b 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
@@ -3,7 +3,7 @@ SECTION = "x11/application"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-inherit python3native gettext features_check
+inherit python3native gettext gtk-icon-cache features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -12,8 +12,8 @@ DEPENDS += "intltool-native"
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
            "
-SRC_URI[md5sum] = "6190678bc701c197babcb2389ba46182"
-SRC_URI[sha256sum] = "a84d5e748d53bc5da269954cc3ad7f5ac0c4f5813acfd3892ea6f9064f17fb68"
+SRC_URI[md5sum] = "8a99e712ab1b93f2f53760ff383efa20"
+SRC_URI[sha256sum] = "246e459d2d2f3f524968440ed7fddb2a891567ebc05f10a800f7f5821b3452a7"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.26.2

