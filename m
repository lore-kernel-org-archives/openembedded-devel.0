Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.13445.1630869678566540994
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N1FBpmUe;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id q3so2642358plx.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqzsR3s0cEKT5pbW8kEtlCRAsyfYbOF+prDfPVJImLU=;
        b=N1FBpmUe3I6yRvpo4/KWbTW+97oQMN/xstMCf6BiJTQ8E01afgbIbk0zoL8mEW+k+f
         ktrzsE+5C80o9mC5numnSb6Gfqe4T3Dmx6UZu5JFuDFwJPnczPr9aUZujF6vW5DAZro+
         rnphKW5g46Zv7A6Nl1cFS7z5NPoGA3VwmE3SJ3lT9ayfwt95NYM2/fncr+Gu+JsnFvq1
         hiJPXhpzF+uJDSSTk+HeWjn9CglWaWTse7C381asiDQ+IRFS9LMVa6iKEpogHGjlU7ic
         H1e6tPOYs73x+4RvoaVYWucBQvgre+kLPzDWPCS6M8OWxbrQBvlJ861Kb2MpwqZ2zW9S
         magg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqzsR3s0cEKT5pbW8kEtlCRAsyfYbOF+prDfPVJImLU=;
        b=nb/jvKaRWmC/jC8Y3ed0V8YSBeiVaQ6NhlgDhFbVFx6cDsHAmY5LyFDn8B6nFE8de7
         WkppoQQb5LTpP9eAb0+JeO8+tz41r3VhbJZm6grVHkEMkyxfJuJnGFK6NymbqsuQOORm
         Ps+OEjTr258T9vLcMEPK7hyqGNO0i96nld45AkrhnTfokzEetA+MceidVTRkHVEzjVn0
         kAMpfx16j5M/4y9z3vGQW7pPRPGNA5HypYvMY1In4bfhvEkkClLtEs/PY1CvFcTzHfUU
         43iuA/fA7gPR0VrQA7+xAIK6y+BJoLnROa40kQ9rjH45mugcjUr6oeuvPpSzBV8Ewp2f
         nwnw==
X-Gm-Message-State: AOAM530wCd6BqBwph6TCfAt2Wn8B0WlVp2Te1KtDtTguCM3va3n+CT/L
	2WHKS72D68bER2fipfb08+qYPGhSbxg=
X-Google-Smtp-Source: ABdhPJwPyzLmT4y8LntpiVn2d0puOGSJI83J2Uxm1QtHRGSaK33P8nM/t21SK3FJe2urrk9cPfd/PQ==
X-Received: by 2002:a17:902:64d0:b0:139:f23d:614 with SMTP id y16-20020a17090264d000b00139f23d0614mr7820201pli.76.1630869677920;
        Sun, 05 Sep 2021 12:21:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:17 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [PATCH 6/8] dlt-daemon: update from 2.18.6 to 2.18.7
Date: Sun,  5 Sep 2021 12:21:09 -0700
Message-Id: <20210905192112.2081037-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905192112.2081037-1-akuster808@gmail.com>
References: <20210905192112.2081037-1-akuster808@gmail.com>
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
index b7a6cdaa29..842652889c 100644
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
@@ -40,7 +41,7 @@ PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-=
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

