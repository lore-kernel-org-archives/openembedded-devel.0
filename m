Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8FFC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10774.1653405855962586717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D663ED1;
	Tue, 24 May 2022 08:24:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05D933F70D;
	Tue, 24 May 2022 08:24:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] lzo: add (from oe-core)
Date: Tue, 24 May 2022 16:24:10 +0100
Message-Id: <20220524152411.1663373-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 15:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97253

lzo is being removed from oe-core, so add it here for people who still
want to use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...onfigdir-to-solve-the-undefine-error.patch | 27 +++++++
 ...Use-memcpy-instead-of-reinventing-it.patch | 70 +++++++++++++++++++
 meta-oe/recipes-support/lzo/lzo/run-ptest     | 33 +++++++++
 meta-oe/recipes-support/lzo/lzo_2.10.bb       | 35 ++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 meta-oe/recipes-support/lzo/lzo/0001-Add-pkgconfigdir=
-to-solve-the-undefine-error.patch
 create mode 100644 meta-oe/recipes-support/lzo/lzo/0001-Use-memcpy-inste=
ad-of-reinventing-it.patch
 create mode 100644 meta-oe/recipes-support/lzo/lzo/run-ptest
 create mode 100644 meta-oe/recipes-support/lzo/lzo_2.10.bb

diff --git a/meta-oe/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-sol=
ve-the-undefine-error.patch b/meta-oe/recipes-support/lzo/lzo/0001-Add-pk=
gconfigdir-to-solve-the-undefine-error.patch
new file mode 100644
index 0000000000..5235a15dc9
--- /dev/null
+++ b/meta-oe/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-=
undefine-error.patch
@@ -0,0 +1,27 @@
+From e730bfd7c2d3a4b5f3605878599cb9b20d31b1fd Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Fri, 2 Jun 2017 11:52:25 +0900
+Subject: [PATCH] Add pkgconfigdir to solve the undefine error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index e4d383b..c75023d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -14,6 +14,7 @@ AM_CPPFLAGS =3D -I$(top_srcdir)/include -I$(top_srcdir=
)
+ LDADD =3D src/liblzo2.la
+ lib_LTLIBRARIES =3D
+ noinst_PROGRAMS =3D
++pkgconfigdir =3D $(libdir)/pkgconfig
+ pkgconfig_DATA =3D lzo2.pc
+=20
+=20
+--=20
+1.9.1
+
diff --git a/meta-oe/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-r=
einventing-it.patch b/meta-oe/recipes-support/lzo/lzo/0001-Use-memcpy-ins=
tead-of-reinventing-it.patch
new file mode 100644
index 0000000000..db3a70e803
--- /dev/null
+++ b/meta-oe/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinvent=
ing-it.patch
@@ -0,0 +1,70 @@
+From: Simon McVittie <smcv@debian.org>
+Date: Sun, 23 Nov 2014 22:50:33 +0000
+Subject: Use memcpy() instead of reinventing it
+
+gcc inlines memcpy() with results as fast as handwritten code (at
+least in my brief testing with lzop), and knows the alignment
+constraints for our architectures.
+
+Change suggested by Julian Taylor.
+
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D757037
+
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ minilzo/minilzo.c | 14 ++++++++++++++
+ src/lzo_func.h    | 14 ++++++++++++++
+ 2 files changed, 28 insertions(+)
+
+
+diff --git a/minilzo/minilzo.c b/minilzo/minilzo.c
+index ab2be5f..6913c2f 100644
+--- a/minilzo/minilzo.c
++++ b/minilzo/minilzo.c
+@@ -3523,6 +3523,20 @@ LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memop=
s_TU8p)0)=3D=3D8)
+     if ((void)0, n__n > 0) do { *d__n++ =3D *s__n++; } while (--n__n > =
0); \
+     LZO_BLOCK_END
+=20
++/* Debian-specific change: we know that our compiler inlines memcpy() w=
ith
++ * constant n to be as fast as handwritten code, and knows which archit=
ectures
++ * need things correctly aligned. */
++#undef LZO_MEMOPS_COPY1
++#undef LZO_MEMOPS_COPY2
++#undef LZO_MEMOPS_COPY4
++#undef LZO_MEMOPS_COPY8
++#undef LZO_MEMOPS_COPYN
++#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
++#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
++#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
++#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
++#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
++
+ __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const lzo_voi=
dp ss)
+ {
+     lzo_uint16_t v;
+diff --git a/src/lzo_func.h b/src/lzo_func.h
+index dfaa676..1cc1b53 100644
+--- a/src/lzo_func.h
++++ b/src/lzo_func.h
+@@ -333,6 +333,20 @@ LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memops_=
TU8p)0)=3D=3D8)
+     if ((void)0, n__n > 0) do { *d__n++ =3D *s__n++; } while (--n__n > =
0); \
+     LZO_BLOCK_END
+=20
++/* Debian-specific change: we know that our compiler inlines memcpy() w=
ith
++ * constant n to be as fast as handwritten code, and knows which archit=
ectures
++ * need things correctly aligned. */
++#undef LZO_MEMOPS_COPY1
++#undef LZO_MEMOPS_COPY2
++#undef LZO_MEMOPS_COPY4
++#undef LZO_MEMOPS_COPY8
++#undef LZO_MEMOPS_COPYN
++#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
++#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
++#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
++#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
++#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
++
+ __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const lzo_voi=
dp ss)
+ {
+     lzo_uint16_t v;
diff --git a/meta-oe/recipes-support/lzo/lzo/run-ptest b/meta-oe/recipes-=
support/lzo/lzo/run-ptest
new file mode 100644
index 0000000000..6acb89fc1f
--- /dev/null
+++ b/meta-oe/recipes-support/lzo/lzo/run-ptest
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+./lzotest -mavail -n10 -q /etc/services
+if [ $? -eq 0 ]; then
+  echo 'PASS: lzotest'
+else
+  echo 'FAIL: lzotest'
+fi
+LZOTEST=3D./lzotest /bin/sh -e "./check.sh" "/etc"
+./align
+if [ $? -eq 0 ]; then
+  echo 'PASS: align'
+else
+  echo 'FAIL: align'
+fi
+./chksum
+if [ $? -eq 0 ]; then
+  echo 'PASS: chksum'
+else
+  echo 'FAIL: chksum'
+fi
+./simple
+if [ $? -eq 0 ]; then
+  echo 'PASS: simple'
+else
+  echo 'FAIL: simple'
+fi
+./testmini
+if [ $? -eq 0 ]; then
+  echo 'PASS: testmini'
+else
+  echo 'FAIL: testmini'
+fi
diff --git a/meta-oe/recipes-support/lzo/lzo_2.10.bb b/meta-oe/recipes-su=
pport/lzo/lzo_2.10.bb
new file mode 100644
index 0000000000..195c2f2939
--- /dev/null
+++ b/meta-oe/recipes-support/lzo/lzo_2.10.bb
@@ -0,0 +1,35 @@
+SUMMARY =3D "Lossless data compression library"
+DESCRIPTION =3D "A portable lossless data compression library written in=
 \
+ANSI C that offers pretty fast compression and *extremely* fast decompre=
ssion. "
+HOMEPAGE =3D "http://www.oberhumer.com/opensource/lzo/"
+SECTION =3D "libs"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
+                    file://src/lzo_init.c;beginline=3D5;endline=3D25;md5=
=3D9ae697ca01829b0a383c5d2d163e0108"
+
+SRC_URI =3D "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.=
tar.gz \
+           file://0001-Use-memcpy-instead-of-reinventing-it.patch \
+	   file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch \
+           file://run-ptest \
+           "
+
+SRC_URI[md5sum] =3D "39d3f3f9c55c87b1e5d6888e1420f4b5"
+SRC_URI[sha256sum] =3D "c0f892943208266f9b6543b3ae308fab6284c5c90e627931=
446fb49b4221a072"
+
+inherit autotools ptest
+
+CVE_PRODUCT =3D "lzo oberhumer:lzo2"
+
+EXTRA_OECONF =3D "--enable-shared"
+
+do_install_ptest() {
+	t=3D${D}${PTEST_PATH}
+	cp ${S}/util/check.sh $t
+	cp ${B}/minilzo/testmini $t
+	for i in tests/align tests/chksum lzotest/lzotest examples/simple
+		do cp ${B}/`dirname $i`/.libs/`basename $i` $t; \
+	done
+}
+
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


