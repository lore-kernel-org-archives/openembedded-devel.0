Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.5701.1625139500489461555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 04:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TkYRDzh3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso3865080wmj.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6H1cICd/ETL7xZFcdWs5Opr3VGwlD9Fmq8xfMrioHH0=;
        b=TkYRDzh3jFPnpEvn5EJ2oc8DxinFX3QkU7m4PRwsj0BpEKg6K1Ez7ARGH/528hTP87
         /yauDoy3FEeOUUbPIvbhkx7kY44Q3kyPddR9DHbYoQzXzT6i92KIt7Qj6+L7DS6JKvki
         aWfl/5PRYiewFIhcp+3MPtinIQRKNuQ0Ck0luTrDC8oau1MHk82/HYngJb31VKIPpMP5
         BTIdcnbkT8aGymvJJu9wuawedN+wTsxLznh80rMFqosWhDfzh3GYDS9unlvW24VOlJpR
         a+TE86lMv4OaHpM40lJnEEFHVX95acBSVRmrnWgErRIV/wUUZ3yhOwbgrxwXQOdI4z0a
         hwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6H1cICd/ETL7xZFcdWs5Opr3VGwlD9Fmq8xfMrioHH0=;
        b=ZlDC/XPAEkN2sMcWnV4on7gsEC7FzW2L2MONO+kBxaiOHe4nMsk/EuEh2hBaZdAwCK
         RDsFZkjQh/6laAb75nV5GB5EjJ10sDvJpwy3/PZxh66prsIJwzOItCirAxNXKvIGxGq/
         CYSbuLEkwh+CprsZSum7ujV0VCuDaASHVd3xy6Of9880HDc1dA6RMYNzim9R9eP6Sdz4
         98RLqjRlKT+rfgx4Q9U/cb2BjErELK3938B+NgeUSNywfum0uE4OYx7RG7GGMAi3559t
         XduqG+VapR23ARGmje2ovFxlW3dyy2Lv4cIXKvSKX2eRzM1MgdfyoHYqHmX9eE92NAud
         fgwA==
X-Gm-Message-State: AOAM530QFCUHAavDkAtKHcX15tBC/e1r87iiJ74PJ2HN/wj52iGP+C9S
	AGxVIbtwbwmyzyYkfmaJhN+TVgizOrtGhg==
X-Google-Smtp-Source: ABdhPJxs8/IJHBC10rVfLk3PL/um7qolCi+BpiAGT6xcHLEvWE69e8alFzI+KMWjZW7zVF8hIS0jgQ==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr10177683wmh.169.1625139498672;
        Thu, 01 Jul 2021 04:38:18 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([5.170.214.66])
        by smtp.gmail.com with ESMTPSA id a9sm24554279wrv.37.2021.07.01.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:38:18 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: update from 2.18.6 to 2.18.7 - add an upstream proposed patch 317.patch to fix a build failure with enabled systemd binding
Date: Thu,  1 Jul 2021 13:38:15 +0200
Message-Id: <20210701113815.1818733-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/317.patch           | 43 +++++++++++++++++++
 ...-daemon_2.18.6.bb =3D> dlt-daemon_2.18.7.bb} |  9 ++--
 2 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.6.bb =3D> dlt-=
