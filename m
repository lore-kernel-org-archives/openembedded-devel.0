Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F92CD5829
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:01:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2754.1767780104019433692
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XSe68PYy;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso16426195e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 02:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767780102; x=1768384902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5grBZRZj4pgdyNv260VdUQHE6ritANSo6T5NR8i7fM=;
        b=XSe68PYy96giNVzAay/tD86bPFncD7/34S/uhSmcXqEWzsnihoZ5CXt/yUxmVcWYJw
         ORMScQ9qzpOzvX6fz8RIE9zCjO2wSWNBfGA0a48bgmQSTEMG1uzUYiI6AGCMlF9lnVm9
         aDQfjnHyBQ/YvUouf3Nr75guJCzQ+loPAvMpfaQ/uvOFM37mglS7luIJFZK0Jjpj2vtw
         CG/3T3rlMeY5yOPmkpXk7ZFcl75GjGdu+CgQxx0+ciYnq2Ns+i/DVMrL/m4k4DDZnJBl
         siEOuxt1RpO1b0dLpiaot42IHhAe2ZHdYGInMwI6r+WU5zcElWD2RlqERokYfu2EkPuz
         8axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780102; x=1768384902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5grBZRZj4pgdyNv260VdUQHE6ritANSo6T5NR8i7fM=;
        b=CFwF1X5glTT2Qt7/1yde15Ksee+tAaB0VjAR9/q+r1+354Fr9RK3243oU+RexacFOH
         oFoknZOdKLCyIV38InTMV4sJGqFLvDJcU+gvhsIfONmzT8/YBA3SWrfeihWzLtPRDjzV
         FxiH0FmZa8Z7V80IjCmuVKR46BWbUqCExigkw9pqChMUWRApEzCW+EPlAK9tL/qqekIz
         1piDHj7x/yR8U/odtqMWFu87e0aNWeHUpCedpQgynliuofZihsposzylM7us2+enHL5K
         0EoLfDqfapKD38aUujepSsQAmcKILgh1bW+Ge5E9PL5UGd3f14lBnQ0sw5XYh9T1EQ0/
         eiWA==
X-Gm-Message-State: AOJu0YzmSZOkWAd8uttFESOdYpKGmMCu41agtDbCMvMggO2Bgsz5+Oiu
	OTzBsL3PHSCKi4QL/37pYANcl3LtelAh0YU8C0qZ47XbgjDyDIvYcqlsJSciDA==
X-Gm-Gg: AY/fxX5I45opYnmdM91wMNDNhXFvsbsy3B7SGydaeX0e+xH1oaKMx7ElRSZKVf1V3Np
	z5fNawjMewoRnZyA9WlUNJwd/uXA3xyejzCMvTBOD49pfAnGPc9BuPUTtZDAQSH/hBI4jaWG3qr
	WTNz4UNfj8uiI4uZIBNVgDxqgvHsnZSFgq6vhc3iieWwl1hjk58r7/jzEv03JDlBgggX4GFbDFW
	LGGL9Mc6ZxOXi4lw+KrR+1loikD8pQiyp8hVhbp/rbodR/xyFWPMLGVRPOPRpKxizJ7NkOl/epi
	BnSN23UUttmyjwWBjtnzF4QwC2yTpAvFrU5gdtTyN37q3mtZaI/scJu9zgR/TFGJaSAtmaAW3QO
	lQg1t/Hmts5cs/HSrQovh+9D4KSG/dM28l3i2SImE8N62spLQOjlNuzrrTZYcbJC2Z2wcMbm1Jx
	7capU4uiuh
X-Google-Smtp-Source: AGHT+IFRILn0FzAMC9+nHKZMrlR7ILRfpXrEsLZE2PqwK3TOnL+9hLpN/UYr5T8dXgsrWnHGjZYAQQ==
X-Received: by 2002:a05:600c:8706:b0:47d:4047:f377 with SMTP id 5b1f17b1804b1-47d84b407e4mr21164035e9.36.1767780102173;
        Wed, 07 Jan 2026 02:01:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e802sm90054595e9.8.2026.01.07.02.01.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 02:01:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-waitress: add ptest support
Date: Wed,  7 Jan 2026 11:01:40 +0100
Message-ID: <20260107100140.2128659-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123198

It takes <10s to execute.

Some (54) tests are not compatible with musl[1] - due to this the tests are on the problem-list.

Sample output snippet:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-01-07T09:57
BEGIN: /usr/lib/python3-waitress/ptest
PASS: tests.test_adjustments.TestAdjustments.test_bad_port
PASS: tests.test_adjustments.TestAdjustments.test_badvar
PASS: tests.test_adjustments.TestAdjustments.test_default_listen
[...many lines...]
PASS: tests.test_wasyncore.Test_readwrite.test_socketerror_in_disconnected
PASS: tests.test_wasyncore.Test_readwrite.test_socketerror_not_in_disconnected
PASS: tests.test_wasyncore.Test_write.test_gardenpath
PASS: tests.test_wasyncore.Test_write.test_non_reraised
PASS: tests.test_wasyncore.Test_write.test_reraised

============================================================================
Testsuite summary
\# TOTAL: 783
\# PASS: 775
\# SKIP: 8
\# XFAIL: 0
\# FAIL: 0
\# XPASS: 0
\# ERROR: 0
DURATION: 7
END: /usr/lib/python3-waitress/ptest
2026-01-07T09:57
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc   |  8 ++++++++
 .../python/python3-waitress/run-ptest            |  3 +++
 .../python/python3-waitress_3.0.2.bb             | 16 +++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index cdec25f876..be548f62b6 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -115,6 +115,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-unidiff \
     python3-uritemplate \
     python3-validators \
+    python3-waitress \
     python3-wrapt \
     python3-wsproto \
     python3-xlrd \
@@ -144,3 +145,10 @@ PTESTS_SLOW_META_PYTHON = "\
 
 PTESTS_PROBLEMS_META_PYTHON = "\
 "
+
+PTESTS_FAST_META_PYTHON:remove:libc-musl = "\
+    python3-waitress \
+"
+PTESTS_PROBLEMS_META_PYTHON:append:libc-musl = "\
+    python3-waitress \
+"
diff --git a/meta-python/recipes-devtools/python/python3-waitress/run-ptest b/meta-python/recipes-devtools/python/python3-waitress/run-ptest
new file mode 100644
index 0000000000..2e0e96d0b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 -mputao.unittest
diff --git a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
index b8e90807cf..d6d78ea3c1 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
@@ -10,6 +10,20 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    python3-doctest \
+    python3-json \
+    python3-multiprocessing \
+    python3-pytest \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+SRC_URI += "file://run-ptest"
 SRC_URI[sha256sum] = "682aaaf2af0c44ada4abfb70ded36393f0e307f4ab9456a215ce0020baefc31f"
 
-inherit python_setuptools_build_meta pypi
+inherit python_setuptools_build_meta pypi ptest
+
+do_install_ptest(){
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+}

