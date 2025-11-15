Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7528ECEB2D8
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:11:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8210.1763212269405535116
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JhiZ7iOO;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47755de027eso21137275e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763212268; x=1763817068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3h8Dsco1yJixNRUvSXR/8d7sK59uX43QQNe5b25F3I0=;
        b=JhiZ7iOOxeRCwIfGM1QDYEMAOP8G/8Oa2tYQnyfbQClpdNR6xVeM6+ZE4pIp3OywFl
         6ncmwq5XUdMnlMO8tk5p4a54k9sj6XUZHiUrH5tpxyGUrxYYulH49tV+unBFjU3EDxJZ
         XXGbbvni3TtSVP9mCopQ/nlQJJLb2myKFvVRHDyKcTVJJfDi1Zit/nceIS1h/zAl4/+k
         +JW0ieLe3AI/B3zqrfigH0Idwo+HhDGgWJ2bKD62jBtSfwuL5UnOZoVxxx1xeLDKO57u
         Lz5YeGbMzT3EsVaADy83TxV1re/oiXfurYOp5ye/YxP/SRsYY2DMZVUP7xdaRiwY2vC5
         A3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763212268; x=1763817068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3h8Dsco1yJixNRUvSXR/8d7sK59uX43QQNe5b25F3I0=;
        b=o4nNvw+xJTjBhk6uCz3ftOmvAghNMCIGONDliSJjeBIeHXyuruZp3ozdyVhWL46Ipd
         IrxWbBT1cE2exUMM2b7xVuLLG/FFFx0/9DO/ZxjX8NSwwYOGe9x5a2WsC2J/fzoXUdK1
         2USR7QsoKCdfz/Gc6zf817hBBdSvWdxDWJ3kZK4JUCCuR5KEXBuBMCF55GFN9v4k+76U
         L03Z2LeV98iTmMRfy1SeIE2GpU5Hq3lXfocUqPw7TTJaoDic/P4wpgcAE7sUnynje9pG
         CI4zNUKyH1njbHI3DS9wXaDtYXB4E5Oyb3k9ijT7K29mLk1Oq6cvpJj2OImty4IbfY1J
         sapA==
X-Gm-Message-State: AOJu0YwCnaVtSAb83+XXCf1iYkxGAeFwokLPEd5bA8mKDr2/OZzmgYZz
	lSTbppjB8Y45NTUeYbpHXlJKGrew2n7D2etKN5t+TMiSB5Gl7y1O+pSPoX+llfwL
X-Gm-Gg: ASbGncvsyXVw2ClNncbvbOt+paSVvZlIIIqg5OC/9ZIpafyRULO+oabUpoYHZJUE0vN
	ohG193ChYF0oEzNMvn2ToFqGMKJ3czW3hBaqaztC0E4+tammmXZCsl92+DiBF8PNx9KG1Hl0fmg
	eC8Fq7OTPTJyZllxRKt/kQ46eYF9JMKhChFhcx1IKEdtCHPCAKVucU0ZseVnnngm2aIxIHUirXI
	gcUj+A0Km2giB+y8h4bsOE06/d5U9KCNCA/4Px7g2V+QC4IKGtloxKoOZ6GBBaem+CfsauseAyC
	Ltb3l5z/2ziyhkk8e6jo7pbcvtYN146PbI62TQC0MTpHRfH1UF8h5SL+8gKxKEvdDNdhaJs3jg5
	wawMXPQudNoCjn2GSzjELV+zFt/tdq70jh9N5VUfMnx93b+LG6AKfPD8TqVwxYK1Ob3DR5RfDVz
	ab3BJSAusn
X-Google-Smtp-Source: AGHT+IGOO+lMzbHo+pF4WXIKKbPdy35RbW88+o+9Un5sXWIzlFYOQgG88yogz+06hvXuqqiRER8CJQ==
X-Received: by 2002:a05:600c:8b4b:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4778fe504abmr61323165e9.17.1763212267533;
        Sat, 15 Nov 2025 05:11:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm42868995e9.13.2025.11.15.05.11.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:11:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/6] audiofile: add ptest support
Date: Sat, 15 Nov 2025 14:10:56 +0100
Message-ID: <20251115131059.1146238-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115131059.1146238-1-skandigraun@gmail.com>
References: <20251115131059.1146238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121732

It's under 15 seconds to execute it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 85ded08df0ad850928eea9919674161d94da5454)
---
 .../audiofile/audiofile_0.3.6.bb               | 18 +++++++++++++++++-
 .../audiofile/files/run-ptest                  | 14 ++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-ptest

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 4642b5e7be..dabc8b66b3 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = " \
     ${GNOME_MIRROR}/audiofile/0.3/${BP}.tar.xz \
+    file://run-ptest \
     file://0001-fix-negative-shift-constants.patch \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
@@ -24,7 +25,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig ptest
 
 DEPENDS = " \
     asciidoc-native \
@@ -32,3 +33,18 @@ DEPENDS = " \
     libogg \
     flac \
 "
+
+do_compile_ptest(){
+    oe_runmake -C gtest libgtest.la
+    cd test
+    # Query the TESTS variable value, remove the $(...) parts from it,
+    # compile as make target along with FLAC (which is an optional test)
+    oe_runmake `make -p | grep "^TESTS = " | sed 's/$([^)]*)//g' | cut -d= -f2` FLAC
+}
+
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}/test
+    for t in test/.libs/*; do
+        install $t ${D}${PTEST_PATH}/test/
+    done
+}
diff --git a/meta-oe/recipes-multimedia/audiofile/files/run-ptest b/meta-oe/recipes-multimedia/audiofile/files/run-ptest
new file mode 100644
index 0000000000..4e41ef3cda
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+RES=0
+cd test
+for t in *; do
+  if ./$t; then
+    echo PASS: $t
+  else
+    echo FAIL: $t
+    RES=1
+  fi
+done
+
+exit $RES

