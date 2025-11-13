Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC64BCD5BD0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:06:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22280.1763035575337238461
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gv3V9cp7;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b312a086eso464372f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 04:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763035574; x=1763640374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcdEhpqtBjaPHneM0UqalSyeVPfZIhlC7Bue4mYh1F0=;
        b=gv3V9cp7sZgQT7nhAamq0ur4Gn2udlMOzz99Ztk9DF+myS1q6OInvPxQTJeIeXAWYy
         xJxR9Pzh6sn4Fotlve+O1KrphfwUUStdFA2FgP5Pl2Rk5Rxcxw1sivWTD0MY458Gy7J5
         6Yam4nz6zzt5vI4YOBEDlASNEaLIhb4Gs//AnfNZweQqicRYm/V5VXAEhYn8XPJZ18CS
         /KHJQA31e1KsIxOrQ2L6zvX2ciJPmmuULeH9XaTUOLZLve75/WsRuVjkTgZrZjNfTN8q
         pMQW23Q0cbHtcZYuTHplqijQVv4MQhveHhjztKIzZE+L2J1viv99a1+BpQiF2qstCiE6
         B18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035574; x=1763640374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcdEhpqtBjaPHneM0UqalSyeVPfZIhlC7Bue4mYh1F0=;
        b=PKVJjZWtwy90KkF3Nw2C7bljpjC1kY5TWP0tf4eRicL0Oum4RlhAOFN8TJKZsTO6in
         W0v/sX+MqrwrfyMMWTejCoCxmnzYXklpMi6v6QMAMxzXdOYam5cj2YMG+U2eN14o5QbO
         Fw0/perAWi9W1BSTdglVwxagM9igRuAg2MD6yFvYUVwqhyelb4XM28sOGkTyYMJ+s8Bg
         AHmUKZeWZ20d7qFnh3XTSEIjXxMMMIsUpJvBq7Xh6+sfgKQQ3PmB59PBes+a6n2PV9G1
         DExyobPtQqOptoc8mlYQSgLtKsDpbrikUdsDqqfAw8dPTJy/4t9sRNQtSQjtDWmZ2rgA
         NOyw==
X-Gm-Message-State: AOJu0YyE95sXHRXqPw5PJUHsc4EFI0TMQNdbzgCqwEJjO5d6E5y0HlaX
	q56cLtNR9DHM2RV48Ol9/r32rMgNdoBAHK2IWDd1okGGpqtp2p70I+vsQefB81ih
X-Gm-Gg: ASbGncsTWMSJ5AQ4ZYphlB2y1FLTcHu/MQ6aaY/gFJ71NOn3gQn0Qezaxnbj0IY3cXl
	/ONpXSHfdo0DCD4OTJkccJuyr7lW3T8IxkSj4OvRE6xUFZoOgt9fgXHUUcfrA0RjAvawecIZlWq
	WAdMvup+9TSPttirPj5My2L00oT6LiFsU1htBK+ULMKxKtzolLS6Zpf/OUMXW69aYBy+tA7xjb9
	om9TA1d0xiumDyMXBG13FZZ6Yv5EPnBSGIyaGPh7OKCf/kLVWrIPHaNQPGmK0u0KstrRP4o6P/t
	Dan3AsA3zLsHGShDAHzrLjQTkErnPsxo3xww7JX8/YCNGxHewku70vUlnZ9WZaQjwtzUUhMDAQW
	Z5l0JNie02psjvx+ew5zsDgFNYZCAtd9ST9KMOsfBkLSBfhb+liGHAAuYmqZv9vrMf8+YlY1p1w
	==
X-Google-Smtp-Source: AGHT+IGE6sziIUBwtw4v7LUanJqapt3tDHZ4tKJnK3VNn80Jnxf/mA8zygyUFw0AX2nGsRQwM8pWLg==
X-Received: by 2002:a05:6000:2c0b:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42b4bdd4273mr7090864f8f.53.1763035573584;
        Thu, 13 Nov 2025 04:06:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85627sm3974561f8f.16.2025.11.13.04.06.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:06:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] audiofile: add ptest support
Date: Thu, 13 Nov 2025 13:06:09 +0100
Message-ID: <20251113120611.2590707-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113120611.2590707-1-skandigraun@gmail.com>
References: <20251113120611.2590707-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121646

It's under 15 seconds to execute it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc     |  1 +
 .../audiofile/audiofile_0.3.6.bb               | 18 +++++++++++++++++-
 .../audiofile/files/run-ptest                  | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 1d5932c315..96e0d87bd4 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -8,6 +8,7 @@
 # ptests which take less than ~30s each
 PTESTS_FAST_META_OE = "\
     asio \
+    audiofile \
     cli11 \
     cmocka \
     cunit \
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index fd80729bd2..f734a41dfc 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = " \
     ${GNOME_MIRROR}/audiofile/0.3/${BP}.tar.xz \
+    file://run-ptest \
     file://0001-fix-negative-shift-constants.patch \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
@@ -23,7 +24,7 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig ptest
 
 CXXFLAGS += "-std=c++14"
 
@@ -33,3 +34,18 @@ DEPENDS = " \
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
index 0000000000..cdf1677bde
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

