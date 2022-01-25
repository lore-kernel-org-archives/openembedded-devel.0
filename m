Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74414C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 06:37:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.3953.1643092625535146825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 22:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZaWtEh/J;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643092623; i=@fujitsu.com;
	bh=vsLl/dzZawq7viGwJ9kYvXd9Vs7M27ErlkDzbzJpjdM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=ZaWtEh/JA9TsjoqyMkjlUVWWaGGJ+iKbsmwu8jgntBr9SGGvEPWj4W9A0C8PG0pn1
	 3EihO2KC2+4VWEaR5yNuHWZBqg19j2JF8PY5zDLf1ZEJhJRL8rRsPo9gaNPDvlhwIk
	 qao278lUL/eDIqEWNuGn8oPT1JIx1+uEMuMLGEYmGlP9MiR4EIr3jUe0LFUNUttJ0W
	 Ixlw65ruLw6RXrFZT7t+vqxhLIQwnwDbNDNKRbxVDXCOe4IlvRqgx5B/K6PZEMu7wH
	 ifqHO8UJc4k/2TG4YG2O0iot/QtOaN5Gz5sSzo1R7rst885MAjEq+3RNOWF0AazvdP
	 ZvfH4L0+rrC0w==
Received: from [100.115.65.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 5C/3A-24566-F8A9FE16; Tue, 25 Jan 2022 06:37:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleJIrShJLcpLzFFi42Kxs+FI1O2b9T7
  RoOmSmcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH29HPWgjlOFRvPrGBvYJxp3cXIxSEk8IRR
  4uLClYwQzgUmiY8zf7FDOCcYJY49bmHuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sIC7xPUrr1hAbBYBVYn3J+8zgti8Ao4SW95+BYtLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uRmqvkJi1qw2JogabYllC19D1ahJXD23iXkCo8AsJKNmIRk1C0nLAkbmVYx2SUW
  Z6RkluYmZObqGBga6hoamumaWuoamZnqJVbqJeqmlusmpeSVFiUBpvcTyYr3U4mK94src5JwU
  vbzUkk2MwHBOKXads4PxQt9PvUOMkhxMSqK86RPfJwrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  F09AygnWJSanlqRlpkDjC2YtAQHj5IILz9Imre4IDG3ODMdInWKMZzjzdoli5g53oLJtnt3gW
  Q7mJy54OBqZo5ZYPJ++yEg+QBECrHk5eelSonz7p4ONE4AZFxGaR7cMljquMQoKyXMy8jAwCD
  EU5BalJtZgir/ilGcg1FJmPfEZKApPJl5JXA3vQI6lwno3N/n34GcW5KIkJJqYGIwY4ye453o
  fP671rd7no354XXNq/nqDC4q8zSnF6dVM4YK9r554igcMF/qTpRMQbDC1t6l6wo9u2ve3p/U8
  rNY6If7jkuv1p1dsZ5zymfutV/+v1oXd+TeAeEDZ64YL5sRKPllt8zLOAlW0c9TLZddMpJnXv
  Dtzo/kSa8/FP/U3cuTZ9qw2+8T2xoxp+6Y8Lfn15Y177q04eO+Yl6Z6cU2auq3Hn/0MDqly8W
  kEM4QsMDjw4wPDZ4sJveMgr7/+W1+5slJ8y3/1maYzb9Rx3VliYWnD9OMSmXV6y8XBOuuXvRq
  atezdN8rd/RiN4U0afIFOZxtS49qC1PkORDUu8ujauX2K5KLuha+l9H5K67EUpyRaKjFXFScC
  ADoadQVmAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1643092622!67983!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11301 invoked from network); 25 Jan 2022 06:37:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 06:37:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 61F5B100194
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 06:37:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 559E010018F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 06:37:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 06:36:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] dlt-daemon: upgrade 2.18.7 -> 2.18.8
Date: Tue, 25 Jan 2022 14:36:44 +0800
Message-ID: <1643092604-6478-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 06:37:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95052

