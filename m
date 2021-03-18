Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.5844.1616052426856186304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 00:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s5K9NNNz;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id w11so842508ply.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K0NHEq43bn3sR/s7Gl8ep8svID4/IXsTAil+LMLf880=;
        b=s5K9NNNzJ2brTSRPF1w0culvUCZFUhU3z+C9A3QYaLyFKbXqWRXAAaz6PFVB8bMYnO
         myoBK+o/sGW66y+L1vHR6w0QI8Z0Sw3ZFZIUJlskAnjyZyS7Y853lK8rDrYY3GLG5YZH
         mO45gAK+pqcLX9dGLsYfXWExuhi/gA4Zs0i+xjwaVrp6b1FmlQBBKGdw6tgVzKhqCJ8i
         aAfvVfhfNlCskhutsvrjLvJwh+KuqmpQEQo2c03y8/bdjTVVK2uzeVEG7d2OTOi78YjU
         tE0b+3zuv1Jg1M0ijW+iXiNyEBTQll5UJJG+yRGsN+ve8Me5nHwcMemJSguh33yfB11U
         Oi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K0NHEq43bn3sR/s7Gl8ep8svID4/IXsTAil+LMLf880=;
        b=CYVUXHAn07X5Lv5+6K6pkqGjon1ReKVbjpIR2lu7GsNxhsdiVheLekw+Hgp4DsSQ6m
         DLQ0S4c/kuNG6XO5JrkUT1sBA7+Q7z8+sTIb0s1bbcQxCIHpy8dBO/berRsexNKx0zX5
         TjdefEUZm7xjA8s4bP5IVd6vKMdMZrBOiW4WGygDEeHR6MHQqQuWmnuSn9iO4SJqZkov
         atHJcGGXHMOJmQymesH3Eg08XIUGivfGAkFIGcd2XUWZw9aXQ0F+3fOZyRtHXwSLq3Dj
         cxTpwnbcxoZCByBWY2eQGgKqndOy6X8rqcD1C/nJbwDY7Ec1oPkT7Tx5l0NKjacXyBXU
         GDiA==
X-Gm-Message-State: AOAM531eu9Gyiv/Q8RlkP461RhQQ1LpSdFL9WYdXpovUpDCHZ8xzWHYI
	+LgrQBhFtwJue71fQO8FWsVrFqhv5RGKhw==
X-Google-Smtp-Source: ABdhPJwh6+Z+s7t+uzFDhLeVZRYVuE1bU08KctVeHyROxnp47WVrUUd8ltOrcI4+ofeq10Zhf8F/+A==
X-Received: by 2002:a17:90a:f403:: with SMTP id ch3mr2908833pjb.126.1616052425753;
        Thu, 18 Mar 2021 00:27:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id e21sm1090383pgv.74.2021.03.18.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 00:27:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] oprofile: Remove Deprecated Exception Specifications from C++17
Date: Thu, 18 Mar 2021 00:27:03 -0700
Message-Id: <20210318072703.1372800-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc  |  1 +
 ...d-Exception-Specifications-from-C-17.patch | 41 +++++++++++++++++++
 .../recipes-kernel/oprofile/oprofile_1.3.0.bb |  2 +-
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Remove-Deprecated-Exception-Specifications-from-C-17.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index 0863a8fd36..f1eec0b292 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-replace-sym_iterator-0-with-sym_iterator.patch \
            file://0001-Use-new-bfd-APIs-from-2.34.patch \
            file://include_limits.patch \
+           file://0001-Remove-Deprecated-Exception-Specifications-from-C-17.patch \
 "
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Remove-Deprecated-Exception-Specifications-from-C-17.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Remove-Deprecated-Exception-Specifications-from-C-17.patch
new file mode 100644
index 0000000000..a5e6c49851
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Remove-Deprecated-Exception-Specifications-from-C-17.patch
@@ -0,0 +1,41 @@
+From 3a37e25a100170cd806ba14d13ec782864b7cacf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 Mar 2021 00:24:02 -0700
+Subject: [PATCH] Remove Deprecated Exception Specifications from C++17
+
+../../../oprofile-1.3.0/libutil++/tests/utility_tests.cpp:24:33: error: ISO C++17 does not allow dynamic exception specifications
+   24 | void* operator new(size_t size) throw(bad_alloc)
+      |                                 ^~~~~
+../../../oprofile-1.3.0/libutil++/tests/utility_tests.cpp:30:35: error: ISO C++17 does not allow dynamic exception specifications
+   30 | void* operator new[](size_t size) throw(bad_alloc)
+      |                                   ^~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libutil++/tests/utility_tests.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libutil++/tests/utility_tests.cpp b/libutil++/tests/utility_tests.cpp
+index 3955fd0..2f8286f 100644
+--- a/libutil++/tests/utility_tests.cpp
++++ b/libutil++/tests/utility_tests.cpp
+@@ -21,13 +21,13 @@ using namespace std;
+ static int nb_new;
+ static int nb_new_array;
+ 
+-void* operator new(size_t size) throw(bad_alloc)
++void* operator new(size_t size)
+ {
+ 	nb_new++;
+ 	return malloc(size);
+ }
+ 
+-void* operator new[](size_t size) throw(bad_alloc)
++void* operator new[](size_t size)
+ {
+ 	nb_new_array++;
+ 	return malloc(size);
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 8242a835f4..41b754f1fd 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -10,4 +10,4 @@ SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
 SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
 
 S = "${WORKDIR}/oprofile-${PV}"
-
+TOOLCHAIN = "gcc"
-- 
2.31.0

