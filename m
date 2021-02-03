Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.3966.1612320590286246002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 18:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pSVKV8KA;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id q72so2123877pjq.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Feb 2021 18:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lbHITVDOqusr95sqKbFs/w0JtitiU6IIEIUFkPbdDkE=;
        b=pSVKV8KA3dzGd4pVKE6f/MoFozKPTkcwl3N6YXNxM2DciCKGfvnrY8DlK75T+v3uHc
         TD9VxmYWTSesghGmAMR9ha6z5Aqkk8JiQPSSrj/OXbS7ZUREJoKtFe+O7AYoWqNd32vT
         mY1WIb9ZxAuNOEtk7PjaxHFQA1FeQsfF0V5zwKZ9nqPyszZ1C0eIItsmH4de7nr/qouL
         a/6TXIlxKRCP4B0hpqp/eqlgxMDikZMPmt2WPFALu7x53XVRLld5Z1hUHrKfq7gdC9vY
         zV6wNsEYDFKq2eX35Vg1A/oZy1axh/7gklRlQib/4BMr7kXIA3S6qby1u85rGFmUwMbo
         nEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lbHITVDOqusr95sqKbFs/w0JtitiU6IIEIUFkPbdDkE=;
        b=U+QwLRIojTJBMPSqu2XEW6Id3I5jBGFJ02tPINOQuKsZvO48VXunvN+JPGZh9luqFq
         yBxihDAD9Dts7bBVPQy0aPnwNy4Yo1/Ib7/+Jw5bEPHK6mgFpVmqmpD4+lGVl7E937at
         adlGqULx/5tv787ec6SqJrMbZGZbHptXYNJnJ9oBT59tCdhY43mEORKIgX9Z1x3NDPBo
         HA+PHcg7g5cTYG5cT/erd0CSGXrLmHX7lXExD0OOQBWGPhBRhoYIGC98748JSeM2Ea1V
         RzLFkN6l412Dz4yLmBqvv4m4tkMLxxSPLdvfcTH2Ajhs5ESR6sqSfjJXePxG+SphpMok
         cxZQ==
X-Gm-Message-State: AOAM533mNUdnjgiC5y2RR6snFC76gMfREqDXdKpB1p02VIIqvm+OKNGi
	EFV+l1SJhrT5lMO+BC+IIK7patFevOKXXQ==
X-Google-Smtp-Source: ABdhPJxZchPyPQdkqypZLkJgHOEelQjkvJbv4dB8bUSV5lZmRRK5tcg0/FpSedlIMdfXhkCE5Husdw==
X-Received: by 2002:a17:90a:6393:: with SMTP id f19mr948117pjj.230.1612320589502;
        Tue, 02 Feb 2021 18:49:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id z21sm287010pgk.15.2021.02.02.18.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 18:49:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libssh2: Fix build with autoconf 2.70+
Date: Tue,  2 Feb 2021 18:49:46 -0800
Message-Id: <20210203024946.2787750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
 configure.ac:130: error: m4_undefine: undefined macro: backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ditionally-undefine-backend-m4-macro.patch | 30 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.9.0.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch

diff --git a/meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch b/meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
new file mode 100644
index 0000000000..1128c7ea0c
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
@@ -0,0 +1,30 @@
+From efe7101786193eaddb749c0583af6b54aec6f289 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2021 18:45:16 -0800
+Subject: [PATCH] configure: Conditionally undefine backend m4 macro
+
+Unlike the M4 builtin, this macro fails if macro is not defined
+therefore recover the behavior of the builtin.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fe5054a..758f8c2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -127,7 +127,7 @@ fi
+ m4_set_foreach([crypto_backends], [backend],
+   [AM_CONDITIONAL(m4_toupper(backend), test "$found_crypto" = "backend")]
+ )
+-m4_undefine([backend])
++m4_ifdef([backend], [m4_undefine([backend])])
+ 
+ 
+ # libz
+-- 
+2.30.0
+
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index 4a5a05060c..0b8ccbd217 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
+           file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
            file://run-ptest \
 "
 
-- 
2.30.0

