Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0C5E67811
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 21:00:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.24942.1730581213081409962
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Nov 2024 14:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ErCviUMk;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37f52925fc8so1849656f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Nov 2024 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730581211; x=1731186011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3scDkTDwQNerwAyWFh75bV2N5p97+o2q7uLkJrHv6g=;
        b=ErCviUMkjWljzaIYk4i4vWA95lIRNcbyVemlHgib+NRTjBdCGuzsvlYoA5c2AvL7zl
         jHik4+bPdJ03cPpNPZkzMseRqhX91U7LW7nBf/VE4ZbcOg4oy8UDfa1UDRPyAMxxrhlT
         6D/cG0y2N2/0F7mII2IPUlt7jcRwlL8CjCw0mkakbHWKnwso8A+JAm2ISpGrhn0WMlbw
         YThQ1IZhD3eo5JGcd3Tq1ejYP59iRLO91mu0WSCZFo00CweJWwpc9TfbFHXEzK7pH+Ja
         +kKGsQUX4iJUIU7WGPllmzB8hBzlIpOCjo2A7ndfo9nB9ludHz9t0lD6DYmpskbDDlhM
         DoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730581211; x=1731186011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3scDkTDwQNerwAyWFh75bV2N5p97+o2q7uLkJrHv6g=;
        b=AcAo9+B7YNFk+xSMATrWxxeWeKzFIC8eS+yXQIav818IIwA8ffkQrBO/4rxszS8Wvf
         kW9mUV7umIA45ZaCbSO776OpfEnJ596TyvcL2jIU/+unMgAyAk/eD4gfRTG+GDChAzJK
         DbXJxu3/4wav19/vSl/FCeZNTW+w+VlyHYOshWiJUA+BX8mzDMhUqjsO0l2eJwN4NPUU
         R6LoPKrUvyUPzEKgx+zYteQticiLl9+sKBTbdrwlpoggMMXAwBseFooDVhas/4CWEmG1
         fMGMole1uPe+0UhQejKPRe8rt9sLX6xEoOsgVKLK4so9/pAzd7dEZuk/fkcZ6KOkEhk/
         u/fA==
X-Gm-Message-State: AOJu0YxV/uEyOhJH2/iFN/Vl7f3l6pRQPqRVoqLC0WTav9m5xbKkd6Li
	PdfNO8K0eR3TKksj2CBSHVe9hyfXcvO56csc3+grVI8kYPJ/f73oqenUBw==
X-Google-Smtp-Source: AGHT+IEiWV5OQpk+jgyjHTWcrhODp3Md1ajF7uOf1r3pN3jK6aeWBs7IMTdH0b5xhy2/AOW3f4Ganw==
X-Received: by 2002:a5d:6c63:0:b0:37d:3973:cb8d with SMTP id ffacd0b85a97d-381c7a5e9d5mr5949803f8f.24.1730581210975;
        Sat, 02 Nov 2024 14:00:10 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d439esm8950238f8f.44.2024.11.02.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 14:00:10 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Upgrade from 1.47.3 to 1.47.5 release
Date: Sat,  2 Nov 2024 21:59:58 +0100
Message-Id: <20241102205958.223853-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Nov 2024 21:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113391

* 0001-Add-check-for-64bit-builtin-atomics.patch applied upstream
* removed not longer used systemd service file
  The service of the netdata is used in previous commit(s)
* oelint_adv issues solved

