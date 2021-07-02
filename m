Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.12488.1625245096824990655
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=stNOu1/+;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so6816195wmc.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jul 2021 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HDwHPjZN7Iu9Bpb1PT3xd3nT/X9DB+v3/9J8+2LzZ0=;
        b=stNOu1/+NR2rBzn9xxot9l49MaTnQWQSWHvg11nN8uYDORYTiwjVpiFzCcZ287D3GR
         2X3R9WwdbUi0plCaG6d5Nf7W/Z0GhtskE5t9hDmG/cRR+kpSbVN4SbGF92AVsH7Nlxwx
         gV8U3rPc7hEIzP6LI3Eab3Gt0fYqFuzXeVpzTiOFaluC9ti7rCPSzdAs2Sar5a9a1ojZ
         Sh/MRFQ/fjA8TPXiNiXwVV6kqmYpLfpd6Dub6+51EwGcNwPuuX7JJkWVw7mNLizlD3Lb
         h+a9keEhsLNAmcxkppmr0nvU77Alav1Qt/WdIyXJ85ECv9k/nq21toOzLmpTRNTwanyo
         3FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HDwHPjZN7Iu9Bpb1PT3xd3nT/X9DB+v3/9J8+2LzZ0=;
        b=cjr1ZsEVqFwYG3dMZ1bxzfQ+syfFwfPhiQi3eHwri5Ivi5X1ociKh1Mf2PC4qOz6OH
         asTfkmwoFz4BZBaQivIsEVhD5uvGQACPx9a5Q35ujdVAwGjnDcKDu5TR3UvOCoiQ3hcs
         Gs6f4UHUM8d7tt/TC3WS4SDrzgmxpvRYjqxGF0R/Y+OgsNwBAh08h/EoTGIjDwf8Rrh9
         l3KlfxROsshYHz2SLl33SIY4JeiZb43u3KkCiVfrYt481LMY6hh7sbLO0TZss72MWScB
         xCtlI9qWnSpp5w7LeNR8/HZKMgyrC/9aFnlDeQKY5tfBUYVYwdqGXaDtKV69PmWT/AUX
         TicQ==
X-Gm-Message-State: AOAM5328OJ1eg7GFPggXJB+IqptpwQYTkqR+ErfcV1gXJHkqukSjZm0W
	RvYuHtraCP5TzrIFG0Z9m28i+XH/aRE=
X-Google-Smtp-Source: ABdhPJwskaBlRD9n3xUzwPJIH+ln/nXq1+vzQfLwzqmJzsf3WPCpMvlKkhkpU02Ef4kQhKmObdXblw==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr460720wmj.119.1625245095031;
        Fri, 02 Jul 2021 09:58:15 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (93-50-192-18.ip153.fastwebnet.it. [93.50.192.18])
        by smtp.gmail.com with ESMTPSA id a16sm4653934wrx.72.2021.07.02.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 09:58:14 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: update from 2.18.6 to 2.18.7 - add an upstream proposed patch 317.patch to fix a build failure with enabled systemd binding
Date: Fri,  2 Jul 2021 18:58:12 +0200
Message-Id: <20210702165813.2012360-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/317.patch           | 43 +++++++++++++++++++
 ...-daemon_2.18.6.bb =3D> dlt-daemon_2.18.7.bb} |  7 +--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.6.bb =3D> dlt-=
daemon_2.18.7.bb} (93%)

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
similarity index 93%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
index b3cfb4709..a16e810be 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
@@ -12,13 +12,14 @@ SECTION =3D "console/utils"
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

