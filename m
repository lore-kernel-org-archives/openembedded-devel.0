Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.2172.1604429957832531378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2020 10:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I8QZjY1O;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id j5so8999326plk.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2020 10:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ci0gfjqONwSRk9IJR4cc6bs/FntGpWs5aEcImGf09+k=;
        b=I8QZjY1O8HatSfQUFzPp/FoeNsEkb+s24aZ13JHu6bmFzw3qxTS6I6C2Mjqyh0OlNC
         3powCzIK6SmpANUHomHrNiRIKCDuUJ2hCfPKYPIntjAbI5UmYGJ5Nc9NE3tDFptLZ2zK
         EDaM9T1H0BIvgiphpB3nStkCXa+FMD75z6n77pMkGxXETK2GGi44SCPUY2HnU6J8hlWr
         zt4PaLg0WR4Aa2aIOI06XJEckwb0Pc3V14YYDAj8XrPf23QjSdSyOuAJHv08OcoVQoFF
         JLT4cjPH9dedBmzN2kdPaU5nNB2FkfJhbZveofvjTWlxHE4Es7THPmqutJS/xYgG2LvX
         TOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ci0gfjqONwSRk9IJR4cc6bs/FntGpWs5aEcImGf09+k=;
        b=pfVjTYxbVs8vYlyIm6wuYogr66UR/BkZ3Pfr6B1qKIQoNc64BUEjW0YwjAyXdy2pOP
         0Wb4ozKjCi0KqBfrptpxnYNvLe/Jt2SaUyj8bx1TN+vBAIrHyD72dU7dTOM0Ewe6Tpp9
         hOHG91Q0A+paI+yRnQwj9mD+CETM72gZK7XuqWwf7fJIrnbcUzW6rbzeHs+ZSHoKqiW/
         fdkusMcez3o/kfj0XlouTdsvMbG4tM1Katm7t9XBdKhlnUkEca+rZtfrywlggNNnuY0D
         KVcaBF/Q4VgJSusP6OarYWDSDjFwZ6XsjV+Rjl7PM+GmfIkaPNspH3ooDXJPWp9slqcv
         GS8g==
X-Gm-Message-State: AOAM532OQVJ4dfthcSxuhFyz/gRcgFyBbKFjwX7U9NiDu2KlNJTVbmIu
	souApiUK203I8yWKDJzmY9oQUmzrjAsG6g==
X-Google-Smtp-Source: ABdhPJzQIvSDPf+7RoSjtZIBFBfJBIMc+9MozrmK4/ThwLBXtcCMnwNYdq1JVd4XaN/VRXmiaa2fmg==
X-Received: by 2002:a17:902:c410:b029:d6:ad08:baa0 with SMTP id k16-20020a170902c410b02900d6ad08baa0mr18849507plk.78.1604429957103;
        Tue, 03 Nov 2020 10:59:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id w13sm8148357pfd.49.2020.11.03.10.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:59:16 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] ibus: Update to 1.5.3 plus fix for vala 0.50
Date: Tue,  3 Nov 2020 10:59:13 -0800
Message-Id: <20201103185913.1407868-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201103185913.1407868-1-raj.khem@gmail.com>
References: <20201103185913.1407868-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.inc              |  4 ++--
 ...-try-to-start-dbus-we-do-not-have-dbus-lauch.patch | 11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 1bbeb2c481..ea413cf4bd 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
 
-PV = "1.5.22"
+PV = "1.5.23+git${SRCPV}"
 
 DEPENDS = "unicode-ucd"
 
@@ -13,7 +13,7 @@ SRC_URI = " \
     git://github.com/ibus/ibus.git \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
-SRCREV = "e3262f08b9e3efc57808700823b0622ec03a1b5f"
+SRCREV = "dd4cc5b028c35f9bb8fa9d3bdc8f26bcdfc43d40"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
index 3701d19f5c..aec9e7abec 100644
--- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
@@ -13,8 +13,6 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  data/dconf/make-dconf-override-db.sh | 6 ------
  1 file changed, 6 deletions(-)
 
-diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dconf-override-db.sh
-index 9c650e97..02fbf059 100755
 --- a/data/dconf/make-dconf-override-db.sh
 +++ b/data/dconf/make-dconf-override-db.sh
 @@ -12,10 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
@@ -28,12 +26,9 @@ index 9c650e97..02fbf059 100755
  # in case that schema is not installed on the system
  glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
  
-@@ -46,5 +42,3 @@ for schema in $schemas; do
- done
- 
+@@ -52,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
+     umount $TMPDIR/cache/gvfs
+ fi
  rm -rf $TMPDIR
 -
 -kill $DBUS_SESSION_BUS_PID
--- 
-2.20.1
-
-- 
2.29.2

