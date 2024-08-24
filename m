Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB67CC52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 22:45:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.22630.1724539551935670718
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 15:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwK7X4b4;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-714287e4083so2804493b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724539551; x=1725144351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA5D6s5NC8KWD8wnGzdy+6jwj26QV7//tpl05VFTIdo=;
        b=kwK7X4b4PbtmnfAYAI+KBUEjw6oVvLuP/AXxCzOj8UMtNp7zmG6dwV8CbL2MNbn5S5
         rIiFq4LvAjqhTFMCTsZaNYhq+ZrCypEprMSK/niwlSPeyYhXLKmjZ7FBlDIEEiUvEqCY
         aemdPDJTFWJsbJXAEEL/VDBaygl34vLrtDyD89cdC8bB43So7w/C9RRH3MTWaLWBPYwK
         7CPIPSLOPpv4Qo4yKui7ta6+ujhz6OvMw9Jo4ijpssQvozVNYuI0jaIky4B1JsJXT/Sa
         0ajlJIFe1EmS097UcMBfjtVF/Tv6g32Food/HwVz+odd10XkMMGlB6RnZRl1sx2K9F24
         Sh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724539551; x=1725144351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA5D6s5NC8KWD8wnGzdy+6jwj26QV7//tpl05VFTIdo=;
        b=mvPFR2nHm9bMhLvIODy1cVYY1IaV2H20vFmxdmlxH2LeaF1vQYZYWTXPrryufB3zra
         CAat3BT+1ZwhlS36qJ4tc9/PywN5dYprGMyeud5TD9jNDrEw/mSWEcDiJLO2FE2+9gTA
         QjljDyQu6LIpE6/QgtXWzTJxhY5tGOGbAXz5bkOkP8fNVV8JDY25hbNCQ9StrQxmJAhH
         J1qeTVkoo9EdjneLBXBtYYPsmQnh1S2tZIg38EV3fmA9PZ8Qx39nO83dH24HiD8eEbLO
         0vNZ7NuDj1Za9vtSFN7w/l34oZd8ZAfqxteJNg6ZtkWc2ZL4t3b2NZyuXE6IsmM6H9c6
         RCqg==
X-Gm-Message-State: AOJu0YwL0vO6lh9Qk9YHY2oJ4Vmbz02I8xoGbci0lvAQrITUtDofqmn8
	1AxWhrpb+xhI76I509qOpcRy4ecq2VkBOkmCt/2JIjhnqaQHKnvTD8a7yw==
X-Google-Smtp-Source: AGHT+IGUD9IPU9Pb48a5dScZVEdl6heELt2LGCV3LNP9cs5l/p+NBrToEEucjhoyoxYqj+5F317eEg==
X-Received: by 2002:a05:6a21:4610:b0:1c4:ba7c:741c with SMTP id adf61e73a8af0-1cc8b4affb6mr6710150637.21.1724539550868;
        Sat, 24 Aug 2024 15:45:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343388a1sm4914817b3a.184.2024.08.24.15.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 15:45:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] libspatialite: Upgrade to 5.1
Date: Sat, 24 Aug 2024 15:45:44 -0700
Message-ID: <20240824224545.1944956-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240824224545.1944956-1-raj.khem@gmail.com>
References: <20240824224545.1944956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 22:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111924

