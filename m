Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BB9C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 17:57:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.46957.1745344674427217517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 10:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J0F89MCm;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ede096d73so40626215e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344673; x=1745949473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXKAqkqnSHTX73OC5Uo1hceRrxC8w7OQiev8FNWPFwc=;
        b=J0F89MCmAhesziv0woQA31vdadddxNwjwVpR81bRHLfsSuDshRo54QJmeJMHwCXm3n
         gTTH35luVw0VCYCpujMsltLoIiYBohFhFcWBkGtaZcp+E+FLHkvaa1DTSbDSJaTz6oVT
         cQBK97qA/R3b76Kxm3lwLhKhYcJZ/i6R80ziLvFZYY04fQ+rq+xO5G1cJZCULoChMpsI
         e/15DdMV/371dU3WsUpsgqrUf0Ch9Oey6M/MimX70KSXaV76vN+VLESBbP3g+znxFZmJ
         Eb3Cp7VGeKp0Mfw2DlyuvC6wfbegfhSneuXwSDoLjXE+il1hFSRHDCVv7hdWqFY0my0M
         a8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344673; x=1745949473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXKAqkqnSHTX73OC5Uo1hceRrxC8w7OQiev8FNWPFwc=;
        b=ENn4fl8wUPH0khpIsLW8itMSJLkIkc7eM5OxAm4cZruyl8jJx0LSgavNqzHAbU+m7M
         5aKJJ7xUvZtJDdSMENeLRHtxMz00m48LMhCXydIAb7DFEEyLwXBflrDX9c6epWxcWx3H
         43mRGNx9GI0ebyi1WWa59Qh0miJAVdcZh/+pOFqWZrSqy/Hlq3lqMtULD3Z5DnGAG1Sr
         ReuBNpXB1KSs97Ye1HSJxY9fdeaczD4eqEQFGU1s1iYTu+gWHDBgRL/pYPLPz0DgD/UF
         Gsdj6OSrY4KfDvNepqJdz8QrToKLAM0iuU2lcnHi5cKFRxdVOaLGWJc1FOFzVC8zWitM
         lBwQ==
X-Gm-Message-State: AOJu0YxTamPmgqXhSPioqG4P9MKKM/IPcMM7WnTziP1rJdNAYnZKPB+L
	f66k4MOeUN6VNtL6SFW6ylPaUP7E6eC1au577rDACxcikN9Djl7dblL9h0JD
X-Gm-Gg: ASbGncvQFpR0Q0088v2yVRKaxpe6b68rdtlwGTWmvDEMSlqWEFziNVEEcj6O/ppPuDE
	q25ZIwpV5Zg6liQLZurRyzKqQIhGyTl7I1xog1uJ4829Mk23/Te6EEFWMeV3iw7AvsoRTYngxKH
	RejOiyK7ZOj9GixxvJCKJgJVivMaRltVXoS7Ox5ynRUcvxoF7X3gcbyzs79OQxBK0gxV8Lox3oR
	oG7iJVodA/Ce51AdwRiqs2pSAj+0LgeDuNAzO7lKZkSiTwItArBN9Q4cSo/gRKUJJ58gXh3gzf6
	KNWz25hCnDTobwTHDUFoG8Q/gYGlIJCvd261o7QLAwYfQOniHN5bjpJ7shAICbHMDl1DTYu5zg=
	=
X-Google-Smtp-Source: AGHT+IEJwE7XeSP7gIX+Nwf7BfhXyoN+Hv/96PDDPe/tEjJeZRABidm4arX2gzZzWDwfZKeS70Pa7Q==
X-Received: by 2002:a05:600c:54c2:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4406b928b57mr118223175e9.4.1745344672604;
        Tue, 22 Apr 2025 10:57:52 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5a9dbesm183081515e9.7.2025.04.22.10.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:57:52 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] psqlodbc: fix build with gcc-15
Date: Tue, 22 Apr 2025 19:57:42 +0200
Message-ID: <20250422175742.786560-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422175742.786560-1-martin.jansa@gmail.com>
References: <20250422175742.786560-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117066

From: Martin Jansa <martin.jansa@gmail.com>

configure: make sure to call AC_CHECK_HEADER_STDBOOL before using ac_cv_sizeof_bool

It was called after this conditional, so PG_USE_STDBOOL wasn't set
even when it should be as shown in at the end of config.log:

  ac_cv_header_stdbool_h=yes
  ac_cv_sizeof_bool=1
  ac_cv_type__Bool=yes
  #define SIZEOF_BOOL 1
  #define HAVE__BOOL 1
  #define HAVE_STDBOOL_H 1

* fixes:
  https://github.com/postgresql-interfaces/psqlodbc/issues/110
  https://github.com/postgresql-interfaces/psqlodbc/issues/94

http://errors.yoctoproject.org/Errors/Details/852841/

In file included from ../psqlodbc-16.00.0000/environ.h:16,
                 from ../psqlodbc-16.00.0000/environ.c:16:
../psqlodbc-16.00.0000/psqlodbc.h:264:23: error: 'bool' cannot be defined via 'typedef'
  264 | typedef unsigned char bool;
      |                       ^~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...sure-to-call-AC_CHECK_HEADER_STDBOOL.patch | 45 +++++++++++++++++++
 .../psqlodbc/psqlodbc_16.00.0000.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch b/meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch
new file mode 100644
index 0000000000..9cc5ad9b86
--- /dev/null
+++ b/meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch
@@ -0,0 +1,45 @@
+From 5bfa9f1cd0523a0cad70cacf5ecf8c1aeb06c4d0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 22 Apr 2025 17:47:02 +0000
+Subject: [PATCH] configure: make sure to call AC_CHECK_HEADER_STDBOOL
+
+before using ac_cv_sizeof_bool
+
+It was called after this conditional, so PG_USE_STDBOOL wasn't set
+even when it should be as shown in at the end of config.log:
+
+  ac_cv_header_stdbool_h=yes
+  ac_cv_sizeof_bool=1
+  ac_cv_type__Bool=yes
+  #define SIZEOF_BOOL 1
+  #define HAVE__BOOL 1
+  #define HAVE_STDBOOL_H 1
+
+* fixes:
+  https://github.com/postgresql-interfaces/psqlodbc/issues/110
+  https://github.com/postgresql-interfaces/psqlodbc/issues/94
+
+Upstream-Status: Submitted [https://github.com/postgresql-interfaces/psqlodbc/pull/112]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f35c825..ea363ca 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,9 +28,11 @@ AC_CHECK_SIZEOF([bool], [],
+ #include <stdbool.h>
+ #endif])
+ 
++AC_CHECK_HEADER_STDBOOL()
++
+ dnl We use <stdbool.h> if we have it and it declares type bool as having
+ dnl size 1.  Otherwise, c.h will fall back to declaring bool as unsigned char.
+-if test "$ac_cv_header_stdbool_h" = yes -a "$ac_cv_sizeof_bool" = 1; then
++if test "$ac_cv_header_stdbool_h" = yes && test "$ac_cv_sizeof_bool" = 1; then
+   AC_DEFINE([PG_USE_STDBOOL], 1,
+             [Define to 1 to use <stdbool.h> to define type bool.])
+ fi
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
index d3b3ea5109..dfd7f6a1e6 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
     file://psqlodbc-fix-for-ptest-support.patch \
+    file://0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch \
     file://run-ptest \
 "
 

