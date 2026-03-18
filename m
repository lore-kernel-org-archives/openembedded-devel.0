Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826AC10854D1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 03:05:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6026.1773803096267447004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 20:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qsZzUDlI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773803094; x=1805339094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qf+CUfvS7CFx64wKpLrSw7rhlO9DCtWduUqN5ADsG0g=;
  b=qsZzUDlI9reuwitoZPZDc3ptFZ+Sujm1xOXhMMVCNItDJ3vY6b0LYxZb
   iS9NMR4xLHlvRhR2Jq6z9xuaA79Pvfy0QFx1LEwCxxeGbR+pud/XiSBLh
   t9SljRQzBFlhpnQ73y/w35c9KKrfIS++n5yrCJtuVj0WNam2Kfqp6TwU0
   VrKx+5rxY70X/dgG1neYH6DGLB5cTlH3gF7XWxSLlImiUf3Pa/FLz6kwN
   8hZognmWLhE7TV3ZcmVuATrwY+rnc1o2JSTC6wH3NPiH4VMYwkoiU4r46
   xypZqMy9HPVY89aJTP+6mFbfKrZ12G3U/XVuq89iW0WfoRUTEzCkCSp/x
   w==;
X-CSE-ConnectionGUID: E/hIR9l0RVah/aYV2yQKvQ==
X-CSE-MsgGUID: GdDbqcbCQeaczYaICP/pYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="234368910"
X-IronPort-AV: E=Sophos;i="6.23,126,1770562800"; 
   d="scan'208";a="234368910"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:04:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 80B041C000B7
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:04:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2F47A1809AE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:04:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6FCCB140058E;
	Wed, 18 Mar 2026 03:04:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-m2crypto: fix do_compile error using clang
Date: Wed, 18 Mar 2026 11:04:45 +0800
Message-ID: <20260318030446.2041-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 03:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125338

From: Wang Mingyu <wangmy@fujitsu.com>

erre message:
| INFO:mkpath:creating build/temp.linux-aarch64-cpython-314/src/SWIG
| INFO:spawn:aarch64-yoe-linux-clang -mcpu=3Dcortex-a57+crc --dyld-prefix=
=3D/usr -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security -fstack-protector-strong -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=
=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.=
0/recipe-sysroot -O2 -g -ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/c=
ortexa57-yoe-linux/python3-m2crypto/0.47.0/sources/m2crypto-0.47.0=3D/usr/s=
rc/debug/python3-m2crypto/0.47.0 -ffile-prefix-map=3D/srv/build/yoe/build/t=
mp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0/sources/m2crypto-0.47.0=
=3D/usr/src/debug/python3-m2crypto/0.47.0 -ffile-prefix-map=3D/srv/build/yo=
e/build/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0/recipe-sysroot=
=3D -ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/p=
ython3-m2crypto/0.47.0/recipe-sysroot-native=3D -pipe -fPIC -I/srv/build/yo=
e/build/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0/recipe-sysroot=
/usr/include/python3.14 -I/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux=
/python3-m2crypto/0.47.0/sources/m2crypto-0.47.0/src/SWIG -c src/SWIG/_m2cr=
ypto_wrap.c -o build/temp.linux-aarch64-cpython-314/src/SWIG/_m2crypto_wrap=
.o -DTHREADING -Wno-deprecated-declarations
| src/SWIG/_m2crypto_wrap.c:4455:1: error: unknown type name 'PRAGMA_IGNORE=
_UNUSED_LABEL'
|  4455 | PRAGMA_IGNORE_UNUSED_LABEL
|       | ^
| src/SWIG/_m2crypto_wrap.c:4456:30: error: expected ';' after top level de=
clarator
|  4456 | PRAGMA_WARN_STRICT_PROTOTYPES
|       |                              ^
|       |                              ;
| 2 errors generated.

Add patch 0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch t=
o avoid clang GNUC pragma block before _lib.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lang-GNUC-pragma-block-before-_lib.h.patch | 49 +++++++++++++++++++
 .../python/python3-m2crypto_0.47.0.bb         |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/00=
01-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-=
swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch b/meta-python/recipe=
s-devtools/python/python3-m2crypto/0001-fix-swig-avoid-clang-GNUC-pragma-bl=
ock-before-_lib.h.patch
new file mode 100644
index 0000000000..7aa768f44d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-swig-av=
oid-clang-GNUC-pragma-block-before-_lib.h.patch
@@ -0,0 +1,49 @@
+From df210da932c2cab9d3a80ee88c70611d77824a15 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 18 Mar 2026 02:26:56 +0000
+Subject: [PATCH] fix(swig): avoid clang GNUC pragma block before _lib.h
+
+Clang defines __GNUC__, so the old guard emitted PRAGMA_* tokens before
+they were defined, breaking builds on macOS/clang; move the block after
+<_lib.h> and exclude clang while keeping the GCC<5 workaround.
+
+Fixes: https://todo.sr.ht/~mcepl/m2crypto/392
+
+Upstream-Status: Backport [git.sr.ht/~mcepl/m2crypto/commit/504ca8f438afb0=
f5041d2b5163e5f666a9a1b742.patch]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/SWIG/_m2crypto.i | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/SWIG/_m2crypto.i b/src/SWIG/_m2crypto.i
+index d89d355..5426446 100644
+--- a/src/SWIG/_m2crypto.i
++++ b/src/SWIG/_m2crypto.i
+@@ -43,15 +43,18 @@ typedef unsigned __int64 uint64_t;
+ %}
+=20
+ %{
+-#if defined __GNUC__ && __GNUC__ < 5
+-PRAGMA_IGNORE_UNUSED_LABEL
+-PRAGMA_WARN_STRICT_PROTOTYPES
+-#endif
+-
+ #include <openssl/err.h>
+ #include <openssl/rand.h>
+ #include <_lib.h>
+=20
++/* _lib.h defines PRAGMA_* helpers; only needed for old GCC (clang defines
++ * __GNUC__ too, but doesn't need this workaround).
++ */
++#if defined(__GNUC__) && !defined(__clang__) && (__GNUC__ < 5)
++PRAGMA_IGNORE_UNUSED_LABEL
++PRAGMA_WARN_STRICT_PROTOTYPES
++#endif
++
+ #include "compile.h"
+=20
+ static PyObject *ssl_verify_cb_func;
+--=20
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb=
 b/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
index ba7bd9b8e3..0ebe30f81c 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/BSD-2-Clause.txt;md5=
=3D8099b0e569f862ece05740a
=20
 SRC_URI[sha256sum] =3D "9256300be1e0412be802aa1f827e0ce7f94deb1099b8ccdcfd=
9867a7f0f975bf"
=20
-SRC_URI +=3D "file://0001-setup.py-Make-the-cmd-available.patch"
+SRC_URI +=3D "file://0001-setup.py-Make-the-cmd-available.patch \
+            file://0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib=
.h.patch"
=20
 CVE_STATUS[CVE-2009-0127] =3D "disputed: upstream claims there is no bug"
 CVE_STATUS[CVE-2020-25657] =3D "fixed-version: the used version (0.46.2) c=
ontains the fix already"
--=20
2.43.0


