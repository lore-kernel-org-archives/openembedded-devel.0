Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178AED2C122
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.19566.1730817439068961990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lB6lf4pD;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea5003deccso56599797b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817438; x=1731422238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5loow3F6Bq055vr+Km3g2TyB/ChhV8ZFG/cURvXWSI=;
        b=lB6lf4pDsY3C58jBJo6ac1n8qv9Q3kmDsJ+c32kz9uJKS3L5YMtWOAOPgs1HghG2+b
         +tZEtkabraA3Jf+NC03FpERamjtxQLuz8Q+QICEg6S0jsIjhlj0tMkDZte0KIXeTi6rQ
         kDqLX7C2NLI0rHPKTJiwSOA0PuY5XqEAR1vlZ622ZXTrWtCBEmwfJVEtwtNyyaJqvrjN
         YOPqcjYeKim3brTVF/mO4a61Rsi7UYloaTtSL9hMn++vo6teCUXuKbMA75XXP55NrXYx
         SZEXdrcvwfi97+QafOceFN5YhqxSIsjZ55udWSC1oQQ7lelYuziKLF3idic9SnuwzEvQ
         qEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817438; x=1731422238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5loow3F6Bq055vr+Km3g2TyB/ChhV8ZFG/cURvXWSI=;
        b=p57eCV8hyYT/I9XOlYSZpcBXRIKacDSs+Gl/SK36T8C+WSzQQreQDl5ysehWBtOkTi
         jA32ImMA2e+cK0IQ4ADPwyJ0ywCvN8zNlWxqhuXI1/GqbY9N2frjbfhotKYQTraGMOoQ
         PPKVfnz3gG7dIzIYcU/OhDolD+zWexij31FgzsQnRqaE1KnxiuaSOYKlZPUO9jMb6Xu2
         2oIgmuJnGI/fWoNftveWrsE4RMorrGohOS11EIYvOyG/6vc2wtoJIskVKydqaYOcKQte
         027txJYME74Oiynf1cecNJ/aHKZWaCCqMO8+wqIHO8C7Fq7YnXGOqfMik/Ng3Q1gLbzC
         Bc8A==
X-Gm-Message-State: AOJu0YymA4IyqV8EGFwHtaK+pXsul8py/+ipdkARf5+PWFUC7gcQSFSW
	7N1ln7yFmY8AtbADe7b0LKWAOFYpcjKW4X/EtHKow6FEEHyO3mqUpZwmAA==
X-Google-Smtp-Source: AGHT+IF3M9prUd3saaufdbyRwXn2gwU2Ui5S2BpNiOmT3ixkZAY2JhcIeLmWN7xv4qhnG7AnprZr0w==
X-Received: by 2002:a05:690c:6c8c:b0:6e3:3019:6aad with SMTP id 00721157ae682-6ea64b2f0f5mr157669807b3.20.1730817438133;
        Tue, 05 Nov 2024 06:37:18 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 83/90] kernel-selftest: Update to allow for turning on all tests
Date: Tue,  5 Nov 2024 09:35:48 -0500
Message-ID: <20241105143638.2301245-84-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113501

From: Ryan Eatmon <reatmon@ti.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc6d6e06aa3394d1f4db38d63f06d5bec43426b8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        | 26 +++++++------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 889fe3e22d..f83b07dd9b 100644
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
2.43.0