Changlog: https://github.com/netdata/netdata/blob/master/CHANGELOG.md#v1475-2024-10-24

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...-Add-check-for-64bit-builtin-atomics.patch | 49 -------------------
 .../netdata/netdata/netdata.service           | 15 ------
 .../{netdata_1.47.3.bb => netdata_1.47.5.bb}  | 20 +++++---
 3 files changed, 13 insertions(+), 71 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Add-check-for-64bit-builtin-atomics.patch
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.47.3.bb => netdata_1.47.5.bb} (94%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Add-check-for-64bit-builtin-atomics.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Add-check-for-64bit-builtin-atomics.patch
deleted file mode 100644
index bb4a5235f..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Add-check-for-64bit-builtin-atomics.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 555cfa9c4d5b1114d975be5208ab066c7924a171 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Sep 2024 05:29:13 +0000
-Subject: [PATCH] Add check for 64bit builtin atomics
-
-Compilers for some architectures e.g. RISCV32 do not have 64bit atomics
-therefore, its important to deduce that and use it to pass right flags to
-compiler to use them, e.g. h2o module
-
-Fixes
-nection.c.o): in function `h2o_create_connection':
-| /usr/src/debug/netdata/1.47.1/src/web/server/h2o/libh2o/include/h2o.h:1917:(.text.create_conn+0x5e): undefined reference to `__sync_add_and_fetch_8'
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Submitted [https://github.com/netdata/netdata/pull/18565]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-Index: netdata-v1.47.3/CMakeLists.txt
-===================================================================
---- netdata-v1.47.3.orig/CMakeLists.txt
-+++ netdata-v1.47.3/CMakeLists.txt
-@@ -448,6 +448,15 @@ int main() {
- }
- " HAVE_BUILTIN_ATOMICS)
- 
-+check_cxx_source_compiles("
-+#include <stdint.h>
-+int main(void) {
-+        uint64_t a;
-+        __sync_add_and_fetch(&a, 1);
-+        return 0;
-+}
-+" ARCH_SUPPORTS_64BIT_ATOMICS)
-+
- check_c_source_compiles("
- void my_printf(char const *s, ...) __attribute__((format(gnu_printf, 1, 2)));
- int main() { return 0; }
-@@ -1528,6 +1537,8 @@ if(ENABLE_H2O)
- 
-         target_compile_options(h2o PUBLIC -DH2O_USE_LIBUV=0)
-         target_link_libraries(h2o PRIVATE PkgConfig::TLS)
-+        target_compile_definitions(h2o PRIVATE
-+                "$<$<NOT:$<BOOL:${ARCH_SUPPORTS_64BIT_ATOMICS}>>:H2O_NO_64BIT_ATOMICS>")
- endif()
- 
- #
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
deleted file mode 100644
index f4911f3b6..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: GPL-3.0-or-later
-[Unit]
-Description=Real time performance monitoring
-RequiresMountsFor=/var
-After=network.target
-
-[Service]
-Type=simple
-ExecStartPre=/bin/mkdir -p /var/log/netdata
-ExecStartPre=/bin/chown -R netdata:netdata /var/log/netdata
-ExecStart=/usr/sbin/netdata -D -u netdata
-
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.3.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
similarity index 94%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.47.3.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
index 5c3ceabf8..88dbe19e4 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.3.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
@@ -5,22 +5,28 @@ HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "json-c libuv libyaml util-linux zlib lz4"
+DEPENDS += "\
+    json-c \
+    libuv \
+    libyaml \
+    lz4 \
+    util-linux \
+    zlib \
+    "
 
-SRC_URI = " \
+SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
-    file://0001-Add-check-for-64bit-builtin-atomics.patch \
     file://0002-Do-not-hardcode-systemd-unit-directories.patch \
     file://netdata.conf \
     file://netdata-volatiles.conf \
     ${@bb.utils.contains('PACKAGECONFIG', 'go', 'file://go.d.conf', '', d)} \
     "
-SRC_URI[sha256sum] = "cf906c304ac49ca335bef8f085664efe4c567d47877a91e0744a7942ba351053"
+SRC_URI[sha256sum] = "8073eee2392f92daa1f8bb5cf13fb988b8c3b52ff9574b50706ff69bdbdb51ce"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
-UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
+UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>(?!1\.99)\d+(?:\.\d+)*)"
 
-S = "${WORKDIR}/${BPN}-v${PV}"
+S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 # Stop sending anonymous statistics to Google Analytics
 NETDATA_ANONYMOUS ??= "enabled"
@@ -120,7 +126,7 @@ do_install:append() {
     chown -R netdata:netdata ${D}${datadir}/netdata/web
 }
 
-FILES:${PN} += " \
+FILES:${PN} += "\
     ${localstatedir}/cache/netdata/ \
     ${localstatedir}/lib/netdata/ \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/journald@netdata.conf.d', '', d)} \
-- 
2.39.5