daemon_2.18.7.bb} (88%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
new file mode 100644
index 000000000..fe40334b6
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
@@ -0,0 +1,43 @@
+Origin: https://github.com/GENIVI/dlt-daemon/pull/317
+From 55d31216823841a1547fe261cdf8e3b1002d5f94 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Thu, 1 Jul 2021 12:58:20 +0200
+Subject: [PATCH] dlt-control-common.c: Fix build failure due to out-of-bou=
nd
+ write -Werror=3Dstringop-truncation
+
+cd /build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/src/console/logstorage &&=
 /usr/bin/cc -DCONFIGURATION_FILES_DIR=3D\"/etc\" -DDLT_DAEMON_USE_FIFO_IPC=
 -DDLT_LIB_USE_FIFO_IPC -DDLT_NETWORK_TRACE_ENABLE -DDLT_SYSTEMD_ENABLE -DD=
LT_SYSTEMD_JOURNAL_ENABLE -DDLT_UNIT_TESTS -DDLT_USER_IPC_PATH=3D\"/tmp\" -=
DDLT_USE_IPv6 -DEXTENDED_FILTERING -D_GNU_SOURCE -I/build/dlt-daemon-2.18.7=
 -I/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/include/dlt -I/build/dlt-d=
aemon-2.18.7/include/dlt -I/build/dlt-daemon-2.18.7/src/shared -I/build/dlt=
-daemon-2.18.7/src/core_dump_handler -I/build/dlt-daemon-2.18.7/src/offline=
logstorage -I/build/dlt-daemon-2.18.7/src/lib -I/build/dlt-daemon-2.18.7/sr=
c/daemon -I/build/dlt-daemon-2.18.7/src/console -I/build/dlt-daemon-2.18.7/=
src/gateway -I/build/dlt-daemon-2.18.7/systemd/3rdparty -g -O2 -ffile-prefi=
x-map=3D/build/dlt-daemon-2.18.7=3D. -fstack-protector-strong -Wformat -Wer=
ror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2   -Werror -std=3Dgn=
u99 -Wall -Wextra -Wno-variadic-macros -Wno-strict-aliasing -o CMakeFiles/d=
lt-logstorage-ctrl.dir/__/dlt-control-common.c.o -c /build/dlt-daemon-2.18.=
7/src/console/dlt-control-common.c
+make[3]: Leaving directory '/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu'
+In file included from /usr/include/string.h:495,
+                 from /build/dlt-daemon-2.18.7/src/console/dlt-control-com=
mon.c:56:
+In function 'strncpy',
+    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src/co=
nsole/dlt-control-common.c:716:13:
+/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '__bu=
iltin_strncpy' specified bound 4 equals destination size [-Werror=3Dstringo=
p-truncation]
+  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__d=
est));
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
+In function 'strncpy',
+    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src/co=
nsole/dlt-control-common.c:721:13:
+/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '__bu=
iltin_strncpy' specified bound 4 equals destination size [-Werror=3Dstringo=
p-truncation]
+  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__d=
est));
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ src/console/dlt-control-common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-co=
mmon.c
+index 8a9d29f0..f58d8268 100644
+--- a/src/console/dlt-control-common.c
++++ b/src/console/dlt-control-common.c
+@@ -671,8 +671,8 @@ DltReturnValue dlt_json_filter_load(DltFilter *filter,=
 const char *filename, int
+     struct json_object *j_payload_max;
+     enum json_tokener_error jerr;
+=20
+-    char app_id[DLT_ID_SIZE] =3D "";
+-    char context_id[DLT_ID_SIZE] =3D "";
++    char app_id[DLT_ID_SIZE + 1] =3D "";
++    char context_id[DLT_ID_SIZE + 1] =3D "";
+     int32_t log_level =3D 0;
+     int32_t payload_max =3D INT32_MAX;
+     int32_t payload_min =3D 0;
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
similarity index 88%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
index b3cfb4709..c4ad59381 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
@@ -12,18 +12,19 @@ SECTION =3D "console/utils"
 LICENSE =3D "MPLv2"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8184208060df880fe3137b93eb88aee=
a"
=20
-DEPENDS =3D "zlib gzip-native"
+DEPENDS =3D "zlib gzip-native json-c"
=20
 SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
+    file://317.patch \
 "
-SRCREV =3D "22715aeceaa81ace2c832312529bde3a42d0814f"
+SRCREV =3D "24d197214bfdcec7430d31b42e5c87df27287aaf"
=20
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' s=
ystemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-consol=
e ', '', d)} \
- udp-connection dlt-system dlt-filetransfer "
+ udp-connection dlt-system dlt-filetransfer dlt-examples systemd systemd-w=
atchdog systemd-journal dlt-dbus udp-connection dlt-adaptor dlt-system dlt-=
filetransfer dlt-console "
 # dlt-dbus
=20
 # General options
@@ -44,7 +45,7 @@ PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-=
DWITH_DLT_CONSOLE=3DOFF,,dlt-
=20
 inherit autotools gettext cmake systemd
=20
-EXTRA_OECMAKE +=3D "-DSYSTEMD_UNITDIR=3D${systemd_system_unitdir}"
+EXTRA_OECMAKE +=3D "-DWITH_EXTENDED_FILTERING=3DON -DSYSTEMD_UNITDIR=3D${s=
ystemd_system_unitdir}"
=20
 PACKAGES +=3D "${PN}-systemd"
 SYSTEMD_PACKAGES =3D "${PN} ${PN}-systemd"
--=20
2.25.1

