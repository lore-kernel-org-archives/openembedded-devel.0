Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11217CF3192
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:53:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3957.1763549622359646670
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ar8x8Yy8;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso3476725b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549621; x=1764154421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM/2NFpLI+Bm4j1wOrDepE73IcvA5QSvsLYlQFuIhlQ=;
        b=ar8x8Yy8AxFsLmgcYkNKKT41jw1faVk9lsGTQEPjS2CJknS2ALeiiBUhEgsLNS1n1g
         XQelOwhRcTECTSgt3+yt/1oziaKRo0XzTxzUceJNbacQv1I8qt9hXGvvSiX5DdW8OXtw
         Je0C5oK95aZvfiqa18cG4QUmERJ8keT06DVN5vnrqoMX2hCyRQ24D3ibOYKA4sfxAdm8
         4qOE3dFVYRdkhokS9IACCWjII3duQ8Sqoyp2fG2S8uup9Gc6V4GWqBI3m5cEflpmQce+
         /JNky1kPJR5wS/9+ZVMKnuoPM5VtZAA8CzSkK4EPdqNePkRs6v9RgDrreEgS8WvwrLK0
         DLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549621; x=1764154421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vM/2NFpLI+Bm4j1wOrDepE73IcvA5QSvsLYlQFuIhlQ=;
        b=ggW/GYCccP2bsY3r6UzTu4BOxRW3mFZBd9vH1lSCATC5KBevQYCoQsCrI0RUlrFAKY
         n8vQ4kvtAKGh0zVfpR0d4rJGPl0PnRXU7Hu3BdU/AHVJYHsdLhevGghT59jyCLaNdGs9
         84kHkMef5LxlLWcUZ+FnRtCzSKUj9eBgNknmYGkPq9gL9/nFPacZU7lUp66GFCQsaI2W
         8eF5QobUmK4DT0AjJbe6voSuBs0/GUBruNOPWV1GIde4IgBsnQPDkB6hEAahaY9NJl8B
         skvZ5F6ifrLzPrl2RXBwU3vG6wNQ7fqklvut8IErIJNFY39PONnC5DD7/VTQxDT4kXRW
         zKrg==
X-Gm-Message-State: AOJu0YyVuVZCkWjwNQ1lP/4Y98K2TUF4NLhUB9qZJg7j/9pQSk0UFJyd
	cy+ifeBHa5+UyhCpRBLWsrruTF07xLjVUzvDPsbtUlIstayRENKCRmm86x06Ww==
X-Gm-Gg: ASbGncs6VG3o8VlRfBjArrB9nduG8PsAMtE1BIk/ScVO4gL0Q4U9IUFC+3K/7llHh8c
	3bIf0sOlGOZZsF8nt895HVjRLU6Lt22uBYkns3hfl03wcOkN3OZtQbYRZ6CYtNoLSpfeSZmB5G1
	57Zw6pslk19IWkBtrazGc3CbirKHQnh+Y/sleUxDLjUoNg8iU7m7ojBrWCDghs1Gl8anOxB4N3u
	qpzZRqMR/jxK9qyXoeGts6RGscCC74PQJd/gAofQgNxuFbcJQBCQopCYPUKy4YksU1v80Xv5Vk0
	HDnDYNHB37uJc3Q+apNfAezaPyh574uF6cl4lRpYCdgZdHgY6JvUtQrx4oZd6wRDnbuFHbbGlC5
	/GD6Jwe6XDmj3nOWuMaY7jS4Lz0IJWD6Cfz43DOAkpwIud6iwm3zsB/oLT19CYt/zVa0/3US9P5
	PazQJIcHLJSguPGc/GIU1jXWHOytUxe9LwCr4=
X-Google-Smtp-Source: AGHT+IE5C0EQxODKdEGN7PgDPXJl8hsfE6DmbIrSeihjRVL00sBUFFlCmCDSXd6WOoIzHkxNyDVNVA==
X-Received: by 2002:a05:6a00:94e8:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7ba3c082dafmr25689320b3a.28.1763549621454;
        Wed, 19 Nov 2025 02:53:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm19383078b3a.4.2025.11.19.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:53:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/6] libplist: add ptest support
Date: Wed, 19 Nov 2025 23:53:25 +1300
Message-ID: <20251119105328.2849176-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121893

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../libimobiledevice/libplist/run-ptest       |  6 ++++
 .../libimobiledevice/libplist_2.6.0.bb        | 30 +++++++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 09b1dbb3e1..25db9fe5cc 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -54,6 +54,7 @@ PTESTS_FAST_META_OE = "\
     xmlsec1 \
     zeromq \
     cjson \
+    libplist \
 "
 PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
new file mode 100644
index 0000000000..ed940af5f6
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+for t in `ls test/*.test`; do
+	top_srcdir=$(pwd)/input top_builddir=$(pwd)/test ./$t && echo PASS: $t || echo FAIL: $t
+	rm $(pwd)/test/test/data/* 2>/dev/null
+done
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 7f01962a97..1dfe895d23 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python3"
 
-inherit autotools pkgconfig python3native python3targetconfig
+inherit autotools pkgconfig python3native python3targetconfig ptest
 
 SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
-SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master \
+           file://run-ptest \
+"
 
 
 CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
@@ -30,6 +32,28 @@ do_install:append () {
     fi
 }
 
+do_install_ptest(){
+    # tests expect a particular directory structure for input and output
+    install -d ${D}${PTEST_PATH}/input/test/data
+    install -d ${D}${PTEST_PATH}/test/tools
+    install -d ${D}${PTEST_PATH}/test/test/.libs
+    install -d ${D}${PTEST_PATH}/test/test/data
+    install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/
+    install ${S}/test/*.test ${D}${PTEST_PATH}/test/
+    install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/test/test/.libs/
+    install -m 0755 ${B}/test/.libs/integer_set_test ${D}${PTEST_PATH}/test/test/
+    for t in $(find ${B}/test -type f -name 'plist*' \! -name '*.o'); do
+        install -m 0755 $t ${D}${PTEST_PATH}/test/test/
+    done
+    for t in $(find ${B}/tools -type f -name 'plist*' \! -name '*.o'); do
+        install -m 0755 $t ${D}${PTEST_PATH}/test/tools/
+    done
+    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
+        ${D}${PTEST_PATH}/test/test/plist_cmp
+    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
+        ${D}${PTEST_PATH}/test/test/plist_test
+}
+
 PACKAGES =+ "${PN}-utils \
              ${PN}++ \
              ${PN}-python"
@@ -38,3 +62,5 @@ FILES:${PN} = "${libdir}/libplist-2.0${SOLIBS}"
 FILES:${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
 FILES:${PN}-utils = "${bindir}/*"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
+
+RDEPENDS:${PN}-ptest += "bash"

