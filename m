Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B5BCDE019
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 07:43:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12994.1763106224194852887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 23:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CbjrKOc1;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47728f914a4so10412435e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 23:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763106222; x=1763711022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7MM8qxWFRQiKXm1Te2n7mTCj99r6iAG6PZW9JKr0GE=;
        b=CbjrKOc1gYvWIDfvtF/8fvrNzA3KgK3OqF1aBAIdWcsj41SaFrjHxVnOYE+1pnCEGX
         /UBzlK2MZgJCAt6sNByr96wwsYtUpn6sSnu4dJDRHI/QDFDQzljD360CIS4y2jBtZAfM
         Cnz04lc3WcL9HO4HUpJTuGPVjaqyEadyPtlRzq48ivXG1TpQwEkhblyX6fQ5HE8UTnlR
         D9fERV5W8Di4JNG8l4t1KKs9Xs2zLTD2+lW1y/wnPtKGUdUFoq2svlr9Zzpw+O6aNSFZ
         W6gSECWCE1E+vgmdO3L5vdhX5hIlwU9S0Ww59w/3lw0jgCGbZeRdZmmM6cbGR8CPY26a
         eQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763106222; x=1763711022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u7MM8qxWFRQiKXm1Te2n7mTCj99r6iAG6PZW9JKr0GE=;
        b=UxZv6nHBZW28fyzEET6ECWLPslG7xMqmBkG5uX4rJAXjosD17xkJi/Ps+1dkj8ebB4
         52BmIn/uHLXqPo27tZBJaEnCj4wdXRmLAH4CONGzAo1MZEk+hpv+wHc2f/kO+6JyfwU3
         bPSDmz/UQRtMWfoZO7THET8BTXH6IMSZtSOB7Ie01ZohnCTm/RJQ+0S9zjtvRzLLIfe8
         mH+tiNAP67AujoOzhuPxLzq5v0LFVdyRC0QSGNpenAYN0pUnOTiEm0iiKDuPGvZA2MjF
         WjWsaTLAlosggRMTnQX0ijjtw1eBQgb7zYJMsdekeEqqXKiQ1pnqJ7FJDZZwZ7D0kC1y
         4cPg==
X-Gm-Message-State: AOJu0Yx1PoZpZX7UCERZV9Wl9MxCVaAyqm7QrSN+EE3Xweo6YQnF5Ykx
	pETMX7MHo4pCTt6Nn94wQF5eDSFMiHNX7EIctcyxVNx3e8f8ky3mV/aoR7D5Ywjr
X-Gm-Gg: ASbGncu4b15uByzhX6qbHzg5tOgzRH6BS1PK3VJ4LReNCX5IFa/RLqXAA52l3GKMn3L
	eeiQ8xH2oS8fO6fMPOiZaH7UMPSAoZrrBQwZJTNSmuN1T+iNFcO3HxhTm5lAOoEGcC0iIiRGXii
	nxAtOiWHFRC0NmBMtY8MAWO2orlT4SkdpEks0qkx3EXv7oQotKxexMtPDUE7OSnAr6zlDgkHk1u
	CbEfqCV7vjhTTwE0lSEYl6BVsByLMKZMgES2HOLEQVLWcjCUI0XTaqXVJNme1ZCON1P86LqD+kz
	B3A11FAx1WObUFjJYCiC5E2P+8VPmBDhsCIQe+l6j1mq0D4cLnAchhaZMpR1MGaECjxjHCrV/Zx
	X8cKitAhBox2YN4d5o/DC02zggoz5nVhEgjVWXk6+HGvj2/awqOtUPZ0DCuNKeU9q0eS7BDLRbJ
	gnMLKin4hI
X-Google-Smtp-Source: AGHT+IFSNQTK4xlyaTXZCbqBHUhudnEjPe7CTAsB7vkOjF/vc5EDtB1HScMbuYGSNy2uwjBcRBFeqw==
X-Received: by 2002:a05:600c:4f4e:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-4778fe95399mr20144425e9.23.1763106222123;
        Thu, 13 Nov 2025 23:43:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b622sm8090954f8f.29.2025.11.13.23.43.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:43:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/4] audiofile: add ptest support
Date: Fri, 14 Nov 2025 08:43:38 +0100
Message-ID: <20251114074340.2716135-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114074340.2716135-1-skandigraun@gmail.com>
References: <20251114074340.2716135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121686

It's under 15 seconds to execute it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: remove trailing whitespace from run-ptest script

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

