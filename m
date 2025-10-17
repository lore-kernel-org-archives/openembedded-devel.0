Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66101CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:05:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13528.1760702715012970508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=noAxagUp;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so10519035e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760702713; x=1761307513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CybblooEeSIq61TS+gru4X7AF4dcas8Tdob4mCneYww=;
        b=noAxagUpUbqbSXpFN/UrWnFZl1I3zudGPso0zoMdGJWqofR+kEGItEAu1v64ta5VHR
         RfFln6D4bC+IIwANeo4ssAycSUzmjfVbMc9yejs8kfxlb6aQRaEuTayZwk3StM4n7nJJ
         WAFfz/r7W1+nAAk1NFGopplwLn8lr/DeiVYKUmD5Wt0graJHPAy6taPjjOZT0FguHpEw
         0Mj3VAT/3UpFNlWlq244hs7d+UISmZ4HCRj+LtJPViJnK6r4uW8vce5rSqq22TjkuG5w
         Ws5hC+TqjVzN6BEHPWySgQAqw7gx8j/BL75c7WrjIXJz94Lm+sw64QLRViU6YMMBuk8J
         i8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760702713; x=1761307513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CybblooEeSIq61TS+gru4X7AF4dcas8Tdob4mCneYww=;
        b=Bw2wScvyorjfpvgz27oDdItGa2A5Vw7D/CJaYBHE1EVbbWGKMfsH7jq4T8RdMHqiEW
         ZVo05ctvmaF1uU8n/iVD9iqwDl+Qq8hmQw4Qj+7/8E4siOEBGoo/s6xeak+OGzmxeNOl
         ++V1HvCvfMTPWI2sEZoi+8J8XQEvkhl0ep3HiCcb+S84zS3U7bppUAuuz6HI1WOAIi9Y
         4uOmUpX9dcWU9aoqBQLLiqiFACWzDU5TBCThkeM4awBum82cQUVWa5O4CB0LMHp8f/0n
         6nhb75regk8qY4Vs07/8TO8p4/+mmGpR9a5E7lQcoHafgL+u25K8/iOYjz5x8WxyB8PY
         Y6oQ==
X-Gm-Message-State: AOJu0Ywe8D/rNwu/IAh/o0Nz8Cg7aeqim9g/MEv+hZI+T+5wos7WeVng
	66Th3+pMtlvnJ5WJtQLxn1znLXR59wVvMuc7WfjnlbiBTdgvYYdBhmgSdaqvCg==
X-Gm-Gg: ASbGnctePyOwzTtEJ5FgJDZa4k8pfkgIA1G6M6aH7pRkZOr5eQgDLzZ3ecji1AxR8D3
	tEh95V4iCXUzqbQfsCertdJR62HT+Htbcyuah1DwEU8V9WGqojTMH3RFfHg7tkr80pyZQl2lx9v
	+kpVs9VNsbDlFbTon5sPFETb0AgrB8EF//TftijcRkdtzvDXHjSIJYLfZ+XtIDKUHalgaYhokVD
	rSWN+P9cHOmJGJS0gSMeerJfQRK3hlKpOjBs/crL4unzqTWEMHzTeGhHya3LhG46gmVGAk/PcEg
	Y0FKDDkD+64cppHEoY83X1r921HqriZmYbjq2PhDxw90sytlxsttXQI3Q7OqP8FMcvnjo/7vXkP
	wQfXHrsRSohv3ctQO4h5XszXoxzaRTE8IjlJ5Se7fFykVdGrdy5Ho19XJWs18NgZ9q4sG3lD8aw
	==
X-Google-Smtp-Source: AGHT+IEBYFMu5zanqMcrVNHHRaUZAsxSI8XPSzYTpe/+nPdkWVGnArP6/rOKdw0GYZVXnnSKQHBxNw==
X-Received: by 2002:a05:600d:416b:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47117911890mr23643135e9.26.1760702712902;
        Fri, 17 Oct 2025 05:05:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710f28a920sm43169595e9.7.2025.10.17.05.05.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:05:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cli11: add ptest support
