Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3840.1794729077182277504
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aOmO2p2x;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3151709eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729076; x=1795333876; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wu6G94l56VFqgE+zGB7QNqrija5U/fA6qFRpLHw/zA8=;
        b=aOmO2p2xJO8YBY+i1WbGqnmG0uc8t5pI6SSPBZi9dLKtgijMhQeySewtQYbtNdmMl3
         HASZXnv7KoaZopB/pEsS77O/UZhSqXTg4nBx0cfnIeYN8cys7FdeR+1IVNJ9DvzYmvw+
         woqVm/qAwtnGSTOuOdopDQSnQC3YEcOLM5ICDwX1+Ob4Zec6K3jsR7zgKztnBOUM5kay
         RGRpyVgXmTRYhbwhDN2TS5We+PgxKoYj8TbUFJT+d+ydkIIzff84iSv2WK8HSAxxRUI2
         qze379wpwa6jxeL7mln9QCKzszQpoibhPdxz6wS9Xdxs0PfU26wcuVQhv4JMcDeiZKmM
         HXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729076; x=1795333876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wu6G94l56VFqgE+zGB7QNqrija5U/fA6qFRpLHw/zA8=;
        b=IUmqYbWX0daQse9Pg1gVakcTYPTQkhwJrLGHhz0uC/XofGJwZ8YYTkrpITLaQJLtiK
         uB1PJssoSaQr/mgsd+0oP3+oJn+UOUWqgl0RRjcv3D4AEnUpoijnpbVANyPnHZ1+5Www
         e8+YJbfzll9JZ/4asCe9OOQDCFGW1Ha7Qh+3NYGmvVQuXKo3h0JbnH/SwUuP9d7XbdA8
         IshzzqekR1phntddVq2RV6wkyrVFsYnmiV0nUt8ZFegPi+78eSYvEV8RRJ9zVR0UUd6e
         V8GTrumx8kisoHxPDoNnTq543gYAwkHRHypIJu1gfVkI3ErIOPi7RUBh7Q/kW+zXqOqr
         615A==
X-Gm-Message-State: APuU4Z/pnJ9ak9mFklkFVaN4QKeOdBDyV/s0d/c/GrSCYoX6wfX1pwx5
	Yu4BEgecpdxKhzmuew5e+FzR5zpXLM9DHT5JnC/lW7HI3iQ0uF3mA6B4QXYyPYrt
X-Gm-Gg: AYBFou1kOft3Kqq3IoR1FNImCOSO5iT52OIJXGsREK350qf2u2/RJCIJeFfc4OPR6Jw
	6rGZUxNKcgHCgtMgyW63PoW58VzUfDCqwszJKnmX1pvgTtrY1KN0uy2ZgpOWY1tyMqYe7XeUAvY
	DmbNpsn+TKiSVZ7lbQqjaNdW1WFFwEA2oNfwyQt0dhQTQjSLqMcI/oVaFDYRL3O/+or1f5mB0MO
	OocifQfVVW0EKlRGtVuoSzu8MP1vs0HIXAYASqKgP/+QMwobClDzjheWMvO45ONMwSxGh4KoONs
	FRatPf8CTGqRBPUwi4jj1u7it+C7racV88bqAY0SJ3j2w/c4RfiHXEtRcenmuRK/tt3MvmaypVE
	g3p+77n7HB1y09k2Ugy63POzPvQeJ4v/0k7aAbFZFiD7qEuhkz1rO4yA/6lzd5/j0OmTjqcqdJx
	oTa2q7iLarMqoJI5ubmG68JUj2FdnE1o7bdwOAmTjEmCIZY603lwNJAD/OPiyTIsf6gOj3dpusK
	hA7CM8whOg3QXir7JPTri5j9iJDIc66Qq6/0e838Gaf7Ib6+SaOm+oJIp97nMe/pJO8o6vTEh5v
	VpPYDoynVYISENRZ+r/rpt7d814nKCwte/rEE448koh/bajvtrdAzuABt97SwYVz22kbedPijrA
	mw9dYU8I2tormCYpW1wXAwkoIKy4TreYA58kyk4D1NOsyMGI06kQ7VF50B3eM593t7SPSb7Ve3a
	MYNbluKrOnmfNxfsOQ6rwhX0CeTxmhMRbjg08rBPP6t6xGg7UfQhhIhMvmoUvhFJ3X3is9FdSyR
	vVtNCkLQmZyseRYo3NLtoJld5mcDInoCfG2/Q/annRtFcPy7ww0dZnOryrTL8i1TPOfuF/JOxno
	gKa7
X-Received: by 2002:a05:7301:fd04:b0:36e:a265:8ee with SMTP id 5a478bee46e88-37966771bb5mr6942602eec.18.1794729076405;
        Sat, 14 Nov 2026 23:51:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 71/96] libplist: upgrade 2.7.0 -> 2.8.1
Date: Sat, 14 Nov 2026 23:48:49 -0800
Message-ID: <20261115074918.2932593-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132341
Content-Type: text/plain; charset="utf-8"

Drop 0001-test-fix-operator-error.patch and
0001-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch, the
tests were fixed upstream.

