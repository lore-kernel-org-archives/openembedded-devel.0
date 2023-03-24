Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5448C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 09:02:45 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.96852.1679648560596908606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 02:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZYBt2LrQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id ix20so1262494plb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679648559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUtMYH6SEUYbOMb0B3oCOGJkD95rtUOJYSuMy2MYM4Y=;
        b=ZYBt2LrQ5iKqE22TOkykBo3BRPhpcUd7aCtMHYKflzuw4T9EXVL5A1bwi+aukid3n4
         KDxaKkq6Xg7dPWRvMtR7kpSZgu4y485OqdpIWrsOoWLlQfQipddDalh/HZj8TOXOUXhe
         OSfgV69mYaCZiG6cYYOZMR8U7w4cONfzqADQvFIoFAosQ4R5VffRnRmmB+ChtStHW6PH
         +/itZFFxkYfpG+Ic7jcIKx5t/DYorwCva2km4x9ym66h/sblHAmKx2xN85dXO5y6oWpd
         zMiW2ARzzg5vFx6vltgMAm2PPABHCaCsxMVnrj9dCkMibFOPAqPmbO8ttuvsAtGssAAa
         NdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUtMYH6SEUYbOMb0B3oCOGJkD95rtUOJYSuMy2MYM4Y=;
        b=gRn2UdXA3w0ggGYrSotBrQnAlrqwPIPPEG81GDUt7IPw5dyOXWJVQrWE7ZCGbrLk4c
         07pUlSlb8A5yCILZCCl6rdaEZsMoGNaM7o1CvvpBmwTIQQKjadjbJ3D0rnVXOCx0vsXG
         SODeKwIrzRzrviBkhwtfnhEmxhiyL/QsD+8XasmC+Gi3MwQZtw7h8gLS//gj+9wai0fs
         DUKsoixkAEx5r130J6qkjTzNUjiX+e4n5JSoRHK2TRhh0YJYhxNqdxs9riJY4fPCNpYG
         /kR8MIvmvPpwONKRkRoT09BAzL+Y5IVjvok/kUQYga+hbFJD/I4rCMKomBdFPnP35aFd
         Li4g==
X-Gm-Message-State: AAQBX9deGvK0g9JOFYaL7c9vn5f8UAnVQ9NiaYNE5TqUru6oJHgxMKpc
	v609xzqTdYnSC56fRo7BAJ1kJX2xBbOplrFN4A==
X-Google-Smtp-Source: AKy350YQA5Mo0Q7DuPUXzGEr8vmHIYfdnZMxEuTzGbqKv4qz0Y6ezkW7H+2EeKJnuH/ZJJ0BbFAm4g==
X-Received: by 2002:a17:903:4306:b0:1a1:98a9:4069 with SMTP id jz6-20020a170903430600b001a198a94069mr1494394plb.9.1679648559477;
        Fri, 24 Mar 2023 02:02:39 -0700 (PDT)
Received: from localhost.localdomain ([103.171.194.54])
        by smtp.gmail.com with ESMTPSA id k11-20020a170902760b00b001a2104d706fsm1697351pll.225.2023.03.24.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 02:02:38 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	nikhilr5@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>,
	Khem Raj <raj.khem@gmail.com>,
	"Sana . Kazi" <Sana.Kazi@kpit.com>,
	Nikhil R <nikhilar2410@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] duktape: Add ptest
Date: Fri, 24 Mar 2023 14:32:28 +0530
Message-Id: <20230324090228.3145998-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 09:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101703

From: Nikhil R <nikhil.r@kpit.com>

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

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3277a81937bee01437a7ca8634e0f056e318f21b)
Signed-off-by: Nikhil R <nikhil.r@kpit.com>
(cherry picked from commit 5f935c35de9ea620bcbf0d55b096b1a328563a8a)
Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
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
2.25.1


