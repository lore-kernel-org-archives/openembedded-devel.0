Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93D6D0D795
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 14:24:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12977.1728656657854762646
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 07:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eZVBIuxn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BEOGNT010863;
	Fri, 11 Oct 2024 09:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728656656;
	bh=XweXGVLLwMjQ09KdqV0CUaRF2S+45nZKQDP7ay2r6CQ=;
	h=From:To:Subject:Date;
	b=eZVBIuxnDralCy2pGjaoYfwzkPMyjwt47UxLvgzy6UYKAyyABPMKukQ5kNYIjzxxg
	 /w2PtrCcMV37Q2y5L2awyikwBb9MJ0GiKyMUoEIQ0krLr4jYEHZRE7KOoFhaop7GhS
	 9dQloP9iokEd5dgUo611c8jL7WMGLZ4ky9/kgD5M=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BEOGd6000520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 09:24:16 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 09:24:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 09:24:16 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BEOGB7106790;
	Fri, 11 Oct 2024 09:24:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1szGYy-0003E7-9z; Fri, 11 Oct 2024 09:24:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][master][PATCH] kernel-selftest: Update to allow for turning on all tests
Date: Fri, 11 Oct 2024 09:24:15 -0500
Message-ID: <20241011142416.12363-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 14:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112802

In testing adding in more kernel-selftests there were a number of issues
that arose that require changes that are more appropriate for the main
recipe and not a bbappend.

1) Stop looping over TEST_LIST ourselves and use the TARGETS="" provided
by the kernel-sefltest Makefiles.  This correctly sets up various
variables that the selftest Makefiles all need.  Also, do_install
becomes cleaner because the main Makefile already installs the list of
tests and the top level script.

2) Add DEBUG_PREFIX_MAP to the CC setting to avoid some "buildpaths" QA
errors.

3) Add two INSANE_SKIPS for "already-stripped" and "ldflags".  Some of
the selftest Makefiles are adding flags to their compiles that basically
break the above checks.  Since these compiles are not really meant as
user level tools and instead testing, it should be ok to just always set
INSANE_SKIP for these two.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../kernel-selftest/kernel-selftest.bb        | 26 +++++++------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 889fe3e22..f83b07dd9 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -56,7 +56,7 @@ TEST_LIST = "\
 EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
-    CC="${CC}" \
+    CC="${CC} ${DEBUG_PREFIX_MAP}" \
     AR="${AR}" \
     LD="${LD}" \
     CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
@@ -97,25 +97,13 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
     sed -i -e '/mrecord-mcount/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/scripts/Makefile.*
-    for i in ${TEST_LIST}
-    do
-        oe_runmake -C ${S}/tools/testing/selftests/${i}
-    done
+    oe_runmake -C ${S}/tools/testing/selftests TARGETS="${TEST_LIST}"
 }
 
 do_install() {
-    for i in ${TEST_LIST}
-    do
-        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
-        # Install kselftest-list.txt that required by kselftest runner.
-        oe_runmake -s --no-print-directory COLLECTION=${i} -C ${S}/tools/testing/selftests/${i} emit_tests \
-            >> ${D}/usr/kernel-selftest/kselftest-list.txt
-    done
-    # Install kselftest runner.
-    install -m 0755 ${S}/tools/testing/selftests/run_kselftest.sh ${D}/usr/kernel-selftest/
-    cp -R --no-dereference --preserve=mode,links -v ${S}/tools/testing/selftests/kselftest ${D}/usr/kernel-selftest/
+    oe_runmake -C ${S}/tools/testing/selftests INSTALL_PATH=${D}/usr/kernel-selftest TARGETS="${TEST_LIST}" install
     if [ -e ${D}/usr/kernel-selftest/bpf/test_offload.py ]; then
-	sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
+        sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
     fi
     chown root:root  -R ${D}/usr/kernel-selftest
 }
@@ -161,6 +149,12 @@ RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
 
 INSANE_SKIP:${PN} += "libdir"
 
+# A few of the selftests set compile flags that trip up the "ldflags" and
+# "already-stripped" QA checks.  As this is mainly a testing package and
+# not really meant for user level execution, disable these two checks.
+INSANE_SKIP:${PN} += "ldflags"
+INSANE_SKIP:${PN} += "already-stripped"
+
 SECURITY_CFLAGS = ""
 COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.17.1


