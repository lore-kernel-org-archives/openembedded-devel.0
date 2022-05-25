Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54F7C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 11:36:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.5607.1653478569882263463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 04:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qFe3fbR9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id h13so12696006pfq.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=jF5kV9X/Nxg7i63teRozVnIdbDxUI1iWixVLfMyiOlk=;
        b=qFe3fbR9EG3k9CVrPjyTVx6MK/l2tZljRPM6BGhr+cPiJQZ/iAanUM1zGnv3b1bvcD
         pR/XqM3Mx83zjdIX/FBpuGA5LQmTXsSbPCAQZnMvsgPY/WOCAHrTVBfAj2kt0sGsiwTv
         w+9m474NQsMmHvVydIyPu7+EK5EKS95N/b2GyRO5wke9jNkwvZ1yjKXbi7W94qK6ib5K
         dsD3zQWAog68QBSIZOPwJ0wtzwrfLzpi/+28/Sba5dJ39zyXmZnSkGUA7R9gxyfyXhyk
         GwP5kI3B5QJFk6ouUn46QrmvuGBsJczKWJxy/h1XxlZJQ0OgzNq5GCtRXf1fN9SqdA5E
         CHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jF5kV9X/Nxg7i63teRozVnIdbDxUI1iWixVLfMyiOlk=;
        b=KP84smEItRbKImFmRbvXKPYwMvJLmj103Zi/gJDP9RqI9JV5dbq5ZBrsejp+P5rtgJ
         aATx/KhpxttJd9KezzUhqftVtYSlvOps4ZOh8kRJDLjZr/umOPHiTteq7SZhJfCz+pl9
         Fd5blOyEjDqc1Fnp6hvE45cshLmMiN7CQFxZkLxOcznYBcfTz3iGc8tEzv3gD/vJ3USE
         zBEI2TOPRuF3CoesVxEHSOunSWzW5hHZ7b2l2tLXieSP1zzvJwgk7BmwJpmsEMMV1bbM
         dFxH2TIhgSR+ReB4U7rZTAB0mA1w9lf62a/Krs8Bc2F2QOfr4aPtN4Y1ys9MSrdmNGUc
         6i5A==
X-Gm-Message-State: AOAM531DuCkt62e5RTvsDsDPSRLp2Aqcfpzv41t7wfUe98Dkr42PoB1H
	fawYZl2zUF7vOdT5VTTn83CRpzGVjb+/KpTI
X-Google-Smtp-Source: 
 ABdhPJyrgJhYuI2MvpTqiC3rOFxpTwCWjVah4TEoU2HnYuISwT9uSYjd93eOmbvqYHt/moL3MhiIPA==
X-Received: by 2002:a05:6a00:299a:b0:518:9489:2c32 with SMTP id
 cj26-20020a056a00299a00b0051894892c32mr17548928pfb.29.1653478569004;
        Wed, 25 May 2022 04:36:09 -0700 (PDT)
Received: from localhost.localdomain ([182.64.111.81])
        by smtp.gmail.com with ESMTPSA id
 v18-20020a170902ca9200b0015e8d4eb237sm1438168pld.129.2022.05.25.04.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 04:36:08 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [oe][meta-oe][master][PATCH] duktape: Add ptest
Date: Wed, 25 May 2022 17:05:54 +0530
Message-Id: <20220525113554.10783-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 11:36:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97267

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
2.17.1


