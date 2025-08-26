Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F80CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 18:18:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.72876.1756232299659422653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 11:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MOTUMYOv;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b6b5ccad6so1154355e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 11:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756232298; x=1756837098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCzQkRWW0sdlDG1lr7OkdztCyZHLXJtuGfON8HMwJjs=;
        b=MOTUMYOvEhzjFlAsp/3L47uu00OY0PVmm6/qv7BhTe2EAyHsS3r5QMqWlYPxH/FiYn
         wpRcrbFLyAOB8Xd8YMxQfc757EkjkY5jIidPuYesr8lHrVgMeSLQtLKpIDWLNQoZE2aw
         lldjMIuKusjsBxWg6a3TZNyyKkzctLWvOCVApafS5bXTEbIB55JtnVl1GPSspk7Kk8Cx
         QlSUxcemuFv5m61EqehR4THjw92rr5nYXU3e86b2QSipxRB2jmFuWnW6OTKsDMTod5KK
         HHFk+8+HXwjHRPELJ41gnipvo5jfIdcGlJwMfavm/R+W/sr6quAToMcSrLLFFb33QrBn
         mbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232298; x=1756837098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCzQkRWW0sdlDG1lr7OkdztCyZHLXJtuGfON8HMwJjs=;
        b=OYk3RY9lTE5RNMVh5ELBzRiP2C7J2oaP+tLDE+XblXu9Nme+n3bobA27XQI24rMj9K
         HYkjJixXwpHVK1RW60gFvu3hhnKMmovJH0RW2BsVhxCxqEOlclxs7+Bqi48Yabx9mkfG
         5K99d8a+ZzPpSHd4IsJOv0YTBMKhxl7xWX5KvN+zCEkV0yEeqhPU7QnLWa3Y5qEKW1My
         6T+vHwoMj2qTzs/WkiA6RlJpG9QavUjEwacaZ11C47377CAeN8eI8JYasbhUNJmJvtz5
         zI1Smsop0vrw7uVBCUWhb6nVdfXLY0qCHqeg96DzulDETqDMJcdX3OAVEl7d3wkyoVzw
         srzg==
X-Gm-Message-State: AOJu0YybrZSh8LSXyrGtnZQ86kRjKgs9WBkGuXF4bn9FKolScXB/HHTm
	kivZC6a8frq/2ZyYD9K1cnkL43ikpNWylFSTjQy50XjQGPqjiOT4x12j+C6S4Q==
X-Gm-Gg: ASbGnctyPVspkM4rifP4TZD47Qv57lxqG4O9HgNyOiDc0wP9Xy1VyjnKMkfPhqDFlcL
	G+VZVhli4a63cpPLBhWpFiWQJtfuKU8QmseLvKJ8dvpDhQuAKG8t36VVXJNKwi2TjOTUQZagkvC
	TyElQs53GkuMNpdqwPAGl7p+0oDG4KCOD6vdQWLyfIfrUEnzK/rVkAQ+QL7v4tzZVdk1Kpw9Mb2
	DdoVr47d4e8qQoBAP4tPV07VBuQUnJ2vSy7KJyLZa6k5D7vAojBNoqKvnCX8MCE6OSk5gQcdsgP
	S5/jZrMn03uGlNJq6mvMIin4+Spfihovh4kq0XqHy/ln5EYBvJdvDBQuNPDhjJ+ccvK0N+pLIMH
	IFWmcpIUMhlTkOqP3iCsr8Kh95ARY82J8TFRv1FSoWH56vYmYaxJL3pHsYC7X8Gl2hYyLqsIcBl
	OCeKO0OpGiIV8IZGgF3XL6oKWCXCd6MBVMlOXEGe0MF5SJFXYbs0M0wuI1
X-Google-Smtp-Source: AGHT+IGfr3kJCN8dHhSMt/raHPuTq5aHpuEZlt8RNQd4q9eail/oYCtJ7PvwJI3QyJKSF0ifBlW1Lg==
X-Received: by 2002:a05:600c:4853:b0:458:bb0e:8cda with SMTP id 5b1f17b1804b1-45b5974de01mr86422055e9.17.1756232297508;
        Tue, 26 Aug 2025 11:18:17 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b6c4e9087sm3245585e9.10.2025.08.26.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:18:17 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH] libvncserver: fix generated LibVNCServerTargets.cmake
Date: Tue, 26 Aug 2025 14:18:12 -0400
Message-Id: <20250826181812.433639-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 18:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119118

From: Marc Ferland <marc.ferland@sonatest.com>

The currently generated LibVNCServerTargets.cmake will include the
following 'set_target_properties':

    set_target_properties(LibVNCServer::vncclient PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
      INTERFACE_LINK_LIBRARIES "systemd;/usr/lib/libz.so;/usr/lib/liblzo2.so;/usr/lib/libjpeg.so;/usr/lib/libgcrypt.so;/usr/lib/libgnutls.so"
    )

INTERFACE_LINK_LIBRARIES here points to absolute paths which hardcodes
the library paths. From CMake doc [1]:

    Note that it is not advisable to populate the INTERFACE_LINK_LIBRARIES
    of a target with absolute paths to dependencies. That would hard-code
    into installed packages the library file paths for dependencies as
    found on the machine the package was made on.

This breaks krfb build (kde desktop sharing server) since CMake cannot
find these libraries. Removing the absolute paths solves the issue.

Note: I also added a 'inherit pkgconfig' since libvncserver uses it to
detect libsystemd presence.

1: https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_LINK_LIBRARIES.html

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 9d2d0a5743..8c6b3f7e14 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGE_BEFORE_PN = "libvncclient"
 FILES:libvncclient = "${libdir}/libvncclient.*"
 
-inherit cmake
+inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag=LibVNCServer-${PV} \
            file://0001-CMake-require-at-least-CMake-3.5.patch \
@@ -53,5 +53,5 @@ SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
 
 do_install:append() {
-    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/LibVNCServer/LibVNCServerTargets.cmake
+    sed -i -e 's|${STAGING_DIR_HOST}${libdir}/||g' ${D}${libdir}/cmake/LibVNCServer/LibVNCServerTargets.cmake
 }
-- 
2.34.1


