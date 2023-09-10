Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ABFEE57CD
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 13:18:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.35752.1694351907255015626
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 06:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JszbEo5A;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31f737b8b69so3023784f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694351905; x=1694956705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aMcFJTLSQ3KgIt5h1CsiNkpJNO98d6lat8zqh3iNQU=;
        b=JszbEo5A/w3nIrWesxdgVrjcUTnUnNs5Cr6vuBDHMrrXnPXy+V6Z4mNdBmqVcF0HjR
         aJ4lmsrRjAIuJnvI0TMbFEidkVOXYc9v9L4ryXUJl4zd7bfNtgulhOMqsFjgP1jl3NLC
         uLb3Wz+DsqcG/GOwS6v1n+vGKkvboGb/Uqvv4tV5HfLywr4ic480UvNr+/k62mSysL5+
         +2wBojlM9C3kbEs2zNMaGri4KiNP774BsM91Cn2FeWsZP2o+izndOcNjKyeo/e+tqjxD
         mE/SMRipjWEqZbWOVPAUS9vN8sJB8KYT9o+yJgyLufVeblalmQHlPrvSsWnBPk/EZDhv
         w4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694351905; x=1694956705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aMcFJTLSQ3KgIt5h1CsiNkpJNO98d6lat8zqh3iNQU=;
        b=C9djVWbp/Ro3bY011XRmzXEtQo8J1lOskvI8MdzgRT8XXkvWSMO992YDWgrkg1jALz
         sQYWOFZ78f3GuqM1Fo8DzTT0Bw/SJgcDcOvK1uhYzder5ZfvYSRrCIqNs+YK4MxTRDL9
         ucyr1gB2b1l1Kc17/xrYW9pbxy23cJ5iViQVrZhBSs9tJQ7Cd1IDT2AbYyxBce41fOAb
         Vf6ZOGL+auXvN0HKQ5FAmzKCxnF0Wkg2lnc9MF6bpCZhCgSzZCtLBIXp3RRfBbuYaAVn
         b2515pcYOFyGxqpEu/AEZKuPf0aoQFutKIYmR3BBf+2E0sgTYzfbDe1PgsZDPkEITW2A
         R9qw==
X-Gm-Message-State: AOJu0YzYjPfIU5lVOTmKANnzqnX7dAMnetUT144mP0vF13hiIILuKOoz
	kohWbhzlQoK/ODlnbcybKcrLsNlhwis=
X-Google-Smtp-Source: AGHT+IHNEP2I0eP6pAVjChhLRTGjUHtoDHkzbq1p5ZQl3W6nqnvdNd02heeU8Hbp9qgeVTls1lmOyg==
X-Received: by 2002:a05:6000:186b:b0:31f:91ae:4509 with SMTP id d11-20020a056000186b00b0031f91ae4509mr3501083wri.40.1694351904901;
        Sun, 10 Sep 2023 06:18:24 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d62d0000000b0031980294e9fsm7308782wrv.116.2023.09.10.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 06:18:24 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 3/4] mosh: add support of protobuf 4.22.x
Date: Sun, 10 Sep 2023 15:18:17 +0200
Message-Id: <20230910131818.1538524-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230910131818.1538524-1-peron.clem@gmail.com>
References: <20230910131818.1538524-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 13:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104825

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


