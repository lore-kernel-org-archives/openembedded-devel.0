Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E43AEEB586
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 09:35:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.13864.1694252126612645070
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 02:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hysqSyuk;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso29403905e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694252124; x=1694856924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aMcFJTLSQ3KgIt5h1CsiNkpJNO98d6lat8zqh3iNQU=;
        b=hysqSyuki+4qcTdNnvSFLY/LZwK0cL67h+lUq/afRmZMNsxNBIOPxrTqXWhzSMc1CD
         HqKou2Oc4LjIk8Zqrn8e29aWI4OzwPZe7OfpnW/pw6BreMJSYIp22otJocUZWIGSjrtf
         Q4ue1W5+6KAoQhZADstyo8RC8VNmSv1JNihMMC7jRsR2AeNfHR/nyhTiQnB9oLg6E96u
         F2xcb2hbdFMtJP68wmfX+ZHGBd1HNg9KbHga3rjdKCLGTUksg7ldDe9oTKNNk3EMCqCA
         1ifvuhTv9ev7noXP6jO81jIc5OA28maSiOd76OBjMMP5bTv1cCpIWED7qleXX4kPb54/
         o2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694252124; x=1694856924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aMcFJTLSQ3KgIt5h1CsiNkpJNO98d6lat8zqh3iNQU=;
        b=gL4i79p1XWv07MGWHl/Vn/Enj8g0wZQ+CZx9XzyS3Qj4aVnsm4Sxw0OBtee9V6F8T2
         +kwqGX9chwxApEJwHc3cC6ovZnGVbiicD52q8r/RFX9ro5/F3Sj8UICEQS7YMsxVkIS/
         uFAclI6ORnrkqw+6EYPnOL/9UM1NDuOMmj7W+wSc0mEgar1k8Gx725mx25Xo7A4KT46o
         uDSko1r7XLUaM0MwqaOON8xq4t5IVoUWB2TbId/2CODqY3HLn94JtxRIatRPwztawawx
         utpCup/HsFQoq1OgWvqW3fVfCTWifv6C05tyTmd7bSjQ8UASRDeOMIlmn8IwoJZdp4UM
         UcNQ==
X-Gm-Message-State: AOJu0YyCKs9bUZvgI85xklYGB7dWvyaHOLFHFOISpuAt90KfdHwXJLhS
	2GLvJsYtX384/VGC9c9dvg1DOaBv0BI=
X-Google-Smtp-Source: AGHT+IFmZsrRe/81FCB2KqFEHJnMMldN3diLwfkPjAMO7CfBt90GZTszlJ9+DlXBZvt17y39uN3xZQ==
X-Received: by 2002:a05:600c:354e:b0:402:f503:6d1b with SMTP id i14-20020a05600c354e00b00402f5036d1bmr4218644wmq.0.1694252124249;
        Sat, 09 Sep 2023 02:35:24 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b003fefe70ec9csm7302565wmm.10.2023.09.09.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 02:35:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 3/4] mosh: add support of protobuf 4.22.x
Date: Sat,  9 Sep 2023 11:35:16 +0200
Message-Id: <20230909093517.444924-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909093517.444924-1-peron.clem@gmail.com>
References: <20230909093517.444924-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 09:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104812

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...re.ac-add-support-of-protobuf-4.22.x.patch | 63 +++++++++++++++++++
 .../recipes-connectivity/mosh/mosh_1.4.0.bb   |  7 ++-
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
new file mode 100644
index 000000000..088124391
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
@@ -0,0 +1,63 @@
+From d9a1a6aac5a3b270449d09ec0d2a556807ab9287 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 29 Mar 2023 13:53:44 +0800
+Subject: [PATCH] configure.ac: add support of protobuf 4.22.x
+
+the protobuf 4.22x is using c++14 as default, this caused the mosh cannot compile anymore and report following error:
+
+....
+/usr/include/google/protobuf/port_def.inc:200:15: error: static assertion failed: Protobuf only supports C++14 and newer.
+| 200 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201402L), "Protobuf only supports C++14 and newer.");
+| | ^~~~~~~~~~~~~~~~~~~~~~
+....
+
+Upstream-Status: Pending [https://github.com/mobile-shell/mosh/pull/1266]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ configure.ac             | 8 ++++++++
+ src/frontend/Makefile.am | 2 +-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ee70c7b..5457009 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,6 +26,10 @@ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ AS_IF([pkg-config --atleast-version 3.6.0 protobuf],
+   [AX_CXX_COMPILE_STDCXX([11])])
+ 
++# If current protobuf 4.22+ update the requires to C++14.
++AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
++  [AX_CXX_COMPILE_STDCXX([14])])
++
+ WARNING_CXXFLAGS=""
+ PICKY_CXXFLAGS=""
+ DISTCHECK_CXXFLAGS=""
+@@ -311,6 +315,10 @@ AC_CHECK_FUNCS(m4_normalize([
+   pledge
+   ]))
+ 
++AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
++  [PKG_CHECK_MODULES([ABSL_LOG_INTERNAL_CHECK_OP], [absl_log_internal_check_op],[],
++     [AC_MSG_ERROR([Missing abseil-cpp library.])])])
++
+ # Start by trying to find the needed tinfo parts by pkg-config
+ PKG_CHECK_MODULES([TINFO], [tinfo],
+   [AC_DEFINE([HAVE_CURSES_H], [1], [Define to 1 if <curses.h> is present])],
+diff --git a/src/frontend/Makefile.am b/src/frontend/Makefile.am
+index 1aa83fd..399ecd6 100644
+--- a/src/frontend/Makefile.am
++++ b/src/frontend/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CPPFLAGS = -I$(srcdir)/../statesync -I$(srcdir)/../terminal -I$(srcdir)/../network -I$(srcdir)/../crypto -I../protobufs -I$(srcdir)/../util $(TINFO_CFLAGS) $(protobuf_CFLAGS) $(CRYPTO_CFLAGS)
+ AM_CXXFLAGS = $(WARNING_CXXFLAGS) $(PICKY_CXXFLAGS) $(HARDEN_CFLAGS) $(MISC_CXXFLAGS) $(CODE_COVERAGE_CXXFLAGS)
+ AM_LDFLAGS  = $(HARDEN_LDFLAGS) $(CODE_COVERAGE_LIBS)
+-LDADD = ../crypto/libmoshcrypto.a ../network/libmoshnetwork.a ../statesync/libmoshstatesync.a ../terminal/libmoshterminal.a ../util/libmoshutil.a ../protobufs/libmoshprotos.a -lm $(TINFO_LIBS) $(protobuf_LIBS) $(CRYPTO_LIBS)
++LDADD = ../crypto/libmoshcrypto.a ../network/libmoshnetwork.a ../statesync/libmoshstatesync.a ../terminal/libmoshterminal.a ../util/libmoshutil.a ../protobufs/libmoshprotos.a -lm $(TINFO_LIBS) $(protobuf_LIBS) $(CRYPTO_LIBS) $(ABSL_LOG_INTERNAL_CHECK_OP_LIBS)
+ 
+ mosh_server_LDADD = $(LDADD)
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index 2869e0633..0ee050da9 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -12,9 +12,12 @@ HOMEPAGE = "http://mosh.mit.edu"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
+DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter abseil-cpp"
+
+SRC_URI = "https://mosh.org/${BP}.tar.gz \
+           file://0001-configure.ac-add-support-of-protobuf-4.22.x.patch \
+           "
 
-SRC_URI = "https://mosh.org/${BP}.tar.gz"
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
 inherit autotools pkgconfig
-- 
2.34.1


