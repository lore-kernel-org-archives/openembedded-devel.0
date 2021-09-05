Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.13419.1630869479820933673
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mx6ICGgV;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so2962648pjw.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaDWleZ2JsZ2oWnEpVZlyEK6tG8dUxW858IviX2J3YA=;
        b=mx6ICGgV40aG/RdW+BHpOHl/AIfoOzWVvRwrgn35i+hvCFrh885c+eVaeEz/viDRiy
         oWMOrFovmNxX+LsBxW52pc0OkCX7TGiB3OFG5rwaozBK+w3TQqMK8ETRpHqCoAsCumv8
         JszRq3LDWLIJg6qeHinNuacUrN8tGd9rDZldkOpKJm1lNehyHJNziTyxJ8ZSU4uEYDyW
         mjGcqdLoANNEdo8wpZsHzepYRQAJdCJtH2MdsLXUeHAN5ZatRv90OypmRjHpSlTOxa9u
         z2L+EMVS2tvxX70LFqpmvDHpzy+qoei70k4XNilz2qE9/vZUfcfqM4AEJPM8mRhE0RE2
         7L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaDWleZ2JsZ2oWnEpVZlyEK6tG8dUxW858IviX2J3YA=;
        b=GcNFHgeOIpY1T02SLFVkhjExdwgKjpjujn99N/Ka9cDV+LMMA78sIy4WFUnIyv7+Zc
         cdmXOV5SxlUMYbtR7bBKvXiKTErYN/H9WV5LMuYghnpjBjdqKxfaTsJ8FlQI6WD8Tx/t
         ZNdKVNd4cO3HFCie/OGvBPwPT8bR05R1+p+YBxsEHqYDd8g0DCw3f8UcxNmsga9eed2K
         BYwlRxLlxbfJS4/P+FXX9Kmmru7kbttKIUeDd1gCRTU5BZIygOo6Mej391njh6WvLW2s
         faIzE8ZMsergOXe9C1xldgXiU3VRtMhx0xBoTZ07mR1R1LWCtV+teA4n4lXDxGCqTX/i
         61+g==
X-Gm-Message-State: AOAM531pM2Cb2QdfRMJaNYZ2zGk9Fu+Om0Lpfc7KqnZVGQBU2fy8Dg0z
	B7L4J1LkQ/KsJszxW6vyC8smzZ79qPg=
X-Google-Smtp-Source: ABdhPJzMIMZ+awQLhnEiff12h03q0c1vMmaiJbn63kgRnWfDxX8G9lXVpth05EgtLrXSrZ1qdO7r/Q==
X-Received: by 2002:a17:902:bd88:b0:130:1c3d:4c02 with SMTP id q8-20020a170902bd8800b001301c3d4c02mr7777585pls.80.1630869479127;
        Sun, 05 Sep 2021 12:17:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id 68sm5184414pjz.0.2021.09.05.12.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:17:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [meta-oe][hardknott][PATCH] dlt-daemon: update from 2.18.6 to 2.18.7
Date: Sun,  5 Sep 2021 12:17:57 -0700
Message-Id: <20210905191757.2080802-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Gianfranco <costamagna.gianfranco@gmail.com>

- add an upstream proposed patch 317.patch to fix a build failure with enab=
led systemd binding

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 01fa60898c2fe65f327bea2f84aaca00aef3f371)
[Stable version, bug fix only]
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 0000000000..fe40334b65
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
index b3cfb4709f..a16e810be6 100644
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