Install the new date_val_test, xml_behavior_test and
bplist_behavior_test programs for the ptests, and use rm -f in
run-ptest so the script does not exit non-zero when the last test
leaves no data behind.

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pes.test-Fix-ostep-invalid-types-tes.patch | 49 -------------
 .../0001-test-fix-operator-error.patch        | 68 -------------------
 .../libimobiledevice/libplist/run-ptest       |  2 +-
 .../{libplist_2.7.0.bb => libplist_2.8.1.bb}  |  8 +--
 4 files changed, 5 insertions(+), 122 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/0001-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch
 delete mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.7.0.bb => libplist_2.8.1.bb} (90%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch
deleted file mode 100644
index 798ed47487..0000000000
--- a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d87f49535f5e815e91e309472c47da2375cbb5f4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 Nov 2025 18:18:04 -0800
-Subject: [PATCH] ostep-invalid-types.test: Fix ostep-invalid-types test to
- accept both success and error codes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The ostep-invalid-types.test expects plistutil to return exit code 2
-when converting binary plist data containing NSData objects to OpenStep
-format, since OpenStep format doesn't natively support binary data types.
-
-However, plistutil's current behavior is to succeed (exit 0) and output
-the binary data as hex-encoded strings in OpenStep format, which is a
-valid fallback representation.
-
-This patch updates the test to accept both behaviors:
-- Exit code 0: Success with hex-encoded binary data (current behavior)
-- Exit code 2: Explicit rejection of unsupported type (expected behavior)
-
-Both outcomes are acceptable - either the tool can gracefully handle the
-conversion by encoding binary data as strings, or it can reject formats
-that don't support all input types. The test should not fail in either case.
-
-Upstream never noticed because they wrote -neq instead of -ne, so the
-first check is effectively broken and doesn’t enforce the exit code.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/ostep-invalid-types.test | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.test
-index 240505c..ebfc6b0 100755
---- a/test/ostep-invalid-types.test
-+++ b/test/ostep-invalid-types.test
-@@ -14,7 +14,8 @@ export PLIST_OSTEP_DEBUG=1
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /dev/null
--if [ $? -ne 2 ]; then
-+rc=$?
-+if [ $rc -ne 0 ] && [ $rc -ne 2 ]; then
-   exit 1
- fi
- 
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
deleted file mode 100644
index 0866851537..0000000000
--- a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 18e5b22a71f85091127cc063db79c8df687c582c Mon Sep 17 00:00:00 2001
-From: Ankur Tyagi <ankur.tyagi85@gmail.com>
-Date: Thu, 20 Nov 2025 16:01:58 +1300
-Subject: [PATCH] test: fix operator error
-
-Otherwise test fail with error [: -neq: binary operator expected
-
-Upstream-Status: Submitted [https://github.com/libimobiledevice/libplist/pull/284]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- test/json-invalid-types.test  | 6 +++---
- test/ostep-invalid-types.test | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/test/json-invalid-types.test b/test/json-invalid-types.test
-index c532316..a21fcd9 100755
---- a/test/json-invalid-types.test
-+++ b/test/json-invalid-types.test
-@@ -14,19 +14,19 @@ export PLIST_JSON_DEBUG=1
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE0 -o /dev/null
--if [ $? -neq 2 ]; then
-+if [ $? -ne 2 ]; then
-   exit 1
- fi
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE1 -o /dev/null
--if [ $? -neq 2 ]; then
-+if [ $? -ne 2 ]; then
-   exit 2
- fi
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE2 -o /dev/null
--if [ $? -neq 2 ]; then
-+if [ $? -ne 2 ]; then
-   exit 3
- fi
- 
-diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.test
-index 9222394..240505c 100755
---- a/test/ostep-invalid-types.test
-+++ b/test/ostep-invalid-types.test
-@@ -14,19 +14,19 @@ export PLIST_OSTEP_DEBUG=1
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /dev/null
--if [ $? -neq 2 ]; then
-+if [ $? -ne 2 ]; then
-   exit 1
- fi
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f openstepn -i $DATASRC/$TESTFILE1 -o /dev/null
--if [ $? -neq 2 ]; then
-+if [ $? -ne 2 ]; then
-   exit 2
- fi
- 
- echo "Converting (failure expected)"
- $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE2 -o /dev/null
--if [ $? -neq 2 ]; then
-+if [ $? -ne 2 ]; then
-   exit 3
- fi
- 
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
index ed940af5f6..0d1683e729 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
@@ -2,5 +2,5 @@
 
 for t in `ls test/*.test`; do
 	top_srcdir=$(pwd)/input top_builddir=$(pwd)/test ./$t && echo PASS: $t || echo FAIL: $t
-	rm $(pwd)/test/test/data/* 2>/dev/null
+	rm -f $(pwd)/test/test/data/*
 done
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.8.1.bb
similarity index 90%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.8.1.bb
index f0dc784e73..e541683f5e 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.8.1.bb
@@ -8,11 +8,9 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig ptest
 
-SRCREV = "cf5897a71ea412ea2aeb1e2f6b5ea74d4fabfd8c"
+SRCREV = "678b1a34693b86ae1787fa470dcb7203ffd0ef3f"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master;tag=${PV} \
            file://run-ptest \
-           file://0001-test-fix-operator-error.patch \
-           file://0001-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch \
 "
 
 CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
@@ -44,7 +42,9 @@ do_install_ptest(){
     install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/
     install ${S}/test/*.test ${D}${PTEST_PATH}/test/
     install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/test/test/.libs/
-    install -m 0755 ${B}/test/.libs/integer_set_test ${D}${PTEST_PATH}/test/test/
+    for t in integer_set_test date_val_test xml_behavior_test bplist_behavior_test; do
+        install -m 0755 ${B}/test/.libs/$t ${D}${PTEST_PATH}/test/test/
+    done
     for t in $(find ${B}/test -type f -name 'plist*' \! -name '*.o'); do
         install -m 0755 $t ${D}${PTEST_PATH}/test/test/
     done
