Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.296.1618863348171003392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 13:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aKhhp4wB;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id sd23so46225189ejb.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMJueG4O+ZaHAHJEEjNjPolBYFe5AGtdCPZO/yd5O/k=;
        b=aKhhp4wBZQyuvFAaYSyZ0927ED7Z1KLbulLCtjTbHLwpF0PMQXzzRxsrbs4jhz8E9a
         oo6IxWiYGsqO5JVnivRJW7ky5STW4DYjv2UO/b+HkZyR8OXv2Oqmk4oSoAkftoSR+ple
         16gGLWsU00O4uUNeTUbfpLje9mpvd7OdmMzjQTEcEpETu/jXqrBpd18SXxBcvydgOIXB
         pj7XSaL3HLhTvKd9ktdcMAohQm76z5Os3wFG32InchScZcZRCA7CRow7XNFpqkIvllTP
         rJvKWjeETamqnS2E4tiaqOq2uiokKBT6eqFoAX0M07o3ap3+n3ZSQNgAJ8NTloN5ZLPg
         psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMJueG4O+ZaHAHJEEjNjPolBYFe5AGtdCPZO/yd5O/k=;
        b=QGDllzpGXZPUi93cEDr+cnXy8uLuQDztKELbZ9I1QShUGBdaEnqwuFHvh8NV03Pd3i
         siaVqSn4jl0t098LcyZDB34GtJeKGfYjbs6YFzktIjzUZV0DGGJ8l0BwAJxNKny82Mtg
         ZOlAV8+9eZdpxDy4yXks+OnDxNWubYo1yldZV2REeTleTZrByyGHwU9dQI4E1myp3yS1
         zxBl3gs8GPLFYpl2Od4XqDTGW5ZjRXpHZnKNTwYif1j5zBI/mb9rIEYJwlWG8/VHrP/g
         ocukOpNjz2ap8TM7ihOT1iOaOeISkIFhpG3FM4CgnLMMZEewwv3MQeyGQOoMGN3NExTl
         QOQQ==
X-Gm-Message-State: AOAM533F6WOhRhrQXWON8+UaJ0nb8hiq3znmV0naJgCjuIbfYtRO5MfA
	tcpJk9RvPOHpCrSnvXUz94RZ1CgmQbqFJQ==
X-Google-Smtp-Source: ABdhPJw36OnC6AdiQsZWydjnkBCqmsrF4tev0wlGhQqTBnDL73rUlVf/l4fyelUgOGWlQDbwjRSF1A==
X-Received: by 2002:a17:906:40da:: with SMTP id a26mr23926230ejk.513.1618863346667;
        Mon, 19 Apr 2021 13:15:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id kx3sm11108214ejc.44.2021.04.19.13.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 13:15:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] libmicrohttpd: remove the recipe
Date: Mon, 19 Apr 2021 22:15:36 +0200
Message-Id: <20210419201536.588371-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it has been moved to oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libmicrohttpd/libmicrohttpd_0.9.72.bb     | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
deleted file mode 100644
index 66c48da3b..000000000
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
-HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
-LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
-SECTION = "net"
-
-DEPENDS = "file"
-
-SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2a286193af88ab2ae3149748d4b46187"
-SRC_URI[sha256sum] = "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c26552260264c2ff8"
-
-inherit autotools lib_package pkgconfig gettext
-
-CFLAGS += "-pthread -D_REENTRANT"
-
-EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
-
-PACKAGECONFIG ?= "curl https"
-PACKAGECONFIG_append_class-target = "\
-        ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
-"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
-
-do_compile_append() {
-    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