- Drop the libtool patch its already fixed in this version
- Add a patch to support libxml2 2.13+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...oHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch | 29 +++++++++++++++++++
 .../libspatialite/libspatialite_macros.patch  | 14 ---------
 .../libspatialite_pkgconfig.patch             | 12 ++++----
 ...ialite_5.0.1.bb => libspatialite_5.1.0.bb} |  5 ++--
 4 files changed, 37 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite/0001-wfs-Cover-xmlNanoHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch
 delete mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch
 rename meta-oe/recipes-navigation/libspatialite/{libspatialite_5.0.1.bb => libspatialite_5.1.0.bb} (82%)

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/0001-wfs-Cover-xmlNanoHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/0001-wfs-Cover-xmlNanoHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch
new file mode 100644
index 0000000000..daef7fab49
--- /dev/null
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/0001-wfs-Cover-xmlNanoHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch
@@ -0,0 +1,29 @@
+From 406e841b3e011e1090f23dba12b12cdd9ec4707e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Aug 2024 15:19:35 -0700
+Subject: [PATCH] wfs: Cover xmlNanoHTTPCleanup with LIBXML_HTTP_ENABLED
+
+libxml2 has deprecated internal http support [1]
+
+[1] https://www.gaia-gis.it/fossil/libspatialite/tktview?name=7c452740fe
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/wfs/wfs_in.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/wfs/wfs_in.c b/src/wfs/wfs_in.c
+index 1cfe39d..41ad2ab 100644
+--- a/src/wfs/wfs_in.c
++++ b/src/wfs/wfs_in.c
+@@ -4638,7 +4638,9 @@ SPATIALITE_DECLARE void
+ reset_wfs_http_connection (void)
+ {
+ /* Resets the libxml2 "nano HTTP": useful when changing the HTTP_PROXY settings */
++#ifdef LIBXML_HTTP_ENABLED
+     xmlNanoHTTPCleanup ();
++#endif
+ }
+ 
+ #else /* LIBXML2 isn't enabled */
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch
deleted file mode 100644
index 6f1c165f58..0000000000
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
-diff -rupN --no-dereference libspatialite-5.0.1/configure.ac libspatialite-5.0.1-new/configure.ac
---- libspatialite-5.0.1/configure.ac	2021-03-08 08:57:18.748858216 +0100
-+++ libspatialite-5.0.1-new/configure.ac	2021-03-08 08:57:18.751858215 +0100
-@@ -96,7 +96,7 @@ AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_MAKE_SET
- AC_LIBTOOL_WIN32_DLL
--AC_PROG_LIBTOOL
-+LT_INIT
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch
index de6e50a58d..4b381eda88 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch
@@ -1,13 +1,13 @@
 Upstream-Status: Pending
 
-diff -rupN libspatialite-5.0.1/spatialite.pc.in libspatialite-5.0.1-new/spatialite.pc.in
---- libspatialite-5.0.1/spatialite.pc.in	2021-02-07 16:53:46.000000000 +0100
-+++ libspatialite-5.0.1-new/spatialite.pc.in	2021-02-10 09:54:09.647552994 +0100
-@@ -8,5 +8,6 @@ includedir=@includedir@
+--- a/spatialite.pc.in
++++ b/spatialite.pc.in
+@@ -8,5 +8,7 @@ includedir=@includedir@
  Name: spatialite
  Description: Spatial SQL database engine based on SQLite
  Version: @VERSION@
--Libs: -L${libdir} -lspatialite @LIBS@ @LIBXML2_LIBS@ -lm
-+Libs.private: -L${libdir} @LIBS@ @LIBXML2_LIBS@ -lm
+-Libs: -L${libdir} -lspatialite @LIBS@ @LIBXML2_LIBS@ @SQLITE3_LIBS@ -lm
++Libs.private: -L${libdir} @LIBS@ @LIBXML2_LIBS@ @SQLITE3_LIBS@ -lm
 +Libs: -L${libdir} -lspatialite
++
  Cflags: -I${includedir}
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_5.0.1.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
similarity index 82%
rename from meta-oe/recipes-navigation/libspatialite/libspatialite_5.0.1.bb
rename to meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
index f46b1083e1..0fe0bb1197 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_5.0.1.bb
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e92e1a36cc384b60f5b31dde0bdd39e"
 
 SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-${PV}.tar.gz \
            file://libspatialite_geos.patch \
-           file://libspatialite_macros.patch \
            file://libspatialite_pkgconfig.patch \
+           file://0001-wfs-Cover-xmlNanoHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch \
 "
-
-SRC_URI[sha256sum] = "eecbc94311c78012d059ebc0fae86ea5ef6eecb13303e6e82b3753c1b3409e98"
+SRC_URI[sha256sum] = "43be2dd349daffe016dd1400c5d11285828c22fea35ca5109f21f3ed50605080"
 
 inherit autotools-brokensep pkgconfig
 

