Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0ECC27C44
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.3097.1716315041792470212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHjWtF5p;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so117775125ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315041; x=1716919841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+vnGrvCBmOHwK7GpMg1WXyUg3XMXG/lg4oOUcpDSEk=;
        b=SHjWtF5pdRbM94C/aWwHokOUOdS2mpialYwrKKezbVw1qTY8wcDHl17MgYA6moCYlj
         UQPeQp1lFX3ejlkaDdQDG5kSD5JnO+cetbx+2loc2WWvlfU9Y4bYYm6P1VO0BCEYhfqK
         k32EEq4f3wM7cIBUzd9ZCpSmOOxhc8bSJnEUgQYcfYpgtAMvV5H7tHAilx330XiGUE1c
         KMxcjjJaIXOHA+mZ720PBuA8E52RDPkn9aRwQQl9+uhX7jQ5/LbH/95GBtgBeMLKl9Tw
         626BE4K66i2OuypKkNT2S0sCBqQsxygr3/59Dq0CyhZvJfAbo9oKqgCkHuwGy0IcBWeg
         UajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315041; x=1716919841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+vnGrvCBmOHwK7GpMg1WXyUg3XMXG/lg4oOUcpDSEk=;
        b=Z6pugmqJZsdEgv+csKnU2xKpXXPqKVoz599/3PrphR0Sot+BqrVps5slEyXb8/wIZS
         bGVkPLdtJWwBn1S9kLPeT+Vd4I1xSMljf/CAZGdu71RCVv3sh77UWSAs2N6bVzp+sBSa
         6o9lDSgrmdpEDYqejuhv1MGoZiFul175KaO2T7qB80Ji4OG9r/lPb+hilVaWp5Jug2/q
         gjS6Senp7arNW8H0zYAFepb0FA99CDvbL6S1+D1KPJESowSQ0Q+Ob4/sxVCn7MOdFK+t
         JKoAwTEufl3mXPOfTp2UYOo390gtvqFSCVpS85ZxEmnjFbqJqFhbznwY1CzAUs9glxGR
         YzMw==
X-Gm-Message-State: AOJu0Ywt1UUEZC1om9D13Knh7a7m05FK4rOIu6wK6Nm0CaEU59dhF6BZ
	TTl0vucsyYxK7+037ysovfwoWRvghISo2gZfrWUrnYK/zcWgMpvO+XlFvouQanE=
X-Google-Smtp-Source: AGHT+IFAQjSuD4xpTbmMzQdNtA4uqZVBBtvcYlShPlje02naik3SRflermudtQXE4IViiXffSd4vLg==
X-Received: by 2002:a17:903:2350:b0:1f2:f7ea:125c with SMTP id d9443c01a7336-1f2f7ea14ecmr123068665ad.10.1716315041028;
        Tue, 21 May 2024 11:10:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][ 15/22] gimp: Upgrade to 2.10.38
Date: Tue, 21 May 2024 11:10:16 -0700
Message-ID: <20240521181024.426176-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110464

Fix build with GCC-14 with few backports while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...f-load-fix-mismatching-variable-type.patch | 24 +++++++++++++++++++
 ...001-metadata-shut-up-a-weird-warning.patch | 22 +++++++++++++++++
 .../gimp/{gimp_2.10.36.bb => gimp_2.10.38.bb} |  7 ++++--
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.36.bb => gimp_2.10.38.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
new file mode 100644
index 0000000000..13b3dda144
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
@@ -0,0 +1,24 @@
+From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00 2001
+From: Simon Budig <simon@budig.de>
+Date: Sat, 20 May 2023 18:40:41 +0200
+Subject: [PATCH] file-tiff-load: fix mismatching variable type
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff5452b1329116e6db]
+Signed-off-by: Khem Raj <raj.khem@gmai.com>
+---
+ plug-ins/file-tiff/file-tiff-load.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/plug-ins/file-tiff/file-tiff-load.c
++++ b/plug-ins/file-tiff/file-tiff-load.c
+@@ -1301,8 +1301,8 @@ load_image (GFile        *file,
+ 
+       /* any resolution info in the file? */
+       {
+-        gfloat   xres = 72.0;
+-        gfloat   yres = 72.0;
++        gdouble   xres = 72.0;
++        gdouble   yres = 72.0;
+         gushort  read_unit;
+         GimpUnit unit = GIMP_UNIT_PIXEL; /* invalid unit */
+ 
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
new file mode 100644
index 0000000000..4f04ac8250
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
@@ -0,0 +1,22 @@
+From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2001
+From: Simon Budig <simon@budig.de>
+Date: Sat, 20 May 2023 22:25:40 +0200
+Subject: [PATCH] metadata: shut up a weird warning
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121f59b83d560c7b4b853d1c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plug-ins/metadata/metadata-editor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/plug-ins/metadata/metadata-editor.c
++++ b/plug-ins/metadata/metadata-editor.c
+@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set_metadata (GEx
+                             }
+                           else
+                             {
+-                              if (! g_strv_contains (values, equiv_values[evi]))
++                              if (! g_strv_contains ((const gchar * const *) values, equiv_values[evi]))
+                                 {
+                                   gchar *tmpvalue;
+ 
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 4526839ad6..833341f850 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -46,8 +46,11 @@ SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-configure-Keep-first-line-of-compiler-version-string.patch \
-           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch"
-SRC_URI[sha256sum] = "3d3bc3c69a4bdb3aea9ba2d5385ed98ea03953f3857aafd1d6976011ed7cdbb2"
+           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch \
+           file://0001-file-tiff-load-fix-mismatching-variable-type.patch \
+           file://0001-metadata-shut-up-a-weird-warning.patch \
+           "
+SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.45.1


