Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1C7E6781F
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:41:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87155.1766432508502562443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUhvtw7w;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso16424455e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766432507; x=1767037307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvyBB2RLnJS8KYbGiOyC9jVQORXQFaIUZduBJSAZGwI=;
        b=WUhvtw7w1xVbNwCGCRqv8mgSFqzuu4UYFoMLDlVIfuC50Ohqg0M5ieveA5YS9An77+
         Uhbw/6XxvsAKpFsv+j6ct2O3Hkvt4xSZucOWAUTjK5nokvlJtqGivXzFUodMunpQpyzI
         I4bZH86fwHyZOInGeHg3zt8zwIVCoNZmv2UHxJFSdzMMtWNYTngs7heORO5URSsNOTnR
         U/bRCwtVoCNY2Q85f/KNsptHS5qT2v8pCvLTh9aaK6YW7UTOdG2d9o1Ouu1m8n1yduCA
         iiqZQA9q47QFtI+CneuV9dIBJHItJyGhCEMHTtcKcx8OB/OVqCjiPfHxmbFCJ3T1sdA3
         Bi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766432507; x=1767037307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvyBB2RLnJS8KYbGiOyC9jVQORXQFaIUZduBJSAZGwI=;
        b=n3QcKGMCc+8oEMKnxD3ZkAJ4DEBTDlh/KsI/SYNN4qeEVGVBDG2dn52jSJSBEwGcHf
         Iz+H7CGQ8iffiZ/YJtbNdkDk8IQQr2yxkQ0m0IGWEulSVBUY2d+1XElU0s0GFu1dURqH
         3tvOuZ2LyCc6k1eUenc/OQjbUILbxScu5r+TnvrJdZDTaW+ePa414Pr6rmbsOQkhcyD/
         GujMlr225ZKuCI31Vj6SrC2sUivgeRzj+vnisio/8Q9ao8d9tGl/xNKdZdRdO3dqG5Tx
         pY8LB3Chul4dr4HqzDVqqneua9bgS4iRYJB2HPV9Wm24jF1zh6QHqKO6Vb2H3P6Js+/p
         uPcw==
X-Gm-Message-State: AOJu0YxxecxYgWr1SkEob1FXVskU5Mfw14SXAzwQU2Z9cDVPUbPEIPzc
	Gc4V/2V767reBtX7hWvx923QAqdesQp+zp4G/zX2KVAf0TXYgk8PJZcT9CIoxw==
X-Gm-Gg: AY/fxX6oZ749k9oVo1ZccD/xzK9i7WATBgr9oRzlBBaZ0/kCoxUKIcrSBWDY9iuoHwa
	M4LfIxg2MW18PZevXdoENZDXHh1iSEYLwVsz8eHCXQ2wAiEDdMOMIDZhZ5YZcun9f/6INS8X4b4
	CcoHrvs5j0pwvcDllkOEENcO6ALw70l6f3Sc6oZqVaCd/knObhiqrH35md4s6UzbjZWJDWv/9Dr
	LfTiuI17cFNSip5APjYqwGKa/VmIXEE7M1CaBnEz9o6hV65Pw36J499yXNscY/vMiBG+AhC672V
	bl+tMqQzUcXv21KE9CmNlCp3QlUL4zc2PApKYj0hHwF79W7FVet7B2YJPhgpls79pPPJlbI7S3d
	IsZRlzObzPiNERqQJDkuQ73mV1ye8YH6JBgDu1Ou4vlR6909iNVbpWj9bbGYG0a+AsXCEDs/GLL
	EKygMLF8UT
X-Google-Smtp-Source: AGHT+IEnynw3KthmaWXpY0Nrp8KUyh9TDTENkb3kKzgv8SxU/+g65o5Wvbmish+/nB2Pnz/fBAbUAA==
X-Received: by 2002:a05:600c:45cf:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d1954a550mr117447955e9.12.1766432506763;
        Mon, 22 Dec 2025 11:41:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm24064349f8f.27.2025.12.22.11.41.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:41:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] uriparser: add ptest support
Date: Mon, 22 Dec 2025 20:41:42 +0100
Message-ID: <20251222194143.1725064-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222194143.1725064-1-skandigraun@gmail.com>
References: <20251222194143.1725064-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122802

It takes about a second to execute.

The test suite is covered by a different license (lgpl 2.1+) than the 
main recipe (3-clause bsd).

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-22T19:34
BEGIN: /usr/lib/uriparser/ptest
[==========] Running 407 tests from 35 test suites.
[----------] Global test environment set-up.
[----------] 14 tests from CopyUriSuite
PASS:  CopyUriSuite.ErrorSourceUriNull
PASS:  CopyUriSuite.ErrorDestUriNull
[...many lines...]
PASS:  SetUserInfo.UriWithoutHostNonNullRejected
[----------] 2 tests from VersionSuite
PASS:  VersionSuite.EnsureVersionDefinesInSync
PASS:  VersionSuite.EnsureRuntimeVersionAsExpected
[----------] Global test environment tear-down
[==========] 407 tests from 35 test suites ran.
[  PASSED  ] 407 tests.
DURATION: 1
END: /usr/lib/uriparser/ptest
2025-12-22T19:34
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../uriparser/uriparser/run-ptest             |  2 ++
 .../uriparser/uriparser_1.0.0.bb              | 24 +++++++++++++++----
 3 files changed, 22 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/uriparser/uriparser/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index d092c3c327..4381f6c2b2 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -58,6 +58,7 @@ PTESTS_FAST_META_OE = "\
     zeromq \
     cjson \
     libplist \
+    uriparser \
 "
 PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
diff --git a/meta-oe/recipes-support/uriparser/uriparser/run-ptest b/meta-oe/recipes-support/uriparser/uriparser/run-ptest
new file mode 100644
index 0000000000..6d735b663a
--- /dev/null
+++ b/meta-oe/recipes-support/uriparser/uriparser/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+./testrunner --gtest_print_time=0 | sed -E  '/^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAILED \]/FAIL: /'
diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
index b5a0a9f42d..b9c5100803 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
@@ -1,16 +1,30 @@
 SUMMARY = "RFC 3986 compliant URI parsing library"
 HOMEPAGE = "https://uriparser.github.io"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
+LICENSE = "BSD-3-Clause & LGPL-2.1-or-later"
+LICENSE:${PN} = "BSD-3-Clause"
+LICENSE:${PN}-ptest = "LGPL-2.1-or-later"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
+LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
+                    file://test/COPYING;md5=b9e6430863a3ea22cf4b0a8518279ed3"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "291f25264a5c025005b1bc39de3c029e6a6ca0a8d6cfa5e61cb5b03702c0884d"
 
-inherit cmake github-releases
+inherit cmake github-releases ptest
 
 UPSTREAM_CHECK_REGEX = "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
 
-EXTRA_OECMAKE += "-DURIPARSER_BUILD_DOCS:BOOL=OFF -DURIPARSER_BUILD_TESTS:BOOL=OFF"
+PACKAGECONFIG = "${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)} "
+PACKAGECONFIG[test] = "-DURIPARSER_BUILD_TESTS:BOOL=ON, -DURIPARSER_BUILD_TESTS:BOOL=OFF, googletest"
+
+EXTRA_OECMAKE += " \
+    -DURIPARSER_BUILD_DOCS:BOOL=OFF \
+"
+
+do_install_ptest(){
+    install ${B}/testrunner ${D}${PTEST_PATH}
+}
 
 BBCLASSEXTEND += "native"

