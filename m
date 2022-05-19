Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF0EC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:58:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.7191.1652965136703856830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 05:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ofMJmul5;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: nikhilar2410@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so8719897pjp.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6y+ySz4k6mk7pNnZgvV87Ij/4bqofJBpfIYDe2HpCw=;
        b=ofMJmul5ueVOq/pT2x3urj6gmagiD255FKGX7DTYqM798brtbxsIsfMHlAZ/Atj5eg
         jqzaX86s+2PJhKKbB1eWm9DNP34dq7dOXsYJ1tQs/yuIPn+3IxHpskG5Dd5WeSfPo8h/
         RmZjCAjJo8Zhr8Ys6VITd4W/0+lk99IoDogT9i9P1Jmwe7Y/mAvWNh+T4jyZ6r0WCYE+
         wBS1ubZusQ0Lfg5cwUkmoVR/MF2jwG/w0iZVyvvVmh1/bjMKAIeoyLjAmEeh3SQvUNUv
         wkqQoaVxoT8QB9e5FS5lAsj6M6bPCny5b+D93tHI/9jR9ZUgJBwWfiwguXqQlqia7yHj
         96jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6y+ySz4k6mk7pNnZgvV87Ij/4bqofJBpfIYDe2HpCw=;
        b=uXAdiRQg/+Hptn5kG1jKJ/1FiOid37P2KzKLpZW35mqBDIaT6jOiEeMor0RvrfgEJd
         a1okpakvqAOglW76IE7CoGbRQ+Bs8PKRnKKMOPJ8LjjD78n71yXVfqPYPV+ZNvxVfJVc
         64D/l3vCW9IdlAwqVFwrTrulixde7k8cvl3F1gN/QwRKdOdWd4lKGGeUzVqj9g9y+D5I
         AuTsAf39aGoLZ6WsPEkpC157PjC4ktT3dRCEBEra4jvhKQ71TMB70ORhUv7ilipTLd5B
         Y9WELV3yme3DCseIa/uV2TQTjO/2cbnJs3+j72xSSUDDpyIwSPARftGjEDKIZPvLdkM9
         wCzQ==
X-Gm-Message-State: AOAM533K+8cgsBcjhV7gCLvKerlC2XRVW/udpa5Os44OO8uSTd9dE3i4
	a18F/RspnayGIhKy04Ar+QLRlT41LhyWAX3Y4w==
X-Google-Smtp-Source: 
 ABdhPJwsx5Kvzoh2Vof+jE6hWXqNmBRo6lFS4y8XIhuFqi9ImVP9DCGhrtPQgn3tUtTYzJIYpw8EuQ==
X-Received: by 2002:a17:90b:3a90:b0:1df:7e0f:f851 with SMTP id
 om16-20020a17090b3a9000b001df7e0ff851mr5045210pjb.125.1652965135769;
        Thu, 19 May 2022 05:58:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:2d00:f415:e50a:9113:b424:5f2a])
        by smtp.gmail.com with ESMTPSA id
 y68-20020a623247000000b0050dc7628202sm3825883pfy.220.2022.05.19.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 05:58:54 -0700 (PDT)
From: nikhil <nikhilar2410@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-oe][dunfell][PATCH] duktape: Add ptest
Date: Thu, 19 May 2022 18:28:39 +0530
Message-Id: <20220519125839.21735-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 12:58:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97194

From: Nikhil R <nikhilar2410@gmail.com>

The Ptest for duktape executes below tests:

1. hello - a helloworld example is basic compilation test
that test the APIs - duk_get_top(), duk_push_c_function(),
duk_eval_string()

2. eval - a very simple for evaluating expressions from
command line which test the APIs - duk_push_string(),
duk_insert(), duk_join(), duk_pop()

3. evloop - a basic eventloop implementation test
that test the APIs - duk_is_object(), duk_compile()
duk_push_c_function(), duk_safe_call()

Test Summary:
Execution time        = 46 sec

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---
 .../recipes-extended/duktape/duktape_2.7.0.bb | 22 ++++++++++++-
 .../recipes-extended/duktape/files/run-ptest  | 32 +++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/duktape/files/run-ptest

diff --git a/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
index 767478543..583e8337e 100644
--- a/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
+++ b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
@@ -4,7 +4,11 @@ HOMEPAGE = "https://duktape.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b7825df97b52f926fc71300f7880408"
 
-SRC_URI = "https://duktape.org/duktape-${PV}.tar.xz"
+SRC_URI = "https://duktape.org/duktape-${PV}.tar.xz \
+           file://run-ptest \
+          "
+inherit ptest
+
 SRC_URI[sha256sum] = "90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890"
 
 EXTRA_OEMAKE = "INSTALL_PREFIX='${prefix}' DESTDIR='${D}' LIBDIR='/${baselib}'"
@@ -13,8 +17,24 @@ do_compile () {
     oe_runmake -f Makefile.sharedlibrary INSTALL_PREFIX="${prefix}" DESTDIR="${D}"
 }
 
+do_compile_ptest() {
+    oe_runmake -f Makefile.hello INSTALL_PREFIX="${prefix}" DESTDIR="${D}"
+    oe_runmake -f Makefile.eval INSTALL_PREFIX="${prefix}" DESTDIR="${D}"
+    oe_runmake -f Makefile.eventloop INSTALL_PREFIX="${prefix}" DESTDIR="${D}"
+}
+
 do_install () {
     oe_runmake -f Makefile.sharedlibrary INSTALL_PREFIX="${prefix}" DESTDIR="${D}" install
     # libduktaped is identical to libduktape but has an hard-coded -g build flags, remove it
     rm -f ${D}${libdir}/libduktaped.so*
 }
+
+do_install_ptest() {
+    install -m 0755 "${WORKDIR}/duktape-2.7.0/hello" "${D}${PTEST_PATH}"
+    install -m 0755 "${WORKDIR}/duktape-2.7.0/eval" "${D}${PTEST_PATH}"
+    install -m 0755 "${WORKDIR}/duktape-2.7.0/evloop" "${D}${PTEST_PATH}"
+    install -m 0755 "${WORKDIR}/duktape-2.7.0/examples/eventloop/timer-test.js" "${D}${PTEST_PATH}"
+    install -m 0755 "${WORKDIR}/duktape-2.7.0/examples/eventloop/ecma_eventloop.js" "${D}${PTEST_PATH}"
+}
+
+RDEPENDS_${PN}-ptest += "make"
diff --git a/meta-oe/recipes-extended/duktape/files/run-ptest b/meta-oe/recipes-extended/duktape/files/run-ptest
new file mode 100644
index 000000000..852fb15de
--- /dev/null
+++ b/meta-oe/recipes-extended/duktape/files/run-ptest
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+./hello &> $test.output 2>&1
+out="Hello world!"
+
+if grep -i "$out" $test.output 2>&1 ; then
+   echo "PASS: Hello duktape"
+else
+   echo "FAIL: Hello duktape"
+fi
+rm -f $test.output
+
+./eval "print('Hello world!'); 123;" > out.log
+
+sed -n '2p' out.log > eval.log
+sed -n '3p' out.log >> eval.log
+
+if grep  -w 'Hello world!\|123' eval.log 2>&1; then
+   echo "PASS: eval duktape"
+else
+   echo "FAIL: eval duktape"
+fi
+rm -f eval.log out.log
+
+./evloop timer-test.js > evloop.log 2>&1
+
+if grep -i "no active timers and no sockets to poll" evloop.log 2>&1; then
+   echo "PASS: evloop duktape"
+else
+   echo "FAIL: evloop duktape"
+fi
+rm -f evloop.log
-- 
2.36.1


