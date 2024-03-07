Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F86C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:58:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.26906.1709827114902115965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSy6BGq1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a458b6d9cfeso159782566b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 07:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709827113; x=1710431913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ykjpl9K7wFyowPptK2Wr9QyuReX3p+8mlDpoJRs7O0=;
        b=LSy6BGq1UwSouhYBPPwtxRl2s7JWU3XRzUhexGJFTqSaE85aNxF4jlVAgTeSVYnQVj
         GtFhqDNy/j3rAF/XXS2Wq4tKFr8ujPz77P7E2solsEZs1czDh08CRv0KEs2QDrC07tac
         q3E9EzUrZeCm+tCy/BQIpNh8X6ZoNdXBJLE7PfTiPFYesoAxgb54GGm+qvA+5L0a8z/O
         Bcghi8ArkwLWg+mAuflZHyjUqCjcH/0BkadFyV6LA1BvWXi3EN83K0xmt8Do3Zgic+kR
         dKYeLltwYum4Gsm629vZ0ocQD1Uw5gOWUJZlhI2d9J0++CcnBmjTOlMJssbXt660om7E
         Ydhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709827113; x=1710431913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ykjpl9K7wFyowPptK2Wr9QyuReX3p+8mlDpoJRs7O0=;
        b=OnY8J2LyJvn8c8vMr8XbPhvCxMFph4i6J4kMXOq65Vksd6pMUkum/msJy/rWDkgNoh
         qf8jImes2k/I3TEBleqjAvc806yqUFPJMIhg6FdJroyaUkmawdfFoTM6FMKdVNsZ4yVJ
         plCo0R8XpjoQvtXIN/3hsm3iXEEJYtczEhjEbSbnWuvuCfSxth02Qx9f7RKgR/q5oK1y
         CSAYE4U1dEVYb5HkAYPM5Qe+T27YGyXsbwArLHolAFnoni7orgMYSQ4HIAxmBkU+NYZC
         LJuwDoePERUjI5Zn2f1N10f8c4axf1w0aBi6PDsSD6WmuIRww18aDpqxxbgZQDMDUTCY
         MqHA==
X-Gm-Message-State: AOJu0YwUGJHPlbLzQ+qsemBWlTXyPe9SBj856HWnENvV+bM6SOeAmfXf
	Z9zzAm7sbeJLmlYpmymTrXhhsGNBQwMm0hZh00gNVlnmJwyXb1xK7a7MyY6x8L8=
X-Google-Smtp-Source: AGHT+IFtaDAtu6Z5vOUNC5hxx4VToGTkGRdN2qRAhQyVTH+Lo77KzseKa9v6/hW4FeQjpzU9mtTDxw==
X-Received: by 2002:a17:906:4109:b0:a45:a3e9:debd with SMTP id j9-20020a170906410900b00a45a3e9debdmr6028303ejk.59.1709827112517;
        Thu, 07 Mar 2024 07:58:32 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id js20-20020a170906ca9400b00a3e643e61e1sm8345238ejb.214.2024.03.07.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 07:58:31 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-google-auth-oauthlib: add ptest
Date: Thu,  7 Mar 2024 18:58:26 +0300
Message-Id: <20240307155826.363179-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 15:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109198

* Tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
==============
qemux86-64:

Testsuite summary
TOTAL: 37
PASS: 37
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 15
END: /usr/lib/python3-google-auth-oauthlib/ptest
2024-03-07T15:48
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 37
PASS: 37
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 15
END: /usr/lib/python3-google-auth-oauthlib/ptest
2024-03-07T15:54
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python3-google-auth-oauthlib/run-ptest    |  4 +++
 .../python3-google-auth-oauthlib_1.2.0.bb     | 25 ++++++++++++++++---
 3 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth-oauthlib/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index d3096039b..0cb3046cf 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -19,6 +19,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-execnet \
     python3-freezegun \
     python3-geojson \
+    python3-google-auth-oauthlib \
     python3-gpiod \
     python3-gunicorn \
     python3-html2text \
diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/run-ptest b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/run-ptest
new file mode 100644
index 000000000..f1c8729f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+pytest --automake
+
diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
index 5c071ac41..70e843a09 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
@@ -6,9 +6,26 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09d8f7c613fb7cc501ea8"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
-RDEPENDS:${PN} = " \
-    python3-google-auth \
-    python3-requests-oauthlib \
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-click \
+        python3-mock \
+        python3-pytest \
+        python3-unittest-automake-output \
+        python3-unixadmin \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+        python3-google-auth \
+        python3-requests-oauthlib \
 "
-- 
2.25.1


