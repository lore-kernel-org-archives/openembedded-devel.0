Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB13CDE02A
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:24:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13529.1763108693579322012
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjgqQ7R5;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso1352044f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763108692; x=1763713492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tVPtj+ZJiOx2gPhoAYFaXwWaOAyhqutzo/vztUKtxI=;
        b=HjgqQ7R5Y+pJBj7qyBq9U/PEBhuJsS+KeAZDe5Cwx3x0Cktbic4rXpTSZHeZE/COHd
         BBr6mpb+vSDrmDcW6QmyBMzkeioVwvzUsuDkNd2rplnzhxGJ3A7Op3Z0IB/uSqnMRaRh
         vj8kLK/X9AvdmeS0c2IYpmH/i3cXtk8JLc4cBRLwkwvz5uEB105uStWBtVT0XagSWIwO
         L9+OwL0yiMM4d/pQfzJjsX9Qc0J471RyF70QjUWrjqx7EsKpeL+DgHBBIReCt6GKoWMM
         wEOqYW0C8T3Rd4+lyKf+9c3Hf+CEXDMc3hvLMZakqD5a9RzqaELOnsasc3wNJJxDFeF1
         qtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108692; x=1763713492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1tVPtj+ZJiOx2gPhoAYFaXwWaOAyhqutzo/vztUKtxI=;
        b=NyqRdrTglCv2eE1aIGVg8TjZdMzqKdZQTWO+5+EBvsI+DkJskqJQa7MCzy3imsSlwz
         MUGWR1yaAcFCOVlv5G5fwNDnWWyA9eLLcliZyxwRo2yuIBFucKMATCjmlQgNuIbaKQA7
         CQV5PEaVaRiAhNnyord8u/YPUJlcTFEBy+KKCV9PeSfx1UHhaxZ/lGfZVGdC/qeKDIGo
         ZN+dQFAfgT1ZO1SVjBue/B6z5qvLQMmpfhjz0V3bRQkWqjfEQRScP5//2q30p+DI3JUJ
         +dFlJ0lHUvkZGVhV23Bab35PA4cQIw7mZJE0Y7laY45qvYOagJ1udYZG+Q0m6BZU83vM
         X9Zw==
X-Gm-Message-State: AOJu0Yx9kyhJtTcV0xkKqeRKor7rS1ReGxZqwHV0XZOchwfarommvKlN
	jknUo3skze3lbs70GnHlxxilLkz005xmhWazhRiDVv8EYN+2xTFeZMEUXe10Dvmo
X-Gm-Gg: ASbGncshHx+SE0tCx1oGstmVapUNharlbnEH7AWllcGYZjgFsMsPg96dOXegOhPG1Na
	YWUjdV2hI7eCLRbuxDSU3cmBUSuBCv+UkKwnxU1ktJR9b8CrG4FDEXYNxJ2acOxxTxXITtAXcW5
	myFtTCGOB+uObiJoT0NrF2S8BlncMH1TyNx6rjjSUp751EyjEdYY1ia5VOXv47X2Af3UDAIfieM
	YM6WnwVythSUGQfuiUtaC1xwFAZbFvLQzHbhqtTatBes8Z0dQ2PhqG3KNxky+7AAJGgNe0Pihwn
	+iKK2pxXnEM5SoYpHanit6lHlg3YiAwRKRjSDVtIZZe09KKID0huBvan9VNJwlR22ulWKWsoGPw
	M4jFkkspYNaLRU7y9Uz+euIOWzTf3ZHWdZzFefQETDdLnjgWIawUut8UxZD6PxleZAigVjmfvqw
	==
X-Google-Smtp-Source: AGHT+IEzoRiBNcQVy7b3xXj3j4bI/F1A3jxGhVf1IO6Xml5+nEx9W/ANHgJ9bGjaKdB1YcQz6++XVw==
X-Received: by 2002:a05:600c:4752:b0:46f:b42e:ed87 with SMTP id 5b1f17b1804b1-4778feabe57mr15799165e9.40.1763108691794;
        Fri, 14 Nov 2025 00:24:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm53838325e9.5.2025.11.14.00.24.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:24:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 2/5] audiofile: add ptest support
Date: Fri, 14 Nov 2025 09:24:47 +0100
Message-ID: <20251114082450.2720967-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114082450.2720967-1-skandigraun@gmail.com>
References: <20251114082450.2720967-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121695

It's under 15 seconds to execute it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: removed trailing whitespace from run-ptest script
v3: no change

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

