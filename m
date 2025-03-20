Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B81BC35FFC
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 01:31:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2968.1742434293269061039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 18:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dj7TCePr;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fd89d036so2750635ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742434292; x=1743039092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JznUV8M2uLifbDMOvVg6X6FjZiG1W4izEBv3Kg3DEAA=;
        b=dj7TCePrvIZihSLxc6cF81Iqjb5HA3ibdSFrQqoDCZqCCb9A1kz8gimAwA6sQ9V2YB
         VRT91kHpGlQJhRm0SKPHvz6QLS7npE16c0ftByhLGmHTMRvyUkkk21y4pfuPoyVVFLEk
         ex8ECepCoABRdjsNrC89Z83shPEsVeVU+uv6jPee6F/tY0ISU4ErZjSyN6D25wj/qMs2
         zQBJqA9gx31+GDSrth1NK+FIJSEoXQDcpZDqXb+Ip6jrN0R+z/uiNNEdeA6UsffqOeuo
         O5qykvK07t0j6CARpkRd/JsfxuMe2vbhnNa339GXsj1Z6XZTBMxHAHsSsKuPF3eiPZRm
         nQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742434292; x=1743039092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JznUV8M2uLifbDMOvVg6X6FjZiG1W4izEBv3Kg3DEAA=;
        b=eJbOMtfZVSbqWWmdZyelZ8UwT7zKd7Sm3RCNWrA9oDQED6rZkyGUYE+VLE074vnlKz
         OAvbtNIgTS42UjAkE9661oULj7ehJ5ANeo2Ln8foQbOzLnGH/je44K6T99Ri4Ix+H/Rw
         i1gQAD4v6cD7LM0RYfIkLizflbfFwyDR5Te1unBUd7KmIHhO/zMu2x2V+xUAE4shUwVM
         tZNY+pPoQnXj6xG+wlfgmNnSbRsoSyHbPu+ndAVMu4UH+8Fsc8vz8SxWr7/7wRBueS2/
         pC+6ZgPtbTxAs0/wZ3rK+UfYK/BFM1QVaRAhBIkg2n8yI+0nhr1Wheyl+3CJF0of45pL
         1j7A==
X-Gm-Message-State: AOJu0Yx0yx7FC/BtppcevILrIe734Bq5SvMIL2N0V69DqqSc1vZ7uldV
	3V6TTDwO715yuSoP1SbQ6QDPUtH8fhwjOnrAoQrObtEtopZbjXFtHYli5pxy
X-Gm-Gg: ASbGnctdspg+kiWqDuRzMnKDjV05vUMPIIRuT/HgQe/54mJu5xgX0Xk7lAU57py82/H
	0xMewWnc+6VMQ6XvH9ctL2jOy+HI3IJlHJobcHzxFZiYTRTHmervlEYh78bal7Mj39wtW9Uw03O
	iVxZrPL/P2liMp+6gYf/OkAxk72Qg0qZIwT6QCI3l8mzp7iZ1tJRTajYZj3Yjspl8IC6nGcXIGW
	E/4aFz9qJTaw5KbnroZyHlzY6n6+QIYUu0eiJLcZQ9Hkcdxr3xsnXZQU3Lik9hCoGvl4sWEtbBW
	6vEWSaSpcLiPAJ28D1LQ7aOksV6dkkWvNUYJ
X-Google-Smtp-Source: AGHT+IEKv2N5/nylLSJbu1/PzALWAIWe48BFi+CRV1eiZ35+5JCWaeEAt2r85Lie2S+s2j0wsrMa1Q==
X-Received: by 2002:a05:6a20:1587:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-1fbed315b35mr9358435637.35.1742434292281;
        Wed, 19 Mar 2025 18:31:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea7cac1sm11796902a12.48.2025.03.19.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 18:31:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] libgweather4: Upgrade to 4.4.4
Date: Wed, 19 Mar 2025 18:31:30 -0700
Message-ID: <20250320013130.2872459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 01:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116114

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