Date: Fri, 17 Oct 2025 14:05:10 +0200
Message-ID: <20251017120510.2439753-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120760

The tests take single digit seconds to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../remove_tmpdir_from_test_binary.patch      | 33 +++++++++++++++++++
 meta-oe/recipes-support/cli11/cli11/run-ptest |  5 +++
 meta-oe/recipes-support/cli11/cli11_2.5.0.bb  | 19 +++++++++--
 4 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch
 create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 18324ff0d3..825747d522 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -8,6 +8,7 @@
 # ptests which take less than ~30s each
 PTESTS_FAST_META_OE = "\
     asio \
+    cli11 \
     cmocka \
     cunit \
     duktape \
diff --git a/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch b/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch
new file mode 100644
index 0000000000..22c3e5211f
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch
@@ -0,0 +1,33 @@
+Remove tmpdir from apptest binary
+
+This binary is used in the ptest package. It executes another helper binary
+for the test, which is identified by its absolute path, as it was determined during
+build. To avoid the QA error (and to find the helper binary during test excution),
+use pwd command files.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+
+diff --git a/tests/AppTest.cpp b/tests/AppTest.cpp
+index 29aff27c..ddb8238b 100644
+--- a/tests/AppTest.cpp
++++ b/tests/AppTest.cpp
+@@ -2819,7 +2819,7 @@ TEST_CASE("C20_compile", "simple") {
+ 
+ // #845
+ TEST_CASE("Ensure UTF-8", "[app]") {
+-    const char *commandline = CLI11_ENSURE_UTF8_EXE " 1234 false \"hello world\"";
++    const char *commandline = "$(pwd)/ensure_utf8 1234 false \"hello world\"";
+     int retval = std::system(commandline);
+ 
+     if(retval == -1) {
+@@ -2837,7 +2837,7 @@ TEST_CASE("Ensure UTF-8", "[app]") {
+ 
+ // #845
+ TEST_CASE("Ensure UTF-8 called twice", "[app]") {
+-    const char *commandline = CLI11_ENSURE_UTF8_TWICE_EXE " 1234 false \"hello world\"";
++    const char *commandline = "$(pwd)/ensure_utf8_twice 1234 false \"hello world\"";
+     int retval = std::system(commandline);
+ 
+     if(retval == -1) {
diff --git a/meta-oe/recipes-support/cli11/cli11/run-ptest b/meta-oe/recipes-support/cli11/cli11/run-ptest
new file mode 100644
index 0000000000..ef37d44783
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+cd tests
+for t in `ls ./*Test`; do
+	./$t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb b/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
index f6c9ac8f69..980932165b 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
@@ -6,12 +6,27 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8bdde6bda8508bef68a39f3e0d7e939"
 
 DEPENDS = "catch2"
 
-SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https"
+SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
+           file://remove_tmpdir_from_test_binary.patch \
+           file://run-ptest"
 SRCREV = "4160d259d961cd393fd8d67590a8c7d210207348"
 
-inherit cmake
+inherit cmake ptest
 
 # cli11 is a header only C++ library, so the main package will be empty.
 RDEPENDS:${PN}-dev = ""
+RDEPENDS:${PN}-ptest = ""
+
+do_install_ptest(){
+	# double tests is not a typo. The inner empty tests folder is
+	# used by one the tests.
+	install -d ${D}${PTEST_PATH}/tests/tests
+	for t in `ls ${B}/tests/*Test`; do
+		install $t ${D}${PTEST_PATH}/tests/
+	done
+	install ${B}/tests/ensure_utf8 ${D}${PTEST_PATH}/tests/
+	install ${B}/tests/ensure_utf8_twice ${D}${PTEST_PATH}/tests/
+	install ${B}/tests/link_test_2 ${D}${PTEST_PATH}/tests/
+}
 
 BBCLASSEXTEND = "native nativesdk"