317.patch
removed since it is included in 2.18.8

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
lib: Fix wrong type alert from lgtm
gtest_dlt_daemon_gateway: fix gtest build failed
lib: generate dlt library internal log file
tests: add stdlib to dlt_cpp_extension
dlt_user: Make dlt_init thread safe
remove clang-tidy analyzer warnings: incompatible pointer type
debian: improve debian build package
dlt-control-common: shutdown and close socket
dlt_common: improve function description
gtest: Bring-in changes
gtest: Rework WORKING_DIRECTORY
gtest: Correct data amount in gtest_dlt_common
cmake: Set empty to systemd_SRCS
gtest: Refactor tests/CMakeLists.txt
lib: Add SOCK_CLOEXEC to socket
daemon: Create parent directory for unix socket
cmake: Correct added subdirectories
console: Add cmake options for control and timestamp
tests: Adapt to DLT_DISABLE_MACRO
header: Adapt to DLT_DISABLE_MACRO
include: Refactor CMakeLists.txt
gtest: Change script name to gtest_dlt_daemon_offline_log.sh
daemon: Enable to use FIFO on QNX
tests: Add new test case with given buffer
tests: Enable macro disabling
lib: Add new interfaces with given buffer
Implemention of tests for the dlt-qnx-system module
lib: Add MaxFileSize handling
client: pthread_join for deinit
doc: update initial log level document
dlt-system: Fix memory leak in dlt-system config
dlt_common: remove duplicate stdbool header
dlt-control: Add option to config port
system: use signalfd for dlt-system
console: provides args option to enable send/receive serial header
fix malformed printf format strings (#295)
cmake: Set WITH_LEGACY_INCLUDE_PATH to ON as default (#334)
Make the legacy include path a CMake option (#332)
daemon: Call dlt_daemon_configuration_load() properly (#330)
dlt_user: Use pthread_setname_np() if available (#326)
libdlt: Add legacy include path in exported CMake config file (#327)
lib: Set TYLE to 1 for BOOL type (#320)
file-transfer: Abort file transfer if get serial number failed
dlt_user.c: fixing casting wrong type
dlt-sortbytimestamp: Remove duplicated conditional statements code
dlt-convert: Remove duplicated conditional statements code
doc: Minor fix in dlt_for_developers.md (#321)
dlt-control-common.c: Fix build failure due to out-of-bound write -Werror=
=3Dstringop-truncation
Extend include path in *.pc file (#319)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dlt-daemon/dlt-daemon/317.patch           | 43 -------------------
 ...-daemon_2.18.7.bb =3D> dlt-daemon_2.18.8.bb} | 11 +++--
 2 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patc=
h
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.7.bb =3D> dlt-=
daemon_2.18.8.bb} (90%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
deleted file mode 100644
index fe40334b6..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Origin: https://github.com/GENIVI/dlt-daemon/pull/317
-From 55d31216823841a1547fe261cdf8e3b1002d5f94 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Thu, 1 Jul 2021 12:58:20 +0200
-Subject: [PATCH] dlt-control-common.c: Fix build failure due to out-of-bou=
nd
- write -Werror=3Dstringop-truncation
-
-cd /build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/src/console/logstorage &&=
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
-make[3]: Leaving directory '/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu'
-In file included from /usr/include/string.h:495,
-                 from /build/dlt-daemon-2.18.7/src/console/dlt-control-com=
mon.c:56:
-In function 'strncpy',
-    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src/co=
nsole/dlt-control-common.c:716:13:
-/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '__bu=
iltin_strncpy' specified bound 4 equals destination size [-Werror=3Dstringo=
p-truncation]
-  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__d=
est));
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
-In function 'strncpy',
-    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src/co=
nsole/dlt-control-common.c:721:13:
-/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '__bu=
iltin_strncpy' specified bound 4 equals destination size [-Werror=3Dstringo=
p-truncation]
-  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__d=
est));
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
----
- src/console/dlt-control-common.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-co=
mmon.c
-index 8a9d29f0..f58d8268 100644
---- a/src/console/dlt-control-common.c
-+++ b/src/console/dlt-control-common.c
-@@ -671,8 +671,8 @@ DltReturnValue dlt_json_filter_load(DltFilter *filter,=
 const char *filename, int
-     struct json_object *j_payload_max;
-     enum json_tokener_error jerr;
-=20
--    char app_id[DLT_ID_SIZE] =3D "";
--    char context_id[DLT_ID_SIZE] =3D "";
-+    char app_id[DLT_ID_SIZE + 1] =3D "";
-+    char context_id[DLT_ID_SIZE + 1] =3D "";
-     int32_t log_level =3D 0;
-     int32_t payload_max =3D INT32_MAX;
-     int32_t payload_min =3D 0;
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
similarity index 90%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index e5a3c7c29..c3fa4677e 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8184208060df=
880fe3137b93eb88aeea"
 DEPENDS =3D "zlib gzip-native json-c"
=20
 SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps;branch=3D=
master \
-    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
-    file://0004-Modify-systemd-config-directory.patch \
-    file://317.patch \
-"
-SRCREV =3D "24d197214bfdcec7430d31b42e5c87df27287aaf"
+           file://0002-Don-t-execute-processes-as-a-specific-user.patch \
+           file://0004-Modify-systemd-config-directory.patch \
+           "
+SRCREV =3D "1438fcf8c88cd47b20b2984180a8457c3eb9193d"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -31,7 +30,7 @@ PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES=
', 'systemd', ' systemd s
 PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMP=
LES=3DOFF,,dlt-daemon-systemd"
=20
 # Linux options
-PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF,syste=
md"
+PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF -DWIT=
H_DLT_SYSTEM=3DOFF,systemd"
 PACKAGECONFIG[systemd-watchdog] =3D "-DWITH_SYSTEMD_WATCHDOG=3DON,-DWITH_S=
YSTEMD_WATCHDOG=3DOFF,systemd,libsystemd"
 PACKAGECONFIG[systemd-journal] =3D "-DWITH_SYSTEMD_JOURNAL=3DON,-DWITH_SYS=
TEMD_JOURNAL=3DOFF,systemd,libsystemd"
 PACKAGECONFIG[dlt-dbus] =3D "-DWITH_DLT_DBUS=3DON,-DWITH_DLT_DBUS=3DOFF,db=
us,dbus-lib"
--=20
2.25.1


