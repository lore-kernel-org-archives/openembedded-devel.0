Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D557EE0ADC
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3881.1770467018485303023
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OS8ZNTNl;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483337aa225so570655e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467017; x=1771071817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95oRiFk06KX+6ih4oeM4UyBUsDd8Ivrwdi9nqItdQ3U=;
        b=OS8ZNTNlva9uouCj24R9lOZlWiDRlbKARkXkutN4v6LPPmnabYSVCSbH/0SzBfuDim
         AqrG6dkkMPpvB1+4A2lqinA82srJP2Za+JHiK1zGB5weyiEhwgK9SO6bqOZZbvGlf26Y
         rPEL/usYcZILy/147llDZQBeuq5aYSnbBpA9TwYdOs8tQe1lhScKjfrqyoWOU7Mg/7ty
         v8cTKp/WgEpvxV54oYxtNbECtm1M0Z3mBIU3mScbXxMZBhc1KbCbdShkuTM2XRDo3Rir
         +vfYnWneBW4bZ2F/MwxSngmtRkJSQ3dzvS4eeIVr4e/lESamJKUaGYuw5gII4t/NAQZ2
         zCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467017; x=1771071817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=95oRiFk06KX+6ih4oeM4UyBUsDd8Ivrwdi9nqItdQ3U=;
        b=V2n8id/PahanxFKf4Yq5vHVyStsrmuvkm4JCrmOIPZ+ZoUmW1IqSS9TKJmNiGeifW8
         JiI8KFFxJuzA0AioCw9HOYC8Pq9ubv0WWgBzjbG/PqQQ+yanoFkyK+dekMkPVCavUeTF
         dXpEkUTBJNeNXoK+t9pennUsLn7NxiyroaWFEZVP+wA6XqJS2LeNM23gQXhiNyb69Plc
         H3+P/v9DrTGJmpT27YK9wolV1pxkbRdaaQiKu6J07xjmTcec9qf7yu+eMlTrkCk1pjAn
         Y1LhOnvWv5ks/mwMjjgohsbOmdqygsfDiIvD5imtnt2RluA7ndVmBU9nVmNsyQihA7zi
         gRRA==
X-Gm-Message-State: AOJu0YxI3CRS71SloFUki0OCq81JzKYIrWu/1lt4XoD/46J7XQZ4m1eH
	TZUC+QPNLbDPqvaKQy2fwRgdsQ93+7QJk9bS1GQNXuR1c3cMSN5cmOHtNIHi+w==
X-Gm-Gg: AZuq6aIMjw8UfIBkWPcGdhbZ4fbIskK3OLYb2gF0FlzyqdMo1xDpyVXwpLF2sp6D/Av
	pU5sqi/2ckigkRqIqOc/IOYCgxBZkItjkGlERtQyXU1wEhWq6QtfJOm1yOnsizof9uyLqARLWfL
	zJbuGZ4NrA5IF1Ey03N/mcPcGcs0pxQp6Mh66Y1ixdBKl36yU2QXWAh6NuIbiILGKv+eK/3wAYK
	J0xOR7EQa7m+I9AhK8LhbxODjPVs5A9G/rk31URyewmWnW6yXHqozB0abZb7FZ/b5bGWDXKpLaq
	1Ss4AWg6uTNWwcQ72jLezPZ5IXCIEfJN3/2FR38RHTyxMDhW8SiPUi5eQaiBENmvRJ5HFBRIWM/
	AZ5TuJIgI+wAZFgfox/B53Bn585HCO788Gnnz3gekqA2Z68rgvyTH6+jOm/J5oMb16B+kCtqBJ4
	fwqR/x5SX2
X-Received: by 2002:a05:600c:4f8a:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-483201eabf8mr91055385e9.16.1770467016768;
        Sat, 07 Feb 2026 04:23:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 11/12] libgweather4: Upgrade to 4.4.4
Date: Sat,  7 Feb 2026 13:23:26 +0100
Message-ID: <20260207122327.664604-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124267

From: Khem Raj <raj.khem@gmail.com>

- Fix deprecation warnings [!300]
- Fix introspection annotation for async functions [!318]
- Plug some memory leaks [!321]
- Translation updates

Use GI_TYPELIB_PATH to point to typlib paths in target sysroot

Fixes
| FAILED: data/Locations.bin
| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libgweather4/4.4.4/libgweather-4.4.4/build-aux/meson/gen_locations_variant.py ../libgweather-4.4.4/data/Locations.xml data/Locations.bin
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libgweather4/4.4.4/libgweather-4.4.4/build-aux/meson/gen_locations_variant.py", line 7, in <module>
|     from gi.repository import GLib
|   File "/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libgweather4/4.4.4/recipe-sysroot-native/usr/lib/python3.13/site-packages/gi/importer.py", line 133, in create_module
|     raise ImportError('cannot import name %s, '
|                       'introspection typelib not found' % namespace)
| ImportError: cannot import name GLib, introspection typelib not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
(cherry picked from commit 054716edca0ed56c171b5cb8d375c6bdf53eaa4b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{libgweather4_4.4.2.bb => libgweather4_4.4.4.bb}      | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.4.2.bb => libgweather4_4.4.4.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
index e0c8724a31..85bc21b5da 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
@@ -11,11 +11,13 @@ inherit gnomebase gsettings gobject-introspection gettext gi-docgen vala feature
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI += "file://0001-Allow-building-gir-in-cross-environments.patch"
-SRC_URI[archive.sha256sum] = "a6e427b4770ada48945f3aa906af710fc833cff0d42df91f1828302740d794ec"
+SRC_URI[archive.sha256sum] = "7017677753cdf7d1fdc355e4bfcdb1eba8369793a8df24d241427a939cbf4283"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 VALA_MESON_OPTION = "enable_vala"
 
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
+
 DEPENDS = " \
     geocode-glib \
     gtk4 \
@@ -28,7 +30,3 @@ FILES:${PN} += " \
     ${datadir}/libgweather-4 \
     ${libdir}/libgweather-4 \
 "
-
-do_configure:prepend() {
-    cp -f ${STAGING_LIBDIR}/girepository-1.0/GLib*typelib ${STAGING_LIBDIR_NATIVE}/girepository-1.0/
-}

